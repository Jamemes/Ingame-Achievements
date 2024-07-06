local function award_achievement(id)
	if not IngameAchievements.awards[id] then
	
		local head = managers.localization:to_upper_text("hud_achieved_popup")
		local text = managers.localization:to_upper_text("achievement_" .. id) .. "\n" .. managers.localization:text("achievement_".. id .. "_desc")
		local icon = tweak_data.achievement.visual and tweak_data.achievement.visual[id] and tweak_data.achievement.visual[id].icon_id or "generic_achievement_icon"
		
		if HudChallengeNotification then
			HudChallengeNotification.queue(head, text, icon)
		elseif managers.hud and managers.hud.achievement_popup then
			managers.hud:achievement_popup(id)
		end
		
		IngameAchievements.awards[id] = true
		IngameAchievements:Save()
	end
end

local data = AchievmentManager.award_progress
function AchievmentManager:award_progress(stat, value)
	if not IngameAchievements.awards[stat:gsub("_stats", ""):gsub("_stat", "")] then
		IngameAchievements.awards.stats = IngameAchievements.awards.stats or {}
		IngameAchievements.awards.stats[stat] = IngameAchievements.awards.stats[stat] and IngameAchievements.awards.stats[stat] + (value or 1) or (value or 1)
		IngameAchievements:Save()
	end

	if IngameAchievements.awards.stats and IngameAchievements.awards.stats[stat] and IngameAchievements.awards.stats[stat] >= (tweak_data.persistent_stat_unlocks[stat][1].at or 100) then
		IngameAchievements.awards.stats[stat] = nil
		if table.size(IngameAchievements.awards.stats) == 0 then
			IngameAchievements.awards.stats = nil
		end
		award_achievement(tweak_data.persistent_stat_unlocks[stat][1].award)
	end
	
	data(self, stat, value)
end

local data = AchievmentManager.award
function AchievmentManager:award(id)
	award_achievement(id)
	data(self, id)
end