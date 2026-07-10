; Explicit WLA-DX expansion of RGBDS text macros from data/text/text_6.asm.
_ItemUseBallText00::
	.DB TX_START, "It dodged the"
	.DB "<LINE>", "thrown BALL!"

	.DB "<PARA>", "This #MON"
	.DB "<LINE>", "can't be caught!"
	.DB "<PROMPT>"

_ItemUseBallText01::
	.DB TX_START, "You missed the"
	.DB "<LINE>", "#MON!"
	.DB "<PROMPT>"

_ItemUseBallText02::
	.DB TX_START, "Darn! The #MON"
	.DB "<LINE>", "broke free!"
	.DB "<PROMPT>"

_ItemUseBallText03::
	.DB TX_START, "Aww! It appeared"
	.DB "<LINE>", "to be caught! "
	.DB "<PROMPT>"

_ItemUseBallText04::
	.DB TX_START, "Shoot! It was so"
	.DB "<LINE>", "close too!"
	.DB "<PROMPT>"

_ItemUseBallText05::
	.DB TX_START, "All right!"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START, " was"
	.DB "<CONT>", "caught!@"
	.DB TX_END

_ItemUseBallText07::
	.DB TX_RAM
	.DW wBoxMonNicks
	.DB TX_START, " was"
	.DB "<LINE>", "transferred to"
	.DB "<CONT>", "BILL's PC!"
	.DB "<PROMPT>"

_ItemUseBallText08::
	.DB TX_RAM
	.DW wBoxMonNicks
	.DB TX_START, " was"
	.DB "<LINE>", "transferred to"
	.DB "<CONT>", "someone's PC!"
	.DB "<PROMPT>"

_ItemUseBallText06::
	.DB TX_START, "New #DEX data"
	.DB "<LINE>", "will be added for"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wEnemyMonNick
	.DB TX_START, "!@"
	.DB TX_END

_SurfingGotOnText::
	.DB TX_START, "<PLAYER> got on"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "!"
	.DB "<PROMPT>"

_SurfingNoPlaceToGetOffText::
	.DB TX_START, "There's no place"
	.DB "<LINE>", "to get off!"
	.DB "<PROMPT>"

_VitaminStatRoseText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "'s"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " rose."
	.DB "<PROMPT>"

_VitaminNoEffectText::
	.DB TX_START, "It won't have any"
	.DB "<LINE>", "effect."
	.DB "<PROMPT>"

_ThrewBaitText::
	.DB TX_START, "<PLAYER> threw"
	.DB "<LINE>", "some BAIT."
	.DB "<DONE>"

_ThrewRockText::
	.DB TX_START, "<PLAYER> threw a"
	.DB "<LINE>", "ROCK."
	.DB "<DONE>"

_PlayedFluteNoEffectText::
	.DB TX_START, "Played the #"
	.DB "<LINE>", "FLUTE."

	.DB "<PARA>", "Now, that's a"
	.DB "<LINE>", "catchy tune!"
	.DB "<PROMPT>"

_FluteWokeUpText::
	.DB TX_START, "All sleeping"
	.DB "<LINE>", "#MON woke up."
	.DB "<PROMPT>"

_PlayedFluteHadEffectText::
	.DB TX_START, "<PLAYER> played the"
	.DB "<LINE>", "# FLUTE.@"
	.DB TX_END

_CoinCaseNumCoinsText::
	.DB TX_START, "Coins"
	.DB "<LINE>", "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	.DB TX_START, " "
	.DB "<PROMPT>"

_ItemfinderFoundItemText::
	.DB TX_START, "Yes! ITEMFINDER"
	.DB "<LINE>", "indicates there's"
	.DB "<CONT>", "an item nearby."
	.DB "<PROMPT>"

_ItemfinderFoundNothingText::
	.DB TX_START, "Nope! ITEMFINDER"
	.DB "<LINE>", "isn't responding."
	.DB "<PROMPT>"

_RaisePPWhichTechniqueText::
	.DB TX_START, "Raise PP of which"
	.DB "<LINE>", "technique?"
	.DB "<DONE>"

_RestorePPWhichTechniqueText::
	.DB TX_START, "Restore PP of"
	.DB "<LINE>", "which technique?"
	.DB "<DONE>"

_PPMaxedOutText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "'s PP"
	.DB "<LINE>", "is maxed out."
	.DB "<PROMPT>"

_PPIncreasedText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "'s PP"
	.DB "<LINE>", "increased."
	.DB "<PROMPT>"

_PPRestoredText::
	.DB TX_START, "PP was restored."
	.DB "<PROMPT>"

_BootedUpTMText::
	.DB TX_START, "Booted up a TM!"
	.DB "<PROMPT>"

_BootedUpHMText::
	.DB TX_START, "Booted up an HM!"
	.DB "<PROMPT>"

_TeachMachineMoveText::
	.DB TX_START, "It contained"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!"

	.DB "<PARA>", "Teach @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.DB "<LINE>", "to a #MON?"
	.DB "<DONE>"

_MonCannotLearnMachineMoveText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " is not"
	.DB "<LINE>", "compatible with"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "."

	.DB "<PARA>", "It can't learn"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "."
	.DB "<PROMPT>"

_ItemUseNotTimeText::
	.DB TX_START, "OAK: <PLAYER>!"
	.DB "<LINE>", "This isn't the"
	.DB "<CONT>", "time to use that! "
	.DB "<PROMPT>"

_ItemUseNotYoursToUseText::
	.DB TX_START, "This isn't yours"
	.DB "<LINE>", "to use!"
	.DB "<PROMPT>"

_ItemUseNoEffectText::
	.DB TX_START, "It won't have any"
	.DB "<LINE>", "effect."
	.DB "<PROMPT>"

_ThrowBallAtTrainerMonText1::
	.DB TX_START, "The trainer"
	.DB "<LINE>", "blocked the BALL!"
	.DB "<PROMPT>"

_ThrowBallAtTrainerMonText2::
	.DB TX_START, "Don't be a thief!"
	.DB "<PROMPT>"

_NoCyclingAllowedHereText::
	.DB TX_START, "No cycling"
	.DB "<NEXT>", "allowed here."
	.DB "<PROMPT>"

_NoSurfingHereText::
	.DB TX_START, "No SURFing on"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " here!"
	.DB "<PROMPT>"

_BoxFullCannotThrowBallText::
	.DB TX_START, "The #MON BOX"
	.DB "<LINE>", "is full! Can't"
	.DB "<CONT>", "use that item!"
	.DB "<PROMPT>"
