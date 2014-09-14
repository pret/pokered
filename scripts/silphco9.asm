SilphCo9Script: ; 5d7bb (17:57bb)
	call SilphCo9Script_5d7d1
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo9TrainerHeaders
	ld de, SilphCo9ScriptPointers
	ld a, [W_SILPHCO9CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO9CURSCRIPT], a
	ret

SilphCo9Script_5d7d1: ; 5d7d1 (17:57d1)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, DataTable_5d82e ; $582e
	call SilphCo9Script_5d837
	call SilphCo9Script_5d863
	ld a, [wd834]
	bit 0, a
	jr nz, .asm_5d7f8
	push af
	ld a, $5f
	ld [wd09f], a
	ld bc, $401
	predef ReplaceTileBlock
	pop af
.asm_5d7f8
	bit 1, a
	jr nz, .asm_5d80b
	push af
	ld a, $54
	ld [wd09f], a
	ld bc, $209
	predef ReplaceTileBlock
	pop af
.asm_5d80b
	bit 2, a
	jr nz, .asm_5d81e
	push af
	ld a, $54
	ld [wd09f], a
	ld bc, $509
	predef ReplaceTileBlock
	pop af
.asm_5d81e
	bit 3, a
	ret nz
	ld a, $5f
	ld [wd09f], a
	ld bc, $605
	predef_jump ReplaceTileBlock

DataTable_5d82e: ; 5d82e (17:582e)
	db $04,$01,$02,$09,$05,$09,$06,$05,$FF

SilphCo9Script_5d837: ; 5d837 (17:5837)
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
	pop hl
.asm_5d843
	ld a, [hli]
	cp $ff
	jr z, .asm_5d85f
	push hl
	ld hl, $ffe0
	inc [hl]
	pop hl
	cp b
	jr z, .asm_5d854
	inc hl
	jr .asm_5d843
.asm_5d854
	ld a, [hli]
	cp c
	jr nz, .asm_5d843
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_5d85f
	xor a
	ld [$ffe0], a
	ret

SilphCo9Script_5d863: ; 5d863 (17:5863)
	ld hl, wd834
	ld a, [$ffe0]
	and a
	ret z
	cp $1
	jr nz, .asm_5d871
	set 0, [hl]
	ret
.asm_5d871
	cp $2
	jr nz, .asm_5d878
	set 1, [hl]
	ret
.asm_5d878
	cp $3
	jr nz, .asm_5d87f
	set 2, [hl]
	ret
.asm_5d87f
	cp $4
	ret nz
	set 3, [hl]
	ret

SilphCo9ScriptPointers: ; 5d885 (17:5885)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo9TextPointers: ; 5d88b (17:588b)
	dw SilphCo9Text1
	dw SilphCo9Text2
	dw SilphCo9Text3
	dw SilphCo9Text4

SilphCo9TrainerHeaders: ; 5d893 (17:5893)
SilphCo9TrainerHeader0: ; 5d893 (17:5893)
	db $2 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd833 ; flag's byte
	dw SilphCo9BattleText1 ; 0x5912 TextBeforeBattle
	dw SilphCo9AfterBattleText1 ; 0x591c TextAfterBattle
	dw SilphCo9EndBattleText1 ; 0x5917 TextEndBattle
	dw SilphCo9EndBattleText1 ; 0x5917 TextEndBattle

SilphCo9TrainerHeader1: ; 5d89f (17:589f)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd833 ; flag's byte
	dw SilphCo9BattleText2 ; 0x5921 TextBeforeBattle
	dw SilphCo9AfterBattleText2 ; 0x592b TextAfterBattle
	dw SilphCo9EndBattleText2 ; 0x5926 TextEndBattle
	dw SilphCo9EndBattleText2 ; 0x5926 TextEndBattle

SilphCo9TrainerHeader2: ; 5d8ab (17:58ab)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd833 ; flag's byte
	dw SilphCo9BattleText3 ; 0x5930 TextBeforeBattle
	dw SilphCo9AfterBattleText3 ; 0x593a TextAfterBattle
	dw SilphCo9EndBattleText3 ; 0x5935 TextEndBattle
	dw SilphCo9EndBattleText3 ; 0x5935 TextEndBattle

	db $ff

SilphCo9Text1: ; 5d8b8 (17:58b8)
	db $08 ; asm
	ld a, [wd838]
	bit 7, a
	jr nz, .asm_a14c3 ; 0x5d8be
	ld hl, SilphCo9Text_5d8e5
	call PrintText
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	ld hl, SilphCo9Text_5d8ea
	call PrintText
	jr .asm_b6e28 ; 0x5d8da
.asm_a14c3 ; 0x5d8dc
	ld hl, SilphCo9Text_5d8ef
	call PrintText
.asm_b6e28 ; 0x5d8e2
	jp TextScriptEnd

SilphCo9Text_5d8e5: ; 5d8e5 (17:58e5)
	TX_FAR _SilphCo9Text_5d8e5
	db "@"

SilphCo9Text_5d8ea: ; 5d8ea (17:58ea)
	TX_FAR _SilphCo9Text_5d8ea
	db "@"

SilphCo9Text_5d8ef: ; 5d8ef (17:58ef)
	TX_FAR _SilphCo9Text_5d8ef
	db "@"

SilphCo9Text2: ; 5d8f4 (17:58f4)
	db $08 ; asm
	ld hl, SilphCo9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9Text3: ; 5d8fe (17:58fe)
	db $08 ; asm
	ld hl, SilphCo9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9Text4: ; 5d908 (17:5908)
	db $08 ; asm
	ld hl, SilphCo9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9BattleText1: ; 5d912 (17:5912)
	TX_FAR _SilphCo9BattleText1
	db "@"

SilphCo9EndBattleText1: ; 5d917 (17:5917)
	TX_FAR _SilphCo9EndBattleText1
	db "@"

SilphCo9AfterBattleText1: ; 5d91c (17:591c)
	TX_FAR _SilphCo9AfterBattleText1
	db "@"

SilphCo9BattleText2: ; 5d921 (17:5921)
	TX_FAR _SilphCo9BattleText2
	db "@"

SilphCo9EndBattleText2: ; 5d926 (17:5926)
	TX_FAR _SilphCo9EndBattleText2
	db "@"

SilphCo9AfterBattleText2: ; 5d92b (17:592b)
	TX_FAR _SilphCo9AfterBattleText2
	db "@"

SilphCo9BattleText3: ; 5d930 (17:5930)
	TX_FAR _SilphCo9BattleText3
	db "@"

SilphCo9EndBattleText3: ; 5d935 (17:5935)
	TX_FAR _SilphCo9EndBattleText3
	db "@"

SilphCo9AfterBattleText3: ; 5d93a (17:593a)
	TX_FAR _SilphCo9AfterBattleText3
	db "@"
