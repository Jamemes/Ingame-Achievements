local function icon(icon_type, params)
	local icon_data = nil
	local pos = {0, 0, 64, 64}
	local icons = {
		infamy = {"guis/textures/pd2/endscreen/rep_upgrade", {0, 0, 128, 128}},
		one_down = {"guis/textures/pd2/risklevel_deathwish_sm_blackscreen", pos},
		death_wish = {"guis/textures/pd2/risklevel_deathwish_blackscreen", pos},
		mayhem = {"guis/textures/pd2/risklevel_deathwish_easywish_blackscreen", pos},
		overkill = {"guis/textures/pd2/risklevel_blackscreen", pos},
		very_hard = {"guis/textures/pd2/risklevel_blackscreen", pos},
		hard = {"guis/textures/pd2/risklevel_blackscreen", pos},
		normal = {"guis/textures/pd2/risklevel_blackscreen", pos},
		green_mantis = {"guis/dlcs/gage_pack_jobs/textures/pd2/gage_popup_img_green", {-16, 0, 160, 160}},
		yellow_bull = {"guis/dlcs/gage_pack_jobs/textures/pd2/gage_popup_img_yellow", {-16, 0, 160, 160}},
		red_spider = {"guis/dlcs/gage_pack_jobs/textures/pd2/gage_popup_img_red", {-16, 0, 160, 160}},
		blue_eagle = {"guis/dlcs/gage_pack_jobs/textures/pd2/gage_popup_img_blue", {-16, 0, 160, 160}},
		purple_snake = {"guis/dlcs/gage_pack_jobs/textures/pd2/gage_popup_img_purple", {-16, 0, 160, 160}},
		gage_packs = {"guis/dlcs/gage_pack_jobs/textures/pd2/endscreen/gage_assignment", {0, 0, 128, 128}},
	}

	if type(params) == "table" and icon_type == "skilltree" then
		icons.skilltree = {"guis/textures/pd2/skilltree/icons_atlas", {64 * params[1], 64 * params[2], 64, 64}}
	end
	
	if icons[icon_type] then
		icon_data = icons[icon_type]
	else
		local default_pos = {
			armors = {0, 0, 256, 256},
			grenades = {0, -64, 256, 256},
			masks = {0, 0, 128, 128},
			melee_weapons = {0, -64, 256, 256},
			mods = {0, -64, 256, 256},
			weapons = {0, -64, 256, 256}
		}
		params[2] = params[2] and "dlcs/" .. params[2] .. "/" or ""
		params[3] = params[3] or default_pos[icon_type]
		
		icon_data = {"guis/" .. params[2] .. "textures/pd2/blackmarket/icons/" .. icon_type .. "/" .. params[1], params[3]}
	end

	return icon_data
end

tweak_data.achievement.IngameAchievements_icons = {
	-- level
	you_gotta_start_somewhere = icon("skilltree", {7, 8}),	--5.
	guilty_of_crime = icon("skilltree", {7, 8}),			--10.
	gone_in_30_seconds = icon("skilltree", {7, 8}),			--25.
	armed_and_dangerous = icon("skilltree", {7, 8}),		--50.
	big_shot = icon("skilltree", {7, 8}),					--75.
	most_wanted = icon("skilltree", {7, 8}),				--100.

	ignominy_1 = icon("infamy"),
	ignominy_2 = icon("infamy"),
	ignominy_3 = icon("infamy"),
	ignominy_4 = icon("infamy"),
	ignominy_5 = icon("infamy"),
	ignominy_6 = icon("infamy"),
	ignominy_7 = icon("infamy"),
	ignominy_8 = icon("infamy"),
	ignominy_9 = icon("infamy"),
	ignominy_10 = icon("infamy"),
	ignominy_11 = icon("infamy"),
	ignominy_12 = icon("infamy"),
	ignominy_13 = icon("infamy"),
	ignominy_14 = icon("infamy"),
	ignominy_15 = icon("infamy"),
	ignominy_16 = icon("infamy"),
	ignominy_17 = icon("infamy"),
	ignominy_18 = icon("infamy"),
	ignominy_19 = icon("infamy"),
	ignominy_20 = icon("infamy"),
	ignominy_21 = icon("infamy"),
	ignominy_22 = icon("infamy"),
	ignominy_23 = icon("infamy"),
	ignominy_24 = icon("infamy"),
	ignominy_25 = icon("infamy"),
	
	axe_1 = icon("one_down"),
	axe_2 = icon("one_down"),
	axe_3 = icon("one_down"),
	axe_4 = icon("one_down"),
	axe_5 = icon("one_down"),
	axe_7 = icon("one_down"),
	axe_9 = icon("one_down"),
	axe_11 = icon("one_down"),
	axe_13 = icon("one_down"),
	axe_14 = icon("one_down"),
	axe_15 = icon("one_down"),
	axe_16 = icon("one_down"),
	axe_17 = icon("one_down"),
	axe_18 = icon("one_down"),
	axe_19 = icon("one_down"),
	axe_20 = icon("one_down"),
	axe_21 = icon("one_down"),
	axe_22 = icon("one_down"),
	axe_23 = icon("one_down"),
	axe_24 = icon("one_down"),
	axe_25 = icon("one_down"),
	axe_26 = icon("one_down"),
	axe_27 = icon("one_down"),
	axe_29 = icon("one_down"),
	axe_30 = icon("one_down"),
	axe_31 = icon("one_down"),
	axe_33 = icon("one_down"),
	axe_34 = icon("one_down"),
	axe_36 = icon("one_down"),
	axe_37 = icon("one_down"),
	axe_38 = icon("one_down"),
	axe_39 = icon("one_down"),
	axe_40 = icon("one_down"),
	axe_41 = icon("one_down"),
	axe_42 = icon("one_down"),
	axe_43 = icon("one_down"),
	axe_44 = icon("one_down"),
	axe_45 = icon("one_down"),
	axe_46 = icon("one_down"),
	axe_47 = icon("one_down"),
	axe_48 = icon("one_down"),
	axe_49 = icon("one_down"),
	axe_51 = icon("one_down"),
	axe_52 = icon("one_down"),
	axe_53 = icon("one_down"),
	axe_54 = icon("one_down"),
	axe_55 = icon("one_down"),
	axe_56 = icon("one_down"),
	axe_57 = icon("one_down"),
	axe_59 = icon("one_down"),
	axe_60 = icon("one_down"),
	axe_61 = icon("one_down"),
	axe_62 = icon("one_down"),
	axe_63 = icon("one_down"),
	axe_64 = icon("one_down"),
	axe_65 = icon("one_down"),
	axe_666 = icon("one_down"),	
	fish_3 = icon("one_down"),
	friend_3 = icon("one_down"),
	glace_7 = icon("one_down"),
	moon_3 = icon("one_down"),
	orange_3 = icon("one_down"),
	run_7 = icon("one_down"),
	spa_3 = icon("one_down"),
	
	bat_1 = icon("death_wish"),
	berry_1 = icon("death_wish"),
	bigbank_9 = icon("death_wish"),
	bob_2 = icon("death_wish"),
	bob_9 = icon("death_wish"),
	born_1 = icon("death_wish"),
	born_2 = icon("death_wish"),
	bulldog_2 = icon("death_wish"),
	bulldog_3 = icon("death_wish"),
	cane_1 = icon("death_wish"),
	cow_2 = icon("death_wish"),
	cow_7 = icon("death_wish"),
	dark_1 = icon("death_wish"),
	death_1 = icon("death_wish"),
	death_2 = icon("death_wish"),
	death_3 = icon("death_wish"),
	death_4 = icon("death_wish"),
	death_5 = icon("death_wish"),
	death_6 = icon("death_wish"),
	death_7 = icon("death_wish"),
	death_8 = icon("death_wish"),
	death_9 = icon("death_wish"),
	death_10 = icon("death_wish"),
	death_11 = icon("death_wish"),
	death_12 = icon("death_wish"),
	death_13 = icon("death_wish"),
	death_14 = icon("death_wish"),
	death_15 = icon("death_wish"),
	death_16 = icon("death_wish"),
	death_17 = icon("death_wish"),
	death_18 = icon("death_wish"),
	death_19 = icon("death_wish"),
	death_20 = icon("death_wish"),
	death_21 = icon("death_wish"),
	death_22 = icon("death_wish"),
	death_23 = icon("death_wish"),
	death_24 = icon("death_wish"),
	death_25 = icon("death_wish"),
	death_26 = icon("death_wish"),
	death_32 = icon("death_wish"),
	death_33 = icon("death_wish"),
	death_34 = icon("death_wish"),
	death_35 = icon("death_wish"),
	deer_5 = icon("death_wish"),
	djur_1 = icon("death_wish"),
	farm_5 = icon("death_wish"),
	fish_2 = icon("death_wish"),
	flat_1 = icon("death_wish"),
	fort_1 = icon("death_wish"),
	friend_2 = icon("death_wish"),
	glace_6 = icon("death_wish"),
	green_5 = icon("death_wish"),
	halloween_nightmare_5 = icon("death_wish"),
	jerry_1 = icon("death_wish"),
	kenaz_1 = icon("death_wish"),
	kosugi_6 = icon("death_wish"),
	lab_3 = icon("death_wish"),	
	live_1 = icon("death_wish"),
	mad_1 = icon("death_wish"),	
	man_1 = icon("death_wish"),	
	melt_1 = icon("death_wish"),
	moon_2 = icon("death_wish"),
	orange_2 = icon("death_wish"),
	pal_1 = icon("death_wish"),	
	payback_1 = icon("death_wish"),
	peta_1 = icon("death_wish"),
	peta_1_prof = icon("death_wish"),
	pig_1 = icon("death_wish"),	
	pig_6 = icon("death_wish"),	
	run_6 = icon("death_wish"),	
	sinus_2 = icon("death_wish"),
	spa_2 = icon("death_wish"),	
	squek = icon("death_wish"),	

	fish_1 = icon("mayhem"),
	friend_1 = icon("mayhem"),
	glace_5 = icon("mayhem"),
	moon_1 = icon("mayhem"),
	orange_1 = icon("mayhem"),
	pick_1 = icon("mayhem"),
	pick_2 = icon("mayhem"),
	pick_3 = icon("mayhem"),
	pick_4 = icon("mayhem"),
	pick_5 = icon("mayhem"),
	pick_7 = icon("mayhem"),
	pick_9 = icon("mayhem"),
	pick_11 = icon("mayhem"),
	pick_13 = icon("mayhem"),
	pick_14 = icon("mayhem"),
	pick_15 = icon("mayhem"),
	pick_16 = icon("mayhem"),
	pick_17 = icon("mayhem"),
	pick_18 = icon("mayhem"),
	pick_19 = icon("mayhem"),
	pick_20 = icon("mayhem"),
	pick_21 = icon("mayhem"),
	pick_22 = icon("mayhem"),
	pick_23 = icon("mayhem"),
	pick_24 = icon("mayhem"),
	pick_25 = icon("mayhem"),
	pick_26 = icon("mayhem"),
	pick_27 = icon("mayhem"),
	pick_29 = icon("mayhem"),
	pick_30 = icon("mayhem"),
	pick_31 = icon("mayhem"),
	pick_33 = icon("mayhem"),
	pick_34 = icon("mayhem"),
	pick_36 = icon("mayhem"),
	pick_37 = icon("mayhem"),
	pick_38 = icon("mayhem"),
	pick_39 = icon("mayhem"),
	pick_40 = icon("mayhem"),
	pick_41 = icon("mayhem"),
	pick_42 = icon("mayhem"),
	pick_43 = icon("mayhem"),
	pick_44 = icon("mayhem"),
	pick_45 = icon("mayhem"),
	pick_46 = icon("mayhem"),
	pick_47 = icon("mayhem"),
	pick_48 = icon("mayhem"),
	pick_49 = icon("mayhem"),
	pick_51 = icon("mayhem"),
	pick_52 = icon("mayhem"),
	pick_53 = icon("mayhem"),
	pick_54 = icon("mayhem"),
	pick_55 = icon("mayhem"),
	pick_56 = icon("mayhem"),
	pick_57 = icon("mayhem"),
	pick_59 = icon("mayhem"),
	pick_60 = icon("mayhem"),
	pick_61 = icon("mayhem"),
	pick_62 = icon("mayhem"),
	pick_63 = icon("mayhem"),
	pick_64 = icon("mayhem"),
	pick_65 = icon("mayhem"),
	pick_666 = icon("mayhem"),
	run_5 = icon("mayhem"),
	spa_1 = icon("mayhem"),

	glace_4 = icon("overkill"),
	run_4 = icon("overkill"),

	glace_3 = icon("very_hard"),
	run_3 = icon("very_hard"),

	glace_2 = icon("hard"),
	run_2 = icon("hard"),

	cow_1 = icon("normal"),
	cow_6 = icon("normal"),
	glace_1 = icon("normal"),
	melt_2 = icon("normal"),
	run_1 = icon("normal"),

	-- loot
	going_all_in = icon("skilltree", {2, 3}),
	armored_3 = icon("skilltree", {2, 3}),
	big_deal = icon("skilltree", {2, 3}),
	bilbo_baggin = icon("skilltree", {2, 3}),
	bob_4 = icon("skilltree", {2, 3}),
	caribbean_pirate = icon("skilltree", {2, 3}),
	charliesierra_5 = icon("skilltree", {2, 3}),
	deer_7 = icon("skilltree", {2, 3}),
	diamonds_are_forever = icon("skilltree", {2, 3}),
	flat_3 = icon("skilltree", {2, 3}),
	halloween_2 = icon("skilltree", {2, 3}),
	i_wasnt_even_there = icon("skilltree", {2, 3}),
	kosugi_1 = icon("skilltree", {2, 3}),
	kosugi_2 = icon("skilltree", {2, 3}),
	kosugi_3 = icon("skilltree", {2, 3}),
	kosugi_5 = icon("skilltree", {2, 3}),
	lord_of_war = icon("skilltree", {2, 3}),
	moon_5 = icon("skilltree", {2, 3}),
	murphys_laws = icon("skilltree", {2, 3}),
	voff_2 = icon("skilltree", {2, 3}),
	voff_5 = icon("skilltree", {2, 3}),

	-- modify_weapons
	gmod_7 = icon("skilltree", {1, 7}),
	gmod_8 = icon("skilltree", {1, 7}),
	gmod_9 = icon("skilltree", {1, 7}),
	gmod_10 = icon("skilltree", {1, 7}),
	would_you_like_your_receipt = icon("skilltree", {1, 7}),
	masked_villain = icon("skilltree", {1, 7}),

	-- stealth
	ameno_5 = icon("skilltree", {0, 3}),
	bigbank_5 = icon("skilltree", {0, 3}),
	bigbank_7 = icon("skilltree", {0, 3}),
	bob_3 = icon("skilltree", {0, 3}),
	bob_7 = icon("skilltree", {0, 3}),
	bob_8 = icon("skilltree", {0, 3}),
	charliesierra_2 = icon("skilltree", {0, 3}),
	ovk_2 = icon("skilltree", {0, 3}),
	ovk_6 = icon("skilltree", {0, 3}),
	payback_2 = icon("skilltree", {0, 3}),
	pink_panther = icon("skilltree", {0, 3}),

	-- sprinter
	green_3 = icon("skilltree", {7, 3}),
	hot_wheels = icon("skilltree", {7, 3}),
	cow_11 = icon("skilltree", {7, 3}),
	flat_2 = icon("skilltree", {7, 3}),
	fort_4 = icon("skilltree", {7, 3}),
	brooklyn_1 = icon("skilltree", {7, 3}),
	brooklyn_2 = icon("skilltree", {7, 3}),
	brooklyn_4 = icon("skilltree", {7, 3}),
	slakt_1 = icon("skilltree", {7, 3}),
	fish_4 = icon("skilltree", {7, 3}),

	-- transporter
	cane_5 = icon("skilltree", {6, 0}),
	fish_ai = icon("skilltree", {6, 0}),
	melt_4 = icon("skilltree", {6, 0}),
	ovk_10 = icon("skilltree", {6, 0}),
	green_4 = icon("skilltree", {6, 0}),
	bah_1 = icon("skilltree", {6, 0}),
	charliesierra_1 = icon("skilltree", {6, 0}),
	farm_6 = icon("skilltree", {6, 0}),
	gage2_1 = icon("skilltree", {6, 0}),

	-- inside_man
	armored_2 = icon("skilltree", {0, 8}),
	the_first_line = icon("skilltree", {0, 8}),
	charliesierra_4 = icon("skilltree", {0, 8}),
	cow_9 = icon("skilltree", {0, 8}),
	green_7 = icon("skilltree", {0, 8}),
	run_8 = icon("skilltree", {0, 8}),

	-- fast_hands
	lets_do_this = icon("skilltree", {4, 3}),					--In the Ukrainian Job"), complete the heist within 35 seconds. --fast hands
	bigbank_4 = icon("skilltree", {4, 3}),					--In the Big Bank job"), complete the heist in under 12 minutes on the Hard difficulty or above. --fast hands
	farm_4 = icon("skilltree", {4, 3}),						--In the Slaughterhouse job"), pick up two gasoline tanks within 30 seconds of entering the slaughterhouse. --fast hands
	frappucino_to_go_please = icon("skilltree", {4, 3}),		--In the Cafe escape"), secure all loot and escape within 30 seconds of the escape van arriving. --fast hands
	short_fuse = icon("skilltree", {4, 3}),					--On day 3 of the Rats job"), get away with 7 bags without defusing any bombs. --Fast Hands
	berry_3 = icon("skilltree", {4, 3}),						--In the Beneath the Mountain job"), open the 4 vaults that contain loot within 10 minutes of starting the heist on the OVERKILL difficulty or above. --Fast Hands

	-- chameleon
	frog_1 = icon("skilltree", {5, 3}),						--In the Hoxton Breakout job"), complete the heist on the OVERKILL difficulty or above with each crew member using no skills"), wearing suits"), wielding Golden AK.762 rifles and Chicago Typewriter submachine guns. --icon("skilltree", {5, 3}),
	flake_1 = icon("skilltree", {5, 3}),						--Complete the Framing Frame job on the OVERKILL difficulty or above with each crew member using no skills"), wearing suits"), wielding Platypus 70 sniper rifles and Judge shotguns. --icon("skilltree", {5, 3}),
	ovk_4 = icon("skilltree", {5, 3}),						--Complete the Watchdogs job with each crew member using no skills"), wielding the AMCAR Rifle and Chimano 88 Pistol on the OVERKILL difficulty or above. --icon("skilltree", {5, 3}),
	jerry_5 = icon("skilltree", {5, 3}),						--Complete the Birth of Sky job"), have the entire crew use only pistols and Two Piece Suits on the OVERKILL difficulty or above. --icon("skilltree", {5, 3}),
	ovk_8 = icon("skilltree", {5, 3}),						--Complete the Big Oil job"), with at least one other player"), all using suits and Akimbo Bernetti 9 Pistols on the OVERKILL difficulty or above. --icon("skilltree", {5, 3}),
	spa_4 = icon("skilltree", {5, 3}),						--Complete the Brooklyn 10-10 job from start"), by having all team members using Sniper Rifles and the OVE9000 saws on the OVERKILL difficulty or above. --icon("skilltree", {5, 3}),

	-- money
	tip_the_scales = icon("skilltree", {0, 6}),				--Add money to the scales --money icon
	spend_money_to_make_money = icon("skilltree", {0, 6}),	--Spend $1.000.000 in total cash.  --money icon
	no_turning_back = icon("skilltree", {0, 6}),				--Complete your first job. --money icon
	going_places = icon("skilltree", {0, 6}),					--Gain $1.000.000 in total spendable cash. --money
	voff_4 = icon("skilltree", {0, 6}),						--In the Birth of Sky job"), find all 9 rings. --money

	-- sentry_tower_defense
	halloween_1 = icon("skilltree", {7, 6}),								--On day 1 of the Rats job"), cook 3 bags worth of meth without letting any law enforcer enter the house. --Sentry Tower Defense
	halloween_3 = icon("skilltree", {7, 6}),								--On day 3 of the Framing Frame job"), while doing plan B"), don't let law enforcers pull the power. --Sentry Tower Defense
	king_of_the_hill = icon("skilltree", {7, 6}),								--In the Park escape"), ensure that no law enforcement enters the park before the escape van arrives. --Sentry Tower Defense
	cane_2 = icon("skilltree", {7, 6}),								--In the Santa's Workshop job"), keep all the elves alive for 30 minutes after the first assault starts on the OVERKILL difficulty or above. --Sentry Tower Defense
	pal_4 = icon("skilltree", {7, 6}),								--On the Counterfeit job"), don't let the cops enter the printing room until the safe is opened on the OVERKILL difficulty or above. --Sentry Tower Defense

	-- cable_guy
	ameno_2 = icon("skilltree", {4, 7}),								--In the Nightclub job"), have 12 hostages or more on the dance floor when you escape. --Cable Guy
	glace_10 = icon("skilltree", {4, 7}),								--On the Green Bridge job"), free and zip-tie all extra prisoners in the prison vans. --cable guy
	pal_5 = icon("skilltree", {4, 7}),								--On the Counterfeit job"), have all civilians as hostages until the safe is opened. --cable guy
	slakt_4 = icon("skilltree", {4, 7}),								--In the Nightclub job"), zip-tie the DJ and bring him to the escape zone by the escape van. --cable guy

	-- underdog
	armored_6 = icon("skilltree", {2, 1}),							--Complete the Transport: Train Heist without any of your crew members killing any enemy snipers. --underdog
	bullet_dodger = icon("skilltree", {2, 1}),						--In the Street escape"), complete the escape without letting any enemy snipers die. --underdog
	farm_1 = icon("skilltree", {2, 1}),								--Complete the Slaughterhouse job on the OVERKILL difficulty or above while Captain Winters is still present on the level. --Underdog
	farm_3 = icon("skilltree", {2, 1}),								--Complete the Slaughterhouse job on the OVERKILL difficulty or above without anyone killing a single sniper. --Underdog

	-- nerves_of_steel
	brooklyn_3 = icon("skilltree", {6, 6}),								--Don't jump a single time during an entire heist. --nerves of steel
	farm_2 = icon("skilltree", {6, 6}),								--In the Slaughterhouse job"), get the armored truck to drop without shooting at the wires on which it is suspended.--nerves of steel
	run_9 = icon("skilltree", {6, 6}),								--Complete the Heat Street job without using any gas cans. --Nerves of Steel
	slakt_3 = icon("skilltree", {6, 6}),								--In the Hoxton Breakout job"), complete day 2 without using a single keycard on the OVERKILL difficulty or above. --Nerves of Steel

	-- stockholm_syndrome
	charliesierra_6 = icon("skilltree", {3, 8}),						--In the GO Bank job"), complete the heist without the alarm going off and without killing any civilians on the OVERKILL difficulty or above. --Stockholm Syndrome
	voff_3 = icon("skilltree", {3, 8}),								--Complete the Murky Station job by finding and securing all loot without killing anyone on the OVERKILL difficulty or above. --Stockholm Syndrome
	run_10 = icon("skilltree", {3, 8}),								--Complete the Heat Street job without killing any civilians on the Hard difficulty or above. --Stockholm Syndrome

	-- cat_burglar
	f_in_chemistry = icon("skilltree", {0, 4}),						--On day 1 of the Rats job or the Cook Off job"), blow up the lab. --cat burglar
	jerry_2 = icon("skilltree", {0, 4}),								--In the Birth of Sky job"), parachute into the diner through a hole in the roof. --Cat Burglar
	window_cleaner = icon("skilltree", {0, 4}),						--In the Mallcrasher job"), destroy all windows in the mall. --cat burglar

	-- martial_arts
	cow_10 = icon("skilltree", {1, 3}),								--In The Bomb: Dockyard job"), don't let the enemies cut the power. --martial arts
	gage4_3 = icon("skilltree", {1, 3}),								--Complete any single day of a heist"), killing at least 50 enemies using only your melee weapon. --martial arts
	gage2_9 = icon("skilltree", {1, 3}),								--Kill 15 FBI SWAT and FBI Heavy SWAT units with a knife while at 25% or less health on the OVERKILL difficulty or above. --Martial Arts

	-- sharpshooter
	flat_5 = icon("skilltree", {6, 5}),								--Complete Panic Room on any difficulty with a total crew hit accuracy above 200% --sharpshooter
	tango_achieve_4 = icon("skilltree", {6, 5}),						--Kill 10 enemies in a row"), without missing"), while switching between the regular sight and the 45 Degree Red Dot Sight after each kill on the OVERKILL difficulty or above. --Sharpshooter
	tango_achieve_3 = icon("skilltree", {6, 5}),						--Complete any heist from start to end and kill 200 or more enemies with any weapon equipped with the Reconnaissance Sight on the Very Hard difficulty or above. --Sharpshooter

	-- control_freak
	green_1 = icon("skilltree", {6, 7}),								--Complete the First World Bank job with 6 or more hostages alive behind the wall by the elevators in the main lobby. --control freak
	moon_6 = icon("skilltree", {6, 7}),								--On the Stealing Xmas job"), escape the heist while keeping at least 10 zip-tied civilians alive within the 4 pillars around the Christmas tree. --control freak
	voff_1 = icon("skilltree", {6, 7}),								--Complete the Bank Heist job after finding the 2 punks in the parking lot and bringing them next to the van"), without letting them get away or die on the OVERKILL difficulty or above. --Control Freak

	-- lucky_charm
	the_wire = icon("skilltree", {5, 2}),						--On day 2 of the Firestarter job"), complete the heist in stealth without hacking the computer. --Lucky Charm
	yeah_hes_a_gold_digger = icon("skilltree", {5, 2}),		--In the Four Stores job"), find a gold bar in a safe. --lucky charm
	fort_3 = icon("skilltree", {5, 2}),								--In the Car Shop job, be the first player in a four-man crew to reach the docks. --Nine Lives (without halo)

	-- moving_target
	you_shall_not_pass = icon("skilltree", {2, 4}),			--In the Overpass escape"), don't let the cops set foot on the bridge before you can escape. --Moving Target
	glace_9 = icon("skilltree", {2, 4}),						--On the Green Bridge job"), escort the convict from the van to the scaffolding while never touching the ground"), on the OVERKILL difficulty or above. --Moving Target


	-- cleaner
	charliesierra_8 = icon("skilltree", {7, 2}),						--In the GO Bank job"), put at least 4 body bags under the Christmas tree. --cleaner
	dark_5 = icon("skilltree", {7, 2}),								--Complete the Murky Station job after hiding one body bag in each dumpster. --cleaner

	-- fast_learner
	doctor_fantastic = icon("skilltree", {7, 8}),						--On day 2 of the Big Oil job"), complete the heist with the first engine being correct. --fast learner
	im_a_healer_tank_damage_dealer = icon("skilltree", {7, 8}),		--Spend 10 skill points in each skill tree. --fast learner

	-- bullet_storm
	gage2_4 = icon("skilltree", {4, 5}),								--Kill 10 enemies in a row using any light machine gun without releasing the trigger. --bullet storm
	gage2_5 = icon("skilltree", {4, 5}),								--Kill 220 enemies in a single day of a heist using any light machine gun. --bullet storm

	-- hard_boiled
	gage2_6 = icon("skilltree", {4, 1}),								--Kill a jump kicking Cloaker using any shotgun. --Hard Boiled
	gage4_5 = icon("skilltree", {4, 1}),								--Complete any heist by killing at least 50 enemies and getting 101% accuracy or above using any shotgun. --Hard Boiled

	-- die_hard
	gage3_13 = icon("skilltree", {1, 2}),								--Kill 10 enemies using any sniper rifle while zip lining. --Die Hard
	gage3_8 = icon("skilltree", {1, 2}),								--Perform a headshot kill on enemies using only the R93 sniper rifle while zip lining. --Die Hard

	-- oppressor
	gage3_14 = icon("skilltree", {4, 0}),								--Kill 25 Snipers using only the Rattlesnake sniper rifle. --Oppressor
	gage3_9 = icon("skilltree", {4, 0}),								--Kill 3 enemies with one bullet using any sniper rifle. --Oppressor
	
	-- tough_guy
	gage5_3 = icon("skilltree", {1, 1}),								--Equip the GL40 grenade launcher"), the Locomotive 12G shotgun"), and the Improved Combined Tactical Vest. --Tough Guy
	man_2 = icon("skilltree", {1, 1}),								--Complete the Undercover job on the OVERKILL difficulty or above without anyone in your crew getting downed or cuffed. --Tough Guy

	charliesierra_7 = icon("skilltree", {4, 4}), 				--In the GO Bank job, complete the heist without using your primary weapon on the OVERKILL difficulty or above. --The Professional
	armored_1 = icon("skilltree", {7, 1}),							--On the Transport: Train Heist, steal and secure all bags worth of ammo. --Ammunition Specialist
	berry_4 = icon("skilltree", {4, 9}),								--Complete the Beneath the Mountain job on the OVERKILL difficulty or above without any player going down. --Inspire
	bigbank_8 = icon("skilltree", {4, 8}),								--In the Big Bank job, start the Big Bank job after having spent all 10 favors in Preplanning. --Black Marketeer
	bob_5 = icon("skilltree", {6, 2}),								--On day 1 of the Election Day job, tag the right truck. --ecm feedback
	bob_6 = icon("skilltree", {1, 4}),								--On day 1 of the Election Day job, tag the wrong truck, then find nothing in the vault. --ecm override
	dark_4 = icon("skilltree", {3, 9}),								--Complete the Murky Station job by killing all guards and not using any ECM jammers on the OVERKILL difficulty or above. --Gunslinger
	fort_2 = icon("skilltree", {5, 4}),								--Enter a drivable vehicle. --lockpicking expert
	gage2_8 = icon("skilltree", {5, 7}),								--You finally got what you were asking for! --Combat Medic
	gage4_2 = icon("skilltree", {5, 0}),								--Own the Locomotive, Street Sweeper, Reinfeld, Mosconi, Izhma, Raven and M1014 Shotguns. --Shotgun Impact
	glace_8 = icon("skilltree", {2, 7}),						--On the Green Bridge job, do what you can for the Dying Man. --Combat Doctor
	green_6 = icon("skilltree", {3, 6}),								--In the First World Bank job, solve the PAYDAY: The Heist secret on the Death Wish difficulty or above and enter the OVERVAULT. --Drill Sergeant
	i_knew_what_i_was_doing_was_wrong = icon("skilltree", {0, 1}),	--On day 1 of the Big Oil job, enter the basement, open the ATM machines and take the loot. --Portable Saw
	iron_man = icon("skilltree", {3, 1}),						--Equip the Improved Combined Tactical Vest. --ictv icon
	mad_5 = icon("skilltree", {6, 4}),								--Have all four players using a fully unlocked Maniac perk deck and have an average of 65% or more of the white Maniac bar filled. --Bulletproof
	ovk_9 = icon("skilltree", {6, 8}),								--On any day of a heist, have four law enforcers converted at the same time on the OVERKILL difficulty or above. --Joker
	slakt_2 = {"guis/textures/pd2/specialization/icons_atlas", {64, 64 * 4, 64, 64}},								--Answer 4 pagers by yourself within 90 seconds from the first to the last pager. --Dutch courage (Burglar perk deck)

	cee_1 = {"fonts/font_large_csicons", {0, 5, 42, 42}},								--Reach rank 50 in the Crime Spree.   --crime spree icon
	cee_2 = {"fonts/font_large_csicons", {0, 5, 42, 42}},								--Reach rank 100 in the Crime Spree.  --crime spree icon
	cee_3 = {"fonts/font_large_csicons", {0, 5, 42, 42}},								--Reach rank 250 in the Crime Spree.  --crime spree icon

	gmod_1 = icon("green_mantis"),								--Collect 5 packages with the green mantis stamp on to earn a green crate. --green mantis icon
	gmod_2 = icon("yellow_bull"),								--Collect 10 packages with the yellow bull stamp to earn a yellow crate.   --yellow bull icon
	gmod_3 = icon("red_spider"),								--Collect 15 packages with the red spider stamp on to earn a red crate.    --red spider icon
	gmod_4 = icon("blue_eagle"),								--Collect 20 packages with the blue eagle stamp on to earn a blue crate.   --blue eagle icon
	gmod_5 = icon("purple_snake"),								--Collect 25 packages with the purple snake stamp to earn a purple crate.  --purple snake icon
	gmod_6 = icon("gage_packs"),								--Earn one of each crate. --gage packs icon
	
	-- Masks icons
	death_27 = icon("masks", {"skullhard"}),							--Complete all contracts on the Hard difficulty or above.
	death_28 = icon("masks", {"skullveryhard"}),						--Complete all contracts on the Very Hard difficulty or above.
	death_29 = icon("masks", {"skulloverkill"}),						--Complete all contracts on the OVERKILL difficulty or above.
	pick_66 = icon("masks", {"gitgud_e_wish", "gitgud"}),				--Complete all contracts on the Mayhem difficulty or above.
	death_30 = icon("masks", {"skulloverkillplus"}),					--Complete all contracts on the Death Wish difficulty.
	axe_66 = icon("masks", {"gitgud_sm_wish", "gitgud"}),				--Complete all contracts on the One Down difficulty.
	halloween_nightmare_1 = icon("masks", {"baby_happy"}),			--In the Safe House Nightmare job find the correct baby mask on the Normal difficulty.
	halloween_nightmare_2 = icon("masks", {"brazil_baby"}),			--In the Safe House Nightmare job find the correct baby mask on the Hard difficulty.
	halloween_nightmare_3 = icon("masks", {"baby_angry"}),			--In the Safe House Nightmare job find the correct baby mask on the Very Hard difficulty.
	halloween_nightmare_4 = icon("masks", {"baby_cry"}),				--In the Safe House Nightmare job find the correct baby mask on the OVERKILL difficulty.
	like_an_angry_bear = icon("masks", {"bear"}),						--Equip the "Mark" mask. Celebrating 2 years of heists.
	halloween_10 = icon("masks", {"bear"}),							--While wearing the "Mark" mask, complete 25 of Vlad's jobs on the OVERKILL difficulty or above. --Mark smaller icon
	armored_4 = icon("masks", {"heat"}),								--While wearing the "Hockey Heat" mask, complete any Armored Transport heist 15 times on the OVERKILL difficulty or above. --Hockey Heat smaller icon
	armored_11 = icon("masks", {"heat"}),								--Equip the "Hockey Heat" mask.
	armored_10 = icon("masks", {"obama", "dlc1"}),					--While wearing the "44th" mask, place 61 doctor bags.
	armored_7 = icon("masks", {"nixon", "dlc1"}),						--While wearing the "37th" mask, kill 69 snipers using the Commando 553 rifle.
	armored_8 = icon("masks", {"clinton", "dlc1"}),					--While wearing the "42nd" mask, trade 7 civilians.
	armored_9 = icon("masks", {"bush", "dlc1"}),						--While wearing the "43rd" mask, kill 95 Shields using the Swedish K submachine gun.
	gage_1 = icon("masks", {"goat", "gage_pack"}),					--While wearing the "Dolph" mask, kill 100 enemies using only the AK5 rifle.
	gage_2 = icon("masks", {"panda", "gage_pack"}),					--While wearing the "Jean-Claude" mask, kill 100 enemies using only the Kobus 90 submachine gun.
	gage_3 = icon("masks", {"pitbull", "gage_pack"}),					--While wearing the "Arnold" mask, kill 100 enemies using only the UAR rifle.
	gage_4 = icon("masks", {"eagle", "gage_pack"}),					--While wearing the "Chuck" mask, kill 100 enemies using only the Crosskill pistol.
	halloween_4 = icon("masks", {"witch"}),							--While wearing the "Witch" mask from the Halloween event, revive 50 crew members.
	halloween_5 = icon("masks", {"frank"}),							--While wearing the "Frank" mask from the Halloween event, get electrocuted by a Taser 25 times.
	halloween_6 = icon("masks", {"pumpkin_king"}),					--While wearing the "Pumpkin" mask from the Halloween event, kill 666 enemies using only shotguns.
	halloween_7 = icon("masks", {"venomorph"}),						--While wearing the "Venomorph" mask from the Halloween event, silently kill 50 enemies using only melee.
	charliesierra_3 = icon("masks", {"santa_happy"}),					--Equip the "Happy Santa" mask.
	no_one_cared_who_i_was = icon("masks", {"dallas"}),				--Until I put on the mask.
	payback_3 = icon("masks", {"hectors_helmet", "hoxton_revenge"}),	--Kill the traitor. --The Hard Hat
	kosugi_4 = icon("masks", {"samurai"}),							--In the Shadow Raid job, secure all 4 pieces of the samurai armor. --Somen Mempo
	gage3_3 = icon("masks", {"robberfly", "gage_pack_snp"}),								--Perform 50 headshot kills using any sniper rifle. --Asilidae
	gage3_4 = icon("masks", {"spider", "gage_pack_snp"}),								--Perform 100 headshot kills using any sniper rifle. --Tarantula
	gage3_5 = icon("masks", {"wasp", "gage_pack_snp"}),								--Perform 250 headshot kills using any sniper rifle. --Vespula
	gage3_6 = icon("masks", {"mantis", "gage_pack_snp"}),								--Perform 500 headshot kills using any sniper rifle. --Sphodromantis
	bigbank_6 = icon("masks", {"grant", "big_bank"}),								--Bring Bobblehead Bob to the vault. --The 18th
	bigbank_1 = icon("masks", {"franklin", "big_bank"}),								--In The Big Bank job, hack the correct computer on the first try. --The First American
	bigbank_2 = icon("masks", {"washington", "big_bank"}),								--Drop Floyd the pig on top of a law enforcer. --The 1st
	bigbank_3 = icon("masks", {"lincoln", "big_bank"}),								--Complete The Big Bank job with 16 secured bags. --The 16th
	gage4_8 = icon("masks", {"skullmonkey", "gage_pack_shotgun"}),				--Kill 10 snipers using any shotgun and flechette ammo. --Clint
	gage4_4 = icon("masks", {"mandril", "gage_pack_shotgun"}),								--Get 7 enemy headshot kills within 11 seconds using any shotgun. --John
	gage4_10 = icon("masks", {"silverback", "gage_pack_shotgun"}),								--Kill 10 Bulldozers using any shotgun and 000 buckshot ammo. --Steven
	gage4_11 = icon("masks", {"orangutang", "gage_pack_shotgun"}),								--Complete any day of a heist in stealth with a Locomotive 12G shotgun modified with the "Silent Killer Suppressor" equipped. --Rutger
	gage5_1 = icon("masks", {"evil", "gage_pack_assault"}),								--Kill 25 Bulldozers using the Gewehr 3 Rifle. --Black Death
	gage5_2 = icon("masks", {"crowgoblin", "gage_pack_assault"}),								--Kill at least four enemies with one GL40 grenade launcher shot. --Crow Goblin
	gage5_9 = icon("masks", {"volt", "gage_pack_assault"}),								--Kill 10 Cloakers using the Gecko 7.62 rifle. --Volt
	gage5_10 = icon("masks", {"galax", "gage_pack_assault"}),								--Kill 200 enemies using the Clarion rifle. --Professor Wrath
	bulldog_1 = icon("masks", {"old_hoxton"}),								--Complete the Hoxton Breakout job on the Normal difficulty or above. --Hoxton Return
	pig_3 = icon("masks", {"white_wolf", "hl_miami"}),								--In the Hotline Miami job, kill 30 thugs with the Baseball Bat. --Dennis
	pig_4 = icon("masks", {"rabbit", "hl_miami"}),								--Cook and secure six bags of meth on day 1 of the Hotline Miami job. --Graham
	pig_7 = icon("masks", {"pig", "hl_miami"}),								--On day 2 of the Hotline Miami job, save someone in need. --Aubrey
	pig_2 = icon("masks", {"owl", "hl_miami"}),								--In day 2 of the Hotline Miami job, reach the Commissar's apartment in under 210 seconds on the OVERKILL difficulty or above. --Rasmus
	eagle_1 = icon("masks", {"de_gaulle", "gage_pack_historical"}),								--Kill 25 enemies as they rappel using the Nagant sniper rifle. --Constable
	eagle_2 = icon("masks", {"red_hurricane", "gage_pack_historical"}),								--Kill 25 enemies while in stealth using the Trench knife. --Red Bear
	eagle_4 = icon("masks", {"churchill", "gage_pack_historical"}),								--Equip a Broomstick pistol with the Damper.L 44 Nozzle and the Barrel Sight 44. --British Bulldog
	eagle_5 = icon("masks", {"patton", "gage_pack_historical"}),								--Kill 10 enemies within 10 seconds using the Buzzsaw 42 light machine gun. --Old Blood and Guts
	deer_1 = icon("masks", {"mrs_claus", "pines"}),								--Complete the White Xmas job on the Normal difficulty or above. --Mrs. Claus
	deer_2 = icon("masks", {"strinch", "pines"}),								--Complete the White Xmas job on the Hard difficulty or above. --Strinch
	deer_3 = icon("masks", {"krampus", "pines"}),								--Complete the White Xmas job on the Very Hard difficulty or above. --Krampus
	deer_4 = icon("masks", {"robo_santa", "pines"}),								--Complete the White Xmas job on the OVERKILL difficulty or above. --Mechanical Santa
	deer_6 = icon("masks", {"almirs_beard", "pines"}),								--In the White Xmas job, complete the heist on the Death Wish difficulty or above while each crew member wears a different "2014 Xmas" mask each. --Almir’s Beard
	bat_2 = icon("masks", {"cursed_crown", "character_pack_clover"}),								--In The Diamond job, complete the heist without triggering the alarm. --The Cursed One
	bat_3 = icon("masks", {"medusa", "character_pack_clover"}),								--In The Diamond job, secure 10 bags of additional loot. --Medusa
	bat_4 = icon("masks", {"pazuzu", "character_pack_clover"}),								--In The Diamond job, steal the Diamond and escape in under 10 minutes. --Pazuzu
	bat_6 = icon("masks", {"anubis", "character_pack_clover"}),								--In The Diamond job, complete the heist, diamond puzzle and steal the Diamond after the alarm has been triggered on the OVERKILL difficulty or above. --Anubis
	gorilla_1 = icon("masks", {"champion_dallas", "pd2_hw_boxing"}),								--Knock out a Bulldozer using the OVERKILL boxing gloves. --The Champ
	cow_3 = icon("masks", {"butcher", "the_bomb"}),						--In The Bomb: Forest job, cut down all trees within 5 seconds. --Butcher From Hell
	cow_4 = icon("masks", {"tech_lion", "the_bomb"}),					--In The Bomb: Forest job, do not let the cops disconnect the water hose while you are using the river water pump. --Tech Lion
	cow_5 = icon("masks", {"doctor", "the_bomb"}),						--Complete The Bomb: Forest job without letting any civilian flee or die, having at least five civilians in the heist, while escaping with the boat. --The Doctor
	cow_8 = icon("masks", {"lady_butcher", "the_bomb"}),					--Complete The Bomb: Dockyard job in stealth on the Death Wish difficulty. --Lady Butcher
	ameno_3 = icon("masks", {"carnotaurus", "dlc_akm4"}),				--In the Mallcrasher job, loot $1,800,000 in loose cash within 50 seconds of starting the heist. The heist must be played on the OVERKILL difficulty. --Alfred
	ameno_4 = icon("masks", {"triceratops", "dlc_akm4"}),				--In the Firestarter job, complete the heist on the OVERKILL difficulty or above, with all days done in loud and with a crew of 4 players using unmodified "AK Rifle" rifles and "PARA" submachine guns. --Timothy
	ameno_6 = icon("masks", {"pachy", "dlc_akm4"}),						--In the Art Gallery job, complete the heist in stealth within 4 minutes with each crew member wearing the Improved Combined Tactical Vest and no Armor Bag deployable equipped. --Pachy
	ameno_7 = icon("masks", {"velociraptor", "dlc_akm4"}),				--In the Jewelry store job, don't let the cops enter the jewelry store until the van comes back on the OVERKILL difficulty or above. --Vincent
	grill_1 = icon("masks", {"firedemon", "bbq"}),				--Have 10 enemies burning simultaneously. --Graug
	grill_2 = icon("masks", {"gasmask", "bbq"}),				--Set an enemy on fire and kill him with the "Motherforker" melee weapon. --The Gas Mask
	grill_3 = icon("masks", {"firemask", "bbq"}),				--Kill 10 enemies within 10 seconds using the Piglet Grenade Launcher without using Incendiary rounds. --Firefighter's Helmet
	grill_4 = icon("masks", {"chef_hat", "bbq"}),				--Set a Bulldozer on fire for at least 10 seconds. --The Chef
	scorpion_1 = icon("masks", {"bullskull", "west"}),			--Pick up 100 arrows.  --Bull mask from western Pack
	scorpion_2 = icon("masks", {"bandit", "west"}),			--Kill 3 enemies at the same time with the Dynamite. --outlaw mask from western Pack
	scorpion_3 = icon("masks", {"lone", "west"}),			--Get 10 or more arrows stuck in a Bulldozer at the same time. -- zorro mask western pack
	scorpion_4 = icon("masks", {"kangee", "west"}),			--Kill 6 law enforcers within 6 seconds of killing the first while hipfiring with the Peacemaker .45 Revolver. --indian tribe mask western pack
	melt_3 = icon("masks", {"grendel"}),								--In the Meltdown job, secure all additional loot. --Rad Mutant
	live_2 = icon("masks", {"boombox", "dlc_arena"}),				--Complete The Alesso Heist without your crew killing anyone. --Boombox
	live_3 = icon("masks", {"cantus", "dlc_arena"}),				--In The Alesso Heist, get your seven bucks back. --Cantus
	live_4 = icon("masks", {"concert_female", "dlc_arena"}),				--In The Alesso Heist, complete the heist in loud without using the zip-line or bag chutes on the OVERKILL difficulty or above. --Female Concert Goer
	live_5 = icon("masks", {"concert_male", "dlc_arena"}),				--In The Alesso Heist, complete the pyrosequences without failing even once. --Male Concert Goer
	kenaz_2 = icon("masks", {"croupier_hat", "kenaz"}),				--Complete the Golden Grin Casino job in stealth. --Wheeler Dealer
	kenaz_3 = icon("masks", {"gladiator_helmet", "kenaz"}),				--Complete the Golden Grin Casino job without having the Big Fucking Drill ever break in loud. --Murmillo Galea Helmet
	kenaz_4 = icon("masks", {"the_king_mask", "kenaz"}),				--Complete the Golden Grin Casino job under 14 minutes. --The King
	kenaz_5 = icon("masks", {"sports_utility_mask", "kenaz"}),				--In the Golden Grin Casino job, kill "The King" and complete the heist in stealth. --Sports Utility Mask
	turtles_1 = icon("masks", {"slicer", "turtles"}),				--Get eleven kills with the Lebensauger .308 Sniper Rifle without reloading it. --Slicer
	turtles_2 = icon("masks", {"kage", "turtles"}),				--Kill 100 enemies in a single day of a heist with the Kross Vertex Submachine Gun. --Kage
	turtles_3 = icon("masks", {"ninja_hood", "turtles"}),				--Complete a single day of a heist in stealth using only the Shuriken throwable and killing at least 4 enemies. --Kuro Zukin
	turtles_4 = icon("masks", {"shirai", "turtles"}),				--Have at least 3 enemies poisoned at the same time with your poisoned weapons. --Shirai
	steel_1 = icon("masks", {"agatha_knight", "steel"}),				--Complete any heist on the OVERKILL difficulty or above with 4 players using only Gage Chivalry Pack masks, primary weapons, melee weapons and Ballistic Vests or heavier armors. --Agatha Knight Veteran
	steel_2 = icon("masks", {"agatha_vanguard_veteran", "steel"}),				--Kill 10 shields with a Gage Chivalry Pack melee weapon in a single heist. --Agatha Vanguard Veteran
	steel_3 = icon("masks", {"mason_knight_veteran", "steel"}),				--Kill a Cloaker with the Javelin throwable. --Mason Knight Veteran
	steel_4 = icon("masks", {"mason_vanguard_veteran", "steel"}),				--Kill a black Bulldozer with the Great Sword melee weapon. --Mason Vanguard Veteran
	lab_1 = icon("masks", {"invader", "nails"}),								--In the Lab Rats job, secure a bag in the secret area. --Invader
	lab_2 = icon("masks", {"satan", "nails"}),								--In the Lab Rats job, complete the Cloaker event on the OVERKILL difficulty or above. --Satan
	berry_2 = icon("masks", {"water_spirit", "berry"}),								--In the Beneath the Mountain job, secure all of the loot from the vaults and mountain-top in the escape helicopter. --Tawhiri
	berry_5 = icon("masks", {"tane", "berry"}),								--Kill 10 enemies in a row by shooting them in the head with the Platypus 70 Sniper Rifle while not aiming down the sights. --Tane
	jerry_3 = icon("masks", {"oro", "berry"}),								--In the Birth of Sky job, release the money without having any player take health damage on the OVERKILL difficulty or above. --Oro
	jerry_4 = icon("masks", {"maui", "berry"}),								--In the Birth of Sky job, have the entire crew jump out of the airplane within 1 minute and 23 seconds on the OVERKILL difficulty or above. --Maui
	cane_3 = icon("masks", {"rudeolph"}),								--Complete the Santa's Workshop job after having secured at least 100 bags in the chimney on the OVERKILL difficulty or above. --Rudolph
	cane_4 = icon("masks", {"greedy_the_elf"}),								--Complete the Santa's Workshop job having all players in the crew only use shotguns. --Christmas Cap
	peta_2 = icon("masks", {"tall_goat", "peta"}),								--In the first day of the Goat Simulator job, secure 6 goats in the escape truck within 1 minute of it arriving. --Scout Goat
	peta_3 = icon("masks", {"goat_goat", "peta"}),								--Complete day 2 of the Goat Simulator job within 4 minutes from when the escape car is available. --Goat Goat
	peta_4 = icon("masks", {"wet_goat", "peta"}),								--In the Goat Simulator job, throw a goat in the air, kill one enemy and catch the goat before it lands. --Wet Goat
	peta_5 = icon("masks", {"fancy_goat", "peta"}),								--In day 2 of the Goat Simulator job, send all goats in separate cages on the OVERKILL difficulty or above. --Slick Goat
	pal_2 = icon("masks", {"horned_king", "lupus"}),								--On the Counterfeit job, print and secure $1,000,000 worth of counterfeit money in the Helicopter. --Viking
	pal_3 = icon("masks", {"viking", "lupus"}),								--On the Counterfeit job, disarm the C4 on the OVERKILL difficulty or above. --Dragon Head
	man_3 = icon("masks", {"nutcracker", "lupus"}),								--Complete the Undercover job without killing any Snipers. --Hans
	man_4 = icon("masks", {"divided", "lupus"}),								--On the Undercover job, place 10 planks on windows, vents or fences. --Trickster Demon
	dark_2 = icon("masks", {"mad_goggles", "mad"}),								--Complete the Murky Station job within 7 minutes of starting it. --Cloaker-san
	dark_3 = icon("masks", {"half_mask", "mad"}),								--Complete the Murky Station job without anyone in the crew killing anyone. --Augmentation
	mad_2 = icon("masks", {"mad_mask", "mad"}),								--In the Boiling Point job, have no crew members get downed on the OVERKILL difficulty or above. --Zero 68
	mad_3 = icon("masks", {"visor", "mad"}),								--Complete the Boiling Point job having everyone only using melee weapons without electricity or poison to kill enemies on the Very Hard difficulty or above. --Safety First
	born_3 = icon("masks", {"born_biker_01", "born"}),								--In the first day of The Biker Heist, let Mike the mechanic complete the bike without any interruptions on the OVERKILL difficulty or above. --The Classic
	born_4 = icon("masks", {"born_biker_03", "born"}),								--In the first day of The Biker Heist, find the secret item. --Rivertown Glen icon
	born_5 = icon("masks", {"born_biker_02", "born"}),								--Complete day 2 of The Biker Heist within 120 seconds on the OVERKILL difficulty or above. --Speed Devil
	born_6 = icon("masks", {"brutal", "born"}),								--On day 2 of The Biker Heist, destroy the helicopter turret. --Road Rage
	pim_1 = icon("masks", {"pim_mustang", "pim"}),								--Kill 30 snipers with any Sniper Rifle on the OVERKILL difficulty or above. --Mustang
	pim_2 = icon("masks", {"pim_hotelier", "pim"}),								--Kill 8 guards with a Throwing Weapon while crouching on the Murky Station job. The heist must be completed for any kills to count. --Hotelier
	pim_3 = icon("masks", {"pim_russian_ballistic", "pim"}),								--Kill 45 Russian specials on the Boiling Point job with any Submachine Gun on the OVERKILL difficulty or above. --Zaschita
	pim_4 = icon("masks", {"pim_dog", "pim"}),								--Complete the Firestarter job on the OVERKILL difficulty or above with your crew using only Pistols. --Daisy
	orange_4 = icon("masks", {"hwl_wolf_zombie", "howl"}),								--On the Prison Nightmare job, get on the train in less than 4 min and 44 sec on the Mayhem difficulty or above. You have to have played the heist from the start. --Risen Wolf
	orange_5 = icon("masks", {"howl_chains_zombie", "howl"}),								--Complete the Prison Nightmare job, getting at least 15 keycards on the Mayhem difficulty or above without any player ever going into custody. --Risen Chains
	orange_6 = icon("masks", {"hwl_hoxton_zombie", "howl"}),								--Complete the Prison Nightmare job on the Hard difficulty or above by having 1 player playing as Hoxton, all having Nova's Shank melee weapon equipped, and are only allowed to kill enemies using Nova's Shank. --Risen Houston
	moon_4 = icon("masks", {"moon_paycheck_dallas", "moon"}),								--On the Stealing Xmas job, find and take both "Paycheck" masks. --Paycheck Dallas
	friend_4 = icon("masks", {"sfm_04", "friend"}),								--On the Scarface Mansion job, kill the boss on the OVERKILL difficulty and above. --Panthera Tigris
	friend_5 = icon("masks", {"sfm_01", "friend"}),								--On the Scarface Mansion job, find and shoot the two pink flamingos. --Exalted
	friend_6 = icon("masks", {"sfm_03", "friend"}),								--Complete the Scarface Mansion job in stealth in 13 minutes or less on the Mayhem difficulty or above. --Barrori Flex
	spa_5 = icon("masks", {"spa_04", "spa"}),								--On the Brooklyn 10-10 job, reach Charon within 6 minutes on the OVERKILL difficulty or above. --Lady Liberty
	spa_6 = icon("masks", {"spa_03", "spa"}),								--Complete the Brooklyn 10-10 job from start, after deploying 8 ammo bags in the ammo cage on the OVERKILL difficulty or above. --Birds of Prey
	fish_5 = icon("masks", {"spa_02", "spa"}),								--Complete The Yacht Heist without killing anyone. --Sailor
	fish_6 = icon("masks", {"spa_01", "spa"}),								--Complete The Yacht Heist after having killed every security guard on the boat. --Captain
	grv_1 = icon("masks", {"grv_04", "grv"}),								--Complete any heist using only weapons from the Gage Russian Weapon Pack on the OVERKILL difficulty or above. --Red Machine
	grv_2 = icon("masks", {"grv_01", "grv"}),								--Kill 32 enemies without reloading with the Tatonka Submachine Gun. --War Balaclava
	grv_3 = icon("masks", {"grv_03", "grv"}),								--Kill 300 enemies using any weapons from the Gage Russian Weapon Pack. --Kokoshnik
	grv_4 = icon("masks", {"grv_02", "grv"}),								--Complete any heist in stealth using only weapons from the Gage Russian Weapon Pack. --Matryoshka
	eng_1 = icon("masks", {"eng_01", "eng"}),								--In the Bank Heist or the Jewelry Store Jobs, find and pick up the hidden Bullet Trophy five times. --The Bullet
	eng_2 = icon("masks", {"eng_02", "eng"}),								--In the Shadow Raid or the First World Bank Jobs, find and pick up the hidden Robot Trophy five times. --The Robot
	eng_3 = icon("masks", {"eng_03", "eng"}),								--In the GO Bank or the Four Stores Jobs, find and pick up the hidden Marine Trophy five times. --The Marine
	eng_4 = icon("masks", {"eng_04", "eng"}),								--On the Diamond Store job or on day 1 of the Hoxton Breakout job, find and pick up the hidden Cultist Trophy five times. --The Cultist
	ameno_1 = icon("masks", {"character_locked"}),
	bat_5 = icon("masks", {"character_locked"}),
	bigbank_10 = icon("masks", {"character_locked"}),
	bob_10 = icon("masks", {"character_locked"}),
	charliesierra_9 = icon("masks", {"character_locked"}),
	eagle_3 = icon("masks", {"character_locked"}),
	gage4_12 = icon("masks", {"character_locked"}),
	gage5_6 = icon("masks", {"character_locked"}),
	green_2 = icon("masks", {"character_locked"}),
	mad_4 = icon("masks", {"character_locked"}),
	ovk_1 = icon("masks", {"character_locked"}),
	ovk_5 = icon("masks", {"character_locked"}),
	ovk_7 = icon("masks", {"character_locked"}),
	pig_5 = icon("masks", {"character_locked"}),
	slakt_5 = icon("masks", {"character_locked"}),
	
	
	-- weapons, mods and melee icons
	how_do_you_like_me_now = icon("armors", {"level_2"}),								--Equip an armor for the first time. --ballistic vest
	
	armed_to_the_teeth = icon("weapons", {"amcar"}),						--Buy a weapon for the first time. --some custom weapon icon
	fully_loaded = icon("weapons", {"ak74"}),								--Own 9 weapons. --some custom weapon icon
	weapon_collector = icon("weapons", {"m16"}),							--Own 18 weapons. --some custom weapon icon
	gage_5 = icon("weapons", {"scar", "gage_pack"}),								--Kill 100 enemies using only the Eagle Heavy rifle.
	gage_6 = icon("weapons", {"mp7", "gage_pack"}),								--Kill 100 enemies using only the SpecOps submachine gun.
	gage_7 = icon("weapons", {"p226", "gage_pack"}),								--Kill 100 enemies using only the Signature .40 pistol.
	gage_8 = icon("weapons", {"new_m14"}),									--Fill up 72 weapon slots. --some custom weapon icon
	gage2_7 = icon("weapons", {"deagle"}),								--Kill a charging Cloaker using the Deagle pistol. --deagle
	gage3_1 = icon("weapons", {"akm_gold"}),								--Equip the Golden AK.762 rifle.
	gage3_2 = icon("weapons", {"akm_gold"}),								--Kill 6 Skulldozers using only the golden AK.762 rifle.
	gage5_4 = icon("weapons", {"famas", "gage_pack_assault"}),				--Own one of every Gage Assault Pack weapon in the game.
	gage5_5 = icon("weapons", {"gre_m79", "gage_pack_assault"}),			--Kill 25 enemies at 40 meters or more using only the GL40 grenade launcher.
	gage5_7 = icon("weapons", {"gre_m79", "gage_pack_assault"}),			--Kill a jumping Cloaker using the GL40 grenade launcher.
	tango_achieve_2 = icon("weapons", {"arbiter", "tng"}),					--Kill 50 Snipers with the Arbiter Grenade Launcher while using the standard ammo type.
	bob_1 = icon("weapons", {"g22c"}),								--Equip the Chimano Custom pistol. 
	halloween_8 = icon("weapons", {"usp"}),								--Kill 666 enemies using only the Interceptor 45 pistol. --smaller icon
	halloween_9 = icon("weapons", {"usp"}),								--Equip the Interceptor 45 pistol. Celebrating Halloween.
	ovk_3 = icon("weapons", {"m134", "dlc_pack_overkill"}),				--Fire the Vulcan Minigun for 25 seconds without reloading or letting go of the trigger.
	man_5 = icon("weapons", {"m32", "bbq"}),								--Complete the Undercover job on the OVERKILL difficulty or above, using only a grenade launcher or rocket launcher. --GL40 
	ameno_8 = icon("weapons", {"akmsu"}),								--Kill 100 cops using only weapons from the AK or CAR weapon families. --car\ak mods
	armored_5 = icon("weapons", {"ppk", "dlc1"}),							--Kill 378 enemies using the Gruber Kurz handgun.
	
	gage2_2 = icon("melee_weapons", {"gerber", "gage_pack_lmg"}),								--Kill a Cloaker with a knife.
	gage2_3 = icon("melee_weapons", {"fists"}),								--On the Nightclub job, kill 50 law enforcers using your fists.
	gage2_10 = icon("melee_weapons", {"kampfmesser", "gage_pack_lmg"}),								--Kill a Bulldozer in a knife fight.
	gage5_8 = icon("melee_weapons", {"dingdong", "gage_pack_assault"}),		--Kill 25 thugs using the Ding Dong breaching tool melee weapon.
	gage4_1 = icon("melee_weapons", {"baton", "gage_pack_shotgun"}),								--Beat a Shield to death using the Telescopic Baton.
	gage4_7 = icon("melee_weapons", {"shovel", "gage_pack_shotgun"}),								--On the Nightclub job, kill 25 law enforcers using your shovel.
	bulldog_4 = icon("melee_weapons", {"toothbrush"}),						--Hurt an enemy using the Nova's Shank melee weapon.
	death_31 = icon("melee_weapons", {"brass_knuckles"}),					--Equip the 350K brass knuckles. Celebrating the release of the Death Wish update.
	sinus_1 = icon("melee_weapons", {"rambo", "gage_pack_lmg"}),								--I may be homeless, but at least I have a sick knife. 
	
	gage3_7 = icon("mods", {"wpn_fps_snp_m95_barrel_long", "gage_pack_snp"}),				--Kill 25 enemies from 40 meters using only the Thanatos .50 cal sniper rifle.
	gage3_10 = icon("mods", {"wpn_fps_snp_r93_b_short", "gage_pack_snp"}),					--Kill 10 Shields by shooting through their shields using only the R93 sniper rifle.
	gage3_11 = icon("mods", {"wpn_fps_snp_m95_barrel_suppressed", "gage_pack_snp"}),		--Perform 10 headshot kills on Cloakers using only the Thanatos .50 cal sniper rifle.
	gage3_12 = icon("mods", {"wpn_fps_snp_m95_barrel_short", "gage_pack_snp"}),				--Kill 10 Bulldozers using only the Thanatos .50 cal sniper rifle.
	gage3_15 = icon("mods", {"wpn_fps_snp_r93_body_wood", "gage_pack_snp"}),				--Kill 25 enemies shooting through walls or objects using only the R93 sniper rifle.
	gage3_16 = icon("mods", {"wpn_fps_snp_msr_ns_suppressor", "gage_pack_snp"}),			--Kill 2 enemies with one bullet 25 times using only the Rattlesnake sniper rifle.
	gage3_17 = icon("mods", {"wpn_fps_snp_msr_b_long", "gage_pack_snp"}),					--Kill 250 enemies using only the Rattlesnake sniper rifle.
	gage4_6 = icon("mods", {"wpn_fps_upg_a_slug", "gage_pack_shotgun"}),					--Kill 50 Shields using any shotgun and slug ammo.
	gage4_9 = icon("mods", {"wpn_fps_upg_a_explosive", "gage_pack_shotgun"}),				--Hit 4 enemies simultaneously using any shotgun and HE rounds.
	gage5_9 = icon("mods", {"wpn_fps_ass_galil_fg_fab", "gage_pack_assault"}),				--Kill 10 Cloakers using the Gecko 7.62 rifle.
	tango_achieve_1 = icon("mods", {"wpn_fps_upg_ns_duck", "tng"}),		--Get 3 headshot kills with 1 shot from any Shotgun using the Donald's Horizontal Leveller barrel ext.

	gage_9 = tweak_data.blackmarket.projectiles and icon("grenades", {"frag"}) or {"guis/textures/pd2/equipment", {64, 32, 32, 32}},				--Throw 100 grenades. --smaller Fra grenade icon
	gage_10 = {"guis/dlcs/gage_pack/textures/pd2/mission_briefing/assets/grenade_crate", {0, 0, 1024, 1024}},  --Buy the grenade case asset 100 times.
}