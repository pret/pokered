_CardKeySuccessText1::
	text "Bingo! @"
	text_end

_CardKeySuccessText2::
	text "Der"
	line "TÜRÖFFNER hat die"
	cont "Tür entriegelt!"
	done

_CardKeyFailText::
	text "Mist! Die Tür"
	line "geht nur mit dem"
	cont "TÜRÖFFNER auf!"
	done

_TrainerNameText::
	text_ram wcd6d
	text ": @"
	text_end

_NoNibbleText::
	text "Nicht einmal ein"
	line "alter Stiefel hat"
	cont "angebissen!"
	prompt

_NothingHereText::
	text "Hier findet man"
	line "nichts. Schade!"
	prompt

_ItsABiteText::
	text "Oh! Da hat etwas"
	line "angebissen!!!"
	prompt

_ExclamationText::
	text "!"
	done

_GroundRoseText::
	text "Irgendwo hat"
	line "sich der Boden"
	cont "gehoben!"
	done

_BoulderText::
	text "Du benötigst"
	line "STÄRKE, um den"
	cont "Fels zu bewegen!"
	done

_MartSignText::
	text "Wir erfüllen alle"
	line "Item-Wünsche!"
	
	para "PKMN-SUPERMARKT"
	done

_PokeCenterSignText::
	text "Erfrische Deine"
	line "#MON! "
	
	para "PKMN-CENTER"
	done

_FoundItemText::
	text "<PLAYER> findet..."
	line "@"
	text_ram wcf4b
	text "!@"
	text_end

_NoMoreRoomForItemText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "tragen!"
	done

_OaksAideHiText::
	text "Hallo! Erinnerst"
	line "Du Dich? Ich bin"
	cont "PROF. EICHS"
	cont "Gehilfe!"

	para "Wenn Du"
	line "mindestens @"
	text_decimal hOaksAideRequirement, 1, 3
	text_start
	cont "verschiedene"
	cont "#MON gefangen"
	cont "hast, habe ich"
	cont "ein Geschenk für"
	cont "Dich: @"
	text_ram wOaksAideRewardItemName
	text ""

	para "Also, <PLAYER>, "
	line "hast Du @"
	text_decimal hOaksAideRequirement, 1, 3
	text_start
	cont "unterschiedliche"
	cont "#MON gefangen?"
	done

_OaksAideUhOhText::
	text "Mal schauen..."
	line "Oh! Du hast erst"
	cont "@"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " verschiedene"
	cont "#MON gefangen!"

	para "Du benötigst @"
	text_decimal hOaksAideRequirement, 1, 3
	text ","
	line "um das Geschenk"
	cont "zu erhalten."
	done

_OaksAideComeBackText::
	text "Ich habe"
	line "eine gute Idee."

	para "Komm wieder, wenn"
	line "Du @"
	text_decimal hOaksAideRequirement, 1, 3
	text " #MON"
	cont "besitzt. Ich"
	cont "hebe Dir Dein"
	cont "Geschenk auf."
	done

_OaksAideHereYouGoText::
	text "Super! Du hast"
	line "@"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " verschiedene"
	cont "#MON gefangen!"
	cont "Einfach klasse!"

	para "Hier, das hast"
	line "Du Dir redlich"
	cont "verdient!"
	prompt

_OaksAideGotItemText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wOaksAideRewardItemName
	text "!@"
	text_end

_OaksAideNoRoomText::
	text "Oh! Du hast"
	line "momentan keinen"
	cont "Platz für den"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done
