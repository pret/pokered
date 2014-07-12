_TM18PreReceiveText:: ; 9c814 (27:4814)
	text "Oh, hi! I finally"
	line "finished #MON!"

	para "Not done yet?"
	line "This might be"
	cont "useful!"
	prompt

_ReceivedTM18Text:: ; 9c85a (27:485a)
	text $52, " received"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_TM18ExplanationText:: ; 9c86e (27:486e)
	text "TM18 is COUNTER!"
	line "Not like the one"
	cont "I'm leaning on,"
	cont "mind you!"
	done

_TM18NoRoomText:: ; 9c8aa (27:48aa)
	text "Your pack is full"
	line "of items!"
	done

_CeladonMart3Text2:: ; 9c8c7 (27:48c7)
	text "Captured #MON"
	line "are registered"
	cont "with an ID No."
	cont "and OT, the name"
	cont "of the Original"
	cont "Trainer that"
	cont "caught it!"
	done

_CeladonMart3Text3:: ; 9c92d (27:492d)
	text "All right!"

	para "My buddy's going"
	line "to trade me his"
	cont "KANGASKHAN for my"
	cont "GRAVELER!"
	done

_CeladonMart3Text4:: ; 9c975 (27:4975)
	text "Come on GRAVELER!"

	para "I love GRAVELER!"
	line "I collect them!"

	para "Huh?"

	para "GRAVELER turned"
	line "into a different"
	cont "#MON!"
	done

_CeladonMart3Text5:: ; 9c9d5 (27:49d5)
	text "You can identify"
	line "#MON you got"
	cont "in trades by"
	cont "their ID Numbers!"
	done

_CeladonMart3Text6:: ; 9ca13 (27:4a13)
	text "It's an SNES!"
	done

_CeladonMart3Text7:: ; 9ca21 (27:4a21)
	text "An RPG! There's"
	line "no time for that!"
	done

_CeladonMart3Text9:: ; 9ca43 (27:4a43)
	text "A sports game!"
	line "Dad'll like that!"
	done

_CeladonMart3Text11:: ; 9ca64 (27:4a64)
	text "A puzzle game!"
	line "Looks addictive!"
	done

_CeladonMart3Text13:: ; 9ca85 (27:4a85)
	text "A fighting game!"
	line "Looks tough!"
	done

_CeladonMart3Text14:: ; 9caa4 (27:4aa4)
	text "3F: TV GAME SHOP"
	done

_CeladonMart3Text15:: ; 9cab6 (27:4ab6)
	text "Red and Blue!"
	line "Both are #MON!"
	done

