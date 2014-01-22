_DaisyInitialText:
	text "Hi ",$52,"!"
	line $53," is out at"
	next "Grandpa's lab."
	done

_DaisyOfferMapText:
	text "Grandpa asked you"
	line "to run an errand?"
	next "Here, this will"
	next "help you!"
	prompt

_GotMapText:
	text $52," got a"
	line "@"
	TX_RAM $CF4B
	text "!@@"

_DaisyBagFullText:
	text "You have too much"
	line "stuff with you."
	done

_DaisyUseMapText:
	text "Use the TOWN MAP"
	line "to find out where"
	next "you are."
	done

_BluesHouseText2:
	text "#MON are living"
	line "things! If they"
	next "get tired, give"
	next "them a rest!"
	done

_BluesHouseText3:
	text "It's a big map!"
	line "This is useful!"
	done

