_BluesHouseDaisyRivalAtLabText::
	text "Hi <PLAYER>!"
	line "<RIVAL> is out at"
	cont "Grandpa's lab."
	done

_BluesHouseDaisyOfferMapText::
	text "Grandpa asked you"
	line "to run an errand?"
	
	para "That sounds like"
	line "a difficult job."
	
	para "Here, this will"
	line "help you!"
	prompt

_GotMapText::
	text "<PLAYER> got a"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_BluesHouseDaisyBagFullText::
	text "You have too much"
	line "stuff with you."
	done

_BluesHouseDaisyUseMapText::
	text "Use the TOWN MAP"
	line "to find out where"
	cont "you are."
	done

_BluesHouseDaisyWalkingText::
	text "#MON are living"
	line "things! If they"
	cont "get tired, give"
	cont "them a rest!"
	done

_BluesHouseTownMapText::
	text "It's a map of the"
	line "KANTO region."
	
	para "Would you be happy"
	line "if you had it?"
	done
