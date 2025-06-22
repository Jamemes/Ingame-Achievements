local function award_achievement(id)
	if not IngameAchievements.awards[id] or IngameAchievements:tracked(id) then
		local head = managers.localization:to_upper_text("hud_achieved_popup")
		local text = managers.localization:to_upper_text("achievement_" .. id) .. "\n" .. managers.localization:text("achievement_".. id .. "_desc")
		local icon = tweak_data.achievement.visual and tweak_data.achievement.visual[id] and tweak_data.achievement.visual[id].icon_id or "generic_achievement_icon"
		
		if HudChallengeNotification then
			if icon and tweak_data.achievement.IngameAchievements_icons then
				tweak_data.hud_icons.generic_achievement_icon = {
					texture = tweak_data.achievement.IngameAchievements_icons[id][1],
					texture_rect = tweak_data.achievement.IngameAchievements_icons[id][2]
				}
			end
			
			HudChallengeNotification.queue(head, text, icon)
		end
		
		if IngameAchievements:tracked(id) then
			table.delete(IngameAchievements.awards.tracker, id)
			if #IngameAchievements.awards.tracker == 0 then
				IngameAchievements.awards.tracker = nil
			end
		end

		IngameAchievements.awards.time = IngameAchievements.awards.time or {}
		IngameAchievements.awards.time[id] = os.date("%d %b %Y %H:%M")
		IngameAchievements.awards[id] = true
		IngameAchievements:Save()

		if managers.hud then
			managers.hud:loot_value_updated()
		end
	end
end

Hooks:PreHook(AchievmentManager, "award_progress", "IngameAchievments.AchievmentManager.award_progress", function(self, stat, value)
	local persistent_stat_unlocks = tweak_data.achievement.persistent_stat_unlocks or tweak_data.persistent_stat_unlocks
	local max_stat = persistent_stat_unlocks[stat] and persistent_stat_unlocks[stat][1].at or 100

	if persistent_stat_unlocks[stat] then
		if not IngameAchievements.awards[persistent_stat_unlocks[stat][1].award] then
			IngameAchievements.awards.stats = IngameAchievements.awards.stats or {}
			IngameAchievements.awards.stats[stat] = (IngameAchievements.awards.stats[stat] or 0) + (value or 1)
			
			if HudChallengeNotification then
				local title = managers.localization:text("ingame_achievements_progress") .. managers.localization:to_upper_text("achievement_" .. persistent_stat_unlocks[stat][1].award)
				local text = managers.localization:text("achievement_".. persistent_stat_unlocks[stat][1].award .. "_desc"):gsub(max_stat, tostring(max_stat - IngameAchievements.awards.stats[stat]))
				HudChallengeNotification.queue(title, text, "")
			end
			
			IngameAchievements:Save()
		end

		if IngameAchievements.awards.stats and IngameAchievements.awards.stats[stat] and IngameAchievements.awards.stats[stat] >= max_stat then
			IngameAchievements.awards.stats[stat] = nil
			if table.size(IngameAchievements.awards.stats) == 0 then
				IngameAchievements.awards.stats = nil
			end
			award_achievement(persistent_stat_unlocks[stat] and persistent_stat_unlocks[stat][1].award or {stat})
		end
	
		if managers.hud then
			managers.hud:loot_value_updated()
		end
	end
end)

Hooks:PreHook(AchievmentManager, "award", "IngameAchievments.AchievmentManager.award", function(self, id)
	award_achievement(id)
end)