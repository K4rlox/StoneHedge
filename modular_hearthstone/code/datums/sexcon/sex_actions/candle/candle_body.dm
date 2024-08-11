/datum/sex_action/candle_body
	name = "Use candle wax on their body"

/datum/sex_action/candle_body/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.bypasssexable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!get_candle_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/candle_body/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH) 
				if(!pantsies.genitalaccess) 
					return FALSE
	if(!get_candle_in_either_hand(user))
		return FALSE
	var/obj/item/candle/C = get_candle_in_either_hand(user)
	if(!C.lit)
		to_chat(usr, span_warning("I should light it first."))
		return FALSE

	return TRUE

/datum/sex_action/candle_body/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] begins to drop wax [target]'s body..."))

/datum/sex_action/candle_body/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] drops wax on [target]'s body..."))

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

	if(prob(33))
		to_chat(target, span_warning("It's hot!"))
		playsound(src, 'sound/items/firesnuff.ogg', 20)

/datum/sex_action/candle_body/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops dropping wax on [target]'s body..."))

/datum/sex_action/candle_body/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
