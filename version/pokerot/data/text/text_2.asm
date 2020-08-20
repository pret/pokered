_AIBattleWithdrawText::
	text_ram wTrainerName
	text " ruft"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "zurück!"
	prompt

_AIBattleUseItemText::
	text_ram wTrainerName
	text_start
	line "gibt @"
	text_ram wcd6d
	text_start
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

_TradeWentToText::
	text_ram wcf4b
	text " geht"
	line "zu @"
	text_ram wGrassRate
	text "."
	done

_TradeForText::
	text "<PLAYER> tauscht"
	line "@"
	text_ram wcf4b
	text_start
	done

_TradeSendsText::
	text "gegen @"
	text_ram wGrassRate
	text "s"
	line "@"
	text_ram wcd6d
	text "."
	done

_TradeWavesFarewellText::
	text_ram wGrassRate
	text " winkt"
	line "zum Abschied, als"
	done

_TradeTransferredText::
	text "sein @"
	text_ram wcd6d
	text_start
	line "übertragen wird."
	done

_TradeTakeCareText::
	text "Kümmere Dich gut"
	line "um @"
	text_ram wcd6d
	text "."
	done

_TradeWillTradeText::
	text_ram wGrassRate
	text " möchte"
	line "@"
	text_ram wcd6d
	text " gegen"
	done

_TradeforText::
	text "<PLAYER>s @"
	text_ram wcf4b
	text_start
	line "tauschen."
	done

_PlaySlotMachineText::
	text "Ein einarmiger"
	line "Bandit! Möchtest"
	cont "Du spielen?"
	done

_OutOfCoinsSlotMachineText::
	text "Mist!"
	line "Ich habe keine"
	cont "Münzen mehr!"
	done

_BetHowManySlotMachineText::
	text "Wie viele Münzen"
	line "möchtest Du"
	cont "setzen?"
	done

_StartSlotMachineText::
	text "Auf geht's! "
	done

_NotEnoughCoinsSlotMachineText::
	text "Du hast nicht"
	line "genug Münzen!"
	prompt

_OneMoreGoSlotMachineText::
	text "Noch eine"
	line "Runde?"
	done

_LinedUpText::
	text "Super! Du hast"
	line "@"
	text_ram wcf4b
	text " Münzen"
	cont "gewonnen!"
	done

_NotThisTimeText::
	text "Vielleicht beim"
	line "nächsten Mal!"
	prompt

_YeahText::
	text "Ja!!!@"
	text_end

_DexSeenOwnedText::
	text "Gesehen: @"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text " PKMN"
	line "Besitz: @"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text " PKMN"
	done

_DexRatingText::
	text_start
	done

_GymStatueText1::
	text_ram wGymCityName
	text_start
	line "PKMN-ARENA"
	cont "LEITUNG:"
	cont "@"
	text_ram wGymLeaderName
	text " "

	para "BISHERIGE SIEGER:"
	line "<RIVAL>"
	done

_GymStatueText2::
	text_ram wGymCityName
	text_start
	line "PKMN-ARENA"
	cont "LEITUNG: "
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "BISHERIGE SIEGER:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

_ViridianCityPokecenterGuyText::
	text "Im PKMN-CENTER"
	line "kannst Du müde,"
	cont "verletzte und"
	cont "besiegte #MON"
	cont "heilen!"
	done

_PewterCityPokecenterGuyText::
	text "Gähn!"

	para "Von PUMMELUFFS"
	line "GESANG werden"
	cont "#MON ganz"
	cont "müde..."

	para "Ich auch..."
	line "Schnarch..."
	done

_CeruleanPokecenterGuyText::
	text "BILL besitzt"
	line "viele #MON!"

	para "Er hat einige"
	line "sehr seltene in"
	cont "seiner Sammlung!"
	done

_LavenderPokecenterGuyText::
	text "TRAGOSSO tragen"
	line "Schädelmasken!"

	para "Man zahlt für sie"
	line "eine Menge Geld!"
	done

_MtMoonPokecenterBenchGuyText::
	text "Wenn Du keine"
	line "weiteren #MON"
	cont "tragen kannst,"
	cont "solltest Du"
	cont "einige via PC"
	cont "ablegen!"
	done

_RockTunnelPokecenterGuyText::
	text "Ich habe gehört,"
	line "daß in LAVANDIA"
	cont "böse GEISTER"
	cont "spuken!"
	done

_UnusedBenchGuyText1::
	text "Ich wünschte, ich"
	line "könnte #MON"
	cont "fangen..."
	done

_UnusedBenchGuyText2::
	text "Nach all dem Spaß"
	line "bin ich nun müde."
	done

_UnusedBenchGuyText3::
	text "Der Leiter der"
	line "SILPH CO."
	cont "versteckt sich in"
	cont "der SAFARI-ZONE."
	done

_VermilionPokecenterGuyText::
	text "Es stimmt, daß"
	line "ein #MON mit"
	cont "einem hohen Level"
	cont "sehr stark ist..."

	para "Allerdings haben"
	line "alle #MON"
	cont "Schwächen. Die"
	cont "richtige Attacke"
	cont "kann sie leicht"
	cont "besiegen!"

	para "Daher gibt es"
	line "kein Universal-"
	cont "#MON."
	done

_CeladonCityPokecenterGuyText::
	text "Wenn ich ein"
	line "FAHRRAD hätte,"
	cont "würde ich den"
	cont "RADWEG benutzen!"
	done

_FuchsiaCityPokecenterGuyText::
	text "Du studierst die"
	line "#MON?"
	cont "Dann gehe in die"
	cont "SAFARI-ZONE."

	para "Dort gibt es"
	line "viele seltene"
	cont "#MON."
	done

_CinnabarPokecenterGuyText::
	text "Brichst Du ihre"
	line "Entwicklung ab,"
	cont "dann können Deine"
	cont "#MON weitere"
	cont "Attacken lernen."

	para "Die weitere"
	line "Entwicklung kann"
	cont "warten, bis sie"
	cont "neue Attacken"
	cont "gelernt haben!"
	done

_SaffronCityPokecenterGuyText1::
	text "Ich wünschte, die"
	line "TOP VIER kämen"
	cont "und stampften das"
	cont "TEAM ROCKET"
	cont "in den Boden!"
	done

_SaffronCityPokecenterGuyText2::
	text "Das TEAM ROCKET"
	line "ist geflohen! Wir"
	cont "können wieder aus"
	cont "dem Haus gehen!"
	done

_CeladonCityHotelText::
	text "Dieser Urlaub war"
	line "eine Idee meiner"
	cont "Schwester!"
	done

_BookcaseText::
	text "Wow! Unmengen"
	line "von Büchern über"
	cont "#MON!"
	done

_NewBicycleText::
	text "Ein brandneues"
	line "FAHRRAD!"
	done

_PushStartText::
	text "Drücke START,"
	line "um das MENÜ"
	cont "aufzurufen!"
	done

_SaveOptionText::
	text "Im MENÜ kannst Du"
	line "unter SICHERN"
	cont "Deinen Spielstand"
	cont "abspeichern."
	done

_StrengthsAndWeaknessesText::
	text "#MON besitzen"
	line "unterschiedliche"
	cont "Attacken, deren"
	cont "Wirkung je nach"
	cont "Gegner variiert."
	done

_TimesUpText::
	text "DURCHSAGE: Gong!"

	para "Die Zeit ist um!"
	prompt

_GameOverText::
	text "DURCHSAGE: Deine"
	line "SAFARI-TOUR ist"
	cont "vorüber!"
	done

_CinnabarGymQuizIntroText::
	text "Willkommen beim"
	line "#MON-Quiz!"

	para "Weißt Du die"
	line "richtige Antwort,"
	cont "dann öffnet sich"
	cont "die Tür!"

	para "Ist die Antwort"
	line "falsch, dann mußt"
	cont "Du kämpfen..."

	para "Je mehr Antworten"
	line "Du weißt, desto"
	cont "fitter sind Deine"
	cont "#MON beim"
	cont "Kampf gegen den"
	cont "ARENALEITER!"

	para "Laß uns beginnen!"
	prompt

_CinnabarQuizQuestionsText1::
	text "Entwickelt sich"
	line "RAUPY zu SMETTBO?"
	done

_CinnabarQuizQuestionsText2::
	text "Gibt es neun"
	line "offizielle"
	cont "#MON-ORDEN?"
	done

_CinnabarQuizQuestionsText3::
	text "Entwickelt sich"
	line "QUAPSEL dreimal?"
	done

_CinnabarQuizQuestionsText4::
	text "Sind DONNER-"
	line "ATTACKEN gegen"
	cont "BODEN-#MON"
	cont "sehr effektiv?"
	done

_CinnabarQuizQuestionsText5::
	text "Unterscheiden"
	line "sich zwei gleiche"
	cont "#MON mit"
	cont "gleichem Level?"
	done

_CinnabarQuizQuestionsText6::
	text "Ist TM28 die "
	line "FROSCH-ATTACKE?"
	done

_CinnabarGymQuizCorrectText::
	text "Und die Antwort"
	line "ist... RICHTIG!"

	para "Geh weiter!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "FALSCH!"
	line "So ein Pech!"
	prompt

_MagazinesText::
	text "#MON-"
	line "Zeitschriften!"

	para "#MON-"
	line "Notizbücher!"

	para "#MON-"
	line "Schaubilder!"
	done

_BillsHouseMonitorText::
	text "Auf dem PC läuft"
	line "ein Programm zur"
	cont "Steuerung des"
	cont "TELEPORTERS."
	done

_BillsHouseInitiatedText::
	text "<PLAYER> hat den"
	line "ZELL-SEPARATOR"
	cont "in Gang gesetzt!@"
	text_end

_BillsHousePokemonListText1::
	text "Ein Liste von"
	line "BILLS LIEBLINGS-"
	cont "#MON!"
	prompt

_BillsHousePokemonListText2::
	text "Welches #MON"
	line "möchtest Du"
	cont "betrachten?"
	done

_OakLabEmailText::
	text "Im Briefkasten"
	line "ist eine E-Mail!"

	para "..."

	para "An alle"
	line "#MON-TRAINER!"

	para "Die TRAINER-ELITE"
	line "der PKMN-LIGA"
	cont "wartet auf mutige"
	cont "Herausforderer!"

	para "Bringt Eure"
	line "stärksten #MON"
	cont "mit und zeigt,"
	cont "wie gut Ihr seid!"

	para "PKMN-LIGA-LEITUNG"
	line "INDIGO-PLATEAU"

	para "PS.: PROF. EICH,"
	line "bitte melden Sie"
	cont "sich bei uns!"
	cont "..."
	done

_GameCornerCoinCaseText::
	text "Du benötigst"
	line "einen MÜNZKORB!"
	done

_GameCornerNoCoinsText::
	text "Du hast keine"
	line "Münzen!"
	done

_GameCornerOutOfOrderText::
	text "AUSSER BETRIEB!"
	done

_GameCornerOutToLunchText::
	text "BIN ZU TISCH!"
	line "Oh, dieser Platz"
	cont "ist besetzt."
	done

_GameCornerSomeonesKeysText::
	text "Da liegt ein"
	line "Schlüsselbund."
	
	para "Der Platz scheint"
	line "besetzt zu sein."
	done

_JustAMomentText::
	text "Warte einen"
	line "Augenblick."
	done

TMNotebookText::
	text "Ein INFOBLATT"
	line "über TM."

	para "..."

	para "Es gibt"
	line "insgesamt 50 TM."

	para "Außerdem gibt es"
	line "fünf VM, die"
	cont "mehrfach nutzbar"
	cont "sind."

	para "SILPH CO.@"
	text_end

_TurnPageText::
	text "Umblättern?"
	done

_ViridianSchoolNotebookText5::
	text "MÄDCHEN: Hey! Laß"
	line "die Finger von"
	cont "meinen Notizen!@"
	text_end

_ViridianSchoolNotebookText1::
	text "Du schaust in"
	line "das Notizbuch!"

	para "Erste Seite..."

	para "Zum Fangen von"
	line "#MON benutzt"
	cont "man #BÄLLE."

	para "Man kann bis zu"
	line "sechs #MON auf"
	cont "einmal tragen."

	para "#MON-TRAINER"
	line "ziehen #MON"
	cont "groß und"
	cont "trainieren sie."
	prompt

_ViridianSchoolNotebookText2::
	text "Zweite Seite..."

	para "Ein #MON bei"
	line "voller Stärke ist"
	cont "schwer zu fangen!"
	cont "Man sollte es"
	cont "erst schwächen."

	para "Feuer, Gift und"
	line "andere Attacken"
	cont "wirken Wunder!"
	prompt

_ViridianSchoolNotebookText3::
	text "Dritte Seite..."

	para "#MON-TRAINER"
	line "suchen einander"
	cont "und lassen ihre"
	cont "#MON kämpfen."

	para "In den"
	line "PKMN-ARENEN"
	cont "finden stets"
	cont "Kämpfe statt."
	prompt

_ViridianSchoolNotebookText4::
	text "Vierte Seite..."

	para "Das Ziel jedes"
	line "#MON-TRAINERS"
	cont "ist es, die acht"
	cont "Leiter der"
	cont "PKMN-ARENEN"
	cont "zu besiegen."

	para "Nur dann darf er"
	line "den TOP VIER in"
	cont "der PKMN-LIGA"
	cont "gegenübertreten!"
	prompt

_EnemiesOnEverySideText::
	text "Wandle Dich"
	line "abhängig vom"
	cont "Gegner!"
	done

_WhatGoesAroundComesAroundText::
	text "Wie die Saat,"
	line "so die Ernte!"
	done

_FightingDojoText::
	text "KAMPFARENA"
	done

_IndigoPlateauHQText::
	text "INDIGO PLATEAU"
	line "#MON-LIGA"
	cont "HAUPTQUARTIER"
	done

_RedBedroomSNESText::
	text "<PLAYER> spielt"
	line "SUPER NINTENDO!"
	cont "...OK! Die Reise"
	cont "kann beginnen!"
	done

_Route15UpstairsBinocularsText::
	text "Du schaust durch"
	line "das Fernrohr..."

	para "Ein großer Vogel"
	line "fliegt anmutig"
	cont "aufs Meer hinaus."
	done

_AerodactylFossilText::
	text "AERODACTYL-Fossil"
	line "Ein urzeitliches"
	cont "und seltenes"
	cont "#MON."
	done

_KabutopsFossilText::
	text "KABUTOPS-Fossil"
	line "Ein urzeitliches"
	cont "und seltenes"
	cont "#MON."
	done

_LinkCableHelpText1::
	text "TIPS FÜR TRAINER"

	para "Die Benutzung des"
	line "Link-Kabels"
	prompt

_LinkCableHelpText2::
	text "Wähle bitte ein"
	line "Themengebiet aus."
	done

_LinkCableInfoText1::
	text "Spricht man die"
	line "Bedienung bei"
	cont "der rechten Theke"
	cont "im PKMN-CENTER"
	cont "an, während zwei"
	cont "GAME BOYS über"
	cont "das Link-Kabel"
	cont "verbunden sind,"
	cont "dann gelangt man"
	cont "in den 2-Spieler-"
	cont "Raum."
	prompt

_LinkCableInfoText2::
	text "Im KOLOSSEUM"
	line "kannst Du gegen"
	cont "einen Freund"
	cont "antreten."
	prompt

_LinkCableInfoText3::
	text "Im HANDELSCENTER"
	line "können #MON"
	cont "getauscht werden."
	prompt

_ViridianSchoolBlackboardText1::
	text "Die Tafel zeigt"
	line "Statuswechsel der"
	cont "#MON während"
	cont "des Kampfes an."
	prompt

_ViridianSchoolBlackboardText2::
	text "Wähle bitte ein"
	line "Themengebiet aus."
	done

_ViridianBlackboardSleepText::
	text "Wenn ein #MON"
	line "schläft, kann es"
	cont "nicht angreifen!"

	para "Ein schlafendes"
	line "#MON wacht"
	cont "auch nach dem"
	cont "Kampf nicht auf."

	para "Benutze"
	line "AUFWECKER, damit"
	cont "es aufwacht."
	prompt

_ViridianBlackboardPoisonText::
	text "Ein vergiftetes"
	line "#MON verliert"
	cont "stetig KP."

	para "Die Wirkung des"
	line "Giftes hält auch"
	cont "nach einem Kampf"
	cont "an."

	para "GEGENGIFT heilt"
	line "Vergiftungen."
	prompt

_ViridianBlackboardPrlzText::
	text "Ein paralysiertes"
	line "#MON"
	cont "verliert an"
	cont "Treffgenauigkeit!"

	para "Die Paralyse hält"
	line "auch nach einem"
	cont "Kampf an."

	para "Man behandelt sie"
	line "mit PARA-HEILER."
	prompt

_ViridianBlackboardBurnText::
	text "Eine Verbrennung"
	line "vermindert Kraft"
	cont "und Stärke. Die"
	cont "KP sinken stetig."

	para "Verbrennungen"
	line "dauern auch nach"
	cont "einem Kampf an."

	para "Man heilt sie mit"
	line "FEUERHEILER."
	prompt

_ViridianBlackboardFrozenText::
	text "Ein eingefrorenes"
	line "#MON ist"
	cont "bewegungsunfähig."

	para "Es behält auch"
	line "nach dem Kampf"
	cont "diesen Zustand"
	cont "bei."

	para "Nur der EISHEILER"
	line "kann es wieder"
	cont "auftauen!"
	prompt

_VermilionGymTrashText::
	text "Hier ist nichts,"
	line "bloß Abfall."
	done

_VermilionGymTrashSuccessText1::
	text "Hey! Hier ist ein"
	line "Hebel versteckt!"
	cont "Ich werde ihn"
	cont "betätigen!"

	para "Das erste Schloß"
	line "wurde entriegelt!@"
	text_end

_VermilionGymTrashSuccessText2::
	text "Hier ist noch ein"
	line "Hebel unter dem"
	cont "Abfall versteckt!"
	cont "Ich betätige ihn!"
	prompt

_VermilionGymTrashSuccessText3::
	text "Das zweite Schloß"
	line "wurde entriegelt!"

	para "Die mechanische"
	line "Tür hat sich"
	cont "geöffnet!@"
	text_end

_VermilionGymTrashFailText::
	text "Nichts! Hier ist"
	line "nur Abfall..."
	cont "Hey! Das Schloß"
	cont "wurde wieder"
	cont "verriegelt!@"
	text_end

_FoundHiddenItemText::
	text "<PLAYER> findet"
	line "@"
	text_ram wcd6d
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "Aber <PLAYER> kann"
	line "keine weiteren"
	cont "Items tragen!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> findet"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " Münzen!@"
	text_end

_FoundHiddenCoins2Text::
	text "<PLAYER> findet"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " Münzen!@"
	text_end

_DroppedHiddenCoinsText::
	text_start
	para "Ups! Ich glaube,"
	line "ich habe ein paar"
	cont "Münzen verloren!"
	done

_IndigoPlateauStatuesText1::
	text "INDIGO PLATEAU"
	prompt

_IndigoPlateauStatuesText2::
	text "Das große Ziel"
	line "aller Trainer ist"
	cont "die PKMN-LIGA!"
	done

_IndigoPlateauStatuesText3::
	text "Das PKMN-LIGA-"
	line "HAUPTQUARTIER"
	cont "ist die höchste"
	cont "PKMN-AUTORITÄT!"
	done

_PokemonBooksText::
	text "Wow! Unmengen"
	line "Bücher über"
	cont "#MON!"
	done

_DiglettSculptureText::
	text "Eine Plastik, die"
	line "DIGDA darstellt."
	done

_ElevatorText::
	text "Dies ist ein"
	line "Aufzug."
	done

_TownMapText::
	text "Eine KARTE!@"
	text_end

_PokemonStuffText::
	text "Wow! Jede Menge"
	line "#MON-"
	cont "Gegenstände!"
	done

_OutOfSafariBallsText::
	text "DURCHSAGE: Gong!"

	para "Du hast keine"
	line "SAFARIBÄLLE mehr!"
	prompt

_WildRanText::
	text "Das wilde"
	line "@"
	text_ram wEnemyMonNick
	text " ist"
	cont "geflüchtet!"
	prompt

_EnemyRanText::
	text_ram wEnemyMonNick
	text_start
	line "ist geflüchtet!"
	prompt

_HurtByPoisonText::
	text "Das Gift schadet"
	line "<USER>!"
	prompt

_HurtByBurnText::
	text "Die Verbrennung"
	line "schadet"
	cont "<USER>!"
	prompt

_HurtByLeechSeedText::
	text "Die SCHMAROTZER-"
	line "ATTACKE schadet"
	cont "<USER>!"
	prompt

_EnemyMonFaintedText::
	text_ram wEnemyMonNick
	text_start
	line "wurde besiegt!"
	prompt

_MoneyForWinningText::
	text "<PLAYER>"
	line "gewinnt ¥@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

_TrainerDefeatedText::
	text "<PLAYER> besiegt"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_PlayerMonFaintedText::
	text_ram wBattleMonNick
	text_start
	line "wurde besiegt!"
	prompt

_UseNextMonText::
	text "Nächstes #MON"
	line "einsetzen?"
	done

_Sony1WinText::
	text "<RIVAL>: Ja! Ich"
	line "bin der Beste!"
	prompt

_PlayerBlackedOutText2::
	text "Alle #MON von"
	line "<PLAYER> wurden"
	cont "besiegt!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	prompt

_LinkBattleLostText::
	text_ram wTrainerName
	text " hat"
	line "<PLAYER> besiegt!"
	prompt

_TrainerAboutToUseText::
	text_ram wTrainerName
	text " wird"
	line "@"
	text_ram wEnemyMonNick
	text " in den"
	cont "Kampf schicken!"

	para "Möchtest Du das"
	line "#MON wechseln?"
	done

_TrainerSentOutText::
	text_ram wTrainerName
	text " setzt"
	line "@"
	text_ram wEnemyMonNick
	text " ein!"
	done

_NoWillText::
	text "Das #MON"
	line "wurde besiegt!"
	prompt

_CantEscapeText::
	text "Du kannst nicht"
	line "davonlaufen!"
	prompt

_NoRunningText::
	text "Man kann aus"
	line "TRAINER-KÄMPFEN"
	cont "nicht fliehen!"
	prompt

_GotAwayText::
	text "Du bist"
	line "entkommen!"
	prompt

_ItemsCantBeUsedHereText::
	text "Du kannst hier"
	line "keine Items "
	cont "einsetzen."
	prompt

_AlreadyOutText::
	text_ram wBattleMonNick
	text_start
	line "kämpft bereits!"
	prompt

_MoveNoPPText::
	text "Du hast keine AP"
	line "für diese Attacke"
	cont "mehr übrig!"
	prompt

_MoveDisabledText::
	text "Diese Attacke"
	line "ist blockiert!"
	prompt

_NoMovesLeftText::
	text_ram wBattleMonNick
	text " hat"
	line "keine Attacken"
	cont "mehr übrig!"
	done

_MultiHitText::
	text "Der Gegner wurde"
	line "@"
	text_decimal wPlayerNumHits,1,1
	text " mal getroffen!"
	prompt

_ScaredText::
	text_ram wBattleMonNick
	text " kann"
	line "sich vor Angst"
	cont "nicht bewegen!"
	prompt

_GetOutText::
	text "GEIST: Hau ab..."
	line "Verschwinde..."
	prompt

_FastAsleepText::
	text "<USER>"
	line "schläft!"
	prompt

_WokeUpText::
	text "<USER>"
	line "ist aufgewacht!"
	prompt

_IsFrozenText::
	text "<USER>"
	line "ist festgefroren!"
	prompt

_FullyParalyzedText::
	text "<USER>"
	line "ist paralysiert!"
	prompt

_FlinchedText::
	text "<USER>"
	line "ist ausgewichen!"
	prompt

_MustRechargeText::
	text "<USER>"
	line "muß sich wieder "
	cont "aufladen!"
	prompt

_DisabledNoMoreText::
	text "<USER>"
	line "wird nicht mehr"
	cont "blockiert!"
	prompt

_IsConfusedText::
	text "<USER>"
	line "ist verwirrt!"
	prompt

_HurtItselfText::
	text "Es hat sich vor"
	line "Verwirrung selbst"
	cont "verletzt!"
	prompt

_ConfusedNoMoreText::
	text "<USER>"
	line "ist nicht mehr"
	cont "verwirrt!"
	prompt

_SavingEnergyText::
	text "<USER>"
	line "sammelt Kräfte!"
	prompt

_UnleashedEnergyText::
	text "<USER>"
	line "erzeugt Energie!"
	prompt

_ThrashingAboutText::
	text "<USER>"
	line "schlägt um sich!"
	done

_AttackContinuesText::
	text "<USER>"
	line "greift weiter an!"
	done

_CantMoveText::
	text "<USER>"
	line "ist gelähmt!"
	prompt

_MoveIsDisabledText::
	text "<USER>s"
	line "@"
	text_ram wcd6d
	text " ist"
	cont "blockiert!"
	prompt

_MonName1Text::
	text "<USER>@"
	text_end

_Used1Text::
	text_start
	line "ben. @"
	text_end

_Used2Text::
	text_start
	line "ben. @"
	text_end

_InsteadText::
	text "stattdessen"
	cont "@"
	text_end

_CF4BText::
	text_ram wcf4b
	text "@"

_ExclamationPoint1Text::
	text "!"
	done

_ExclamationPoint2Text::
	text "!"
	done

_ExclamationPoint3Text::
	text "!"
	done

_ExclamationPoint4Text::
	text "!"
	done

_ExclamationPoint5Text::
	text "!"
	done

_AttackMissedText::
	text "<USER>s"
	line "Attacke ging"
	cont "daneben!"
	prompt

_KeptGoingAndCrashedText::
	text "<USER>"
	line "verfehlt das Ziel"
	cont "und fällt hin!"
	prompt

_UnaffectedText::
	text "<TARGET>"
	line "ist unversehrt!"
	prompt

_DoesntAffectMonText::
	text "Keine Wirkung auf"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "Volltreffer!"
	prompt

_OHKOText::
	text "K.O.-TREFFER!"
	prompt

_LoafingAroundText::
	text_ram wBattleMonNick
	text_start
	line "faulenzt!"
	prompt

_BeganToNapText::
	text_ram wBattleMonNick
	text " hält"
	line "ein Nickerchen!"
	prompt

_WontObeyText::
	text_ram wBattleMonNick
	text " will"
	line "nicht gehorchen!"
	prompt

_TurnedAwayText::
	text_ram wBattleMonNick
	text_start
	line "wendet sich ab!"
	prompt

_IgnoredOrdersText::
	text_ram wBattleMonNick
	text_start
	line "mißachtet die"
	cont "Befehle!"
	prompt

_SubstituteTookDamageText::
	text "Der DELEGATOR hat"
	line "<TARGET>"
	cont "vor Schaden"
	cont "bewahrt!"
	prompt

_SubstituteBrokeText::
	text "<TARGET>s"
	line "DELEGATOR wurde"
	cont "zerstört!"
	prompt

_BuildingRageText::
	text "<USER>"
	line "verfällt in"
	cont "RASEREI!"
	prompt

_MirrorMoveFailedText::
	text "Der SPIEGELTRICK"
	next "war erfolglos!"
	prompt

_HitXTimesText::
	text_decimal wEnemyNumHits, 1, 1
	text " Mal getroffen!"
	prompt

_GainedText::
	text_ram wcd6d
	text " erhält"
	line "@"
	text_end

_WithExpAllText::
	text "mittels EP-TEILER"
	cont "@"
	text_end

_BoostedText::
	text "spezielle"
	cont "@"
	text_end

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	text " EP!"
	prompt

_GrewLevelText::
	text_ram wcd6d
	text_start
	line "erreicht"
	cont "Level @"
	text_decimal wCurEnemyLVL, 1, 3
	text "!@"
	text_end

_WildMonAppearedText::
	text "Ein wildes"
	line "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

_HookedMonAttackedText::
	text "Das gefangene"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "greift an!"
	prompt

_EnemyAppearedText::
	text_ram wEnemyMonNick
	text_start
	line "taucht auf!"
	prompt

_TrainerWantsToFightText::
	text_ram wTrainerName
	text_start
	line "möchte kämpfen!"
	prompt

_UnveiledGhostText::
	text "Das SILPH SCOPE"
	line "hat den GEIST"
	cont "identifiziert!"
	prompt

_GhostCantBeIDdText::
	text "Mist! Dieser"
	line "GEIST ist nicht"
	cont "identifizierbar!"
	prompt

_GoText::
	text "Los! @"
	text_end

_DoItText::
	text "Los! @"
	text_end

_GetmText::
	text "Los! @"
	text_end

_EnemysWeakText::
	text "Mach ihn fertig!"
	line "Los! @"
	text_end

_PlayerMon1Text::
	text_ram wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	text_ram wBattleMonNick
	text ", @"
	text_end

_EnoughText::
	text "genug!@"
	text_end

_OKExclamationText::
	text "OK!@"
	text_end

_GoodText::
	text "super!@"
	text_end

_ComeBackText::
	text_start
	line "Komm zurück!"
	done

_SuperEffectiveText::
	text "Die Attacke ist"
	line "sehr effektiv!"
	prompt

_NotVeryEffectiveText::
	text "Die Attacke ist"
	line "nicht effektiv..."
	prompt

_SafariZoneEatingText::
	text "Das wilde"
	line "@"
	text_ram wEnemyMonNick
	text " frißt!"
	prompt

_SafariZoneAngryText::
	text "Das wilde"
	line "@"
	text_ram wEnemyMonNick
	text " ist"
	cont "wütend!"
	prompt

; money related
_PickUpPayDayMoneyText::
	text "<PLAYER> sammelt"
	line "¥@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text " auf!"
	prompt

_ClearSaveDataText::
	text "Alle Spielstände"
	line "löschen?"
	done

_WhichFloorText::
	text "Wähle ein"
	line "Stockwerk aus:"
	done

_PartyMenuNormalText::
	text "Wähle ein #MON"
	line "aus!"
	done

_PartyMenuItemUseText::
	text "Welches #MON"
	line "erhält das Item?"
	done

_PartyMenuBattleText::
	text "Welches #MON"
	line "soll antreten?"
	done

_PartyMenuUseTMText::
	text "Wähle ein"
	line "#MON aus!"
	done

_PartyMenuSwapMonText::
	text "Mit wem soll das"
	line "#MON tauschen?"
	done

_PotionText::
	text_ram wcd6d
	text " erhält"
	line "@"
	text_decimal wHPBarHPDifference, 2, 3
	text " Kraftpunkte!"
	done

_AntidoteText::
	text "Die Vergiftung"
	line "wurde geheilt!"
	done

_ParlyzHealText::
	text "Die Paralyse"
	line "wurde aufgehoben!"
	done

_BurnHealText::
	text_ram wcd6d
	text_start
	line "wurde geheilt!"
	done

_IceHealText::
	text_ram wcd6d
	text_start
	line "wurde aufgetaut!"
	done

_AwakeningText::
	text_ram wcd6d
	text_start
	line "ist aufgewacht!"
	done

_FullHealText::
	text_ram wcd6d
	text " wurde"
	line "komplett geheilt!"
	done

_ReviveText::
	text_ram wcd6d
	text_start
	line "ist wieder fit!"
	done

_RareCandyText::
	text_ram wcd6d
	text_start
	line "erreicht"
	cont "Level  @"
	text_decimal wCurEnemyLVL, 1, 3
	text "!@"
	text_end

_TurnedOnPC1Text::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_AccessedBillsPCText::
	text "Die Verbindung zu"
	line "BILLS PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_AccessedSomeonesPCText::
	text "Die Verbindung"
	line "zum GAST-PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_AccessedMyPCText::
	text "Die Verbindung zu"
	line "Deinem PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das ITEM-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_WhatDoYouWantText::
	text "Wähle einen"
	line "Menüpunkt aus."
	done

_WhatToDepositText::
	text "Welches Item soll"
	line "gelagert werden?"
	done

_DepositHowManyText::
	text "Anzahl?"
	done

_ItemWasStoredText::
	text_ram wcd6d
	text_start
	line "wurde gelagert."
	prompt

_NothingToDepositText::
	text "Du hast keine"
	line "Items, die Du"
	cont "lagern könntest."
	prompt

_NoRoomToStoreText::
	text "Die"
	line "Lagerkapazität"
	cont "ist erschöpft."
	prompt

_WhatToWithdrawText::
	text "Welches Item"
	line "möchtest Du"
	cont "mitnehmen?"
	done

_WithdrawHowManyText::
	text "Anzahl?"
	done

_WithdrewItemText::
	text_ram wcd6d
	text_start
	line "mitgenommen."
	prompt

_NothingStoredText::
	text "Hier lagern keine"
	line "Items."
	prompt

_CantCarryMoreText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "tragen."
	prompt

_WhatToTossText::
	text "Welches Item"
	line "möchtest Du"
	cont "ausmustern?"
	done

_TossHowManyText::
	text "Anzahl?"
	done

_AccessedHoFPCText::
	text "Verbindung zur"
	line "PKMN-LIGA-WEBSITE"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf die Datenbank"
	cont "der RUHMESHALLE."
	prompt

_SwitchOnText::
	text "Schalte ein!"
	prompt

_WhatText::
	text "Wähle!"
	done

_DepositWhichMonText::
	text "Welches #MON"
	line "lagern?"
	done

_MonWasStoredText::
	text_ram wcf4b
	text " wurde"
	line "in Box @"
	text_ram wBoxNumString
	text_start
	cont "transferiert."
	prompt

_CantDepositLastMonText::
	text "Du kannst Dein"
	line "letztes #MON"
	cont "nicht lagern!"
	prompt

_BoxFullText::
	text "In dieser Box ist"
	line "kein Platz für"
	cont "weitere #MON."
	prompt

_MonIsTakenOutText::
	text_ram wcf4b
	text " wurde"
	line "transferiert."
	
	para "@"
	text_ram wcf4b
	text_start
	line "erhalten."
	prompt

_NoMonText::
	text "Diese Box enthält"
	line "keine #MON!"
	prompt

_CantTakeMonText::
	text "Du kannst keine"
	line "#MON mehr"
	cont "tragen!"

	para "Du mußt erst"
	line "#MON via PC"
	cont "lagern."
	prompt

_ReleaseWhichMonText::
	text "Welches #MON"
	line "soll freigelassen"
	cont "werden?"
	done

_OnceReleasedText::
	text "Ist es erstmal"
	line "freigelassen,"
	cont "kommt @"
	text_ram wcf4b
	text_start
	cont "nicht wieder"
	cont "zurück. OK?"
	done

_MonWasReleasedText::
	text_ram wcf4b
	text " wurde"
	line "freigelassen. Leb"
	cont "wohl, @"

_CF4BExclamationText::
	text_ram wcf4b
	text "!"
	prompt

_RequireCoinCaseText::
	text "Du benötigst"
	line "einen MÜNZKORB!@"
	text_end

_ExchangeCoinsForPrizesText::
	text "Wir tauschen"
	line "Münzen gegen"
	cont "Preise ein."
	prompt

_WhichPrizeText::
	text "Welcher Preis"
	line "soll es sein?"
	done

_HereYouGoText::
	text "Hier ist Dein"
	line "Preis!@"
	text_end

_SoYouWantPrizeText::
	text "Du möchtest also"
	line "@"
	text_ram wcd6d
	text_start
	cont "haben?"
	done

_SorryNeedMoreCoinsText::
	text "Schade. Du hast"
	line "zu wenig Münzen!@"
	text_end

_OopsYouDontHaveEnoughRoomText::
	text "Ups! Du hast"
	line "momentan keinen"
	cont "Platz dafür!@"
	text_end

_OhFineThenText::
	text "Dann ist ja alles"
	line "klar.@"
	text_end

_GetDexRatedText::
	text "Soll Dein #DEX"
	line "bewertet werden?"
	done

_ClosedOaksPCText::
	text "Die Verbindung zu"
	line "PROF. EICHS PC"
	cont "wurde getrennt.@"
	text_end

_AccessedOaksPCText::
	text "Die Verbindung zu"
	line "PROF. EICHS PC"
	cont "wurde erstellt."

	para "Du hast Zugriff"
	line "auf die #DEX-"
	cont "BEWERTUNG."
	prompt

_WhereWouldYouLikeText::
	text "Wohin möchtest"
	line "Du gehen?"
	done

_PleaseWaitText::
	text "OK. Bitte warte"
	line "einen Augenblick!"
	done

_LinkCanceledText::
	text "Die Verbindung"
	line "wurde getrennt."
	done

_OakSpeechText1::
	text "Hallo! Herzlich"
	line "Willkommen in der"
	cont "Welt der #MON!"

	para "Mein Name ist"
	line "EICH! Man nennt"
	cont "mich den #MON-"
	cont "PROFESSOR!"
	prompt

_OakSpeechText2A::
	text "Diese Welt wird"
	line "von Wesen"
	cont "bewohnt, die man"
	cont "#MON nennt!@"
	text_end

_OakSpeechText2B::
	text_start
	
	para "Für manche Leute"
	line "sind #MON"
	cont "Haustiere, andere"
	cont "tragen Kämpfe mit"
	cont "ihnen aus."

	para "Ich selbst..."

	para "...habe mein"
	line "Hobby zum Beruf"
	cont "gemacht und"
	cont "studiere #MON."
	prompt

_IntroducePlayerText::
	text "Wie lautet Dein"
	line "Name?"
	prompt

_IntroduceRivalText::
	text "Dies ist mein"
	line "Enkel."
	cont "Von jeher wollt"
	cont "Ihr einander"
	cont "übertrumpfen!"

	para "Hmm, wie war noch"
	line "gleich sein Name?"
	prompt

_OakSpeechText3::
	text "<PLAYER>!"

	para "Eine unglaubliche"
	line "Reise in die Welt"
	cont "der #MON"
	cont "erwartet Dich!"

	para "Eine Welt voller"
	line "Wunder, Abenteuer"
	cont "und Geheimnisse!"
	cont "Kurz gesagt, ein"
	cont "Traum wird wahr!"
	done

_DoYouWantToNicknameText::
	text "Möchtest Du"
	line "@"
	text_ram wcd6d
	text " einen"
	cont "Spitznamen geben?"
	done

_YourNameIsText::
	text "Richtig! Dein"
	line "Name ist <PLAYER>!"
	prompt

_HisNameIsText::
	text "<RIVAL>! Stimmt!"
	line "Es lag mir auf"
	cont "der Zunge!"
	prompt

_WillBeTradedText::
	text_ram wNameOfPlayerMonToBeTraded
	text " soll"
	line "gegen @"
	text_ram wcd6d
	text_start
	cont "getauscht werden."
	done

_TextIDErrorText::
	text_decimal hSpriteIndexOrTextID,1,2
	text " FEHLER"
	done

_ContCharText::
	text "<_CONT>@"
	text_end
