ViridianGymScript: ; 748a3 (1d:48a3)
	ld hl, Gym8CityName
	ld de, Gym8LeaderName
	call LoadGymLeaderAndCityName
	call EnableAutoTextBoxDrawing
	ld hl, ViridianGymTrainerHeaders
	ld de, ViridianGymScriptPointers
	ld a, [W_VIRIDIANGYMCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VIRIDIANGYMCURSCRIPT], a
	ret

Gym8CityName: ; 748bf (1d:48bf)
	db "VIRIDIAN CITY@"
Gym8LeaderName: ; 748cd (1d:48cd)
	db "GIOVANNI@"

ViridianGymScript_748d6: ; 748d6 (1d:48d6)
	xor a
	ld [wJoyIgnore], a
	ld [W_VIRIDIANGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

ViridianGymScriptPointers: ; 748e1 (1d:48e1)
	dw ViridianGymScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw ViridianGymScript3
	dw ViridianGymScript4

ViridianGymScript0: ; 748eb (1d:48eb)
	ld a, [W_YCOORD] ; wd361
	ld b, a
	ld a, [W_XCOORD] ; wd362
	ld c, a
	ld hl, ViridianGymArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	call StartSimulatingJoypadStates
	ld hl, wd736
	set 7, [hl]
	ld a, (SFX_02_52 - SFX_Headers_02) / 3
	call PlaySound
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $4
	ld [W_CURMAPSCRIPT], a
	ret

;format:
;db y,x
;dw pointer to movement
ViridianGymArrowTilePlayerMovement: ; 74916 (1d:4916)
	db $b,$13
	dw ViridianGymArrowMovement1
	db $1,$13
	dw ViridianGymArrowMovement2
	db $2,$12
	dw ViridianGymArrowMovement3
	db $2,$b
	dw ViridianGymArrowMovement4
	db $a,$10
	dw ViridianGymArrowMovement5
	db $6,$4
	dw ViridianGymArrowMovement6
	db $d,$5
	dw ViridianGymArrowMovement7
	db $e,$4
	dw ViridianGymArrowMovement8
	db $f,$0
	dw ViridianGymArrowMovement9
	db $f,$1
	dw ViridianGymArrowMovement10
	db $10,$d
	dw ViridianGymArrowMovement11
	db $11,$d
	dw ViridianGymArrowMovement12
	db $FF

;format: direction, count
;right:	$10
;left:	$20
;up:	$40
;down:	$80
ViridianGymArrowMovement1: ; 74947 (1d:4947)
	db $40,$09,$FF

ViridianGymArrowMovement2: ; 7494a (1d:494a)
	db $20,$08,$FF

ViridianGymArrowMovement3: ; 7494d (1d:494d)
	db $80,$09,$FF

ViridianGymArrowMovement4: ; 74950 (1d:4950)
	db $10,$06,$FF

ViridianGymArrowMovement5: ; 74953 (1d:4953)
	db $80,$02,$FF

ViridianGymArrowMovement6: ; 74956 (1d:4956)
	db $80,$07,$FF

ViridianGymArrowMovement7: ; 74959 (1d:4959)
	db $10,$08,$FF

ViridianGymArrowMovement8: ; 7495c (1d:495c)
	db $10,$09,$FF

ViridianGymArrowMovement9: ; 7495f (1d:495f)
	db $40,$08,$FF

ViridianGymArrowMovement10: ; 74962 (1d:4962)
	db $40,$06,$FF

ViridianGymArrowMovement11: ; 74965 (1d:4965)
	db $20,$06,$FF

ViridianGymArrowMovement12: ; 74968 (1d:4968)
	db $20,$0C,$FF

ViridianGymScript4: ; 7496b (1d:496b)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .asm_74980
	xor a
	ld [wJoyIgnore], a
	ld hl, wd736
	res 7, [hl]
	ld a, $0
	ld [W_CURMAPSCRIPT], a
	ret
.asm_74980
	ld b, BANK(LoadSpinnerArrowTiles)
	ld hl, LoadSpinnerArrowTiles
	jp Bankswitch

ViridianGymScript3: ; 74988 (1d:4988)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, ViridianGymScript_748d6
	ld a, $f0
	ld [wJoyIgnore], a
ViridianGymScript3_74995: ; 74995 (1d:4995)
	ld a, $c
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd751
	set 1, [hl]
	ld bc, (TM_27 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $d
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd751
	set 0, [hl]
	jr .asm_749be
.BagFull
	ld a, $e
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
.asm_749be
	ld hl, W_OBTAINEDBADGES
	set 7, [hl]
	ld hl, wd72a
	set 7, [hl]

	; deactivate gym trainers
	ld a, [wd751]
	or %11111100
	ld [wd751], a
	ld a, [wd752]
	or %00000011
	ld [wd752], a

	ld a, HS_ROUTE_22_RIVAL_2
	ld [wcc4d], a
	predef ShowObject
	ld hl, wd7eb
	set 1, [hl]
	set 7, [hl]
	jp ViridianGymScript_748d6

ViridianGymTextPointers: ; 749ec (1d:49ec)
	dw ViridianGymText1
	dw ViridianGymText2
	dw ViridianGymText3
	dw ViridianGymText4
	dw ViridianGymText5
	dw ViridianGymText6
	dw ViridianGymText7
	dw ViridianGymText8
	dw ViridianGymText9
	dw ViridianGymText10
	dw Predef5CText
	dw ViridianGymText12
	dw ViridianGymText13
	dw ViridianGymText14

ViridianGymTrainerHeaders: ; 74a08 (1d:4a08)
ViridianGymTrainerHeader0: ; 74a08 (1d:4a08)
	db $2 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText1 ; 0x4afd TextBeforeBattle
	dw ViridianGymAfterBattleText1 ; 0x4b07 TextAfterBattle
	dw ViridianGymEndBattleText1 ; 0x4b02 TextEndBattle
	dw ViridianGymEndBattleText1 ; 0x4b02 TextEndBattle

ViridianGymTrainerHeader1: ; 74a14 (1d:4a14)
	db $3 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText2 ; 0x4b16 TextBeforeBattle
	dw ViridianGymAfterBattleText2 ; 0x4b20 TextAfterBattle
	dw ViridianGymEndBattleText2 ; 0x4b1b TextEndBattle
	dw ViridianGymEndBattleText2 ; 0x4b1b TextEndBattle

ViridianGymTrainerHeader2: ; 74a20 (1d:4a20)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText3 ; 0x4b2f TextBeforeBattle
	dw ViridianGymAfterBattleText3 ; 0x4b39 TextAfterBattle
	dw ViridianGymEndBattleText3 ; 0x4b34 TextEndBattle
	dw ViridianGymEndBattleText3 ; 0x4b34 TextEndBattle

ViridianGymTrainerHeader3: ; 74a2c (1d:4a2c)
	db $5 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText4 ; 0x4b48 TextBeforeBattle
	dw ViridianGymAfterBattleText4 ; 0x4b52 TextAfterBattle
	dw ViridianGymEndBattleText4 ; 0x4b4d TextEndBattle
	dw ViridianGymEndBattleText4 ; 0x4b4d TextEndBattle

ViridianGymTrainerHeader4: ; 74a38 (1d:4a38)
	db $6 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText5 ; 0x4b61 TextBeforeBattle
	dw ViridianGymAfterBattleText5 ; 0x4b6b TextAfterBattle
	dw ViridianGymEndBattleText5 ; 0x4b66 TextEndBattle
	dw ViridianGymEndBattleText5 ; 0x4b66 TextEndBattle

ViridianGymTrainerHeader5: ; 74a44 (1d:4a44)
	db $7 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText6 ; 0x4b7a TextBeforeBattle
	dw ViridianGymAfterBattleText6 ; 0x4b84 TextAfterBattle
	dw ViridianGymEndBattleText6 ; 0x4b7f TextEndBattle
	dw ViridianGymEndBattleText6 ; 0x4b7f TextEndBattle

ViridianGymTrainerHeader6: ; 74a50 (1d:4a50)
	db $8 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText7 ; 0x4b93 TextBeforeBattle
	dw ViridianGymAfterBattleText7 ; 0x4b9d TextAfterBattle
	dw ViridianGymEndBattleText7 ; 0x4b98 TextEndBattle
	dw ViridianGymEndBattleText7 ; 0x4b98 TextEndBattle

ViridianGymTrainerHeader7: ; 74a5c (1d:4a5c)
	db $9 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd751 ; flag's byte
	dw ViridianGymBattleText8 ; 0x4bac TextBeforeBattle
	dw ViridianGymAfterBattleText8 ; 0x4bb6 TextAfterBattle
	dw ViridianGymEndBattleText8 ; 0x4bb1 TextEndBattle
	dw ViridianGymEndBattleText8 ; 0x4bb1 TextEndBattle

	db $ff

ViridianGymText1: ; 74a69 (1d:4a69)
	db $08 ; asm
	ld a, [wd751]
	bit 1, a
	jr z, .asm_6de66 ; 0x74a6f
	bit 0, a
	jr nz, .asm_9fc95 ; 0x74a73
	call z, ViridianGymScript3_74995
	call DisableWaitingAfterTextDisplay
	jr .asm_6dff7 ; 0x74a7b
.asm_9fc95 ; 0x74a7d
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, ViridianGymText_74ad9
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_VIRIDIAN_GYM_GIOVANNI
	ld [wcc4d], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	jr .asm_6dff7 ; 0x74a9e
.asm_6de66 ; 0x74aa0
	ld hl, ViridianGymText_74ace
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ViridianGymText_74ad3
	ld de, ViridianGymText_74ad3
	call SaveEndBattleTextPointers
	ldh a, [$8c]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $8
	ld [W_GYMLEADERNO], a
	ld a, $3
	ld [W_VIRIDIANGYMCURSCRIPT], a
.asm_6dff7 ; 0x74acb
	jp TextScriptEnd

ViridianGymText_74ace: ; 74ace (1d:4ace)
	TX_FAR _ViridianGymText_74ace
	db "@"

ViridianGymText_74ad3: ; 74ad3 (1d:4ad3)
	TX_FAR _ViridianGymText_74ad3
	db $0b, "@"

ViridianGymText_74ad9: ; 74ad9 (1d:4ad9)
	TX_FAR _ViridianGymText_74ad9
	db $0d, "@"

ViridianGymText12: ; 74adf (1d:4adf)
	TX_FAR _ViridianGymText12
	db "@"

ViridianGymText13: ; 74ae4 (1d:4ae4)
	TX_FAR _ReceivedTM27Text
	db $0b

TM27ExplanationText: ; 74ae9 (1d:4ae9)
	TX_FAR _TM27ExplanationText
	db "@"

ViridianGymText14: ; 74aee (1d:4aee)
	TX_FAR _TM27NoRoomText
	db "@"

ViridianGymText2: ; 74af3 (1d:4af3)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText1: ; 74afd (1d:4afd)
	TX_FAR _ViridianGymBattleText1
	db "@"

ViridianGymEndBattleText1: ; 74b02 (1d:4b02)
	TX_FAR _ViridianGymEndBattleText1
	db "@"

ViridianGymAfterBattleText1: ; 74b07 (1d:4b07)
	TX_FAR _ViridianGymAfterBattleText1
	db "@"

ViridianGymText3: ; 74b0c (1d:4b0c)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText2: ; 74b16 (1d:4b16)
	TX_FAR _ViridianGymBattleText2
	db "@"

ViridianGymEndBattleText2: ; 74b1b (1d:4b1b)
	TX_FAR _ViridianGymEndBattleText2
	db "@"

ViridianGymAfterBattleText2: ; 74b20 (1d:4b20)
	TX_FAR _ViridianGymAfterBattleText2
	db "@"

ViridianGymText4: ; 74b25 (1d:4b25)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText3: ; 74b2f (1d:4b2f)
	TX_FAR _ViridianGymBattleText3
	db "@"

ViridianGymEndBattleText3: ; 74b34 (1d:4b34)
	TX_FAR _ViridianGymEndBattleText3
	db "@"

ViridianGymAfterBattleText3: ; 74b39 (1d:4b39)
	TX_FAR _ViridianGymAfterBattleText3
	db "@"

ViridianGymText5: ; 74b3e (1d:4b3e)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText4: ; 74b48 (1d:4b48)
	TX_FAR _ViridianGymBattleText4
	db "@"

ViridianGymEndBattleText4: ; 74b4d (1d:4b4d)
	TX_FAR _ViridianGymEndBattleText4
	db "@"

ViridianGymAfterBattleText4: ; 74b52 (1d:4b52)
	TX_FAR _ViridianGymAfterBattleText4
	db "@"

ViridianGymText6: ; 74b57 (1d:4b57)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText5: ; 74b61 (1d:4b61)
	TX_FAR _ViridianGymBattleText5
	db "@"

ViridianGymEndBattleText5: ; 74b66 (1d:4b66)
	TX_FAR _ViridianGymEndBattleText5
	db "@"

ViridianGymAfterBattleText5: ; 74b6b (1d:4b6b)
	TX_FAR _ViridianGymAfterBattleText5
	db "@"

ViridianGymText7: ; 74b70 (1d:4b70)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText6: ; 74b7a (1d:4b7a)
	TX_FAR _ViridianGymBattleText6
	db "@"

ViridianGymEndBattleText6: ; 74b7f (1d:4b7f)
	TX_FAR _ViridianGymEndBattleText6
	db "@"

ViridianGymAfterBattleText6: ; 74b84 (1d:4b84)
	TX_FAR _ViridianGymAfterBattleText6
	db "@"

ViridianGymText8: ; 74b89 (1d:4b89)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText7: ; 74b93 (1d:4b93)
	TX_FAR _ViridianGymBattleText7
	db "@"

ViridianGymEndBattleText7: ; 74b98 (1d:4b98)
	TX_FAR _ViridianGymEndBattleText7
	db "@"

ViridianGymAfterBattleText7: ; 74b9d (1d:4b9d)
	TX_FAR _ViridianGymAfterBattleText7
	db "@"

ViridianGymText9: ; 74ba2 (1d:4ba2)
	db $08 ; asm
	ld hl, ViridianGymTrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText8: ; 74bac (1d:4bac)
	TX_FAR _ViridianGymBattleText8
	db "@"

ViridianGymEndBattleText8: ; 74bb1 (1d:4bb1)
	TX_FAR _ViridianGymEndBattleText8
	db "@"

ViridianGymAfterBattleText8: ; 74bb6 (1d:4bb6)
	TX_FAR _ViridianGymAfterBattleText8
	db "@"

ViridianGymText10: ; 74bbb (1d:4bbb)
	db $08 ; asm
	ld a, [wd751]
	bit 1, a
	jr nz, .asm_1abd1 ; 0x74bc1
	ld hl, ViridianGymText_74bd4
	call PrintText
	jr .asm_6064d ; 0x74bc9
.asm_1abd1 ; 0x74bcb
	ld hl, ViridianGymText_74bd9
	call PrintText
.asm_6064d ; 0x74bd1
	jp TextScriptEnd

ViridianGymText_74bd4: ; 74bd4 (1d:4bd4)
	TX_FAR _ViridianGymText_74bd4
	db "@"

ViridianGymText_74bd9: ; 74bd9 (1d:4bd9)
	TX_FAR _ViridianGymText_74bd9
	db "@"
