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
	else
		IngameAchievements.awards = {}
		IngameAchievements:Save()
	end
end

Load()

AchievementsGui = AchievementsGui or class(BLTModsGui)
AchievementItem = AchievementItem or class(BLTModItem)

local function make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

local function persistent_stat(ach)
	for key, value in pairs(tweak_data.persistent_stat_unlocks) do
		if value[1].award == ach then
			return key
		end
	end
end

local padding = 10
function AchievementItem:init(panel, index, mod)
	local medium_font = tweak_data.menu.pd2_medium_font
	local small_font = tweak_data.menu.pd2_small_font

	local medium_font_size = tweak_data.menu.pd2_medium_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size

	local w = (panel:w() - (self.layout.x + 1) * padding) / self.layout.x
	local h = ((panel:h() - (self.layout.y + 1) * padding) / self.layout.y) * 0.5 - (padding * 0.5)
	local column, row = self:_get_col_row(index)
	local icon_size = 32
	
	local locked_color = Color("A70000")
	local bg_color = tweak_data.screen_colors.button_stage_3
	local text_color = Color.white
	if IngameAchievements.awards[mod] == false then
		bg_color = locked_color
		text_color = Color.white
	elseif not IngameAchievements.awards[mod] then
		bg_color = Color.black
		text_color = Color(0.3, 0.3, 0.3)
	end

	-- Main panel
	self._panel = panel:panel({
		x = (w + padding) * (column - 1),
		y = (h + padding) * (row - 1),
		w = w,
		h = h,
		layer = 10
	})

	-- Background
	local first_background = self._panel:rect({
		color = bg_color,
		alpha = 0.5,
		blend_mode = "normal",
		layer = -1
	})

	self._background = self._panel:rect({
		color = Color.white,
		alpha = 0,
		blend_mode = "add",
		layer = 1
	})
	BoxGuiObject:new(self._panel, {sides = {1, 1, 1, 1}})

	self._panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = self._panel:w(),
		h = self._panel:h(),
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		halign = "scale",
		valign = "scale"
	})
		
	if IngameAchievements.awards[mod] ~= true and persistent_stat(mod) then
		self._progress_bar = self._panel:panel({
			h = self._panel:h() / 4.5,
		})
		self._progress_bar:set_width(self._panel:w() - self._progress_bar:x() - (padding * 3))
		self._progress_bar:set_center_x(math.round(self._panel:w() * 0.5))
		self._progress_bar:set_bottom(math.round(self._panel:h() - padding))
		
		self._progress_bar:rect({
			color = Color.black,
			blend_mode = "normal",
			alpha = 0.3,
			layer = 1
		})

		BoxGuiObject:new(self._progress_bar, {sides = {2, 2, 2, 2}})
	
		self._progress_line = self._progress_bar:rect({
			h = self._progress_bar:h() - padding,
			color = tweak_data.screen_colors.button_stage_3,
			alpha = 1,
			blend_mode = "add",
			layer = 1
		})
		self._progress_line:set_center_y(self._progress_bar:h() / 2)
		
		local full = self._progress_bar:w() - padding
		local current_stat = IngameAchievements.awards.stats and IngameAchievements.awards.stats[persistent_stat(mod)] or 0
		local max_stat = tweak_data.persistent_stat_unlocks[persistent_stat(mod)][1].at or 100
		self._progress_line:set_w(full * (current_stat / max_stat))
		self._progress_line:set_left(5)
		
		local progress = self._progress_bar:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = "(" .. current_stat .. "/" .. max_stat .. ")",
			color = Color.white:with_alpha(0.6),
			layer = 3
		})
		make_fine_text(progress)
		progress:set_center_x(self._progress_bar:w() / 2)
		progress:set_center_y(self._progress_bar:h() / 2)
	end
	
	-- Mod name
	local mod_name = self._panel:text({
		name = "mod_name",
		w = self._panel:w() - padding * 2,
		font_size = medium_font_size,
		font = medium_font,
		layer = 10,
		blend_mode = "add",
		color = text_color,
		text = managers.localization:text("achievement_".. mod),
		align = "center",
		vertical = "top",
		wrap = true,
		word_wrap = true
	})
	local name_padding = 4 + padding
	mod_name:set_x(name_padding)
	mod_name:set_width(self._panel:w() - mod_name:x() - name_padding)
	mod_name:set_top(math.round(self._panel:h() * 0.1))
	local _, _, nw, nh = mod_name:text_rect()
	mod_name:set_h(nh)

	-- Mod description
	local mod_desc = self._panel:text({
		name = "mod_desc",
		font_size = small_font_size,
		font = small_font,
		layer = 10,
		blend_mode = "add",
		color = text_color,
		text = managers.localization:text("achievement_".. mod .. "_desc"),
		align = "left",
		vertical = "top",
		wrap = true,
		word_wrap = true,
		w = self._panel:w() - padding * 2
	})
	mod_desc:set_top(math.round(mod_name:bottom()) + 5)
	local _, _, dw, dh = mod_desc:text_rect()
	mod_desc:set_size(dw, math.min(dh, self._panel:h() - mod_desc:y() - padding))
	mod_desc:set_center_x(math.round(self._panel:w() * 0.5))

	local progress_bar_h = alive(self._progress_bar) and self._progress_bar:h() + padding or 0
	while dh + nh + progress_bar_h > (self._panel:h() - padding * 2) - 5 do
		mod_name:set_font_size(mod_name:font_size() * 0.99)
		make_fine_text(mod_name)
		
		mod_name:set_w(self._panel:w() - padding * 2)
		mod_name:set_center_x(self._panel:w() / 2)
		
		mod_desc:set_font_size(mod_desc:font_size() * 0.99)
		make_fine_text(mod_desc)
		
		mod_desc:set_w(self._panel:w() - padding * 2)
		mod_desc:set_center_x(self._panel:w() / 2)
		
		mod_desc:set_top(math.round(mod_name:bottom()) + 5)

		_, _, nw, nh = mod_name:text_rect()
		_, _, dw, dh = mod_desc:text_rect()
	end
		
	self._parameters = {callback = function()
		local achievement = IngameAchievements.awards[mod]
		if achievement ~= nil then
			if achievement then
				first_background:set_color(locked_color)
				IngameAchievements.awards[mod] = false
			else
				first_background:set_color(tweak_data.screen_colors.button_stage_3)
				IngameAchievements.awards[mod] = true
			end
			IngameAchievements:Save()
		end
	end,
	callback_2 = function()
		if managers.localization:exists("achievement_".. mod .. "_additional") then
			local dialog_data = {
				text = managers.localization:text("achievement_".. mod .. "_additional")
			}
			local ok_button = {
				text = managers.localization:text("dialog_ok")
			}
			dialog_data.button_list = {
				ok_button
			}
			
			managers.system_menu:show(dialog_data)
		end
	end
	}
end

function AchievementItem:set_highlight(enabled, no_sound)
	if self._enabled ~= enabled then
		self._enabled = enabled
		self._background:set_alpha(enabled and 0.1 or 0)
		if enabled and not no_sound then
			managers.menu_component:post_event("highlight")
		end
	end
end

function AchievementItem:parameters()
	return self._parameters
end

function AchievementsGui:_setup()
	local padding = 10
	local large_font = tweak_data.menu.pd2_large_font
	local large_font_size = tweak_data.menu.pd2_large_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size

	local function make_fine_text_aligning(text)
		-- Make fine text, but use the text rect X and Y in set_position
		local x, y, w, h = text:text_rect()
		text:set_size(w, h)
		text:set_position(math.round(x), math.round(y))
	end

	-- Background
	self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = self._fullscreen_panel:w(),
		h = self._fullscreen_panel:h(),
		render_template = "VertexColorTexturedBlur3D",
		layer = 1,
		halign = "scale",
		valign = "scale"
	})
	
	self._background = self._fullscreen_panel:rect({
		color = Color.black,
		alpha = 0.2,
		layer = 1
	})

	self._panel:set_layer(10)
	
	-- Back button
	local back_button = self._panel:text({
		name = "back",
		text = managers.localization:text("menu_back"),
		align = "right",
		vertical = "bottom",
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.button_stage_3,
		layer = 40,
		blend_mode = "add"
	})
	
	make_fine_text(back_button)
	back_button:set_right(self._panel:w() - 10)
	back_button:set_bottom(self._panel:h() - 10)
	back_button:set_visible(managers.menu:is_pc_controller())
	self._back_button = back_button
	self._custom_buttons[back_button] = {
		clbk = function()
			managers.menu:back()
			return true
		end
	}

	local bg_back = self._fullscreen_panel:text({
		name = "back_button",
		text = utf8.to_upper(managers.localization:text("menu_back")),
		h = 90,
		align = "right",
		vertical = "bottom",
		blend_mode = "add",
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.pd2_massive_font,
		color = tweak_data.screen_colors.button_stage_3,
		alpha = 0.4,
		layer = 1
	})
	local x, y = managers.gui_data:safe_to_full_16_9(self._panel:child("back"):world_right(), self._panel:child("back"):world_center_y())
	bg_back:set_world_right(x)
	bg_back:set_world_center_y(y)
	bg_back:move(13, -9)
	
	-- Title
	local title = self._panel:text({
		name = "title",
		x = padding,
		y = padding,
		font_size = large_font_size,
		font = large_font,
		h = large_font_size,
		layer = 10,
		blend_mode = "add",
		color = tweak_data.screen_colors.title,
		text = managers.localization:text("blt_installed_mods"),
		align = "left",
		vertical = "top",
	})

	-- Toggle libraries visible button
	local padding = 10
	local params = {
		x = padding,
		y = padding,
		width = self._panel:w() - padding * 2,
		height = large_font_size,
		color = tweak_data.screen_colors.button_stage_3,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		vertical = "bottom",
		align = "right"
	}

	local function customize(changes)
		return table.map_append(table.map_copy(params), changes)
	end

	-- Count the number of libraries installed
	local libs_count = 0
	for i, mod in ipairs(BLT.Mods:Mods()) do
		if mod:IsLibrary() then
			libs_count = libs_count + 1
		end
	end

	-- Add the libraries label
	local libraries_text = self._panel:text(customize({
		text = managers.localization:to_upper_text("menu_achievements_sort_order"),
		color = tweak_data.screen_colors.text
	}))

	-- Shift the show and hide buttons to the left of the libraries label
	make_fine_text_aligning(libraries_text)
	params.width = libraries_text:x() - params.x - 4 -- 4px padding

	self._libraries_show_button = self._panel:text(customize({
		text = managers.localization:to_upper_text("menu_sort_alphabetic")
	}))

	self._libraries_hide_button = self._panel:text(customize({
		text = managers.localization:to_upper_text("menu_trophy_unlocked")
	}))

	make_fine_text_aligning(self._libraries_show_button)
	make_fine_text_aligning(self._libraries_hide_button)

	self._custom_buttons[self._libraries_show_button] = {
		clbk = function()
			BLTModsGui.show_libraries = true
			self:update_visible_mods()
			return true
		end
	}
	self._custom_buttons[self._libraries_hide_button] = {
		clbk = function()
			BLTModsGui.show_libraries = false
			self:update_visible_mods()
			return true
		end
	}

	-- Set up the toggle icons button
	params.width = self._panel:w() - padding * 2
	params.height = params.height - small_font_size

	local icons_text = self._panel:text(customize({
		text = managers.localization:to_upper_text("menu_trophy_unlocked"),
		color = tweak_data.screen_colors.text
	}))

	-- Shift the show and hide buttons to the left of the label
	make_fine_text_aligning(icons_text)
	params.width = icons_text:x() - params.x - 4 -- 4px padding

	self._mod_icons_show_button = self._panel:text(customize({
		text = managers.localization:to_upper_text("menu_button_show")
	}))

	self._mod_icons_hide_button = self._panel:text(customize({
		text = managers.localization:to_upper_text("menu_button_hide")
	}))

	make_fine_text_aligning(self._mod_icons_show_button)
	make_fine_text_aligning(self._mod_icons_hide_button)

	self._custom_buttons[self._mod_icons_show_button] = {
		clbk = function()
			BLTModsGui.show_mod_icons = true
			self:update_visible_mods()
			return true
		end
	}
	self._custom_buttons[self._mod_icons_hide_button] = {
		clbk = function()
			BLTModsGui.show_mod_icons = false
			self:update_visible_mods()
			return true
		end
	}

	-- Set up search box
	if SearchBoxGuiObject then
		self._searchbox = SearchBoxGuiObject:new(self._panel, self._ws)
		self._searchbox.panel:set_x(10)
		self._searchbox.panel:set_y(back_button:y())

		self._searchbox:register_callback(callback(self, self, "update_visible_mods", false))
	end

	-- Mods scroller
	local scroll_panel = self._panel:panel({
		h = self._panel:h() - large_font_size * 2 - padding * 2,
		y = large_font_size
	})
	self._scroll = ScrollablePanel:new(scroll_panel, "mods_scroll", {})

	self:update_visible_mods(BLTModsGui.last_y_position)
end

function AchievementsGui:update_visible_mods(scroll_position, search_list, search_text)
	self._panel:set_layer(200)
	self._panel:child("title"):set_text(managers.localization:text("menu_achievements"))
	
	self._libraries_show_button:set_visible(not BLTModsGui.show_libraries)
	self._libraries_hide_button:set_visible(BLTModsGui.show_libraries)

	self._mod_icons_show_button:set_visible(not BLTModsGui.show_mod_icons)
	self._mod_icons_hide_button:set_visible(BLTModsGui.show_mod_icons)
	
	-- Save the position of the scroll panel
	AchievementsGui.last_y_position = scroll_position or self._scroll:canvas():y() * -1

	-- Clear the scroll panel
	self._scroll:canvas():clear()
	self._scroll:update_canvas_size() -- Ensure the canvas always starts at it's maximum size
	self._buttons = {}
	
	local achievements = table.sorted_copy(table.map_keys(managers.achievment.achievments), function (mod1, mod2)
		if BLTModsGui.show_libraries then
			return tostring(IngameAchievements.awards[mod1]) > tostring(IngameAchievements.awards[mod2])
		end
		
		if BLTModsGui.show_mod_icons then
			return tostring(IngameAchievements.awards[mod1]) < tostring(IngameAchievements.awards[mod2])
		end
		
		return managers.localization:text("achievement_".. mod1):lower() < managers.localization:text("achievement_".. mod2):lower()
	end)

	-- Create mod boxes
	for _, mod in ipairs(achievements) do
		if string.is_nil_or_empty(search_text) or managers.localization:text("achievement_".. mod):lower():find(search_text) or managers.localization:text("achievement_".. mod .. "_desc"):lower():find(search_text) then
			local i = #self._buttons
			
			i = i + 1
			
			if BLTModsGui.show_mod_icons then
				if not IngameAchievements.awards[mod] then
					local item = AchievementItem:new(self._scroll:canvas(), i, mod)
					table.insert(self._buttons, item)
				end
			else
				local item = AchievementItem:new(self._scroll:canvas(), i, mod)
				table.insert(self._buttons, item)
			end
		end
	end
	
	-- Update scroll size
	self._scroll:update_canvas_size()

	self._scroll:scroll_to(AchievementsGui.last_y_position)
end

function AchievementsGui:mouse_pressed(button, x, y)
	if managers.menu_scene and managers.menu_scene:input_focus() then
		return false
	end

	local result

	if self._searchbox then
		result = self._searchbox:mouse_pressed(button, x, y)
	end

	if alive(self._scroll) and not result then
		result = self._scroll:mouse_pressed(button, x, y)
	end

	if button == Idstring("0") and not result then
		for button, data in pairs(self._custom_buttons) do
			if alive(button) and button:visible() and button:inside(x, y) then
				return data.clbk()
			end
		end

		if alive(self._scroll) and self._scroll:panel():inside(x, y) then
			for _, item in ipairs(self._buttons) do
				if item:inside(x, y) then
					if item.parameters then
						local clbk = item:parameters().callback
						if clbk then
							clbk()
						end
					end

					return true
				end
			end
		end
	end
	
	if button == Idstring("1") and not result then
		for button, data in pairs(self._custom_buttons) do
			if alive(button) and button:visible() and button:inside(x, y) then
				return data.clbk()
			end
		end

		if alive(self._scroll) and self._scroll:panel():inside(x, y) then
			for _, item in ipairs(self._buttons) do
				if item:inside(x, y) then
					if item.parameters then
						local clbk = item:parameters().callback_2
						if clbk then
							clbk()
						end
					end

					return true
				end
			end
		end
	end
	
	return result
end

MenuHelper:AddComponent("view_achievements", AchievementsGui)
Hooks:Add("CoreMenuData.LoadDataMenu", "AchievementsGui.CoreMenuData.LoadDataMenu", function(menu_id, menu)
	local new_node = {
		["_meta"] = "node",
		["name"] = "ingame_achievements",
		["menu_components"] = "view_achievements",
		["back_callback"] = "perform_blt_save",
		["no_item_parent"] = true,
		["no_menu_wrapper"] = true,
		["scene_state"] = menu_id == "start_menu" and "crew_management",
		[1] = {
			["_meta"] = "default_item",
			["name"] = back
		}
	}
	table.insert(menu, new_node)
end)

Hooks:Add("MenuManagerBuildCustomMenus", "WC_populate_categories", function(menu_manager, nodes)
	MenuHelper:AddMenuItem(nodes.main, "ingame_achievements", "menu_achievements", "ingame_achievements", "divider_test2", "after")
	MenuHelper:AddMenuItem(nodes.pause, "ingame_achievements", "menu_achievements", "ingame_achievements", "kick_player", "before")
	MenuHelper:AddMenuItem(nodes.lobby, "ingame_achievements", "menu_achievements", "ingame_achievements", "kick_player", "before")
end)