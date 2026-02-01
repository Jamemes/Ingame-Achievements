local function make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

local function set_color(status, odd, track)
	local alpha = odd and 0.25 or 0.35
	local unlocked = {
		["nil"] = Color.black:with_alpha(odd and 0.3 or 0.4),
		["boolean"] = tweak_data.screen_colors.button_stage_3:with_alpha(alpha),
	}

	return track and Color("C864C8"):with_alpha(odd and 0.3 or 0.4) or unlocked[status]
end

local function create_achievement_gui(panel, item, status, tracked)
	panel:stop()
	panel:clear()

	local function persistent_stat(ach)
		for key, value in pairs(tweak_data.achievement.persistent_stat_unlocks) do
			if value[1].award == ach then
				return key
			end
		end
	end

	local unlocked = type(status) == "boolean" and not tracked
	local icon_texture, icon_texture_rect = nil, nil
	local visuals_icon = tweak_data.achievement.visual and tweak_data.achievement.visual[item.name] and tweak_data.achievement.visual[item.name].icon_id
	if visuals_icon then
		icon_texture, icon_texture_rect = tweak_data.hud_icons:get_icon_or(visuals_icon, nil)
	else
		if tweak_data.achievement.IngameAchievements_icons and tweak_data.achievement.IngameAchievements_icons[item.name] then
			icon_texture, icon_texture_rect = tweak_data.achievement.IngameAchievements_icons[item.name][1], tweak_data.achievement.IngameAchievements_icons[item.name][2]
		end
	end

	panel:bitmap({
		name = "background_color",
		texture = "guis/textures/test_blur_df",
		color = set_color(type(status), item.index % 2 ~= 0, tracked),
		w = panel:w(),
		h = panel:h(),
		layer = -1
	})

	panel:bitmap({
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		w = panel:w(),
		h = panel:h(),
	})

	local icon_bg = panel:panel({
		name = "icon_bg",
		visible = unlocked,
		w = panel:h() / 1.4,
		h = panel:h() / 1.4,
		layer = -1
	})
	
	icon_bg:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "bg",
		color = Color.white,
		w = icon_bg:w(),
		h = icon_bg:h()
	})
	
	icon_bg:set_center_y(panel:h() / 2)
	icon_bg:set_left(12)

	
	local info_panel = panel:panel({
		name = "info_panel",
		w = panel:w(),
		h = panel:h(),
		layer = 1
	})

	local icon_bitmap = info_panel:bitmap({
		name = "icon_bitmap",
		blend_mode = unlocked and "sub" or "normal",
		texture = icon_texture,
		texture_rect = icon_texture_rect,
		w = info_panel:h() / 1.5,
		h = info_panel:h() / 1.5
	})
	icon_bitmap:set_center(icon_bg:center_x(), icon_bg:center_y())

	local width_max = persistent_stat(item.name) and 1.8 or 1.35
	local title = info_panel:text({
		name = "title",
		text = managers.localization:text("achievement_".. item.name),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = unlocked and tweak_data.screen_colors.text or tweak_data.screen_colors.button_stage_3
	})
	
	make_fine_text(title)
	local _, _, w, _ = title:text_rect()
	while w > info_panel:w() / width_max do
		title:set_font_size(title:font_size() * 0.99)
		_, _, w, _ = title:text_rect()
	end
	make_fine_text(title)
	title:set_left(icon_bitmap:right() + 15)
	title:set_center_y(icon_bitmap:center_y() - (tweak_data.menu.pd2_medium_font_size / 2))

	local desc = info_panel:text({
		name = "desc",
		align = "left",
		wrap = true,
		wrap_mode = true,
		text = managers.localization:text("achievement_".. item.name .."_desc"),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size / 1.75,
		color = unlocked and tweak_data.screen_colors.text or tweak_data.screen_colors.text:with_alpha(tracked and 1 or 0.6)
	})
	desc:set_left(title:left())
	desc:set_top(title:bottom() + 5)
	desc:set_h(tweak_data.menu.pd2_medium_font_size * 2)
	desc:set_w(info_panel:w() / width_max)
	
	local unlock_time = info_panel:text({
		name = "unlock_time",
		text = "--/--/--",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = title_color,
		visible = unlocked,
	})
	make_fine_text(unlock_time)
	unlock_time:set_center_y(info_panel:h() / 2)
	unlock_time:set_right(info_panel:w() - 20)

	if persistent_stat(item.name) then
		local function session_killed_by_weapon_category(category)
			for weapon_id, data in pairs(managers.statistics._global.session.killed_by_weapon) do
				if tweak_data.weapon[weapon_id].category == category then
					return data.count
				end
			end
		end
	
		local stat_data = tweak_data.achievement.persistent_stat_unlocks[persistent_stat(item.name)][1]
		local killed = managers.statistics._global.session.killed.total.count - managers.statistics._global.session.killed.civilian.count - managers.statistics._global.session.killed.civilian_female.count or 0
		local killed_melee = managers.statistics._global.session.killed.total.melee - managers.statistics._global.session.killed.civilian.melee - managers.statistics._global.session.killed.civilian_female.melee or 0
		local current_stat = Global.blackmarket_manager.IngameAchievments and Global.blackmarket_manager.IngameAchievments[persistent_stat(item.name)] or stat_data.killed_shots and killed or stat_data.killed_melee and killed_melee or stat_data.killed_category and session_killed_by_weapon_category(stat_data.killed_category) or 0
		local max_stat = stat_data.at or 100
		
		current_stat = current_stat > max_stat and max_stat or current_stat
		
		local achievement_failed = nil
		if stat_data.used_weapons then
			for _, weapon_id in ipairs(managers.statistics:session_used_weapons()) do
				if not tweak_data.weapon[weapon_id] or not table.contains(stat_data.used_weapons, tweak_data.weapon[weapon_id].category) then
					achievement_failed = true
				end
			end
		end
		
		if stat_data.fail == "shots" and managers.statistics._global.session.killed.total.count > 0 and managers.statistics._global.session.killed.total.count ~= managers.statistics._global.session.killed.total.melee then
			achievement_failed = true
		end

		local hit_accuracy = stat_data.hit_accuracy and ", " .. managers.statistics:session_hit_accuracy() .. "%" or ""
		local kill_stats = "(" .. current_stat .. "/" .. max_stat .. ")"
		local progress_text = kill_stats .. hit_accuracy
		local progress_line_color = current_stat >= max_stat and tweak_data.screen_colors.friend_color:with_alpha(0.5) or tweak_data.screen_colors.button_stage_3
		
		if achievement_failed then
			progress_line_color = tweak_data.screen_colors.important_2
			progress_text = managers.localization:text("ingame_achievements_failed")
			current_stat = 1
			max_stat = 1
		end

		local padding = 10
		local progress_bar = info_panel:panel({
			name = "progress_bar",
			h = 25,
			visible = not unlocked
		})
		progress_bar:set_width(info_panel:w() / 5)
		progress_bar:set_right(info_panel:w() - 20)
		progress_bar:set_center_y(info_panel:h() / 2)
		
		progress_bar:rect({
			color = Color.black,
			blend_mode = "normal",
			alpha = 0.3
		})

		BoxGuiObject:new(progress_bar, {sides = {2, 2, 2, 2}})
	
		local progress_line = progress_bar:rect({
			h = progress_bar:h() - padding,
			color = progress_line_color,
			blend_mode = "add"
		})
		progress_line:set_center_y(progress_bar:h() / 2)
		local full = progress_bar:w() - padding
		progress_line:set_w(full * (current_stat / max_stat))
		progress_line:set_left(5)
		local progress = progress_bar:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size * 0.9,
			text = progress_text,
			color = Color.white:with_alpha(0.6),
			layer = 1
		})

		make_fine_text(progress)
		local _, _, w, _ = progress:text_rect()
		while w > full do
			progress:set_font_size(progress:font_size() * 0.99)
			_, _, w, _ = progress:text_rect()
		end
		make_fine_text(progress)
		
		progress:set_center_x(progress_bar:w() / 2)
		progress:set_center_y(progress_bar:h() / 2)
	end
end

Hooks:PostHook(HUDStatsScreen, "show", "IngameAchievments.HUDStatsScreen.show", function(self)
	if alive(self._full_hud_panel) then
		self:create_tracker_old()
	end
end)

Hooks:PostHook(HUDStatsScreen, "loot_value_updated", "IngameAchievments.HUDStatsScreen.loot_value_updated", function(self)
	if alive(self._full_hud_panel) then
		self:create_tracker_old()
	end
end)


function HUDStatsScreen:create_tracker_old()
	if alive(self._achievements_tracker) then
		self._achievements_tracker:stop()
		self._achievements_tracker:clear()
	end
	
	local left_panel = self._full_hud_panel:child("left_panel")
	local left_bg = left_panel:child("blur_bg")
	self._achievements_tracker = left_panel:panel({
		x = left_bg:x(),
		y = left_bg:y(),
		w = left_bg:w(),
		h = left_bg:h(),
		layer = 1,
	})
	
	local achievements_panel_bottom = 0

	local achieves = managers.achievment:get_force_tracked() or {}
	for k, v in pairs(achieves) do
		local item = {index = k, name = v}
		
		local achievement_panel = self._achievements_tracker:panel({
			y = 70 * (k - 1),
			h = 70
		})
		create_achievement_gui(achievement_panel, item)
		self._achievements_tracker:set_h(achievement_panel:bottom() < 700 and achievement_panel:bottom() or 700)
	end

	if #achieves > 0 then
		left_panel:child("objectives_title"):hide()
		left_panel:child("objectives_panel"):hide()
	else
		left_panel:child("objectives_title"):show()
		left_panel:child("objectives_panel"):show()
	end
	
	if #achieves > 5 then
		left_panel:child("loot_wrapper_panel"):hide()
	else
		left_panel:child("loot_wrapper_panel"):show()
	end
end