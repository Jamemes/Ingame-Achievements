Hooks:PostHook(BlackMarketManager, "load", "IngameAchievments.BlackMarketManager.load.PostHook", function()
	managers.achievment.fetch_achievments(Global.blackmarket_manager.IngameAchievments or {})
	if Global.blackmarket_manager.IngameAchievments and managers.achievment.IngameAchievments then
		managers.achievment:load(Global.blackmarket_manager.IngameAchievments)
	end
end)

Hooks:PreHook(BlackMarketManager, "save", "IngameAchievments.BlackMarketManager.save.PreHook", function()
	if Global.blackmarket_manager.IngameAchievments and managers.achievment.IngameAchievments then
		Global.blackmarket_manager.IngameAchievments.achievement = Global.blackmarket_manager.IngameAchievments.achievement or {}
		managers.achievment:save(Global.blackmarket_manager.IngameAchievments)
	end
end)