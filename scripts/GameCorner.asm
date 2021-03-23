GameCorner_Script:
	call CeladonGameCornerScript_48bcf
	call CeladonGameCornerScript_48bec
	call EnableAutoTextBoxDrawing
	ld hl, GameCorner_ScriptPointers
	ld a, [wGameCornerCurScript]
	jp CallFunctionInTable

CeladonGameCornerScript_48bcf:
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

CeladonGameCornerScript_48bec:
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

CeladonGameCornerScript_48c07:
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
	ret

CeladonGameCornerScript1:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeladonGameCornerScript_48c07
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $d
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $b
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_48c5a
	ld a, [wYCoord]
	cp 6
	jr nz, .asm_48c43
	ld de, MovementData_48c63
	jr .asm_48c4d
.asm_48c43
	ld a, [wXCoord]
	cp 8
	jr nz, .asm_48c4d
	ld de, MovementData_48c63
.asm_48c4d
	ld a, $b
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $2
	ld [wGameCornerCurScript], a
	ret

MovementData_48c5a:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

MovementData_48c63:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

CeladonGameCornerScript2:
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
	dw CeladonGameCornerText1
	dw CeladonGameCornerText2
	dw CeladonGameCornerText3
	dw CeladonGameCornerText4
	dw CeladonGameCornerText5
	dw CeladonGameCornerText6
	dw CeladonGameCornerText7
	dw CeladonGameCornerText8
	dw CeladonGameCornerText9
	dw CeladonGameCornerText10
	dw CeladonGameCornerText11
	dw CeladonGameCornerText12
	dw CeladonGameCornerText13

CeladonGameCornerText1:
	text_far _CeladonGameCornerText1
	text_end

CeladonGameCornerText2:
	text_asm
	call CeladonGameCornerScript_48f1e
	ld hl, CeladonGameCornerText_48d22
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_48d0f
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .asm_48d19
	call Has9990Coins
	jr nc, .asm_48d14
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .asm_48cdb
	ld hl, CeladonGameCornerText_48d31
	jr .asm_48d1c
.asm_48cdb
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	ld hl, hMoney + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $50
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	call CeladonGameCornerScript_48f1e
	ld hl, CeladonGameCornerText_48d27
	jr .asm_48d1c
.asm_48d0f
	ld hl, CeladonGameCornerText_48d2c
	jr .asm_48d1c
.asm_48d14
	ld hl, CeladonGameCornerText_48d36
	jr .asm_48d1c
.asm_48d19
	ld hl, CeladonGameCornerText_48d3b
.asm_48d1c
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_48d22:
	text_far _CeladonGameCornerText_48d22
	text_end

CeladonGameCornerText_48d27:
	text_far _CeladonGameCornerText_48d27
	text_end

CeladonGameCornerText_48d2c:
	text_far _CeladonGameCornerText_48d2c
	text_end

CeladonGameCornerText_48d31:
	text_far _CeladonGameCornerText_48d31
	text_end

CeladonGameCornerText_48d36:
	text_far _CeladonGameCornerText_48d36
	text_end

CeladonGameCornerText_48d3b:
	text_far _CeladonGameCornerText_48d3b
	text_end

CeladonGameCornerText3:
	text_far _CeladonGameCornerText3
	text_end

CeladonGameCornerText4:
	text_far _CeladonGameCornerText4
	text_end

CeladonGameCornerText5:
	text_asm
	CheckEvent EVENT_GOT_10_COINS
	jr nz, .asm_48d89
	ld hl, CeladonGameCornerText_48d9c
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .asm_48d93
	call Has9990Coins
	jr nc, .asm_48d8e
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
	jr .asm_48d96
.asm_48d89
	ld hl, CeladonGameCornerText_48dac
	jr .asm_48d96
.asm_48d8e
	ld hl, CeladonGameCornerText_48da7
	jr .asm_48d96
.asm_48d93
	ld hl, CeladonGameCornerText_48f19
.asm_48d96
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_48d9c:
	text_far _CeladonGameCornerText_48d9c
	text_end

Received10CoinsText:
	text_far _Received10CoinsText
	sound_get_item_1
	text_end

CeladonGameCornerText_48da7:
	text_far _CeladonGameCornerText_48da7
	text_end

CeladonGameCornerText_48dac:
	text_far _CeladonGameCornerText_48dac
	text_end

CeladonGameCornerText6:
	text_far _CeladonGameCornerText6
	text_end

CeladonGameCornerText7:
	text_asm
	CheckEvent EVENT_BEAT_ERIKA
	ld hl, CeladonGameCornerText_48dca
	jr z, .asm_48dc4
	ld hl, CeladonGameCornerText_48dcf
.asm_48dc4
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_48dca:
	text_far _CeladonGameCornerText_48dca
	text_end

CeladonGameCornerText_48dcf:
	text_far _CeladonGameCornerText_48dcf
	text_end

CeladonGameCornerText8:
	text_far _CeladonGameCornerText8
	text_end

CeladonGameCornerText9:
	text_asm
	CheckEvent EVENT_GOT_20_COINS_2
	jr nz, .asm_48e13
	ld hl, CeladonGameCornerText_48e26
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .asm_48e1d
	call Has9990Coins
	jr nc, .asm_48e18
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
	jr .asm_48e20
.asm_48e13
	ld hl, CeladonGameCornerText_48e36
	jr .asm_48e20
.asm_48e18
	ld hl, CeladonGameCornerText_48e31
	jr .asm_48e20
.asm_48e1d
	ld hl, CeladonGameCornerText_48f19
.asm_48e20
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_48e26:
	text_far _CeladonGameCornerText_48e26
	text_end

Received20CoinsText:
	text_far _Received20CoinsText
	sound_get_item_1
	text_end

CeladonGameCornerText_48e31:
	text_far _CeladonGameCornerText_48e31
	text_end

CeladonGameCornerText_48e36:
	text_far _CeladonGameCornerText_48e36
	text_end

CeladonGameCornerText10:
	text_asm
	CheckEvent EVENT_GOT_20_COINS
	jr nz, .asm_48e75
	ld hl, CeladonGameCornerText_48e88
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .asm_48e7f
	call Has9990Coins
	jr z, .asm_48e7a
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
	ld hl, CeladonGameCornerText_48e8d
	jr .asm_48e82
.asm_48e75
	ld hl, CeladonGameCornerText_48e98
	jr .asm_48e82
.asm_48e7a
	ld hl, CeladonGameCornerText_48e93
	jr .asm_48e82
.asm_48e7f
	ld hl, CeladonGameCornerText_48f19
.asm_48e82
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_48e88:
	text_far _CeladonGameCornerText_48e88
	text_end

CeladonGameCornerText_48e8d:
	text_far _CeladonGameCornerText_48e8d
	sound_get_item_1
	text_end

CeladonGameCornerText_48e93:
	text_far _CeladonGameCornerText_48e93
	text_end

CeladonGameCornerText_48e98:
	text_far _CeladonGameCornerText_48e98
	text_end

CeladonGameCornerText11:
	text_asm
	ld hl, CeladonGameCornerText_48ece
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeladonGameCornerText_48ed3
	ld de, CeladonGameCornerText_48ed3
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

CeladonGameCornerText_48ece:
	text_far _CeladonGameCornerText_48ece
	text_end

CeladonGameCornerText_48ed3:
	text_far _CeladonGameCornerText_48ed3
	text_end

CeladonGameCornerText13:
	text_far _CeladonGameCornerText_48ed8
	text_end

CeladonGameCornerText12:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CeladonGameCornerText_48f09
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

CeladonGameCornerText_48f09:
	text_far _CeladonGameCornerText_48f09
	text_asm
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

CeladonGameCornerText_48f19:
	text_far _CeladonGameCornerText_48f19
	text_end

CeladonGameCornerScript_48f1e:
	ld hl, wd730
	set 6, [hl]
	hlcoord 11, 0
	ld b, 5
	ld c, 7
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
	ld c, 3 | MONEY_SIGN | LEADING_ZEROES
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
