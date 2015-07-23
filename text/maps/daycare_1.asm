_DayCareIntroText:: ; 8ab95 (22:6b95)
	text "I run a DAYCARE."
	line "Would you like me"
	cont "to raise one of"
	cont "your #MON?"
	done

_DayCareWhichMonText:: ; 8abd4 (22:6bd4)
	text "Which #MON"
	line "should I raise?"
	prompt

_DayCareWillLookAfterMonText:: ; 8abf0 (22:6bf0)
	text "Fine, I'll look"
	line "after @"
	TX_RAM wcd6d
	db $0
	cont "for a while."
	prompt

_DayCareComeSeeMeInAWhileText:: ; 8ac19 (22:6c19)
	text "Come see me in"
	line "a while."
	done

_DayCareMonHasGrownText:: ; 8ac32 (22:6c32)
	text "Your @"
	TX_RAM wcd6d
	db $0
	line "has grown a lot!"

	para "By level, it's"
	line "grown by @"
	TX_NUM wDayCareNumLevelsGrown,$1,$3
	text "!"

	para "Aren't I great?"
	prompt

_DayCareOweMoneyText:: ; 8ac7d (22:6c7d)
	text "You owe me ¥@"
	TX_BCD wDayCareTotalCost, $c2
	db $0
	line "for the return"
	cont "of this #MON."
	done

_DayCareGotMonBackText:: ; 8acae (22:6cae)
	text $52, " got"
	line "@"
	TX_RAM W_DAYCAREMONNAME
	text " back!"
	done

_DayCareMonNeedsMoreTimeText:: ; 8acc1 (22:6cc1)
	text "Back already?"
	line "Your @"
	TX_RAM wcd6d
	db $0
	cont "needs some more"
	cont "time with me."
	prompt

