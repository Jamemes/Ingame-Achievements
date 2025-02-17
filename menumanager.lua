if not MovieTheaterGui then
	dofile(ModPath .. string.lower("MovieTheaterGui.lua"))
end

if not ToggleInputPanel then
	ToggleInputPanel = ToggleInputPanel or class(ExtendedPanel)

	function ToggleInputPanel:init(...)
		ToggleInputPanel.super.init(self, ...)

		self.enabled = true
	end

	function ToggleInputPanel:allow_input()
		return ToggleInputPanel.super.allow_input(self) and self.enabled
	end
end

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

AchievementItem = AchievementItem or class(MovieListItem)
AchievementsGui = AchievementsGui or class(MovieTheaterGui)
MenuHelper:AddComponent("view_achievements", AchievementsGui)

AchievementItem.HEIGHT = tweak_data.menu.pd2_medium_font_size * 2 + 10
AchievementItem.TEXT_OFFSET = 0
AchievementItem.NORMAL_COLOR = tweak_data.screen_colors.button_stage_3

local large_font = tweak_data.menu.pd2_medium_font
local large_font_size = tweak_data.menu.pd2_medium_font_size
local movie_item_font = tweak_data.menu.pd2_medium_font
local movie_item_font_size = tweak_data.menu.pd2_medium_font_size

function AchievementItem:create_achievement_gui(item, unlocked)
	self._achievement_gui = self._panel:panel()
	
	local title_color = unlocked and tweak_data.screen_colors.text or self.NORMAL_COLOR
	local desc_color = unlocked and tweak_data.screen_colors.text or tweak_data.screen_colors.text:with_alpha(0.6)
	self._title = self._achievement_gui:text({
		text = managers.localization:text("achievement_".. item.name),
		font = movie_item_font,
		font_size = movie_item_font_size,
		color = title_color,
		x = self.HEIGHT,
		y = self.TEXT_OFFSET + 5,
		layer = 1
	})
	make_fine_text(self._title)

	self._kindof = self._achievement_gui:text({
		text = managers.localization:text("achievement_".. item.name .."_desc"),
		font = movie_item_font,
		font_size = movie_item_font_size / 1.75,
		color = desc_color,
		x = self.HEIGHT,
		layer = 1
	})
	make_fine_text(self._title)
	self._kindof:set_top(self._title:bottom() + 5)
	
	self._time = self._achievement_gui:text({
		text = unlocked and (IngameAchievements.awards.time and IngameAchievements.awards.time[item.name] or "--/--/--") or "",
		font = movie_item_font,
		font_size = movie_item_font_size,
		color = title_color,
	})
	make_fine_text(self._time)
	self._time:set_center_y(self.HEIGHT / 2)
	self._time:set_right(self._achievement_gui:w() - 20)
	
	if not unlocked and persistent_stat(item.name) then
		local padding = 10
		local progress_bar = self._achievement_gui:panel({
			h = self._achievement_gui:h() / 2.3,
		})
		progress_bar:set_width(self._achievement_gui:w() / 5)
		progress_bar:set_right(self._achievement_gui:w() - 20)
		progress_bar:set_center_y(self.HEIGHT / 2)
		
		progress_bar:rect({
			color = Color.black,
			blend_mode = "normal",
			alpha = 0.3,
			layer = 1
		})

		BoxGuiObject:new(progress_bar, {sides = {2, 2, 2, 2}})
	
		self._progress_line = progress_bar:rect({
			h = progress_bar:h() - padding,
			color = tweak_data.screen_colors.button_stage_3,
			alpha = 1,
			blend_mode = "add",
			layer = 1
		})
		self._progress_line:set_center_y(progress_bar:h() / 2)
		
		local full = progress_bar:w() - padding
		local current_stat = IngameAchievements.awards.stats and IngameAchievements.awards.stats[persistent_stat(item.name)] or 0
		local max_stat = tweak_data.persistent_stat_unlocks[persistent_stat(item.name)][1].at or 100
		self._progress_line:set_w(full * (current_stat / max_stat))
		self._progress_line:set_left(5)
		
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

	local function set_color(unlock, odd)
		local alpha = odd and 0.25 or 0.35
		if unlock then
			return tweak_data.screen_colors.button_stage_3:with_alpha(alpha)
		else
			if unlock == false then
				return Color("A70000"):with_alpha(alpha)
			else
				return Color.black:with_alpha(odd and 0.3 or 0.4)
			end
		end
	end
	
	self._background_color = self._achievement_gui:rect({
		color = set_color(unlocked, item.index % 2 ~= 0)
	})
end
	
function AchievementItem:init(parent, item, owner)
	local row_w = parent:row_w()

	MovieListItem.super.init(self, parent, {
		input = true,
		h = self.HEIGHT,
		w = row_w
	})

	self._panel:set_layer(1)
	
	self._owner = owner
	self._item = item
	
	self._click = self:panel({name = item.name})

	self._click:set_w(self:w())

	self._select_panel = self._panel:panel({
		layer = self:layer() - 1,
		w = self:w(),
		h = self:h()
	})

	self._select_panel:set_lefttop(self:lefttop())
	BoxGuiObject:new(self._select_panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	
	self:_selected_changed(false)
	
	self:create_achievement_gui(item, IngameAchievements.awards[item.name])
end

function AchievementItem:_selected_changed(state)
	self._select_panel:set_visible(state)
end

function AchievementItem:mouse_clicked(o, button, x, y)
	if button == Idstring("0") and self._click:inside(x, y) then
		local unlocked = IngameAchievements.awards[self._click:name()]
		if unlocked ~= nil then
			if unlocked then
				IngameAchievements.awards[self._click:name()] = false
			else
				IngameAchievements.awards[self._click:name()] = true
			end

			self._achievement_gui:clear()
			self:create_achievement_gui(self._item, IngameAchievements.awards[self._click:name()])
			IngameAchievements:Save()
		end

		return true
	end

	AchievementItem.super.mouse_clicked(self, o, button, x, y)
end

function AchievementsGui:init(ws, fullscreen_ws, node)
	MovieTheaterGui.super.init(self, ws:panel())

	self._panel:set_layer(200)
	self._panel:bitmap({
		texture = "guis/textures/test_blur_df",
		layer = -1,
		halign = "scale",
		render_template = "VertexColorTexturedBlur3D",
		valign = "scale",
		w = fullscreen_ws:panel():w(),
		h = fullscreen_ws:panel():h()
	})
	
	self._music_volume = (managers.user:get_setting("music_volume") or 100) / 100
	self._sfx_volume = (managers.user:get_setting("sfx_volume") or 100) / 100
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._node = node
	self._main_panel = ToggleInputPanel:new(self, {
		input = true
	})

	local total_ach = tweak_data.achievement and tweak_data.achievement.visual or managers.achievment.achievments
	self._achievements = table.sorted_copy(table.map_keys(total_ach), function (ach1, ach2)
		local award_score_1, award_score_2 = type(IngameAchievements.awards[ach1]) == "boolean" and 0 or 10000, type(IngameAchievements.awards[ach2]) == "boolean" and 0 or 10000
		local name_score_1 = managers.localization:text("achievement_".. ach1):lower() < managers.localization:text("achievement_".. ach2):lower() and 1 or 0
		local name_score_2 = not name_score_1 and 1 or 0
		
		return award_score_1 + name_score_1 > award_score_2 + name_score_2
	end)

	if SearchBoxGuiObject and managers.menu:is_pc_controller() then
		self._searchbox = SearchBoxGuiObject:new(self._panel, self._ws, self._saved_search)
		self._searchbox.panel:set_x(10)
		self._searchbox.panel:set_y(self._panel:h() - 35)
		self._searchbox:register_callback(callback(self, self, "update_achievements_list", false))
	end
	
	self:_create_achievements_list()
end

function AchievementsGui:_create_achievements_list()
	local title_text = self._main_panel:text({
		layer = 1,
		text = managers.localization:text("menu_ingame_achievements"),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(title_text)
	local ach_track = self._main_panel:text({
		name = "ach_track",
		x = padding,
		y = padding,
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		h = large_font_size,
		layer = 10,
		blend_mode = "add",
		color = tweak_data.screen_colors.title,
		text = managers.localization:text("menu_trophy_unlocked") .. ": (0 / 0)",
		align = "left",
		vertical = "top",
	})
	make_fine_text(ach_track)
	ach_track:set_top(title_text:bottom() + 5)

	local function count(v, func)
		local i = 0

		for k, item in pairs(v) do
			if func(item, k) then
				i = i + 1
			end
		end

		return i
	end
	
	local num_ach_unlocked = count(IngameAchievements.awards, function(ach) return type(ach) == "boolean" end) or 0
	local num_ach_total = table.size(self._achievements) or 0
	ach_track:set_text(managers.localization:text("menu_trophy_unlocked") .. string.format(": (%d / %d)", num_ach_unlocked, num_ach_total))
	make_fine_text(ach_track)
	
	local t_y = title_text:bottom() + 30

	self._scroll = ScrollItemList:new(self._main_panel, {
		scrollbar_padding = 10,
		input_focus = true,
		bar_minimum_size = 16,
		input = true,
		padding = 0,
		y = t_y,
		h = self._main_panel:h() - t_y - 50,
		w = self._main_panel:w()
	}, {
		padding = 0
	})

	BoxGuiObject:new(self._scroll:scroll_item():scroll_panel(), {
		w = self._scroll:canvas():w(),
		sides = {
			1,
			1,
			1,
			1
		}
	})

	local back_panel = self._main_panel:panel({
		layer = -1,
		w = self._scroll:canvas():w(),
		h = self._scroll:h()
	})

	back_panel:set_lefttop(self._scroll:lefttop())
	back_panel:rect({
		color = Color.black:with_alpha(0.4)
	})

	self:update_achievements_list()
end

function AchievementsGui:update_achievements_list(scroll_position, search_list, search_text)
	if search_text then
		search_text = search_text:lower()
	end

	self._scroll:clear()
	if self._achievements then
		local index = 0
		for _, name in pairs(self._achievements) do
			if string.is_nil_or_empty(search_text) or managers.localization:text("achievement_".. name):lower():find(search_text) or managers.localization:text("achievement_".. name .. "_desc"):lower():find(search_text) then
				index = index + 1
				local item = {
					index = index,
					name = name
				}

				self._scroll:add_item(AchievementItem:new(self._scroll:canvas(), item, self), true)
			end
		end
	end
end

Hooks:PreHook(AchievementsGui, "mouse_moved", "IngameAchievements.mouse_moved", function(self, o, x, y)
	if self._searchbox then
		local used, pointer = self._searchbox:mouse_moved(o, x, y)

		if used then
			return used, pointer
		end
	end
end)

Hooks:PreHook(AchievementsGui, "mouse_pressed", "IngameAchievements.mouse_pressed", function(self, button, x, y)
	if self._searchbox and self._searchbox:mouse_pressed(button, x, y) then
		return
	end
end)

Hooks:PreHook(AchievementsGui, "confirm_pressed", "IngameAchievements.confirm_pressed", function(self)
	if self._searchbox and self._searchbox:input_focus() and managers.menu:is_pc_controller() then
		self._searchbox:disconnect_search_input()

		return
	end
end)

function AchievementsGui:special_btn_pressed(button)
	local search_box_input_focus = self._searchbox and self._searchbox:input_focus()
	if search_box_input_focus then
		return search_box_input_focus
	end
	
	return AchievementsGui.super.special_btn_pressed(self, button)
end

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
	MenuHelper:AddMenuItem(nodes.main, "ingame_achievements", "menu_ingame_achievements", "", "divider_test2", "after")
	MenuHelper:AddMenuItem(nodes.pause, "ingame_achievements", "menu_ingame_achievements", "", "divider_test2", "after")
	MenuHelper:AddMenuItem(nodes.lobby, "ingame_achievements", "menu_ingame_achievements", "", "divider_test2", "after")
end)