CeruleanGymScript: ; 5c6b3 (17:46b3)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	call nz, CeruleanGymScript_5c6d0
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanGymTrainerHeaders
	ld de, CeruleanGymScriptPointers
	ld a, [W_CERULEANGYMCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_CERULEANGYMCURSCRIPT], a
	ret

CeruleanGymScript_5c6d0: ; 5c6d0 (17:46d0)
	ld hl, Gym2CityName ; $46d9
	ld de, Gym2LeaderName ; $46e7
	jp LoadGymLeaderAndCityName

Gym2CityName: ; 5c6d9 (17:46d9)
	db "CERULEAN CITY@"

Gym2LeaderName: ; 5c6e7 (17:46e7)
	db "MISTY@"

CeruleanGymScript_5c6ed: ; 5c6ed (17:46ed)
	xor a
	ld [wJoyIgnore], a
	ld [W_CERULEANGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

CeruleanGymScriptPointers: ; 5c6f8 (17:46f8)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw CeruleanGymScript3

CeruleanGymScript3: ; 5c700 (17:4700)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, CeruleanGymScript_5c6ed
	ld a, $f0
	ld [wJoyIgnore], a

CeruleanGymScript_5c70d: ; 5c70d (17:470d)
	ld a, $5
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd75e
	set 7, [hl]
	ld bc, (TM_11 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $6
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd75e
	set 6, [hl]
	jr .asm_5c736
.BagFull
	ld a, $7
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
.asm_5c736
	ld hl, W_OBTAINEDBADGES
	set 1, [hl]
	ld hl, wd72a
	set 1, [hl]

	; deactivate gym trainers
	ld hl, wd75e
	set 2, [hl]
	set 3, [hl]

	jp CeruleanGymScript_5c6ed

CeruleanGymTextPointers: ; 5c74a (17:474a)
	dw CeruleanGymText1
	dw CeruleanGymText2
	dw CeruleanGymText3
	dw CeruleanGymText4
	dw CeruleanGymText5
	dw CeruleanGymText6
	dw CeruleanGymText7

CeruleanGymTrainerHeaders: ; 5c758 (17:4758)
CeruleanGymTrainerHeader0: ; 5c758 (17:4758)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd75e ; flag's byte
	dw CeruleanGymBattleText1 ; 0x47e9 TextBeforeBattle
	dw CeruleanGymAfterBattleText1 ; 0x47f3 TextAfterBattle
	dw CeruleanGymEndBattleText1 ; 0x47ee TextEndBattle
	dw CeruleanGymEndBattleText1 ; 0x47ee TextEndBattle

CeruleanGymTrainerHeader1: ; 5c764 (17:4764)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd75e ; flag's byte
	dw CeruleanGymBattleText2 ; 0x4802 TextBeforeBattle
	dw CeruleanGymAfterBattleText2 ; 0x480c TextAfterBattle
	dw CeruleanGymEndBattleText2 ; 0x4807 TextEndBattle
	dw CeruleanGymEndBattleText2 ; 0x4807 TextEndBattle

	db $ff

CeruleanGymText1: ; 5c771 (17:4771)
	db $08 ; asm
	ld a, [wd75e]
	bit 7, a
	jr z, .asm_10854 ; 0x5c777
	bit 6, a
	jr nz, .asm_37a1b ; 0x5c77b
	call z, CeruleanGymScript_5c70d
	call DisableWaitingAfterTextDisplay
	jr .asm_95b04 ; 0x5c783
.asm_37a1b ; 0x5c785
	ld hl, CeruleanGymText_5c7c3
	call PrintText
	jr .asm_95b04 ; 0x5c78b
.asm_10854 ; 0x5c78d
	ld hl, CeruleanGymText_5c7be
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanGymText_5c7d8
	ld de, CeruleanGymText_5c7d8
	call SaveEndBattleTextPointers
	ldh a, [$8c]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $2
	ld [W_GYMLEADERNO], a
	xor a
	ldh [$b4], a
	ld a, $3
	ld [W_CERULEANGYMCURSCRIPT], a
.asm_95b04 ; 0x5c7bb
	jp TextScriptEnd

CeruleanGymText_5c7be: ; 5c7be (17:47be)
	TX_FAR _CeruleanGymText_5c7be
	db "@"

CeruleanGymText_5c7c3: ; 5c7c3 (17:47c3)
	TX_FAR _CeruleanGymText_5c7c3
	db "@"

CeruleanGymText5: ; 5c7c8 (17:47c8)
	TX_FAR _CeruleanGymText_5c7c8
	db "@"

CeruleanGymText6: ; 5c7cd (17:47cd)
ReceivedTM11Text: ; 5c7cd (17:47cd)
	TX_FAR _ReceivedTM11Text
	db $0B, "@"

CeruleanGymText7: ; 5c7d3 (17:47d3)
	TX_FAR _CeruleanGymText_5c7d3
	db "@"

CeruleanGymText_5c7d8: ; 5c7d8 (17:47d8)
	TX_FAR _CeruleanGymText_5c7d8
	db $11, $6, "@"

CeruleanGymText2: ; 5c7df (17:47df)
	db $08 ; asm
	ld hl, CeruleanGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText1: ; 5c7e9 (17:47e9)
	TX_FAR _CeruleanGymBattleText1
	db "@"

CeruleanGymEndBattleText1: ; 5c7ee (17:47ee)
	TX_FAR _CeruleanGymEndBattleText1
	db "@"

CeruleanGymAfterBattleText1: ; 5c7f3 (17:47f3)
	TX_FAR _CeruleanGymAfterBattleText1
	db "@"

CeruleanGymText3: ; 5c7f8 (17:47f8)
	db $08 ; asm
	ld hl, CeruleanGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText2: ; 5c802 (17:4802)
	TX_FAR _CeruleanGymBattleText2
	db "@"

CeruleanGymEndBattleText2: ; 5c807 (17:4807)
	TX_FAR _CeruleanGymEndBattleText2
	db "@"

CeruleanGymAfterBattleText2: ; 5c80c (17:480c)
	TX_FAR _CeruleanGymAfterBattleText2
	db "@"

CeruleanGymText4: ; 5c811 (17:4811)
	db $08 ; asm
	ld a, [wd75e]
	bit 7, a
	jr nz, .asm_f80ce ; 0x5c817
	ld hl, CeruleanGymText_5c82a
	call PrintText
	jr .asm_18a31 ; 0x5c81f
.asm_f80ce ; 0x5c821
	ld hl, CeruleanGymText_5c82f
	call PrintText
.asm_18a31 ; 0x5c827
	jp TextScriptEnd

CeruleanGymText_5c82a: ; 5c82a (17:482a)
	TX_FAR _CeruleanGymText_5c82a
	db "@"

CeruleanGymText_5c82f: ; 5c82f (17:482f)
	TX_FAR _CeruleanGymText_5c82f
	db "@"
