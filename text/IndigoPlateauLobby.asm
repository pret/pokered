_IndigoPlateauLobbyText2::
	text "Yo! Champ in"
	line "making!"

	para "At #MON LEAGUE,"
	line "you have to face"
	cont "the ELITE FOUR in"
	cont "succession."

	para "If you lose, you"
	line "have to start all"
	cont "over again! This"
	cont "is it! Go for it!"
	done

_IndigoPlateauLobbyText3::
	text "From here on, you"
	line "face the ELITE"
	cont "FOUR one by one!"

	para "If you win, a"
	line "door opens to the"
	cont "next trainer!"
	cont "Good luck!"
	done

_CandyJarPreReceiveText::
	text "I found this empty"
	line "jar on the floor."
	
	para "Mind taking it"
	line "off my hands?"
	
	prompt

_ReceivedCandyJarText::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CandyJarExplanationText::
	text "Me and CRYITHAN"
	line "are so ready for"
	cont "the LEAGUE!"
	
	para "Good luck to you!"
	done

_CandyJarNoRoomText::
	text "No room? Oh, what"
	line "to do..."
	done
