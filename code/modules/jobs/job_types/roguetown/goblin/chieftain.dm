
/datum/job/roguetown/chieftain
	title = "Chieftain"
	f_title = "Chieftress"
	flag = CHIEFTAIN
	department_flag = TRIBAL
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "Tribal King or Queen is a fatty lazy pig who wishes to do nothing but eat apple pies and fart while sitting on his stone throne."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/chieftain

	display_order = JDO_CHIEFTAIN
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/chieftain/pre_equip(mob/living/carbon/human/H)
	..()
	//H.verbs |= /mob/living/carbon/human/proc/goblinannouncement
	//H.verbs |= /mob/living/carbon/human/proc/goblinopenslot
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel/special
	shirt = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
	head = /obj/item/clothing/head/roguetown/crown/surplus
	cloak = /obj/item/clothing/cloak/heartfelt
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 6)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -2)


//mob/living/carbon/human/proc/goblinannouncement()
	//set name = "Announcement"
	//set category = "Goblin King"
	//if(stat)
		//return
	//var/inputty = input("Make an announcement", "ROGUETOWN") as text|null
	//if(inputty)
		//if(!istype(get_area(src), /area/rogue/indoors/shelter/mountains/decap))
			//to_chat(src, span_warning("I need to do this from the Goblin Kingdom."))
			//return FALSE
		//priority_announce("[inputty]", title = "The Goblin King Squeals", sound = 'sound/misc/dun.ogg')
/*
/mob/living/carbon/human/proc/goblinopenslot()
	set name = "Open Slot"
	set category = "Goblin King"
	if(stat)
		return
	var/datum/job/cookjob = SSjob.GetJob("Goblin Cook")
	var/datum/job/guardjob = SSjob.GetJob("Goblin Guard")
	var/datum/job/smithjob = SSjob.GetJob("Goblin Smith")
	var/list/souloptions = list("Goblin Cook", "Goblin Guard", "Goblin Smith")
	var/pickedsoul = input("Which worker shall join kingdom?", "Available workers") as null|anything in souloptions
	if(!istype(get_area(src), /area/rogue/indoors/shelter/mountains/decap))
		to_chat(src, span_warning("I need to do this from the Goblin Kingdom."))
		return FALSE
	if(!pickedsoul)
		return
	switch(pickedsoul)
		if("Goblin Cook")
			cookjob.total_positions += 1
			priority_announce("Goblin Cook shall join our Kingdom", title = "The Goblin King Hires", sound = 'sound/misc/dun.ogg')
		if("Goblin Guard")
			guardjob.total_positions += 1
			priority_announce("Goblin Guard shall join our Kingdom", title = "The Goblin King Hires", sound = 'sound/misc/dun.ogg')
		if("Goblin Smith")
			smithjob.total_positions += 1
			priority_announce("Goblin Smith shall join our Kingdom", title = "The Goblin King Hires", sound = 'sound/misc/dun.ogg')
*/

