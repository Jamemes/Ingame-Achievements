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