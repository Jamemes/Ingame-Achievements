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
	lets_do_this = icon("skilltree", {4, 3}),				
	bigbank_4 = icon("skilltree", {4, 3}),					
	farm_4 = icon("skilltree", {4, 3}),						
	frappucino_to_go_please = icon("skilltree", {4, 3}),	
	short_fuse = icon("skilltree", {4, 3}),					
	berry_3 = icon("skilltree", {4, 3}),					

	-- chameleon
	frog_1 = icon("skilltree", {5, 3}),					
	flake_1 = icon("skilltree", {5, 3}),					
	ovk_4 = icon("skilltree", {5, 3}),						
	jerry_5 = icon("skilltree", {5, 3}),					
	ovk_8 = icon("skilltree", {5, 3}),						
	spa_4 = icon("skilltree", {5, 3}),						

	-- money
	tip_the_scales = icon("skilltree", {0, 6}),				
	spend_money_to_make_money = icon("skilltree", {0, 6}),	
	no_turning_back = icon("skilltree", {0, 6}),			
	going_places = icon("skilltree", {0, 6}),				
	voff_4 = icon("skilltree", {0, 6}),						

	-- sentry_tower_defense
	halloween_1 = icon("skilltree", {7, 6}),				
	halloween_3 = icon("skilltree", {7, 6}),				
	king_of_the_hill = icon("skilltree", {7, 6}),			
	cane_2 = icon("skilltree", {7, 6}),						
	pal_4 = icon("skilltree", {7, 6}),						

	-- cable_guy
	ameno_2 = icon("skilltree", {4, 7}),					
	glace_10 = icon("skilltree", {4, 7}),					
	pal_5 = icon("skilltree", {4, 7}),						
	slakt_4 = icon("skilltree", {4, 7}),					

	-- underdog
	armored_6 = icon("skilltree", {2, 1}),					
	bullet_dodger = icon("skilltree", {2, 1}),				
	farm_1 = icon("skilltree", {2, 1}),						
	farm_3 = icon("skilltree", {2, 1}),						

	-- nerves_of_steel
	brooklyn_3 = icon("skilltree", {6, 6}),					
	farm_2 = icon("skilltree", {6, 6}),						
	run_9 = icon("skilltree", {6, 6}),						
	slakt_3 = icon("skilltree", {6, 6}),					

	-- stockholm_syndrome
	charliesierra_6 = icon("skilltree", {3, 8}),		
	voff_3 = icon("skilltree", {3, 8}),					
	run_10 = icon("skilltree", {3, 8}),					

	-- cat_burglar
	f_in_chemistry = icon("skilltree", {0, 4}),			
	jerry_2 = icon("skilltree", {0, 4}),				
	window_cleaner = icon("skilltree", {0, 4}),			

	-- martial_arts
	cow_10 = icon("skilltree", {1, 3}),					
	gage4_3 = icon("skilltree", {1, 3}),				
	gage2_9 = icon("skilltree", {1, 3}),				

	-- sharpshooter
	flat_5 = icon("skilltree", {6, 5}),					
	tango_achieve_4 = icon("skilltree", {6, 5}),		
	tango_achieve_3 = icon("skilltree", {6, 5}),		

	-- control_freak
	green_1 = icon("skilltree", {6, 7}),				
	moon_6 = icon("skilltree", {6, 7}),					
	voff_1 = icon("skilltree", {6, 7}),					

	-- lucky_charm
	the_wire = icon("skilltree", {5, 2}),				
	yeah_hes_a_gold_digger = icon("skilltree", {5, 2}),	
	fort_3 = icon("skilltree", {5, 2}),					

	-- moving_target
	you_shall_not_pass = icon("skilltree", {2, 4}),		
	glace_9 = icon("skilltree", {2, 4}),						


	-- cleaner
	charliesierra_8 = icon("skilltree", {7, 2}),				
	dark_5 = icon("skilltree", {7, 2}),							

	-- fast_learner
	doctor_fantastic = icon("skilltree", {7, 8}),				
	im_a_healer_tank_damage_dealer = icon("skilltree", {7, 8}),	

	-- bullet_storm
	gage2_4 = icon("skilltree", {4, 5}),						
	gage2_5 = icon("skilltree", {4, 5}),						

	-- hard_boiled
	gage2_6 = icon("skilltree", {4, 1}),						
	gage4_5 = icon("skilltree", {4, 1}),						

	-- die_hard
	gage3_13 = icon("skilltree", {1, 2}),						
	gage3_8 = icon("skilltree", {1, 2}),						

	-- oppressor
	gage3_14 = icon("skilltree", {4, 0}),						
	gage3_9 = icon("skilltree", {4, 0}),						
	
	-- tough_guy
	gage5_3 = icon("skilltree", {1, 1}),						
	man_2 = icon("skilltree", {1, 1}),							

	charliesierra_7 = icon("skilltree", {4, 4}), 				
	armored_1 = icon("skilltree", {7, 1}),						
	berry_4 = icon("skilltree", {4, 9}),						
	bigbank_8 = icon("skilltree", {4, 8}),						
	bob_5 = icon("skilltree", {6, 2}),							
	bob_6 = icon("skilltree", {1, 4}),							
	dark_4 = icon("skilltree", {3, 9}),							
	fort_2 = icon("skilltree", {5, 4}),							
	gage2_8 = icon("skilltree", {5, 7}),						
	gage4_2 = icon("skilltree", {5, 0}),						
	glace_8 = icon("skilltree", {2, 7}),						
	green_6 = icon("skilltree", {3, 6}),						
	i_knew_what_i_was_doing_was_wrong = icon("skilltree", {0, 1}),	
	iron_man = icon("skilltree", {3, 1}),							
	mad_5 = icon("skilltree", {6, 4}),								
	ovk_9 = icon("skilltree", {6, 8}),								
	slakt_2 = {"guis/textures/pd2/specialization/icons_atlas", {64, 64 * 4, 64, 64}},	

	cee_1 = {"fonts/font_large_csicons", {0, 5, 42, 42}},								
	cee_2 = {"fonts/font_large_csicons", {0, 5, 42, 42}},	
	cee_3 = {"fonts/font_large_csicons", {0, 5, 42, 42}},	

	gmod_1 = icon("green_mantis"),							
	gmod_2 = icon("yellow_bull"),							
	gmod_3 = icon("red_spider"),							
	gmod_4 = icon("blue_eagle"),							
	gmod_5 = icon("purple_snake"),							
	gmod_6 = icon("gage_packs"),							
	
	-- Masks icons
	death_27 = icon("masks", {"skullhard"}),				
	death_28 = icon("masks", {"skullveryhard"}),			
	death_29 = icon("masks", {"skulloverkill"}),			
	pick_66 = icon("masks", {"gitgud_e_wish", "gitgud"}),	
	death_30 = icon("masks", {"skulloverkillplus"}),		
	axe_66 = icon("masks", {"gitgud_sm_wish", "gitgud"}),	
	halloween_nightmare_1 = icon("masks", {"baby_happy"}),	
	halloween_nightmare_2 = icon("masks", {"brazil_baby"}),	
	halloween_nightmare_3 = icon("masks", {"baby_angry"}),	
	halloween_nightmare_4 = icon("masks", {"baby_cry"}),	
	like_an_angry_bear = icon("masks", {"bear"}),			
	halloween_10 = icon("masks", {"bear"}),					
	armored_4 = icon("masks", {"heat"}),					
	armored_11 = icon("masks", {"heat"}),					
	armored_10 = icon("masks", {"obama", "dlc1"}),			
	armored_7 = icon("masks", {"nixon", "dlc1"}),			
	armored_8 = icon("masks", {"clinton", "dlc1"}),			
	armored_9 = icon("masks", {"bush", "dlc1"}),			
	gage_1 = icon("masks", {"goat", "gage_pack"}),			
	gage_2 = icon("masks", {"panda", "gage_pack"}),			
	gage_3 = icon("masks", {"pitbull", "gage_pack"}),		
	gage_4 = icon("masks", {"eagle", "gage_pack"}),			
	halloween_4 = icon("masks", {"witch"}),					
	halloween_5 = icon("masks", {"frank"}),					
	halloween_6 = icon("masks", {"pumpkin_king"}),			
	halloween_7 = icon("masks", {"venomorph"}),				
	charliesierra_3 = icon("masks", {"santa_happy"}),		
	no_one_cared_who_i_was = icon("masks", {"dallas"}),					
	payback_3 = icon("masks", {"hectors_helmet", "hoxton_revenge"}),		
	kosugi_4 = icon("masks", {"samurai"}),									
	gage3_3 = icon("masks", {"robberfly", "gage_pack_snp"}),				
	gage3_4 = icon("masks", {"spider", "gage_pack_snp"}),					
	gage3_5 = icon("masks", {"wasp", "gage_pack_snp"}),						
	gage3_6 = icon("masks", {"mantis", "gage_pack_snp"}),					
	bigbank_6 = icon("masks", {"grant", "big_bank"}),						
	bigbank_1 = icon("masks", {"franklin", "big_bank"}),					
	bigbank_2 = icon("masks", {"washington", "big_bank"}),					
	bigbank_3 = icon("masks", {"lincoln", "big_bank"}),						
	gage4_8 = icon("masks", {"skullmonkey", "gage_pack_shotgun"}),			
	gage4_4 = icon("masks", {"mandril", "gage_pack_shotgun"}),				
	gage4_10 = icon("masks", {"silverback", "gage_pack_shotgun"}),			
	gage4_11 = icon("masks", {"orangutang", "gage_pack_shotgun"}),			
	gage5_1 = icon("masks", {"evil", "gage_pack_assault"}),					
	gage5_2 = icon("masks", {"crowgoblin", "gage_pack_assault"}),			
	gage5_9 = icon("masks", {"volt", "gage_pack_assault"}),					
	gage5_10 = icon("masks", {"galax", "gage_pack_assault"}),				
	bulldog_1 = icon("masks", {"old_hoxton"}),								
	pig_3 = icon("masks", {"white_wolf", "hl_miami"}),						
	pig_4 = icon("masks", {"rabbit", "hl_miami"}),							
	pig_7 = icon("masks", {"pig", "hl_miami"}),								
	pig_2 = icon("masks", {"owl", "hl_miami"}),								
	eagle_1 = icon("masks", {"de_gaulle", "gage_pack_historical"}),			
	eagle_2 = icon("masks", {"red_hurricane", "gage_pack_historical"}),		
	eagle_4 = icon("masks", {"churchill", "gage_pack_historical"}),			
	eagle_5 = icon("masks", {"patton", "gage_pack_historical"}),			
	deer_1 = icon("masks", {"mrs_claus", "pines"}),							
	deer_2 = icon("masks", {"strinch", "pines"}),							
	deer_3 = icon("masks", {"krampus", "pines"}),							
	deer_4 = icon("masks", {"robo_santa", "pines"}),						
	deer_6 = icon("masks", {"almirs_beard", "pines"}),						
	bat_2 = icon("masks", {"cursed_crown", "character_pack_clover"}),		
	bat_3 = icon("masks", {"medusa", "character_pack_clover"}),				
	bat_4 = icon("masks", {"pazuzu", "character_pack_clover"}),				
	bat_6 = icon("masks", {"anubis", "character_pack_clover"}),				
	gorilla_1 = icon("masks", {"champion_dallas", "pd2_hw_boxing"}),		
	cow_3 = icon("masks", {"butcher", "the_bomb"}),							
	cow_4 = icon("masks", {"tech_lion", "the_bomb"}),						
	cow_5 = icon("masks", {"doctor", "the_bomb"}),							
	cow_8 = icon("masks", {"lady_butcher", "the_bomb"}),					
	ameno_3 = icon("masks", {"carnotaurus", "dlc_akm4"}),					
	ameno_4 = icon("masks", {"triceratops", "dlc_akm4"}),					
	ameno_6 = icon("masks", {"pachy", "dlc_akm4"}),							
	ameno_7 = icon("masks", {"velociraptor", "dlc_akm4"}),					
	grill_1 = icon("masks", {"firedemon", "bbq"}),							
	grill_2 = icon("masks", {"gasmask", "bbq"}),							
	grill_3 = icon("masks", {"firemask", "bbq"}),							
	grill_4 = icon("masks", {"chef_hat", "bbq"}),							
	scorpion_1 = icon("masks", {"bullskull", "west"}),						
	scorpion_2 = icon("masks", {"bandit", "west"}),							
	scorpion_3 = icon("masks", {"lone", "west"}),							
	scorpion_4 = icon("masks", {"kangee", "west"}),							
	melt_3 = icon("masks", {"grendel"}),									
	live_2 = icon("masks", {"boombox", "dlc_arena"}),						
	live_3 = icon("masks", {"cantus", "dlc_arena"}),						
	live_4 = icon("masks", {"concert_female", "dlc_arena"}),				
	live_5 = icon("masks", {"concert_male", "dlc_arena"}),					
	kenaz_2 = icon("masks", {"croupier_hat", "kenaz"}),						
	kenaz_3 = icon("masks", {"gladiator_helmet", "kenaz"}),					
	kenaz_4 = icon("masks", {"the_king_mask", "kenaz"}),					
	kenaz_5 = icon("masks", {"sports_utility_mask", "kenaz"}),				
	turtles_1 = icon("masks", {"slicer", "turtles"}),						
	turtles_2 = icon("masks", {"kage", "turtles"}),							
	turtles_3 = icon("masks", {"ninja_hood", "turtles"}),					
	turtles_4 = icon("masks", {"shirai", "turtles"}),						
	steel_1 = icon("masks", {"agatha_knight", "steel"}),					
	steel_2 = icon("masks", {"agatha_vanguard_veteran", "steel"}),			
	steel_3 = icon("masks", {"mason_knight_veteran", "steel"}),				
	steel_4 = icon("masks", {"mason_vanguard_veteran", "steel"}),			
	lab_1 = icon("masks", {"invader", "nails"}),							
	lab_2 = icon("masks", {"satan", "nails"}),								
	berry_2 = icon("masks", {"water_spirit", "berry"}),						
	berry_5 = icon("masks", {"tane", "berry"}),								
	jerry_3 = icon("masks", {"oro", "berry"}),								
	jerry_4 = icon("masks", {"maui", "berry"}),								
	cane_3 = icon("masks", {"rudeolph"}),									
	cane_4 = icon("masks", {"greedy_the_elf"}),								
	peta_2 = icon("masks", {"tall_goat", "peta"}),							
	peta_3 = icon("masks", {"goat_goat", "peta"}),							
	peta_4 = icon("masks", {"wet_goat", "peta"}),							
	peta_5 = icon("masks", {"fancy_goat", "peta"}),							
	pal_2 = icon("masks", {"horned_king", "lupus"}),						
	pal_3 = icon("masks", {"viking", "lupus"}),								
	man_3 = icon("masks", {"nutcracker", "lupus"}),							
	man_4 = icon("masks", {"divided", "lupus"}),							
	dark_2 = icon("masks", {"mad_goggles", "mad"}),							
	dark_3 = icon("masks", {"half_mask", "mad"}),							
	mad_2 = icon("masks", {"mad_mask", "mad"}),								
	mad_3 = icon("masks", {"visor", "mad"}),								
	born_3 = icon("masks", {"born_biker_01", "born"}),						
	born_4 = icon("masks", {"born_biker_03", "born"}),						
	born_5 = icon("masks", {"born_biker_02", "born"}),						
	born_6 = icon("masks", {"brutal", "born"}),								
	pim_1 = icon("masks", {"pim_mustang", "pim"}),							
	pim_2 = icon("masks", {"pim_hotelier", "pim"}),							
	pim_3 = icon("masks", {"pim_russian_ballistic", "pim"}),				
	pim_4 = icon("masks", {"pim_dog", "pim"}),								
	orange_4 = icon("masks", {"hwl_wolf_zombie", "howl"}),					
	orange_5 = icon("masks", {"howl_chains_zombie", "howl"}),				
	orange_6 = icon("masks", {"hwl_hoxton_zombie", "howl"}),				
	moon_4 = icon("masks", {"moon_paycheck_dallas", "moon"}),				
	friend_4 = icon("masks", {"sfm_04", "friend"}),							
	friend_5 = icon("masks", {"sfm_01", "friend"}),							
	friend_6 = icon("masks", {"sfm_03", "friend"}),							
	spa_5 = icon("masks", {"spa_04", "spa"}),								
	spa_6 = icon("masks", {"spa_03", "spa"}),								
	fish_5 = icon("masks", {"spa_02", "spa"}),								
	fish_6 = icon("masks", {"spa_01", "spa"}),								
	grv_1 = icon("masks", {"grv_04", "grv"}),								
	grv_2 = icon("masks", {"grv_01", "grv"}),								
	grv_3 = icon("masks", {"grv_03", "grv"}),								
	grv_4 = icon("masks", {"grv_02", "grv"}),								
	eng_1 = icon("masks", {"eng_01", "eng"}),								
	eng_2 = icon("masks", {"eng_02", "eng"}),								
	eng_3 = icon("masks", {"eng_03", "eng"}),								
	eng_4 = icon("masks", {"eng_04", "eng"}),								
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
	how_do_you_like_me_now = icon("armors", {"level_2"}),				
	armed_to_the_teeth = icon("weapons", {"amcar"}),								
	fully_loaded = icon("weapons", {"ak74"}),										
	weapon_collector = icon("weapons", {"m16"}),									
	gage_5 = icon("weapons", {"scar", "gage_pack"}),								
	gage_6 = icon("weapons", {"mp7", "gage_pack"}),									
	gage_7 = icon("weapons", {"p226", "gage_pack"}),								
	gage_8 = icon("weapons", {"new_m14"}),											
	gage2_7 = icon("weapons", {"deagle"}),											
	gage3_1 = icon("weapons", {"akm_gold"}),										
	gage3_2 = icon("weapons", {"akm_gold"}),										
	gage5_4 = icon("weapons", {"famas", "gage_pack_assault"}),						
	gage5_5 = icon("weapons", {"gre_m79", "gage_pack_assault"}),					
	gage5_7 = icon("weapons", {"gre_m79", "gage_pack_assault"}),					
	tango_achieve_2 = icon("weapons", {"arbiter", "tng"}),							
	bob_1 = icon("weapons", {"g22c"}),												
	halloween_8 = icon("weapons", {"usp"}),											
	halloween_9 = icon("weapons", {"usp"}),											
	ovk_3 = icon("weapons", {"m134", "dlc_pack_overkill"}),							
	man_5 = icon("weapons", {"m32", "bbq"}),										
	ameno_8 = icon("weapons", {"akmsu"}),											
	armored_5 = icon("weapons", {"ppk", "dlc1"}),									
	
	gage2_2 = icon("melee_weapons", {"gerber", "gage_pack_lmg"}),					
	gage2_3 = icon("melee_weapons", {"fists"}),										
	gage2_10 = icon("melee_weapons", {"kampfmesser", "gage_pack_lmg"}),				
	gage5_8 = icon("melee_weapons", {"dingdong", "gage_pack_assault"}),				
	gage4_1 = icon("melee_weapons", {"baton", "gage_pack_shotgun"}),				
	gage4_7 = icon("melee_weapons", {"shovel", "gage_pack_shotgun"}),				
	bulldog_4 = icon("melee_weapons", {"toothbrush"}),								
	death_31 = icon("melee_weapons", {"brass_knuckles"}),							
	sinus_1 = icon("melee_weapons", {"rambo", "gage_pack_lmg"}),					
	
	gage3_7 = icon("mods", {"wpn_fps_snp_m95_barrel_long", "gage_pack_snp"}),		
	gage3_10 = icon("mods", {"wpn_fps_snp_r93_b_short", "gage_pack_snp"}),			
	gage3_11 = icon("mods", {"wpn_fps_snp_m95_barrel_suppressed", "gage_pack_snp"}),
	gage3_12 = icon("mods", {"wpn_fps_snp_m95_barrel_short", "gage_pack_snp"}),		
	gage3_15 = icon("mods", {"wpn_fps_snp_r93_body_wood", "gage_pack_snp"}),		
	gage3_16 = icon("mods", {"wpn_fps_snp_msr_ns_suppressor", "gage_pack_snp"}),	
	gage3_17 = icon("mods", {"wpn_fps_snp_msr_b_long", "gage_pack_snp"}),			
	gage4_6 = icon("mods", {"wpn_fps_upg_a_slug", "gage_pack_shotgun"}),			
	gage4_9 = icon("mods", {"wpn_fps_upg_a_explosive", "gage_pack_shotgun"}),		
	gage5_9 = icon("mods", {"wpn_fps_ass_galil_fg_fab", "gage_pack_assault"}),		
	tango_achieve_1 = icon("mods", {"wpn_fps_upg_ns_duck", "tng"}),					

	gage_9 = tweak_data.blackmarket.projectiles and icon("grenades", {"frag"}) or {"guis/textures/pd2/equipment", {64, 32, 32, 32}},
	gage_10 = {"guis/dlcs/gage_pack/textures/pd2/mission_briefing/assets/grenade_crate", {0, 0, 1024, 1024}},
}