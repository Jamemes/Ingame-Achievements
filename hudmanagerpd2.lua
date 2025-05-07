Hooks:PostHook(HUDStatsScreen, "show", "IngameAchievments.HUDStatsScreen.show", function(self)
	self:create_tracker()
end)

Hooks:PostHook(HUDStatsScreen, "loot_value_updated", "IngameAchievments.HUDStatsScreen.loot_value_updated", function(self)
	self:create_tracker()
end)

function HUDStatsScreen:create_tracker()
	if alive(self._achievements_tracker) then
		self._achievements_tracker:stop()
		self._achievements_tracker:clear()
	end
	
	local achieves = IngameAchievements.awards.tracker or {}
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
	for k, v in pairs(achieves) do
		local item = {index = k, name = v}
		
		local achievement_panel = self._achievements_tracker:panel({
			y = 70 * (k - 1),
			h = 70
		})
		IngameAchievements:create_achievement_gui(achievement_panel, item)
		self._achievements_tracker:set_h(achievement_panel:bottom() < 700 and achievement_panel:bottom() or 700)
	end

	local blur_bg = self._achievements_tracker:bitmap({
		x = left_bg:x(),
		y = left_bg:y(),
		w = self._achievements_tracker:w(),
		h = self._achievements_tracker:h(),
		render_template = "VertexColorTexturedBlur3D",
		texture = "guis/textures/test_blur_df",
		layer = -1,
		valign = "scale",
	})
	
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
	
	PrintTable(managers.statistics._global.session.killed_by_weapon)
end