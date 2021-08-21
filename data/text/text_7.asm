_ItemUseText001:: ;Interactuar objetos
	text "¡<PLAYER> utilizó@"
	text_end

_ItemUseText002::
	text_ram wcf4b
	text "!"
	done

_GotOnBicycleText1::
	text "¡<PLAYER> subió en@"
	text_end

_GotOnBicycleText2::
	text "la @"
	text_ram wcf4b
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> bajó de@"
	text_end

_GotOffBicycleText2::
	text "la @"
	text_ram wcf4b
	text "."
	prompt

_ThrewAwayItemText::
	text "@"
	text_ram wcd6d
	line "arrojado."
	prompt

_IsItOKToTossItemText::
	text "¿Puedo tirar"
	line "@"
	text_ram wcf4b
	text "?"
	prompt

_TooImportantToTossText::
	text "¡Eso es demasiado"
	line "importante para"
	cont "ser tirado!"
	prompt

_AlreadyKnowsText:: ;¿Ya sabe un movimiento?
	text "¡@"
	text_ram wcd6d
	text " sabe"
	line "@"
	text_ram wcf4b
	text "!"
	prompt

_ConnectCableText:: ;Intercambio Pokémon
	text "¡Bien! ¡Conecta"
	line "el cable así!"
	prompt

_TradedForText::
	text "¡<PLAYER> cambió"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " por"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "!@"
	text_end

_WannaTrade1Text::
	text "¡Busco un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "¿Quieres cambiarlo"
	line "por @"
	text_ram wInGameTradeReceiveMonName
	text "? "
	done

_NoTrade1Text::
	text "¡Auuu!"
	line "Pues bien..."
	done

_WrongMon1Text::
	text "¿Qué? ¡Ése no es"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "¡Si tienes uno,"
	line "vuelve aquí!"
	done

_Thanks1Text::
	text "¡Muchas gracias!"
	done

_AfterTrade1Text::
	text "¿No es estupendo"
	line "mi @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_WannaTrade2Text::
	text "¡Hola!"
	line "¿Quieres cambiar"

	para "tu @"
	text_ram wInGameTradeGiveMonName
	text_start
	line "por @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade2Text::
	text "Vale, si no"
	line "quieres..."
	done

_WrongMon2Text::
	text "¿Qué? Éste no es"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Cuando tengas uno"
	line "piensa en mí."
	done

_Thanks2Text::
	text "¡Gracias!"
	done

_AfterTrade2Text::
	text "¡El @"
	text_ram wInGameTradeGiveMonName
	line "que me cambiaste"

	para "evolucionó!"
	done

_WannaTrade3Text::
	text "¡Hola! ¿Tienes un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "¿Quieres cambiarlo"
	line "por @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade3Text::
	text "¡Qué pena!"
	done

_WrongMon3Text::
	text "...Éste no es un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "¡Si consigues uno"
	line "cámbialo conmigo!"
	done

_Thanks3Text::
	text "¡Gracias, amigo!"
	done

_AfterTrade3Text::
	text "¿Cómo está mi"
	line "viejo @"
	text_ram wInGameTradeReceiveMonName
	text "?"

	para "¡Mi @"
	text_ram wInGameTradeGiveMonName
	line "está fenomenal!"
	done

_NothingToCutText:: ;Usar CORTE
	text "¡No hay nada"
	line "que CORTAR!"
	prompt

_UsedCutText::
	text "¡@"
	text_ram wcd6d
	text " lo"
	line "CORTA todo!"
	prompt
