_DayCareMText_5640f:: ; 8ab95 (22:6b95)
	text "I run a DAYCARE."
	line "Would you like me"
	cont "to raise one of"
	cont "your #MON?"
	done

_DayCareMText_56414:: ; 8abd4 (22:6bd4)
	text "Which #MON"
	line "should I raise?"
	prompt

_DayCareMText_56419:: ; 8abf0 (22:6bf0)
	text "Fine, I'll look"
	line "after @"
	TX_RAM wcd6d
	db $0
	cont "for a while."
	prompt

_DayCareMText_5641e:: ; 8ac19 (22:6c19)
	text "Come see me in"
	line "a while."
	done

_DayCareMText_56423:: ; 8ac32 (22:6c32)
	text "Your @"
	TX_RAM wcd6d
	db $0
	line "has grown a lot!"

	para "By level, it's"
	line "grown by @"

DayCareMText_8ac67:: ; 8ac67 (22:6c67)
	TX_NUM wTrainerEngageDistance,$1,$3
	text "!"

	para "Aren't I great?"
	prompt

_DayCareMText_56428:: ; 8ac7d (22:6c7d)
	text "You owe me ¥@"
	TX_BCD wcd3f, $c2
	db $0
	line "for the return"
	cont "of this #MON."
	done

_DayCareMText_5642d:: ; 8acae (22:6cae)
	text $52, " got"
	line "@"
	TX_RAM W_DAYCAREMONNAME
	text " back!"
	done

_DayCareMText_56432:: ; 8acc1 (22:6cc1)
	text "Back already?"
	line "Your @"
	TX_RAM wcd6d
	db $0
	cont "needs some more"
	cont "time with me."
	prompt

