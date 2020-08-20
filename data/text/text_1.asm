_CardKeySuccessText1::
	text "Bingo!@"
	text_end

_CardKeySuccessText2::
	text_start
	line "The CARD KEY"
	cont "opened the door!"
	done

_CardKeyFailText::
	text "Darn! It needs a"
	line "CARD KEY!"
	done

_TrainerNameText::
	text_ram wcd6d
	text ": @"
	text_end

_NoNibbleText::
	text "Not even a nibble!"
	prompt

_NothingHereText::
	text "Looks like there's"
	line "nothing here."
	prompt

_ItsABiteText::
	text "Oh!"
	line "It's a bite!"
	prompt

_ExclamationText::
	text "!"
	done

_GroundRoseText::
	text "Ground rose up"
	line "somewhere!"
	done

_BoulderText::
	text "This requires"
	line "STRENGTH to move!"
	done

_MartSignText::
	text "All your item"
	line "needs fulfilled!"
	cont "#MON MART"
	done

_PokeCenterSignText::
	text "Heal Your #MON!"
	line "#MON CENTER"
	done

_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wcf4b
	text "!@"
	text_end

_NoMoreRoomForItemText::
	text "No more room for"
	line "items!"
	done

_OaksAideHiText::
	text "Hi! Remember me?"
	line "I'm PROF.OAK's"
	cont "AIDE!"

	para "If you caught @"
	text_decimal hOaksAideRequirement, 1, 3
	text_start
	line "kinds of #MON,"
	cont "I'm supposed to"
	cont "give you an"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "!"

	para "So, <PLAYER>! Have"
	line "you caught at"
	cont "least @"
	text_decimal hOaksAideRequirement, 1, 3
	text " kinds of"
	cont "#MON?"
	done

_OaksAideUhOhText::
	text "Let's see..."
	line "Uh-oh! You have"
	cont "caught only @"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text_start
	cont "kinds of #MON!"

	para "You need @"
	text_decimal hOaksAideRequirement, 1, 3
	text " kinds"
	line "if you want the"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_OaksAideComeBackText::
	text "Oh. I see."

	para "When you get @"
	text_decimal hOaksAideRequirement, 1, 3
	text_start
	line "kinds, come back"
	cont "for @"
	text_ram wOaksAideRewardItemName
	text "."
	done

_OaksAideHereYouGoText::
	text "Great! You have"
	line "caught @"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " kinds "
	cont "of #MON!"
	cont "Congratulations!"

	para "Here you go!"
	prompt

_OaksAideGotItemText::
	text "<PLAYER> got the"
	line "@"
	text_ram wOaksAideRewardItemName
	text "!@"
	text_end

_OaksAideNoRoomText::
	text "Oh! I see you"
	line "don't have any"
	cont "room for the"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done
