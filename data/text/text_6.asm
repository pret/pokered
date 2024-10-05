_ItemUseBallText00::
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt

_ItemUseBallText01::
	text "You missed the"
	line "#MON!"
	prompt

_ItemUseBallText02::
	text "Darn! The #MON"
	line "broke free!"
	prompt

_ItemUseBallText03::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

_ItemUseBallText04::
	text "Shoot! It was so"
	line "close too!"
	prompt

_ItemUseBallText05::
	text "All right!"
	line "@"
	text_ram wEnemyMonNick
	text " was"
	cont "caught!@"
	text_end

_ItemUseBallText07::
	text_ram wBoxMonNicks
	text " was"
	line "transferred to"
	cont "BILL's <PC>!"
	prompt

_ItemUseBallText08::
	text_ram wBoxMonNicks
	text " was"
	line "transferred to"
	cont "someone's <PC>!"
	prompt

_NoBoxSlotsLeftText::
	text "BOX @"
	text_ram wBoxNumString
	text" is now"
	line "full."
	para "Time to change"
	line "boxes!@"
	text_end

_BoxSlotsLeftText::
	text_ram w2CharStringBuffer
	text " slots left in"
	line "BOX @"
	text_ram wBoxNumString
	text ".@"
	text_end

_ItemUseBallText06::
	text "New #DEX data"
	line "will be added for"
	cont "@"
	text_ram wEnemyMonNick
	text "!@"
	text_end

_SurfingGotOnText::
	text "<PLAYER> got on"
	line "@"
	text_ram wNameBuffer
	text "!"
	prompt

_AlreadySurfingText::
	text "You're already"
	line "surfing."
	prompt

_LavaSurfingText::
	text "Surfing on lava?!"
	line "Not happening."
	prompt

_ApexChipPutOnPokeballText::
	text "You installed the"
	line "APEX CHIP on"
	para "@"
	text_ram wNameBuffer
	text "'s"
	line "Poké Ball.@"
	text_asm
	ld a, SFX_SWITCH
	rst _PlaySound
	call WaitForSoundToFinish
	ld c, 50
	rst _DelayFrames
	ld a, SFX_TRADE_MACHINE
	rst _PlaySound
	call WaitForSoundToFinish
	ld c, 50
	rst _DelayFrames
	rst TextScriptEnd

_ApexChipDVsMaxedText::
	text_ram wNameBuffer
	text "'s"
	line "potential is"
	cont "maximized!"
	para "DVs are at max!"
	prompt

_ApexChipAlreadyUsedText::
	text "There's already"
	line "an APEX CHIP"
	para "installed on"
	line "@"
	text_ram wNameBuffer
	text "'s"
	cont "Poké Ball."
	prompt

_BoosterChipInstalledText::
	text "You plugged the"
	line "BOOSTER CHIP into"
	cont "your POKéBALL"
	cont "belt."

	para "All #MON will"
	line "gain boosted EXP!@"
	text_end

_VitaminStatRoseText::
	text_ram wNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer
	text " rose."
	prompt

_VitaminNoEffectText::
	text "Vitamins can't"
	line "raise this stat"
	cont "further."
	prompt

_ItemUseNoEffectText::
_RareCandyNoEffectText::
	text "It won't have any"
	line "effect."
	prompt

_ThrewBaitText::
	text "<PLAYER> threw"
	line "some BAIT."
	done

_ThrewRockText::
	text "<PLAYER> threw a"
	line "ROCK."
	done

_PlayedFluteNoEffectText::
	text "Played the #"
	line "FLUTE."

	para "Now, that's a"
	line "catchy tune!"
	prompt

_FluteWokeUpText::
	text "All sleeping"
	line "#MON woke up."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_end

_CoinCaseNumCoinsText::
	text "Coins"
	line "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " "
	prompt

_ItemfinderFoundItemText::
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt

_ItemfinderFoundNothingText::
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt

_RaisePPWhichTechniqueText::
	text "Raise PP of which"
	line "technique?"
	done

_RestorePPWhichTechniqueText::
	text "Restore PP of"
	line "which technique?"
	done

_PPMaxedOutText::
	text_ram wStringBuffer
	text "'s PP"
	line "has already been"
	cont "maxed out."
	prompt

_PPIncreasedText::
	text_ram wStringBuffer
	text "'s max"
	line "PP increased."
	prompt

_PPRestoredText::
	text "PP was restored."
	prompt

_BootedUpTMText::
	text "Booted up a <TM>!"
	prompt

_BootedUpHMText::
	text "Booted up an HM!"
	prompt

_TeachMachineMoveText::
	text "It contained"
	line "@"
	text_ram wStringBuffer
	text "!"

	para "Teach @"
	text_ram wStringBuffer
	text_start
	line "to a #MON?"
	done

_MonCannotLearnMachineMoveText::
	text_ram wNameBuffer
	text " is not"
	line "compatible with"
	cont "@"
	text_ram wStringBuffer
	text "."

	para "It can't learn"
	line "@"
	text_ram wStringBuffer
	text "."
	prompt

_ItemUseNotTimeText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

_ItemUseValuableText::
	text "Looks valuable!"
	para "Selling it would"
	line "be a good idea."
	prompt

_TopSecretKeyText::
	text "This key looks"
	line "similar to the"
	cont "SECRET KEY."
	para "It's a lot more"
	line "worn though."
	para "What's it open?"
	para "Maybe a door on"
	line "CINNABAR ISLAND?"
	para "It says -B2F-"
	line "on it."
	prompt

_ItemUseFossilText::
	text "This fossil is"
	line "fun to admire!"
	para "Maybe putting it"
	line "in the <PC> until"
	cont "finding a use"
	cont "for it is best."
	prompt

_ItemUseInBattleText::
	text "This can only"
	line "be used during"
	cont "a #MON battle."
	prompt

_ItemUseNotYoursToUseText::
	text "This isn't yours"
	line "to use!"
	prompt

_ThrowBallAtTrainerMonText1::
	text "The trainer"
	line "blocked the BALL!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "Don't be a thief!"
	prompt

_NoCyclingAllowedHereText::
	text "No cycling"
	next "allowed here."
	prompt

_NoSurfingHereText::
	text "No SURFing on"
	line "@"
	text_ram wNameBuffer
	text " here!"
	prompt

_BoxFullCannotThrowBallText::
	text "The #MON BOX"
	line "is full! Can't"
	cont "use that item!"
	prompt
