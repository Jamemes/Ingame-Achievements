Hooks:PreHook(BlackMarketManager, "save", "IngameAchievements.save", function(self, data)
	data["IngameAchievements"] = IngameAchievements.awards
	IngameAchievements:Save()
end)

Hooks:PreHook(BlackMarketManager, "load", "IngameAchievements.load", function(self, data)
	if table.size(IngameAchievements.awards) < table.size(data["IngameAchievements"] or {}) then
		IngameAchievements.awards = data["IngameAchievements"] or {}
		IngameAchievements:Save()
	end
end) 