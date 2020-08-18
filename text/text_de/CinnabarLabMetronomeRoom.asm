_TM35PreReceiveText::
	text "Tak-tak-tak!"
	line "Ich habe eine"
	cont "TM konstruiert!"

	para "Sie verursacht"
	line "die verrücktesten"
	cont "Dinge!"
	prompt

_ReceivedTM35Text::
	text "<PLAYER> erhält"
	line "@"
	text_ram wcf4b
	text "!@"
	text_end

_TM35ExplanationText::
	text "Tak-tak-tak!"
	line "So klingt ein"
	cont "METRONOM!"

	para "Damit setzt Dein"
	line "#MON Attacken"
	cont "ein, die es gar"
	cont "nicht kennt!"
	done

_TM35NoRoomText::
	text "Dein Rucksack"
	line "ist zu voll!"
	done

_Lab3Text2::
	text "EVOLI kann sich"
	line "zu einem von drei"
	cont "verschiedenen"
	cont "#MON"
	cont "entwickeln."
	done

_Lab3Text3::
	text "Eine E-Mail ist"
	line "angekommen!"

	para "..."

	para "ARKTOS, ZAPDOS"
	line "und LAVADOS sind"
	cont "die 3 legendären"
	cont "VOGEL-#MON."

	para "Niemand weiß, in"
	line "welcher Gegend"
	cont "sie leben."

	para "Wir werden als"
	line "nächstes in der"
	cont "Höhle nahe AZURIA"
	cont "CITY suchen."

	para "Von: #MON-"
	line "FORSCHUNGSTEAM"

	para "..."
	done

_Lab3Text5::
	text "Eine Pfeife aus"
	line "Bernstein!"
	done
