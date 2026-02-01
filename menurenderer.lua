Hooks:PostHook(MenuNodeAchievementFilterGui, "init", "IngameAchievments.MenuNodeAchievementFilterGui.init", function(self)
	self.ws:panel():set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
end)