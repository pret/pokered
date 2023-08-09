_MrPsychicsHouseMrPsychicYouWantedThisText::
	text "...Wait! Don't"
	line "say a word!"

	para "You wanted this!"
	prompt

_MrPsychicsHouseMrPsychicReceivedTM29Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrPsychicsHouseMrPsychicTM29ExplanationText::
	text "TM46 is PSYBEAM!"

	para "It can confuse"
	line "the target."

	para "It's a great"
	line "PSYCHIC-type"
	cont "move!"
	done

_MrPsychicsHouseMrPsychicTM29NoRoomText::
	text "Where do you plan"
	line "to put this?"
	done
