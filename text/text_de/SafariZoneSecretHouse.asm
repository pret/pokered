_SecretHouseText_4a350::
	text "Ah! Endlich!"

	para "Du bist der"
	line "Erste, der das"
	cont "VERSTECKTE HAUS"
	cont "gefunden hat!"

	para "Ich dachte schon,"
	line "niemand würde den"
	cont "großen Preis"
	cont "jemals gewinnen!"

	para "Glückwunsch! Du"
	line "hast gewonnen!"
	prompt

_ReceivedHM03Text::
	text "<PLAYER> erhält"
	line "@"
	text_ram wcf4b
	text "!@@"

_HM03ExplanationText::
	text "VM03 ist SURFER!"

	para "Lernt ein #MON"
	line "diese Technik,"
	cont "dann kann es Dich"
	cont "über das Wasser"
	cont "transportieren!"

	para "Das BESTE ist"
	line "aber, daß Du"
	cont "diese VM benutzen"
	cont "kannst, so oft Du"
	cont "möchtest!"

	para "Ist das nicht"
	line "irre? Du bist ein"
	cont "Glückspilz!"
	done

_HM03NoRoomText::
	text "Oh! Du kannst"
	line "keine weiteren"
	cont "Items tragen!"
	done
