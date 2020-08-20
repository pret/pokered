_CopycatsHouse2FText_5ccd4::
	text "<PLAYER>: Hallo!"
	line "Magst Du #MON?"

	para "<PLAYER>: Halt,"
	line "ich habe doch"
	cont "Dich gefragt."

	para "<PLAYER>: Wie?"
	line "Du bist komisch!"

	para "NACHAHMERIN: Hmm?"
	line "Ich soll die"
	cont "Nachahmerei"
	cont "aufgeben?"

	para "Aber das ist"
	line "doch mein Hobby!"
	prompt

_TM31PreReceiveText::
	text "Wow! Das ist ja"
	line "eine #PUPPE!"

	para "Die ist für mich?"
	line "Vielen Dank!"

	para "Ich gebe Dir das"
	line "hier dafür!"
	prompt

_ReceivedTM31Text::
	text "<PLAYER> erhält"
	line "@"
	text_ram wcf4b
	text "!@"
	text_end

_TM31ExplanationText1::
	text_start

	para "TM31 ist meine"
	line "Lieblings-TM,"
	cont "MIMIKRY!"

	para "Gib sie einem"
	line "#MON!@"
	text_end

_TM31ExplanationText2::
	text "<PLAYER>: Hallo!"
	line "Vielen Dank für"
	cont "die TM31!"

	para "<PLAYER>:"
	line "Sag mal..."

	para "<PLAYER>:"
	line "...macht es Dir"
	cont "wirklich so"
	cont "viel Spaß, mich"
	cont "nachzuahmen?"

	para "NACHAHMERIN:"
	line "Darauf kannst Du"
	cont "wetten! Es ist"
	cont "ein Brüller!"
	done

_TM31NoRoomText::
	text "Möchtest Du dies"
	line "hier nicht haben?@"
	text_end

_CopycatsHouse2FText2::
	text "DODU: Giegie!"

	para "SPIEGLEIN,"
	line "SPIEGLEIN AN DER"
	cont "WAND, WER IST DIE"
	cont "SCHÖNSTE IM"
	cont "GANZEN LAND?"
	done

_CopycatsHouse2FText3::
	text "Ein seltenes"
	line "#MON! Hmm?"
	cont "Es ist nur eine"
	cont "Puppe!"
	done

_CopycatsHouse2FText6::
	text "Ein Spiel mit"
	line "MARIO!"
	done

_CopycatsHouse2FText_5cd17::
	text "..."

	para "Meine"
	line "Geheimnisse!"

	para "Zeitvertreib:"
	line "Mienenspiel"

	para "Hobby:"
	line "Puppen sammeln"

	para "Lieblings-"
	line "#MON: PIEPI!"
	done

_CopycatsHouse2FText_5cd1c::
	text "Hmm? Aber hier"
	cont "ist doch gar "
	cont "nichts?!"
	done
