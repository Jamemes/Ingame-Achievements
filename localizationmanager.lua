local IngameAchievements_path = ModPath
Hooks:Add("LocalizationManagerPostInit", "IngameAchievements.LocalizationManagerPostInit", function(self, ...)
	LocalizationManager:add_localized_strings({
		ingame_achievements_progress = 'Achievement progress: ',
	})

	if Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			ingame_achievements_progress = 'Прогресс достижения: ',
		})
	end

	if not self:exists("menu_achievements") then 
		dofile(IngameAchievements_path .. string.lower("loc/english.lua"))

		if Idstring("russian"):key() == SystemInfo:language():key() then
			dofile(IngameAchievements_path .. string.lower("loc/russian.lua"))
		end
	end
end)