_DayCareIntroText::
	text "I run a DAYCARE."
	line "Would you like me"
	cont "to raise one of"
	cont "your #MON?"
	done

_DayCareWhichMonText::
	text "Which #MON"
	line "should I raise?"
	prompt

_DayCareWillLookAfterMonText::
	text "Fine, I'll look"
	line "after @"
	TX_RAM wcd6d
	text ""
	cont "for a while."
	prompt

_DayCareComeSeeMeInAWhileText::
	text "Come see me in"
	line "a while."
	done

_DayCareMonHasGrownText::
	text "Your @"
	TX_RAM wcd6d
	text ""
	line "has grown a lot!"

	para "By level, it's"
	line "grown by @"
	TX_NUM wDayCareNumLevelsGrown,$1,$3
	text "!"

	para "Aren't I great?"
	prompt

_DayCareOweMoneyText::
	text "You owe me ¥@"
	TX_BCD wDayCareTotalCost, $c2
	text ""
	line "for the return"
	cont "of this #MON."
	done

_DayCareGotMonBackText::
	text "<PLAYER> got"
	line "@"
	TX_RAM wDayCareMonName
	text " back!"
	done

_DayCareMonNeedsMoreTimeText::
	text "Back already?"
	line "Your @"
	TX_RAM wcd6d
	text ""
	cont "needs some more"
	cont "time with me."
	prompt
