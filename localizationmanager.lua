local IngameAchievements_path = ModPath
Hooks:Add("LocalizationManagerPostInit", "IngameAchievements.LocalizationManagerPostInit", function(self, ...)
	LocalizationManager:add_localized_strings({
		ingame_achievements_progress = 'Achievement progress: ',
    	dialog_clear_achievement_progress = "Your local achievement progress will be reset entirely.\n\nDo you confirm your actions?",
	})

	if Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			ingame_achievements_progress = 'Прогресс достижения: ',
    		dialog_clear_achievement_progress = "Ваш прогресс локальный достижений будет сброшен полностью.\n\nВы подтверждаете свои действия?",
		})
	end

	if not self:exists("menu_achievements") then 
		dofile(IngameAchievements_path .. string.lower("loc/english.lua"))

		if Idstring("russian"):key() == SystemInfo:language():key() then
			dofile(IngameAchievements_path .. string.lower("loc/russian.lua"))
		end
	end
end)