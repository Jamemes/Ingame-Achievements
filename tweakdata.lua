if type(NarrativeTweakData.job_data) ~= "function" then
	function NarrativeTweakData:job_data(job_id, unique_to_job)
		if not job_id or not self.jobs[job_id] then
			return
		end

		if unique_to_job then
			return self.jobs[job_id]
		end

		if self.jobs[job_id].wrapped_to_job then
			return self.jobs[self.jobs[job_id].wrapped_to_job]
		end

		return self.jobs[job_id]
	end
end

if type(NarrativeTweakData.has_job_wrapper) ~= "function" then
	function NarrativeTweakData:has_job_wrapper(job_id)
		return self.jobs[job_id] and not not self.jobs[job_id].job_wrapper
	end
end

if type(TweakData.get_raw_value) ~= "function" then
	function TweakData:get_raw_value(...)
		local arg = {
			...
		}
		local value = self
		local v = nil

		for i = 1, #arg do
			v = arg[i]

			if not value[v] then
				return nil, v, i
			end

			value = value[v]
		end

		return value
	end
end

if type(init_auto_generated_achievement_data) ~= "function" then
	if (blt and blt.db_create_entry) or (DB and DB.create_entry) then
		dofile(ModPath .. string.lower("components/tweakdata_icons_sblt.lua"))
	else
		dofile(ModPath .. string.lower("components/tweakdata_icons.lua"))
	end

	function HudIconsTweakData:get_texture(texture_path)
		local icon_data = self[texture_path]

		if not icon_data then
			return texture_path
		end

		return icon_data.texture, icon_data.texture_rect
	end

	function init_auto_generated_achievement_data(tags)
		return {
			bob_2 = {
				icon_id = "C_Elephant_H_ElectionDay_Pro_AllDiffs_D5",
				ladder = "H_ElectionDay",
				sort_name = "C_Elephant_H_ElectionDay_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			born_2 = {
				icon_id = "C_Elephant_H_Biker_Pro_AllDiffs_D5",
				ladder = "H_Biker",
				sort_name = "C_Elephant_H_Biker_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			bulldog_3 = {
				icon_id = "C_Dentist_H_HoxtonBreakout_Pro_AllDiffs_D5",
				ladder = "H_HoxBreakout",
				sort_name = "C_Dentist_H_HoxtonBreakout_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			death_10 = {
				icon_id = "C_Elephant_H_FramingFrame_Pro_AllDiffs_D5",
				ladder = "H_FramingFrame",
				sort_name = "C_Elephant_H_FramingFrame_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			death_6 = {
				icon_id = "C_Hector_H_Watchdogs_Pro_AllDiffs_D5",
				ladder = "H_Watchdogs",
				sort_name = "C_Hector_H_Watchdogs_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			death_7 = {
				icon_id = "C_Hector_H_Rats_Pro_AllDiffs_D5",
				ladder = "H_Rats",
				sort_name = "C_Hector_H_Rats_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			death_8 = {
				icon_id = "C_Hector_H_Firestarter_Pro_AllDiffs_D5",
				ladder = "H_Firestarter",
				sort_name = "C_Hector_H_Firestarter_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			peta_1_prof = {
				icon_id = "C_Vlad_H_GoatSim_Pro_AllDiffs_D5",
				ladder = "H_GoatSim",
				sort_name = "C_Vlad_H_GoatSim_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			pig_6 = {
				icon_id = "C_Dentist_H_HotlineMiami_Pro_AllDiffs_D5",
				ladder = "H_HotlineMiami",
				sort_name = "C_Dentist_H_HotlineMiami_Pro_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			sinus_2 = {
				icon_id = "C_Vlad_H_Aftershock_AllDiffs_D5",
				ladder = "H_After",
				sort_name = "C_Vlad_H_Aftershock_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			pick_45 = {
				icon_id = "C_Vlad_H_Aftershock_AllDiffs_D4",
				ladder = "H_After",
				sort_name = "C_Vlad_H_Aftershock_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			axe_45 = {
				icon_id = "C_Vlad_H_Aftershock_AllDiffs_D6",
				ladder = "H_After",
				sort_name = "C_Vlad_H_Aftershock_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			sinus_1 = {
				additional_id = true,
				sort_name = "C_Vlad_H_Aftershock_FourHundredBucks",
				icon_id = "C_Vlad_H_Aftershock_FourHundredBucks",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.contracts.vlad
				}
			},
			no_turning_back = {
				sort_name = "C_All_H_All_01Job_D0",
				icon_id = "C_All_H_All_01Job_D0",
				tags = {
					tags.progress.completion,
					tags.progress.beginner,
					tags.difficulty.normal,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			death_30 = {
				need_unlock_icons = true,
				icon_id = "C_All_H_All_AllJobs_D5",
				progress = true,
				ladder = "C_All",
				sort_name = "C_All_H_All_AllJobs_D5",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.all
				}
			},
			death_27 = {
				need_unlock_icons = true,
				icon_id = "C_All_H_All_AllJobs_D1",
				progress = true,
				ladder = "C_All",
				sort_name = "C_All_H_All_AllJobs_D1",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.all
				}
			},
			pick_66 = {
				need_unlock_icons = true,
				icon_id = "C_All_H_All_AllJobs_D4",
				progress = true,
				ladder = "C_All",
				sort_name = "C_All_H_All_AllJobs_D4",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.all
				}
			},
			axe_66 = {
				need_unlock_icons = true,
				icon_id = "C_All_H_All_AllJobs_D6",
				progress = true,
				ladder = "C_All",
				sort_name = "C_All_H_All_AllJobs_D6",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.all
				}
			},
			death_29 = {
				need_unlock_icons = true,
				icon_id = "C_All_H_All_AllJobs_D3",
				progress = true,
				ladder = "C_All",
				sort_name = "C_All_H_All_AllJobs_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.all
				}
			},
			death_28 = {
				need_unlock_icons = true,
				icon_id = "C_All_H_All_AllJobs_D2",
				progress = true,
				ladder = "C_All",
				sort_name = "C_All_H_All_AllJobs_D2",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.very_hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.all
				}
			},
			death_26 = {
				icon_id = "C_Bain_H_All_AllDiffs_D5",
				progress = true,
				ladder = "C_Bain",
				sort_name = "C_Bain_H_All_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_65 = {
				icon_id = "C_Bain_H_All_AllDiffs_D4",
				progress = true,
				ladder = "C_Bain",
				sort_name = "C_Bain_H_All_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_65 = {
				icon_id = "C_Bain_H_All_AllDiffs_D6",
				progress = true,
				ladder = "C_Bain",
				sort_name = "C_Bain_H_All_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			death_9 = {
				icon_id = "C_Hector_H_All_AllDiffs_D5",
				progress = true,
				ladder = "C_Hector",
				sort_name = "C_Hector_H_All_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			pick_63 = {
				icon_id = "C_Hector_H_All_AllDiffs_D4",
				progress = true,
				ladder = "C_Hector",
				sort_name = "C_Hector_H_All_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			axe_63 = {
				icon_id = "C_Hector_H_All_AllDiffs_D6",
				progress = true,
				ladder = "C_Hector",
				sort_name = "C_Hector_H_All_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			death_12 = {
				icon_id = "C_Elephant_H_All_AllDiffs_D5",
				progress = true,
				ladder = "C_Elephant",
				sort_name = "C_Elephant_H_All_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			pick_64 = {
				icon_id = "C_Elephant_H_All_AllDiffs_D4",
				progress = true,
				ladder = "C_Elephant",
				sort_name = "C_Elephant_H_All_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			axe_64 = {
				icon_id = "C_Elephant_H_All_AllDiffs_D6",
				progress = true,
				ladder = "C_Elephant",
				sort_name = "C_Elephant_H_All_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			death_5 = {
				icon_id = "C_Vlad_H_All_AllDiffs_D5",
				progress = true,
				ladder = "C_Vlad",
				sort_name = "C_Vlad_H_All_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			pick_62 = {
				icon_id = "C_Vlad_H_All_AllDiffs_D4",
				progress = true,
				ladder = "C_Vlad",
				sort_name = "C_Vlad_H_All_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			axe_62 = {
				icon_id = "C_Vlad_H_All_AllDiffs_D6",
				progress = true,
				ladder = "C_Vlad",
				sort_name = "C_Vlad_H_All_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			guilty_of_crime = {
				icon_id = "C_All_H_All_AllLevel010",
				progress = true,
				ladder = "Level",
				sort_name = "C_Any_H_All_AllLevel009",
				tags = {tags.progress.leveling}
			},
			most_wanted = {
				icon_id = "C_All_H_All_AllLevel100",
				progress = true,
				ladder = "Level",
				sort_name = "C_Any_H_All_AllLevel099",
				tags = {tags.progress.leveling}
			},
			gone_in_30_seconds = {
				icon_id = "C_All_H_All_AllLevel025",
				progress = true,
				ladder = "Level",
				sort_name = "C_Any_H_All_AllLevel024",
				tags = {tags.progress.leveling}
			},
			you_gotta_start_somewhere = {
				icon_id = "C_All_H_All_AllLevel005",
				progress = true,
				ladder = "Level",
				sort_name = "C_Any_H_All_AllLevel004",
				tags = {tags.progress.leveling}
			},
			armed_and_dangerous = {
				icon_id = "C_All_H_All_AllLevel050",
				progress = true,
				ladder = "Level",
				sort_name = "C_Any_H_All_AllLevel049",
				tags = {tags.progress.leveling}
			},
			big_shot = {
				icon_id = "C_All_H_All_AllLevel075",
				progress = true,
				ladder = "Level",
				sort_name = "C_Any_H_All_AllLevel074",
				tags = {tags.progress.leveling}
			},
			ignominy_18 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_17",
				icon_id = "C_All_H_All_Infamy_18",
				tags = {tags.progress.leveling}
			},
			ignominy_7 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_06",
				icon_id = "C_All_H_All_Infamy_07",
				tags = {tags.progress.leveling}
			},
			ignominy_10 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_09",
				icon_id = "C_All_H_All_Infamy_10",
				tags = {tags.progress.leveling}
			},
			ignominy_14 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_13",
				icon_id = "C_All_H_All_Infamy_14",
				tags = {tags.progress.leveling}
			},
			ignominy_5 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_04",
				icon_id = "C_All_H_All_Infamy_05",
				tags = {tags.progress.leveling}
			},
			ignominy_1 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_00",
				icon_id = "C_All_H_All_Infamy_01",
				tags = {tags.progress.leveling}
			},
			ignominy_13 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_12",
				icon_id = "C_All_H_All_Infamy_13",
				tags = {tags.progress.leveling}
			},
			ignominy_4 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_03",
				icon_id = "C_All_H_All_Infamy_04",
				tags = {tags.progress.leveling}
			},
			ignominy_19 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_18",
				icon_id = "C_All_H_All_Infamy_19",
				tags = {tags.progress.leveling}
			},
			ignominy_8 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_07",
				icon_id = "C_All_H_All_Infamy_08",
				tags = {tags.progress.leveling}
			},
			ignominy_2 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_01",
				icon_id = "C_All_H_All_Infamy_02",
				tags = {tags.progress.leveling}
			},
			ignominy_16 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_15",
				icon_id = "C_All_H_All_Infamy_16",
				tags = {tags.progress.leveling}
			},
			ignominy_17 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_16",
				icon_id = "C_All_H_All_Infamy_17",
				tags = {tags.progress.leveling}
			},
			ignominy_15 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_14",
				icon_id = "C_All_H_All_Infamy_15",
				tags = {tags.progress.leveling}
			},
			ignominy_6 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_05",
				icon_id = "C_All_H_All_Infamy_06",
				tags = {tags.progress.leveling}
			},
			ignominy_9 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_08",
				icon_id = "C_All_H_All_Infamy_09",
				tags = {tags.progress.leveling}
			},
			ignominy_3 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_02",
				icon_id = "C_All_H_All_Infamy_03",
				tags = {tags.progress.leveling}
			},
			ignominy_12 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_11",
				icon_id = "C_All_H_All_Infamy_12",
				tags = {tags.progress.leveling}
			},
			ignominy_11 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_10",
				icon_id = "C_All_H_All_Infamy_11",
				tags = {tags.progress.leveling}
			},
			ignominy_20 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_19",
				icon_id = "C_All_H_All_Infamy_20",
				tags = {tags.progress.leveling}
			},
			ignominy_25 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_24",
				icon_id = "C_All_H_All_Infamy_25",
				tags = {tags.progress.leveling}
			},
			ignominy_21 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_20",
				icon_id = "C_All_H_All_Infamy_21",
				tags = {tags.progress.leveling}
			},
			ignominy_24 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_23",
				icon_id = "C_All_H_All_Infamy_24",
				tags = {tags.progress.leveling}
			},
			ignominy_22 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_21",
				icon_id = "C_All_H_All_Infamy_22",
				tags = {tags.progress.leveling}
			},
			ignominy_23 = {
				ladder = "Infamy",
				sort_name = "C_Any_H_All_Infamy_22",
				icon_id = "C_All_H_All_Infamy_23",
				tags = {tags.progress.leveling}
			},
			slakt_2 = {
				sort_name = "Other_H_Any_Nothing",
				icon_id = "Other_H_Any_Nothing",
				tags = {
					tags.progress.generic,
					tags.tactics.stealth
				}
			},
			gage4_1 = {
				additional_id = true,
				sort_name = "Other_H_Any_PoliceBrutality",
				icon_id = "Other_H_Any_PoliceBrutality",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			murphys_laws = {
				sort_name = "Other_H_Any_IGotIt",
				icon_id = "Other_H_Any_IGotIt",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4
				}
			},
			gage_10 = {
				sort_name = "Other_H_Any_ShareTheLove",
				icon_id = "Other_H_Any_ShareTheLove",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.weapon
				}
			},
			bob_10 = {
				sort_name = "Other_H_Any_GhostRiders",
				icon_id = "Other_H_Any_GhostRiders",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.teamwork.players_4
				}
			},
			gmod_2 = {
				icon_id = "Other_H_Any_BullsEye",
				progress = true,
				sort_name = "Other_H_Any_BullsEye",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			gmod_3 = {
				icon_id = "Other_H_Any_MySpiderSense",
				progress = true,
				sort_name = "Other_H_Any_MySpiderSense",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			gmod_4 = {
				icon_id = "Other_H_Any_EagleEyes",
				progress = true,
				sort_name = "Other_H_Any_EagleEyes",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			gmod_5 = {
				icon_id = "Other_H_Any_LikeABoy",
				progress = true,
				sort_name = "Other_H_Any_LikeABoy",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			gmod_1 = {
				icon_id = "Other_H_Any_PrayingMantis",
				progress = true,
				sort_name = "Other_H_Any_PrayingMantis",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			charliesierra_9 = {
				additional_id = true,
				sort_name = "Other_H_Any_Reindeer",
				icon_id = "Other_H_Any_Reindeer",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.teamwork.players_4
				}
			},
			turtles_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Shuriken",
				sort_name = "Other_H_Any_Shuriken",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.inventory.weapon
				}
			},
			gage4_11 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_NoHeist",
				sort_name = "Other_H_Any_NoHeist",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			gage4_5 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Shotgun",
				sort_name = "Other_H_Any_Shotgun",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			steel_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Heisters_D3",
				sort_name = "Other_H_Any_Heisters_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.inventory.weapon,
					tags.inventory.armor,
					tags.teamwork.players_4
				}
			},
			gage4_3 = {
				sort_name = "Other_H_Any_Swing",
				icon_id = "Other_H_Any_Swing",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			brooklyn_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_INeverAsked",
				sort_name = "Other_H_Any_INeverAsked",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			gmod_6 = {
				additional_id = true,
				sort_name = "Other_H_Any_ThereAndBack",
				icon_id = "Other_H_Any_ThereAndBack",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			fort_2 = {
				sort_name = "Other_H_Any_Pink",
				icon_id = "Other_H_Any_Pink",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			brooklyn_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_JumpJump",
				sort_name = "Other_H_Any_JumpJump",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			ovk_3 = {
				additional_id = true,
				sort_name = "Other_H_Any_OhThatsHow",
				icon_id = "Other_H_Any_OhThatsHow",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			scorpion_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Hedgehog",
				sort_name = "Other_H_Any_Hedgehog",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			gage4_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_SevenEleven",
				sort_name = "Other_H_Any_SevenEleven",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			turtles_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_NamesAreFor",
				sort_name = "Other_H_Any_NamesAreFor",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			grill_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_DiscoInferno",
				sort_name = "Other_H_Any_DiscoInferno",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			mad_5 = {
				sort_name = "Other_H_Any_Megalo",
				icon_id = "Other_H_Any_Megalo",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.skill,
					tags.teamwork.players_4
				}
			},
			turtles_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Fugu",
				sort_name = "Other_H_Any_Fugu",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			gage4_9 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_ShockAndAwe",
				sort_name = "Other_H_Any_ShockAndAwe",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			bulldog_4 = {
				sort_name = "Other_H_Any_Cavity",
				icon_id = "Other_H_Any_Cavity",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.weapon
				}
			},
			brooklyn_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Bunnyhopping",
				sort_name = "Other_H_Any_Bunnyhopping",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			brooklyn_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_IWant",
				progress = true,
				sort_name = "Other_H_Any_IWant",
				unlock_id = true,
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			gage4_10 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Bang",
				progress = true,
				sort_name = "Other_H_Any_Bang",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_12 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Surprise",
				progress = true,
				sort_name = "Other_H_Any_Surprise",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage5_9 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Rabbit",
				progress = true,
				sort_name = "Other_H_Any_Rabbit",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			berry_5 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_NoScope",
				progress = true,
				sort_name = "Other_H_Any_NoScope",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage2_4 = {
				sort_name = "Other_H_Any_KillinsAsEasy",
				icon_id = "Other_H_Any_KillinsAsEasy",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_13 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_DidntSee",
				progress = true,
				sort_name = "Other_H_Any_DidntSee",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			eagle_5 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Bullet",
				sort_name = "Other_H_Any_Bullet",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			grill_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_NotInvited",
				sort_name = "Other_H_Any_NotInvited",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_10 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Maximum",
				progress = true,
				sort_name = "Other_H_Any_Maximum",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			steel_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TheirArmor",
				progress = true,
				sort_name = "Other_H_Any_TheirArmor",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage4_8 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_ClayPigeon",
				progress = true,
				sort_name = "Other_H_Any_ClayPigeon",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			ameno_8 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TheCollector",
				progress = true,
				sort_name = "Other_H_Any_TheCollector",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			turtles_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Swiss",
				progress = true,
				sort_name = "Other_H_Any_Swiss",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage_5 = {
				icon_id = "Other_H_Any_Inception",
				progress = true,
				sort_name = "Other_H_Any_Inception",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage_7 = {
				icon_id = "Other_H_Any_AboveTheLaw",
				progress = true,
				sort_name = "Other_H_Any_AboveTheLaw",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage_6 = {
				icon_id = "Other_H_Any_HardCorps",
				progress = true,
				sort_name = "Other_H_Any_HardCorps",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			ovk_7 = {
				sort_name = "Other_H_Any_OneHoundredTwenty",
				icon_id = "Other_H_Any_OneHoundredTwenty",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon,
					tags.teamwork.players_4
				}
			},
			gage3_16 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_DoubleKill",
				progress = true,
				sort_name = "Other_H_Any_DoubleKill",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage5_10 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TourDeClarion",
				progress = true,
				sort_name = "Other_H_Any_TourDeClarion",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage2_5 = {
				sort_name = "Other_H_Any_TheyDrewFirst",
				icon_id = "Other_H_Any_TheyDrewFirst",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage5_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Precision",
				progress = true,
				sort_name = "Other_H_Any_Precision",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			eagle_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_DeathFrom",
				progress = true,
				sort_name = "Other_H_Any_DeathFrom",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage5_5 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Artillery",
				progress = true,
				sort_name = "Other_H_Any_Artillery",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_7 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_FarFar",
				progress = true,
				sort_name = "Other_H_Any_FarFar",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_15 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_YouCant",
				progress = true,
				sort_name = "Other_H_Any_YouCant",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			eagle_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_SpecialOp",
				progress = true,
				sort_name = "Other_H_Any_SpecialOp",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_14 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_ATaste",
				progress = true,
				sort_name = "Other_H_Any_ATaste",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage5_8 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Hammertime",
				progress = true,
				sort_name = "Other_H_Any_Hammertime",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_17 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_PublicEnemy",
				progress = true,
				sort_name = "Other_H_Any_PublicEnemy",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			scorpion_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TheNobel",
				sort_name = "Other_H_Any_TheNobel",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_9 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TripleKill",
				sort_name = "Other_H_Any_TripleKill",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			pim_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_NothingPersonal_D3",
				progress = true,
				sort_name = "Other_H_Any_NothingPersonal_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			armored_5 = {
				icon_id = "Other_H_Any_License",
				progress = true,
				sort_name = "Other_H_Any_License",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage4_6 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_KnockKnock",
				progress = true,
				sort_name = "Other_H_Any_KnockKnock",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			scorpion_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_FastestGun",
				sort_name = "Other_H_Any_FastestGun",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_2 = {
				icon_id = "Other_H_Any_TheManWith",
				progress = true,
				sort_name = "Other_H_Any_TheManWith",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			halloween_8 = {
				icon_id = "Other_H_Any_ThePumpkinKing",
				progress = true,
				sort_name = "Other_H_Any_ThePumpkinKing",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			steel_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_BlackKnight",
				sort_name = "Other_H_Any_BlackKnight",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage2_10 = {
				sort_name = "Other_H_Any_AreYouKidding",
				icon_id = "Other_H_Any_AreYouKidding",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage2_7 = {
				sort_name = "Other_H_Any_Dont",
				icon_id = "Other_H_Any_Dont",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage2_2 = {
				sort_name = "Other_H_Any_Cloak",
				icon_id = "Other_H_Any_Cloak",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			steel_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Skewer",
				sort_name = "Other_H_Any_Skewer",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage2_6 = {
				sort_name = "Other_H_Any_InTown",
				icon_id = "Other_H_Any_InTown",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage5_7 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_NotToday",
				sort_name = "Other_H_Any_NotToday",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage5_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_BigBadaBoom",
				sort_name = "Other_H_Any_BigBadaBoom",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			payback_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_IAmAn",
				sort_name = "Other_H_Any_IAmAn",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gorilla_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Knockout",
				sort_name = "Other_H_Any_Knockout",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			ovk_9 = {
				sort_name = "Other_H_Any_BringYourCop_D3",
				icon_id = "Other_H_Any_BringYourCop_D3",
				tags = {
					tags.progress.generic,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4
				}
			},
			gage5_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_SoMany",
				sort_name = "Other_H_Any_SoMany",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.inventory.weapon
				}
			},
			gage4_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_LockStock",
				sort_name = "Other_H_Any_LockStock",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.inventory.weapon
				}
			},
			gage3_11 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Dodge",
				progress = true,
				sort_name = "Other_H_Any_Dodge",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Sinper_Kills_100",
				progress = true,
				ladder = "Sinper_Kills",
				sort_name = "Other_H_Any_Sinper_Kills_100",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_5 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Sinper_Kills_250",
				progress = true,
				ladder = "Sinper_Kills",
				sort_name = "Other_H_Any_Sinper_Kills_250",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Sinper_Kills_050",
				progress = true,
				ladder = "Sinper_Kills",
				sort_name = "Other_H_Any_Sinper_Kills_050",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_6 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Sinper_Kills_500",
				progress = true,
				ladder = "Sinper_Kills",
				sort_name = "Other_H_Any_Sinper_Kills_500",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage3_8 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_LastAction",
				sort_name = "Other_H_Any_LastAction",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			scorpion_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_Recycling",
				progress = true,
				sort_name = "Other_H_Any_Recycling",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.weapon
				}
			},
			grill_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_OVERGRILL",
				sort_name = "Other_H_Any_OVERGRILL",
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			grill_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_StickAFork",
				sort_name = "Other_H_Any_StickAFork",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage2_9 = {
				sort_name = "Other_H_Any_IAintGotTime_D3",
				icon_id = "Other_H_Any_IAintGotTime_D3",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			gage_9 = {
				sort_name = "Other_H_Any_FireInTheHole",
				icon_id = "Other_H_Any_FireInTheHole",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.weapon
				}
			},
			no_one_cared_who_i_was = {
				sort_name = "Other_H_Any_NoOneCared",
				icon_id = "Other_H_Any_NoOneCared",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask
				}
			},
			armored_7 = {
				icon_id = "Other_H_Any_ImNot",
				progress = true,
				sort_name = "Other_H_Any_ImNot",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			armored_8 = {
				icon_id = "Other_H_Any_IDidNot",
				progress = true,
				sort_name = "Other_H_Any_IDidNot",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.mask
				}
			},
			armored_9 = {
				icon_id = "Other_H_Any_FoolMe",
				progress = true,
				sort_name = "Other_H_Any_FoolMe",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			armored_10 = {
				icon_id = "Other_H_Any_Affordable",
				progress = true,
				sort_name = "Other_H_Any_Affordable",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.mask
				}
			},
			gage_3 = {
				icon_id = "Other_H_Any_Commando",
				progress = true,
				sort_name = "Other_H_Any_Commando",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			gage_4 = {
				icon_id = "Other_H_Any_PublicEnemies",
				progress = true,
				sort_name = "Other_H_Any_PublicEnemies",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			gage_1 = {
				icon_id = "Other_H_Any_Wanted",
				progress = true,
				sort_name = "Other_H_Any_Wanted",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			gage_2 = {
				icon_id = "Other_H_Any_ThreeThousandMiles",
				progress = true,
				sort_name = "Other_H_Any_ThreeThousandMiles",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			halloween_5 = {
				sort_name = "Other_H_Any_ItsAlive",
				icon_id = "Other_H_Any_ItsAlive",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.mask
				}
			},
			halloween_10 = {
				icon_id = "Other_H_Any_FromRussia_D3",
				progress = true,
				sort_name = "Other_H_Any_FromRussia_D3",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.inventory.mask
				}
			},
			halloween_6 = {
				sort_name = "Other_H_Any_PumpAction",
				icon_id = "Other_H_Any_PumpAction",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			halloween_7 = {
				sort_name = "Other_H_Any_NoOneCan",
				icon_id = "Other_H_Any_NoOneCan",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.inventory.mask,
					tags.inventory.weapon
				}
			},
			halloween_4 = {
				sort_name = "Other_H_Any_WitchDoctor",
				icon_id = "Other_H_Any_WitchDoctor",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.inventory.mask
				}
			},
			gage2_8 = {
				sort_name = "Other_H_Any_Holy",
				icon_id = "Other_H_Any_Holy",
				tags = {
					tags.progress.generic,
					tags.tactics.loud
				}
			},
			tango_achieve_1 = {
				additional_id = true,
				sort_name = "Other_H_Any_Ducking",
				icon_id = "Other_H_Any_Ducking",
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			tango_achieve_2 = {
				icon_id = "Other_H_Any_LetThem",
				progress = true,
				sort_name = "Other_H_Any_LetThem",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			tango_achieve_3 = {
				icon_id = "Other_H_Any_TheReconing_D2",
				progress = true,
				sort_name = "Other_H_Any_TheReconing_D2",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.difficulty.very_hard,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			tango_achieve_4 = {
				icon_id = "Other_H_Any_CelsiusOr_D3",
				progress = true,
				sort_name = "Other_H_Any_CelsiusOr_D3",
				additional_id = true,
				tags = {
					tags.progress.generic,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			cee_1 = {
				icon_id = "Other_H_Any_CrimeSpree050",
				progress = true,
				ladder = "CrimeSpree",
				sort_name = "Other_H_Any_CrimeSpree050",
				additional_id = true,
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			cee_2 = {
				icon_id = "Other_H_Any_CrimeSpree100",
				progress = true,
				ladder = "CrimeSpree",
				sort_name = "Other_H_Any_CrimeSpree100",
				additional_id = true,
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			cee_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_CrimeSpree250",
				progress = true,
				ladder = "CrimeSpree",
				sort_name = "Other_H_Any_CrimeSpree250",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			live_1 = {
				icon_id = "C_Bain_H_Arena_AllDiffs_D5",
				ladder = "H_Arena",
				sort_name = "C_Bain_H_Arena_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_43 = {
				icon_id = "C_Bain_H_Arena_AllDiffs_D4",
				ladder = "H_Arena",
				sort_name = "C_Bain_H_Arena_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_43 = {
				icon_id = "C_Bain_H_Arena_AllDiffs_D6",
				ladder = "H_Arena",
				sort_name = "C_Bain_H_Arena_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			live_2 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_Arena_SoundofSilence",
				sort_name = "C_Bain_H_Arena_SoundofSilence",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4,
					tags.contracts.bain
				}
			},
			live_4 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_Arena_FuckIt_D3",
				sort_name = "C_Bain_H_Arena_FuckIt_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.bain
				}
			},
			live_5 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_Arena_MFStev",
				sort_name = "C_Bain_H_Arena_MFStev",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.bain
				}
			},
			live_3 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_Arena_Even",
				sort_name = "C_Bain_H_Arena_Even",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			squek = {
				icon_id = "C_Bain_H_ArtGallery_AllDiffs_D5",
				ladder = "H_ArtGallery",
				sort_name = "C_Bain_H_ArtGallery_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_33 = {
				icon_id = "C_Bain_H_ArtGallery_AllDiffs_D4",
				ladder = "H_ArtGallery",
				sort_name = "C_Bain_H_ArtGallery_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_33 = {
				icon_id = "C_Bain_H_ArtGallery_AllDiffs_D6",
				ladder = "H_ArtGallery",
				sort_name = "C_Bain_H_ArtGallery_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			ameno_6 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_ArtGallery_TheTurtle",
				sort_name = "C_Bain_H_ArtGallery_TheTurtle",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.armor,
					tags.inventory.equipment,
					tags.teamwork.players_1_to_4,
					tags.contracts.bain
				}
			},
			ameno_5 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_ArtGallery_TheWolfLures",
				sort_name = "C_Bain_H_ArtGallery_TheWolfLures",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			voff_1 = {
				sort_name = "C_Bain_H_BankAny_SaintFrancis_D3",
				icon_id = "C_Bain_H_BankAny_SaintFrancis_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			death_18 = {
				icon_id = "C_Bain_H_BankC_AllDiffs_D5",
				ladder = "H_BankC",
				sort_name = "C_Bain_H_BankC_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_19 = {
				icon_id = "C_Bain_H_BankC_AllDiffs_D4",
				ladder = "H_BankC",
				sort_name = "C_Bain_H_BankC_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_19 = {
				icon_id = "C_Bain_H_BankC_AllDiffs_D6",
				ladder = "H_BankC",
				sort_name = "C_Bain_H_BankC_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			death_19 = {
				icon_id = "C_Bain_H_BankD_AllDiffs_D5",
				ladder = "H_BankD",
				sort_name = "C_Bain_H_BankD_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_20 = {
				icon_id = "C_Bain_H_BankD_AllDiffs_D4",
				ladder = "H_BankD",
				sort_name = "C_Bain_H_BankD_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_20 = {
				icon_id = "C_Bain_H_BankD_AllDiffs_D6",
				ladder = "H_BankD",
				sort_name = "C_Bain_H_BankD_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			death_17 = {
				icon_id = "C_Bain_H_BankG_AllDiffs_D5",
				ladder = "H_BankG",
				sort_name = "C_Bain_H_BankG_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_18 = {
				icon_id = "C_Bain_H_BankG_AllDiffs_D4",
				ladder = "H_BankG",
				sort_name = "C_Bain_H_BankG_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_18 = {
				icon_id = "C_Bain_H_BankG_AllDiffs_D6",
				ladder = "H_BankG",
				sort_name = "C_Bain_H_BankG_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			death_16 = {
				icon_id = "C_Bain_H_BankR_AllDiffs_D5",
				ladder = "H_BankR",
				sort_name = "C_Bain_H_BankR_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_17 = {
				icon_id = "C_Bain_H_BankR_AllDiffs_D4",
				ladder = "H_BankR",
				sort_name = "C_Bain_H_BankR_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_17 = {
				icon_id = "C_Bain_H_BankR_AllDiffs_D6",
				ladder = "H_BankR",
				sort_name = "C_Bain_H_BankR_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			berry_1 = {
				icon_id = "C_Locke_H_Beneath_AllDiffs_D5",
				ladder = "H_Beneath",
				sort_name = "C_Locke_H_Beneath_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			pick_47 = {
				icon_id = "C_Locke_H_Beneath_AllDiffs_D4",
				ladder = "H_Beneath",
				sort_name = "C_Locke_H_Beneath_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			axe_47 = {
				icon_id = "C_Locke_H_Beneath_AllDiffs_D6",
				ladder = "H_Beneath",
				sort_name = "C_Locke_H_Beneath_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			berry_4 = {
				additional_id = true,
				sort_name = "C_Locke_H_Beneath_Juggernauts_D3",
				icon_id = "C_Locke_H_Beneath_Juggernauts_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.locke
				}
			},
			berry_3 = {
				sort_name = "C_Locke_H_Beneath_Commando_D3",
				icon_id = "C_Locke_H_Beneath_Commando_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			berry_2 = {
				need_unlock_icons = true,
				icon_id = "C_Locke_H_Beneath_Clean",
				sort_name = "C_Locke_H_Beneath_Clean",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			bigbank_6 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_Backing",
				sort_name = "C_Dentist_H_BigBank_Backing",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bigbank_9 = {
				icon_id = "C_Dentist_H_BigBank_AllDiffs_D5",
				ladder = "H_BigBank",
				sort_name = "C_Dentist_H_BigBank_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			pick_30 = {
				icon_id = "C_Dentist_H_BigBank_AllDiffs_D4",
				ladder = "H_BigBank",
				sort_name = "C_Dentist_H_BigBank_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			axe_30 = {
				icon_id = "C_Dentist_H_BigBank_AllDiffs_D6",
				ladder = "H_BigBank",
				sort_name = "C_Dentist_H_BigBank_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bigbank_3 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_SweetSixteen",
				sort_name = "C_Dentist_H_BigBank_SweetSixteen",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bigbank_2 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_ItTakesAPig",
				sort_name = "C_Dentist_H_BigBank_ItTakesAPig",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			bigbank_1 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_ItTakesTwo",
				sort_name = "C_Dentist_H_BigBank_ItTakesTwo",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.skill,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_dentist
				}
			},
			bigbank_4 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_TwelveAngry_D1",
				sort_name = "C_Dentist_H_BigBank_TwelveAngry_D1",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.hard,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bigbank_10 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_FundingFather",
				sort_name = "C_Dentist_H_BigBank_FundingFather",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.teamwork.players_4,
					tags.contracts.the_dentist
				}
			},
			bigbank_7 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_Entrapment",
				sort_name = "C_Dentist_H_BigBank_Entrapment",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bigbank_5 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_DontBring",
				sort_name = "C_Dentist_H_BigBank_DontBring",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bigbank_8 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_BigBank_YouOweMeOne",
				sort_name = "C_Dentist_H_BigBank_YouOweMeOne",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			death_11 = {
				icon_id = "C_Elephant_H_BigOil_AllDiffs_D5",
				ladder = "H_BigOil",
				sort_name = "C_Elephant_H_BigOil_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			pick_13 = {
				icon_id = "C_Elephant_H_BigOil_AllDiffs_D4",
				ladder = "H_BigOil",
				sort_name = "C_Elephant_H_BigOil_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			axe_13 = {
				icon_id = "C_Elephant_H_BigOil_AllDiffs_D6",
				ladder = "H_BigOil",
				sort_name = "C_Elephant_H_BigOil_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			ovk_8 = {
				additional_id = true,
				sort_name = "C_Elephant_H_BigOil_BostonSaints_D3",
				icon_id = "C_Elephant_H_BigOil_BostonSaints_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_elephant
				}
			},
			ovk_6 = {
				sort_name = "C_Elephant_H_BigOil_HouseKeeping_D3",
				icon_id = "C_Elephant_H_BigOil_HouseKeeping_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			i_knew_what_i_was_doing_was_wrong = {
				sort_name = "C_Elephant_H_BigOil_IKnewWhatIDid",
				icon_id = "C_Elephant_H_BigOil_IKnewWhatIDid",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			doctor_fantastic = {
				sort_name = "C_Elephant_H_BigOil_DoctorFantastic",
				icon_id = "C_Elephant_H_BigOil_DoctorFantastic",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			gage2_1 = {
				sort_name = "C_Elephant_H_BigOil_DoctorMiserable_D3",
				icon_id = "C_Elephant_H_BigOil_DoctorMiserable_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			born_1 = {
				icon_id = "C_Elephant_H_Biker_AllDiffs_D5",
				ladder = "H_Biker",
				sort_name = "C_Elephant_H_Biker_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			pick_57 = {
				icon_id = "C_Elephant_H_Biker_AllDiffs_D4",
				ladder = "H_Biker",
				sort_name = "C_Elephant_H_Biker_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			axe_57 = {
				icon_id = "C_Elephant_H_Biker_AllDiffs_D6",
				ladder = "H_Biker",
				sort_name = "C_Elephant_H_Biker_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			born_5 = {
				need_unlock_icons = true,
				icon_id = "C_Elephant_H_Biker_FullThrottle_D3",
				sort_name = "C_Elephant_H_Biker_FullThrottle_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.the_elephant
				}
			},
			born_4 = {
				need_unlock_icons = true,
				icon_id = "C_Elephant_H_Biker_Scavenger",
				sort_name = "C_Elephant_H_Biker_Scavenger",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			born_3 = {
				need_unlock_icons = true,
				icon_id = "C_Elephant_H_Biker_LetTheMan_D3",
				sort_name = "C_Elephant_H_Biker_LetTheMan_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			born_6 = {
				need_unlock_icons = true,
				icon_id = "C_Elephant_H_Biker_EyeforanEye",
				sort_name = "C_Elephant_H_Biker_EyeforanEye",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			jerry_1 = {
				icon_id = "C_Locke_H_BirthOfSky_AllDiffs_D5",
				ladder = "H_Birth",
				sort_name = "C_Locke_H_BirthOfSky_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			pick_48 = {
				icon_id = "C_Locke_H_BirthOfSky_AllDiffs_D4",
				ladder = "H_Birth",
				sort_name = "C_Locke_H_BirthOfSky_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			axe_48 = {
				icon_id = "C_Locke_H_BirthOfSky_AllDiffs_D6",
				ladder = "H_Birth",
				sort_name = "C_Locke_H_BirthOfSky_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			jerry_5 = {
				additional_id = true,
				sort_name = "C_Locke_H_BirthOfSky_BlackTie_D3",
				icon_id = "C_Locke_H_BirthOfSky_BlackTie_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_4,
					tags.contracts.locke
				}
			},
			voff_4 = {
				sort_name = "C_Locke_H_BirthOfSky_Mellon",
				icon_id = "C_Locke_H_BirthOfSky_Mellon",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			jerry_4 = {
				need_unlock_icons = true,
				icon_id = "C_Locke_H_BirthOfSky_OneTwoThree_D3",
				sort_name = "C_Locke_H_BirthOfSky_OneTwoThree_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.locke
				}
			},
			jerry_2 = {
				sort_name = "C_Locke_H_BirthOfSky_Pinpoint",
				icon_id = "C_Locke_H_BirthOfSky_Pinpoint",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.locke
				}
			},
			jerry_3 = {
				need_unlock_icons = true,
				icon_id = "C_Locke_H_BirthOfSky_NoBlood_D3",
				sort_name = "C_Locke_H_BirthOfSky_NoBlood_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.locke
				}
			},
			mad_3 = {
				need_unlock_icons = true,
				icon_id = "C_Jimmy_H_Boiling_CrazyIvan_D2",
				sort_name = "C_Jimmy_H_Boiling_CrazyIvan_D2",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.very_hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.jimmy
				}
			},
			mad_1 = {
				icon_id = "C_Jimmy_H_Boiling_AllDiffs_D5",
				ladder = "H_Boiling",
				sort_name = "C_Jimmy_H_Boiling_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.jimmy
				}
			},
			pick_56 = {
				icon_id = "C_Jimmy_H_Boiling_AllDiffs_D4",
				ladder = "H_Boiling",
				sort_name = "C_Jimmy_H_Boiling_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.jimmy
				}
			},
			axe_56 = {
				icon_id = "C_Jimmy_H_Boiling_AllDiffs_D6",
				ladder = "H_Boiling",
				sort_name = "C_Jimmy_H_Boiling_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.jimmy
				}
			},
			mad_4 = {
				additional_id = true,
				sort_name = "C_Jimmy_H_Boiling_WhenInRussia_D3",
				icon_id = "C_Jimmy_H_Boiling_WhenInRussia_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.jimmy
				}
			},
			mad_2 = {
				need_unlock_icons = true,
				icon_id = "C_Jimmy_H_Boiling_TheGround_D3",
				sort_name = "C_Jimmy_H_Boiling_TheGround_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.jimmy
				}
			},
			pim_3 = {
				need_unlock_icons = true,
				icon_id = "C_Jimmy_H_Boiling_UMPForMe_D3",
				progress = true,
				sort_name = "C_Jimmy_H_Boiling_UMPForMe_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.contracts.jimmy
				}
			},
			cow_8 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_BombDock_Sneaking_D5",
				sort_name = "C_Butcher_H_BombDock_Sneaking_D5",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.death_wish,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			cow_6 = {
				icon_id = "C_Butcher_H_BombDock_AllDiffs_D0",
				ladder = "H_BombDock",
				sort_name = "C_Butcher_H_BombDock_AllDiffs_D0",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			cow_7 = {
				icon_id = "C_Butcher_H_BombDock_AllDiffs_D5",
				ladder = "H_BombDock",
				sort_name = "C_Butcher_H_BombDock_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			pick_61 = {
				icon_id = "C_Butcher_H_BombDock_AllDiffs_D4",
				ladder = "H_BombDock",
				sort_name = "C_Butcher_H_BombDock_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			axe_61 = {
				icon_id = "C_Butcher_H_BombDock_AllDiffs_D6",
				ladder = "H_BombDock",
				sort_name = "C_Butcher_H_BombDock_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			cow_10 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_BombDock_IveGot",
				sort_name = "C_Butcher_H_BombDock_IveGot",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.contracts.the_butcher
				}
			},
			cow_9 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_BombDock_Breaking",
				sort_name = "C_Butcher_H_BombDock_Breaking",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			cow_11 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_BombDock_Done",
				sort_name = "C_Butcher_H_BombDock_Done",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.the_butcher
				}
			},
			voff_2 = {
				sort_name = "C_Butcher_H_BombDock_HighTimes",
				icon_id = "C_Butcher_H_BombDock_HighTimes",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			cow_1 = {
				icon_id = "C_Butcher_H_BombForest_AllDiffs_D0",
				ladder = "H_BombForest",
				sort_name = "C_Butcher_H_BombForest_AllDiffs_D0",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.tactics.loud,
					tags.contracts.the_butcher
				}
			},
			cow_2 = {
				icon_id = "C_Butcher_H_BombForest_AllDiffs_D5",
				ladder = "H_BombForest",
				sort_name = "C_Butcher_H_BombForest_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_butcher
				}
			},
			pick_60 = {
				icon_id = "C_Butcher_H_BombForest_AllDiffs_D4",
				ladder = "H_BombForest",
				sort_name = "C_Butcher_H_BombForest_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.the_butcher
				}
			},
			axe_60 = {
				icon_id = "C_Butcher_H_BombForest_AllDiffs_D6",
				ladder = "H_BombForest",
				sort_name = "C_Butcher_H_BombForest_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.the_butcher
				}
			},
			cow_5 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_BombForest_Oppressor",
				sort_name = "C_Butcher_H_BombForest_Oppressor",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.the_butcher
				}
			},
			cow_3 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_BombForest_Beaver",
				sort_name = "C_Butcher_H_BombForest_Beaver",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_butcher
				}
			},
			cow_4 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_BombForest_PumpIt",
				sort_name = "C_Butcher_H_BombForest_PumpIt",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.the_butcher
				}
			},
			fish_1 = {
				icon_id = "C_Continental_H_Brooklyn_AllDiffs_D4",
				ladder = "H_Brooklyn",
				sort_name = "C_Continental_H_Brooklyn_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.the_continental
				}
			},
			fish_2 = {
				icon_id = "C_Continental_H_Brooklyn_AllDiffs_D5",
				ladder = "H_Brooklyn",
				sort_name = "C_Continental_H_Brooklyn_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_continental
				}
			},
			fish_3 = {
				icon_id = "C_Continental_H_Brooklyn_AllDiffs_D6",
				ladder = "H_Brooklyn",
				sort_name = "C_Continental_H_Brooklyn_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.the_continental
				}
			},
			fish_4 = {
				additional_id = true,
				sort_name = "C_Continental_H_Brooklyn_Apartment_D3",
				icon_id = "C_Continental_H_Brooklyn_Apartment_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_continental
				}
			},
			fish_5 = {
				need_unlock_icons = true,
				icon_id = "C_Continental_H_Brooklyn_ARendezvous_D3",
				sort_name = "C_Continental_H_Brooklyn_ARendezvous_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.the_continental
				}
			},
			fish_6 = {
				need_unlock_icons = true,
				icon_id = "C_Continental_H_Brooklyn_PassTheAmmo_D3",
				sort_name = "C_Continental_H_Brooklyn_PassTheAmmo_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.equipment,
					tags.teamwork.players_4,
					tags.contracts.the_continental
				}
			},
			frappucino_to_go_please = {
				sort_name = "C_Escape_H_Cafe_Cappuccino",
				icon_id = "C_Escape_H_Cafe_Cappuccino",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.escape
				}
			},
			fort_1 = {
				icon_id = "C_Bain_H_Car_AllDiffs_D5",
				ladder = "H_Car",
				sort_name = "C_Bain_H_Car_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_41 = {
				icon_id = "C_Bain_H_Car_AllDiffs_D4",
				ladder = "H_Car",
				sort_name = "C_Bain_H_Car_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_41 = {
				icon_id = "C_Bain_H_Car_AllDiffs_D6",
				ladder = "H_Car",
				sort_name = "C_Bain_H_Car_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			fort_3 = {
				additional_id = true,
				sort_name = "C_Bain_H_Car_Tag",
				icon_id = "C_Bain_H_Car_Tag",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.teamwork.players_4,
					tags.contracts.bain
				}
			},
			fort_4 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_Car_Gone",
				sort_name = "C_Bain_H_Car_Gone",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.bain
				}
			},
			djur_1 = {
				icon_id = "C_Bain_H_CookOff_AllDiffs_D5",
				ladder = "H_Cook",
				sort_name = "C_Bain_H_CookOff_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_40 = {
				icon_id = "C_Bain_H_CookOff_AllDiffs_D4",
				ladder = "H_Cook",
				sort_name = "C_Bain_H_CookOff_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_40 = {
				icon_id = "C_Bain_H_CookOff_AllDiffs_D6",
				ladder = "H_Cook",
				sort_name = "C_Bain_H_CookOff_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			voff_5 = {
				sort_name = "C_Bain_H_CookOff_KissTheChef_D3",
				icon_id = "C_Bain_H_CookOff_KissTheChef_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pal_1 = {
				icon_id = "C_Classics_H_Counterfeit_AllDiffs_D5",
				ladder = "H_Counter",
				sort_name = "C_Classics_H_Counterfeit_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pick_51 = {
				icon_id = "C_Classics_H_Counterfeit_AllDiffs_D4",
				ladder = "H_Counter",
				sort_name = "C_Classics_H_Counterfeit_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			axe_51 = {
				icon_id = "C_Classics_H_Counterfeit_AllDiffs_D6",
				ladder = "H_Counter",
				sort_name = "C_Classics_H_Counterfeit_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pal_3 = {
				need_unlock_icons = true,
				icon_id = "C_Classics_H_Counterfeit_CuttingTheRed_D3",
				sort_name = "C_Classics_H_Counterfeit_CuttingTheRed_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pal_4 = {
				sort_name = "C_Classics_H_Counterfeit_Basement_D3",
				icon_id = "C_Classics_H_Counterfeit_Basement_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pal_5 = {
				sort_name = "C_Classics_H_Counterfeit_Crowd",
				icon_id = "C_Classics_H_Counterfeit_Crowd",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pal_2 = {
				need_unlock_icons = true,
				icon_id = "C_Classics_H_Counterfeit_DrEvil",
				progress = true,
				sort_name = "C_Classics_H_Counterfeit_DrEvil",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			bat_1 = {
				icon_id = "C_Dentist_H_Diamond_AllDiffs_D5",
				ladder = "H_Diamond",
				sort_name = "C_Dentist_H_Diamond_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			pick_36 = {
				icon_id = "C_Dentist_H_Diamond_AllDiffs_D4",
				ladder = "H_Diamond",
				sort_name = "C_Dentist_H_Diamond_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			axe_36 = {
				icon_id = "C_Dentist_H_Diamond_AllDiffs_D6",
				ladder = "H_Diamond",
				sort_name = "C_Dentist_H_Diamond_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bat_5 = {
				additional_id = true,
				sort_name = "C_Dentist_H_Diamond_Honor_D3",
				icon_id = "C_Dentist_H_Diamond_Honor_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.teamwork.players_4,
					tags.contracts.the_dentist
				}
			},
			bat_2 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_Diamond_CatBurglar",
				sort_name = "C_Dentist_H_Diamond_CatBurglar",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bat_6 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_Diamond_Diamonds_D3",
				sort_name = "C_Dentist_H_Diamond_Diamonds_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bat_3 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_Diamond_Culture",
				sort_name = "C_Dentist_H_Diamond_Culture",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			bat_4 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_Diamond_Smoke",
				sort_name = "C_Dentist_H_Diamond_Smoke",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.the_dentist
				}
			},
			death_14 = {
				icon_id = "C_Bain_H_DiamondStore_AllDiffs_D5",
				ladder = "H_DiamondStore",
				sort_name = "C_Bain_H_DiamondStore_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_15 = {
				icon_id = "C_Bain_H_DiamondStore_AllDiffs_D4",
				ladder = "H_DiamondStore",
				sort_name = "C_Bain_H_DiamondStore_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_15 = {
				icon_id = "C_Bain_H_DiamondStore_AllDiffs_D6",
				ladder = "H_DiamondStore",
				sort_name = "C_Bain_H_DiamondStore_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			bob_9 = {
				icon_id = "C_Elephant_H_ElectionDay_AllDiffs_D5",
				ladder = "H_ElectionDay",
				sort_name = "C_Elephant_H_ElectionDay_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			pick_27 = {
				icon_id = "C_Elephant_H_ElectionDay_AllDiffs_D4",
				ladder = "H_ElectionDay",
				sort_name = "C_Elephant_H_ElectionDay_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			axe_27 = {
				icon_id = "C_Elephant_H_ElectionDay_AllDiffs_D6",
				ladder = "H_ElectionDay",
				sort_name = "C_Elephant_H_ElectionDay_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			ovk_5 = {
				sort_name = "C_Elephant_H_ElectionDay_Reputation_D5",
				icon_id = "C_Elephant_H_ElectionDay_Reputation_D5",
				tags = {
					tags.progress.heisting,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.teamwork.players_4,
					tags.contracts.the_elephant
				}
			},
			bob_7 = {
				sort_name = "C_Elephant_H_ElectionDay_DeathWishSwinger_D5",
				icon_id = "C_Elephant_H_ElectionDay_DeathWishSwinger_D5",
				tags = {
					tags.progress.heisting,
					tags.difficulty.death_wish,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			bob_3 = {
				sort_name = "C_Elephant_H_ElectionDay_ImASwinger",
				icon_id = "C_Elephant_H_ElectionDay_ImASwinger",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			slakt_1 = {
				sort_name = "C_Elephant_H_ElectionDay_Speedlock",
				icon_id = "C_Elephant_H_ElectionDay_Speedlock",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.the_elephant
				}
			},
			bob_5 = {
				sort_name = "C_Elephant_H_ElectionDay_MasterDetective",
				icon_id = "C_Elephant_H_ElectionDay_MasterDetective",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			bob_6 = {
				sort_name = "C_Elephant_H_ElectionDay_Murphy",
				icon_id = "C_Elephant_H_ElectionDay_Murphy",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			bob_8 = {
				sort_name = "C_Elephant_H_ElectionDay_HotLava",
				icon_id = "C_Elephant_H_ElectionDay_HotLava",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_elephant
				}
			},
			bob_4 = {
				sort_name = "C_Elephant_H_ElectionDay_StorageHunter",
				icon_id = "C_Elephant_H_ElectionDay_StorageHunter",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			death_32 = {
				icon_id = "C_Hector_H_Firestarter_AllDiffs_D5",
				ladder = "H_Firestarter",
				sort_name = "C_Hector_H_Firestarter_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			pick_9 = {
				icon_id = "C_Hector_H_Firestarter_AllDiffs_D4",
				ladder = "H_Firestarter",
				sort_name = "C_Hector_H_Firestarter_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			axe_9 = {
				icon_id = "C_Hector_H_Firestarter_AllDiffs_D6",
				ladder = "H_Firestarter",
				sort_name = "C_Hector_H_Firestarter_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			bah_1 = {
				additional_id = true,
				sort_name = "C_Hector_H_Firestarter_YouCanRun_D3",
				icon_id = "C_Hector_H_Firestarter_YouCanRun_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			pim_4 = {
				need_unlock_icons = true,
				icon_id = "C_Hector_H_Firestarter_ForDaisy_D3",
				sort_name = "C_Hector_H_Firestarter_ForDaisy_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.hector
				}
			},
			slakt_5 = {
				sort_name = "C_Hector_H_Firestarter_ItsGettingHot_D5",
				icon_id = "C_Hector_H_Firestarter_ItsGettingHot_D5",
				tags = {
					tags.progress.heisting,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4,
					tags.contracts.hector
				}
			},
			ovk_10 = {
				sort_name = "C_Hector_H_Firestarter_Wasteful_D5",
				icon_id = "C_Hector_H_Firestarter_Wasteful_D5",
				tags = {
					tags.progress.heisting,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			ameno_4 = {
				need_unlock_icons = true,
				icon_id = "C_Hector_H_Firestarter_HereComesThePain_D3",
				sort_name = "C_Hector_H_Firestarter_HereComesThePain_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_4,
					tags.contracts.hector
				}
			},
			lord_of_war = {
				sort_name = "C_Hector_H_Firestarter_Lord",
				icon_id = "C_Hector_H_Firestarter_Lord",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			the_wire = {
				sort_name = "C_Hector_H_Firestarter_Guessing",
				icon_id = "C_Hector_H_Firestarter_Guessing",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			the_first_line = {
				sort_name = "C_Hector_H_Firestarter_TheFirst",
				icon_id = "C_Hector_H_Firestarter_TheFirst",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.hector
				}
			},
			green_5 = {
				icon_id = "C_Classics_H_FirstWorldBank_AllDiffs_D5",
				ladder = "H_FirstWorld",
				sort_name = "C_Classics_H_FirstWorldBank_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.classic
				}
			},
			green_3 = {
				sort_name = "C_Classics_H_FirstWorldBank_LEET",
				icon_id = "C_Classics_H_FirstWorldBank_LEET",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.classic
				}
			},
			pick_37 = {
				icon_id = "C_Classics_H_FirstWorldBank_AllDiffs_D4",
				ladder = "H_FirstWorld",
				sort_name = "C_Classics_H_FirstWorldBank_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.classic
				}
			},
			axe_37 = {
				icon_id = "C_Classics_H_FirstWorldBank_AllDiffs_D6",
				ladder = "H_FirstWorld",
				sort_name = "C_Classics_H_FirstWorldBank_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.classic
				}
			},
			green_2 = {
				additional_id = true,
				sort_name = "C_Classics_H_FirstWorldBank_Original_D3",
				icon_id = "C_Classics_H_FirstWorldBank_Original_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.classic
				}
			},
			green_4 = {
				sort_name = "C_Classics_H_FirstWorldBank_Cloaker_D3",
				icon_id = "C_Classics_H_FirstWorldBank_Cloaker_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.classic
				}
			},
			green_1 = {
				sort_name = "C_Classics_H_FirstWorldBank_Hidden",
				icon_id = "C_Classics_H_FirstWorldBank_Hidden",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.classic
				}
			},
			green_7 = {
				additional_id = true,
				sort_name = "C_Classics_H_FirstWorldBank_Au",
				icon_id = "C_Classics_H_FirstWorldBank_Au",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.classic
				}
			},
			green_6 = {
				additional_id = true,
				sort_name = "C_Classics_H_FirstWorldBank_Overdrill_D5",
				icon_id = "C_Classics_H_FirstWorldBank_Overdrill_D5",
				tags = {
					tags.progress.heisting,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			death_3 = {
				icon_id = "C_Vlad_H_FourStores_AllDiffs_D5",
				ladder = "H_FourStores",
				sort_name = "C_Vlad_H_FourStores_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			pick_3 = {
				icon_id = "C_Vlad_H_FourStores_AllDiffs_D4",
				ladder = "H_FourStores",
				sort_name = "C_Vlad_H_FourStores_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			axe_3 = {
				icon_id = "C_Vlad_H_FourStores_AllDiffs_D6",
				ladder = "H_FourStores",
				sort_name = "C_Vlad_H_FourStores_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			yeah_hes_a_gold_digger = {
				sort_name = "C_Vlad_H_FourStores_YeahHe",
				icon_id = "C_Vlad_H_FourStores_YeahHe",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			death_35 = {
				icon_id = "C_Elephant_H_FramingFrame_AllDiffs_D5",
				ladder = "H_FramingFrame",
				sort_name = "C_Elephant_H_FramingFrame_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			pick_11 = {
				icon_id = "C_Elephant_H_FramingFrame_AllDiffs_D4",
				ladder = "H_FramingFrame",
				sort_name = "C_Elephant_H_FramingFrame_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			axe_11 = {
				icon_id = "C_Elephant_H_FramingFrame_AllDiffs_D6",
				ladder = "H_FramingFrame",
				sort_name = "C_Elephant_H_FramingFrame_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			flake_1 = {
				additional_id = true,
				sort_name = "C_Elephant_H_FramingFrame_WeDoIt_D3",
				icon_id = "C_Elephant_H_FramingFrame_WeDoIt_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.weapon,
					tags.teamwork.players_4,
					tags.contracts.the_elephant
				}
			},
			pink_panther = {
				sort_name = "C_Elephant_H_FramingFrame_PaintingYourself",
				icon_id = "C_Elephant_H_FramingFrame_PaintingYourself",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_elephant
				}
			},
			big_deal = {
				sort_name = "C_Elephant_H_FramingFrame_BigDeal",
				icon_id = "C_Elephant_H_FramingFrame_BigDeal",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			i_wasnt_even_there = {
				sort_name = "C_Elephant_H_FramingFrame_IWasnt",
				icon_id = "C_Elephant_H_FramingFrame_IWasnt",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.the_elephant
				}
			},
			halloween_3 = {
				sort_name = "C_Elephant_H_FramingFrame_Afraid",
				icon_id = "C_Elephant_H_FramingFrame_Afraid",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.the_elephant
				}
			},
			bilbo_baggin = {
				sort_name = "C_Escape_H_Garage_TheySeeMe",
				icon_id = "C_Escape_H_Garage_TheySeeMe",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.escape
				}
			},
			peta_1 = {
				icon_id = "C_Vlad_H_GoatSim_AllDiffs_D5",
				ladder = "H_GoatSim",
				sort_name = "C_Vlad_H_GoatSim_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			pick_49 = {
				icon_id = "C_Vlad_H_GoatSim_AllDiffs_D4",
				ladder = "H_GoatSim",
				sort_name = "C_Vlad_H_GoatSim_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			axe_49 = {
				icon_id = "C_Vlad_H_GoatSim_AllDiffs_D6",
				ladder = "H_GoatSim",
				sort_name = "C_Vlad_H_GoatSim_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			peta_3 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_GoatSim_Hazzard",
				sort_name = "C_Vlad_H_GoatSim_Hazzard",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.vlad
				}
			},
			peta_2 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_GoatSim_GoatIn",
				sort_name = "C_Vlad_H_GoatSim_GoatIn",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.vlad
				}
			},
			peta_4 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_GoatSim_Baaaa",
				sort_name = "C_Vlad_H_GoatSim_Baaaa",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			peta_5 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_GoatSim_FarmerMiserable_D3",
				sort_name = "C_Vlad_H_GoatSim_FarmerMiserable_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			death_15 = {
				icon_id = "C_Bain_H_GOBank_AllDiffs_D5",
				ladder = "H_GOBank",
				sort_name = "C_Bain_H_GOBank_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_16 = {
				icon_id = "C_Bain_H_GOBank_AllDiffs_D4",
				ladder = "H_GOBank",
				sort_name = "C_Bain_H_GOBank_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_16 = {
				icon_id = "C_Bain_H_GOBank_AllDiffs_D6",
				ladder = "H_GOBank",
				sort_name = "C_Bain_H_GOBank_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			charliesierra_1 = {
				sort_name = "C_Bain_H_GOBank_SewerRats_D3",
				icon_id = "C_Bain_H_GOBank_SewerRats_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			charliesierra_2 = {
				sort_name = "C_Bain_H_GOBank_IsEverythingOK",
				icon_id = "C_Bain_H_GOBank_IsEverythingOK",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			charliesierra_6 = {
				sort_name = "C_Bain_H_GOBank_WeAreAll_D3",
				icon_id = "C_Bain_H_GOBank_WeAreAll_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4,
					tags.contracts.bain
				}
			},
			charliesierra_7 = {
				sort_name = "C_Bain_H_GOBank_Eco_D3",
				icon_id = "C_Bain_H_GOBank_Eco_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			charliesierra_5 = {
				sort_name = "C_Bain_H_GOBank_AllEggs",
				icon_id = "C_Bain_H_GOBank_AllEggs",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			charliesierra_4 = {
				sort_name = "C_Bain_H_GOBank_UpsideDown",
				icon_id = "C_Bain_H_GOBank_UpsideDown",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			charliesierra_8 = {
				sort_name = "C_Bain_H_GOBank_DeadPresents",
				icon_id = "C_Bain_H_GOBank_DeadPresents",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			kenaz_2 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_GoldenGrinCasino_BlindEye",
				sort_name = "C_Dentist_H_GoldenGrinCasino_BlindEye",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			kenaz_4 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_GoldenGrinCasino_HighRoller",
				sort_name = "C_Dentist_H_GoldenGrinCasino_HighRoller",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.the_dentist
				}
			},
			kenaz_3 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_GoldenGrinCasino_CityofSin",
				sort_name = "C_Dentist_H_GoldenGrinCasino_CityofSin",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_dentist
				}
			},
			kenaz_1 = {
				icon_id = "C_Dentist_H_GoldenGrinCasino_AllDiffs_D5",
				ladder = "H_GoldenGrin",
				sort_name = "C_Dentist_H_GoldenGrinCasino_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			pick_44 = {
				icon_id = "C_Dentist_H_GoldenGrinCasino_AllDiffs_D4",
				ladder = "H_GoldenGrin",
				sort_name = "C_Dentist_H_GoldenGrinCasino_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			axe_44 = {
				icon_id = "C_Dentist_H_GoldenGrinCasino_AllDiffs_D6",
				ladder = "H_GoldenGrin",
				sort_name = "C_Dentist_H_GoldenGrinCasino_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			kenaz_5 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_GoldenGrinCasino_HailtotheKing",
				sort_name = "C_Dentist_H_GoldenGrinCasino_HailtotheKing",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			glace_5 = {
				icon_id = "C_Classics_H_GreenBridge_AllDiffs_D4",
				ladder = "H_GreenBridge",
				sort_name = "C_Classics_H_GreenBridge_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			glace_6 = {
				icon_id = "C_Classics_H_GreenBridge_AllDiffs_D5",
				ladder = "H_GreenBridge",
				sort_name = "C_Classics_H_GreenBridge_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			glace_7 = {
				icon_id = "C_Classics_H_GreenBridge_AllDiffs_D6",
				ladder = "H_GreenBridge",
				sort_name = "C_Classics_H_GreenBridge_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			glace_8 = {
				sort_name = "C_Classics_H_GreenBridge_FeltBad",
				icon_id = "C_Classics_H_GreenBridge_FeltBad",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.inventory.equipment,
					tags.contracts.classic
				}
			},
			glace_9 = {
				sort_name = "C_Classics_H_GreenBridge_Caution",
				icon_id = "C_Classics_H_GreenBridge_Caution",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			glace_10 = {
				sort_name = "C_Classics_H_GreenBridge_BackToPrison",
				icon_id = "C_Classics_H_GreenBridge_BackToPrison",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_5 = {
				icon_id = "C_Classics_H_HeatStreet_AllDiffs_D4",
				ladder = "H_HeatStreet",
				sort_name = "C_Classics_H_HeatStreet_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_6 = {
				icon_id = "C_Classics_H_HeatStreet_AllDiffs_D5",
				ladder = "H_HeatStreet",
				sort_name = "C_Classics_H_HeatStreet_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_7 = {
				icon_id = "C_Classics_H_HeatStreet_AllDiffs_D6",
				ladder = "H_HeatStreet",
				sort_name = "C_Classics_H_HeatStreet_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_8 = {
				sort_name = "C_Classics_H_HeatStreet_Zookeeper",
				icon_id = "C_Classics_H_HeatStreet_Zookeeper",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_9 = {
				sort_name = "C_Classics_H_HeatStreet_Patience",
				icon_id = "C_Classics_H_HeatStreet_Patience",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_10 = {
				sort_name = "C_Classics_H_HeatStreet_ItsNice",
				icon_id = "C_Classics_H_HeatStreet_ItsNice",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pig_1 = {
				icon_id = "C_Dentist_H_HotlineMiami_AllDiffs_D5",
				ladder = "H_HotlineMiami",
				sort_name = "C_Dentist_H_HotlineMiami_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			pick_31 = {
				icon_id = "C_Dentist_H_HotlineMiami_AllDiffs_D4",
				ladder = "H_HotlineMiami",
				sort_name = "C_Dentist_H_HotlineMiami_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			axe_31 = {
				icon_id = "C_Dentist_H_HotlineMiami_AllDiffs_D6",
				ladder = "H_HotlineMiami",
				sort_name = "C_Dentist_H_HotlineMiami_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			pig_4 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_HotlineMiami_Overdose",
				sort_name = "C_Dentist_H_HotlineMiami_Overdose",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			pig_5 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_HotlineMiami_SoundsofAnimals_D1",
				sort_name = "C_Dentist_H_HotlineMiami_SoundsofAnimals_D1",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.hard,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.mask,
					tags.teamwork.players_4,
					tags.contracts.the_dentist
				}
			},
			pig_3 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_HotlineMiami_DoYouLike",
				progress = true,
				sort_name = "C_Dentist_H_HotlineMiami_DoYouLike",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.contracts.the_dentist
				}
			},
			pig_7 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_HotlineMiami_Phew",
				sort_name = "C_Dentist_H_HotlineMiami_Phew",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			bulldog_1 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_HoxtonBreakout_AllDiffs_D0",
				ladder = "H_HoxBreakout",
				sort_name = "C_Dentist_H_HoxtonBreakout_AllDiffs_D0",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.unlock.character,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			bulldog_2 = {
				icon_id = "C_Dentist_H_HoxtonBreakout_AllDiffs_D5",
				ladder = "H_HoxBreakout",
				sort_name = "C_Dentist_H_HoxtonBreakout_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			pick_34 = {
				icon_id = "C_Dentist_H_HoxtonBreakout_AllDiffs_D4",
				ladder = "H_HoxBreakout",
				sort_name = "C_Dentist_H_HoxtonBreakout_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			axe_34 = {
				icon_id = "C_Dentist_H_HoxtonBreakout_AllDiffs_D6",
				ladder = "H_HoxBreakout",
				sort_name = "C_Dentist_H_HoxtonBreakout_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			pig_2 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_HoxtonBreakout_WalkFaster_D3",
				sort_name = "C_Dentist_H_HoxtonBreakout_WalkFaster_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.contracts.the_dentist
				}
			},
			slakt_3 = {
				sort_name = "C_Dentist_H_HoxtonBreakout_SituationNormal_D3",
				icon_id = "C_Dentist_H_HoxtonBreakout_SituationNormal_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_dentist
				}
			},
			frog_1 = {
				icon_id = "C_Dentist_H_HoxtonBreakout_TabulaRasa_D3",
				sort_name = "C_Dentist_H_HoxtonBreakout_TabulaRasa_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.skill_slot,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.the_dentist
				}
			},
			eagle_3 = {
				need_unlock_icons = true,
				icon_id = "C_Dentist_H_HoxtonBreakout_Wind_D3",
				sort_name = "C_Dentist_H_HoxtonBreakout_Wind_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.mask,
					tags.teamwork.players_4,
					tags.contracts.the_dentist
				}
			},
			payback_1 = {
				icon_id = "C_Dentist_H_HoxtonRevenge_AllDiffs_D5",
				ladder = "H_HoxRevenge",
				sort_name = "C_Dentist_H_HoxtonRevenge_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			pick_39 = {
				icon_id = "C_Dentist_H_HoxtonRevenge_AllDiffs_D4",
				ladder = "H_HoxRevenge",
				sort_name = "C_Dentist_H_HoxtonRevenge_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			axe_39 = {
				icon_id = "C_Dentist_H_HoxtonRevenge_AllDiffs_D6",
				ladder = "H_HoxRevenge",
				sort_name = "C_Dentist_H_HoxtonRevenge_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			payback_2 = {
				sort_name = "C_Dentist_H_HoxtonRevenge_Silent",
				icon_id = "C_Dentist_H_HoxtonRevenge_Silent",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.the_dentist
				}
			},
			death_13 = {
				icon_id = "C_Bain_H_JewelryStore_AllDiffs_D5",
				ladder = "H_JewelryStore",
				sort_name = "C_Bain_H_JewelryStore_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_14 = {
				icon_id = "C_Bain_H_JewelryStore_AllDiffs_D4",
				ladder = "H_JewelryStore",
				sort_name = "C_Bain_H_JewelryStore_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_14 = {
				icon_id = "C_Bain_H_JewelryStore_AllDiffs_D6",
				ladder = "H_JewelryStore",
				sort_name = "C_Bain_H_JewelryStore_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			ameno_7 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_JewelryStore_PrivateParty_D3",
				sort_name = "C_Bain_H_JewelryStore_PrivateParty_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			diamonds_are_forever = {
				sort_name = "C_Bain_H_JewelryStore_Diamonds",
				icon_id = "C_Bain_H_JewelryStore_Diamonds",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			lab_3 = {
				icon_id = "C_Event_H_LabRats_AllDiffs_D5",
				ladder = "H_LabRats",
				sort_name = "C_Event_H_LabRats_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			pick_46 = {
				icon_id = "C_Event_H_LabRats_AllDiffs_D4",
				ladder = "H_LabRats",
				sort_name = "C_Event_H_LabRats_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			axe_46 = {
				icon_id = "C_Event_H_LabRats_AllDiffs_D6",
				ladder = "H_LabRats",
				sort_name = "C_Event_H_LabRats_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			lab_2 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_LabRats_TrickorTreat_D3",
				sort_name = "C_Event_H_LabRats_TrickorTreat_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			lab_1 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_LabRats_Skill",
				sort_name = "C_Event_H_LabRats_Skill",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			death_2 = {
				icon_id = "C_Vlad_H_Mallcrasher_AllDiffs_D5",
				ladder = "H_Mallcrasher",
				sort_name = "C_Vlad_H_Mallcrasher_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			pick_2 = {
				icon_id = "C_Vlad_H_Mallcrasher_AllDiffs_D4",
				ladder = "H_Mallcrasher",
				sort_name = "C_Vlad_H_Mallcrasher_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			axe_2 = {
				icon_id = "C_Vlad_H_Mallcrasher_AllDiffs_D6",
				ladder = "H_Mallcrasher",
				sort_name = "C_Vlad_H_Mallcrasher_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			window_cleaner = {
				sort_name = "C_Vlad_H_Mallcrasher_Shoot",
				icon_id = "C_Vlad_H_Mallcrasher_Shoot",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			ameno_3 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_Mallcrasher_OnePointEight_D3",
				sort_name = "C_Vlad_H_Mallcrasher_OnePointEight_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.vlad
				}
			},
			melt_1 = {
				icon_id = "C_Vlad_H_Meltdown_AllDiffs_D5",
				ladder = "H_Meltdown",
				sort_name = "C_Vlad_H_Meltdown_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			pick_42 = {
				icon_id = "C_Vlad_H_Meltdown_AllDiffs_D4",
				ladder = "H_Meltdown",
				sort_name = "C_Vlad_H_Meltdown_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			axe_42 = {
				icon_id = "C_Vlad_H_Meltdown_AllDiffs_D6",
				ladder = "H_Meltdown",
				sort_name = "C_Vlad_H_Meltdown_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			melt_2 = {
				icon_id = "C_Vlad_H_Meltdown_AllDiffs_D0",
				ladder = "H_Meltdown",
				sort_name = "C_Vlad_H_Meltdown_AllDiffs_D0",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			melt_4 = {
				sort_name = "C_Vlad_H_Meltdown_ThereWas",
				icon_id = "C_Vlad_H_Meltdown_ThereWas",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.vlad
				}
			},
			melt_3 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_Meltdown_TheyDontPay",
				sort_name = "C_Vlad_H_Meltdown_TheyDontPay",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			dark_5 = {
				sort_name = "C_Jimmy_H_MurkyStation_Janitor",
				icon_id = "C_Jimmy_H_MurkyStation_Janitor",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.jimmy
				}
			},
			voff_3 = {
				additional_id = true,
				sort_name = "C_Jimmy_H_MurkyStation_Lootinh_D3",
				icon_id = "C_Jimmy_H_MurkyStation_Lootinh_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4,
					tags.contracts.jimmy
				}
			},
			dark_4 = {
				sort_name = "C_Jimmy_H_MurkyStation_NoWitnesses_D3",
				icon_id = "C_Jimmy_H_MurkyStation_NoWitnesses_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.inventory.weapon,
					tags.contracts.jimmy
				}
			},
			dark_1 = {
				icon_id = "C_Jimmy_H_MurkyStation_AllDiffs_D5",
				ladder = "H_MurkyStation",
				sort_name = "C_Jimmy_H_MurkyStation_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.stealth,
					tags.contracts.jimmy
				}
			},
			pick_53 = {
				icon_id = "C_Jimmy_H_MurkyStation_AllDiffs_D4",
				ladder = "H_MurkyStation",
				sort_name = "C_Jimmy_H_MurkyStation_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.stealth,
					tags.contracts.jimmy
				}
			},
			axe_53 = {
				icon_id = "C_Jimmy_H_MurkyStation_AllDiffs_D6",
				ladder = "H_MurkyStation",
				sort_name = "C_Jimmy_H_MurkyStation_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.stealth,
					tags.contracts.jimmy
				}
			},
			dark_2 = {
				need_unlock_icons = true,
				icon_id = "C_Jimmy_H_MurkyStation_GhostRun",
				sort_name = "C_Jimmy_H_MurkyStation_GhostRun",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.jimmy
				}
			},
			dark_3 = {
				need_unlock_icons = true,
				icon_id = "C_Jimmy_H_MurkyStation_ThePacifist",
				sort_name = "C_Jimmy_H_MurkyStation_ThePacifist",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.jimmy
				}
			},
			pim_2 = {
				need_unlock_icons = true,
				icon_id = "C_Jimmy_H_MurkyStation_CrouchedandHidden",
				progress = true,
				sort_name = "C_Jimmy_H_MurkyStation_CrouchedandHidden",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.inventory.weapon,
					tags.contracts.jimmy
				}
			},
			death_4 = {
				icon_id = "C_Vlad_H_Nightclub_AllDiffs_D5",
				ladder = "H_Nightclub",
				sort_name = "C_Vlad_H_Nightclub_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			pick_4 = {
				icon_id = "C_Vlad_H_Nightclub_AllDiffs_D4",
				ladder = "H_Nightclub",
				sort_name = "C_Vlad_H_Nightclub_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			axe_4 = {
				icon_id = "C_Vlad_H_Nightclub_AllDiffs_D6",
				ladder = "H_Nightclub",
				sort_name = "C_Vlad_H_Nightclub_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			ameno_1 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_Nightclub_OVESAW",
				sort_name = "C_Vlad_H_Nightclub_OVESAW",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.vlad
				}
			},
			ameno_2 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_Nightclub_HeyMr",
				sort_name = "C_Vlad_H_Nightclub_HeyMr",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			going_all_in = {
				sort_name = "C_Vlad_H_Nightclub_ImGoing",
				icon_id = "C_Vlad_H_Nightclub_ImGoing",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			slakt_4 = {
				sort_name = "C_Vlad_H_Nightclub_KeeptheParty",
				icon_id = "C_Vlad_H_Nightclub_KeeptheParty",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			gage4_7 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_Nightclub_Everyday",
				progress = true,
				sort_name = "C_Vlad_H_Nightclub_Everyday",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.contracts.vlad
				}
			},
			gage2_3 = {
				sort_name = "C_Vlad_H_Nightclub_TheEighth",
				icon_id = "C_Vlad_H_Nightclub_TheEighth",
				progress = true,
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.contracts.vlad
				}
			},
			armed_to_the_teeth = {
				sort_name = "Other_H_None_WouldYouLike",
				icon_id = "Other_H_None_WouldYouLike",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			eagle_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_None_SoUncivilized",
				sort_name = "Other_H_None_SoUncivilized",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.mask,
					tags.unlock.weapon
				}
			},
			how_do_you_like_me_now = {
				sort_name = "Other_H_None_HowDoYou",
				icon_id = "Other_H_None_HowDoYou",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.inventory.armor
				}
			},
			charliesierra_3 = {
				additional_id = true,
				sort_name = "Other_H_None_Merry",
				icon_id = "Other_H_None_Merry",
				tags = {
					tags.progress.generic,
					tags.inventory.mask
				}
			},
			armored_11 = {
				additional_id = true,
				sort_name = "Other_H_None_Heat",
				icon_id = "Other_H_None_Heat",
				tags = {
					tags.progress.generic,
					tags.inventory.mask
				}
			},
			like_an_angry_bear = {
				additional_id = true,
				sort_name = "Other_H_None_LikeAnAngry",
				icon_id = "Other_H_None_LikeAnAngry",
				tags = {
					tags.progress.generic,
					tags.inventory.mask
				}
			},
			death_31 = {
				additional_id = true,
				sort_name = "Other_H_None_WithAnIron",
				icon_id = "Other_H_None_WithAnIron",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			bob_1 = {
				additional_id = true,
				sort_name = "Other_H_None_AVote",
				icon_id = "Other_H_None_AVote",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			gage5_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_None_ArmyofOne",
				sort_name = "Other_H_None_ArmyofOne",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.generic,
					tags.unlock.weapon,
					tags.inventory.weapon
				}
			},
			gage3_1 = {
				additional_id = true,
				sort_name = "Other_H_None_BuildMe",
				icon_id = "Other_H_None_BuildMe",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			iron_man = {
				sort_name = "Other_H_None_ManOfIron",
				icon_id = "Other_H_None_ManOfIron",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.inventory.armor
				}
			},
			halloween_9 = {
				additional_id = true,
				sort_name = "Other_H_None_ChristmasCame",
				icon_id = "Other_H_None_ChristmasCame",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			gage_8 = {
				sort_name = "Other_H_None_GunsAreLike",
				icon_id = "Other_H_None_GunsAreLike",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			going_places = {
				sort_name = "Other_H_None_GoingPlaces",
				icon_id = "Other_H_None_GoingPlaces",
				progress = true,
				tags = {tags.progress.generic}
			},
			masked_villain = {
				sort_name = "Other_H_None_Masked",
				icon_id = "Other_H_None_Masked",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.inventory.mask
				}
			},
			would_you_like_your_receipt = {
				sort_name = "Other_H_None_Armed",
				icon_id = "Other_H_None_Armed",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			gmod_10 = {
				additional_id = true,
				sort_name = "Other_H_None_Russian",
				icon_id = "Other_H_None_Russian",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			gmod_8 = {
				additional_id = true,
				sort_name = "Other_H_None_Point",
				icon_id = "Other_H_None_Point",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			gmod_7 = {
				additional_id = true,
				sort_name = "Other_H_None_HighSpeed",
				icon_id = "Other_H_None_HighSpeed",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			gmod_9 = {
				additional_id = true,
				sort_name = "Other_H_None_MallNinja",
				icon_id = "Other_H_None_MallNinja",
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			weapon_collector = {
				sort_name = "Other_H_None_Weapon",
				icon_id = "Other_H_None_Weapon",
				progress = true,
				tags = {
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			fully_loaded = {
				sort_name = "Other_H_None_FullyLoaded",
				icon_id = "Other_H_None_FullyLoaded",
				progress = true,
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.inventory.weapon
				}
			},
			spend_money_to_make_money = {
				sort_name = "Other_H_None_SpendMoney",
				icon_id = "Other_H_None_SpendMoney",
				progress = true,
				tags = {tags.progress.generic}
			},
			im_a_healer_tank_damage_dealer = {
				sort_name = "Other_H_None_ImAHealerTank",
				icon_id = "Other_H_None_ImAHealerTank",
				tags = {
					tags.progress.beginner,
					tags.progress.generic,
					tags.inventory.skill
				}
			},
			grv_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_None_RussianArsenal_D3",
				sort_name = "Other_H_None_RussianArsenal_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.weapon
				}
			},
			grv_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_None_SprayControl",
				sort_name = "Other_H_None_SprayControl",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			grv_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_None_HaveNiceDay",
				progress = true,
				sort_name = "Other_H_None_HaveNiceDay",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.inventory.weapon
				}
			},
			grv_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_None_SeakyBeaky",
				sort_name = "Other_H_None_SeakyBeaky",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.inventory.weapon
				}
			},
			you_shall_not_pass = {
				sort_name = "C_Escape_H_Overpass_YouShallNot",
				icon_id = "C_Escape_H_Overpass_YouShallNot",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.escape
				}
			},
			flat_5 = {
				sort_name = "C_Classics_H_PanicRoom_DontYouDare",
				icon_id = "C_Classics_H_PanicRoom_DontYouDare",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.classic
				}
			},
			flat_2 = {
				sort_name = "C_Classics_H_PanicRoom_Cardio",
				icon_id = "C_Classics_H_PanicRoom_Cardio",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.teamwork.players_4,
					tags.contracts.classic
				}
			},
			flat_1 = {
				icon_id = "C_Classics_H_PanicRoom_AllDiffs_D5",
				ladder = "H_PanicRoom",
				sort_name = "C_Classics_H_PanicRoom_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pick_55 = {
				icon_id = "C_Classics_H_PanicRoom_AllDiffs_D4",
				ladder = "H_PanicRoom",
				sort_name = "C_Classics_H_PanicRoom_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			axe_55 = {
				icon_id = "C_Classics_H_PanicRoom_AllDiffs_D6",
				ladder = "H_PanicRoom",
				sort_name = "C_Classics_H_PanicRoom_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			flat_3 = {
				sort_name = "C_Classics_H_PanicRoom_TheDentist",
				icon_id = "C_Classics_H_PanicRoom_TheDentist",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.classic
				}
			},
			king_of_the_hill = {
				sort_name = "C_Escape_H_Park_King",
				icon_id = "C_Escape_H_Park_King",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.escape
				}
			},
			orange_1 = {
				icon_id = "C_Event_H_PrisonNightmare_AllDiffs_D4",
				ladder = "H_PrisonNightmare",
				sort_name = "C_Event_H_PrisonNightmare_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			orange_2 = {
				icon_id = "C_Event_H_PrisonNightmare_AllDiffs_D5",
				ladder = "H_PrisonNightmare",
				sort_name = "C_Event_H_PrisonNightmare_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			orange_3 = {
				icon_id = "C_Event_H_PrisonNightmare_AllDiffs_D6",
				ladder = "H_PrisonNightmare",
				sort_name = "C_Event_H_PrisonNightmare_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			orange_5 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_PrisonNightmare_ALongNight_D4",
				sort_name = "C_Event_H_PrisonNightmare_ALongNight_D4",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.mayhem,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.teamwork.players_1_to_4,
					tags.contracts.events
				}
			},
			orange_6 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_PrisonNightmare_HesGotExperience_D1",
				sort_name = "C_Event_H_PrisonNightmare_HesGotExperience_D1",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			orange_4 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_PrisonNightmare_SalemAsylum_D4",
				sort_name = "C_Event_H_PrisonNightmare_SalemAsylum_D4",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.mayhem,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.events
				}
			},
			death_33 = {
				icon_id = "C_Hector_H_Rats_AllDiffs_D5",
				ladder = "H_Rats",
				sort_name = "C_Hector_H_Rats_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			pick_7 = {
				icon_id = "C_Hector_H_Rats_AllDiffs_D4",
				ladder = "H_Rats",
				sort_name = "C_Hector_H_Rats_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			axe_7 = {
				icon_id = "C_Hector_H_Rats_AllDiffs_D6",
				ladder = "H_Rats",
				sort_name = "C_Hector_H_Rats_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			ovk_1 = {
				additional_id = true,
				sort_name = "C_Hector_H_Rats_Cooking_D3",
				icon_id = "C_Hector_H_Rats_Cooking_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.inventory.mask,
					tags.inventory.weapon,
					tags.teamwork.players_4,
					tags.contracts.hector
				}
			},
			gage4_12 = {
				additional_id = true,
				sort_name = "C_Hector_H_Rats_FourMonkeys_D3",
				icon_id = "C_Hector_H_Rats_FourMonkeys_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.teamwork.players_4,
					tags.contracts.hector
				}
			},
			f_in_chemistry = {
				sort_name = "C_Hector_H_Rats_FinChem",
				icon_id = "C_Hector_H_Rats_FinChem",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.bain,
					tags.contracts.hector
				}
			},
			halloween_1 = {
				sort_name = "C_Hector_H_Rats_IAmTheOne",
				icon_id = "C_Hector_H_Rats_IAmTheOne",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			halloween_2 = {
				sort_name = "C_Hector_H_Rats_FullMeasure_D3",
				icon_id = "C_Hector_H_Rats_FullMeasure_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			caribbean_pirate = {
				sort_name = "C_Hector_H_Rats_Caribbean",
				icon_id = "C_Hector_H_Rats_Caribbean",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			short_fuse = {
				sort_name = "C_Hector_H_Rats_Short",
				icon_id = "C_Hector_H_Rats_Short",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.hector
				}
			},
			tip_the_scales = {
				additional_id = true,
				sort_name = "C_Hoxton_H_SafeHouse_Tip",
				icon_id = "C_Hoxton_H_SafeHouse_Tip",
				tags = {
					tags.progress.heisting,
					tags.contracts.hoxton
				}
			},
			pick_666 = {
				icon_id = "C_Event_H_SafeHouseNightmare_AllDiffs_D4",
				ladder = "H_SafeHouseNightmare",
				sort_name = "C_Event_H_SafeHouseNightmare_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			halloween_nightmare_1 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_SafeHouseNightmare_AllDiffs_D0",
				ladder = "H_SafeHouseNightmare",
				sort_name = "C_Event_H_SafeHouseNightmare_AllDiffs_D0",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			halloween_nightmare_4 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_SafeHouseNightmare_AllDiffs_D3",
				ladder = "H_SafeHouseNightmare",
				sort_name = "C_Event_H_SafeHouseNightmare_AllDiffs_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			halloween_nightmare_2 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_SafeHouseNightmare_AllDiffs_D1",
				ladder = "H_SafeHouseNightmare",
				sort_name = "C_Event_H_SafeHouseNightmare_AllDiffs_D1",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			axe_666 = {
				icon_id = "C_Event_H_SafeHouseNightmare_AllDiffs_D6",
				ladder = "H_SafeHouseNightmare",
				sort_name = "C_Event_H_SafeHouseNightmare_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			halloween_nightmare_5 = {
				icon_id = "C_Event_H_SafeHouseNightmare_AllDiffs_D5",
				ladder = "H_SafeHouseNightmare",
				sort_name = "C_Event_H_SafeHouseNightmare_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			halloween_nightmare_3 = {
				need_unlock_icons = true,
				icon_id = "C_Event_H_SafeHouseNightmare_AllDiffs_D2",
				ladder = "H_SafeHouseNightmare",
				sort_name = "C_Event_H_SafeHouseNightmare_AllDiffs_D2",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.very_hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.events
				}
			},
			cane_3 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_Santa_EuroBag_D3",
				sort_name = "C_Vlad_H_Santa_EuroBag_D3",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			cane_4 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_Santa_PumpedUp",
				sort_name = "C_Vlad_H_Santa_PumpedUp",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_4,
					tags.contracts.vlad
				}
			},
			cane_1 = {
				icon_id = "C_Vlad_H_Santa_AllDiffs_D5",
				ladder = "H_Santa",
				sort_name = "C_Vlad_H_Santa_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			pick_54 = {
				icon_id = "C_Vlad_H_Santa_AllDiffs_D4",
				ladder = "H_Santa",
				sort_name = "C_Vlad_H_Santa_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			axe_54 = {
				icon_id = "C_Vlad_H_Santa_AllDiffs_D6",
				ladder = "H_Santa",
				sort_name = "C_Vlad_H_Santa_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			cane_2 = {
				sort_name = "C_Vlad_H_Santa_SantaSlays_D3",
				icon_id = "C_Vlad_H_Santa_SantaSlays_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.vlad
				}
			},
			cane_5 = {
				sort_name = "C_Vlad_H_Santa_OnlySanta",
				icon_id = "C_Vlad_H_Santa_OnlySanta",
				progress = true,
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.vlad
				}
			},
			friend_1 = {
				icon_id = "C_Butcher_H_Scarface_AllDiffs_D4",
				ladder = "H_Scarface",
				sort_name = "C_Butcher_H_Scarface_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			friend_2 = {
				icon_id = "C_Butcher_H_Scarface_AllDiffs_D5",
				ladder = "H_Scarface",
				sort_name = "C_Butcher_H_Scarface_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			friend_3 = {
				icon_id = "C_Butcher_H_Scarface_AllDiffs_D6",
				ladder = "H_Scarface",
				sort_name = "C_Butcher_H_Scarface_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.the_butcher
				}
			},
			friend_4 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_Scarface_SayHello_D3",
				sort_name = "C_Butcher_H_Scarface_SayHello_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.inventory.weapon,
					tags.contracts.the_butcher
				}
			},
			friend_5 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_Scarface_LookAtThese",
				sort_name = "C_Butcher_H_Scarface_LookAtThese",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.contracts.the_butcher
				}
			},
			friend_6 = {
				need_unlock_icons = true,
				icon_id = "C_Butcher_H_Scarface_WhatYouWant_D4",
				sort_name = "C_Butcher_H_Scarface_WhatYouWant_D4",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.mayhem,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.the_butcher
				}
			},
			kosugi_6 = {
				icon_id = "C_Bain_H_ShadowRaid_AllDiffs_D5",
				ladder = "H_ShadowRaid",
				sort_name = "C_Bain_H_ShadowRaid_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			pick_29 = {
				icon_id = "C_Bain_H_ShadowRaid_AllDiffs_D4",
				ladder = "H_ShadowRaid",
				sort_name = "C_Bain_H_ShadowRaid_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			axe_29 = {
				icon_id = "C_Bain_H_ShadowRaid_AllDiffs_D6",
				ladder = "H_ShadowRaid",
				sort_name = "C_Bain_H_ShadowRaid_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			ovk_2 = {
				additional_id = true,
				sort_name = "C_Bain_H_ShadowRaid_IHaveNoIdea",
				icon_id = "C_Bain_H_ShadowRaid_IHaveNoIdea",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.inventory.weapon,
					tags.contracts.bain
				}
			},
			kosugi_5 = {
				sort_name = "C_Bain_H_ShadowRaid_IAmNinja",
				icon_id = "C_Bain_H_ShadowRaid_IAmNinja",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			kosugi_1 = {
				sort_name = "C_Bain_H_ShadowRaid_IWillFade",
				icon_id = "C_Bain_H_ShadowRaid_IWillFade",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			kosugi_3 = {
				sort_name = "C_Bain_H_ShadowRaid_IWillTake",
				icon_id = "C_Bain_H_ShadowRaid_IWillTake",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			kosugi_4 = {
				need_unlock_icons = true,
				icon_id = "C_Bain_H_ShadowRaid_IWillWalk",
				sort_name = "C_Bain_H_ShadowRaid_IWillWalk",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			kosugi_2 = {
				additional_id = true,
				sort_name = "C_Bain_H_ShadowRaid_IWillPass",
				icon_id = "C_Bain_H_ShadowRaid_IWillPass",
				tags = {
					tags.progress.heisting,
					tags.tactics.stealth,
					tags.teamwork.players_1_to_4,
					tags.contracts.bain
				}
			},
			farm_5 = {
				icon_id = "C_Classics_H_Slaughterhouse_AllDiffs_D5",
				ladder = "H_Slaughterhouse",
				sort_name = "C_Classics_H_Slaughterhouse_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pick_38 = {
				icon_id = "C_Classics_H_Slaughterhouse_AllDiffs_D4",
				ladder = "H_Slaughterhouse",
				sort_name = "C_Classics_H_Slaughterhouse_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			axe_38 = {
				icon_id = "C_Classics_H_Slaughterhouse_AllDiffs_D6",
				ladder = "H_Slaughterhouse",
				sort_name = "C_Classics_H_Slaughterhouse_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			farm_1 = {
				sort_name = "C_Classics_H_Slaughterhouse_NotHard_D3",
				icon_id = "C_Classics_H_Slaughterhouse_NotHard_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			farm_3 = {
				additional_id = true,
				sort_name = "C_Classics_H_Slaughterhouse_Making_D3",
				icon_id = "C_Classics_H_Slaughterhouse_Making_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.classic
				}
			},
			farm_6 = {
				additional_id = true,
				sort_name = "C_Classics_H_Slaughterhouse_PorkRoyale_D3",
				icon_id = "C_Classics_H_Slaughterhouse_PorkRoyale_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			farm_2 = {
				sort_name = "C_Classics_H_Slaughterhouse_ButHow",
				icon_id = "C_Classics_H_Slaughterhouse_ButHow",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			farm_4 = {
				sort_name = "C_Classics_H_Slaughterhouse_Pyromaniacs",
				icon_id = "C_Classics_H_Slaughterhouse_Pyromaniacs",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.classic
				}
			},
			moon_1 = {
				icon_id = "C_Vlad_H_StealingXmas_AllDiffs_D4",
				ladder = "H_StealingXmas",
				sort_name = "C_Vlad_H_StealingXmas_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			moon_2 = {
				icon_id = "C_Vlad_H_StealingXmas_AllDiffs_D5",
				ladder = "H_StealingXmas",
				sort_name = "C_Vlad_H_StealingXmas_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			moon_3 = {
				icon_id = "C_Vlad_H_StealingXmas_AllDiffs_D6",
				ladder = "H_StealingXmas",
				sort_name = "C_Vlad_H_StealingXmas_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			moon_4 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_StealingXmas_Imitations",
				sort_name = "C_Vlad_H_StealingXmas_Imitations",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			moon_5 = {
				sort_name = "C_Vlad_H_StealingXmas_Grinch_D3",
				icon_id = "C_Vlad_H_StealingXmas_Grinch_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			moon_6 = {
				sort_name = "C_Vlad_H_StealingXmas_Christmas",
				icon_id = "C_Vlad_H_StealingXmas_Christmas",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			bullet_dodger = {
				additional_id = true,
				sort_name = "C_Escape_H_Street_Bullet",
				icon_id = "C_Escape_H_Street_Bullet",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.escape
				}
			},
			armored_3 = {
				sort_name = "C_Bain_H_TransportAny_IfYouLikedIt",
				icon_id = "C_Bain_H_TransportAny_IfYouLikedIt",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.bain
				}
			},
			armored_2 = {
				sort_name = "C_Bain_H_TransportAny_ButWait",
				icon_id = "C_Bain_H_TransportAny_ButWait",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			armored_4 = {
				sort_name = "C_Bain_H_TransportAny_IDoWhat_D3",
				icon_id = "C_Bain_H_TransportAny_IDoWhat_D3",
				progress = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.inventory.mask,
					tags.contracts.bain
				}
			},
			death_20 = {
				icon_id = "C_Bain_H_TransportCrossroads_AllDiffs_D5",
				ladder = "H_TransportCrossroads",
				sort_name = "C_Bain_H_TransportCrossroads_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_21 = {
				icon_id = "C_Bain_H_TransportCrossroads_AllDiffs_D4",
				ladder = "H_TransportCrossroads",
				sort_name = "C_Bain_H_TransportCrossroads_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_21 = {
				icon_id = "C_Bain_H_TransportCrossroads_AllDiffs_D6",
				ladder = "H_TransportCrossroads",
				sort_name = "C_Bain_H_TransportCrossroads_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			death_21 = {
				icon_id = "C_Bain_H_TransportDowntown_AllDiffs_D5",
				ladder = "H_TransportDowntown",
				sort_name = "C_Bain_H_TransportDowntown_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_22 = {
				icon_id = "C_Bain_H_TransportDowntown_AllDiffs_D4",
				ladder = "H_TransportDowntown",
				sort_name = "C_Bain_H_TransportDowntown_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_22 = {
				icon_id = "C_Bain_H_TransportDowntown_AllDiffs_D6",
				ladder = "H_TransportDowntown",
				sort_name = "C_Bain_H_TransportDowntown_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			death_22 = {
				icon_id = "C_Bain_H_TransportHarbor_AllDiffs_D5",
				ladder = "H_TransportHarbor",
				sort_name = "C_Bain_H_TransportHarbor_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_23 = {
				icon_id = "C_Bain_H_TransportHarbor_AllDiffs_D4",
				ladder = "H_TransportHarbor",
				sort_name = "C_Bain_H_TransportHarbor_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_23 = {
				icon_id = "C_Bain_H_TransportHarbor_AllDiffs_D6",
				ladder = "H_TransportHarbor",
				sort_name = "C_Bain_H_TransportHarbor_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			death_23 = {
				icon_id = "C_Bain_H_TransportPark_AllDiffs_D5",
				ladder = "H_TransportPark",
				sort_name = "C_Bain_H_TransportPark_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_24 = {
				icon_id = "C_Bain_H_TransportPark_AllDiffs_D4",
				ladder = "H_TransportPark",
				sort_name = "C_Bain_H_TransportPark_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_24 = {
				icon_id = "C_Bain_H_TransportPark_AllDiffs_D6",
				ladder = "H_TransportPark",
				sort_name = "C_Bain_H_TransportPark_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			death_25 = {
				icon_id = "C_Bain_H_TransportTrainHeist_AllDiffs_D5",
				ladder = "H_TransportTrainHeist",
				sort_name = "C_Bain_H_TransportTrainHeist_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_26 = {
				icon_id = "C_Bain_H_TransportTrainHeist_AllDiffs_D4",
				ladder = "H_TransportTrainHeist",
				sort_name = "C_Bain_H_TransportTrainHeist_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_26 = {
				icon_id = "C_Bain_H_TransportTrainHeist_AllDiffs_D6",
				ladder = "H_TransportTrainHeist",
				sort_name = "C_Bain_H_TransportTrainHeist_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			armored_6 = {
				additional_id = true,
				sort_name = "C_Bain_H_TransportTrainHeist_LetThem",
				icon_id = "C_Bain_H_TransportTrainHeist_LetThem",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.bain
				}
			},
			armored_1 = {
				sort_name = "C_Bain_H_TransportTrainHeist_WereGonnaNeed",
				icon_id = "C_Bain_H_TransportTrainHeist_WereGonnaNeed",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			death_24 = {
				icon_id = "C_Bain_H_TransportUnderpass_AllDiffs_D5",
				ladder = "H_TransportUnderpass ",
				sort_name = "C_Bain_H_TransportUnderpass_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			pick_25 = {
				icon_id = "C_Bain_H_TransportUnderpass_AllDiffs_D4",
				ladder = "H_TransportUnderpass ",
				sort_name = "C_Bain_H_TransportUnderpass_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			axe_25 = {
				icon_id = "C_Bain_H_TransportUnderpass_AllDiffs_D6",
				ladder = "H_TransportUnderpass ",
				sort_name = "C_Bain_H_TransportUnderpass_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.bain
				}
			},
			death_1 = {
				icon_id = "C_Vlad_H_Ukrainian_AllDiffs_D5",
				ladder = "H_Ukrainian",
				sort_name = "C_Vlad_H_Ukrainian_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			pick_1 = {
				icon_id = "C_Vlad_H_Ukrainian_AllDiffs_D4",
				ladder = "H_Ukrainian",
				sort_name = "C_Vlad_H_Ukrainian_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			axe_1 = {
				icon_id = "C_Vlad_H_Ukrainian_AllDiffs_D6",
				ladder = "H_Ukrainian",
				sort_name = "C_Vlad_H_Ukrainian_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.contracts.vlad
				}
			},
			lets_do_this = {
				sort_name = "C_Vlad_H_Ukrainian_LetsDoTh",
				icon_id = "C_Vlad_H_Ukrainian_LetsDoTh",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.tactics.timed,
					tags.contracts.vlad
				}
			},
			man_2 = {
				sort_name = "C_Classics_H_Undercover_NotEven_D3",
				icon_id = "C_Classics_H_Undercover_NotEven_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.teamwork.players_1_to_4,
					tags.contracts.classic
				}
			},
			man_5 = {
				additional_id = true,
				sort_name = "C_Classics_H_Undercover_BlowOut_D3",
				icon_id = "C_Classics_H_Undercover_BlowOut_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			man_1 = {
				icon_id = "C_Classics_H_Undercover_AllDiffs_D5",
				ladder = "H_Undercover",
				sort_name = "C_Classics_H_Undercover_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			pick_52 = {
				icon_id = "C_Classics_H_Undercover_AllDiffs_D4",
				ladder = "H_Undercover",
				sort_name = "C_Classics_H_Undercover_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			axe_52 = {
				icon_id = "C_Classics_H_Undercover_AllDiffs_D6",
				ladder = "H_Undercover",
				sort_name = "C_Classics_H_Undercover_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			man_3 = {
				need_unlock_icons = true,
				icon_id = "C_Classics_H_Undercover_KeepClear",
				sort_name = "C_Classics_H_Undercover_KeepClear",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.classic
				}
			},
			man_4 = {
				need_unlock_icons = true,
				icon_id = "C_Classics_H_Undercover_TheSaviour",
				sort_name = "C_Classics_H_Undercover_TheSaviour",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			death_34 = {
				icon_id = "C_Hector_H_Watchdogs_AllDiffs_D5",
				ladder = "H_Watchdogs",
				sort_name = "C_Hector_H_Watchdogs_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			pick_5 = {
				icon_id = "C_Hector_H_Watchdogs_AllDiffs_D4",
				ladder = "H_Watchdogs",
				sort_name = "C_Hector_H_Watchdogs_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			axe_5 = {
				icon_id = "C_Hector_H_Watchdogs_AllDiffs_D6",
				ladder = "H_Watchdogs",
				sort_name = "C_Hector_H_Watchdogs_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			ovk_4 = {
				additional_id = true,
				sort_name = "C_Hector_H_Watchdogs_WeAreRockstars_D3",
				icon_id = "C_Hector_H_Watchdogs_WeAreRockstars_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.inventory.weapon,
					tags.teamwork.players_1_to_4,
					tags.contracts.hector
				}
			},
			gage5_6 = {
				need_unlock_icons = true,
				icon_id = "C_Hector_H_Watchdogs_Unusual_D3",
				sort_name = "C_Hector_H_Watchdogs_Unusual_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.unlock.weapon,
					tags.tactics.loud,
					tags.tactics.stealth,
					tags.inventory.mask,
					tags.teamwork.players_4,
					tags.contracts.hector
				}
			},
			hot_wheels = {
				sort_name = "C_Hector_H_Watchdogs_Coming",
				icon_id = "C_Hector_H_Watchdogs_Coming",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			fish_ai = {
				sort_name = "C_Hector_H_Watchdogs_Fish",
				icon_id = "C_Hector_H_Watchdogs_Fish",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.hector
				}
			},
			deer_5 = {
				icon_id = "C_Vlad_H_XMas_AllDiffs_D5",
				ladder = "H_XMas",
				sort_name = "C_Vlad_H_XMas_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			deer_2 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_XMas_AllDiffs_D1",
				ladder = "H_XMas",
				sort_name = "C_Vlad_H_XMas_AllDiffs_D1",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			pick_59 = {
				icon_id = "C_Vlad_H_XMas_AllDiffs_D4",
				ladder = "H_XMas",
				sort_name = "C_Vlad_H_XMas_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			deer_1 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_XMas_AllDiffs_D0",
				ladder = "H_XMas",
				sort_name = "C_Vlad_H_XMas_AllDiffs_D0",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			axe_59 = {
				icon_id = "C_Vlad_H_XMas_AllDiffs_D6",
				ladder = "H_XMas",
				sort_name = "C_Vlad_H_XMas_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			deer_4 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_XMas_AllDiffs_D3",
				ladder = "H_XMas",
				sort_name = "C_Vlad_H_XMas_AllDiffs_D3",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.overkill,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			deer_3 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_XMas_AllDiffs_D2",
				ladder = "H_XMas",
				sort_name = "C_Vlad_H_XMas_AllDiffs_D2",
				additional_id = true,
				unlock_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.very_hard,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			deer_6 = {
				need_unlock_icons = true,
				icon_id = "C_Vlad_H_XMas_Riders_D5",
				sort_name = "C_Vlad_H_XMas_Riders_D5",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.difficulty.death_wish,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.inventory.mask,
					tags.teamwork.players_1_to_4,
					tags.contracts.vlad
				}
			},
			deer_7 = {
				sort_name = "C_Vlad_H_XMas_Impossible",
				icon_id = "C_Vlad_H_XMas_Impossible",
				tags = {
					tags.progress.heisting,
					tags.tactics.loud,
					tags.contracts.vlad
				}
			},
			spa_1 = {
				icon_id = "C_Continental_H_YachtHeist_AllDiffs_D4",
				ladder = "H_YachtHeist",
				sort_name = "C_Continental_H_YachtHeist_AllDiffs_D4",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.mayhem,
					tags.tactics.stealth,
					tags.contracts.the_continental
				}
			},
			spa_2 = {
				icon_id = "C_Continental_H_YachtHeist_AllDiffs_D5",
				ladder = "H_YachtHeist",
				sort_name = "C_Continental_H_YachtHeist_AllDiffs_D5",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.death_wish,
					tags.tactics.stealth,
					tags.contracts.the_continental
				}
			},
			spa_3 = {
				icon_id = "C_Continental_H_YachtHeist_AllDiffs_D6",
				ladder = "H_YachtHeist",
				sort_name = "C_Continental_H_YachtHeist_AllDiffs_D6",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.one_down,
					tags.tactics.stealth,
					tags.contracts.the_continental
				}
			},
			spa_4 = {
				additional_id = true,
				sort_name = "C_Continental_H_YachtHeist_Thalasso_D3",
				icon_id = "C_Continental_H_YachtHeist_Thalasso_D3",
				tags = {
					tags.progress.heisting,
					tags.difficulty.overkill,
					tags.tactics.stealth,
					tags.tactics.timed,
					tags.contracts.the_continental
				}
			},
			spa_5 = {
				need_unlock_icons = true,
				icon_id = "C_Continental_H_YachtHeist_Pacifish",
				sort_name = "C_Continental_H_YachtHeist_Pacifish",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.contracts.the_continental
				}
			},
			spa_6 = {
				need_unlock_icons = true,
				icon_id = "C_Continental_H_YachtHeist_Blood",
				sort_name = "C_Continental_H_YachtHeist_Blood",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.stealth,
					tags.tactics.killer,
					tags.contracts.the_continental
				}
			},
			eng_4 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TheOneThatSurvived",
				progress = true,
				sort_name = "Other_H_Any_TheOneThatSur",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			eng_3 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TheOneWhoDeclared",
				progress = true,
				sort_name = "Other_H_Any_TheOneWho",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			eng_2 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TheOneThatHad",
				progress = true,
				sort_name = "Other_H_Any_TheOneThatHad",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			eng_1 = {
				need_unlock_icons = true,
				icon_id = "Other_H_Any_TheOnlyOne",
				progress = true,
				sort_name = "Other_H_Any_TheOnlyOne",
				unlock_id = true,
				tags = {
					tags.progress.heisting,
					tags.unlock.mask,
					tags.tactics.loud,
					tags.tactics.stealth
				}
			},
			glace_1 = {
				icon_id = "C_Classics_H_GreenBridge_AllDiffs_D0",
				ladder = "H_GreenBridge",
				sort_name = "C_Classics_H_GreenBridge_AllDiffs_D0",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			glace_2 = {
				icon_id = "C_Classics_H_GreenBridge_AllDiffs_D1",
				ladder = "H_GreenBridge",
				sort_name = "C_Classics_H_GreenBridge_AllDiffs_D1",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.hard,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			glace_3 = {
				icon_id = "C_Classics_H_GreenBridge_AllDiffs_D2",
				ladder = "H_GreenBridge",
				sort_name = "C_Classics_H_GreenBridge_AllDiffs_D2",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.very_hard,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			glace_4 = {
				icon_id = "C_Classics_H_GreenBridge_AllDiffs_D3",
				ladder = "H_GreenBridge",
				sort_name = "C_Classics_H_GreenBridge_AllDiffs_D3",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_1 = {
				icon_id = "C_Classics_H_HeatStreet_AllDiffs_D0",
				ladder = "H_HeatStreet",
				sort_name = "C_Classics_H_HeatStreet_AllDiffs_D0",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.normal,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_2 = {
				icon_id = "C_Classics_H_HeatStreet_AllDiffs_D1",
				ladder = "H_HeatStreet",
				sort_name = "C_Classics_H_HeatStreet_AllDiffs_D1",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.hard,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_3 = {
				icon_id = "C_Classics_H_HeatStreet_AllDiffs_D2",
				ladder = "H_HeatStreet",
				sort_name = "C_Classics_H_HeatStreet_AllDiffs_D2",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.very_hard,
					tags.tactics.loud,
					tags.contracts.classic
				}
			},
			run_4 = {
				icon_id = "C_Classics_H_HeatStreet_AllDiffs_D3",
				ladder = "H_HeatStreet",
				sort_name = "C_Classics_H_HeatStreet_AllDiffs_D3",
				additional_id = true,
				tags = {
					tags.progress.completion,
					tags.difficulty.overkill,
					tags.tactics.loud,
					tags.contracts.classic
				}
			}
		}
	end

	AchievementsTweakData = AchievementsTweakData or class()

	function AchievementsTweakData:init(tweak_data)
		local normal_and_above = {
			"normal",
			"hard",
			"overkill",
			"overkill_145",
			"easy_wish",
			"overkill_290",
			"sm_wish"
		}
		local hard_and_above = {
			"hard",
			"overkill",
			"overkill_145",
			"easy_wish",
			"overkill_290",
			"sm_wish"
		}
		local veryhard_and_above = {
			"overkill",
			"overkill_145",
			"easy_wish",
			"overkill_290",
			"sm_wish"
		}
		local overkill_and_above = {
			"overkill_145",
			"easy_wish",
			"overkill_290",
			"sm_wish"
		}
		local easywish_and_above = {
			"easy_wish",
			"overkill_290",
			"sm_wish"
		}
		local deathwish_and_above = {
			"overkill_290",
			"sm_wish"
		}
		local sm_wish_and_above = {"sm_wish"}
		self.im_a_healer_tank_damage_dealer = 10
		self.iron_man = "level_7"
		self.going_places = 1000000
		self.spend_money_to_make_money = 1000000
		self.fully_loaded = 9
		self.weapon_collector = 18
		self.arms_dealer = 72
		self.how_do_you_like_me_now = "level_1"
		self.like_an_angry_bear = "bear"
		self.merry_christmas = "santa_happy"
		self.witch_doctor = {
			stat = "halloween_4_stats",
			mask = "witch"
		}
		self.its_alive_its_alive = {
			stat = "halloween_5_stats",
			mask = "frank"
		}
		self.pump_action = {
			stat = "halloween_6_stats",
			mask = "pumpkin_king"
		}
		self.cant_hear_you_scream = {
			stat = "halloween_7_stats",
			mask = "venomorph"
		}
		self.unique_selling_point = "usp"
		self.relation_with_bulldozer = {
			stat = "armored_8_stat",
			mask = "clinton"
		}
		self.no_we_cant = {
			stat = "armored_10_stat",
			mask = "obama"
		}
		self.heat_around_the_corner = "heat"
		self.fire_in_the_hole = {
			stat = "gage_9_stats",
			grenade = {
				"frag",
				"frag_com",
				"concussion",
				"dada_com"
			}
		}
		self.level_achievements = {
			you_gotta_start_somewhere = {
				award = "you_gotta_start_somewhere",
				level = 5
			},
			guilty_of_crime = {
				award = "guilty_of_crime",
				level = 10
			},
			gone_in_30_seconds = {
				award = "gone_in_30_seconds",
				level = 25
			},
			armed_and_dangerous = {
				award = "armed_and_dangerous",
				level = 50
			},
			big_shot = {
				award = "big_shot",
				level = 75
			},
			most_wanted = {
				award = "most_wanted",
				level = 100
			},
			story_basics_lvl10 = {
				story = "story_basics_lvl10",
				level = 10
			},
			story_chill_level = {
				story = "story_chill_level",
				level = 25
			},
			story_half_lvl = {
				story = "story_half_lvl",
				level = 50
			}
		}
		self.tango_4 = {
			award = "tango_achieve_4",
			count = 10,
			difficulty = overkill_and_above
		}
		self.infamous = {
			"ignominy_1",
			"ignominy_2",
			"ignominy_3",
			"ignominy_4",
			"ignominy_5",
			"ignominy_6",
			"ignominy_7",
			"ignominy_8",
			"ignominy_9",
			"ignominy_10",
			"ignominy_11",
			"ignominy_12",
			"ignominy_13",
			"ignominy_14",
			"ignominy_15",
			"ignominy_16",
			"ignominy_17",
			"ignominy_18",
			"ignominy_19",
			"ignominy_20",
			"ignominy_21",
			"ignominy_22",
			"ignominy_23",
			"ignominy_24",
			"ignominy_25"
		}

		self.final_rule = {
			heist = "nightclub",
			stat = "gage2_3_stats",
			melee_type = "fists"
		}
		self.easy_as_breathing = {
			award = "gage2_4",
			weapon_type = "lmg",
			count = 10
		}
		self.first_blood = {
			award = "gage2_5",
			count = 220,
			weapon_type = "lmg"
		}
		self.in_town_you_are_law = {
			award = "gage2_6",
			weapon_type = "shotgun"
		}
		self.dont_push_it = {
			award = "gage2_7",
			weapon = "deagle"
		}
		self.finally = {award = "gage2_8"}
		self.demise_knuckles = "brass_knuckles"
		self.vote_for_change = "g22c"
		self.steam_500k = "akm_gold"
		self.shotgun_one_o_one = {
			award = "gage4_5",
			count = 50,
			accuracy = 101
		}
		self.close_and_personal = {
			kill_type = "melee",
			count = 50,
			award = "gage4_3"
		}
		self.cavity = {
			award = "bulldog_4",
			melee_type = "toothbrush"
		}
		self.double_trouble = {
			award = "ovk_9",
			converted_cops = 4,
			difficulty = overkill_and_above
		}
		self.never_let_you_go = {
			weapon_id = "m134",
			timer = 25,
			award = "ovk_3"
		}
		self.nothing_to_see_here = {
			timer = 90,
			award = "slakt_2",
			total_value = 4
		}
		self.drive_away = "fort_2"
		self.disco_inferno = "grill_1"
		self.overgrill = "grill_4"
		self.pickup_sticks = {
			weapon_category = "bow",
			stat = "scorpion_1_stats"
		}
		self.pincushion = {
			award = "scorpion_3",
			weapon_category = "bow",
			enemy = "tank",
			count = 10
		}
		self.jordan_1 = "brooklyn_1"
		self.jordan_2 = {
			award = "brooklyn_2",
			timer = 30,
			count = 100
		}
		self.one_man_army = {
			award = "gage5_3",
			equipped = {
				secondary = "serbu",
				primary = "gre_m79",
				armor = "level_7"
			}
		}
		self.man_5 = {
			weapon_category = "grenade_launcher",
			award = "man_5",
			job = "man",
			difficulty = overkill_and_above
		}
		self.mad_5 = "mad_5"
		self.peta_4 = {
			carry_id = "goat",
			award = "peta_4",
			count = 1
		}
		self.weapons_owned = {
			gage4_2 = {
				"huntsman",
				"r870",
				"saiga",
				"ksg",
				"striker",
				"serbu",
				"benelli"
			},
			gage5_4 = {
				"gre_m79",
				"g3",
				"galil",
				"famas"
			}
		}
		self.gage_assignments = {
			green_mantis = "gmod_1_stats",
			yellow_bull = "gmod_2_stats",
			red_spider = "gmod_3_stats",
			blue_eagle = "gmod_4_stats",
			purple_snake = "gmod_5_stats"
		}
		self.gonna_find_them_all = 1
		self.weapon_blueprints = {
			gmod_7 = {
				"wpn_fps_upg_fg_jp",
				"wpn_fps_upg_m4_m_quad",
				"wpn_fps_upg_ass_ns_jprifles"
			},
			gmod_8 = {
				"wpn_fps_upg_o_rmr",
				"wpn_fps_upg_pis_ns_flash"
			},
			gmod_9 = {
				"wpn_fps_upg_fg_smr",
				"wpn_fps_upg_ass_ns_surefire",
				"wpn_fps_upg_o_eotech_xps",
				"wpn_fps_upg_m4_s_crane",
				"wpn_fps_upg_fl_ass_peq15"
			},
			gmod_10 = {
				"wpn_fps_upg_fg_midwest",
				"wpn_fps_upg_ak_b_draco",
				"wpn_fps_upg_ak_m_quad",
				"wpn_fps_upg_ass_ns_linear"
			},
			eagle_4 = {
				"wpn_fps_pis_c96_nozzle",
				"wpn_fps_pis_c96_sight"
			}
		}
		self.explosion_achievements = {shock_awe = {
			count = 4,
			award = "gage4_9",
			weapon_type = "shotgun"
		}}
		self.dot_achievements = {turtles_4 = {
			award = "turtles_4",
			count = 3,
			variant = "poison"
		}}
		self.grenade_achievements = {
			bada_boom = {
				kill = true,
				grenade_type = "launcher_frag",
				count = 4,
				award = "gage5_2"
			},
			artillery_barrage = {
				kill = true,
				grenade_type = "launcher_frag",
				distance = 4000,
				stat = "gage5_5_stats"
			},
			boom_shakalaka = {
				kill = true,
				flying_strike = true,
				award = "gage5_7",
				enemy = "spooc",
				grenade_type = "launcher_frag"
			},
			not_invited = {
				timer = 10,
				grenade_type = "launcher_frag_m32",
				award = "grill_3",
				kill_count = 10
			},
			threemite = {
				kill = true,
				grenade_type = "dynamite",
				count = 3,
				award = "scorpion_2"
			},
			steel_3 = {
				kill = true,
				grenade_type = "wpn_prj_jav",
				award = "steel_3",
				enemy = "spooc"
			},
			pim_2 = {
				kill = true,
				grenade_type = "wpn_prj_target",
				success = true,
				job = "dark",
				crouching = true,
				stat = "pim_2_stats",
				is_civilian = false
			},
			tango_2 = {
				kill = true,
				stat = "tango_2_stats",
				enemy = "sniper",
				grenade_type = "launcher_frag_arbiter"
			},
			any_kills = {
				kill = true,
				challenge_stat = "any_kills"
			},
			any_sniper_kills = {
				kill = true,
				enemy = "sniper",
				challenge_stat = "any_sniper_kills"
			},
			any_shield_kills = {
				kill = true,
				enemy = "shield",
				challenge_stat = "any_shield_kills"
			},
			any_taser_kills = {
				kill = true,
				enemy = "taser",
				challenge_stat = "any_taser_kills"
			},
			any_tank_kills = {
				kill = true,
				enemy = "tank",
				challenge_stat = "any_tank_kills"
			},
			any_spooc_kills = {
				kill = true,
				enemy = "spooc",
				challenge_stat = "any_spooc_kills"
			},
			trophy_special_kills = {
				kill = true,
				trophy_stat = "trophy_special_kills",
				enemies = {
					"sniper",
					"shield",
					"taser",
					"tank",
					"spooc",
					"medic"
				}
			},
			trophy_ace = {
				kill = true,
				trophy_stat = "trophy_ace",
				grenade_type = "wpn_prj_ace",
				difficulties = overkill_and_above
			},
			trophy_washington = {
				kill = true,
				trophy_stat = "trophy_washington"
			},
			trophy_medic = {
				kill = true,
				trophy_stat = "trophy_medic",
				enemies = {"medic"}
			},
			daily_grenades = {
				kill = true,
				trophy_stat = "daily_grenades",
				grenade_type = "frag",
				is_civilian = false
			},
			daily_grenades_community = {
				kill = true,
				trophy_stat = "daily_grenades",
				grenade_type = "frag_com",
				is_civilian = false
			},
			daily_grenades_dynamite = {
				kill = true,
				trophy_stat = "daily_grenades",
				grenade_type = "dynamite",
				is_civilian = false
			},
			daily_grenades_dada = {
				kill = true,
				trophy_stat = "daily_grenades",
				grenade_type = "dada_com",
				is_civilian = false
			}
		}
		self.shotgun_single_shot_kills = {tango_1 = {
			award = "tango_achieve_1",
			count = 3,
			is_not_civilian = true,
			headshot = true,
			blueprint = {"wpn_fps_upg_ns_duck"}
		}}
		self.enemy_kill_achievements = {
			try_out_your_usp = {
				weapon = "usp",
				stat = "halloween_8_stats"
			},
			license_to_kill = {
				weapon = "ppk",
				stat = "armored_5_stat"
			},
			im_not_a_crook = {
				weapon = "s552",
				stat = "armored_7_stat",
				enemy = "sniper",
				mask = "nixon"
			},
			fool_me_once = {
				weapon = "m45",
				stat = "armored_9_stat",
				enemy = "shield",
				mask = "bush"
			},
			wanted = {
				weapon = "ak5",
				stat = "gage_1_stats",
				mask = "goat"
			},
			three_thousand_miles = {
				weapon = "p90",
				stat = "gage_2_stats",
				mask = "panda"
			},
			commando = {
				weapon = "aug",
				stat = "gage_3_stats",
				mask = "pitbull"
			},
			public_enemies = {
				weapon = "colt_1911",
				stat = "gage_4_stats",
				mask = "eagle"
			},
			inception = {
				weapon = "scar",
				stat = "gage_5_stats"
			},
			hard_corps = {
				weapon = "mp7",
				stat = "gage_6_stats"
			},
			above_the_law = {
				weapon = "p226",
				stat = "gage_7_stats"
			},
			surprise_motherfucker = {
				weapon = "m95",
				stat = "gage3_12_stats",
				enemy = "tank"
			},
			man_with_golden_gun = {
				weapon = "akm_gold",
				stat = "gage3_2_stats",
				enemy = "tank",
				enemy_weapon = "m249"
			},
			lord_of_flies = {
				in_head = true,
				stat = "gage3_3_stats",
				weapon_type = "snp"
			},
			arachnes_curse = {
				in_head = true,
				stat = "gage3_4_stats",
				weapon_type = "snp"
			},
			pest_control = {
				in_head = true,
				stat = "gage3_5_stats",
				weapon_type = "snp"
			},
			seer_of_death = {
				in_head = true,
				stat = "gage3_6_stats",
				weapon_type = "snp"
			},
			far_far_away = {
				weapon = "m95",
				stat = "gage3_7_stats",
				distance = 4000
			},
			last_action_villian = {
				in_head = true,
				weapon = "r93",
				award = "gage3_8",
				on_zipline = true
			},
			dodge_this = {
				in_head = true,
				stat = "gage3_11_stats",
				enemy = "spooc",
				weapon = "m95"
			},
			didnt_see_this_coming = {
				stat = "gage3_13_stats",
				weapon_type = "snp",
				on_zipline = true
			},
			grand_master_sniper = {
				weapon = "msr",
				stat = "gage3_14_stats",
				enemy = "sniper"
			},
			public_enemy_no_one = {
				weapon = "msr",
				stat = "gage3_17_stats"
			},
			knock_knock = {
				weapon_type = "shotgun",
				stat = "gage4_6_stats",
				enemy = "shield",
				part_id = "wpn_fps_upg_a_slug"
			},
			peek_a_boo = {
				weapon_type = "shotgun",
				stat = "gage4_8_stats",
				enemy = "sniper",
				part_id = "wpn_fps_upg_a_piercing"
			},
			seven_eleven = {
				count = 7,
				timer = 11,
				award = "gage4_4",
				in_head = true,
				weapon_type = "shotgun"
			},
			bang_for_buck = {
				weapon_type = "shotgun",
				stat = "gage4_10_stats",
				enemy = "tank",
				parts = {
					"wpn_fps_upg_a_custom",
					"wpn_fps_upg_a_custom_free"
				}
			},
			grind_fest = {
				weapon = "g3",
				stat = "gage5_1_stats",
				enemy = "tank"
			},
			kill_streak = {
				weapon = "galil",
				stat = "gage5_9_stats",
				enemy = "spooc"
			},
			le_picnic = {
				weapon = "famas",
				stat = "gage5_10_stats"
			},
			repel_from_rope = {
				weapon = "mosin",
				stat = "eagle_1_stats",
				on_rope = true
			},
			bullet_hell = {
				weapon = "mg42",
				timer = 10,
				award = "eagle_5",
				count = 10
			},
			akm4_shootout = {
				is_cop = true,
				stat = "ameno_08_stats",
				weapons = {
					"ak74",
					"akm",
					"akm_gold",
					"saiga",
					"rpk",
					"amcar",
					"new_m4",
					"m16",
					"akmsu",
					"olympic",
					"flint"
				}
			},
			scorpion_4 = {
				in_steelsight = false,
				timer = 6,
				award = "scorpion_4",
				weapon = "peacemaker",
				count = 6
			},
			turtles_1 = {
				weapon = "wa2000",
				award = "turtles_1",
				count_no_reload = 11
			},
			turtles_2 = {
				weapon = "polymer",
				kill_count = 100,
				award = "turtles_2"
			},
			berry_5 = {
				in_steelsight = false,
				count_in_row = 10,
				award = "berry_5",
				weapon = "model70",
				in_head = true
			},
			assault_rifle_kills = {
				weapon_type = "assault_rifle",
				challenge_stat = "assault_rifle_kills"
			},
			shotgun_kills = {
				weapon_type = "shotgun",
				challenge_stat = "shotgun_kills"
			},
			smg_kills = {
				weapon_type = "smg",
				challenge_stat = "smg_kills"
			},
			pistol_kills = {
				weapon_type = "pistol",
				challenge_stat = "pistol_kills"
			},
			any_kills = {challenge_stat = "any_kills"},
			any_headshot_kills = {
				in_head = true,
				challenge_stat = "any_headshot_kills"
			},
			any_sniper_kills = {
				enemy = "sniper",
				challenge_stat = "any_sniper_kills"
			},
			any_shield_kills = {
				enemy = "shield",
				challenge_stat = "any_shield_kills"
			},
			any_taser_kills = {
				enemy = "taser",
				challenge_stat = "any_taser_kills"
			},
			any_tank_kills = {
				enemy = "tank",
				challenge_stat = "any_tank_kills"
			},
			any_spooc_kills = {
				enemy = "spooc",
				challenge_stat = "any_spooc_kills"
			},
			trophy_headshots = {
				in_head = true,
				trophy_stat = "trophy_headshots"
			},
			trophy_washington = {trophy_stat = "trophy_washington"},
			trophy_smg = {
				timer = 25,
				trophy_stat = "trophy_smg",
				weapon_type = "smg",
				count = 25
			},
			trophy_special_kills = {
				trophy_stat = "trophy_special_kills",
				enemies = {
					"sniper",
					"shield",
					"taser",
					"tank",
					"spooc",
					"medic"
				}
			},
			trophy_medic = {
				trophy_stat = "trophy_medic",
				enemies = {"medic"}
			},
			pim_1 = {
				weapon = "desertfox",
				stat = "pim_1_stats",
				difficulty = overkill_and_above,
				enemies = {"sniper"}
			},
			pim_3 = {
				weapon = "schakal",
				level_id = "mad",
				stat = "pim_3_stats",
				difficulty = overkill_and_above,
				enemies = {
					"sniper",
					"shield",
					"taser",
					"tank",
					"spooc",
					"medic"
				}
			},
			grv_2 = {
				weapon = "coal",
				award = "grv_2",
				count_no_reload = 32
			},
			grv_3 = {
				stat = "grv_3_stats",
				weapons = {
					"siltstone",
					"flint",
					"coal"
				}
			},
			aru_2 = {
				stat = "aru_2",
				weapons = {"breech"}
			},
			aru_3 = {
				stat = "aru_3",
				weapons = {"erma"}
			},
			aru_4 = {
				stat = "aru_4",
				weapons = {"ching"}
			}
		}
		self.enemy_melee_kill_achievements = {
			cloak_n_dagger = {
				award = "gage2_2",
				melee_type = "knife",
				enemy = "spooc"
			},
			are_you_kidding_me = {
				award = "gage2_10",
				melee_type = "knife",
				enemy = "tank"
			},
			no_time_to_bleed = {
				health = 25,
				stat = "gage2_9_stats",
				melee_type = "knife",
				enemies = {
					"fbi_swat",
					"fbi_heavy_swat"
				},
				difficulty = overkill_and_above
			},
			police_brutality = {
				award = "gage4_1",
				melee_id = "baton",
				enemy = "shield"
			},
			every_day_shovelin = {
				melee_id = "shovel",
				stat = "gage4_7_stats",
				is_cop = true,
				level_id = "nightclub"
			},
			cant_touch_this = {
				melee_id = "dingdong",
				stat = "gage5_8_stats",
				is_gangster = true
			},
			hurting_people = {
				melee_id = "baseballbat",
				stat = "pig_3_stats",
				enemies = {
					"mobster",
					"mobster_boss",
					"biker_boss"
				},
				jobs = {"mia"}
			},
			special_operations = {
				melee_id = "fairbair",
				stat = "eagle_2_stats",
				is_not_civilian = true,
				is_stealth = true
			},
			knockout = {
				award = "gorilla_1",
				melee_id = "boxing_gloves",
				enemy = "tank"
			},
			stick_a_fork_in_me = {
				is_on_fire = true,
				melee_id = "fork",
				award = "grill_2",
				is_not_civilian = true
			},
			steel_2 = {
				award = "steel_2",
				melee_weapons = {
					"morning",
					"buck",
					"beardy",
					"great"
				},
				enemy_kills = {
					enemy = "shield",
					count = 10
				}
			},
			steel_4 = {
				enemy = "tank",
				melee_id = "great",
				award = "steel_4",
				enemy_weapon = "saiga"
			},
			melee_kills = {
				is_not_civilian = true,
				challenge_stat = "melee_kills"
			},
			any_kills = {
				is_not_civilian = true,
				challenge_stat = "any_kills"
			},
			any_sniper_kills = {
				is_not_civilian = true,
				enemy = "sniper",
				challenge_stat = "any_sniper_kills"
			},
			any_shield_kills = {
				is_not_civilian = true,
				enemy = "shield",
				challenge_stat = "any_shield_kills"
			},
			any_taser_kills = {
				is_not_civilian = true,
				enemy = "taser",
				challenge_stat = "any_taser_kills"
			},
			any_tank_kills = {
				is_not_civilian = true,
				enemy = "tank",
				challenge_stat = "any_tank_kills"
			},
			any_spooc_kills = {
				is_not_civilian = true,
				enemy = "spooc",
				challenge_stat = "any_spooc_kills"
			},
			trophy_knockouts = {
				melee_id = "boxing_gloves",
				trophy_stat = "trophy_knockouts",
				is_not_civilian = true,
				enemies = {
					"tank",
					"tank_hw"
				}
			},
			trophy_washington = {
				is_not_civilian = true,
				trophy_stat = "trophy_washington"
			},
			trophy_medic = {
				is_not_civilian = true,
				trophy_stat = "trophy_medic",
				enemy = "medic"
			},
			trophy_special_kills = {
				is_not_civilian = true,
				trophy_stat = "trophy_special_kills",
				enemies = {
					"sniper",
					"shield",
					"taser",
					"tank",
					"spooc",
					"medic"
				}
			},
			daily_hangover = {
				melee_id = "whiskey",
				trophy_stat = "daily_hangover",
				is_not_civilian = true
			},
			raid_aru_1 = {
				melee_id = "push",
				stat = "aru_1",
				is_not_civilian = true
			}
		}
		self.complete_heist_achievements = {
			in_soviet_russia = {
				contract = "vlad",
				stat = "halloween_10_stats",
				mask = "bear",
				difficulty = overkill_and_above
			},
			i_take_scores = {
				stat = "armored_4_stat",
				mask = "heat",
				difficulty = overkill_and_above,
				jobs = {
					"arm_cro",
					"arm_und",
					"arm_hcm",
					"arm_par",
					"arm_fac"
				}
			},
			eco_round = {
				award = "charliesierra_7",
				no_shots = "primaries",
				job = "roberts",
				difficulty = overkill_and_above
			},
			stealth_election_day = {
				stealth = true,
				award = "bob_3",
				job = "election_day"
			},
			death_stealth_election_day = {
				award = "bob_7",
				stealth = true,
				job = "election_day",
				difficulty = deathwish_and_above
			},
			easywish_ukranian = {
				award = "pick_1",
				job = "ukrainian_job_prof",
				difficulty = easywish_and_above
			},
			easywish_mallcrasher = {
				award = "pick_2",
				job = "mallcrasher",
				difficulty = easywish_and_above
			},
			easywish_four_stores = {
				award = "pick_3",
				job = "four_stores",
				difficulty = easywish_and_above
			},
			easywish_nightclub = {
				award = "pick_4",
				job = "nightclub",
				difficulty = easywish_and_above
			},
			easywish_watchdogs = {
				award = "pick_5",
				difficulty = easywish_and_above,
				jobs = {
					"watchdogs_wrapper",
					"watchdogs_night",
					"watchdogs"
				}
			},
			easywish_rats = {
				award = "pick_7",
				job = "alex",
				difficulty = easywish_and_above
			},
			easywish_firestarter = {
				award = "pick_9",
				job = "firestarter",
				difficulty = easywish_and_above
			},
			easywish_framing_frame = {
				award = "pick_11",
				job = "framing_frame",
				difficulty = easywish_and_above
			},
			easywish_big_oil = {
				award = "pick_13",
				difficulty = easywish_and_above,
				jobs = {
					"welcome_to_the_jungle_wrapper_prof",
					"welcome_to_the_jungle_night_prof",
					"welcome_to_the_jungle_prof"
				}
			},
			easywish_jewelry_store = {
				award = "pick_14",
				job = "jewelry_store",
				difficulty = easywish_and_above
			},
			easywish_diamond_store = {
				award = "pick_15",
				job = "family",
				difficulty = easywish_and_above
			},
			easywish_go_bank = {
				award = "pick_16",
				job = "roberts",
				difficulty = easywish_and_above
			},
			easywish_bank_heist = {
				award = "pick_17",
				job = "branchbank_prof",
				difficulty = easywish_and_above
			},
			easywish_bank_heist_gold = {
				award = "pick_18",
				job = "branchbank_gold_prof",
				difficulty = easywish_and_above
			},
			easywish_bank_heist_cash = {
				award = "pick_19",
				job = "branchbank_cash",
				difficulty = easywish_and_above
			},
			easywish_bank_heist_deposit = {
				award = "pick_20",
				job = "branchbank_deposit",
				difficulty = easywish_and_above
			},
			easywish_transport_crossroads = {
				award = "pick_21",
				job = "arm_cro",
				difficulty = easywish_and_above
			},
			easywish_transport_downtown = {
				award = "pick_22",
				job = "arm_hcm",
				difficulty = easywish_and_above
			},
			easywish_transport_harbor = {
				award = "pick_23",
				job = "arm_fac",
				difficulty = easywish_and_above
			},
			easywish_transport_park = {
				award = "pick_24",
				job = "arm_par",
				difficulty = easywish_and_above
			},
			easywish_transport_underpass = {
				award = "pick_25",
				job = "arm_und",
				difficulty = easywish_and_above
			},
			easywish_transport_train = {
				award = "pick_26",
				job = "arm_for",
				difficulty = easywish_and_above
			},
			easywish_election_day = {
				award = "pick_27",
				job = "election_day",
				difficulty = easywish_and_above
			},
			easywish_kosugi = {
				award = "pick_29",
				job = "kosugi",
				difficulty = easywish_and_above
			},
			easywish_bigbank = {
				award = "pick_30",
				job = "big",
				difficulty = easywish_and_above
			},
			easywish_miami = {
				award = "pick_31",
				job = "mia",
				difficulty = easywish_and_above
			},
			easywish_artgallery = {
				award = "pick_33",
				job = "gallery",
				difficulty = easywish_and_above
			},
			easywish_hoxton = {
				award = "pick_34",
				job = "hox",
				difficulty = easywish_and_above
			},
			easywish_mus = {
				award = "pick_36",
				job = "mus",
				difficulty = easywish_and_above
			},
			easywish_red = {
				award = "pick_37",
				job = "red2",
				difficulty = easywish_and_above
			},
			easywish_dinner = {
				award = "pick_38",
				job = "dinner",
				difficulty = easywish_and_above
			},
			easywish_hox_3 = {
				award = "pick_39",
				job = "hox_3",
				difficulty = easywish_and_above
			},
			easywish_rat = {
				award = "pick_40",
				job = "rat",
				difficulty = easywish_and_above
			},
			easywish_cage = {
				award = "pick_41",
				job = "cage",
				difficulty = easywish_and_above
			},
			easywish_shoutout = {
				award = "pick_42",
				job = "shoutout_raid",
				difficulty = easywish_and_above
			},
			easywish_arena = {
				award = "pick_43",
				job = "arena",
				difficulty = easywish_and_above
			},
			easywish_kenaz = {
				award = "pick_44",
				difficulty = easywish_and_above,
				jobs = {"kenaz"}
			},
			easywish_sinus = {
				award = "pick_45",
				job = "jolly",
				difficulty = easywish_and_above
			},
			easywish_nails = {
				award = "pick_46",
				job = "nail",
				difficulty = easywish_and_above
			},
			easywish_berry = {
				award = "pick_47",
				job = "pbr",
				difficulty = easywish_and_above
			},
			easywish_jerry = {
				award = "pick_48",
				job = "pbr2",
				difficulty = easywish_and_above
			},
			easywish_peta = {
				award = "pick_49",
				difficulty = easywish_and_above,
				jobs = {"peta"}
			},
			easywish_pal = {
				award = "pick_51",
				job = "pal",
				difficulty = easywish_and_above
			},
			easywish_man = {
				award = "pick_52",
				job = "man",
				difficulty = easywish_and_above
			},
			easywish_dark = {
				award = "pick_53",
				job = "dark",
				difficulty = easywish_and_above
			},
			easywish_cane = {
				award = "pick_54",
				job = "cane",
				difficulty = easywish_and_above
			},
			easywish_flat = {
				award = "pick_55",
				job = "flat",
				difficulty = easywish_and_above
			},
			easywish_mad = {
				award = "pick_56",
				job = "mad",
				difficulty = easywish_and_above
			},
			easywish_born = {
				award = "pick_57",
				job = "born",
				difficulty = easywish_and_above
			},
			easywish_help = {
				award = "orange_1",
				job = "help",
				difficulty = easywish_and_above
			},
			easywish_moon = {
				award = "moon_1",
				job = "moon",
				difficulty = easywish_and_above
			},
			easywish_friend = {
				award = "friend_1",
				job = "friend",
				difficulty = easywish_and_above
			},
			easywish_spa = {
				award = "spa_1",
				job = "spa",
				difficulty = easywish_and_above
			},
			easywish_fish = {
				award = "fish_1",
				job = "fish",
				difficulty = easywish_and_above
			},
			easywish_glace = {
				award = "glace_5",
				job = "glace",
				difficulty = easywish_and_above
			},
			easywish_run = {
				award = "run_5",
				job = "run",
				difficulty = easywish_and_above
			},
			complete_pines_easywish = {
				award = "pick_59",
				difficulty = easywish_and_above,
				jobs = {"pines"}
			},
			complete_crojob_dock_easywish = {
				award = "pick_61",
				difficulty = easywish_and_above,
				jobs = {"crojob1"}
			},
			complete_crojob_for_easywish = {
				award = "pick_60",
				difficulty = easywish_and_above,
				jobs = {
					"crojob_wrapper",
					"crojob2",
					"crojob2_night"
				}
			},
			death_ukranian = {
				award = "death_1",
				job = "ukrainian_job_prof",
				difficulty = deathwish_and_above
			},
			death_mallcrasher = {
				award = "death_2",
				job = "mallcrasher",
				difficulty = deathwish_and_above
			},
			death_four_stores = {
				award = "death_3",
				job = "four_stores",
				difficulty = deathwish_and_above
			},
			death_nightclub = {
				award = "death_4",
				job = "nightclub",
				difficulty = deathwish_and_above
			},
			death_watchdogs = {
				award = "death_34",
				difficulty = deathwish_and_above,
				jobs = {
					"watchdogs_wrapper",
					"watchdogs_night",
					"watchdogs"
				}
			},
			death_rats = {
				award = "death_33",
				job = "alex",
				difficulty = deathwish_and_above
			},
			death_firestarter = {
				award = "death_32",
				job = "firestarter",
				difficulty = deathwish_and_above
			},
			death_framing_frame = {
				award = "death_35",
				job = "framing_frame",
				difficulty = deathwish_and_above
			},
			death_big_oil = {
				award = "death_11",
				difficulty = deathwish_and_above,
				jobs = {
					"welcome_to_the_jungle_wrapper_prof",
					"welcome_to_the_jungle_night_prof",
					"welcome_to_the_jungle_prof"
				}
			},
			death_jewelry_store = {
				award = "death_13",
				job = "jewelry_store",
				difficulty = deathwish_and_above
			},
			death_diamond_store = {
				award = "death_14",
				job = "family",
				difficulty = deathwish_and_above
			},
			death_go_bank = {
				award = "death_15",
				job = "roberts",
				difficulty = deathwish_and_above
			},
			death_bank_heist = {
				award = "death_16",
				job = "branchbank_prof",
				difficulty = deathwish_and_above
			},
			death_bank_heist_gold = {
				award = "death_17",
				job = "branchbank_gold_prof",
				difficulty = deathwish_and_above
			},
			death_bank_heist_cash = {
				award = "death_18",
				job = "branchbank_cash",
				difficulty = deathwish_and_above
			},
			death_bank_heist_deposit = {
				award = "death_19",
				job = "branchbank_deposit",
				difficulty = deathwish_and_above
			},
			death_transport_crossroads = {
				award = "death_20",
				job = "arm_cro",
				difficulty = deathwish_and_above
			},
			death_transport_downtown = {
				award = "death_21",
				job = "arm_hcm",
				difficulty = deathwish_and_above
			},
			death_transport_harbor = {
				award = "death_22",
				job = "arm_fac",
				difficulty = deathwish_and_above
			},
			death_transport_park = {
				award = "death_23",
				job = "arm_par",
				difficulty = deathwish_and_above
			},
			death_transport_underpass = {
				award = "death_24",
				job = "arm_und",
				difficulty = deathwish_and_above
			},
			death_transport_train = {
				award = "death_25",
				job = "arm_for",
				difficulty = deathwish_and_above
			},
			death_election_day = {
				award = "bob_9",
				job = "election_day",
				difficulty = deathwish_and_above
			},
			death_kosugi = {
				award = "kosugi_6",
				job = "kosugi",
				difficulty = deathwish_and_above
			},
			death_bigbank = {
				award = "bigbank_9",
				job = "big",
				difficulty = deathwish_and_above
			},
			death_miami = {
				award = "pig_1",
				job = "mia",
				difficulty = deathwish_and_above
			},
			death_artgallery = {
				award = "squek",
				job = "gallery",
				difficulty = deathwish_and_above
			},
			death_hoxton = {
				award = "bulldog_2",
				job = "hox",
				difficulty = deathwish_and_above
			},
			death_mus = {
				award = "bat_1",
				job = "mus",
				difficulty = deathwish_and_above
			},
			death_red = {
				award = "green_5",
				job = "red2",
				difficulty = deathwish_and_above
			},
			death_dinner = {
				award = "farm_5",
				job = "dinner",
				difficulty = deathwish_and_above
			},
			death_hox_3 = {
				award = "payback_1",
				job = "hox_3",
				difficulty = deathwish_and_above
			},
			death_rat = {
				award = "djur_1",
				job = "rat",
				difficulty = deathwish_and_above
			},
			death_cage = {
				award = "fort_1",
				job = "cage",
				difficulty = deathwish_and_above
			},
			death_shoutout = {
				award = "melt_1",
				job = "shoutout_raid",
				difficulty = deathwish_and_above
			},
			death_arena = {
				award = "live_1",
				job = "arena",
				difficulty = deathwish_and_above
			},
			death_kenaz = {
				award = "kenaz_1",
				difficulty = deathwish_and_above,
				jobs = {"kenaz"}
			},
			death_sinus = {
				award = "sinus_2",
				job = "jolly",
				difficulty = deathwish_and_above
			},
			death_nails = {
				award = "lab_3",
				job = "nail",
				difficulty = deathwish_and_above
			},
			death_berry = {
				award = "berry_1",
				job = "pbr",
				difficulty = deathwish_and_above
			},
			death_jerry = {
				award = "jerry_1",
				job = "pbr2",
				difficulty = deathwish_and_above
			},
			death_peta = {
				award = "peta_1",
				difficulty = deathwish_and_above,
				jobs = {"peta"}
			},
			death_pal = {
				award = "pal_1",
				job = "pal",
				difficulty = deathwish_and_above
			},
			death_man = {
				award = "man_1",
				job = "man",
				difficulty = deathwish_and_above
			},
			death_dark = {
				award = "dark_1",
				job = "dark",
				difficulty = deathwish_and_above
			},
			death_cane = {
				award = "cane_1",
				job = "cane",
				difficulty = deathwish_and_above
			},
			death_flat = {
				award = "flat_1",
				job = "flat",
				difficulty = deathwish_and_above
			},
			death_mad = {
				award = "mad_1",
				job = "mad",
				difficulty = deathwish_and_above
			},
			death_born = {
				award = "born_1",
				job = "born",
				difficulty = deathwish_and_above
			},
			death_help = {
				award = "orange_2",
				job = "help",
				difficulty = deathwish_and_above
			},
			death_moon = {
				award = "moon_2",
				job = "moon",
				difficulty = deathwish_and_above
			},
			death_friend = {
				award = "friend_2",
				job = "friend",
				difficulty = deathwish_and_above
			},
			death_spa = {
				award = "spa_2",
				job = "spa",
				difficulty = deathwish_and_above
			},
			death_fish = {
				award = "fish_2",
				job = "fish",
				difficulty = deathwish_and_above
			},
			death_glace = {
				award = "glace_6",
				job = "glace",
				difficulty = deathwish_and_above
			},
			death_run = {
				award = "run_6",
				job = "run",
				difficulty = deathwish_and_above
			},
			complete_pines_deathwish = {
				award = "deer_5",
				difficulty = deathwish_and_above,
				jobs = {"pines"}
			},
			complete_crojob_for_deathwish = {
				award = "cow_2",
				difficulty = deathwish_and_above,
				jobs = {
					"crojob_wrapper",
					"crojob2",
					"crojob2_night"
				}
			},
			complete_crojob_dock_deathwish = {
				award = "cow_7",
				difficulty = deathwish_and_above,
				jobs = {"crojob1"}
			},
			sm_wish_ukranian = {
				award = "axe_1",
				job = "ukrainian_job_prof",
				difficulty = sm_wish_and_above
			},
			sm_wish_mallcrasher = {
				award = "axe_2",
				job = "mallcrasher",
				difficulty = sm_wish_and_above
			},
			sm_wish_four_stores = {
				award = "axe_3",
				job = "four_stores",
				difficulty = sm_wish_and_above
			},
			sm_wish_nightclub = {
				award = "axe_4",
				job = "nightclub",
				difficulty = sm_wish_and_above
			},
			sm_wish_watchdogs = {
				award = "axe_5",
				difficulty = sm_wish_and_above,
				jobs = {
					"watchdogs_wrapper",
					"watchdogs_night",
					"watchdogs"
				}
			},
			sm_wish_rats = {
				award = "axe_7",
				job = "alex",
				difficulty = sm_wish_and_above
			},
			sm_wish_firestarter = {
				award = "axe_9",
				job = "firestarter",
				difficulty = sm_wish_and_above
			},
			sm_wish_framing_frame = {
				award = "axe_11",
				job = "framing_frame",
				difficulty = sm_wish_and_above
			},
			sm_wish_big_oil = {
				award = "axe_13",
				difficulty = sm_wish_and_above,
				jobs = {
					"welcome_to_the_jungle_wrapper_prof",
					"welcome_to_the_jungle_night_prof",
					"welcome_to_the_jungle_prof"
				}
			},
			sm_wish_jewelry_store = {
				award = "axe_14",
				job = "jewelry_store",
				difficulty = sm_wish_and_above
			},
			sm_wish_diamond_store = {
				award = "axe_15",
				job = "family",
				difficulty = sm_wish_and_above
			},
			sm_wish_go_bank = {
				award = "axe_16",
				job = "roberts",
				difficulty = sm_wish_and_above
			},
			sm_wish_bank_heist = {
				award = "axe_17",
				job = "branchbank_prof",
				difficulty = sm_wish_and_above
			},
			sm_wish_bank_heist_gold = {
				award = "axe_18",
				job = "branchbank_gold_prof",
				difficulty = sm_wish_and_above
			},
			sm_wish_bank_heist_cash = {
				award = "axe_19",
				job = "branchbank_cash",
				difficulty = sm_wish_and_above
			},
			sm_wish_bank_heist_deposit = {
				award = "axe_20",
				job = "branchbank_deposit",
				difficulty = sm_wish_and_above
			},
			sm_wish_transport_crossroads = {
				award = "axe_21",
				job = "arm_cro",
				difficulty = sm_wish_and_above
			},
			sm_wish_transport_downtown = {
				award = "axe_22",
				job = "arm_hcm",
				difficulty = sm_wish_and_above
			},
			sm_wish_transport_harbor = {
				award = "axe_23",
				job = "arm_fac",
				difficulty = sm_wish_and_above
			},
			sm_wish_transport_park = {
				award = "axe_24",
				job = "arm_par",
				difficulty = sm_wish_and_above
			},
			sm_wish_transport_underpass = {
				award = "axe_25",
				job = "arm_und",
				difficulty = sm_wish_and_above
			},
			sm_wish_transport_train = {
				award = "axe_26",
				job = "arm_for",
				difficulty = sm_wish_and_above
			},
			sm_wish_election_day = {
				award = "axe_27",
				job = "election_day",
				difficulty = sm_wish_and_above
			},
			sm_wish_kosugi = {
				award = "axe_29",
				job = "kosugi",
				difficulty = sm_wish_and_above
			},
			sm_wish_bigbank = {
				award = "axe_30",
				job = "big",
				difficulty = sm_wish_and_above
			},
			sm_wish_miami = {
				award = "axe_31",
				job = "mia",
				difficulty = sm_wish_and_above
			},
			sm_wish_artgallery = {
				award = "axe_33",
				job = "gallery",
				difficulty = sm_wish_and_above
			},
			sm_wish_hoxton = {
				award = "axe_34",
				job = "hox",
				difficulty = sm_wish_and_above
			},
			sm_wish_mus = {
				award = "axe_36",
				job = "mus",
				difficulty = sm_wish_and_above
			},
			sm_wish_red = {
				award = "axe_37",
				job = "red2",
				difficulty = sm_wish_and_above
			},
			sm_wish_dinner = {
				award = "axe_38",
				job = "dinner",
				difficulty = sm_wish_and_above
			},
			sm_wish_hox_3 = {
				award = "axe_39",
				job = "hox_3",
				difficulty = sm_wish_and_above
			},
			sm_wish_rat = {
				award = "axe_40",
				job = "rat",
				difficulty = sm_wish_and_above
			},
			sm_wish_cage = {
				award = "axe_41",
				job = "cage",
				difficulty = sm_wish_and_above
			},
			sm_wish_shoutout = {
				award = "axe_42",
				job = "shoutout_raid",
				difficulty = sm_wish_and_above
			},
			sm_wish_arena = {
				award = "axe_43",
				job = "arena",
				difficulty = sm_wish_and_above
			},
			sm_wish_kenaz = {
				award = "axe_44",
				difficulty = sm_wish_and_above,
				jobs = {"kenaz"}
			},
			sm_wish_sinus = {
				award = "axe_45",
				job = "jolly",
				difficulty = sm_wish_and_above
			},
			sm_wish_nails = {
				award = "axe_46",
				job = "nail",
				difficulty = sm_wish_and_above
			},
			sm_wish_berry = {
				award = "axe_47",
				job = "pbr",
				difficulty = sm_wish_and_above
			},
			sm_wish_jerry = {
				award = "axe_48",
				job = "pbr2",
				difficulty = sm_wish_and_above
			},
			sm_wish_peta = {
				award = "axe_49",
				difficulty = sm_wish_and_above,
				jobs = {"peta"}
			},
			sm_wish_pal = {
				award = "axe_51",
				job = "pal",
				difficulty = sm_wish_and_above
			},
			sm_wish_man = {
				award = "axe_52",
				job = "man",
				difficulty = sm_wish_and_above
			},
			sm_wish_dark = {
				award = "axe_53",
				job = "dark",
				difficulty = sm_wish_and_above
			},
			sm_wish_cane = {
				award = "axe_54",
				job = "cane",
				difficulty = sm_wish_and_above
			},
			sm_wish_flat = {
				award = "axe_55",
				job = "flat",
				difficulty = sm_wish_and_above
			},
			sm_wish_mad = {
				award = "axe_56",
				job = "mad",
				difficulty = sm_wish_and_above
			},
			sm_wish_born = {
				award = "axe_57",
				job = "born",
				difficulty = sm_wish_and_above
			},
			sm_wish_help = {
				award = "orange_3",
				job = "help",
				difficulty = sm_wish_and_above
			},
			sm_wish_moon = {
				award = "moon_3",
				job = "moon",
				difficulty = sm_wish_and_above
			},
			sm_wish_friend = {
				award = "friend_3",
				job = "friend",
				difficulty = sm_wish_and_above
			},
			sm_wish_spa = {
				award = "spa_3",
				job = "spa",
				difficulty = sm_wish_and_above
			},
			sm_wish_fish = {
				award = "fish_3",
				job = "fish",
				difficulty = sm_wish_and_above
			},
			sm_wish_glace = {
				award = "glace_7",
				job = "glace",
				difficulty = sm_wish_and_above
			},
			sm_wish_run = {
				award = "run_7",
				job = "run",
				difficulty = sm_wish_and_above
			},
			complete_pines_sm_wish = {
				award = "axe_59",
				difficulty = sm_wish_and_above,
				jobs = {"pines"}
			},
			complete_crojob_for_sm_wish = {
				award = "axe_60",
				difficulty = sm_wish_and_above,
				jobs = {
					"crojob_wrapper",
					"crojob2",
					"crojob2_night"
				}
			},
			complete_crojob_dock_sm_wish = {
				award = "axe_61",
				difficulty = sm_wish_and_above,
				jobs = {"crojob1"}
			},
			complete_hoxton = {
				award = "bulldog_1",
				jobs = {"hox"}
			},
			complete_pines_normal = {
				award = "deer_1",
				difficulty = tweak_data.difficulty_name_ids.sm_wish and normal_and_above or {"normal"},
				jobs = {"pines"}
			},
			complete_pines_hard = {
				award = "deer_2",
				difficulty = tweak_data.difficulty_name_ids.sm_wish and hard_and_above or {"hard"},
				jobs = {"pines"}
			},
			complete_pines_veryhard = {
				award = "deer_3",
				difficulty = tweak_data.difficulty_name_ids.sm_wish and veryhard_and_above or {"overkill"},
				jobs = {"pines"}
			},
			complete_pines_overkill = {
				award = "deer_4",
				difficulty = tweak_data.difficulty_name_ids.sm_wish and overkill_and_above or {"overkill_145"},
				jobs = {"pines"}
			},
			complete_crojob_for_all = {
				award = "cow_1",
				difficulty = normal_and_above,
				jobs = {
					"crojob_wrapper",
					"crojob2",
					"crojob2_night"
				}
			},
			complete_crojob_dock_all = {
				award = "cow_6",
				difficulty = normal_and_above,
				jobs = {"crojob1"}
			},
			melt_2 = {
				award = "melt_2",
				job = "shoutout_raid",
				difficulty = normal_and_above
			},
			farm_1 = {
				phalanx_vip_alive = true,
				award = "farm_1",
				job = "dinner",
				difficulty = overkill_and_above
			},
			hox_3_silent = {
				stealth = true,
				award = "payback_2",
				job = "hox_3"
			},
			owe_saw = {
				award = "ameno_1",
				job = "nightclub",
				equipped_team = {
					secondary = "wpn_fps_saw_secondary",
					primary = "wpn_fps_saw"
				}
			},
			pain_train = {
				loud = true,
				num_players = 4,
				award = "ameno_4",
				need_full_job = true,
				jobs = {"firestarter"},
				difficulty = overkill_and_above,
				equipped_team = {
					secondary_unmodded = true,
					primary_unmodded = true,
					primaries = {"wpn_fps_ass_74"},
					secondaries = {"wpn_fps_smg_olympic"}
				}
			},
			turtle_wins = {
				timer = 240,
				stealth = true,
				award = "ameno_6",
				job = "gallery",
				equipped_team = {
					reverse_deployable = true,
					armor = "level_7",
					deployable = "armor_kit"
				}
			},
			anticimex = {
				num_players = 4,
				award = "ovk_1",
				need_full_job = true,
				jobs = {"alex"},
				difficulty = overkill_and_above,
				equipped_team = {
					armor = "level_6",
					mask = "the_overkill_mask",
					primaries = {"wpn_fps_lmg_m134"},
					secondaries = {"wpn_fps_rpg7"}
				}
			},
			modern_ninja = {
				stealth = true,
				award = "ovk_2",
				job = "kosugi",
				equipped = {
					primaries = {weapon_id = "m134"},
					secondaries = {weapon_id = "rpg7"}
				}
			},
			newbee = {
				award = "ovk_4",
				need_full_job = true,
				jobs = {"watchdogs_wrapper"},
				difficulty = overkill_and_above,
				equipped_team = {
					num_skills = 0,
					primaries = {"wpn_fps_ass_amcar"},
					secondaries = {"wpn_fps_pis_g17"}
				}
			},
			intel_thief = {
				award = "ovk_6",
				stealth = true,
				levels = {
					"welcome_to_the_jungle_1",
					"welcome_to_the_jungle_1_night"
				},
				difficulty = overkill_and_above
			},
			ovk_8 = {
				num_players = 2,
				award = "ovk_8",
				need_full_job = true,
				jobs = {"welcome_to_the_jungle_wrapper_prof"},
				difficulty = overkill_and_above,
				equipped_team = {
					armor = "level_1",
					primaries = {"wpn_fps_x_b92fs"}
				}
			},
			kenaz_silent = {
				stealth = true,
				award = "kenaz_2",
				jobs = {"kenaz"}
			},
			kenaz_timed = {
				timer = 840,
				award = "kenaz_4",
				jobs = {"kenaz"}
			},
			not_for_old_men = {
				stealth = true,
				award = "gage4_11",
				equipped = {secondaries = {
					weapon_id = "serbu",
					blueprint = {{"wpn_fps_upg_ns_shot_thick"}}
				}}
			},
			turtles_3 = {
				killed_by_weapons = 0,
				stealth = true,
				award = "turtles_3",
				killed_by_melee = 0,
				killed_by_grenade = 4,
				civilians_killed = 0,
				equipped = {grenades = "wpn_prj_four"}
			},
			jordan_3 = {
				award = "brooklyn_3",
				memory = {is_shortterm = false}
			},
			jordan_4 = {
				jump_timer = 4,
				award = "brooklyn_4",
				memory = {
					value = true,
					is_shortterm = false
				}
			},
			steel_1 = {
				num_players = 4,
				award = "steel_1",
				need_full_job = true,
				difficulty = overkill_and_above,
				equipped_team = {
					primaries = {
						"wpn_fps_bow_long",
						"wpn_fps_bow_frankish",
						"wpn_fps_bow_arblast"
					},
					masks = {
						"mason_knight_veteran",
						"agatha_knight",
						"agatha_vanguard_veteran",
						"mason_vanguard_veteran"
					},
					armors = {
						"level_3",
						"level_4",
						"level_5",
						"level_6",
						"level_7"
					},
					melee_weapons = {
						"morning",
						"buck",
						"beardy",
						"great"
					}
				}
			},
			green_2 = {
				num_players = 4,
				award = "green_2",
				job = "red2",
				difficulty = overkill_and_above,
				equipped_team = {
					primaries = {"wpn_fps_shot_r870"},
					secondaries = {"wpn_fps_pis_beretta"},
					characters = {
						"russian",
						"german",
						"spanish",
						"old_hoxton"
					}
				}
			},
			jerry_5 = {
				award = "jerry_5",
				job = "pbr2",
				difficulty = overkill_and_above,
				equipped_team = {
					secondary_category = "pistol",
					armor = "level_1",
					primary_category = "akimbo"
				}
			},
			cane_4 = {
				award = "cane_4",
				job = "cane",
				equipped_team = {
					secondary_category = "shotgun",
					primary_category = "shotgun"
				}
			},
			mad_3 = {
				award = "mad_3",
				job = "mad",
				difficulty = veryhard_and_above,
				memory = {
					value = true,
					is_shortterm = false
				}
			},
			mad_4 = {
				award = "mad_4",
				job = "mad",
				difficulty = overkill_and_above,
				equipped_team = {
					primaries = {"wpn_fps_ass_akm_gold"},
					masks = {"rus_hat"}
				}
			},
			flake_1 = {
				award = "flake_1",
				need_full_job = true,
				jobs = {"framing_frame"},
				difficulty = overkill_and_above,
				equipped_team = {
					num_skills = 0,
					armor = "level_1",
					primaries = {"wpn_fps_snp_model70"},
					secondaries = {"wpn_fps_pis_judge"}
				}
			},
			pim_4 = {
				everyone_killed_by_melee = 0,
				award = "pim_4",
				job = "firestarter",
				need_full_job = true,
				everyone_killed_by_grenade = 0,
				difficulty = overkill_and_above,
				shots_by_weapon = {
					"packrat",
					"x_packrat"
				}
			},
			orange_6 = {
				award = "orange_6",
				job = "help",
				need_full_job = true,
				everyone_killed_by_grenade = 0,
				everyone_killed_by_weapons = 0,
				difficulty = hard_and_above,
				characters = {"old_hoxton"},
				equipped_team = {melee_weapons = {"toothbrush"}}
			},
			tango_3 = {
				award = "tango_achieve_3",
				difficulty = veryhard_and_above,
				killed_by_blueprint = {
					blueprint = "wpn_fps_upg_o_spot",
					amount = 200
				}
			},
			spa_4 = {
				award = "spa_4",
				job = "spa",
				need_full_job = true,
				difficulty = overkill_and_above,
				equipped_team = {
					primary_category = "snp",
					secondaries = {"wpn_fps_saw_secondary"}
				}
			},
			fish_4 = {
				timer = 360,
				award = "fish_4",
				job = "fish",
				difficulty = overkill_and_above
			},
			fish_5 = {
				everyone_killed_by_weapons = 0,
				everyone_killed_by_melee = 0,
				award = "fish_5",
				job = "fish",
				everyone_killed_by_grenade = 0
			},
			grv_1 = {
				award = "grv_1",
				difficulty = overkill_and_above,
				equipped_outfit = {
					secondary = "wpn_fps_smg_coal",
					melee_weapon = "oxide",
					primaries = {
						"wpn_fps_snp_siltstone",
						"wpn_fps_ass_flint"
					}
				}
			},
			grv_4 = {
				stealth = true,
				award = "grv_4",
				equipped_outfit = {
					secondary = "wpn_fps_smg_coal",
					melee_weapon = "oxide",
					primaries = {
						"wpn_fps_snp_siltstone",
						"wpn_fps_ass_flint"
					}
				}
			},
			glace_1 = {
				award = "glace_1",
				job = "glace",
				difficulty = normal_and_above
			},
			glace_2 = {
				award = "glace_2",
				job = "glace",
				difficulty = hard_and_above
			},
			glace_3 = {
				award = "glace_3",
				job = "glace",
				difficulty = veryhard_and_above
			},
			glace_4 = {
				award = "glace_4",
				job = "glace",
				difficulty = overkill_and_above
			},
			run_1 = {
				award = "run_1",
				job = "run",
				difficulty = normal_and_above
			},
			run_2 = {
				award = "run_2",
				job = "run",
				difficulty = hard_and_above
			},
			run_3 = {
				award = "run_3",
				job = "run",
				difficulty = veryhard_and_above
			},
			run_4 = {
				award = "run_4",
				job = "run",
				difficulty = overkill_and_above
			},
			bain_jobs = {
				complete_job = true,
				contract = "bain",
				challenge_stat = "bain_jobs"
			},
			vlad_jobs = {
				complete_job = true,
				contract = "vlad",
				challenge_stat = "vlad_jobs"
			},
			hector_jobs = {
				complete_job = true,
				contract = "hector",
				challenge_stat = "hector_jobs"
			},
			elephant_jobs = {
				complete_job = true,
				contract = "the_elephant",
				challenge_stat = "elephant_jobs"
			},
			dentist_jobs = {
				complete_job = true,
				contract = "the_dentist",
				challenge_stat = "dentist_jobs"
			},
			butcher_jobs = {
				complete_job = true,
				contract = "the_butcher",
				challenge_stat = "butcher_jobs"
			},
			any_jobs = {
				complete_job = true,
				challenge_stat = "any_jobs"
			},
			monthly_rats = {
				challenge_award = "monthly_rats",
				need_full_job = true,
				jobs = {"alex"},
				difficulty = overkill_and_above,
				equipped_team = {
					num_skills = 0,
					armor = "level_1",
					primaries = {"wpn_fps_ass_amcar"},
					secondaries = {"wpn_fps_pis_g17"}
				}
			},
			monthly_firestarter = {
				challenge_award = "monthly_firestarter",
				need_full_job = true,
				jobs = {"firestarter"},
				difficulty = overkill_and_above,
				equipped_team = {
					num_skills = 0,
					armor = "level_1",
					primaries = {"wpn_fps_ass_amcar"},
					secondaries = {"wpn_fps_pis_g17"}
				}
			},
			monthly_shadowraid = {
				challenge_award = "monthly_shadowraid",
				job = "kosugi",
				need_full_job = true,
				difficulty = overkill_and_above,
				equipped_team = {
					num_skills = 0,
					armor = "level_1",
					primaries = {"wpn_fps_ass_amcar"},
					secondaries = {"wpn_fps_pis_g17"}
				}
			},
			trophy_transport_crossroads = {
				trophy_stat = "trophy_transport_crossroads",
				level_id = "arm_cro",
				difficulty = overkill_and_above
			},
			trophy_transport_downtown = {
				trophy_stat = "trophy_transport_downtown",
				level_id = "arm_hcm",
				difficulty = overkill_and_above
			},
			trophy_transport_harbor = {
				trophy_stat = "trophy_transport_harbor",
				level_id = "arm_fac",
				difficulty = overkill_and_above
			},
			trophy_transport_park = {
				trophy_stat = "trophy_transport_park",
				level_id = "arm_par",
				difficulty = overkill_and_above
			},
			trophy_transport_underpass = {
				trophy_stat = "trophy_transport_underpass",
				level_id = "arm_und",
				difficulty = overkill_and_above
			},
			trophy_transport_train = {
				trophy_stat = "trophy_transport_train",
				level_id = "arm_for",
				difficulty = overkill_and_above
			},
			trophy_escapes = {
				trophy_stat = "trophy_escapes",
				levels = {
					"escape_cafe",
					"escape_cafe_day",
					"escape_park",
					"escape_park_day",
					"escape_street",
					"escape_overpass",
					"escape_garage"
				}
			},
			trophy_basics_stealth = {
				job = "short1",
				trophy_stat = "trophy_basics_stealth"
			},
			trophy_basics_loud = {
				job = "short2",
				trophy_stat = "trophy_basics_loud"
			},
			trophy_car_shop = {
				job = "cage",
				trophy_stat = "trophy_car_shop"
			},
			trophy_golden_grin = {
				trophy_stat = "trophy_golden_grin",
				used_weapon_category = "pistol",
				difficulty = deathwish_and_above,
				jobs = {"kenaz"},
				equipped = {secondaries = {
					category = "pistol",
					blueprint_part_data = {sub_type = "silencer"}
				}}
			},
			trophy_nightclub_dw = {
				stealth = true,
				trophy_stat = "trophy_nightclub_dw",
				job = "nightclub",
				difficulty = deathwish_and_above
			},
			trophy_tiara = {
				trophy_stat = "trophy_tiara",
				job = "ukrainian_job_prof",
				difficulty = deathwish_and_above,
				equipped_team = {
					deployable = "ecm_jammer",
					reverse_deployable = true
				}
			},
			trophy_train_bomb = {
				trophy_stat = "trophy_train_bomb",
				difficulty = deathwish_and_above,
				jobs = {
					"crojob_wrapper",
					"crojob2",
					"crojob2_night"
				}
			},
			trophy_shoutout = {
				timer = 420,
				trophy_stat = "trophy_shoutout",
				job = "shoutout_raid",
				difficulty = overkill_and_above
			},
			trophy_stealth = {
				stealth = true,
				trophy_stat = "trophy_stealth",
				difficulty = overkill_and_above,
				jobs = {
					"gallery",
					"nightclub",
					"ukrainian_job_prof",
					"four_stores",
					"jewelry_store",
					"family",
					"roberts",
					"branchbank_prof",
					"branchbank_gold_prof",
					"branchbank_cash",
					"branchbank_deposit",
					"arm_for",
					"election_day",
					"kosugi",
					"big",
					"hox_3",
					"arena",
					"red2",
					"crojob1",
					"firestarter",
					"kenaz",
					"mus",
					"framing_frame",
					"dark",
					"friend",
					"fish"
				}
			},
			trophy_bank_heists = {
				trophy_stat = "trophy_bank_heists",
				difficulty = overkill_and_above,
				jobs = {
					"branchbank_prof",
					"branchbank_gold_prof",
					"branchbank_cash",
					"branchbank_deposit"
				}
			},
			trophy_carshop_stealth = {
				trophy_stat = "trophy_carshop_stealth",
				job = "cage",
				equipped_team = {
					reverse_deployable = true,
					deployable = "ecm_jammer",
					detection = {
						max = 100,
						min = 70
					}
				}
			},
			trophy_watchout = {
				trophy_stat = "trophy_watchout",
				need_full_job = true,
				used_weapon_category = "snp",
				total_accuracy = 100,
				jobs = {
					"watchdogs_wrapper",
					"watchdogs_night",
					"watchdogs"
				},
				equipped = {primaries = {category = "snp"}}
			},
			trophy_piggy_bank = {
				trophy_stat = "trophy_piggy_bank",
				job = "big",
				difficulty = overkill_and_above,
				equipped_team = {num_skills = 0}
			},
			trophy_jfk = {
				everyone_killed_by_melee = 0,
				everyone_killed_by_grenade = 0,
				job = "man",
				everyone_used_weapon_category = "snp",
				trophy_stat = "trophy_jfk",
				difficulty = overkill_and_above,
				equipped_team = {
					armor = "level_1",
					num_skills = 0,
					primary_category = "snp"
				}
			},
			trophy_dance = {
				killed_by_weapons = 0,
				killed_by_melee = 0,
				job = "nightclub",
				trophy_stat = "trophy_dance",
				killed_by_grenade = 0,
				equipped_team = {deployable = "trip_mine"}
			},
			trophy_fbi = {
				trophy_stat = "trophy_fbi",
				stealth = true,
				levels = {"firestarter_2"}
			},
			trophy_host = {
				need_full_job = true,
				trophy_stat = "trophy_host",
				is_host = true
			},
			trophy_framing_frame = {
				need_full_stealth = true,
				trophy_stat = "trophy_framing_frame",
				need_full_job = true,
				difficulty = overkill_and_above,
				jobs = {"framing_frame"}
			},
			trophy_courtesy = {
				complete_job = true,
				job = "pbr",
				trophy_stat = "trophy_courtesy",
				difficulty = easywish_and_above,
				killed = {medic = 0}
			},
			trophy_evolution = {
				complete_job = true,
				trophy_stat = "trophy_evolution",
				mutators = true
			},
			trophy_flawless = {
				complete_job = true,
				num_players = 4,
				trophy_stat = "trophy_flawless",
				difficulty = deathwish_and_above,
				mutators = {"MutatorFriendlyFire"},
				memory = {is_shortterm = false}
			},
			trophy_defender = {
				complete_job = true,
				trophy_stat = "trophy_defender",
				difficulty = overkill_and_above,
				jobs = {"chill_combat"}
			},
			trophy_friendly_car = {
				stealth = false,
				complete_job = true,
				job = "friend",
				num_players = 4,
				trophy_stat = "trophy_friendly_car",
				difficulty = easywish_and_above,
				equipped_team = {
					num_skills = 0,
					perk_deck = 14
				}
			},
			trophy_fish_trophy = {
				need_full_job = true,
				trophy_stat = "trophy_fish_trophy",
				job = "fish",
				equipped_team = {detection = {
					max = 100,
					min = 75
				}}
			},
			trophy_glace_completion = {
				trophy_stat = "trophy_glace_completion",
				job = "glace",
				difficulty = normal_and_above
			},
			daily_classics = {
				trophy_stat = "daily_classics",
				jobs = {
					"red2",
					"flat",
					"dinner",
					"pal",
					"man",
					"run",
					"glace"
				}
			},
			daily_discord = {
				converted_cops = 1,
				trophy_stat = "daily_discord"
			},
			daily_fwtd = {
				everyone_killed_by_melee = 0,
				everyone_killed_by_grenade = 0,
				job = "red2",
				trophy_stat = "daily_fwtd",
				difficulty = overkill_and_above,
				everyone_weapons_used = {
					"sentry_gun",
					"swat_van_turret_module"
				}
			},
			daily_gears = {
				trophy_stat = "daily_gears",
				difficulty = overkill_and_above,
				jobs = {
					"arm_cro",
					"arm_und",
					"arm_hcm",
					"arm_fac",
					"arm_par",
					"arm_for"
				},
				equipped_team = {
					primaries = {"wpn_fps_saw"},
					secondaries = {"wpn_fps_saw_secondary"}
				},
				memory = {is_shortterm = true}
			},
			daily_spacetime = {
				need_full_job = true,
				trophy_stat = "daily_spacetime",
				jobs = {"hox"},
				characters = {"old_hoxton"}
			},
			daily_night_out = {
				trophy_stat = "daily_night_out",
				everyone_killed_by_weapons = 0,
				job = "nightclub"
			},
			daily_naked = {
				trophy_stat = "daily_naked",
				difficulty = overkill_and_above,
				jobs = {
					"pbr",
					"pbr2"
				},
				equipped_team = {
					perk_deck = 3,
					armor = "level_1",
					num_skills = 0
				}
			},
			daily_ninja = {
				killed_by_weapons = 0,
				trophy_stat = "daily_ninja",
				job = "arm_cro",
				equipped_outfit = {grenade = {
					"wpn_prj_ace",
					"wpn_prj_four",
					"wpn_prj_jav",
					"wpn_prj_hur",
					"wpn_prj_target",
					"chico_injector",
					"smoke_screen_grenade"
				}}
			},
			daily_whats_stealth = {
				job = "kosugi",
				need_full_job = true,
				trophy_stat = "daily_whats_stealth",
				difficulty = deathwish_and_above,
				equipped_team = {armor = "level_7"},
				memory = {is_shortterm = true}
			},
			daily_akimbo = {
				trophy_stat = "daily_akimbo",
				total_accuracy = 80,
				equipped_outfit = {primary_category = "akimbo"},
				equipped = {secondaries = {
					category = "pistol",
					blueprint_part_data = {sub_type = "silencer"}
				}}
			},
			story_basics_stealth = {
				job = "short1",
				story = "story_basics_stealth"
			},
			story_basics_loud = {
				job = "short2",
				story = "story_basics_loud"
			},
			story_jewelry_store = {
				job = "jewelry_store",
				story = "story_jewelry_store"
			},
			story_bank_heist = {
				story = "story_bank_heist",
				jobs = {
					"branchbank_prof",
					"branchbank_gold_prof",
					"branchbank_cash",
					"branchbank_deposit"
				}
			},
			story_go_bank = {
				job = "roberts",
				story = "story_go_bank"
			},
			story_diamond_store = {
				job = "family",
				story = "story_diamond_store"
			},
			story_transport_mult = {
				story = "story_transport_mult",
				jobs = {
					"arm_cro",
					"arm_hcm",
					"arm_fac",
					"arm_par",
					"arm_und",
					"arm_for"
				}
			},
			story_train_heist = {
				job = "arm_for",
				story = "story_train_heist"
			},
			story_hard_mallcrasher = {
				job = "mallcrasher",
				story = "story_hard_mallcrasher",
				difficulty = hard_and_above
			},
			story_hard_four_store = {
				job = "four_stores",
				story = "story_hard_four_store",
				difficulty = hard_and_above
			},
			story_hard_white_xmas = {
				job = "pines",
				story = "story_hard_white_xmas",
				difficulty = hard_and_above
			},
			story_hard_ukrainian_job = {
				job = "ukrainian_job_prof",
				story = "story_hard_ukrainian_job",
				difficulty = hard_and_above
			},
			story_hard_meltdown = {
				job = "shoutout_raid",
				story = "story_hard_meltdown",
				difficulty = hard_and_above
			},
			story_hard_aftershock = {
				job = "jolly",
				story = "story_hard_aftershock",
				difficulty = hard_and_above
			},
			story_hard_stealing_xmas = {
				job = "moon",
				story = "story_hard_stealing_xmas",
				difficulty = hard_and_above
			},
			story_hard_nightclub = {
				job = "nightclub",
				story = "story_hard_nightclub",
				difficulty = hard_and_above
			},
			story_very_hard_watchdog = {
				story = "story_very_hard_watchdog",
				jobs = {
					"watchdogs_wrapper",
					"watchdogs_night",
					"watchdogs"
				},
				difficulty = veryhard_and_above
			},
			story_very_hard_firestarter = {
				job = "firestarter",
				story = "story_very_hard_firestarter",
				difficulty = veryhard_and_above
			},
			story_very_hard_rats = {
				job = "alex",
				story = "story_very_hard_rats",
				difficulty = veryhard_and_above
			},
			story_very_hard_big_oil = {
				story = "story_very_hard_big_oil",
				jobs = {
					"welcome_to_the_jungle_wrapper_prof",
					"welcome_to_the_jungle_night_prof",
					"welcome_to_the_jungle_prof"
				},
				difficulty = veryhard_and_above
			},
			story_very_hard_framing_frames = {
				job = "framing_frame",
				story = "story_very_hard_framing_frames",
				difficulty = veryhard_and_above
			},
			story_very_hard_election_day = {
				job = "election_day",
				story = "story_very_hard_election_day",
				difficulty = veryhard_and_above
			},
			story_very_hard_big_bank = {
				job = "big",
				story = "story_very_hard_big_bank",
				difficulty = veryhard_and_above
			},
			story_very_hard_hotline_miami = {
				job = "mia",
				story = "story_very_hard_hotline_miami",
				difficulty = veryhard_and_above
			},
			story_very_hard_hoxton_breakout = {
				job = "hox",
				story = "story_very_hard_hoxton_breakout",
				difficulty = veryhard_and_above
			},
			story_very_hard_hoxton_revenge = {
				job = "hox_3",
				story = "story_very_hard_hoxton_revenge",
				difficulty = veryhard_and_above
			},
			story_very_hard_diamond = {
				job = "mus",
				story = "story_very_hard_diamond",
				difficulty = veryhard_and_above
			},
			story_very_hard_golden_grin = {
				job = "kenaz",
				story = "story_very_hard_golden_grin",
				difficulty = veryhard_and_above
			},
			story_very_hard_bomb_dockyard = {
				job = "crojob1",
				story = "story_very_hard_bomb_dockyard",
				difficulty = veryhard_and_above
			},
			story_very_hard_bomb_forest = {
				story = "story_very_hard_bomb_forest",
				jobs = {
					"crojob_wrapper",
					"crojob2",
					"crojob2_night"
				},
				difficulty = veryhard_and_above
			},
			story_very_hard_scarface = {
				job = "friend",
				story = "story_very_hard_scarface",
				difficulty = veryhard_and_above
			}
		}
		self.check_equipment_memory_on_leave = {
			self.complete_heist_achievements.daily_whats_stealth,
			self.complete_heist_achievements.daily_gears
		}
		self.complete_heist_statistics_achievements = {
			immortal_ballot = {
				num_players = 4,
				award = "ovk_5",
				total_downs = 0,
				levels = {
					"election_day_3",
					"election_day_3_skip1",
					"election_day_3_skip2"
				},
				difficulty = deathwish_and_above
			},
			full_two_twenty = {
				num_players = 4,
				total_kills = 120,
				award = "ovk_7",
				total_accuracy = 120
			},
			berry_4 = {
				is_dropin = false,
				award = "berry_4",
				level_id = "pbr",
				total_downs = 0,
				difficulty = overkill_and_above
			},
			flat_5 = {
				success = true,
				level_id = "flat",
				award = "flat_5",
				total_accuracy = 200
			},
			daily_professional = {
				trophy_stat = "daily_professional",
				difficulty = overkill_and_above,
				total_headshots = {
					invert = true,
					amount = 0
				}
			}
		}
		self.loot_cash_achievements = {
			mallrunner = {
				award = "ameno_3",
				total_value = 1800000,
				total_time = 50,
				jobs = {"mallcrasher"},
				difficulties = {"overkill_145"}
			},
			cane_5 = {
				award = "cane_5",
				job = "cane",
				no_deployable = true,
				no_assets = true,
				secured = {
					carry_id = "present",
					total_amount = 10
				}
			},
			pal_2 = {
				award = "pal_2",
				job = "pal",
				secured = {
					carry_id = "counterfeit_money",
					value = 1000000
				}
			},
			trophy_tfturret = {
				trophy_stat = "trophy_tfturret",
				is_dropin = false,
				jobs = {"arm_for"},
				difficulties = overkill_and_above,
				secured = {
					{
						carry_id = "ammo",
						total_amount = 20
					},
					{
						carry_id = "turret",
						total_amount = 3
					}
				}
			},
			daily_mortage = {
				trophy_stat = "daily_mortage",
				is_dropin = false,
				jobs = {"family"},
				secured = {
					carry_id = "diamonds",
					total_amount = 16
				}
			},
			daily_toast = {
				trophy_stat = "daily_toast",
				is_dropin = false,
				jobs = {"pines"},
				secured = {
					carry_id = "sandwich",
					amount = 1
				}
			},
			daily_lodsofemone = {
				trophy_stat = "daily_lodsofemone",
				secured = {
					carry_id = "money",
					amount = 1
				}
			},
			daily_heirloom = {
				trophy_stat = "daily_heirloom",
				is_dropin = false,
				jobs = {"kosugi"},
				secured = {
					carry_id = "samurai_suit",
					total_amount = 4
				}
			},
			daily_candy = {
				trophy_stat = "daily_candy",
				secured = {{
					amount = 1,
					carry_id = {
						"coke",
						"coke_light",
						"coke_pure",
						"present",
						"yayo"
					}
				}}
			},
			daily_art = {
				trophy_stat = "daily_art",
				is_dropin = false,
				jobs = {"gallery"},
				secured = {
					carry_id = "painting",
					total_amount = 9
				}
			},
			trophy_coke = {
				trophy_stat = "trophy_coke",
				jobs = {"friend"},
				secured = {{
					amount = 1,
					carry_id = {"yayo"}
				}}
			},
			story_shadow_raid_bags = {
				amount = 1,
				story = "story_shadow_raid_bags",
				jobs = {"kosugi"}
			}
		}
		local nar_job = tweak_data.narrative.jobs
		self.job_list = {
			vlad = {
				"ukrainian_job_prof",
				"mallcrasher",
				"four_stores",
				"nightclub",
				"pines",
				"shoutout_raid",
				"jolly",
				"cane",
				"peta",
				"peta_prof",
				"moon"
			},
			hector = {
				nar_job.watchdogs_wrapper and "watchdogs_wrapper" or "watchdogs",
				nar_job.watchdogs_wrapper_prof and "watchdogs_wrapper_prof" or "watchdogs_prof",
				"alex",
				"alex_prof",
				"firestarter",
				"firestarter_prof"
			},
			the_elephant = {
				"framing_frame",
				"framing_frame_prof",
				nar_job.welcome_to_the_jungle_wrapper_prof and "welcome_to_the_jungle_wrapper_prof" or "welcome_to_the_jungle_prof",
				"election_day",
				"election_day_prof",
				"born",
				"born_pro"
			},
			bain = {
				"jewelry_store",
				"family",
				"roberts",
				"branchbank_prof",
				"branchbank_gold_prof",
				"branchbank_cash",
				"branchbank_deposit",
				"arm_cro",
				"arm_hcm",
				"arm_fac",
				"arm_par",
				"arm_und",
				"arm_for",
				"kosugi",
				"gallery",
				"rat",
				"cage",
				"arena"
			},
			the_dentist = {
				"big",
				"mia",
				"mia_prof",
				"hox",
				"hox_prof",
				"mus",
				"hox_3",
				"kenaz"
			},
			the_butcher = {
				"crojob_wrapper",
				"crojob1",
				"friend"
			},
			classic = {
				"red2",
				"dinner",
				"pal",
				"man",
				"flat",
				"run",
				"glace"
			},
			locke = {
				"pbr",
				"pbr2"
			},
			jimmy = {
				"mad",
				"dark"
			},
			events = {
				"nail",
				"help"
			},
			the_continental = {
				"spa",
				"fish"
			}
		}
		self.persistent_stat_unlocks = {
			gage_9_stats = {{
				award = "gage_9",
				at = 100
			}},
			halloween_4_stats = {{
				award = "halloween_4",
				at = 50
			}},
			halloween_5_stats = {{
				award = "halloween_5",
				at = 25
			}},
			halloween_6_stats = {{
				award = "halloween_6",
				at = 666
			}},
			halloween_7_stats = {{
				award = "halloween_7",
				at = 50
			}},
			armored_8_stat = {{
				award = "armored_8",
				at = 7
			}},
			armored_10_stat = {{
				award = "armored_10",
				at = 61
			}},
			gage2_3_stats = {{
				award = "gage2_3",
				at = 50
			}},
			scorpion_1_stats = {{
				award = "scorpion_1",
				at = 100
			}},
			gage_10_stats = {{
				award = "gage_10",
				at = 100
			}},
			halloween_8_stats = {{
				award = "halloween_8",
				at = 666
			}},
			armored_5_stat = {{
				award = "armored_5",
				at = 378
			}},
			armored_7_stat = {{
				award = "armored_7",
				at = 69
			}},
			armored_9_stat = {{
				award = "armored_9",
				at = 95
			}},
			gage_1_stats = {{
				award = "gage_1",
				at = 100
			}},
			gage_2_stats = {{
				award = "gage_2",
				at = 100
			}},
			gage_3_stats = {{
				award = "gage_3",
				at = 100
			}},
			gage_4_stats = {{
				award = "gage_4",
				at = 100
			}},
			gage_5_stats = {{
				award = "gage_5",
				at = 100
			}},
			gage_6_stats = {{
				award = "gage_6",
				at = 100
			}},
			gage_7_stats = {{
				award = "gage_7",
				at = 100
			}},
			gage3_12_stats = {{
				award = "gage3_12",
				at = 10
			}},
			gage3_2_stats = {{
				award = "gage3_2",
				at = 6
			}},
			gage3_3_stats = {{
				award = "gage3_3",
				at = 50
			}},
			gage3_4_stats = {{
				award = "gage3_4",
				at = 100
			}},
			gage3_5_stats = {{
				award = "gage3_5",
				at = 250
			}},
			gage3_6_stats = {{
				award = "gage3_6",
				at = 500
			}},
			gage3_7_stats = {{
				award = "gage3_7",
				at = 25
			}},
			gage3_11_stats = {{
				award = "gage3_11",
				at = 10
			}},
			gage3_13_stats = {{
				award = "gage3_13",
				at = 10
			}},
			gage3_14_stats = {{
				award = "gage3_14",
				at = 25
			}},
			gage3_17_stats = {{
				award = "gage3_17",
				at = 250
			}},
			gage4_6_stats = {{
				award = "gage4_6",
				at = 50
			}},
			gage4_8_stats = {{
				award = "gage4_8",
				at = 10
			}},
			gage4_10_stats = {{
				award = "gage4_10",
				at = 10
			}},
			gage5_1_stats = {{
				award = "gage5_1",
				at = 25
			}},
			gage5_9_stats = {{
				award = "gage5_9",
				at = 10
			}},
			gage5_10_stats = {{
				award = "gage5_10",
				at = 200
			}},
			eagle_1_stats = {{
				award = "eagle_1",
				at = 25
			}},
			ameno_08_stats = {{
				award = "ameno_8",
				at = 100
			}},
			pim_1_stats = {{
				award = "pim_1",
				at = 30
			}},
			pim_3_stats = {{
				award = "pim_3",
				at = 45
			}},
			grv_3_stats = {{
				award = "grv_3",
				at = 300
			}},
			gmod_1_stats = {{
				award = "gmod_1",
				at = 5
			}},
			gmod_2_stats = {{
				award = "gmod_2",
				at = 10
			}},
			gmod_3_stats = {{
				award = "gmod_3",
				at = 15
			}},
			gmod_4_stats = {{
				award = "gmod_4",
				at = 20
			}},
			gmod_5_stats = {{
				award = "gmod_5",
				at = 25
			}},
			gage5_5_stats = {{
				award = "gage5_5",
				at = 25
			}},
			pim_2_stats = {{
				award = "pim_2",
				at = 8
			}},
			tango_2_stats = {{
				award = "tango_achieve_2",
				at = 50
			}},
			gage2_9_stats = {{
				award = "gage2_9",
				at = 15
			}},
			gage4_7_stats = {{
				award = "gage4_7",
				at = 25
			}},
			gage5_8_stats = {{
				award = "gage5_8",
				at = 25
			}},
			pig_3_stats = {{
				award = "pig_3",
				at = 30
			}},
			eagle_2_stats = {{
				award = "eagle_2",
				at = 25
			}},
			halloween_10_stats = {{
				award = "halloween_10",
				at = 25
			}},
			armored_4_stat = {{
				award = "armored_4",
				at = 15
			}},
			gage3_10_stats = {{
				award = "gage3_10",
				at = 10
			}},
			gage3_15_stats = {{
				award = "gage3_15",
				at = 25
			}},
			gage3_16_stats = {{
				award = "gage3_16",
				at = 25
			}},
			eng_1_stats = {{
				award = "eng_1",
				at = 5
			}},
			eng_2_stats = {{
				award = "eng_2",
				at = 5
			}},
			eng_3_stats = {{
				award = "eng_3",
				at = 5
			}},
			eng_4_stats = {{
				award = "eng_4",
				at = 5
			}}
		}
		local jobs = {}
		local job_data = nil
		local available_jobs = {}

		for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
			if tweak_data.narrative:job_data(job_id).contact ~= "wip" and tweak_data.narrative:job_data(job_id).contact ~= "tests" then
				jobs[job_id] = true
				available_jobs[job_id] = tweak_data.narrative:job_data(job_id).contact
			end
		end

		for _, list in pairs(self.job_list) do
			for _, job_id in pairs(list) do
				if tweak_data.narrative:has_job_wrapper(job_id) then
					available_jobs[job_id] = nil

					for _, job_id in ipairs(tweak_data.narrative:job_data(job_id).job_wrapper) do
						available_jobs[job_id] = nil
					end
				elseif jobs[job_id] then
					available_jobs[job_id] = nil
				else
					Application:debug("[TWEAKDATA:ACHIEVEMENTS] Job missing in narrative", job_id)
				end
			end
		end

		if table.size(available_jobs) > 0 then
			Application:debug("[TWEAKDATA:ACHIEVEMENTS] Jobs not yet in achievement 'job_list':", inspect(available_jobs))
		end

		self.complete_heist_stats_achievements = {
			easywish_vlad = {
				award = "pick_62",
				contact = "vlad",
				difficulty = easywish_and_above
			},
			easywish_hector = {
				award = "pick_63",
				contact = "hector",
				difficulty = easywish_and_above
			},
			easywish_elephant = {
				award = "pick_64",
				contact = "the_elephant",
				difficulty = easywish_and_above
			},
			easywish_bain = {
				award = "pick_65",
				contact = "bain",
				difficulty = easywish_and_above
			},
			death_vlad = {
				award = "death_5",
				contact = "vlad",
				difficulty = deathwish_and_above
			},
			death_hector = {
				award = "death_9",
				contact = "hector",
				difficulty = deathwish_and_above
			},
			death_elephant = {
				award = "death_12",
				contact = "the_elephant",
				difficulty = deathwish_and_above
			},
			death_bain = {
				award = "death_26",
				contact = "bain",
				difficulty = deathwish_and_above
			},
			sm_vlad = {
				award = "axe_62",
				contact = "vlad",
				difficulty = sm_wish_and_above
			},
			sm_hector = {
				award = "axe_63",
				contact = "hector",
				difficulty = sm_wish_and_above
			},
			sm_elephant = {
				award = "axe_64",
				contact = "the_elephant",
				difficulty = sm_wish_and_above
			},
			sm_bain = {
				award = "axe_65",
				contact = "bain",
				difficulty = sm_wish_and_above
			},
			skull_hard = {
				award = "death_27",
				contact = "all",
				difficulty = tweak_data.difficulty_name_ids.sm_wish and hard_and_above or {"hard"}
			},
			skull_very_hard = {
				award = "death_28",
				contact = "all",
				difficulty = tweak_data.difficulty_name_ids.sm_wish and veryhard_and_above or {"overkill"}
			},
			skull_overkill = {
				award = "death_29",
				contact = "all",
				difficulty = tweak_data.difficulty_name_ids.sm_wish and overkill_and_above or {"overkill_145"}
			},
			skull_easywish = {
				award = "pick_66",
				contact = "all",
				difficulty = easywish_and_above
			},
			skull_deathwish = {
				award = "death_30",
				contact = "all",
				difficulty = deathwish_and_above
			},
			skull_smwish = {
				award = "axe_66",
				contact = "all",
				difficulty = sm_wish_and_above
			},
			trophy_smwish = {
				contact = "all",
				trophy_stat = "trophy_smwish",
				difficulty = sm_wish_and_above
			}
		}
		
		self.four_mask_achievements = {
			reindeer_games = {
				award = "charliesierra_9",
				masks = {
					"santa_happy",
					"santa_mad",
					"santa_drunk",
					"santa_surprise"
				}
			},
			ghost_riders = {
				award = "bob_10",
				masks = {
					"skullhard",
					"skullveryhard",
					"skulloverkill",
					"skulloverkillplus",
					"gitgud_e_wish",
					"gitgud_sm_wish"
				}
			},
			funding_father = {
				award = "bigbank_10",
				masks = {
					"franklin",
					"lincoln",
					"grant",
					"washington"
				}
			},
			go_bananas = {
				award = "gage4_12",
				jobs = {"alex"},
				difficulties = overkill_and_above,
				masks = {
					"silverback",
					"mandril",
					"skullmonkey",
					"orangutang"
				}
			},
			animal_fight = {
				award = "pig_5",
				jobs = {"mia"},
				difficulties = hard_and_above,
				masks = {
					"white_wolf",
					"owl",
					"rabbit",
					"pig"
				}
			},
			guy_with_gun_now_with_night_jobs = {
				award = "gage5_6",
				jobs = {
					"watchdogs_wrapper",
					"watchdogs",
					"watchdogs_night"
				},
				difficulties = overkill_and_above,
				masks = {
					"galax",
					"crowgoblin",
					"evil",
					"volt"
				}
			},
			wind_of_change = {
				award = "eagle_3",
				jobs = {"hox"},
				difficulties = overkill_and_above,
				masks = {
					"churchill",
					"red_hurricane",
					"patton",
					"de_gaulle"
				}
			},
			xmas_2014 = {
				award = "deer_6",
				jobs = {"pines"},
				difficulties = deathwish_and_above,
				masks = {
					"krampus",
					"mrs_claus",
					"strinch",
					"robo_santa"
				}
			},
			blight = {
				award = "bat_5",
				jobs = {"mus"},
				difficulties = overkill_and_above,
				masks = {
					"medusa",
					"anubis",
					"pazuzu",
					"cursed_crown"
				}
			}
		}
		self.sniper_kill_achievements = {
			did_i_do_that = {
				weapon_type = "snp",
				award = "gage3_9",
				multi_kill = 3
			},
			max_peneration = {
				weapon = "r93",
				stat = "gage3_10_stats",
				obstacle = "shield",
				enemy = "shield"
			},
			you_cant_hide = {
				weapon = "r93",
				stat = "gage3_15_stats",
				obstacle = "wall"
			},
			two_for_one = {
				weapon = "msr",
				stat = "gage3_16_stats",
				multi_kill = 2
			}
		}
		self.inventory = {}
		self.crime_spree = {
			cee_1 = {
				award = "cee_1",
				level = 50
			},
			cee_2 = {
				award = "cee_2",
				level = 100
			},
			cee_3 = {
				award = "cee_3",
				level = 250
			},
			story_crime_spree = {
				story = "story_crime_spree",
				level = 20
			}
		}
		local gage_5_1_achievement = {
			max_progress = 25,
			stat = "gage5_1_stats",
			text_id = "bm_wp_gage5_1_achievment"
		}
		local gage_5_2_achievement = {
			award = "gage5_2",
			text_id = "bm_wp_gage5_2_achievment"
		}
		local gage_5_3_achievement = {
			award = "gage5_3",
			text_id = "bm_wp_gage5_3_achievment"
		}
		local gage_5_4_achievement = {
			award = "gage5_4",
			text_id = "bm_wp_gage5_4_achievment"
		}
		local gage_5_5_achievement = {
			max_progress = 25,
			stat = "gage5_5_stats",
			text_id = "bm_wp_gage5_5_achievment"
		}
		local gage_5_6_achievement = {
			award = "gage5_6",
			text_id = "bm_wp_gage5_6_achievment"
		}
		local gage_5_7_achievement = {
			award = "gage5_7",
			text_id = "bm_wp_gage5_7_achievment"
		}
		local gage_5_9_achievement = {
			max_progress = 10,
			stat = "gage5_9_stats",
			text_id = "bm_wp_gage5_9_achievment"
		}
		local gage_5_10_achievement = {
			max_progress = 200,
			stat = "gage5_10_stats",
			text_id = "bm_wp_gage5_10_achievment"
		}
		local pig_1_achievement = {
			award = "pig_1",
			text_id = "bm_wp_pig_1_achievment"
		}
		local pig_2_achievement = {
			award = "pig_2",
			text_id = "bm_wp_pig_2_achievment"
		}
		local pig_3_achievement = {
			max_progress = 25,
			stat = "pig_3_stats",
			text_id = "bm_wp_pig_3_achievment"
		}
		local pig_4_achievement = {
			award = "pig_4",
			text_id = "bm_wp_pig_4_achievment"
		}
		local pig_5_achievement = {
			award = "pig_5",
			text_id = "bm_wp_pig_5_achievment"
		}
		local eagle_1_achievement = {
			max_progress = 25,
			stat = "eagle_1_stats",
			text_id = "bm_wp_eagle_1_achievment"
		}
		local eagle_2_achievement = {
			max_progress = 25,
			stat = "eagle_2_stats",
			text_id = "bm_wp_eagle_2_achievment"
		}
		local eagle_3_achievement = {
			award = "eagle_3",
			text_id = "bm_wp_eagle_3_achievment"
		}
		local eagle_4_achievement = {
			award = "eagle_4",
			text_id = "bm_wp_eagle_4_achievment"
		}
		local eagle_5_achievement = {
			award = "eagle_5",
			text_id = "bm_wp_eagle_5_achievment"
		}
		local ameno_1_achievement = {
			award = "ameno_1",
			text_id = "bm_wp_ameno_1_achievment"
		}
		local ameno_2_achievement = {
			award = "ameno_2",
			text_id = "bm_wp_ameno_2_achievment"
		}
		local ameno_3_achievement = {
			award = "ameno_3",
			text_id = "bm_wp_ameno_3_achievment"
		}
		local ameno_4_achievement = {
			award = "ameno_4",
			text_id = "bm_wp_ameno_4_achievment"
		}
		local ameno_5_achievement = {
			award = "ameno_5",
			text_id = "bm_wp_ameno_5_achievment"
		}
		local ameno_6_achievement = {
			award = "ameno_6",
			text_id = "bm_wp_ameno_6_achievment"
		}
		local ameno_7_achievement = {
			award = "ameno_7",
			text_id = "bm_wp_ameno_7_achievment"
		}
		local ameno_8_achievement = {
			max_progress = 100,
			stat = "ameno_08_stats",
			text_id = "bm_wp_ameno_8_achievment"
		}
		self.mask_tracker = {}
		self.weapon_part_tracker = {
			wpn_fps_snp_m95_barrel_long = {
				max_progress = 25,
				stat = "gage3_7_stats",
				text_id = "bm_wp_m95_b_barrel_long_achievment"
			},
			wpn_fps_snp_r93_b_suppressed = {
				award = "gage3_8",
				text_id = "bm_wp_r93_b_suppressed_achievment"
			},
			wpn_fps_upg_o_45iron = {
				award = "gage3_9",
				text_id = "bm_wp_upg_o_45iron_achievment"
			},
			wpn_fps_snp_r93_b_short = {
				max_progress = 10,
				stat = "gage3_10_stats",
				text_id = "bm_wp_r93_b_short_achievment"
			},
			wpn_fps_snp_m95_barrel_suppressed = {
				max_progress = 10,
				stat = "gage3_11_stats",
				text_id = "bm_wp_m95_b_barrel_suppressed_achievment"
			},
			wpn_fps_snp_m95_barrel_short = {
				max_progress = 10,
				award = "gage3_12_stats",
				text_id = "bm_wp_m95_b_barrel_short_achievment"
			},
			wpn_fps_upg_o_leupold = {
				max_progress = 10,
				stat = "gage3_13_stats",
				text_id = "bm_wp_upg_o_leupold_achievment"
			},
			wpn_fps_snp_msr_body_msr = {
				max_progress = 25,
				stat = "gage3_14_stats",
				text_id = "bm_wp_msr_body_msr_achievment"
			},
			wpn_fps_snp_r93_body_wood = {
				max_progress = 25,
				stat = "gage3_15_stats",
				text_id = "bm_wp_r93_body_wood_achievment"
			},
			wpn_fps_snp_msr_ns_suppressor = {
				max_progress = 25,
				stat = "gage3_16_stats",
				text_id = "bm_wp_snp_msr_ns_suppressor_achievment"
			},
			wpn_fps_snp_msr_b_long = {
				max_progress = 250,
				stat = "gage3_17_stats",
				text_id = "bm_wp_snp_msr_b_long_achievment"
			},
			wpn_fps_ass_fal_fg_01 = {
				award = "bigbank_7",
				text_id = "bm_wp_fal_fg_01_achievment"
			},
			wpn_fps_ass_fal_fg_03 = {
				award = "bigbank_8",
				text_id = "bm_wp_fal_fg_03_achievment"
			},
			wpn_fps_ass_fal_fg_04 = {
				award = "bigbank_3",
				text_id = "bm_wp_fal_fg_04_achievment"
			},
			wpn_fps_ass_fal_fg_wood = {
				award = "bigbank_4",
				text_id = "bm_wp_fal_fg_wood_achievment"
			},
			wpn_fps_ass_fal_s_01 = {
				award = "bigbank_5",
				text_id = "bm_wp_fal_s_01_achievment"
			},
			wpn_fps_ass_fal_s_03 = {
				award = "bigbank_10",
				text_id = "bm_wp_fal_s_03_achievment"
			},
			wpn_fps_ass_fal_s_wood = {
				award = "bigbank_6",
				text_id = "bm_wp_fal_s_wood_achievment"
			},
			wpn_fps_ass_fal_g_01 = {
				award = "bigbank_1",
				text_id = "bm_wp_fal_g_01_achievment"
			},
			wpn_fps_ass_fal_m_01 = {
				award = "bigbank_2",
				text_id = "bm_wp_fal_m_01_achievment"
			},
			wpn_fps_upg_o_mbus_rear = {
				award = "gage4_2",
				text_id = "bm_wp_upg_o_mbus_rear_achievment"
			},
			wpn_fps_sho_ben_b_short = {
				award = "gage4_4",
				text_id = "bm_wp_ben_b_short_achievment"
			},
			wpn_fps_sho_ben_b_long = {
				award = "gage4_5",
				text_id = "bm_wp_ben_b_long_achievment"
			},
			wpn_fps_sho_ben_s_collapsed = {
				max_progress = 50,
				stat = "gage4_6",
				text_id = "bm_wp_ben_s_collapsed_achievment"
			},
			wpn_fps_sho_ksg_b_short = {
				max_progress = 25,
				stat = "gage4_7",
				text_id = "bm_wp_ksg_b_short_achievment"
			},
			wpn_fps_sho_ksg_b_long = {
				max_progress = 10,
				stat = "gage4_8",
				text_id = "bm_wp_ksg_b_long_achievment"
			},
			wpn_fps_sho_ben_s_solid = {
				award = "gage4_9",
				text_id = "bm_wp_ben_s_solid_achievment"
			},
			wpn_fps_sho_striker_b_long = {
				max_progress = 10,
				stat = "gage4_10_stats",
				text_id = "bm_wp_striker_b_long_achievment"
			},
			wpn_fps_sho_striker_b_suppressed = {
				award = "gage4_11",
				text_id = "bm_wp_striker_b_suppressed_achievment"
			},
			wpn_fps_gre_m79_barrel_short = gage_5_5_achievement,
			wpn_fps_gre_m79_stock_short = gage_5_2_achievement,
			wpn_fps_ass_g3_b_sniper = gage_5_1_achievement,
			wpn_fps_ass_g3_fg_psg = gage_5_1_achievement,
			wpn_fps_ass_g3_g_sniper = gage_5_1_achievement,
			wpn_fps_ass_g3_s_sniper = gage_5_1_achievement,
			wpn_fps_ass_g3_b_short = gage_5_4_achievement,
			wpn_fps_ass_g3_fg_retro_plastic = gage_5_4_achievement,
			wpn_fps_ass_g3_fg_railed = gage_5_6_achievement,
			wpn_fps_ass_g3_fg_retro = gage_5_7_achievement,
			wpn_fps_ass_g3_g_retro = gage_5_7_achievement,
			wpn_fps_ass_g3_s_wood = gage_5_7_achievement,
			wpn_fps_ass_galil_s_sniper = gage_5_1_achievement,
			wpn_fps_ass_galil_fg_sniper = gage_5_1_achievement,
			wpn_fps_ass_galil_g_sniper = gage_5_1_achievement,
			wpn_fps_ass_galil_fg_sar = gage_5_6_achievement,
			wpn_fps_ass_galil_fg_mar = gage_5_3_achievement,
			wpn_fps_ass_galil_s_plastic = gage_5_3_achievement,
			wpn_fps_ass_galil_s_light = gage_5_4_achievement,
			wpn_fps_ass_galil_s_wood = gage_5_5_achievement,
			wpn_fps_ass_galil_fg_fab = gage_5_9_achievement,
			wpn_fps_ass_galil_s_fab = gage_5_9_achievement,
			wpn_fps_ass_galil_s_skeletal = gage_5_9_achievement,
			wpn_fps_ass_famas_b_sniper = gage_5_1_achievement,
			wpn_fps_ass_famas_b_short = gage_5_4_achievement,
			wpn_fps_ass_famas_b_long = gage_5_6_achievement,
			wpn_fps_ass_famas_g_retro = gage_5_10_achievement,
			wpn_fps_ass_famas_b_suppressed = gage_5_10_achievement,
			wpn_fps_smg_scorpion_g_ergo = pig_1_achievement,
			wpn_fps_smg_scorpion_m_extended = pig_1_achievement,
			wpn_fps_smg_scorpion_s_unfolded = pig_1_achievement,
			wpn_fps_smg_uzi_fg_rail = pig_2_achievement,
			wpn_fps_smg_uzi_s_leather = pig_2_achievement,
			wpn_fps_smg_uzi_s_solid = pig_3_achievement,
			wpn_fps_smg_scorpion_g_wood = pig_3_achievement,
			wpn_fps_smg_tec9_ns_ext = pig_4_achievement,
			wpn_fps_smg_tec9_m_extended = pig_4_achievement,
			wpn_fps_smg_tec9_s_unfolded = pig_4_achievement,
			wpn_fps_smg_uzi_b_suppressed = pig_5_achievement,
			wpn_fps_smg_uzi_s_standard = pig_5_achievement,
			wpn_fps_smg_scorpion_b_suppressed = pig_5_achievement,
			wpn_fps_smg_scorpion_s_nostock = pig_5_achievement,
			wpn_fps_smg_tec9_b_standard = pig_5_achievement,
			wpn_fps_snp_mosin_b_sniper = eagle_1_achievement,
			wpn_fps_snp_mosin_b_standard = eagle_1_achievement,
			wpn_fps_smg_sterling_b_e11 = eagle_2_achievement,
			wpn_fps_pis_c96_nozzle = eagle_2_achievement,
			wpn_fps_pis_c96_sight = eagle_2_achievement,
			wpn_fps_smg_sterling_b_short = eagle_2_achievement,
			wpn_fps_smg_sterling_b_suppressed = eagle_2_achievement,
			wpn_fps_smg_sterling_m_short = eagle_2_achievement,
			wpn_fps_smg_sterling_s_folded = eagle_2_achievement,
			wpn_fps_smg_sterling_s_nostock = eagle_2_achievement,
			wpn_fps_smg_sterling_s_solid = eagle_2_achievement,
			wpn_fps_snp_mosin_body_black = eagle_3_achievement,
			wpn_fps_pis_c96_b_long = eagle_3_achievement,
			wpn_fps_snp_mosin_b_short = eagle_3_achievement,
			wpn_fps_smg_sterling_m_long = eagle_3_achievement,
			wpn_fps_smg_sterling_b_long = eagle_3_achievement,
			wpn_fps_lmg_mg42_b_vg38 = eagle_3_achievement,
			wpn_fps_pis_c96_m_extended = eagle_4_achievement,
			wpn_fps_pis_c96_s_solid = eagle_4_achievement,
			wpn_fps_lmg_mg42_b_mg34 = eagle_5_achievement,
			wpn_fps_upg_ass_m4_upper_reciever_core = ameno_1_achievement,
			wpn_fps_upg_ass_m4_lower_reciever_core = ameno_1_achievement,
			wpn_fps_upg_ass_m16_fg_stag = ameno_1_achievement,
			wpn_fps_upg_ak_g_rk3 = ameno_2_achievement,
			wpn_fps_upg_ak_fg_zenit = ameno_2_achievement,
			wpn_fps_upg_ass_m4_upper_reciever_ballos = ameno_2_achievement,
			wpn_fps_upg_o_ak_scopemount = ameno_3_achievement,
			wpn_fps_upg_ns_ass_pbs1 = ameno_3_achievement,
			wpn_fps_upg_ass_ak_b_zastava = ameno_4_achievement,
			wpn_fps_upg_ak_m_uspalm = ameno_4_achievement,
			wpn_fps_upg_ass_m4_fg_moe = ameno_5_achievement,
			wpn_fps_upg_smg_olympic_fg_lr300 = ameno_5_achievement,
			wpn_fps_upg_ass_m4_fg_lvoa = ameno_5_achievement,
			wpn_fps_upg_ak_s_solidstock = ameno_6_achievement,
			wpn_fps_upg_m4_s_ubr = ameno_6_achievement,
			wpn_fps_upg_ass_m4_b_beowulf = ameno_7_achievement,
			wpn_fps_upg_m4_m_l5 = ameno_7_achievement,
			wpn_fps_upg_ak_fg_trax = ameno_8_achievement,
			wpn_fps_upg_ak_fg_krebs = ameno_8_achievement,
			wpn_fps_upg_ak_b_ak105 = ameno_8_achievement
		}

		if SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1") then
			self.weapon_part_tracker = {}
		end

		self.milestones = {}

		self:_init_visual(tweak_data)
	end

	local function get_texture_path(tweak_data, category, id)
		local td = tweak_data:get_raw_value("blackmarket", category, id)
		local rtn = {}
		if td then
			if category == "textures" then
				rtn.texture = td.texture
				rtn.render_template = "VertexColorTexturedPatterns"
			else
				local guis_catalog = "guis/"
				local bundle_folder = td.texture_bundle_folder

				if bundle_folder then
					guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
				end

				rtn.texture = guis_catalog .. "textures/pd2/blackmarket/icons/" .. (category == "weapon_mods" and "mods" or category) .. "/" .. id
			end

			if not DB:has(Idstring("texture"), Idstring(rtn.texture)) then
				debug_pause("[Track]", "ERROR TEXTURE PATH", category, id)
			end
		end
		return rtn
	end

	local tracking = {
		second = "second",
		realtime = "realtime",
		rarely = "rarely"
	}

	local function from_complete_heist_stats_item(self, item)
		local heists = nil

		if item.contact == "all" then
			local lists = table.map_values(self.job_list)
			heists = table.list_union(unpack(lists))
		else
			heists = table.list_copy(self.job_list[item.contact])
		end

		local function get_todo()
			local res = table.list_to_set(heists)

			for _, job in pairs(heists) do
				for _, difficulty in ipairs(item.difficulty) do
					if managers.statistics:completed_job(job, difficulty) > 0 then
						res[job] = nil

						break
					end
				end
			end

			return table.map_keys(res)
		end

		return {
			persistent = true,
			is_list = true,
			get_todo_list = get_todo,
			get = function ()
				return #heists - #get_todo()
			end,
			checklist = heists,
			max = #heists,
			update = tracking.rarely
		}
	end

	local function from_crimespree_item(item)
		return {
			get = function ()
				local rtn = managers.crime_spree and managers.crime_spree:spree_level() or -1

				return rtn == -1 and 0 or rtn
			end,
			max = item.level,
			update = tracking.realtime
		}
	end

	local function from_level(level)
		if not level then
			error()
		end

		return {
			persistent = true,
			get = function ()
				return managers.experience:current_level()
			end,
			max = level,
			update = tracking.realtime
		}
	end

	local function from_owned_weapons(num)
		if not num then
			error()
		end

		return {
			persistent = true,
			get = function ()
				return table.size(managers.blackmarket:get_crafted_category("primaries")) + table.size(managers.blackmarket:get_crafted_category("secondaries"))
			end,
			max = num,
			update = tracking.rarely
		}
	end

	local function from_timed_memory(item, memory_name, count_name)
		count_name = count_name or "count"

		if not memory_name or not item or not item[count_name] then
			error()
		end

		return {
			get = function ()
				local mem = managers.job:get_memory(memory_name, true) or {}
				local t = Application:time()

				return table.count(mem, function (time)
					return t - time < item.timer
				end)
			end,
			max = item[count_name],
			update = tracking.realtime
		}
	end

	function AchievementsTweakData:_init_visual(tweak_data)
		self.tags = {
			progress = {
				"leveling",
				"beginner",
				"completion",
				"heisting",
				"generic"
			},
			contracts = {"all"},
			difficulty = {
				"normal",
				"hard",
				"very_hard",
				"overkill"
			},
			unlock = {
				"mask",
				"weapon",
				"skill_slot",
				"character"
			},
			tactics = {
				"loud",
				"stealth",
				"killer",
				"timed"
			},
			inventory = {
				"mask",
				"weapon",
				"armor",
				"skill",
				"equipment"
			},
			teamwork = {
				"players_1_to_4",
				"players_4"
			}
		}

		if tweak_data.difficulty_name_ids.easy_wish then
			table.insert(self.tags.difficulty, "mayhem")
		end
		
		if tweak_data.difficulty_name_ids.overkill_290 then
			table.insert(self.tags.difficulty, "death_wish")
		end

		if tweak_data.difficulty_name_ids.sm_wish then
			table.insert(self.tags.difficulty, "one_down")
		end

		local contacts = {}

		for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
			local contact = tweak_data.narrative:job_data(job_id).contact

			if contact ~= "wip" and contact ~= "tests" and not table.contains(self.tags.contracts, contact) then
				table.insert(self.tags.contracts, contact)
			end
		end

		for cat_name, cat in pairs(self.tags) do
			local converted = {}

			for _, tag in pairs(cat) do
				converted[tag] = cat_name .. "_" .. tag
			end

			self.tags[cat_name] = converted
		end

		self.visual = init_auto_generated_achievement_data(self.tags)

		self:_init_non_auto_generated(tweak_data)

		for stat, unlocks in pairs(self.persistent_stat_unlocks) do
			for _, v in pairs(unlocks) do
				local data = self.visual[v.award]

				if not data then
					Application:error("Achievement visual data for '" .. v.award .. "' doesn't exists! (achievement was found in 'persistent_stat_unlocks')")
				elseif type(data.progress) ~= "table" then
					data.progress = {
						persistent = true,
						get = function ()
							return managers.achievment:get_stat(stat)
						end,
						max = v.at,
						update = tracking.second
					}
				end
			end
		end

		for name, data in pairs(tweak_data.dlc) do
			local visual = data.achievement_id and self.visual[data.achievement_id]

			if visual then
				if visual.need_unlock_icons == false then
					visual.need_unlock_icons = nil
				else
					visual.need_unlock_icons = nil
					visual.unlock_icons = visual.unlock_icons or {}
					visual.unlock_id = visual.unlock_id or true

					for _, loot in pairs(data.content.loot_drops) do
						local tex_data = get_texture_path(tweak_data, loot.type_items, loot.item_entry)

						if not table.contains(visual.unlock_icons, tex_data) then
							tex_data.type_items = loot.type_items
							tex_data.original_order = #visual.unlock_icons + 1

							table.insert(visual.unlock_icons, tex_data)
						end
					end

					local sort_order = {
						"characters",
						"weapon_mods",
						"masks",
						"melee_weapons",
						"materials",
						"textures"
					}

					table.sort(visual.unlock_icons, function (lhs, rhs)
						local l = table.index_of(sort_order, lhs.type_items)
						local r = table.index_of(sort_order, rhs.type_items)

						if l == r then
							return lhs.original_order < rhs.original_order
						elseif not l or not r then
							return l
						end

						return l < r
					end)
				end
			elseif data.achievement_id then
				for _, loot in pairs(data.content.loot_drops) do
					get_texture_path(tweak_data, loot.type_items, loot.item_entry)
				end
			end
		end

		for name, data in pairs(self.visual) do
			data.name_id = data.name_id or "achievement_" .. name
			data.desc_id = data.desc_id or "achievement_" .. name .. "_desc"
			data.additional_id = data.additional_id == true and "achievement_" .. name .. "_additional" or data.additional_id
			data.unlock_id = data.unlock_id == true and "achievement_" .. name .. "_unlock" or data.unlock_id
			data.icon_id = data.icon_id or data.sort_name
		end
	end

	function AchievementsTweakData:_init_non_auto_generated(tweak_data)
		self.visual.bulldog_1.unlock_icons = {
			{
				type_items = "characters",
				type_index = -1,
				original_order = -1,
				texture = "guis/dlcs/trk/textures/pd2/old_hoxton_unlock_icon"
			},
			table.map_append({
				type_items = "melee_weapons",
				type_index = 99,
				original_order = 0
			}, get_texture_path(tweak_data, "melee_weapons", "toothbrush"))
		}
		self.visual.frog_1.unlock_icons = {{
			type_items = "kill_slot",
			texture = "guis/dlcs/trk/textures/pd2/skills_slot_unlock_icon"
		}}
		self.visual.armored_2.need_unlock_icons = false

		for k, v in pairs(self.complete_heist_stats_achievements) do
			if v.award then
				self.visual[v.award].progress = from_complete_heist_stats_item(self, v)
			end
		end

		self.visual.armed_and_dangerous.progress = from_level(self.level_achievements.armed_and_dangerous.level)
		self.visual.big_shot.progress = from_level(self.level_achievements.big_shot.level)
		self.visual.gone_in_30_seconds.progress = from_level(self.level_achievements.gone_in_30_seconds.level)
		self.visual.guilty_of_crime.progress = from_level(self.level_achievements.guilty_of_crime.level)
		self.visual.most_wanted.progress = from_level(self.level_achievements.most_wanted.level)
		self.visual.you_gotta_start_somewhere.progress = from_level(self.level_achievements.you_gotta_start_somewhere.level)

		for id, v in pairs(self.crime_spree) do
			if v.award then
				self.visual[id].progress = from_crimespree_item(v)
			end
		end

		for i, v in pairs(self.infamous) do
			self.visual[v].progress = {
				get = function ()
					return managers.experience:current_rank() or 0
				end,
				max = i
			}
		end

		self.visual.fully_loaded.progress = from_owned_weapons(self.fully_loaded)
		self.visual.gage_8.progress = from_owned_weapons(self.arms_dealer)
		self.visual.weapon_collector.progress = from_owned_weapons(self.weapon_collector)
		self.visual.grill_3.progress = from_timed_memory(self.grenade_achievements.not_invited, "gre_ach_not_invited", "kill_count")
		self.visual.gage4_4.progress = from_timed_memory(self.enemy_kill_achievements.seven_eleven, "seven_eleven")
		self.visual.eagle_5.progress = from_timed_memory(self.enemy_kill_achievements.bullet_hell, "bullet_hell")
		self.visual.scorpion_4.progress = from_timed_memory(self.enemy_kill_achievements.scorpion_4, "scorpion_4")
		self.visual.brooklyn_1.progress = {
			max = 1,
			get = function ()
				return 0
			end,
			update = tracking.realtime
		}
		self.visual.berry_5.progress = {
			get = function ()
				return managers.job:get_memory("berry_5", true) or 0
			end,
			max = self.enemy_kill_achievements.berry_5.count_in_row,
			update = tracking.realtime
		}
		self.visual.turtles_1.progress = {
			get = function ()
				return managers.job:get_memory("kill_count_no_reload_wa2000", true) or 0
			end,
			max = self.enemy_kill_achievements.turtles_1.count_no_reload,
			update = tracking.realtime
		}
		self.visual.grv_2.progress = {
			get = function ()
				return managers.job:get_memory("kill_count_no_reload_coal", true) or 0
			end,
			max = self.enemy_kill_achievements.grv_2.count_no_reload,
			update = tracking.realtime
		}
		local cane_5 = self.loot_cash_achievements.cane_5
		self.visual.cane_5.progress = {
			get = function ()
				local total, _, _ = managers.loot._count_achievement_secured and managers.loot:_count_achievement_secured("cane_5", cane_5.secured)

				return total or 0
			end,
			max = cane_5.secured.total_amount,
			update = tracking.second
		}
		self.visual.gage2_5.progress = {
			get = function ()
				return managers.statistics.session_killed_by_weapon_category and managers.statistics:session_killed_by_weapon_category(self.first_blood.weapon_type) or 0
			end,
			max = self.first_blood.count,
			update = tracking.realtime
		}
		self.visual.going_places.progress = {
			get = function ()
				return managers.money:total()
			end,
			max = self.going_places,
			update = tracking.realtime
		}
		local pal_2 = self.loot_cash_achievements.pal_2
		self.visual.pal_2.progress = {
			get = function ()
				local _, _, value = managers.loot._count_achievement_secured and managers.loot:_count_achievement_secured("pal_2", pal_2.secured)

				return value or 0
			end,
			max = pal_2.secured.value,
			update = tracking.second
		}
		local steel_2 = self.enemy_melee_kill_achievements.steel_2
		self.visual.steel_2.progress = {
			get = function ()
				if table.contains(steel_2.melee_weapons, managers.blackmarket:equipped_melee_weapon()) then
					return managers.statistics:session_enemy_killed_by_type(achievement_data.enemy_kills.enemy, "melee")
				end

				return 0
			end,
			max = steel_2.enemy_kills.count,
			update = tracking.second
		}
		local tango_3 = self.complete_heist_achievements.tango_3
		self.visual.tango_achieve_3.progress = {
			get = function ()
				if not table.contains(tango_3.difficulty, Global.game_settings.difficulty) then
					return 0
				end

				local rtn = 0
				local weapons_to_check = {
					managers.blackmarket:equipped_primary(),
					managers.blackmarket:equipped_secondary()
				}

				for _, weapon_data in ipairs(weapons_to_check) do
					if table.contains(weapon_data.blueprint or {}, tango_3.killed_by_blueprint.blueprint) then
						rtn = rtn + (managers.statistics:session_killed_by_weapon(weapon_data.weapon_id) or 0)
					end
				end

				return rtn
			end,
			max = tango_3.killed_by_blueprint.amount,
			update = tracking.realtime
		}
		self.visual.tango_achieve_4.progress = {
			get = function ()
				local unit = managers.player.equipped_weapon_unit and managers.player:equipped_weapon_unit()

				if not unit or not unit:base() then
					return 0
				end

				local data = unit:base()._tango_4_data

				return data and data.count or 0
			end,
			max = self.tango_4.count
		}
		local turtles_2 = self.enemy_kill_achievements.turtles_2
		self.visual.turtles_2.progress = {
			get = function ()
				return managers.statistics.session_killed_by_weapon and managers.statistics:session_killed_by_weapon(turtles_2.weapon) or 0
			end,
			max = turtles_2.kill_count
		}
		self.visual.gage4_3.progress = {
			get = function ()
				return managers.statistics:session_total_killed()[self.close_and_personal.kill_type] or 0
			end,
			max = self.close_and_personal.count
		}
		self.visual.spend_money_to_make_money.progress = {
			get = function ()
				return managers.money:total_spent()
			end,
			max = self.spend_money_to_make_money
		}
	end

	local old_tweak_data_achievement = deep_clone(tweak_data.achievement)
	tweak_data.achievement = AchievementsTweakData:new(tweak_data)

	for k, v in pairs(old_tweak_data_achievement) do
		tweak_data.achievement[k] = v
	end
end

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