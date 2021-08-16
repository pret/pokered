_CableClubNPCPleaseComeAgainText:: ;Cable Club
	text "¡Vuelve otra vez"
	line "cuando quieras!"
	done

_CableClubNPCMakingPreparationsText::
	text "Estamos haciendo"
	line "los preparativos."
	cont "Espera por favor."
	done

_UsedStrengthText:: ;Usar fuerza
	text_ram wcd6d
	text " usó"
	line "la FUERZA.@"
	text_end

_CanMoveBouldersText::
	text_ram wcd6d
	text " "
	line "mueve rocas."
	prompt

_CurrentTooFastText:: ;Corriente rápida
	text "¡La corriente es"
	line "demasiado rápida!"
	prompt

_CyclingIsFunText:: ;???
	text "¡Pedalear es"
	line "genial! ¡Olvida"
	cont "el SURF!"
	prompt

_FlashLightsAreaText:: ;Usar DESTELLO
	text "¡Un cegador"
	line "DESTELLO iluminó"
	cont "la zona!"
	prompt

_WarpToLastPokemonCenterText:: ;Volver Centro Pokemon
	text "Vuelve al último"
	line "CENTRO #MON."
	done

_CannotUseTeleportNowText:: ;No puede usar TELETRANP. o VUELO
	text_ram wcd6d
	text " no"
	line "puede usar ahora"
	cont "el teletransporte."
	prompt

_CannotFlyHereText::
	text_ram wcd6d
	text " no"
	line "puede VOLAR aquí."
	prompt

_NotHealthyEnoughText:: ;???
	text "No está lo"
	line "bastante sano."
	prompt

_NewBadgeRequiredText:: ;Se requiere medalla
	text "¡No! ¡Se requiere"
	line "una nueva"
	cont "MEDALLA!"
	prompt

_CannotUseItemsHereText:: ;No puedes...
	text "No puedes usar"
	line "objetos aquí."
	prompt

_CannotGetOffHereText::
	text "No puedes bajarte"
	line "aquí."
	prompt

_GotMonText:: ;Conseguir Pokémon
	text "¡<PLAYER> obtiene"
	line "@"
	text_ram wcd6d
	text "!@"
	text_end

_SentToBoxText::
	text "¡No tienes sitio"
	line "para más #MON!"
	cont "¡@"
	text_ram wBoxMonNicks
	cont "fue enviado a la"
	cont "CAJA #MON"
	cont "@"
	text_ram wcf4b
	text " del PC!"
	done

_BoxIsFullText:: ;CAJA PC llena
	text "¡No tienes sitio"
	line "para más #MON!"

	para "¡La CAJA #MON"
	line "está llena y no"
	cont "caben más!"

	para "¡Cambia la CAJA"
	line "en un CENTRO"
	cont "#MON!"
	done
