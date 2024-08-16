/datum/job/roguetown/jester
	title = "Harlequin"
	flag = JESTER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		/datum/species/elf/dark,
		/datum/species/elf/wood,
	)

	tutorial = "The Wood Elves were known for their Blade dancing Harlequins, wisemen with a tongue just as sharp and quick as their blades.. \
		You command a position of a fool, Hierophant and wild voice. \
		Your tricks and illusions are innately magickal, too. \
		Keep your with and heritage of the woods intact, and you shall surely prosper."

	allowed_ages = ALL_AGES_LIST
	spells = list(/obj/effect/proc_holder/spell/self/telljoke,/obj/effect/proc_holder/spell/self/telltragedy, /obj/effect/proc_holder/spell/targeted/ethereal_jaunt, /obj/effect/proc_holder/spell/invoked/invisibility, /obj/effect/proc_holder/spell/invoked/projectile/fetch, /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	outfit = /datum/outfit/job/roguetown/jester
	display_order = JDO_JESTER
	give_bank_account = TRUE
	min_pq = -5 //retard jesters are funny so low PQ requirement
	max_pq = null

/datum/outfit/job/roguetown/jester/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/jester
	pants = /obj/item/clothing/under/roguetown/tights
	armor = /obj/item/clothing/suit/roguetown/shirt/jester
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/keyring/servant
	beltl = /obj/item/storage/belt/rogue/pouch
	head = /obj/item/clothing/head/roguetown/jester
	neck = /obj/item/clothing/neck/roguetown/coif
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
		H.STASTR = rand(1, 20)
		H.STAINT = rand(1, 20)
		H.STALUC = rand(1, 20)
		H.cmode_music = 'sound/music/combat_jester.ogg'
	H.verbs |= /mob/living/carbon/human/proc/ventriloquate
	H.verbs |= /mob/living/carbon/human/proc/ear_trick
	ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEAPER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	if(prob(50))
		ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC) // Jester :3
	else
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Joker >:(

