for stat, unlocks in pairs(tweak_data.achievement.persistent_stat_unlocks) do
	for _, v in pairs(unlocks) do
		local data = tweak_data.achievement.visual[v.award]

		if type(data.progress) == "table" then
			data.progress.get = function()
				return Global.achievment_manager and Global.achievment_manager.achievement_progress and Global.achievment_manager.achievement_progress[stat] or 0
			end
		end
	end
end

tweak_data.achievement.jobs_to_complete_by_achievements = {}
for _, stat in pairs(tweak_data.achievement.complete_heist_achievements) do
	if table.size(stat) == (stat.one_down and 4 or 3) and stat.award and (stat.job or stat.jobs) and stat.difficulty then
		local one_down = stat.one_down and "_OD" or ""
		if stat.jobs then
			for _, job in pairs(stat.jobs) do
				tweak_data.achievement.jobs_to_complete_by_achievements[job .. "_" .. stat.difficulty[1] .. one_down] = stat.award
			end
		elseif stat.job then
			tweak_data.achievement.jobs_to_complete_by_achievements[stat.job .. "_" .. stat.difficulty[1] .. one_down] = stat.award
		end
	end
end