_Lab4Text_75dc6:: ; a10e8 (28:50e8)
	text "Hiya!"

	para "I am important"
	line "doctor!"

	para "I study here rare"
	line "#MON fossils!"

	para "You! Have you a"
	line "fossil for me?"
	prompt

_Lab4Text_75dcb:: ; a1145 (28:5145)
	text "No! Is too bad!"
	done

_Lab4Text_75dd0:: ; a1156 (28:5156)
	text "I take a little"
	line "time!"

	para "You go for walk a"
	line "little while!"
	done

_Lab4Text_75dd5:: ; a118d (28:518d)
	text "Where were you?"

	para "Your fossil is"
	line "back to life!"

	para "It was @"
	TX_RAM wcf4b
	db $0
	line "like I think!"
	prompt

_Lab4Text_610ae:: ; a11d6 (28:51d6)
	text "Oh! That is"
	line "@"
	TX_RAM wcd6d
	text "!"

	para "It is fossil of"
	line "@"
	TX_RAM wcf4b
	text ", a"
	cont "#MON that is"
	cont "already extinct!"

	para "My Resurrection"
	line "Machine will make"
	cont "that #MON live"
	cont "again!"
	done

_Lab4Text_610b3:: ; a1259 (28:5259)
	text "So! You hurry and"
	line "give me that!"

	para $52, " handed"
	line "over @"
	TX_RAM wcd6d
	text "!"
	prompt

_Lab4Text_610b8:: ; a128f (28:528f)
	text "I take a little"
	line "time!"

	para "You go for walk a"
	line "little while!"
	done

_Lab4Text_610bd:: ; a12c6 (28:52c6)
	text "Aiyah! You come"
	line "again!"
	done

