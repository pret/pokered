; Explicit WLA-DX expansion of RGBDS text macros from data/text/text_2.asm.
_AIBattleWithdrawText::
	.DB TX_RAM
	.DW wTrainerName
	.DB TX_START, " with-"
	.DB "<LINE>", "drew @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START, "!"
	.DB "<PROMPT>"

_AIBattleUseItemText::
	.DB TX_RAM
	.DW wTrainerName
	.DB TX_START
	.DB "<LINE>", "used @"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.DB "<CONT>", "on @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START, "!"
	.DB "<PROMPT>"

_TradeWentToText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " went"
	.DB "<LINE>", "to @"
	.DB TX_RAM
	.DW wLinkEnemyTrainerName
	.DB TX_START, "."
	.DB "<DONE>"

_TradeForText::
	.DB TX_START, "For <PLAYER>'s"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, ","
	.DB "<DONE>"

_TradeSendsText::
	.DB TX_RAM
	.DW wLinkEnemyTrainerName
	.DB TX_START, " sends"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "."
	.DB "<DONE>"

_TradeWavesFarewellText::
	.DB TX_RAM
	.DW wLinkEnemyTrainerName
	.DB TX_START, " waves"
	.DB "<LINE>", "farewell as"
	.DB "<DONE>"

_TradeTransferredText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " is"
	.DB "<LINE>", "transferred."
	.DB "<DONE>"

_TradeTakeCareText::
	.DB TX_START, "Take good care of"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "."
	.DB "<DONE>"

_TradeWillTradeText::
	.DB TX_RAM
	.DW wLinkEnemyTrainerName
	.DB TX_START, " will"
	.DB "<LINE>", "trade @"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.DB "<DONE>"

_TradeforText::
	.DB TX_START, "for <PLAYER>'s"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "."
	.DB "<DONE>"

_PlaySlotMachineText::
	.DB TX_START, "A slot machine!"
	.DB "<LINE>", "Want to play?"
	.DB "<DONE>"

_OutOfCoinsSlotMachineText::
	.DB TX_START, "Darn!"
	.DB "<LINE>", "Ran out of coins!"
	.DB "<DONE>"

_BetHowManySlotMachineText::
	.DB TX_START, "Bet how many"
	.DB "<LINE>", "coins?"
	.DB "<DONE>"

_StartSlotMachineText::
	.DB TX_START, "Start!"
	.DB "<DONE>"

_NotEnoughCoinsSlotMachineText::
	.DB TX_START, "Not enough"
	.DB "<LINE>", "coins!"
	.DB "<PROMPT>"

_OneMoreGoSlotMachineText::
	.DB TX_START, "One more "
	.DB "<LINE>", "go?"
	.DB "<DONE>"

_LinedUpText::
	.DB TX_START, " lined up!"
	.DB "<LINE>", "Scored @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " coins!"
	.DB "<DONE>"

_NotThisTimeText::
	.DB TX_START, "Not this time!"
	.DB "<PROMPT>"

_YeahText::
	.DB TX_START, "Yeah!@"
	.DB TX_END

_DexSeenOwnedText::
	.DB TX_START, "#DEX   Seen:@"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	.DB TX_START
	.DB "<LINE>", "         Owned:@"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	.DB TX_END

_DexRatingText::
	.DB TX_START, "#DEX Rating<COLON>"
	.DB "<DONE>"

_GymStatueText1::
	.DB TX_RAM
	.DW wGymCityName
	.DB TX_START
	.DB "<LINE>", "#MON GYM"
	.DB "<CONT>", "LEADER: @"
	.DB TX_RAM
	.DW wGymLeaderName
	.DB TX_START

	.DB "<PARA>", "WINNING TRAINERS:"
	.DB "<LINE>", "<RIVAL>"
	.DB "<DONE>"

_GymStatueText2::
	.DB TX_RAM
	.DW wGymCityName
	.DB TX_START
	.DB "<LINE>", "#MON GYM"
	.DB "<CONT>", "LEADER: @"
	.DB TX_RAM
	.DW wGymLeaderName
	.DB TX_START

	.DB "<PARA>", "WINNING TRAINERS:"
	.DB "<LINE>", "<RIVAL>"
	.DB "<CONT>", "<PLAYER>"
	.DB "<DONE>"

_ViridianCityPokecenterGuyText::
	.DB TX_START, "#MON CENTERs"
	.DB "<LINE>", "heal your tired,"
	.DB "<CONT>", "hurt or fainted"
	.DB "<CONT>", "#MON!"
	.DB "<DONE>"

_PewterCityPokecenterGuyText::
	.DB TX_START, "Yawn!"

	.DB "<PARA>", "When JIGGLYPUFF"
	.DB "<LINE>", "sings, #MON"
	.DB "<CONT>", "get drowsy..."

	.DB "<PARA>", "...Me too..."
	.DB "<LINE>", "Snore..."
	.DB "<DONE>"

_CeruleanPokecenterGuyText::
	.DB TX_START, "BILL has lots of"
	.DB "<LINE>", "#MON!"

	.DB "<PARA>", "He collects rare"
	.DB "<LINE>", "ones too!"
	.DB "<DONE>"

_LavenderPokecenterGuyText::
	.DB TX_START, "CUBONEs wear"
	.DB "<LINE>", "skulls, right?"

	.DB "<PARA>", "People will pay a"
	.DB "<LINE>", "lot for one!"
	.DB "<DONE>"

_MtMoonPokecenterBenchGuyText::
	.DB TX_START, "If you have too"
	.DB "<LINE>", "many #MON, you"
	.DB "<CONT>", "should store them"
	.DB "<CONT>", "via PC!"
	.DB "<DONE>"

_RockTunnelPokecenterGuyText::
	.DB TX_START, "I heard that"
	.DB "<LINE>", "GHOSTs haunt"
	.DB "<CONT>", "LAVENDER TOWN!"
	.DB "<DONE>"

_UnusedBenchGuyText1::
	.DB TX_START, "I wish I could"
	.DB "<LINE>", "catch #MON."
	.DB "<DONE>"

_UnusedBenchGuyText2::
	.DB TX_START, "I'm tired from"
	.DB "<LINE>", "all the fun..."
	.DB "<DONE>"

_UnusedBenchGuyText3::
	.DB TX_START, "SILPH's manager"
	.DB "<LINE>", "is hiding in the"
	.DB "<CONT>", "SAFARI ZONE."
	.DB "<DONE>"

_VermilionPokecenterGuyText::
	.DB TX_START, "It is true that a"
	.DB "<LINE>", "higher level"
	.DB "<CONT>", "#MON will be"
	.DB "<CONT>", "more powerful..."

	.DB "<PARA>", "But, all #MON"
	.DB "<LINE>", "will have weak"
	.DB "<CONT>", "points against"
	.DB "<CONT>", "specific types."

	.DB "<PARA>", "So, there is no"
	.DB "<LINE>", "universally"
	.DB "<CONT>", "strong #MON."
	.DB "<DONE>"

_CeladonCityPokecenterGuyText::
	.DB TX_START, "If I had a BIKE,"
	.DB "<LINE>", "I would go to"
	.DB "<CONT>", "CYCLING ROAD!"
	.DB "<DONE>"

_FuchsiaCityPokecenterGuyText::
	.DB TX_START, "If you're studying "
	.DB "<LINE>", "#MON, visit"
	.DB "<CONT>", "the SAFARI ZONE."

	.DB "<PARA>", "It has all sorts"
	.DB "<LINE>", "of rare #MON."
	.DB "<DONE>"

_CinnabarPokecenterGuyText::
	.DB TX_START, "#MON can still"
	.DB "<LINE>", "learn techniques"
	.DB "<CONT>", "after canceling"
	.DB "<CONT>", "evolution."

	.DB "<PARA>", "Evolution can wait"
	.DB "<LINE>", "until new moves"
	.DB "<CONT>", "have been learned."
	.DB "<DONE>"

_SaffronCityPokecenterGuyText1::
	.DB TX_START, "It would be great"
	.DB "<LINE>", "if the ELITE FOUR"
	.DB "<CONT>", "came and stomped"
	.DB "<CONT>", "TEAM ROCKET!"
	.DB "<DONE>"

_SaffronCityPokecenterGuyText2::
	.DB TX_START, "TEAM ROCKET took"
	.DB "<LINE>", "off! We can go"
	.DB "<CONT>", "out safely again!"
	.DB "<CONT>", "That's great!"
	.DB "<DONE>"

_CeladonCityHotelText::
	.DB TX_START, "My sis brought me"
	.DB "<LINE>", "on this vacation!"
	.DB "<DONE>"

_BookcaseText::
	.DB TX_START, "Crammed full of"
	.DB "<LINE>", "#MON books!"
	.DB "<DONE>"

_NewBicycleText::
	.DB TX_START, "A shiny new"
	.DB "<LINE>", "BICYCLE!"
	.DB "<DONE>"

_PushStartText::
	.DB TX_START, "Push START to"
	.DB "<LINE>", "open the MENU!"
	.DB "<DONE>"

_SaveOptionText::
	.DB TX_START, "The SAVE option is"
	.DB "<LINE>", "on the MENU"
	.DB "<CONT>", "screen."
	.DB "<DONE>"

_StrengthsAndWeaknessesText::
	.DB TX_START, "All #MON types"
	.DB "<LINE>", "have strong and"
	.DB "<CONT>", "weak points"
	.DB "<CONT>", "against others."
	.DB "<DONE>"

_TimesUpText::
	.DB TX_START, "PA: Ding-dong!"

	.DB "<PARA>", "Time's up!"
	.DB "<PROMPT>"

_GameOverText::
	.DB TX_START, "PA: Your SAFARI"
	.DB "<LINE>", "GAME is over!"
	.DB "<DONE>"

_CinnabarGymQuizIntroText::
	.DB TX_START, "#MON Quiz!"

	.DB "<PARA>", "Get it right and"
	.DB "<LINE>", "the door opens to"
	.DB "<CONT>", "the next room!"

	.DB "<PARA>", "Get it wrong and"
	.DB "<LINE>", "face a trainer!"

	.DB "<PARA>", "If you want to"
	.DB "<LINE>", "conserve your"
	.DB "<CONT>", "#MON for the"
	.DB "<CONT>", "GYM LEADER..."

	.DB "<PARA>", "Then get it right!"
	.DB "<LINE>", "Here we go!"
	.DB "<PROMPT>"

_CinnabarQuizQuestionsText1::
	.DB TX_START, "CATERPIE evolves"
	.DB "<LINE>", "into BUTTERFREE?"
	.DB "<DONE>"

_CinnabarQuizQuestionsText2::
	.DB TX_START, "There are 9"
	.DB "<LINE>", "certified #MON"
	.DB "<CONT>", "LEAGUE BADGEs?"
	.DB "<DONE>"

_CinnabarQuizQuestionsText3::
	.DB TX_START, "POLIWAG evolves 3"
	.DB "<LINE>", "times?"
	.DB "<DONE>"

_CinnabarQuizQuestionsText4::
	.DB TX_START, "Are thunder moves"
	.DB "<LINE>", "effective against"
	.DB "<CONT>", "ground element-"
	.DB "<CONT>", "type #MON?"
	.DB "<DONE>"

_CinnabarQuizQuestionsText5::
	.DB TX_START, "#MON of the"
	.DB "<LINE>", "same kind and"
	.DB "<CONT>", "level are not"
	.DB "<CONT>", "identical?"
	.DB "<DONE>"

_CinnabarQuizQuestionsText6::
	.DB TX_START, "TM28 contains"
	.DB "<LINE>", "TOMBSTONER?"
	.DB "<DONE>"

_CinnabarGymQuizCorrectText::
	.DB TX_START, "You're absolutely"
	.DB "<LINE>", "correct!"

	.DB "<PARA>", "Go on through!@"
	.DB TX_END

_CinnabarGymQuizIncorrectText::
	.DB TX_START, "Sorry! Bad call!"
	.DB "<PROMPT>"

_MagazinesText::
	.DB TX_START, "#MON magazines!"

	.DB "<PARA>", "#MON notebooks!"

	.DB "<PARA>", "#MON graphs!"
	.DB "<DONE>"

_BillsHouseMonitorText::
	.DB TX_START, "TELEPORTER is"
	.DB "<LINE>", "displayed on the"
	.DB "<CONT>", "PC monitor."
	.DB "<DONE>"

_BillsHouseInitiatedText::
	.DB TX_START, "<PLAYER> initiated"
	.DB "<LINE>", "TELEPORTER's Cell"
	.DB "<CONT>", "Separator!@"
	.DB TX_END

_BillsHousePokemonListText1::
	.DB TX_START, "BILL's favorite"
	.DB "<LINE>", "#MON list!"
	.DB "<PROMPT>"

_BillsHousePokemonListText2::
	.DB TX_START, "Which #MON do"
	.DB "<LINE>", "you want to see?"
	.DB "<DONE>"

_OakLabEmailText::
	.DB TX_START, "There's an e-mail"
	.DB "<LINE>", "message here!"

	.DB "<PARA>", "..."

	.DB "<PARA>", "Calling all"
	.DB "<LINE>", "#MON trainers!"

	.DB "<PARA>", "The elite trainers"
	.DB "<LINE>", "of #MON LEAGUE"
	.DB "<CONT>", "are ready to take"
	.DB "<CONT>", "on all comers!"

	.DB "<PARA>", "Bring your best"
	.DB "<LINE>", "#MON and see"
	.DB "<CONT>", "how you rate as a"
	.DB "<CONT>", "trainer!"

	.DB "<PARA>", "#MON LEAGUE HQ"
	.DB "<LINE>", "INDIGO PLATEAU"

	.DB "<PARA>", "PS: PROF.OAK,"
	.DB "<LINE>", "please visit us!"
	.DB "<CONT>", "..."
	.DB "<DONE>"

_GameCornerCoinCaseText::
	.DB TX_START, "A COIN CASE is"
	.DB "<LINE>", "required!"
	.DB "<DONE>"

_GameCornerNoCoinsText::
	.DB TX_START, "You don't have"
	.DB "<LINE>", "any coins!"
	.DB "<DONE>"

_GameCornerOutOfOrderText::
	.DB TX_START, "OUT OF ORDER"
	.DB "<LINE>", "This is broken."
	.DB "<DONE>"

_GameCornerOutToLunchText::
	.DB TX_START, "OUT TO LUNCH"
	.DB "<LINE>", "This is reserved."
	.DB "<DONE>"

_GameCornerSomeonesKeysText::
	.DB TX_START, "Someone's keys!"
	.DB "<LINE>", "They'll be back."
	.DB "<DONE>"

_JustAMomentText::
	.DB TX_START, "Just a moment."
	.DB "<DONE>"

TMNotebookText::
	.DB TX_START, "It's a pamphlet"
	.DB "<LINE>", "on TMs."

	.DB "<PARA>", "..."

	.DB "<PARA>", "There are 50 TMs"
	.DB "<LINE>", "in all."

	.DB "<PARA>", "There are also 5"
	.DB "<LINE>", "HMs that can be"
	.DB "<CONT>", "used repeatedly."

	.DB "<PARA>", "SILPH CO.@"
	.DB TX_END

_TurnPageText::
	.DB TX_START, "Turn the page?"
	.DB "<DONE>"

_ViridianSchoolNotebookText5::
	.DB TX_START, "GIRL: Hey! Don't"
	.DB "<LINE>", "look at my notes!@"
	.DB TX_END

_ViridianSchoolNotebookText1::
	.DB TX_START, "Looked at the"
	.DB "<LINE>", "notebook!"

	.DB "<PARA>", "First page..."

	.DB "<PARA>", "# BALLs are"
	.DB "<LINE>", "used to catch"
	.DB "<CONT>", "#MON."

	.DB "<PARA>", "Up to 6 #MON"
	.DB "<LINE>", "can be carried."

	.DB "<PARA>", "People who raise"
	.DB "<LINE>", "and make #MON"
	.DB "<CONT>", "fight are called"
	.DB "<CONT>", "#MON trainers."
	.DB "<PROMPT>"

_ViridianSchoolNotebookText2::
	.DB TX_START, "Second page..."

	.DB "<PARA>", "A healthy #MON"
	.DB "<LINE>", "may be hard to"
	.DB "<CONT>", "catch, so weaken"
	.DB "<CONT>", "it first!"

	.DB "<PARA>", "Poison, burns and"
	.DB "<LINE>", "other damage are"
	.DB "<CONT>", "effective!"
	.DB "<PROMPT>"

_ViridianSchoolNotebookText3::
	.DB TX_START, "Third page..."

	.DB "<PARA>", "#MON trainers"
	.DB "<LINE>", "seek others to"
	.DB "<CONT>", "engage in #MON"
	.DB "<CONT>", "fights."

	.DB "<PARA>", "Battles are"
	.DB "<LINE>", "constantly fought"
	.DB "<CONT>", "at #MON GYMs."
	.DB "<PROMPT>"

_ViridianSchoolNotebookText4::
	.DB TX_START, "Fourth page..."

	.DB "<PARA>", "The goal for"
	.DB "<LINE>", "#MON trainers"
	.DB "<CONT>", "is to beat the "
	.DB "<CONT>", "top 8 #MON"
	.DB "<CONT>", "GYM LEADERs."

	.DB "<PARA>", "Do so to earn the"
	.DB "<LINE>", "right to face..."

	.DB "<PARA>", "The ELITE FOUR of"
	.DB "<LINE>", "#MON LEAGUE!"
	.DB "<PROMPT>"

_EnemiesOnEverySideText::
	.DB TX_START, "Enemies on every"
	.DB "<LINE>", "side!"
	.DB "<DONE>"

_WhatGoesAroundComesAroundText::
	.DB TX_START, "What goes around"
	.DB "<LINE>", "comes around!"
	.DB "<DONE>"

_FightingDojoText::
	.DB TX_START, "FIGHTING DOJO"
	.DB "<DONE>"

_IndigoPlateauHQText::
	.DB TX_START, "INDIGO PLATEAU"
	.DB "<LINE>", "#MON LEAGUE HQ"
	.DB "<DONE>"

_RedBedroomSNESText::
	.DB TX_START, "<PLAYER> is"
	.DB "<LINE>", "playing the SNES!"
	.DB "<CONT>", "...Okay!"
	.DB "<CONT>", "It's time to go!"
	.DB "<DONE>"

_Route15UpstairsBinocularsText::
	.DB TX_START, "Looked into the"
	.DB "<LINE>", "binoculars..."

	.DB "<PARA>", "A large, shining"
	.DB "<LINE>", "bird is flying"
	.DB "<CONT>", "toward the sea."
	.DB "<DONE>"

_AerodactylFossilText::
	.DB TX_START, "AERODACTYL Fossil"
	.DB "<LINE>", "A primitive and"
	.DB "<CONT>", "rare #MON."
	.DB "<DONE>"

_KabutopsFossilText::
	.DB TX_START, "KABUTOPS Fossil"
	.DB "<LINE>", "A primitive and"
	.DB "<CONT>", "rare #MON."
	.DB "<DONE>"

_LinkCableHelpText1::
	.DB TX_START, "TRAINER TIPS"

	.DB "<PARA>", "Using a Game Link"
	.DB "<LINE>", "Cable"
	.DB "<PROMPT>"

_LinkCableHelpText2::
	.DB TX_START, "Which heading do"
	.DB "<LINE>", "you want to read?"
	.DB "<DONE>"

_LinkCableInfoText1::
	.DB TX_START, "When you have"
	.DB "<LINE>", "linked your GAME"
	.DB "<CONT>", "BOY with another"
	.DB "<CONT>", "GAME BOY, talk to"
	.DB "<CONT>", "the attendant on"
	.DB "<CONT>", "the right in any"
	.DB "<CONT>", "#MON CENTER."
	.DB "<PROMPT>"

_LinkCableInfoText2::
	.DB TX_START, "COLOSSEUM lets"
	.DB "<LINE>", "you play against"
	.DB "<CONT>", "a friend."
	.DB "<PROMPT>"

_LinkCableInfoText3::
	.DB TX_START, "TRADE CENTER is"
	.DB "<LINE>", "used for trading"
	.DB "<CONT>", "#MON."
	.DB "<PROMPT>"

_ViridianSchoolBlackboardText1::
	.DB TX_START, "The blackboard"
	.DB "<LINE>", "describes #MON"
	.DB "<CONT>", "STATUS changes"
	.DB "<CONT>", "during battles."
	.DB "<PROMPT>"

_ViridianSchoolBlackboardText2::
	.DB TX_START, "Which heading do"
	.DB "<LINE>", "you want to read?"
	.DB "<DONE>"

_ViridianBlackboardSleepText::
	.DB TX_START, "A #MON can't"
	.DB "<LINE>", "attack if it's"
	.DB "<CONT>", "asleep!"

	.DB "<PARA>", "#MON will stay"
	.DB "<LINE>", "asleep even after"
	.DB "<CONT>", "battles."

	.DB "<PARA>", "Use AWAKENING to"
	.DB "<LINE>", "wake them up!"
	.DB "<PROMPT>"

_ViridianBlackboardPoisonText::
	.DB TX_START, "When poisoned, a"
	.DB "<LINE>", "#MON's health"
	.DB "<CONT>", "steadily drops."

	.DB "<PARA>", "Poison lingers"
	.DB "<LINE>", "after battles."

	.DB "<PARA>", "Use an ANTIDOTE"
	.DB "<LINE>", "to cure poison!"
	.DB "<PROMPT>"

_ViridianBlackboardPrlzText::
	.DB TX_START, "Paralysis could"
	.DB "<LINE>", "make #MON"
	.DB "<CONT>", "moves misfire!"

	.DB "<PARA>", "Paralysis remains"
	.DB "<LINE>", "after battles."

	.DB "<PARA>", "Use PARLYZ HEAL"
	.DB "<LINE>", "for treatment!"
	.DB "<PROMPT>"

_ViridianBlackboardBurnText::
	.DB TX_START, "A burn reduces"
	.DB "<LINE>", "power and speed."
	.DB "<CONT>", "It also causes"
	.DB "<CONT>", "ongoing damage."

	.DB "<PARA>", "Burns remain"
	.DB "<LINE>", "after battles."

	.DB "<PARA>", "Use BURN HEAL to"
	.DB "<LINE>", "cure a burn!"
	.DB "<PROMPT>"

_ViridianBlackboardFrozenText::
	.DB TX_START, "If frozen, a"
	.DB "<LINE>", "#MON becomes"
	.DB "<CONT>", "totally immobile!"

	.DB "<PARA>", "It stays frozen"
	.DB "<LINE>", "even after the"
	.DB "<CONT>", "battle ends."

	.DB "<PARA>", "Use ICE HEAL to"
	.DB "<LINE>", "thaw out #MON!"
	.DB "<PROMPT>"

_VermilionGymTrashText::
	.DB TX_START, "Nope, there's"
	.DB "<LINE>", "only trash here."
	.DB "<DONE>"

_VermilionGymTrashSuccessText1::
	.DB TX_START, "Hey! There's a"
	.DB "<LINE>", "switch under the"
	.DB "<CONT>", "trash!"
	.DB "<CONT>", "Turn it on!"

	.DB "<PARA>", "The 1st electric"
	.DB "<LINE>", "lock opened!@"
	.DB TX_END

_VermilionGymTrashSuccessText2::
	.DB TX_START, "Hey! There's"
	.DB "<LINE>", "another switch"
	.DB "<CONT>", "under the trash!"
	.DB "<CONT>", "Turn it on!"
	.DB "<PROMPT>"

_VermilionGymTrashSuccessText3::
	.DB TX_START, "The 2nd electric"
	.DB "<LINE>", "lock opened!"

	.DB "<PARA>", "The motorized door"
	.DB "<LINE>", "opened!@"
	.DB TX_END

_VermilionGymTrashFailText::
	.DB TX_START, "Nope! There's"
	.DB "<LINE>", "only trash here."
	.DB "<CONT>", "Hey! The electric"
	.DB "<CONT>", "locks were reset!@"
	.DB TX_END

_FoundHiddenItemText::
	.DB TX_START, "<PLAYER> found"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "!@"
	.DB TX_END

_HiddenItemBagFullText::
	.DB TX_START, "But, <PLAYER> has"
	.DB "<LINE>", "no more room for"
	.DB "<CONT>", "other items!"
	.DB "<DONE>"

_FoundHiddenCoinsText::
	.DB TX_START, "<PLAYER> found"
	.DB "<LINE>", "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	.DB TX_START, " coins!@"
	.DB TX_END

_FoundHiddenCoins2Text::
	.DB TX_START, "<PLAYER> found"
	.DB "<LINE>", "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	.DB TX_START, " coins!@"
	.DB TX_END

_DroppedHiddenCoinsText::
	.DB TX_START
	.DB "<PARA>", "Oops! Dropped"
	.DB "<LINE>", "some coins!"
	.DB "<DONE>"

_IndigoPlateauStatuesText1::
	.DB TX_START, "INDIGO PLATEAU"
	.DB "<PROMPT>"

_IndigoPlateauStatuesText2::
	.DB TX_START, "The ultimate goal"
	.DB "<LINE>", "of trainers!"
	.DB "<CONT>", "#MON LEAGUE HQ"
	.DB "<DONE>"

_IndigoPlateauStatuesText3::
	.DB TX_START, "The highest"
	.DB "<LINE>", "#MON authority"
	.DB "<CONT>", "#MON LEAGUE HQ"
	.DB "<DONE>"

_PokemonBooksText::
	.DB TX_START, "Crammed full of"
	.DB "<LINE>", "#MON books!"
	.DB "<DONE>"

_DiglettSculptureText::
	.DB TX_START, "It's a sculpture"
	.DB "<LINE>", "of DIGLETT."
	.DB "<DONE>"

_ElevatorText::
	.DB TX_START, "This is an"
	.DB "<LINE>", "elevator."
	.DB "<DONE>"

_TownMapText::
	.DB TX_START, "A TOWN MAP.@"
	.DB TX_END

_PokemonStuffText::
	.DB TX_START, "Wow! Tons of"
	.DB "<LINE>", "#MON stuff!"
	.DB "<DONE>"

_OutOfSafariBallsText::
	.DB TX_START, "PA: Ding-dong!"

	.DB "<PARA>", "You are out of"
	.DB "<LINE>", "SAFARI BALLs!"
	.DB "<PROMPT>"

_WildRanText::
	.DB TX_START, "Wild @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<LINE>", "ran!"
	.DB "<PROMPT>"

_EnemyRanText::
	.DB TX_START, "Enemy @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<LINE>", "ran!"
	.DB "<PROMPT>"

_HurtByPoisonText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "hurt by poison!"
	.DB "<PROMPT>"

_HurtByBurnText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "hurt by the burn!"
	.DB "<PROMPT>"

_HurtByLeechSeedText::
	.DB TX_START, "LEECH SEED saps"
	.DB "<LINE>", "<USER>!"
	.DB "<PROMPT>"

_EnemyMonFaintedText::
	.DB TX_START, "Enemy @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<LINE>", "fainted!"
	.DB "<PROMPT>"

_MoneyForWinningText::
	.DB TX_START, "<PLAYER> got ¥@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	.DB TX_START
	.DB "<LINE>", "for winning!"
	.DB "<PROMPT>"

_TrainerDefeatedText::
	.DB TX_START, "<PLAYER> defeated"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wTrainerName
	.DB TX_START, "!"
	.DB "<PROMPT>"

_PlayerMonFaintedText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START
	.DB "<LINE>", "fainted!"
	.DB "<PROMPT>"

_UseNextMonText::
	.DB TX_START, "Use next #MON?"
	.DB "<DONE>"

_Rival1WinText::
	.DB TX_START, "<RIVAL>: Yeah! Am"
	.DB "<LINE>", "I great or what?"
	.DB "<PROMPT>"

_PlayerBlackedOutText2::
	.DB TX_START, "<PLAYER> is out of"
	.DB "<LINE>", "useable #MON!"

	.DB "<PARA>", "<PLAYER> blacked"
	.DB "<LINE>", "out!"
	.DB "<PROMPT>"

_LinkBattleLostText::
	.DB TX_START, "<PLAYER> lost to"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wTrainerName
	.DB TX_START, "!"
	.DB "<PROMPT>"

_TrainerAboutToUseText::
	.DB TX_RAM
	.DW wTrainerName
	.DB TX_START, " is"
	.DB "<LINE>", "about to use"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START, "!"

	.DB "<PARA>", "Will <PLAYER>"
	.DB "<LINE>", "change #MON?"
	.DB "<DONE>"

_TrainerSentOutText::
	.DB TX_RAM
	.DW wTrainerName
	.DB TX_START, " sent"
	.DB "<LINE>", "out @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START, "!"
	.DB "<DONE>"

_NoWillText::
	.DB TX_START, "There's no will"
	.DB "<LINE>", "to fight!"
	.DB "<PROMPT>"

_CantEscapeText::
	.DB TX_START, "Can't escape!"
	.DB "<PROMPT>"

_NoRunningText::
	.DB TX_START, "No! There's no"
	.DB "<LINE>", "running from a"
	.DB "<CONT>", "trainer battle!"
	.DB "<PROMPT>"

_GotAwayText::
	.DB TX_START, "Got away safely!"
	.DB "<PROMPT>"

_ItemsCantBeUsedHereText::
	.DB TX_START, "Items can't be"
	.DB "<LINE>", "used here."
	.DB "<PROMPT>"

_AlreadyOutText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " is"
	.DB "<LINE>", "already out!"
	.DB "<PROMPT>"

_MoveNoPPText::
	.DB TX_START, "No PP left for"
	.DB "<LINE>", "this move!"
	.DB "<PROMPT>"

_MoveDisabledText::
	.DB TX_START, "The move is"
	.DB "<LINE>", "disabled!"
	.DB "<PROMPT>"

_NoMovesLeftText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " has no"
	.DB "<LINE>", "moves left!"
	.DB "<DONE>"

_MultiHitText::
	.DB TX_START, "Hit the enemy"
	.DB "<LINE>", "@"
	text_decimal wPlayerNumHits, 1, 1
	.DB TX_START, " times!"
	.DB "<PROMPT>"

_ScaredText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " is too"
	.DB "<LINE>", "scared to move!"
	.DB "<PROMPT>"

_GetOutText::
	.DB TX_START, "GHOST: Get out..."
	.DB "<LINE>", "Get out..."
	.DB "<PROMPT>"

_FastAsleepText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "is fast asleep!"
	.DB "<PROMPT>"

_WokeUpText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "woke up!"
	.DB "<PROMPT>"

_IsFrozenText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "is frozen solid!"
	.DB "<PROMPT>"

_FullyParalyzedText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "fully paralyzed!"
	.DB "<PROMPT>"

_FlinchedText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "flinched!"
	.DB "<PROMPT>"

_MustRechargeText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "must recharge!"
	.DB "<PROMPT>"

_DisabledNoMoreText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "disabled no more!"
	.DB "<PROMPT>"

_IsConfusedText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "is confused!"
	.DB "<PROMPT>"

_HurtItselfText::
	.DB TX_START, "It hurt itself in"
	.DB "<LINE>", "its confusion!"
	.DB "<PROMPT>"

_ConfusedNoMoreText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "confused no more!"
	.DB "<PROMPT>"

_SavingEnergyText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "is saving energy!"
	.DB "<PROMPT>"

_UnleashedEnergyText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "unleashed energy!"
	.DB "<PROMPT>"

_ThrashingAboutText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "thrashing about!"
	.DB "<DONE>"

_AttackContinuesText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "attack continues!"
	.DB "<DONE>"

_CantMoveText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "can't move!"
	.DB "<PROMPT>"

_MoveIsDisabledText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " is"
	.DB "<CONT>", "disabled!"
	.DB "<PROMPT>"

_ActorNameText::
	.DB TX_START, "<USER>@"
	.DB TX_END

_UsedMove1Text::
	.DB TX_START
	.DB "<LINE>", "used @"
	.DB TX_END

_UsedMove2Text::
	.DB TX_START
	.DB "<LINE>", "used @"
	.DB TX_END

_UsedInsteadText::
	.DB TX_START, "instead,"
	.DB "<CONT>", "@"
	.DB TX_END

_MoveNameText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "@"

_EndUsedMove1Text::
	.DB TX_START, "!"
	.DB "<DONE>"

_EndUsedMove2Text::
	.DB TX_START, "!"
	.DB "<DONE>"

_EndUsedMove3Text::
	.DB TX_START, "!"
	.DB "<DONE>"

_EndUsedMove4Text::
	.DB TX_START, "!"
	.DB "<DONE>"

_EndUsedMove5Text::
	.DB TX_START, "!"
	.DB "<DONE>"

_AttackMissedText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "attack missed!"
	.DB "<PROMPT>"

_KeptGoingAndCrashedText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "kept going and"
	.DB "<CONT>", "crashed!"
	.DB "<PROMPT>"

_UnaffectedText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "unaffected!"
	.DB "<PROMPT>"

_DoesntAffectMonText::
	.DB TX_START, "It doesn't affect"
	.DB "<LINE>", "<TARGET>!"
	.DB "<PROMPT>"

_CriticalHitText::
	.DB TX_START, "Critical hit!"
	.DB "<PROMPT>"

_OHKOText::
	.DB TX_START, "One-hit KO!"
	.DB "<PROMPT>"

_LoafingAroundText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " is"
	.DB "<LINE>", "loafing around."
	.DB "<PROMPT>"

_BeganToNapText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " began"
	.DB "<LINE>", "to nap!"
	.DB "<PROMPT>"

_WontObeyText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " won't"
	.DB "<LINE>", "obey!"
	.DB "<PROMPT>"

_TurnedAwayText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " turned"
	.DB "<LINE>", "away!"
	.DB "<PROMPT>"

_IgnoredOrdersText::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START
	.DB "<LINE>", "ignored orders!"
	.DB "<PROMPT>"

_SubstituteTookDamageText::
	.DB TX_START, "The SUBSTITUTE"
	.DB "<LINE>", "took damage for"
	.DB "<CONT>", "<TARGET>!"
	.DB "<PROMPT>"

_SubstituteBrokeText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "SUBSTITUTE broke!"
	.DB "<PROMPT>"

_BuildingRageText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "RAGE is building!"
	.DB "<PROMPT>"

_MirrorMoveFailedText::
	.DB TX_START, "The MIRROR MOVE"
	.DB "<NEXT>", "failed!"
	.DB "<PROMPT>"

_HitXTimesText::
	.DB TX_START, "Hit @"
	text_decimal wEnemyNumHits, 1, 1
	.DB TX_START, " times!"
	.DB "<PROMPT>"

_GainedText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " gained"
	.DB "<LINE>", "@"
	.DB TX_END

_WithExpAllText::
	.DB TX_START, "with EXP.ALL,"
	.DB "<CONT>", "@"
	.DB TX_END

_BoostedText::
	.DB TX_START, "a boosted"
	.DB "<CONT>", "@"
	.DB TX_END

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	.DB TX_START, " EXP. Points!"
	.DB "<PROMPT>"

_GrewLevelText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " grew"
	.DB "<LINE>", "to level @"
	text_decimal wCurEnemyLevel, 1, 3
	.DB TX_START, "!@"
	.DB TX_END

_WildMonAppearedText::
	.DB TX_START, "Wild @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<LINE>", "appeared!"
	.DB "<PROMPT>"

_HookedMonAttackedText::
	.DB TX_START, "The hooked"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<CONT>", "attacked!"
	.DB "<PROMPT>"

_EnemyAppearedText::
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<LINE>", "appeared!"
	.DB "<PROMPT>"

_TrainerWantsToFightText::
	.DB TX_RAM
	.DW wTrainerName
	.DB TX_START, " wants"
	.DB "<LINE>", "to fight!"
	.DB "<PROMPT>"

_UnveiledGhostText::
	.DB TX_START, "SILPH SCOPE"
	.DB "<LINE>", "unveiled the"
	.DB "<CONT>", "GHOST's identity!"
	.DB "<PROMPT>"

_GhostCantBeIDdText::
	.DB TX_START, "Darn! The GHOST"
	.DB "<LINE>", "can't be ID'd!"
	.DB "<PROMPT>"

_GoText::
	.DB TX_START, "Go! @"
	.DB TX_END

_DoItText::
	.DB TX_START, "Do it! @"
	.DB TX_END

_GetmText::
	.DB TX_START, "Get'm! @"
	.DB TX_END

_EnemysWeakText::
	.DB TX_START, "The enemy's weak!"
	.DB "<LINE>", "Get'm! @"
	.DB TX_END

_PlayerMon1Text::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, "!"
	.DB "<DONE>"

_PlayerMon2Text::
	.DB TX_RAM
	.DW wBattleMonNick
	.DB TX_START, " @"
	.DB TX_END

_EnoughText::
	.DB TX_START, "enough!@"
	.DB TX_END

_OKExclamationText::
	.DB TX_START, "OK!@"
	.DB TX_END

_GoodText::
	.DB TX_START, "good!@"
	.DB TX_END

_ComeBackText::
	.DB TX_START
	.DB "<LINE>", "Come back!"
	.DB "<DONE>"

_SuperEffectiveText::
	.DB TX_START, "It's super"
	.DB "<LINE>", "effective!"
	.DB "<PROMPT>"

_NotVeryEffectiveText::
	.DB TX_START, "It's not very"
	.DB "<LINE>", "effective..."
	.DB "<PROMPT>"

_SafariZoneEatingText::
	.DB TX_START, "Wild @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<LINE>", "is eating!"
	.DB "<PROMPT>"

_SafariZoneAngryText::
	.DB TX_START, "Wild @"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START
	.DB "<LINE>", "is angry!"
	.DB "<PROMPT>"

; money related
_PickUpPayDayMoneyText::
	.DB TX_START, "<PLAYER> picked up"
	.DB "<LINE>", "¥@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	.DB TX_START, "!"
	.DB "<PROMPT>"

_ClearSaveDataText::
	.DB TX_START, "Clear all saved"
	.DB "<LINE>", "data?"
	.DB "<DONE>"

_WhichFloorText::
	.DB TX_START, "Which floor do"
	.DB "<LINE>", "you want? "
	.DB "<DONE>"

_PartyMenuNormalText::
	.DB TX_START, "Choose a #MON."
	.DB "<DONE>"

_PartyMenuItemUseText::
	.DB TX_START, "Use item on which"
	.DB "<LINE>", "#MON?"
	.DB "<DONE>"

_PartyMenuBattleText::
	.DB TX_START, "Bring out which"
	.DB "<LINE>", "#MON?"
	.DB "<DONE>"

_PartyMenuUseTMText::
	.DB TX_START, "Use TM on which"
	.DB "<LINE>", "#MON?"
	.DB "<DONE>"

_PartyMenuSwapMonText::
	.DB TX_START, "Move #MON"
	.DB "<LINE>", "where?"
	.DB "<DONE>"

_PotionText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.DB "<LINE>", "recovered by @"
	text_decimal wHPBarHPDifference, 2, 3
	.DB TX_START, "!"
	.DB "<DONE>"

_AntidoteText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " was"
	.DB "<LINE>", "cured of poison!"
	.DB "<DONE>"

_ParlyzHealText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "'s"
	.DB "<LINE>", "rid of paralysis!"
	.DB "<DONE>"

_BurnHealText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "'s"
	.DB "<LINE>", "burn was healed!"
	.DB "<DONE>"

_IceHealText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " was"
	.DB "<LINE>", "defrosted!"
	.DB "<DONE>"

_AwakeningText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.DB "<LINE>", "woke up!"
	.DB "<DONE>"

_FullHealText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "'s"
	.DB "<LINE>", "health returned!"
	.DB "<DONE>"

_ReviveText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.DB "<LINE>", "is revitalized!"
	.DB "<DONE>"

_RareCandyText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " grew"
	.DB "<LINE>", "to level @"
	text_decimal wCurEnemyLevel, 1, 3
	.DB TX_START, "!@"
	.DB TX_END

_TurnedOnPC1Text::
	.DB TX_START, "<PLAYER> turned on"
	.DB "<LINE>", "the PC."
	.DB "<PROMPT>"

_AccessedBillsPCText::
	.DB TX_START, "Accessed BILL's"
	.DB "<LINE>", "PC."

	.DB "<PARA>", "Accessed #MON"
	.DB "<LINE>", "Storage System."
	.DB "<PROMPT>"

_AccessedSomeonesPCText::
	.DB TX_START, "Accessed someone's"
	.DB "<LINE>", "PC."

	.DB "<PARA>", "Accessed #MON"
	.DB "<LINE>", "Storage System."
	.DB "<PROMPT>"

_AccessedMyPCText::
	.DB TX_START, "Accessed my PC."

	.DB "<PARA>", "Accessed Item"
	.DB "<LINE>", "Storage System."
	.DB "<PROMPT>"

_TurnedOnPC2Text::
	.DB TX_START, "<PLAYER> turned on"
	.DB "<LINE>", "the PC."
	.DB "<PROMPT>"

_WhatDoYouWantText::
	.DB TX_START, "What do you want"
	.DB "<LINE>", "to do?"
	.DB "<DONE>"

_WhatToDepositText::
	.DB TX_START, "What do you want"
	.DB "<LINE>", "to deposit?"
	.DB "<DONE>"

_DepositHowManyText::
	.DB TX_START, "How many?"
	.DB "<DONE>"

_ItemWasStoredText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " was"
	.DB "<LINE>", "stored via PC."
	.DB "<PROMPT>"

_NothingToDepositText::
	.DB TX_START, "You have nothing"
	.DB "<LINE>", "to deposit."
	.DB "<PROMPT>"

_NoRoomToStoreText::
	.DB TX_START, "No room left to"
	.DB "<LINE>", "store items."
	.DB "<PROMPT>"

_WhatToWithdrawText::
	.DB TX_START, "What do you want"
	.DB "<LINE>", "to withdraw?"
	.DB "<DONE>"

_WithdrawHowManyText::
	.DB TX_START, "How many?"
	.DB "<DONE>"

_WithdrewItemText::
	.DB TX_START, "Withdrew"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "."
	.DB "<PROMPT>"

_NothingStoredText::
	.DB TX_START, "There is nothing"
	.DB "<LINE>", "stored."
	.DB "<PROMPT>"

_CantCarryMoreText::
	.DB TX_START, "You can't carry"
	.DB "<LINE>", "any more items."
	.DB "<PROMPT>"

_WhatToTossText::
	.DB TX_START, "What do you want"
	.DB "<LINE>", "to toss away?"
	.DB "<DONE>"

_TossHowManyText::
	.DB TX_START, "How many?"
	.DB "<DONE>"

_AccessedHoFPCText::
	.DB TX_START, "Accessed #MON"
	.DB "<LINE>", "LEAGUE's site."

	.DB "<PARA>", "Accessed the HALL"
	.DB "<LINE>", "OF FAME List."
	.DB "<PROMPT>"

_SwitchOnText::
	.DB TX_START, "Switch on!"
	.DB "<PROMPT>"

_WhatText::
	.DB TX_START, "What?"
	.DB "<DONE>"

_DepositWhichMonText::
	.DB TX_START, "Deposit which"
	.DB "<LINE>", "#MON?"
	.DB "<DONE>"

_MonWasStoredText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " was"
	.DB "<LINE>", "stored in Box @"
	.DB TX_RAM
	.DW wBoxNumString
	.DB TX_START, "."
	.DB "<PROMPT>"

_CantDepositLastMonText::
	.DB TX_START, "You can't deposit"
	.DB "<LINE>", "the last #MON!"
	.DB "<PROMPT>"

_BoxFullText::
	.DB TX_START, "Oops! This Box is"
	.DB "<LINE>", "full of #MON."
	.DB "<PROMPT>"

_MonIsTakenOutText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " is"
	.DB "<LINE>", "taken out."
	.DB "<CONT>", "Got @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "."
	.DB "<PROMPT>"

_NoMonText::
	.DB TX_START, "What? There are"
	.DB "<LINE>", "no #MON here!"
	.DB "<PROMPT>"

_CantTakeMonText::
	.DB TX_START, "You can't take"
	.DB "<LINE>", "any more #MON."

	.DB "<PARA>", "Deposit #MON"
	.DB "<LINE>", "first."
	.DB "<PROMPT>"

_ReleaseWhichMonText::
	.DB TX_START, "Release which"
	.DB "<LINE>", "#MON?"
	.DB "<DONE>"

_OnceReleasedText::
	.DB TX_START, "Once released,"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " is"
	.DB "<CONT>", "gone forever. OK?"
	.DB "<DONE>"

_MonWasReleasedText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " was"
	.DB "<LINE>", "released outside."
	.DB "<CONT>", "Bye @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!"
	.DB "<PROMPT>"

_RequireCoinCaseText::
	.DB TX_START, "A COIN CASE is"
	.DB "<LINE>", "required!@"
	.DB TX_END

_ExchangeCoinsForPrizesText::
	.DB TX_START, "We exchange your"
	.DB "<LINE>", "coins for prizes."
	.DB "<PROMPT>"

_WhichPrizeText::
	.DB TX_START, "Which prize do"
	.DB "<LINE>", "you want?"
	.DB "<DONE>"

_HereYouGoText::
	.DB TX_START, "Here you go!@"
	.DB TX_END

_SoYouWantPrizeText::
	.DB TX_START, "So, you want"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "?"
	.DB "<DONE>"

_SorryNeedMoreCoinsText::
	.DB TX_START, "Sorry, you need"
	.DB "<LINE>", "more coins.@"
	.DB TX_END

_OopsYouDontHaveEnoughRoomText::
	.DB TX_START, "Oops! You don't"
	.DB "<LINE>", "have enough room.@"
	.DB TX_END

_OhFineThenText::
	.DB TX_START, "Oh, fine then.@"
	.DB TX_END

_GetDexRatedText::
	.DB TX_START, "Want to get your"
	.DB "<LINE>", "#DEX rated?"
	.DB "<DONE>"

_ClosedOaksPCText::
	.DB TX_START, "Closed link to"
	.DB "<LINE>", "PROF.OAK's PC.@"
	.DB TX_END

_AccessedOaksPCText::
	.DB TX_START, "Accessed PROF."
	.DB "<LINE>", "OAK's PC."

	.DB "<PARA>", "Accessed #DEX"
	.DB "<LINE>", "Rating System."
	.DB "<PROMPT>"

_WhereWouldYouLikeText::
	.DB TX_START, "Where would you"
	.DB "<LINE>", "like to go?"
	.DB "<DONE>"

_PleaseWaitText::
	.DB TX_START, "OK, please wait"
	.DB "<LINE>", "just a moment."
	.DB "<DONE>"

_LinkCanceledText::
	.DB TX_START, "The link was"
	.DB "<LINE>", "canceled."
	.DB "<DONE>"

_OakSpeechText1::
	.DB TX_START, "Hello there!"
	.DB "<LINE>", "Welcome to the"
	.DB "<CONT>", "world of #MON!"

	.DB "<PARA>", "My name is OAK!"
	.DB "<LINE>", "People call me"
	.DB "<CONT>", "the #MON PROF!"
	.DB "<PROMPT>"

_OakSpeechText2A::
	.DB TX_START, "This world is"
	.DB "<LINE>", "inhabited by"
	.DB "<CONT>", "creatures called"
	.DB "<CONT>", "#MON!@"
	.DB TX_END

_OakSpeechText2B::
	.DB TX_START

	.DB "<PARA>", "For some people,"
	.DB "<LINE>", "#MON are"
	.DB "<CONT>", "pets. Others use"
	.DB "<CONT>", "them for fights."

	.DB "<PARA>", "Myself..."

	.DB "<PARA>", "I study #MON"
	.DB "<LINE>", "as a profession."
	.DB "<PROMPT>"

_IntroducePlayerText::
	.DB TX_START, "First, what is"
	.DB "<LINE>", "your name?"
	.DB "<PROMPT>"

_IntroduceRivalText::
	.DB TX_START, "This is my grand-"
	.DB "<LINE>", "son. He's been"
	.DB "<CONT>", "your rival since"
	.DB "<CONT>", "you were a baby."

	.DB "<PARA>", "...Erm, what is"
	.DB "<LINE>", "his name again?"
	.DB "<PROMPT>"

_OakSpeechText3::
	.DB TX_START, "<PLAYER>!"

	.DB "<PARA>", "Your very own"
	.DB "<LINE>", "#MON legend is"
	.DB "<CONT>", "about to unfold!"

	.DB "<PARA>", "A world of dreams"
	.DB "<LINE>", "and adventures"
	.DB "<CONT>", "with #MON"
	.DB "<CONT>", "awaits! Let's go!"
	.DB "<DONE>"

_DoYouWantToNicknameText::
	.DB TX_START, "Do you want to"
	.DB "<LINE>", "give a nickname"
	.DB "<CONT>", "to @"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "?"
	.DB "<DONE>"

_YourNameIsText::
	.DB TX_START, "Right! So your"
	.DB "<LINE>", "name is <PLAYER>!"
	.DB "<PROMPT>"

_HisNameIsText::
	.DB TX_START, "That's right! I"
	.DB "<LINE>", "remember now! His"
	.DB "<CONT>", "name is <RIVAL>!"
	.DB "<PROMPT>"

_WillBeTradedText::
	.DB TX_RAM
	.DW wNameOfPlayerMonToBeTraded
	.DB TX_START, " and"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " will"
	.DB "<CONT>", "be traded."
	.DB "<DONE>"

_TextIDErrorText::
	text_decimal hTextID, 1, 2
	.DB TX_START, " ERROR."
	.DB "<DONE>"

_ContCharText::
	.DB TX_START, "<_CONT>@"
	.DB TX_END
