
Hooks:PostHook(BlackMarketManager, "load", "IngameAchievments.BlackMarketManager.load.PostHook", function()
	managers.achievment.fetch_achievments(Global.blackmarket_manager.IngameAchievments or {})
end)