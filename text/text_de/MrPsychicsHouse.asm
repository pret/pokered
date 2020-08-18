_TM29PreReceiveText::
	text "Warte! Sag"
	line "kein Wort!"

	para "Du suchst dies"
	line "hier, oder?"
	prompt

_ReceivedTM29Text::
	text "<PLAYER> erhält"
	line "@"
	text_ram wcf4b
	text "!@"
	text_end

_TM29ExplanationText::
	text "TM29 ist"
	line "PSYCHOKINESE!"

	para "Sie vermindert"
	line "die SPEZIAL-"
	cont "FÄHIGKEITEN des"
	cont "Gegners."
	done

_TM29NoRoomText::
	text "Hey, Du kannst"
	line "keine Items mehr"
	cont "tragen!"
	done
