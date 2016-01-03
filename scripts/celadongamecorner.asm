CeladonGameCornerScript: ; 48bbd (12:4bbd)
	call CeladonGameCornerScript_48bcf
	call CeladonGameCornerScript_48bec
	call EnableAutoTextBoxDrawing
	ld hl, CeladonGameCornerScriptPointers
	ld a, [wCeladonGameCornerCurScript]
	jp CallFunctionInTable

CeladonGameCornerScript_48bcf: ; 48bcf (12:4bcf)
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	call Random
	ld a, [hRandomAdd]
	cp $7
	jr nc, .asm_48be2
	ld a, $8
.asm_48be2
	srl a
	srl a
	srl a
	ld [wLuckySlotHiddenObjectIndex], a
	ret

CeladonGameCornerScript_48bec: ; 48bec (12:4bec)
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

CeladonGameCornerScript_48c07: ; 48c07 (12:4c07)
	xor a
	ld [wJoyIgnore], a
	ld [wCeladonGameCornerCurScript], a
	ld [wCurMapScript], a
	ret

CeladonGameCornerScriptPointers: ; 48c12 (12:4c12)
	dw CeladonGameCornerScript0
	dw CeladonGameCornerScript1
	dw CeladonGameCornerScript2

CeladonGameCornerScript0: ; 48c18 (12:4c18)
	ret

CeladonGameCornerScript1: ; 48c19 (12:4c19)
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeladonGameCornerScript_48c07
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $d
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $b
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_48c5a
	ld a, [wYCoord]
	cp $6
	jr nz, .asm_48c43
	ld de, MovementData_48c63
	jr .asm_48c4d
.asm_48c43
	ld a, [wXCoord]
	cp $8
	jr nz, .asm_48c4d
	ld de, MovementData_48c63
.asm_48c4d
	ld a, $b
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $2
	ld [wCeladonGameCornerCurScript], a
	ret

MovementData_48c5a: ; 48c5a (12:4c5a)
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

MovementData_48c63: ; 48c63 (12:4c63)
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

CeladonGameCornerScript2: ; 48c69 (12:4c69)
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
	ld [wCeladonGameCornerCurScript], a
	ret

CeladonGameCornerTextPointers: ; 48c8a (12:4c8a)
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

CeladonGameCornerText1: ; 48ca4 (12:4ca4)
	TX_FAR _CeladonGameCornerText1
	db "@"

CeladonGameCornerText2: ; 48ca9 (12:4ca9)
	TX_ASM
	call CeladonGameCornerScript_48f1e
	ld hl, CeladonGameCornerText_48d22
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_48d0f
	ld b,COIN_CASE
	call IsItemInBag
	jr z, .asm_48d19
	call Has9990Coins
	jr nc, .asm_48d14
	xor a
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $10
	ld [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .asm_48cdb
	ld hl, CeladonGameCornerText_48d31
	jr .asm_48d1c
.asm_48cdb
	xor a
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $10
	ld [hMoney + 1], a
	ld hl, hMoney + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	xor a
	ld [hUnusedCoinsByte], a
	ld [hCoins], a
	ld a, $50
	ld [hCoins + 1], a
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

CeladonGameCornerText_48d22: ; 48d22 (12:4d22)
	TX_FAR _CeladonGameCornerText_48d22
	db "@"

CeladonGameCornerText_48d27: ; 48d27 (12:4d27)
	TX_FAR _CeladonGameCornerText_48d27
	db "@"

CeladonGameCornerText_48d2c: ; 48d2c (12:4d2c)
	TX_FAR _CeladonGameCornerText_48d2c
	db "@"

CeladonGameCornerText_48d31: ; 48d31 (12:4d31)
	TX_FAR _CeladonGameCornerText_48d31
	db "@"

CeladonGameCornerText_48d36: ; 48d36 (12:4d36)
	TX_FAR _CeladonGameCornerText_48d36
	db "@"

CeladonGameCornerText_48d3b: ; 48d3b (12:4d3b)
	TX_FAR _CeladonGameCornerText_48d3b
	db "@"

CeladonGameCornerText3: ; 48d40 (12:4d40)
	TX_FAR _CeladonGameCornerText3
	db "@"

CeladonGameCornerText4: ; 48d45 (12:4d45)
	TX_FAR _CeladonGameCornerText4
	db "@"

CeladonGameCornerText5: ; 48d4a (12:4d4a)
	TX_ASM
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
	ld [hUnusedCoinsByte], a
	ld [hCoins], a
	ld a, $10
	ld [hCoins + 1], a
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

CeladonGameCornerText_48d9c: ; 48d9c (12:4d9c)
	TX_FAR _CeladonGameCornerText_48d9c
	db "@"

Received10CoinsText: ; 48da1 (12:4da1)
	TX_FAR _Received10CoinsText
	db $0B, "@"

CeladonGameCornerText_48da7: ; 48da7 (12:4da7)
	TX_FAR _CeladonGameCornerText_48da7
	db "@"

CeladonGameCornerText_48dac: ; 48dac (12:4dac)
	TX_FAR _CeladonGameCornerText_48dac
	db "@"

CeladonGameCornerText6: ; 48db1 (12:4db1)
	TX_FAR _CeladonGameCornerText6
	db "@"

CeladonGameCornerText7: ; 48db6 (12:4db6)
	TX_ASM
	CheckEvent EVENT_BEAT_ERIKA
	ld hl, CeladonGameCornerText_48dca
	jr z, .asm_48dc4
	ld hl, CeladonGameCornerText_48dcf
.asm_48dc4
	call PrintText
	jp TextScriptEnd

CeladonGameCornerText_48dca: ; 48dca (12:4dca)
	TX_FAR _CeladonGameCornerText_48dca
	db "@"

CeladonGameCornerText_48dcf: ; 48dcf (12:4dcf)
	TX_FAR _CeladonGameCornerText_48dcf
	db "@"

CeladonGameCornerText8: ; 48dd4 (12:4dd4)
	TX_FAR _CeladonGameCornerText8
	db "@"

CeladonGameCornerText9: ; 48dd9 (12:4dd9)
	TX_ASM
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
	ld [hUnusedCoinsByte], a
	ld [hCoins], a
	ld a, $20
	ld [hCoins + 1], a
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

CeladonGameCornerText_48e26: ; 48e26 (12:4e26)
	TX_FAR _CeladonGameCornerText_48e26
	db "@"

Received20CoinsText: ; 48e2b (12:4e2b)
	TX_FAR _Received20CoinsText
	db $0B, "@"

CeladonGameCornerText_48e31: ; 48e31 (12:4e31)
	TX_FAR _CeladonGameCornerText_48e31
	db "@"

CeladonGameCornerText_48e36: ; 48e36 (12:4e36)
	TX_FAR _CeladonGameCornerText_48e36
	db "@"

CeladonGameCornerText10: ; 48e3b (12:4e3b)
	TX_ASM
	CheckEvent EVENT_GOT_20_COINS
	jr nz, .asm_48e75
	ld hl, CeladonGameCornerText_48e88
	call PrintText
	ld b,COIN_CASE
	call IsItemInBag
	jr z, .asm_48e7f
	call Has9990Coins
	jr z, .asm_48e7a
	xor a
	ld [hUnusedCoinsByte], a
	ld [hCoins], a
	ld a, $20
	ld [hCoins + 1], a
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

CeladonGameCornerText_48e88: ; 48e88 (12:4e88)
	TX_FAR _CeladonGameCornerText_48e88
	db "@"

CeladonGameCornerText_48e8d: ; 48e8d (12:4e8d)
	TX_FAR _CeladonGameCornerText_48e8d
	db $0B, "@"

CeladonGameCornerText_48e93: ; 48e93 (12:4e93)
	TX_FAR _CeladonGameCornerText_48e93
	db "@"

CeladonGameCornerText_48e98: ; 48e98 (12:4e98)
	TX_FAR _CeladonGameCornerText_48e98
	db "@"

CeladonGameCornerText11: ; 48e9d (12:4e9d)
	TX_ASM
	ld hl, CeladonGameCornerText_48ece
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeladonGameCornerText_48ed3
	ld de, CeladonGameCornerText_48ed3
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld a, $1
	ld [wCeladonGameCornerCurScript], a
	jp TextScriptEnd

CeladonGameCornerText_48ece: ; 48ece (12:4ece)
	TX_FAR _CeladonGameCornerText_48ece
	db "@"

CeladonGameCornerText_48ed3: ; 48ed3 (12:4ed3)
	TX_FAR _CeladonGameCornerText_48ed3
	db "@"

CeladonGameCornerText13: ; 48ed8 (12:4ed8)
	TX_FAR _CeladonGameCornerText_48ed8
	db "@"

CeladonGameCornerText12: ; 48edd (12:4edd)
	TX_ASM
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

CeladonGameCornerText_48f09: ; 48f09 (12:4f09)
	TX_FAR _CeladonGameCornerText_48f09
	TX_ASM
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

CeladonGameCornerText_48f19: ; 48f19 (12:4f19)
	TX_FAR _CeladonGameCornerText_48f19
	db "@"

CeladonGameCornerScript_48f1e: ; 48f1e (12:4f1e)
	ld hl, wd730
	set 6, [hl]
	coord hl, 11, 0
	ld b, $5
	ld c, $7
	call TextBoxBorder
	call UpdateSprites
	coord hl, 12, 1
	ld b, 4
	ld c, 7
	call ClearScreenArea
	coord hl, 12, 2
	ld de, GameCornerMoneyText
	call PlaceString
	coord hl, 12, 3
	ld de, GameCornerBlankText1
	call PlaceString
	coord hl, 12, 3
	ld de, wPlayerMoney
	ld c, $a3
	call PrintBCDNumber
	coord hl, 12, 4
	ld de, GameCornerCoinText
	call PlaceString
	coord hl, 12, 5
	ld de, GameCornerBlankText2
	call PlaceString
	coord hl, 15, 5
	ld de, wPlayerCoins
	ld c, $82
	call PrintBCDNumber
	ld hl, wd730
	res 6, [hl]
	ret

GameCornerMoneyText: ; 48f7a (12:4f7a)
	db "MONEY@"

GameCornerCoinText: ; 48f80 (12:4f80)
	db "COIN@"

GameCornerBlankText1: ; 48f85 (12:4f85)
	db "       @"

GameCornerBlankText2: ; 48f8d (12:4f8d)
	db "       @"

Has9990Coins: ; 48f95 (12:4f95)
	ld a, $99
	ld [hCoins], a
	ld a, $90
	ld [hCoins + 1], a
	jp HasEnoughCoins
