_Route24Text_51510:: ; 92721 (24:6721)
	text "Congratulations!"
	line "You beat our 5"
	cont "contest trainers!@@"

_Route24Text_51515:: ; 92755 (24:6755)
	db $0
	para "You just earned a"
	line "fabulous prize!"
	prompt

_Route24Text_5151a:: ; 92779 (24:6779)
	text $52, " received"
	line "a @"
	TX_RAM wcf4b
	text "!@@"

_Route24Text_51521:: ; 9278f (24:678f)
	text "You don't have"
	line "any room!"
	done

_Route24Text_51526:: ; 927a8 (24:67a8)
	text "By the way, would"
	line "you like to join"
	cont "TEAM ROCKET?"

	para "We're a group"
	line "dedicated to evil"
	cont "using #MON!"

	para "Want to join?"

	para "Are you sure?"

	para "Come on, join us!"

	para "I'm telling you"
	line "to join!"

	para "OK, you need"
	line "convincing!"

	para "I'll make you an"
	line "offer you can't"
	cont "refuse!"
	done

_Route24Text_5152b:: ; 9288a (24:688a)
	text "Arrgh!"
	line "You are good!"
	prompt

_Route24Text_51530:: ; 928a0 (24:68a0)
	text "With your ability,"
	line "you could become"
	cont "a top leader in"
	cont "TEAM ROCKET!"
	done

_Route24BattleText1:: ; 928e2 (24:68e2)
	text "I saw your feat"
	line "from the grass!"
	done

