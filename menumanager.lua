Hooks:Add("CoreMenuData.LoadDataMenu", "AchievementsGui.CoreMenuData.LoadDataMenu", function(menu_id, menu)
	if menu.id == "pause_menu" then
		local node = {
			no_menu_wrapper = true,
			_meta = "node",
			scene_state = "crew_management",
			menu_components = "achievement_list",
			no_item_parent = true,
			topic_id = "menu_achievements",
			sync_state = "skilltree",
			modifier = "MenuComponentInitiator",
			help_id = "menu_achievements",
			name = "achievements",
			back_callback = "save_progress",
		}
		table.insert(menu, node)
		
		local node = {
			{
				_meta = "legend",
				name = "menu_legend_achievements_clear_filter",
			},
			{
				_meta = "legend",
				name = "menu_legend_select",
			},
			{
				_meta = "legend",
				name = "menu_legend_back"
			},
			legend = {
				{
					_meta = "legend",
					name = "menu_legend_achievements_clear_filter",
				},
				{
					_meta = "legend",
					name = "menu_legend_select",
				},
				{
					_meta = "legend",
					name = "menu_legend_back",
				},
			},
			topic_id = "menu_achievements_filter",
			gui_class = "MenuNodeAchievementFilterGui",
			_meta = "node",
			scene_state = "crew_management",
			menu_components = "achievement_list",
			name = "achievements_filter",
		}
		table.insert(menu, node)
			
		local node = {
			topic_id = "menu_achievements_filter",
			name = "achievements_detail_popup",
			gui_class = "MenuNodeAchievementDetailGui",
			_meta = "node",
			scene_state = "crew_management",
			menu_components = "achievement_list",
			default_item = {
				{
					_meta = "default_item",
					name = "back",
				}
			},
		}
		table.insert(menu, node)
	end
	
	for k, v in pairs(menu) do
		if type(v) == "table" and v.scene_state then
			if v.name == "achievements" or v.name == "achievements_filter" or v.name == "achievements_detail_popup" then
				if menu_id == "start_menu" then
					v.scene_state = "blackmarket"
				else
					v.scene_state = nil
				end
			end
		end
	end
end)

Hooks:Add("MenuManagerBuildCustomMenus", "AchievementListGui.MenuManagerBuildCustomMenus", function(menu_manager, nodes)
	MenuHelper:AddMenuItem(nodes.pause, "achievements", "menu_achievements", "menu_achievements_help", Global.game_settings.single_player and "options" or "edit_game_settings", "after")
end)