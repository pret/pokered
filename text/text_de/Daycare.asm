_DayCareIntroText::
	text "Ich leite diese"
	line "PENSION. Soll"
	cont "ich eines Deiner"
	cont "#MON"
	cont "großziehen?"
	done

_DayCareWhichMonText::
	text "Welches #MON"
	line "soll hierbleiben?"
	prompt

_DayCareWillLookAfterMonText::
	text "OK, ich kümmere"
	line "mich eine Weile"
	cont "um @"
	text_ram wcd6d
	text "."
	prompt

_DayCareComeSeeMeInAWhileText::
	text "Komm später"
	line "wieder vorbei, um"
	cont "es abzuholen."
	done

_DayCareMonHasGrownText::
	text_ram wcd6d
	text_start
	line "hat sich toll "
	cont "entwickelt!"

	para "Es ist um @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text_start
	line "Level gestiegen!"

	para "Das habe ich gut"
	line "gemacht, oder?"
	prompt

_DayCareOweMoneyText::
	text "Bevor Du Dein"
	line "#MON wieder"
	cont "mitnimmst, "
	cont "bekomme ich noch"
	cont "¥@"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " von Dir!"
	done

_DayCareGotMonBackText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wDayCareMonName
	text_start
	cont "zurück!"
	done

_DayCareMonNeedsMoreTimeText::
	text "Du bist schon"
	line "wieder zurück?"
	cont "@"
	text_ram wcd6d
	text " sollte"
	cont "noch ein bißchen"
	cont "bei mir bleiben."
	prompt
