_PokemartGreetingText::
	text "Hallo!"
	next "Kann ich Dir"
	cont "behilflich sein?"
	done

_PokemonFaintedText::
	text_ram wcd6d
	text_start
	line "wurde besiegt!"
	done

_PlayerBlackedOutText::
	text "<PLAYER> hat keine"
	line "einsatzbereiten"
	cont "#MON mehr!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	prompt

_RepelWoreOffText::
	text "Der SCHUTZ wirkt"
	line "nicht mehr."
	done

_PokemartBuyingGreetingText::
	text "Schau Dich in"
	line "Ruhe um."
	done

_PokemartTellBuyPriceText::
	text_ram wcf4b
	text "?"
	line "Das macht dann"
	cont "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "! OK?"
	done

_PokemartBoughtItemText::
	text "Hier, bitte sehr!"
	line "Vielen Dank!"
	prompt

_PokemartNotEnoughMoneyText::
	text "Du hast nicht"
	line "genug Geld."
	prompt

_PokemartItemBagFullText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	prompt

_PokemonSellingGreetingText::
	text "Was möchtest Du"
	line "verkaufen?"
	done

_PokemartTellSellPriceText::
	text "Ich gebe Dir"
	line "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text " dafür."
	done

_PokemartItemBagEmptyText::
	text "Du hast nichts,"
	line "was Du verkaufen"
	cont "könntest!"
	prompt

_PokemartUnsellableItemText::
	text "Das kann ich"
	line "nicht gebrauchen."
	prompt

_PokemartThankYouText::
	text "Vielen Dank!"
	done

_PokemartAnythingElseText::
	text "Kann ich sonst"
	line "irgendwie helfen?"
	done

_LearnedMove1Text::
	text_ram wLearnMoveMonName
	text " lernt"
	line "@"
	text_ram wcf4b
	text "!@"
	text_end

_WhichMoveToForgetText::
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"
	done

_AbandonLearningText::
	text_ram wcf4b
	text_start
	line "nicht erlernen?"
	done

_DidNotLearnText::
	text_ram wLearnMoveMonName
	text_start
	line "hat @"
	text_ram wcf4b
	text_start
	cont "nicht erlernt!"
	prompt

_TryingToLearnText::
	text_ram wLearnMoveMonName
	text_start
	line "versucht,"
	cont "@"
	text_ram wcf4b
	text " zu"
	cont "erlernen!"

	para "Aber @"
	text_ram wLearnMoveMonName
	text_start
	line "kann nicht mehr"
	cont "als vier Attacken"
	cont "erlernen!"

	para "Soll eine andere"
	line "Attacke zugunsten"
	cont "von @"
	text_ram wcf4b
	text_start
	cont "vergessen werden?"
	done

_OneTwoAndText::
	text "1, 2, @"
	text_end

_PoofText::
	text "schwupp!@"
	text_end

_ForgotAndText::
	text_start
	para "@"
	text_ram wLearnMoveMonName
	text " hat"
	line "@"
	text_ram wcd6d
	text_start
	cont "vergessen!"

	para "Und..."
	prompt

_HMCantDeleteText::
	text "VM-Attacken"
	line "können nicht"
	cont "gelöscht werden!"
	prompt

_PokemonCenterWelcomeText::
	text "Willkommen im"
	line "PKMN-CENTER!"

	para "Wir heilen Deine"
	line "#MON und"
	cont "machen sie wieder"
	cont "fit!"
	prompt

_ShallWeHealYourPokemonText::
	text "Sollen wir Deine"
	line "#MON heilen?"
	done

_NeedYourPokemonText::
	text "OK. Wir benötigen"
	line "Deine #MON."
	done

_PokemonFightingFitText::
	text "Danke! Deine"
	line "#MON sind"
	cont "wieder topfit!"
	prompt

_PokemonCenterFarewellText::
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

_CableClubNPCAreaReservedFor2FriendsLinkedByCableText::
	text "Dieser Bereich"
	line "ist für Freunde"
	cont "reserviert, die"
	cont "über Game Link"
	cont "Kabel miteinander"
	cont "spielen!"
	done

_CableClubNPCWelcomeText::
	text "Willkommen im"
	line "KABEL-CLUB!"
	done

_CableClubNPCPleaseApplyHereHaveToSaveText::
	text "Bitte melde Dich"
	line "hier an."

	para "Das Spiel wird"
	line "gesichert, bevor"
	cont "die Verbindung"
	cont "hergestellt wird!"
	done

_CableClubNPCPleaseWaitText::
	text "Bitte warten.@"
	text_end

_CableClubNPCLinkClosedBecauseOfInactivityText::
	text "Die Verbindung"
	line "wurde getrennt."

	para "Es erfolgte keine"
	line "Bestätigung von"
	cont "der Gegenseite!"

	para "Versuche es"
	line "noch einmal!"
	done
