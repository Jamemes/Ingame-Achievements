Hooks:PostHook(MenuMainState, "at_enter", "IngameAchievments.MenuMainState.at_enter.PostHook", function()
	managers.achievment:check_autounlock_achievements()
end)
