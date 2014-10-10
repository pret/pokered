IF DEF(_YELLOW)
_BillsHouseDontLeaveText::
	text "Whoa, don't go"
	line "anywhere, wait!"
	done
ENDC

_BillsHouseText_1e865:: ; 8d267 (23:5267)
	text "Hiya! I'm a"
	line "#MON..."
	cont "...No I'm not!"

	para "Call me BILL!"
	line "I'm a true blue"
	cont "#MANIAC! Hey!"
	cont "What's with that"
	cont "skeptical look?"

	para "I'm not joshing"
	line "you, I screwed up"
	cont "an experiment and"
	cont "got combined with"
	cont "a #MON!"

	para "So, how about it?"
	line "Help me out here!"
	done

_BillsHouseText_1e86a:: ; 8d345 (23:5345)
	text "When I'm in the"
	line "TELEPORTER, go to"
	cont "my PC and run the"
	cont "Cell Separation"
	cont "System!"
	done

_BillsHouseText_1e86f:: ; 8d391 (23:5391)
	text "No!? Come on, you"
	line "gotta help a guy"
	cont "in deep trouble!"

	para "What do you say,"
	line "chief? Please?"
	cont "OK? All right!"
	prompt

_BillThankYouText:: ; 8d3f5 (23:53f5)
	text "BILL: Yeehah!"
	line "Thanks, bud! I"
	cont "owe you one!"

	para "So, did you come"
	line "to see my #MON"
	cont "collection?"
	cont "You didn't?"
	cont "That's a bummer."

	para "I've got to thank"
	line "you... Oh here,"
	cont "maybe this'll do."
	prompt

_SSTicketReceivedText:: ; 8d499 (23:5499)
	text $52, " received"
	line "an @"
	TX_RAM wcf4b
	text "!@@"

_SSTicketNoRoomText:: ; 8d4b0 (23:54b0)
	text "You've got too"
	line "much stuff, bud!"
	done

_BillsHouseText_1e8cb:: ; 8d4d0 (23:54d0)
	text "That cruise ship,"
	line "S.S.ANNE, is in"
	cont "VERMILION CITY."
	cont "Its passengers"
	cont "are all trainers!"

	para "They invited me"
	line "to their party,"
	cont "but I can't stand"
	cont "fancy do's. Why"
	cont "don't you go"
	cont "instead of me?"
	done

_BillsHouseText_1e8da:: ; 8d57f (23:557f)
	text "BILL: Look, bud,"
	line "just check out"
	cont "some of my rare"
	cont "#MON on my PC!"
	done

