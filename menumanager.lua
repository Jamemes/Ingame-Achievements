dofile(ModPath .. string.lower("AchievementsGui.lua"))

_G.IngameAchievements = _G.IngameAchievements or {}
IngameAchievements._mod_path = IngameAchievements._mod_path or ModPath
IngameAchievements._setting_path = SavePath .. "IngameAchievements.json"
IngameAchievements.awards = IngameAchievements.awards or {}

function IngameAchievements:Save()
	local file = io.open(self._setting_path, "w+")
	if file then
		file:write(json.encode(self.awards))
		file:close()
	end
end

local function Load()
	local file = io.open(IngameAchievements._setting_path, "r")
	if file then
		for k, v in pairs(json.decode(file:read("*all")) or {}) do
			IngameAchievements.awards[k] = v
		end
		file:close()
	end
end

Load()

local function make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

local function set_color(unlock, odd, track)
	local alpha = odd and 0.25 or 0.35
	if tostring(unlock) ~= "nil" then
		return tostring(unlock) ~= "true" and tweak_data.screen_colors.button_stage_3:with_alpha(alpha) or Color("A70000"):with_alpha(alpha)
	else
		return track and tweak_data.screen_colors.risk or Color.black:with_alpha(odd and 0.3 or 0.4)
	end
end
	
function IngameAchievements:create_achievement_gui(panel, item, unlocked)
	local icon_texture, icon_texture_rect = nil, nil
	local visuals_icon = tweak_data.achievement.visual and tweak_data.achievement.visual[item.name] and tweak_data.achievement.visual[item.name].icon_id
	if visuals_icon then
		icon_texture, icon_texture_rect = tweak_data.hud_icons:get_icon_or(visuals_icon, nil)
	else
		if tweak_data.achievement.IngameAchievements_icons and tweak_data.achievement.IngameAchievements_icons[item.name] then
			icon_texture, icon_texture_rect = tweak_data.achievement.IngameAchievements_icons[item.name][1], tweak_data.achievement.IngameAchievements_icons[item.name][2]
		end
	end
	
	local icon_bitmap = panel:bitmap({
		name = "icon_bitmap",
		blend_mode = unlocked and "sub" or "normal",
		texture = icon_texture,
		texture_rect = icon_texture_rect,
		alpha = unlocked and 1 or 0.75,
		layer = 5,
		w = panel:h() / 1.5,
		h = panel:h() / 1.5
	})
	icon_bitmap:set_center_y(panel:h() / 2)
	icon_bitmap:set_left(15)
	
	local icon_bg = panel:panel({
		name = "icon_bg",
		visible = tostring(unlocked) == "true",
		w = panel:h() / 1.3,
		h = panel:h() / 1.3
	})
	
	icon_bg:rect({
		blend_mode = "normal",
		name = "bg",
		halign = "grow",
		valign = "grow",
		layer = -1,
		color = Color.white
	})
	
	icon_bg:set_center(icon_bitmap:center_x(), icon_bitmap:center_y())

	local title = panel:text({
		name = "title",
		text = managers.localization:text("achievement_".. item.name),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = unlocked and tweak_data.screen_colors.text or tweak_data.screen_colors.button_stage_3,
		layer = 1
	})
	
	make_fine_text(title)
	title:set_left(icon_bitmap:right() + 15)
	title:set_center_y(icon_bitmap:center_y() - (tweak_data.menu.pd2_medium_font_size / 2))
	local _, _, w, _ = title:text_rect()
	while w > panel:w() / 1.8 do
		title:set_font_size(title:font_size() * 0.99)
		_, _, w, _ = title:text_rect()
	end
	make_fine_text(title)

	local desc = panel:text({
		name = "desc",
		align = "left",
		wrap = true,
		wrap_mode = true,
		text = managers.localization:text("achievement_".. item.name .."_desc"),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size / 1.75,
		color = unlocked and tweak_data.screen_colors.text or tweak_data.screen_colors.text:with_alpha(0.6),
		layer = 1
	})
	desc:set_left(title:left())
	desc:set_top(title:bottom() + 5)
	desc:set_h(tweak_data.menu.pd2_medium_font_size * 2)
	desc:set_w(panel:w() / 1.8)
	
	local unlock_time = panel:text({
		name = "unlock_time",
		text = IngameAchievements.awards.time and IngameAchievements.awards.time[item.name] or "--/--/--",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = title_color,
		visible = tostring(unlocked) == "true",
	})
	make_fine_text(unlock_time)
	unlock_time:set_center_y(panel:h() / 2)
	unlock_time:set_right(panel:w() - 20)

	local function persistent_stat(ach)
		for key, value in pairs(tweak_data.persistent_stat_unlocks) do
			if value[1].award == ach then
				return key
			end
		end
	end

	if persistent_stat(item.name) then
		local padding = 10
		local progress_bar = panel:panel({
			name = "progress_bar",
			h = 25,
			visible = not unlocked,
		})
		progress_bar:set_width(panel:w() / 5)
		progress_bar:set_right(panel:w() - 20)
		progress_bar:set_center_y(panel:h() / 2)
		
		progress_bar:rect({
			color = Color.black,
			blend_mode = "normal",
			alpha = 0.3,
			layer = 1
		})

		BoxGuiObject:new(progress_bar, {sides = {2, 2, 2, 2}})
	
		local progress_line = progress_bar:rect({
			h = progress_bar:h() - padding,
			color = tweak_data.screen_colors.button_stage_3,
			alpha = 1,
			blend_mode = "add",
			layer = 1
		})
		progress_line:set_center_y(progress_bar:h() / 2)
		
		local full = progress_bar:w() - padding
		local current_stat = IngameAchievements.awards.stats and IngameAchievements.awards.stats[persistent_stat(item.name)] or 0
		local max_stat = tweak_data.persistent_stat_unlocks[persistent_stat(item.name)][1].at or 100
		progress_line:set_w(full * (current_stat / max_stat))
		progress_line:set_left(5)
		
		local progress = progress_bar:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = "(" .. current_stat .. "/" .. max_stat .. ")",
			color = Color.white:with_alpha(0.6),
			layer = 3
		})
		make_fine_text(progress)
		progress:set_center_x(progress_bar:w() / 2)
		progress:set_center_y(progress_bar:h() / 2)
	end
	
	panel:rect({
		name = "background_color",
		layer = -5,
		color = set_color(unlocked, item.index % 2 ~= 0, table.contains(IngameAchievements.awards.tracker or {}, item.name))
	})
end

function IngameAchievements:update_achievement_gui(panel, item, unlocked)
	panel:child("icon_bitmap"):set_blend_mode(unlocked and "sub" or "normal")
	panel:child("icon_bg"):set_visible(unlocked)
	panel:child("title"):set_color(unlocked and tweak_data.screen_colors.text or tweak_data.screen_colors.button_stage_3)
	panel:child("desc"):set_color(unlocked and tweak_data.screen_colors.text or tweak_data.screen_colors.text:with_alpha(0.6))
	panel:child("unlock_time"):set_visible(unlocked)
	panel:child("background_color"):set_color(set_color(unlocked, item.index % 2 ~= 0), table.contains(IngameAchievements.awards.tracker or {}, item.name))
	
	if alive(panel:child("progress_bar")) then
		panel:child("progress_bar"):set_visible(not unlocked)
	end
	log("click")
end

MenuHelper:AddComponent("view_achievements", AchievementsGui)

Hooks:Add("CoreMenuData.LoadDataMenu", "AchievementsGui.CoreMenuData.LoadDataMenu", function(menu_id, menu)
	local new_node = {
		["_meta"] = "node",
		["name"] = "ingame_achievements",
		["menu_components"] = "view_achievements",
		["back_callback"] = "save_progress",
		["scene_state"] = menu_id == "start_menu" and "crew_management"
	}
	
	table.insert(menu, new_node)
end)

Hooks:Add("MenuManagerBuildCustomMenus", "WC_populate_categories", function(menu_manager, nodes)
	MenuHelper:AddMenuItem(nodes.main, "ingame_achievements", "menu_ingame_achievements", "", "divider_test2", "after")
	MenuHelper:AddMenuItem(nodes.pause, "ingame_achievements", "menu_ingame_achievements", "", "divider", "after")
	MenuHelper:AddMenuItem(nodes.lobby, "ingame_achievements", "menu_ingame_achievements", "", "divider_test2", "after")
end)