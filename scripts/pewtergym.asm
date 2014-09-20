PewterGymScript: ; 5c387 (17:4387)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	call nz, PewterGymScript_5c3a4
	call EnableAutoTextBoxDrawing
	ld hl, PewterGymTrainerHeaders
	ld de, PewterGymScriptPointers
	ld a, [W_PEWTERGYMCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_PEWTERGYMCURSCRIPT], a
	ret

PewterGymScript_5c3a4: ; 5c3a4 (17:43a4)
	ld hl, Gym1CityName ; $43ad
	ld de, Gym1LeaderName ; $43b9
	jp LoadGymLeaderAndCityName

Gym1CityName: ; 5c3ad (17:43ad)
	db "PEWTER CITY@"

Gym1LeaderName: ; 5c3b9 (17:43b9)
	db "BROCK@"

PewterGymScript_5c3bf: ; 5c3bf (17:43bf)
	xor a
	ld [wJoyIgnore], a
	ld [W_PEWTERGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PewterGymScriptPointers: ; 5c3ca (17:43ca)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw PewterGymScript3

PewterGymScript3: ; 5c3d2 (17:43d2)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, PewterGymScript_5c3bf
	ld a, $f0
	ld [wJoyIgnore], a

PewterGymScript_5c3df: ; 5c3df (17:43df)
	ld a, $4
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd755
	set 7, [hl]
	ld bc, (TM_34 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $5
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd755
	set 6, [hl]
	jr .asm_5c408
.BagFull
	ld a, $6
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
.asm_5c408
	ld hl, W_OBTAINEDBADGES
	set 0, [hl]
	ld hl, wd72a
	set 0, [hl]

	ld a, $4
	ld [wcc4d], a
	predef HideObject
	ld a, $22
	ld [wcc4d], a
	predef HideObject

	ld hl, wd7eb
	res 0, [hl]
	res 7, [hl]

	; deactivate gym trainers
	ld hl, wd755
	set 2, [hl]

	jp PewterGymScript_5c3bf

PewterGymTextPointers: ; 5c435 (17:4435)
	dw PewterGymText1
	dw PewterGymText2
	dw PewterGymText3
	dw PewterGymText4
	dw PewterGymText5
	dw PewterGymText6

PewterGymTrainerHeaders: ; 5c441 (17:4441)
PewterGymTrainerHeader0: ; 5c441 (17:4441)
	db $2 ; flag's bit
	db ($5 << 4) ; trainer's view range
	dw wd755 ; flag's byte
	dw PewterGymBattleText1 ; 0x44d0 TextBeforeBattle
	dw PewterGymAfterBattleText1 ; 0x44da TextAfterBattle
	dw PewterGymEndBattleText1 ; 0x44d5 TextEndBattle
	dw PewterGymEndBattleText1 ; 0x44d5 TextEndBattle

	db $ff

PewterGymText1: ; 5c44e (17:444e)
	db $08 ; asm
	ld a, [wd755]
	bit 7, a
	jr z, .asm_4a735 ; 0x5c454
	bit 6, a
	jr nz, .asm_ff7d0 ; 0x5c458
	call z, PewterGymScript_5c3df
	call DisableWaitingAfterTextDisplay
	jr .asm_e0ffb ; 0x5c460
.asm_ff7d0 ; 0x5c462
	ld hl, PewterGymText_5c4a3
	call PrintText
	jr .asm_e0ffb ; 0x5c468
.asm_4a735 ; 0x5c46a
	ld hl, PewterGymText_5c49e
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, PewterGymText_5c4bc
	ld de, PewterGymText_5c4bc
	call SaveEndBattleTextPointers
	ldh a, [$8c]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $1
	ld [W_GYMLEADERNO], a
	xor a
	ldh [$b4], a
	ld a, $3
	ld [W_PEWTERGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
.asm_e0ffb ; 0x5c49b
	jp TextScriptEnd

PewterGymText_5c49e: ; 5c49e (17:449e)
	TX_FAR _PewterGymText_5c49e
	db "@"

PewterGymText_5c4a3: ; 5c4a3 (17:44a3)
	TX_FAR _PewterGymText_5c4a3
	db "@"

PewterGymText4: ; 5c4a8 (17:44a8)
	TX_FAR _TM34PreReceiveText
	db "@"

PewterGymText5: ; 5c4ad (17:44ad)
	TX_FAR _ReceivedTM34Text
	db $0B
	TX_FAR _TM34ExplanationText
	db "@"

PewterGymText6: ; 5c4b7 (17:44b7)
	TX_FAR _TM34NoRoomText
	db "@"

PewterGymText_5c4bc: ; 5c4bc (17:44bc)
	TX_FAR _PewterGymText_5c4bc
	db $0B
	TX_FAR _PewterGymText_5c4c1
	db "@"

PewterGymText2: ; 5c4c6 (17:44c6)
	db $08 ; asm
	ld hl, PewterGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PewterGymBattleText1: ; 5c4d0 (17:44d0)
	TX_FAR _PewterGymBattleText1
	db "@"

PewterGymEndBattleText1: ; 5c4d5 (17:44d5)
	TX_FAR _PewterGymEndBattleText1
	db "@"

PewterGymAfterBattleText1: ; 5c4da (17:44da)
	TX_FAR _PewterGymAfterBattleText1
	db "@"

PewterGymText3: ; 5c4df (17:44df)
	db $08 ; asm
	ld a, [wd72a]
	bit 0, a
	jr nz, .asm_71369 ; 0x5c4e5
	ld hl, PewterGymText_5c515
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_6123a ; 0x5c4f4
	ld hl, PewterGymText_5c51a
	call PrintText
	jr .asm_d1578 ; 0x5c4fc
.asm_6123a ; 0x5c4fe
	ld hl, PewterGymText_5c524
	call PrintText
.asm_d1578 ; 0x5c504
	ld hl, PewterGymText_5c51f
	call PrintText
	jr .asm_07013 ; 0x5c50a
.asm_71369 ; 0x5c50c
	ld hl, PewterGymText_5c529
	call PrintText
.asm_07013 ; 0x5c512
	jp TextScriptEnd

PewterGymText_5c515: ; 5c515 (17:4515)
	TX_FAR _PewterGymText_5c515
	db "@"

PewterGymText_5c51a: ; 5c51a (17:451a)
	TX_FAR _PewterGymText_5c51a
	db "@"

PewterGymText_5c51f: ; 5c51f (17:451f)
	TX_FAR _PewterGymText_5c51f
	db "@"

PewterGymText_5c524: ; 5c524 (17:4524)
	TX_FAR _PewterGymText_5c524
	db "@"

PewterGymText_5c529: ; 5c529 (17:4529)
	TX_FAR _PewterGymText_5c529
	db "@"
