if type(AchievementListGui) == "nil" then
	dofile(ModPath .. string.lower("components/achievementlistgui.lua"))
end

Hooks:PostHook(AchievementListGui, "init", "IngameAchievments.AchievementListGui.init.PostHook", function(self)
	self:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
	if managers.network:session() and managers.network:session():_local_peer_in_lobby() then
		self._main_panel:child(1):set_text("")
	end
end)

	-- managers.achievment.fetch_achievments()
Hooks:PostHook(AchievementListGui, "show_blur", "IngameAchievments.AchievementListGui.show_blur", function(self)
	self._blur:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER) 
end)

Hooks:PostHook(AchievementListItem, "init", "IngameAchievments.AchievementListItem.init", function(self)
	local left = self:w() / 1.2
	if self._info.awarded then
		self._track = AchievementTrackButton:new(self, self._id, self._info, callback(self, self, "_on_toggle_tracked"))

		self._track:set_right(left)
		self._track:set_center_y(self:h() / 2)
		self._track._select_panel:set_visible(false)

		left = self._track:left() - 4
		self._force = AchievementForceButton:new(self, self._id, self._info, callback(self, self, "_on_force"))

		self._force:set_right(left)
		self._force:set_center_y(self:h() / 2)
		self._force._select_panel:set_visible(false)

		left = self._force:left() - 4

		self._click:set_w(self:w() * 0.75)
	end
end)