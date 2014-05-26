_NameRaterText_1dab3:: ; 9a308 (26:6308)
	text "Hello, hello!"
	line "I am the official"
	cont "NAME RATER!"

	para "Want me to rate"
	line "the nicknames of"
	cont "your #MON?"
	done

_NameRaterText_1dab8:: ; 9a361 (26:6361)
	text "Which #MON"
	line "should I look at?"
	prompt

_NameRaterText_1dabd:: ; 9a37f (26:637f)
	TX_RAM wcd6d
	text ", is it?"
	line "That is a decent"
	cont "nickname!"

	para "But, would you"
	line "like me to give"
	cont "it a nicer name?"

	para "How about it?"
	done

_NameRaterText_1dac2:: ; 9a3e5 (26:63e5)
	text "Fine! What should"
	line "we name it?"
	prompt

_NameRaterText_1dac7:: ; 9a404 (26:6404)
	text "OK! This #MON"
	line "has been renamed"
	cont "@"
	TX_RAM wHPBarMaxHP
	text "!"

	para "That's a better"
	line "name than before!"
	done

_NameRaterText_1dacc:: ; 9a44c (26:644c)
	text "Fine! Come any"
	line "time you like!"
	done

_NameRaterText_1dad1:: ; 9a46b (26:646b)
	TX_RAM wcd6d
	text ", is it?"
	line "That is a truly"
	cont "impeccable name!"

	para "Take good care of"
	line "@"
	TX_RAM wcd6d
	text "!"
	done

