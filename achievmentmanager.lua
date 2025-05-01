local function award_achievement(id)
	if not IngameAchievements.awards[id] then
		local head = managers.localization:to_upper_text("hud_achieved_popup")
		local text = managers.localization:to_upper_text("achievement_" .. id) .. "\n" .. managers.localization:text("achievement_".. id .. "_desc")
		local icon = tweak_data.achievement.visual and tweak_data.achievement.visual[id] and tweak_data.achievement.visual[id].icon_id or "generic_achievement_icon"
		
		if HudChallengeNotification then
			if icon and tweak_data.achievement.IngameAchievements_icons then
				tweak_data.hud_icons.generic_achievement_icon = {
					texture = tweak_data.achievement.IngameAchievements_icons[id][1],
					texture_rect = tweak_data.achievement.IngameAchievements_icons[id][2]
				}
			end
			
			HudChallengeNotification.queue(head, text, icon)
		end
		
		IngameAchievements.awards.time = IngameAchievements.awards.time or {}
		IngameAchievements.awards.time[id] = os.date("%d %b %Y %H:%M")
		IngameAchievements.awards[id] = true
		IngameAchievements:Save()
	end
end

Hooks:PreHook(AchievmentManager, "award_progress", "IngameAchievments.award_progress", function(self, stat, value)
	if not IngameAchievements.awards[stat:gsub("_stats", ""):gsub("_stat", "")] then
		IngameAchievements.awards.stats = IngameAchievements.awards.stats or {}
		IngameAchievements.awards.stats[stat] = (IngameAchievements.awards.stats[stat] or 0) + (value or 1)
		IngameAchievements:Save()
	end

	local max_stat = tweak_data.persistent_stat_unlocks[stat] and tweak_data.persistent_stat_unlocks[stat][1].at or 100
	if IngameAchievements.awards.stats and IngameAchievements.awards.stats[stat] and IngameAchievements.awards.stats[stat] >= max_stat then
		IngameAchievements.awards.stats[stat] = nil
		if table.size(IngameAchievements.awards.stats) == 0 then
			IngameAchievements.awards.stats = nil
		end
		award_achievement(tweak_data.persistent_stat_unlocks[stat][1].award)
	end
end)

Hooks:PreHook(AchievmentManager, "award", "IngameAchievments.award", function(self, id)
	award_achievement(id)
end)