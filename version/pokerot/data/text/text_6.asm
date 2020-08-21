_ItemUseBallText00::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "läßt sich nicht"
	cont "fangen!"
	prompt

_ItemUseBallText01::
	text "Du hast das"
	line "#MON verfehlt!"
	prompt

_ItemUseBallText02::
	text "Mist! Das #MON"
	line "hat sich befreit!"
	prompt

_ItemUseBallText03::
	text "Fast hätte es"
	line "geklappt! "
	prompt

_ItemUseBallText04::
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt

_ItemUseBallText05::
	text "Wunderbar!"
	line "@"
	text_ram wEnemyMonNick
	text " wurde"
	cont "gefangen!@"
	text_end

_ItemUseBallText07::
	text_ram wBoxMonNicks
	text " wurde"
	line "auf BILLS PC"
	cont "übertragen!"
	prompt

_ItemUseBallText08::
	text_ram wBoxMonNicks
	text " wurde"
	line "auf den GAST-PC"
	cont "übertragen!"
	prompt

_ItemUseBallText06::
	text "Für @"
	text_ram wEnemyMonNick
	text_start
	line "wird ein neuer"
	cont "Eintrag im"
	cont "#DEX angelegt!@"
	text_end

_SurfingGotOnText::
	text "<PLAYER> steigt"
	line "auf @"
	text_ram wcd6d
	text "!"
	prompt

_SurfingNoPlaceToGetOffText::
	text "Hier kann man"
	line "nicht absteigen!"
	prompt

_VitaminStatRoseText::
	text_ram wcd6d
	text "s"
	line "@"
	text_ram wcf4b
	text " ist"
	cont "gestiegen."
	prompt

_VitaminNoEffectText::
	text "Das würde keinen"
	line "Effekt haben."
	prompt

_ThrewBaitText::
	text "<PLAYER> wirft"
	line "einen KÖDER aus."
	done

_ThrewRockText::
	text "<PLAYER> hat "
	line "einen STEIN"
	cont "geworfen."
	done

_PlayedFluteNoEffectText::
	text "Die #FLÖTE"
	line "wurde gespielt!"

	para "Eine schöne"
	line "Melodie!"
	prompt

_FluteWokeUpText::
	text "Alle schlafenden"
	line "#MON sind"
	cont "aufgewacht."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> spielt"
	line "die #FLÖTE.@"
	text_end

_CoinCaseNumCoinsText::
	text "Münzen"
	line "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " "
	prompt

_ItemfinderFoundItemText::
	text "Oh! Der DETEKTOR"
	line "zeigt an, daß ein"
	cont "Item in der Nähe"
	cont "liegt!"
	prompt

_ItemfinderFoundNothingText::
	text "Nichts! Der"
	line "DETEKTOR schlägt"
	cont "nicht an."
	prompt

_RaisePPWhichTechniqueText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erhöht"
	cont "werden?"
	done

_RestorePPWhichTechniqueText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erneuert"
	cont "werden?"
	done

_PPMaxedOutText::
	text "Die AP von"
	line "@"
	text_ram wcf4b
	text " sind"
	cont "auf dem Maximum!"
	prompt

_PPIncreasedText::
	text "Die AP von"
	line "@"
	text_ram wcf4b
	text_start
	cont "sind gestiegen."
	prompt

_PPRestoredText::
	text "Die AP wurden"
	line "aufgefüllt!"
	prompt

_BootedUpTMText::
	text "TM aktiviert!"
	prompt

_BootedUpHMText::
	text "VM aktiviert!"
	prompt

_TeachMachineMoveText::
	text "Sie enthält"
	line "@"
	text_ram wcf4b
	text "!"

	para "@"
	text_ram wcf4b
	text_start
	line "einem #MON"
	cont "beibringen?"
	done

_MonCannotLearnMachineMoveText::
	text_ram wcf4b
	text_start
	line "paßt nicht zu"
	cont "@"
	text_ram wcd6d
	text "."

	para "Es kann"
	line "@"
	text_ram wcf4b
	text_start
	cont "nicht lernen."
	prompt

_ItemUseNotTimeText::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen!"
	prompt

_ItemUseNotYoursToUseText::
	text "Dies gehört Dir"
	line "nicht!"
	prompt

_ItemUseNoEffectText::
	text "Das hätte keinen"
	line "Effekt!"
	prompt

_ThrowBallAtTrainerMonText1::
	text "Der Trainer hat"
	line "den BALL"
	cont "abgeblockt!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "Sei kein Dieb!"
	prompt

_NoCyclingAllowedHereText::
	text "Das Radfahren ist"
	next "hier verboten!"
	prompt

_NoSurfingHereText::
	text "Hier kann nicht"
	line "auf @"
	text_ram wcd6d
	text_start
	cont "gesurft werden!"
	prompt

_BoxFullCannotThrowBallText::
	text "Die #MON-BOX"
	line "ist voll! Das"
	cont "Item kann nicht"
	cont "benutzt werden!"
	prompt
