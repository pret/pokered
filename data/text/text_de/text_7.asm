_ItemUseText001::
	text "<PLAYER> setzt@"
	text_end

_ItemUseText002::
	text_ram wcf4b
	text " ein!"
	done

_GotOnBicycleText1::
	text "<PLAYER> steigt@"
	text_end

_GotOnBicycleText2::
	text "auf das @"
	text_ram wcf4b
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> steigt@"
	text_end

_GotOffBicycleText2::
	text "vom @"
	text_ram wcf4b
	text " ab."
	prompt

_ThrewAwayItemText::
	text_ram wcd6d
	text_start
	line "weggeworfen!"
	prompt

_IsItOKToTossItemText::
	text "Willst Du"
	line "@"
	text_ram wcf4b
	text_start
	cont "wegwerfen?"
	prompt

_TooImportantToTossText::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "wegwerfen!"
	prompt

_AlreadyKnowsText::
	text_ram wcd6d
	text " kennt"
	line "@"
	text_ram wcf4b
	text_start
	cont "bereits!"
	prompt

_ConnectCableText::
	text "OK, verbinde die"
	line "Kabel so! "
	prompt

_TradedForText::
	text "<PLAYER> hat"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " gegen"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text_start
	cont "getauscht!@"
	text_end

_WannaTrade1Text::
	text "Ich suche nach"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Tauschst Du es"
	line "gegen @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade1Text::
	text "Oje! Wenn"
	line "das so ist..."
	done

_WrongMon1Text::
	text "Was? Das ist aber"
	line "kein @"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Komm wieder,"
	line "wenn Du eins"
	cont "besitzt!"
	done

_Thanks1Text::
	text "Vielen Dank!"
	done

_AfterTrade1Text::
	text "Ist @"
	text_ram wInGameTradeReceiveMonName
	text_start
	line "nicht cool?"
	done

_WannaTrade2Text::
	text "Hallo! Willst Du"
	line "Dein @"
	text_ram wInGameTradeGiveMonName
	text_start

	para "nicht gegen ein"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text_start
	para "tauschen?"
	done

_NoTrade2Text::
	text "Wenn Du nicht"
	line "magst, kann man"
	cont "nichts machen!"
	done

_WrongMon2Text::
	text "Hm? Das ist kein"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Denk an mich,"
	line "wenn Du eins"
	cont "gefangen hast!"
	done

_Thanks2Text::
	text "Danke!"
	done

_AfterTrade2Text::
	text "Der @"
	text_ram wInGameTradeGiveMonName
	text ","
	line "den Du mir"

	para "gegeben hast, hat"
	line "sich entwickelt!"
	done

_WannaTrade3Text::
	text "Besitzt Du ein"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "Willst Du es"
	line "gegen @"
	text_ram wInGameTradeReceiveMonName
	text_start

	para "tauschen?"
	done

_NoTrade3Text::
	text "Schade!"
	done

_WrongMon3Text::
	text "Das ist kein"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Komm wieder,"
	line "wenn Du eins"
	cont "besitzt!"
	done

_Thanks3Text::
	text "Vielen Dank!"
	done

_AfterTrade3Text::
	text "Wie geht es"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"

	para "Mein @"
	text_ram wInGameTradeGiveMonName
	text_start
	line "fühlt sich super!"
	done

_NothingToCutText::
	text "Hier kann"
	line "man nichts"
	cont "zerschneiden!"
	prompt

_UsedCutText::
	text_ram wcd6d
	text " setzt"
	line "den ZERSCHNEIDER"
	cont "ein!"
	prompt
