Hooks:Add("LocalizationManagerPostInit", "IngameAchievements.LocalizationManagerPostInit", function(self, ...)
	LocalizationManager:add_localized_strings({
		ingame_achievements_progress = 'Achievement progress: ',
	})

	if Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			ingame_achievements_progress = 'Прогресс достижения: ',
		})
	end
end)