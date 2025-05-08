Hooks:Add("LocalizationManagerPostInit", "IngameAchievements_ach_localization", function(...)
	local ach = "Achievements"
	local cus = tweak_data.achievement and tweak_data.achievement.visual and "InGame " or ""
	
	if cus == "" then
		local function localize(lang)
			dofile(IngameAchievements._mod_path .. "loc/" .. lang .. ".txt")
			LocalizationManager:add_localized_strings(Global.achievements_loc)
			Global.achievements_loc = nil
		end
		
		if Idstring("russian"):key() == SystemInfo:language():key() then
			localize("russian")
		else
			localize("english")
		end
	end
	
	LocalizationManager:add_localized_strings({
		menu_ingame_achievements = cus .. ach,
		ingame_achievements_tracked = "Tracked",
		ingame_achievements_failed = "Failed!",
	})

	if Idstring("russian"):key() == SystemInfo:language():key() then
		ach = "Достижения"
		if cus ~= "" then
			cus = "Игровые "
		end
		
		LocalizationManager:add_localized_strings({
			menu_ingame_achievements = cus .. ach,
			ingame_achievements_tracked = "Отслеживается",
			ingame_achievements_failed = "Провалено!",
		})
	end
end)