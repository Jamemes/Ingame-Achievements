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

local function make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

AchievementItem = AchievementItem or class(ListItem)

function AchievementItem:init(parent, item)
	AchievementItem.super.init(self, parent, {
		w = parent:w(),
		input = false,
		h = 80
	})

	self._item = item
	self._content_panel = self._panel:panel({layer = 1})

	self._select_panel = self._panel:panel({
		layer = 1,
		visible = false
	})

	BoxGuiObject:new(self._select_panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})
	
	IngameAchievements:create_achievement_gui(self._content_panel, item, IngameAchievements.awards[item.name], table.contains(IngameAchievements.awards.tracker or {}, item.name))
end

function AchievementItem:mouse_moved(button, x, y)
	if self:inside(x, y) then
		return true, "link"
	end
end

AchievementsGui = AchievementsGui or class(ExtendedPanel)

function AchievementsGui:init(ws, fullscreen_ws, node)
	AchievementsGui.super.init(self, ws:panel())

	self:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
	
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._node = node
	
	local title_text = self._panel:text({
		vertical = "top",
		name = "title_text",
		align = "left",
		text = managers.network:session() and managers.network:session():_local_peer_in_lobby() and " " or managers.localization:text("menu_ingame_achievements"),
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.text
	})
	local _, _, w, h = title_text:text_rect()

	title_text:set_size(w, h)

	self._fullscreen_panel = self._fullscreen_ws:panel():panel({
		name = "fullscreen"
	})
	
	if managers.menu:is_pc_controller() then
		local back_text = self._panel:text({
			vertical = "bottom",
			name = "back_button",
			align = "right",
			blend_mode = "add",
			text = utf8.to_upper(managers.localization:text("menu_back")),
			h = tweak_data.menu.pd2_large_font_size,
			font_size = tweak_data.menu.pd2_large_font_size,
			font = tweak_data.menu.pd2_large_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local _, _, w, h = back_text:text_rect()

		back_text:set_size(w, h)
		back_text:set_position(math.round(back_text:x()), math.round(back_text:y()))
		back_text:set_right(self._panel:w())
		back_text:set_bottom(self._panel:h())

		local bg_back = self._fullscreen_panel:text({
			name = "back_button",
			vertical = "bottom",
			h = 90,
			align = "right",
			alpha = 0.4,
			blend_mode = "add",
			layer = 1,
			text = utf8.to_upper(managers.localization:text("menu_back")),
			font_size = tweak_data.menu.pd2_massive_font_size,
			font = tweak_data.menu.pd2_massive_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(self._panel:child("back_button"):world_right(), self._panel:child("back_button"):world_center_y())

		bg_back:set_world_right(x)
		bg_back:set_world_center_y(y)
		bg_back:move(13, -9)
		MenuBackdropGUI.animate_bg_text(self, bg_back)
	end

	self._main_panel = ToggleInputPanel:new(self, {
		input = true
	})
	
	local ach_exist = {}
	for k, v in pairs(managers.achievment.achievments) do
		if managers.localization:exists("achievement_".. k) then
			ach_exist[k] = v
		end
	end

	local total_ach = tweak_data.achievement and tweak_data.achievement.visual or ach_exist
	self._achievements = table.sorted_copy(table.map_keys(total_ach), function (ach1, ach2)
		local award_score_1, award_score_2 = type(IngameAchievements.awards[ach1]) == "boolean" and 0 or 10000, type(IngameAchievements.awards[ach2]) == "boolean" and 0 or 10000
		local name_score_1 = managers.localization:text("achievement_".. ach1):lower() < managers.localization:text("achievement_".. ach2):lower() and 1 or 0
		local name_score_2 = not name_score_1 and 1 or 0
		
		return award_score_1 + name_score_1 > award_score_2 + name_score_2
	end)

	if SearchBoxGuiObject and managers.menu:is_pc_controller() then
		self._searchbox = SearchBoxGuiObject:new(self._panel, self._ws, AchievementsGui._saved_search)
		self._searchbox.panel:set_x(10)
		self._searchbox.panel:set_y(self._panel:h() - 50)
		self._searchbox:register_callback(callback(self, self, "update_achievements_list", false))
	end
	
	self:_create_achievements_list()
end

function AchievementsGui:_update_achievements_track(ach_track)
	local function count(v, total)
		local i = 0

		for k, item in pairs(v) do
			if type(item) == "boolean" and table.contains(total, k) then
				i = i + 1
			end
		end

		return i
	end

	local num_ach_unlocked = count(IngameAchievements.awards, self._achievements)
	local num_ach_total = table.size(self._achievements) or 0
	local tracked_text = IngameAchievements.awards.tracker and string.format(", %s: %s", managers.localization:text("ingame_achievements_tracked"), #IngameAchievements.awards.tracker) or ""
	ach_track:set_text(managers.localization:text("menu_trophy_unlocked") .. string.format(": (%d / %d)", num_ach_unlocked, num_ach_total) .. tracked_text)
	make_fine_text(ach_track)
end

function AchievementsGui:_create_achievements_list()
	managers.menu:set_and_send_sync_state("blackmarket")
	
	local ach_track = self._main_panel:text({
		name = "ach_track",
		x = padding,
		y = padding,
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		h = tweak_data.menu.pd2_medium_font_size,
		layer = 10,
		blend_mode = "add",
		color = tweak_data.screen_colors.title,
		text = managers.localization:text("menu_trophy_unlocked") .. ": (0 / 0)",
		align = "left",
		vertical = "top",
	})
	make_fine_text(ach_track)
	ach_track:set_top(self._panel:child("title_text"):bottom() + 5)
	self:_update_achievements_track(ach_track)
	
	local t_y = self._panel:child("title_text"):bottom() + 30

	self._scroll = ScrollItemList:new(self._main_panel, {
		scrollbar_padding = 10,
		input_focus = true,
		bar_minimum_size = 16,
		input = true,
		padding = 0,
		y = t_y,
		h = self._main_panel:h() - t_y - 70,
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

	self:update_achievements_list(nil, nil, AchievementsGui._saved_search)
	self._scroll._scroll:scroll_to(AchievementsGui._last_y_position or 0)
end

function AchievementsGui:update_achievements_list(scroll_position, search_list, search_text)
	if search_text then
		search_text = search_text:lower()
	end

	AchievementsGui._saved_search = search_text and search_text:lower() or nil

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

				self._scroll:add_item(AchievementItem:new(self._scroll:canvas(), item), true)
			end
		end
	end
end

function AchievementsGui:close()
	AchievementsGui._last_y_position = self._scroll:canvas():y() * -1
	self:remove_self()
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
end

local AchievementsGui_pointer = AchievementsGui.mouse_moved
function AchievementsGui:mouse_moved(o, x, y)
	local used, pointer = AchievementsGui_pointer(self, o, x, y)

	if not used and self._scroll then
		used, pointer = self._scroll:mouse_moved(o, x, y)
	end
	
	if not used and self._searchbox then
		used, pointer = self._searchbox:mouse_moved(o, x, y)
	end
	
	if managers.menu:is_pc_controller() then
		local back_button = self._panel:child("back_button")

		if not used and back_button:inside(x, y) then
			used = true
			pointer = "link"

			if not self._back_highlight then
				self._back_highlight = true

				back_button:set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
		elseif self._back_highlight then
			self._back_highlight = false

			back_button:set_color(tweak_data.screen_colors.button_stage_3)
		end
	end
	
	return used, pointer
end

function AchievementsGui:mouse_pressed(button, x, y)
	if self._searchbox and self._searchbox:mouse_pressed(button, x, y) then
		return
	end
	
	if self._scroll:mouse_pressed(button, x, y) then
		return true
	end
	
	if button == Idstring("0") then
		if self._panel:child("back_button"):inside(x, y) then
			managers.menu:back()

			return
		end

		if self._scroll:inside(x, y) then
			for index, item in ipairs(self._scroll:items()) do
				if item:inside(x, y) then
					local name = item._item.name
					if not IngameAchievements:tracked(name) then
						IngameAchievements.awards.tracker = IngameAchievements.awards.tracker or {}
						table.insert(IngameAchievements.awards.tracker, name)
					elseif IngameAchievements:tracked(name) then
						table.delete(IngameAchievements.awards.tracker, name)
						if #IngameAchievements.awards.tracker == 0 then
							IngameAchievements.awards.tracker = nil
						end
					end
				
					IngameAchievements:update_achievement_gui(item._content_panel, item._item, IngameAchievements.awards[name], IngameAchievements:tracked(name))
					IngameAchievements:Save()
					
					if managers.hud then
						managers.hud:loot_value_updated()
					end
					
					self:_update_achievements_track(self._main_panel:child("ach_track"))
					
					return
				end
			end
		end
	end
	
	return AchievementsGui.super.mouse_pressed(self, button, x, y)
end

function AchievementsGui:update(...)
end

function AchievementsGui:input_focus()
	return 1
end

function AchievementsGui:move_up()
	self._scroll:move_up()
end

function AchievementsGui:move_down()
	self._scroll:move_down()
end

function AchievementsGui:confirm_pressed()
	if self._searchbox and self._searchbox:input_focus() and managers.menu:is_pc_controller() then
		self._searchbox:disconnect_search_input()

		return
	end
end

function AchievementsGui:special_btn_pressed(button)
	local search_box_input_focus = self._searchbox and self._searchbox:input_focus()
	if search_box_input_focus then
		return search_box_input_focus
	end
	
	return AchievementsGui.super.special_btn_pressed(self, button)
end

function AchievementsGui:back_pressed()
end

function AchievementsGui:mouse_clicked(o, button, x, y)
	return AchievementsGui.super.mouse_clicked(self, o, button, x, y)
end