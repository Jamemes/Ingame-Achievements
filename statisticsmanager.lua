local data = StatisticsManager.completed_job
function StatisticsManager:completed_job(job_id, difficulty, require_one_down)
	local stat_name = "completed"
	stat_name = stat_name .. "_" .. tostring(job_id)
	stat_name = stat_name .. "_" .. tostring(difficulty)
	stat_name = stat_name .. (require_one_down and "_od" or "")
	if not Global.blackmarket_manager.IngameAchievments or (Global.blackmarket_manager.IngameAchievments and Global.blackmarket_manager.IngameAchievments[stat_name]) then
		return data(self, job_id, difficulty, require_one_down)
	else
		return 0
	end
end

Hooks:PreHook(StatisticsManager, "stop_session", "IngameAchievments.StatisticsManager.stop_session.PostHook", function(self, data)
	local job_id = managers.job:current_job_id()
	local can_record_session = job_id and data and true or false
	can_record_session = can_record_session and not (managers.mutators and managers.mutators:should_disable_statistics())

	if can_record_session then
		local stat_name = "completed"
		stat_name = stat_name .. "_" .. tostring(job_id)
		stat_name = stat_name .. "_" .. tostring(Global.game_settings.difficulty)
		stat_name = stat_name .. (Global.game_settings.one_down and "_od" or "")

		if data.type == "victory" and managers.job:on_last_stage() and Global.statistics_manager.playing_from_start and not Global.blackmarket_manager.IngameAchievments[stat_name] then
			Global.blackmarket_manager.IngameAchievments[stat_name] = os.time()
		end
	end
end)