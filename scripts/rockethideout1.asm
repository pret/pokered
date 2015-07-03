RocketHideout1Script: ; 44bca (11:4bca)
	call RocketHideout1Script_44be0
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout1TrainerHeaders
	ld de, RocketHideout1ScriptPointers
	ld a, [W_ROCKETHIDEOUT1CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROCKETHIDEOUT1CURSCRIPT], a
	ret

RocketHideout1Script_44be0: ; 44be0 (11:4be0)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [wd815]
	bit 7, a
	jr nz, .asm_44c01
	bit 5, a
	jr nz, .asm_44bf7
	ld a, $54
	jr .asm_44c03
.asm_44bf7
	ld a, (SFX_02_57 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wd815
	bit 7, [hl]
.asm_44c01
	ld a, $e
.asm_44c03
	ld [wd09f], a
	ld bc, $080c
	predef_jump ReplaceTileBlock

RocketHideout1ScriptPointers: ; 44c0e (11:4c0e)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RocketHideout1TextPointers: ; 44c14 (11:4c14)
	dw RocketHideout1Text1
	dw RocketHideout1Text2
	dw RocketHideout1Text3
	dw RocketHideout1Text4
	dw RocketHideout1Text5
	dw Predef5CText
	dw Predef5CText

RocketHideout1TrainerHeaders: ; 44c22 (11:4c22)
RocketHideout1TrainerHeader0: ; 44c22 (11:4c22)
	db $1 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd815 ; flag's byte
	dw RocketHideout1BattleText2 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt2 ; TextAfterBattle
	dw RocketHideout1EndBattleText2 ; TextEndBattle
	dw RocketHideout1EndBattleText2 ; TextEndBattle

RocketHideout1TrainerHeader2: ; 44c2e (11:4c2e)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd815 ; flag's byte
	dw RocketHideout1BattleText3 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt3 ; TextAfterBattle
	dw RocketHideout1EndBattleText3 ; TextEndBattle
	dw RocketHideout1EndBattleText3 ; TextEndBattle

RocketHideout1TrainerHeader3: ; 44c3a (11:4c3a)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd815 ; flag's byte
	dw RocketHideout1BattleText4 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt4 ; TextAfterBattle
	dw RocketHideout1EndBattleText4 ; TextEndBattle
	dw RocketHideout1EndBattleText4 ; TextEndBattle

RocketHideout1TrainerHeader4: ; 44c46 (11:4c46)
	db $4 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd815 ; flag's byte
	dw RocketHideout1BattleText5 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt5 ; TextAfterBattle
	dw RocketHideout1EndBattleText5 ; TextEndBattle
	dw RocketHideout1EndBattleText5 ; TextEndBattle

RocketHideout1TrainerHeader5: ; 44c52 (11:4c52)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd815 ; flag's byte
	dw RocketHideout1BattleText6 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt6 ; TextAfterBattle
	dw RocketHideout1EndBattleText6 ; TextEndBattle
	dw RocketHideout1EndBattleText6 ; TextEndBattle

	db $ff

RocketHideout1Text1: ; 44c5f (11:4c5f)
	TX_ASM
	ld hl, RocketHideout1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text2: ; 44c69 (11:4c69)
	TX_ASM
	ld hl, RocketHideout1TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text3: ; 44c73 (11:4c73)
	TX_ASM
	ld hl, RocketHideout1TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text4: ; 44c7d (11:4c7d)
	TX_ASM
	ld hl, RocketHideout1TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text5: ; 44c87 (11:4c87)
	TX_ASM
	ld hl, RocketHideout1TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1EndBattleText6: ; 44c91 (11:4c91)
	TX_FAR _RocketHideout1EndBattleText6
	TX_ASM
	ld hl, wd815
	set 5, [hl]
	ld hl, RocketHideout1Text_44c9f
	ret

RocketHideout1Text_44c9f: ; 44c9f (11:4c9f)
	db $6, "@"

RocketHideout1BattleText2: ; 44ca1 (11:4ca1)
	TX_FAR _RocketHideout1BattleText2
	db "@"

RocketHideout1EndBattleText2: ; 44ca6 (11:4ca6)
	TX_FAR _RocketHideout1EndBattleText2
	db "@"

RocketHideout1AfterBattleTxt2: ; 44cab (11:4cab)
	TX_FAR _RocketHideout1AfterBattleTxt2
	db "@"

RocketHideout1BattleText3: ; 44cb0 (11:4cb0)
	TX_FAR _RocketHideout1BattleText3
	db "@"

RocketHideout1EndBattleText3: ; 44cb5 (11:4cb5)
	TX_FAR _RocketHideout1EndBattleText3
	db "@"

RocketHideout1AfterBattleTxt3: ; 44cba (11:4cba)
	TX_FAR _RocketHideout1AfterBattleTxt3
	db "@"

RocketHideout1BattleText4: ; 44cbf (11:4cbf)
	TX_FAR _RocketHideout1BattleText4
	db "@"

RocketHideout1EndBattleText4: ; 44cc4 (11:4cc4)
	TX_FAR _RocketHideout1EndBattleText4
	db "@"

RocketHideout1AfterBattleTxt4: ; 44cc9 (11:4cc9)
	TX_FAR _RocketHideout1AfterBattleTxt4
	db "@"

RocketHideout1BattleText5: ; 44cce (11:4cce)
	TX_FAR _RocketHideout1BattleText5
	db "@"

RocketHideout1EndBattleText5: ; 44cd3 (11:4cd3)
	TX_FAR _RocketHideout1EndBattleText5
	db "@"

RocketHideout1AfterBattleTxt5: ; 44cd8 (11:4cd8)
	TX_FAR _RocketHideout1AfterBattleTxt5
	db "@"

RocketHideout1BattleText6: ; 44cdd (11:4cdd)
	TX_FAR _RocketHideout1BattleText6
	db "@"

RocketHideout1AfterBattleTxt6: ; 44ce2 (11:4ce2)
	TX_FAR _RocketHideout1AfterBattleTxt6
	db "@"
