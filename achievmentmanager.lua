require("lib/managers/hud/HudChallengeNotification")
if not AchievmentManager.MAX_TRACKED then
	AchievmentManager.IngameAchievments = true
	AchievmentManager.MAX_TRACKED = 4

	Hooks:PostHook(AchievmentManager, "init", "IngameAchievments.AchievmentManager.init.PostHook", function(self)
		self._forced = Global.achievment_manager.forced or {}
		Global.achievment_manager.forced = self._forced
		self._recent_data = Global.achievment_manager.recent_time or {time = os.time() - 1}
		Global.achievment_manager.recent_time = self._recent_data
		self._with_progress = {}
		self._recent_progress = {}

		for id, data in pairs(self.achievments) do
			local v = tweak_data.achievement.visual[id]
			if v and v.progress then
				self._with_progress[id] = {
					info = data,
					visual = v,
					id = id
				}
			end
		end

		self.oldest_achievement_callback_handler = CoreEvent.CallbackEventHandler:new()
	end)

	function AchievmentManager:get_force_tracked()
		return self._forced
	end

	function AchievmentManager:get_friends_with_achievement(id, callback)
		return self.handler.friends_with_achievement and self.handler:friends_with_achievement(id, callback)
	end

	function AchievmentManager:get_global_achieved_percent(id)
		return self.handler.achievement_achieved_percent and self.handler:achievement_achieved_percent(id) or 0
	end

	function AchievmentManager:get_recent_achievements(params)
		params = params or {}
		local recent = params.from or self._recent_data.time
		local rtn = {}

		for _, v in pairs(self.achievments) do
			if v.unlock_time and recent <= v.unlock_time then
				table.insert(rtn, v)
			end
		end

		if (params.keep_recent_time or params.from) and not params.set_time then
			return rtn
		end

		self._recent_data.time = params.set_time or os.time()

		return rtn
	end
end

local function award_achievement(self, id)
	if not self:achievement_progress(id) then
		self:save_progress(id, os.time())
		self.achievments[id].unlock_time = os.time()
	end

	if not self.achievments[id].awarded or table.contains(self._forced, id) then
		self:track(id, false)
		local head = managers.localization:to_upper_text("hud_achieved_popup")
		local text = managers.localization:to_upper_text("achievement_" .. id) .. "\n" .. managers.localization:text("achievement_".. id .. "_desc")
		local icon = tweak_data.achievement.visual and tweak_data.achievement.visual[id] and tweak_data.achievement.visual[id].icon_id
		HudChallengeNotification.queue(head, text, icon)
	end
end

local function check_progress(award)
	local not_found = true

	for id, stat in pairs(tweak_data.achievement.persistent_stat_unlocks) do
		if award == stat[1].award then
			return (self:achievement_progress(id) or 0) >= stat[1].at 
		end
	end

	return not_found
end

Hooks:PostHook(AchievmentManager, "award", "IngameAchievments.AchievmentManager.award.PostHook", function(self, id)
	if check_progress(id) then
		award_achievement(self, id)
	end
end)

Hooks:PreHook(AchievmentManager, "award_progress", "IngameAchievments.AchievmentManager.award_progress", function(self, stat, value)
	local persistent_stat_unlocks = tweak_data.achievement.persistent_stat_unlocks
	local max_stat = persistent_stat_unlocks[stat] and persistent_stat_unlocks[stat][1].at or 100
	if persistent_stat_unlocks[stat] then
		local award = persistent_stat_unlocks[stat][1].award
		if not self:achievement_progress(award) or table.contains(self._forced, award) then
			self:save_progress(stat, (self:achievement_progress(stat) or 0) + (value or 1))
			if HudChallengeNotification and max_stat ~= self:achievement_progress(stat) then
				local title = managers.localization:text("ingame_achievements_progress") .. managers.localization:to_upper_text("achievement_" .. award)
				local text = managers.localization:text("achievement_".. award .. "_desc"):gsub(max_stat, tostring(max_stat - self:achievement_progress(stat)))
				HudChallengeNotification.queue(title, text, "")
			end
		end

		if self:achievement_progress(stat) and self:achievement_progress(stat) >= max_stat then
			self:save_progress(stat)
			award_achievement(self, award)
		end
	
		if managers.hud then
			managers.hud:loot_value_updated()
		end
	end
end)

function AchievmentManager:force_track(id, state)
	local data = self:get_info(id)

	if not data then
		Application:error("Failed to find achievement '" .. id .. "' to track!")

		return false
	end

	if state then
		if self.MAX_TRACKED <= #self._forced then
			return data.forced
		end

		if not table.contains(self._forced, id) then
			table.insert(self._forced, id)
			self.achievments[id].awarded = false
			self.achievments[id].showed_awarded = false
		end

		data.forced = true
		data.tracked = true
	else
		table.delete(self._forced, id)
		if self:achievement_progress() and self:achievement_progress(id) then
			self.achievments[id].awarded = true
			self.achievments[id].showed_awarded = true
		end

		data.forced = false
	end

	return data.forced
end

function AchievmentManager:track(id, state)
	local data = self:get_info(id)

	if not data then
		Application:error("Failed to find achievement '" .. id .. "' to track!")

		return false
	end

	if state then
		data.tracked = true
	else
		data.tracked = false

		self:force_track(id, false)
	end

	return data.tracked
end

function AchievmentManager:get_tracked_fill()
	return self._forced
end

function AchievmentManager:achievement_progress(id)
	if id then
		return Global.blackmarket_manager.IngameAchievments and Global.blackmarket_manager.IngameAchievments[id]
	else
		return Global.blackmarket_manager.IngameAchievments or {}
	end
end

function AchievmentManager:save_progress(id, value)
	Global.blackmarket_manager.IngameAchievments = Global.blackmarket_manager.IngameAchievments or {}
	Global.blackmarket_manager.IngameAchievments[id] = value
end

function AchievmentManager.fetch_achievments(progress)
	local oldest_achievement_date = nil
	local unlock_time = nil
	for id, ach in pairs(managers.achievment.achievments) do
		if progress and progress[ach.id] then
			ach.awarded = true

			unlock_time = progress[ach.id] and tonumber(progress[ach.id]) or -1

			if unlock_time >= 0 then
				oldest_achievement_date = math.min(oldest_achievement_date or unlock_time, unlock_time)
			end

			managers.achievment:track(id, false)

			ach.unlock_time = unlock_time
		end
	end

	managers.network.account:achievements_fetched()
	managers.achievment.oldest_achievement_date = oldest_achievement_date or -1
end