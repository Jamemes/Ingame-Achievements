if type(StatisticsManager.completed_job) == "function" then
	local data = StatisticsManager.completed_job
	function StatisticsManager:completed_job(job_id, difficulty, require_one_down)
		local completed_job = tweak_data.achievement.jobs_to_complete_by_achievements[job_id .. "_" .. difficulty .. (require_one_down and "_OD" or "")]
		if Global.blackmarket_manager.IngameAchievments[completed_job] then
			return data(self, job_id, difficulty, require_one_down)
		else
			return 0
		end
	end
end