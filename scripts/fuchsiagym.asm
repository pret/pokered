FuchsiaGymScript: ; 7543d (1d:543d)
	call FuchsiaGymScript_75453
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaGymTrainerHeaders
	ld de, FuchsiaGymScriptPointers
	ld a, [W_FUCHSIAGYMCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_FUCHSIAGYMCURSCRIPT], a
	ret

FuchsiaGymScript_75453: ; 75453 (1d:5453)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	ret z
	ld hl, Gym5CityName
	ld de, Gym5LeaderName
	call LoadGymLeaderAndCityName
	ret

Gym5CityName: ; 75465 (1d:5465)
	db "FUCHSIA CITY@"
Gym5LeaderName: ; 75472 (1d:5472)
	db "KOGA@"

FuchsiaGymScript_75477: ; 75477 (1d:5477)
	xor a
	ld [wJoyIgnore], a
	ld [W_FUCHSIAGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

FuchsiaGymScriptPointers: ; 75482 (1d:5482)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw FuchsiaGymScript3

FuchsiaGymScript3: ; 7548a (1d:548a)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, FuchsiaGymScript_75477
	ld a, $f0
	ld [wJoyIgnore], a
FuchsiaGymScript3_75497: ; 75497 (1d:5497)
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd792
	set 1, [hl]
	ld bc, (TM_06 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $a
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd792
	set 0, [hl]
	jr .asm_754c0
.BagFull
	ld a, $b
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
.asm_754c0
	ld hl, W_OBTAINEDBADGES
	set 4, [hl]
	ld hl, wd72a
	set 4, [hl]

	; deactivate gym trainers
	ld a, [wd792]
	or %11111100
	ld [wd792], a

	jp FuchsiaGymScript_75477

FuchsiaGymTextPointers: ; 754d5 (1d:54d5)
	dw FuchsiaGymText1
	dw FuchsiaGymText2
	dw FuchsiaGymText3
	dw FuchsiaGymText4
	dw FuchsiaGymText5
	dw FuchsiaGymText6
	dw FuchsiaGymText7
	dw FuchsiaGymText8
	dw FuchsiaGymText9
	dw FuchsiaGymText10
	dw FuchsiaGymText11

FuchsiaGymTrainerHeaders: ; 754eb (1d:54eb)
FuchsiaGymTrainerHeader0: ; 754eb (1d:54eb)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd792 ; flag's byte
	dw FuchsiaGymBattleText1 ; 0x55ae TextBeforeBattle
	dw FuchsiaGymAfterBattleText1 ; 0x55b8 TextAfterBattle
	dw FuchsiaGymEndBattleText1 ; 0x55b3 TextEndBattle
	dw FuchsiaGymEndBattleText1 ; 0x55b3 TextEndBattle

FuchsiaGymTrainerHeader2: ; 754f7 (1d:54f7)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd792 ; flag's byte
	dw FuchsiaGymBattleText2 ; 0x55c7 TextBeforeBattle
	dw FuchsiaGymAfterBattleText2 ; 0x55d1 TextAfterBattle
	dw FuchsiaGymEndBattleText2 ; 0x55cc TextEndBattle
	dw FuchsiaGymEndBattleText2 ; 0x55cc TextEndBattle

FuchsiaGymTrainerHeader3: ; 75503 (1d:5503)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd792 ; flag's byte
	dw FuchsiaGymBattleText3 ; 0x55e0 TextBeforeBattle
	dw FuchsiaGymAfterBattleText3 ; 0x55ea TextAfterBattle
	dw FuchsiaGymEndBattleText3 ; 0x55e5 TextEndBattle
	dw FuchsiaGymEndBattleText3 ; 0x55e5 TextEndBattle

FuchsiaGymTrainerHeader4: ; 7550f (1d:550f)
	db $5 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd792 ; flag's byte
	dw FuchsiaGymBattleText4 ; 0x55f9 TextBeforeBattle
	dw FuchsiaGymAfterBattleText4 ; 0x5603 TextAfterBattle
	dw FuchsiaGymEndBattleText4 ; 0x55fe TextEndBattle
	dw FuchsiaGymEndBattleText4 ; 0x55fe TextEndBattle

FuchsiaGymTrainerHeader5: ; 7551b (1d:551b)
	db $6 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd792 ; flag's byte
	dw FuchsiaGymBattleText5 ; 0x5612 TextBeforeBattle
	dw FuchsiaGymAfterBattleText5 ; 0x561c TextAfterBattle
	dw FuchsiaGymEndBattleText5 ; 0x5617 TextEndBattle
	dw FuchsiaGymEndBattleText5 ; 0x5617 TextEndBattle

FuchsiaGymTrainerHeader6: ; 75527 (1d:5527)
	db $7 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd792 ; flag's byte
	dw FuchsiaGymBattleText6 ; 0x562b TextBeforeBattle
	dw FuchsiaGymAfterBattleText6 ; 0x5635 TextAfterBattle
	dw FuchsiaGymEndBattleText6 ; 0x5630 TextEndBattle
	dw FuchsiaGymEndBattleText6 ; 0x5630 TextEndBattle

	db $ff

FuchsiaGymText1: ; 75534 (1d:5534)
	db $08 ; asm
	ld a, [wd792]
	bit 1, a
	jr z, .asm_181b6 ; 0x7553a
	bit 0, a
	jr nz, .asm_adc3b ; 0x7553e
	call z, FuchsiaGymScript3_75497
	call DisableWaitingAfterTextDisplay
	jr .asm_e84c6 ; 0x75546
.asm_adc3b ; 0x75548
	ld hl, UnnamedText_7558b
	call PrintText
	jr .asm_e84c6 ; 0x7554e
.asm_181b6 ; 0x75550
	ld hl, UnnamedText_75581
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, UnnamedText_75586
	ld de, UnnamedText_75586
	call SaveEndBattleTextPointers
	ldh a, [$8c]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $5
	ld [W_GYMLEADERNO], a
	xor a
	ldh [$b4], a
	ld a, $3
	ld [W_FUCHSIAGYMCURSCRIPT], a
.asm_e84c6 ; 0x7557e
	jp TextScriptEnd

UnnamedText_75581: ; 75581 (1d:5581)
	TX_FAR _UnnamedText_75581
	db "@"

UnnamedText_75586: ; 75586 (1d:5586)
	TX_FAR _UnnamedText_75586
	db "@"

UnnamedText_7558b: ; 7558b (1d:558b)
	TX_FAR _UnnamedText_7558b
	db "@"

FuchsiaGymText9: ; 75590 (1d:5590)
	TX_FAR _UnnamedText_75590
	db "@"

FuchsiaGymText10: ; 75595 (1d:5595)
	TX_FAR _ReceivedTM06Text
	db $11

TM06ExplanationText: ; 7559a (1d:559a)
	TX_FAR _TM06ExplanationText
	db "@"

FuchsiaGymText11: ; 7559f (1d:559f)
	TX_FAR _TM06NoRoomText
	db "@"

FuchsiaGymText2: ; 755a4 (1d:55a4)
	db $08 ; asm
	ld hl, FuchsiaGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText1: ; 755ae (1d:55ae)
	TX_FAR _FuchsiaGymBattleText1
	db "@"

FuchsiaGymEndBattleText1: ; 755b3 (1d:55b3)
	TX_FAR _FuchsiaGymEndBattleText1
	db "@"

FuchsiaGymAfterBattleText1: ; 755b8 (1d:55b8)
	TX_FAR _FuchsiaGymAfterBattleText1
	db "@"

FuchsiaGymText3: ; 755bd (1d:55bd)
	db $08 ; asm
	ld hl, FuchsiaGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText2: ; 755c7 (1d:55c7)
	TX_FAR _FuchsiaGymBattleText2
	db "@"

FuchsiaGymEndBattleText2: ; 755cc (1d:55cc)
	TX_FAR _FuchsiaGymEndBattleText2
	db "@"

FuchsiaGymAfterBattleText2: ; 755d1 (1d:55d1)
	TX_FAR _FuchsiaGymAfterBattleText2
	db "@"

FuchsiaGymText4: ; 755d6 (1d:55d6)
	db $08 ; asm
	ld hl, FuchsiaGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText3: ; 755e0 (1d:55e0)
	TX_FAR _FuchsiaGymBattleText3
	db "@"

FuchsiaGymEndBattleText3: ; 755e5 (1d:55e5)
	TX_FAR _FuchsiaGymEndBattleText3
	db "@"

FuchsiaGymAfterBattleText3: ; 755ea (1d:55ea)
	TX_FAR _FuchsiaGymAfterBattleText3
	db "@"

FuchsiaGymText5: ; 755ef (1d:55ef)
	db $08 ; asm
	ld hl, FuchsiaGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText4: ; 755f9 (1d:55f9)
	TX_FAR _FuchsiaGymBattleText4
	db "@"

FuchsiaGymEndBattleText4: ; 755fe (1d:55fe)
	TX_FAR _FuchsiaGymEndBattleText4
	db "@"

FuchsiaGymAfterBattleText4: ; 75603 (1d:5603)
	TX_FAR _FuchsiaGymAfterBattleText4
	db "@"

FuchsiaGymText6: ; 75608 (1d:5608)
	db $08 ; asm
	ld hl, FuchsiaGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText5: ; 75612 (1d:5612)
	TX_FAR _FuchsiaGymBattleText5
	db "@"

FuchsiaGymEndBattleText5: ; 75617 (1d:5617)
	TX_FAR _FuchsiaGymEndBattleText5
	db "@"

FuchsiaGymAfterBattleText5: ; 7561c (1d:561c)
	TX_FAR _FuchsiaGymAfterBattleText5
	db "@"

FuchsiaGymText7: ; 75621 (1d:5621)
	db $08 ; asm
	ld hl, FuchsiaGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText6: ; 7562b (1d:562b)
	TX_FAR _FuchsiaGymBattleText6
	db "@"

FuchsiaGymEndBattleText6: ; 75630 (1d:5630)
	TX_FAR _FuchsiaGymEndBattleText6
	db "@"

FuchsiaGymAfterBattleText6: ; 75635 (1d:5635)
	TX_FAR _FuchsiaGymAfterBattleText6
	db "@"

FuchsiaGymText8: ; 7563a (1d:563a)
	db $08 ; asm
	ld a, [wd792]
	bit 1, a
	ld hl, UnnamedText_75653
	jr nz, .asm_50671 ; 0x75643
	ld hl, UnnamedText_7564e
.asm_50671 ; 0x75648
	call PrintText
	jp TextScriptEnd

UnnamedText_7564e: ; 7564e (1d:564e)
	TX_FAR _UnnamedText_7564e
	db "@"

UnnamedText_75653: ; 75653 (1d:5653)
	TX_FAR _UnnamedText_75653
	db "@"
