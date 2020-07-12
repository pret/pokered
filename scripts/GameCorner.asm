GameCorner_Script:
	call CeladonGameCornerScript_SelectLuckySlotMachine
	call CeladonGameCornerScript_SetRocketHideoutDoorTile
	call EnableAutoTextBoxDrawing
	ld hl, GameCorner_ScriptPointers
	ld a, [wGameCornerCurScript]
	jp CallFunctionInTable

CeladonGameCornerScript_SelectLuckySlotMachine:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	call Random
	ldh a, [hRandomAdd]
	cp $7
	jr nc, .asm_48be2
	ld a, $8
.asm_48be2
	srl a
	srl a
	srl a
	ld [wLuckySlotHiddenObjectIndex], a
	ret

CeladonGameCornerScript_SetRocketHideoutDoorTile:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_FOUND_ROCKET_HIDEOUT
	ret nz
	ld a, $2a
	ld [wNewTileBlockID], a
	lb bc, 2, 8
	predef_jump ReplaceTileBlock

CeladonGameCornerScript1_ReenterMapAfterPlayerLoss:
	xor a
	ld [wJoyIgnore], a
	ld [wGameCornerCurScript], a
	ld [wCurMapScript], a
	ret

GameCorner_ScriptPointers:
	dw CeladonGameCornerScript0
	dw CeladonGameCornerScript1
	dw CeladonGameCornerScript2

CeladonGameCornerScript0:
	; Idle
	ret

CeladonGameCornerScript1:
	; Rocket battle
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeladonGameCornerScript1_ReenterMapAfterPlayerLoss
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, 13 ; Our hideout might be discovered! I better tell BOSS!
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $b
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, CeladonGameCornerMovement_Grunt_WalkAroundPlayer
	ld a, [wYCoord]
	cp $6
	jr nz, .asm_48c43
	ld de, CeladonGameCornerMovement_Grunt_WalkDirect
	jr .asm_48c4d
.asm_48c43
	ld a, [wXCoord]
	cp $8
	jr nz, .asm_48c4d
	ld de, CeladonGameCornerMovement_Grunt_WalkDirect
.asm_48c4d
	ld a, $b
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $2
	ld [wGameCornerCurScript], a
	ret

CeladonGameCornerMovement_Grunt_WalkAroundPlayer:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

CeladonGameCornerMovement_Grunt_WalkDirect:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

CeladonGameCornerScript2:
	; Wait Rocket movement
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, HS_GAME_CORNER_ROCKET
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	set 6, [hl]
	ld a, $0
	ld [wGameCornerCurScript], a
	ret

GameCorner_TextPointers:
	dw CeladonGameCornerText_NPC_CanExchangePrizesNextDoor
	dw CeladonGameCornerText_NPC_CoinSalesman
	dw CeladonGameCornerText_NPC_KeepThisQuiet
	dw CeladonGameCornerText_NPC_MachineDiffOdds
	dw CeladonGameCornerText_NPC_10Coins
	dw CeladonGameCornerText_NPC_WonderfulTime
	dw CeladonGameCornerText_NPC_GymGuy
	dw CeladonGameCornerText_NPC_GamesAreScary
	dw CeladonGameCornerText_NPC_20Coins_2
	dw CeladonGameCornerText_NPC_20Coins
	dw CeladonGameCornerText_NPC_PosterGruntBeforeBattle
	dw CeladonGameCornerText_BG_Poster
	dw CeladonGameCornerText_NPC_PosterGruntAfterBattle

CeladonGameCornerText_NPC_CanExchangePrizesNextDoor:
	text_far _CeladonGameCornerText_NPC_CanExchangePrizesNextDoor
	text_end

CeladonGameCornerText_NPC_CoinSalesman:
	text_asm
	; Show player's coins
	call CeladonGameCornerScript_DrawCoinBox
	ld hl, CeladonGameCornerText_DoYouNeedSomeGameCoins
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declined
	; Can only get more coins if you
	; - have the Coin Case
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .no_coin_ciase
	; - have room in the Coin Case for at least 9 coins
	call Has9990Coins
	jr nc, .coin_case_full
	; - have at least 1000 yen
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .buy_coins
	ld hl, CeladonGameCornerText_CantAffordTheCoins
	jr .print_ret
.buy_coins
	; Spend 1000 yen
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	ld hl, hMoney + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	; Receive 50 coins
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $50
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	; Update display
	call CeladonGameCornerScript_DrawCoinBox
	ld hl, CeladonGameCornerText_ThanksHereAre50Coins
	jr .print_ret
.declined
	ld hl, CeladonGameCornerText_PleaseComePlaySometime
	jr .print_ret
.coin_case_full
	ld hl, CeladonGameCornerText_CoinCaseIsFull
	jr .print_ret
.no_coin_ciase
	ld hl, CeladonGameCornerText_DontHaveCoinCase
.print_ret
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_DoYouNeedSomeGameCoins:
	text_far _CeladonGameCornerText_DoYouNeedSomeGameCoins
	text_end

CeladonGameCornerText_ThanksHereAre50Coins:
	text_far _CeladonGameCornerText_ThanksHereAre50Coins
	text_end

CeladonGameCornerText_PleaseComePlaySometime:
	text_far _CeladonGameCornerText_PleaseComePlaySometime
	text_end

CeladonGameCornerText_CantAffordTheCoins:
	text_far _CeladonGameCornerText_CantAffordTheCoins
	text_end

CeladonGameCornerText_CoinCaseIsFull:
	text_far _CeladonGameCornerText_CoinCaseIsFull
	text_end

CeladonGameCornerText_DontHaveCoinCase:
	text_far _CeladonGameCornerText_DontHaveCoinCase
	text_end

CeladonGameCornerText_NPC_KeepThisQuiet:
	text_far _CeladonGameCornerText_NPC_KeepThisQuiet
	text_end

CeladonGameCornerText_NPC_MachineDiffOdds:
	text_far _CeladonGameCornerText_NPC_MachineDiffOdds
	text_end

CeladonGameCornerText_NPC_10Coins:
	text_asm
	CheckEvent EVENT_GOT_10_COINS
	jr nz, .alreadyGotNpcCoins
	ld hl, CeladonGameCornerText_WantToPlay
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .dontHaveCoinCase
	call Has9990Coins
	jr nc, .coinCaseFull
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $10
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	SetEvent EVENT_GOT_10_COINS
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, Received10CoinsText
	jr .print_ret
.alreadyGotNpcCoins
	ld hl, CeladonGameCornerText_WinsComeAndGo
	jr .print_ret
.coinCaseFull
	ld hl, CeladonGameCornerText_DontNeedMyCoins
	jr .print_ret
.dontHaveCoinCase
	ld hl, CeladonGameCornerText_OopsForgotCoinCase
.print_ret
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_WantToPlay:
	text_far _CeladonGameCornerText_WantToPlay
	text_end

Received10CoinsText:
	text_far _Received10CoinsText
	sound_get_item_1
	text_end

CeladonGameCornerText_DontNeedMyCoins:
	text_far _CeladonGameCornerText_DontNeedMyCoins
	text_end

CeladonGameCornerText_WinsComeAndGo:
	text_far _CeladonGameCornerText_WinsComeAndGo
	text_end

CeladonGameCornerText_NPC_WonderfulTime:
	text_far _CeladonGameCornerText_NPC_WonderfulTime
	text_end

CeladonGameCornerText_NPC_GymGuy:
	text_asm
	CheckEvent EVENT_BEAT_ERIKA
	ld hl, CeladonGameCornerText_GymGuy_BeforeErika
	jr z, .asm_48dc4
	ld hl, CeladonGameCornerText_GymGuy_AfterErika
.asm_48dc4
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_GymGuy_BeforeErika:
	text_far _CeladonGameCornerText_GymGuy_BeforeErika
	text_end

CeladonGameCornerText_GymGuy_AfterErika:
	text_far _CeladonGameCornerText_GymGuy_AfterErika
	text_end

CeladonGameCornerText_NPC_GamesAreScary:
	text_far _CeladonGameCornerText_NPC_GamesAreScary
	text_end

CeladonGameCornerText_NPC_20Coins_2:
	text_asm
	CheckEvent EVENT_GOT_20_COINS_2
	jr nz, .alreadyGotNpcCoins
	ld hl, CeladonGameCornerText_WantSomeCoins
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .dontHaveCoinCase
	call Has9990Coins
	jr nc, .coinCaseFull
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $20
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	SetEvent EVENT_GOT_20_COINS_2
	ld hl, Received20CoinsText
	jr .print_ret
.alreadyGotNpcCoins
	ld hl, CeladonGameCornerText_INeedMoreCoins
	jr .print_ret
.coinCaseFull
	ld hl, CeladonGameCornerText_YouHaveLotsOfCoins
	jr .print_ret
.dontHaveCoinCase
	ld hl, CeladonGameCornerText_OopsForgotCoinCase
.print_ret
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_WantSomeCoins:
	text_far _CeladonGameCornerText_WantSomeCoins
	text_end

Received20CoinsText:
	text_far _Received20CoinsText
	sound_get_item_1
	text_end

CeladonGameCornerText_YouHaveLotsOfCoins:
	text_far _CeladonGameCornerText_YouHaveLotsOfCoins
	text_end

CeladonGameCornerText_INeedMoreCoins:
	text_far _CeladonGameCornerText_INeedMoreCoins
	text_end

CeladonGameCornerText_NPC_20Coins:
	text_asm
	CheckEvent EVENT_GOT_20_COINS
	jr nz, .alreadyGotNpcCoins
	ld hl, CeladonGameCornerText_ThrowingMeOff
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .dontHaveCoinCase
	call Has9990Coins
	jr z, .coinCaseFull
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $20
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	SetEvent EVENT_GOT_20_COINS
	ld hl, CeladonGameCornerText_Received20Coins_2
	jr .print_ret
.alreadyGotNpcCoins
	ld hl, CeladonGameCornerText_CloselyWatchTheReels
	jr .print_ret
.coinCaseFull
	ld hl, CeladonGameCornerText_YouGotYourOwnCoins
	jr .print_ret
.dontHaveCoinCase
	ld hl, CeladonGameCornerText_OopsForgotCoinCase
.print_ret
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_ThrowingMeOff:
	text_far _CeladonGameCornerText_ThrowingMeOff
	text_end

CeladonGameCornerText_Received20Coins_2:
	text_far _CeladonGameCornerText_Received20Coins_2
	sound_get_item_1
	text_end

CeladonGameCornerText_YouGotYourOwnCoins:
	text_far _CeladonGameCornerText_YouGotYourOwnCoins
	text_end

CeladonGameCornerText_CloselyWatchTheReels:
	text_far _CeladonGameCornerText_CloselyWatchTheReels
	text_end

CeladonGameCornerText_NPC_PosterGruntBeforeBattle:
	text_asm
	ld hl, CeladonGameCornerText_ImGuardingThisPoster
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeladonGameCornerText_PosterGrunt_OnBattleEnd
	ld de, CeladonGameCornerText_PosterGrunt_OnBattleEnd
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ld a, $1
	ld [wGameCornerCurScript], a
	jp TextScriptEnd

CeladonGameCornerText_ImGuardingThisPoster:
	text_far _CeladonGameCornerText_ImGuardingThisPoster
	text_end

CeladonGameCornerText_PosterGrunt_OnBattleEnd:
	text_far _CeladonGameCornerText_PosterGrunt_OnBattleEnd
	text_end

CeladonGameCornerText_NPC_PosterGruntAfterBattle:
	text_far _CeladonGameCornerText_HideoutMightBeDiscovered
	text_end

CeladonGameCornerText_BG_Poster:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CeladonGameCornerText_SwitchBehindThePoster
	call PrintText
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	SetEvent EVENT_FOUND_ROCKET_HIDEOUT
	ld a, $43
	ld [wNewTileBlockID], a
	lb bc, 2, 8
	predef ReplaceTileBlock
	jp TextScriptEnd

CeladonGameCornerText_SwitchBehindThePoster:
	text_far _CeladonGameCornerText_SwitchBehindThePoster
	text_asm
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

CeladonGameCornerText_OopsForgotCoinCase:
	text_far _CeladonGameCornerText_OopsForgotCoinCase
	text_end

CeladonGameCornerScript_DrawCoinBox:
	ld hl, wd730
	set 6, [hl]
	hlcoord 11, 0
	ld b, $5
	ld c, $7
	call TextBoxBorder
	call UpdateSprites
	hlcoord 12, 1
	ld b, 4
	ld c, 7
	call ClearScreenArea
	hlcoord 12, 2
	ld de, GameCornerMoneyText
	call PlaceString
	hlcoord 12, 3
	ld de, GameCornerBlankText1
	call PlaceString
	hlcoord 12, 3
	ld de, wPlayerMoney
	ld c, $a3
	call PrintBCDNumber
	hlcoord 12, 4
	ld de, GameCornerCoinText
	call PlaceString
	hlcoord 12, 5
	ld de, GameCornerBlankText2
	call PlaceString
	hlcoord 15, 5
	ld de, wPlayerCoins
	ld c, $82
	call PrintBCDNumber
	ld hl, wd730
	res 6, [hl]
	ret

GameCornerMoneyText:
	db "MONEY@"

GameCornerCoinText:
	db "COIN@"

GameCornerBlankText1:
	db "       @"

GameCornerBlankText2:
	db "       @"

Has9990Coins:
	ld a, $99
	ldh [hCoins], a
	ld a, $90
	ldh [hCoins + 1], a
	jp HasEnoughCoins
