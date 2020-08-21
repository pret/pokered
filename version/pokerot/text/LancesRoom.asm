_LanceBeforeBattleText::
	text "Ich habe bereits"
	line "von Dir gehört,"
	cont "<PLAYER>!"

	para "Ich bin"
	line "SIEGFRIED,"
	cont "Drachen-Trainer"
	cont "und Oberhaupt der"
	cont "TOP VIER!"

	para "Wußtest Du, daß"
	line "Drachen mystische"
	cont "#MON sind?"

	para "Sie sind schwer"
	line "zu fangen und"
	cont "zu zähmen!"
	cont "Doch die Mühe"
	cont "lohnt sich!"

	para "Sie sind beinahe"
	line "unbesiegbar!"

	para "Bist Du bereit,"
	line "dem Schicksal ins"
	cont "Auge zu blicken?"

	para "Für Dich endet"
	line "der Ausflug in"
	cont "die PKMN-Liga"
	cont "hier, <PLAYER>!"
	done

_LanceEndBattleText::
	text_start
	line "Es ist vorbei!"

	para "Unfaßbar! Du"
	line "bist wahrlich ein"
	cont "#MON-MEISTER!"
	prompt

_LanceAfterBattleText::
	text "Es ist kaum zu"
	line "glauben! Meine"
	cont "Drachen sind an"
	cont "Dir gescheitert,"
	cont "<PLAYER>!"

	para "Nun bist Du der"
	line "Champion der"
	cont "PKMN-LIGA!"

	para "Mmh, eigentlich"
	line "wärst Du es! Aber"
	cont "Du mußt noch eine"
	cont "Herausforderung"
	cont "bestehen!"

	para "Ein weiterer"
	line "Trainer erwartet"
	cont "Dich! Es ist..."

	para "<RIVAL>! Auch"
	line "er hat die TOP"
	cont "VIER besiegt!"

	para "Er ist der"
	line "amtierende"
	cont "Champion der"
	cont "PKMN-Liga!@@"
