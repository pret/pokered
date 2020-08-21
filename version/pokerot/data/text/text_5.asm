_CableClubNPCPleaseComeAgainText::
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

_CableClubNPCMakingPreparationsText::
	text "Wir treffen"
	line "gerade die"
	cont "Vorbereitungen."
	cont "Bitte warte!"
	done

_UsedStrengthText::
	text_ram wcd6d
	text_start
	line "setzt STÄRKE ein.@"
	text_end

_CanMoveBouldersText::
	text_ram wcd6d
	text " kann"
	line "Felsen bewegen."
	prompt

_CurrentTooFastText::
	text "Die Strömung"
	line "ist zu stark!"
	prompt

_CyclingIsFunText::
	text "Radfahren macht"
	line "Spaß! Surfen"
	cont "dagegen ist"
	cont "nichts!"
	prompt

_FlashLightsAreaText::
	text "Ein gleißender"
	line "BLITZ erhellt"
	cont "das Gebiet!"
	prompt

_WarpToLastPokemonCenterText::
	text "In das letzte"
	line "PKMN-CENTER"
	cont "zurückkehren?"
	done

_CannotUseTeleportNowText::
	text_ram wcd6d
	text " kann"
	line "TELEPORT momentan"
	cont "nicht einsetzen!"
	prompt

_CannotFlyHereText::
	text_ram wcd6d
	text_start
	line "kann hier nicht"
	cont "FLIEGEN."
	prompt

_NotHealthyEnoughText::
	text "Nicht genug"
	line "Kraftpunkte!"
	prompt

_NewBadgeRequiredText::
	text "Nein! Hier"
	line "benötigt man"
	cont "einen neuen"
	cont "ORDEN!"
	prompt

_CannotUseItemsHereText::
	text "Du kannst hier"
	line "keine Items"
	cont "einsetzen!"
	prompt

_CannotGetOffHereText::
	text "Du kannst hier"
	line "nicht absteigen!"
	prompt

_GotMonText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wcd6d
	text "!@"
	text_end

_SentToBoxText::
	text "Es ist nicht"
	line "genug Platz für"
	cont "das #MON!"
	cont "@"
	text_ram wBoxMonNicks
	text " wurde"
	cont "mittels PC in"
	cont "#MON-BOX @"
	text_ram wcf4b
	text_start
	cont "transferiert!"
	done

_BoxIsFullText::
	text "Es ist kein Platz"
	line "für das #MON!"

	para "Die #MON-BOX"
	line "ist voll und kann"
	cont "keine weiteren"
	cont "#MON"
	cont "aufnehmen!"

	para "Wechsle in einem"
	line "#MON-CENTER"
	cont "die BOX!"
	done
