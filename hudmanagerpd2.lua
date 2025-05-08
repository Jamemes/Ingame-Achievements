Hooks:PostHook(HUDStatsScreen, "show", "IngameAchievments.HUDStatsScreen.show", function(self)
	if alive(self._full_hud_panel) then
		self:create_tracker_old()
	else
		self:create_tracker_new()
	end
end)

Hooks:PostHook(HUDStatsScreen, "loot_value_updated", "IngameAchievments.HUDStatsScreen.loot_value_updated", function(self)
	if alive(self._full_hud_panel) then
		self:create_tracker_old()
	else
		self:create_tracker_new()
	end
end)

function HUDStatsScreen:create_tracker_new()
	if alive(self._achievements_tracker) then
		self._achievements_tracker:stop()
		self._achievements_tracker:clear()
	end
	
	local achieves = IngameAchievements.awards.tracker or {}
	if #achieves > 0 then
		for i = 0, #managers.achievment:get_tracked_fill() do
			self._right:child(i + 2):hide()
		end
	end
	
	self._achievements_tracker = self._right:panel({
		layer = -1
	})
	
	local achievements_panel_bottom = 0
	for k, v in pairs(achieves) do
		local item = {index = k, name = v}
		
		local achievement_panel = self._achievements_tracker:panel({
			y = 70 * (k - 1),
			h = 70
		})
		IngameAchievements:create_achievement_gui(achievement_panel, item)
		self._achievements_tracker:set_h(achievement_panel:bottom() < 560 and achievement_panel:bottom() or 560)
	end
end

function HUDStatsScreen:create_tracker_old()
	if alive(self._achievements_tracker) then
		self._achievements_tracker:stop()
		self._achievements_tracker:clear()
	end
	
	local left_panel = self._full_hud_panel:child("left_panel")
	local left_bg = left_panel:child("blur_bg")
	self._achievements_tracker = left_panel:panel({
		x = left_bg:x(),
		y = left_bg:y(),
		w = left_bg:w(),
		h = left_bg:h(),
		layer = 1,
	})
	
	local achievements_panel_bottom = 0
	local achieves = IngameAchievements.awards.tracker or {}
	for k, v in pairs(achieves) do
		local item = {index = k, name = v}
		
		local achievement_panel = self._achievements_tracker:panel({
			y = 70 * (k - 1),
			h = 70
		})
		IngameAchievements:create_achievement_gui(achievement_panel, item)
		self._achievements_tracker:set_h(achievement_panel:bottom() < 700 and achievement_panel:bottom() or 700)
	end

	if #achieves > 0 then
		left_panel:child("objectives_title"):hide()
		left_panel:child("objectives_panel"):hide()
	else
		left_panel:child("objectives_title"):show()
		left_panel:child("objectives_panel"):show()
	end
	
	if #achieves > 5 then
		left_panel:child("loot_wrapper_panel"):hide()
	else
		left_panel:child("loot_wrapper_panel"):show()
	end
end