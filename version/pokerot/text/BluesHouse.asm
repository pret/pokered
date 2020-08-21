_DaisyInitialText::
	text "Hallo <PLAYER>!"
	line "<RIVAL> wartet"
	cont "in Opas Labor."
	done

_DaisyOfferMapText::
	text "Opa hat Dich um"
	line "einen Botengang"
	cont "gebeten? Hier,"
	cont "das wird Dir"
	cont "weiterhelfen!"
	prompt

_GotMapText::
	text "<PLAYER> erhält"
	line "eine @"
	text_ram wcf4b
	text "!@"
	text_end

_DaisyBagFullText::
	text "Du trägst zu"
	line "viele Dinge mit"
	cont "Dir herum!"
	done

_DaisyUseMapText::
	text "Benutze die"
	line "KARTE, um Deinen"
	cont "Standort zu"
	cont "bestimmen."
	done

_BluesHouseDaisyWalkingText::
	text "#MON sind"
	line "Lebewesen! Gönne"
	cont "ihnen eine Pause,"
	cont "wenn sie müde"
	cont "sind!"
	done

_BluesHouseTownMapText::
	text "Eine große Karte!"
	line "Sie ist nützlich!"
	done
