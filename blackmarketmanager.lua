Hooks:PreHook(BlackMarketManager, "save", "IngameAchievements.save", function(self, data)
	data["IngameAchievements"] = IngameAchievements.awards
	IngameAchievements:Save()
end)

Hooks:PreHook(BlackMarketManager, "load", "IngameAchievements.load", function(self, data)
	IngameAchievements:compare_awards_progress(data["IngameAchievements"], IngameAchievements.awards)
	IngameAchievements:Save()
end) 