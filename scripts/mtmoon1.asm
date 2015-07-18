MtMoon1Script: ; 499c8 (12:59c8)
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon1TrainerHeader0
	ld de, MtMoon1ScriptPointers
	ld a, [W_MTMOON1CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_MTMOON1CURSCRIPT], a
	ret

MtMoon1ScriptPointers: ; 499db (12:59db)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

MtMoon1TextPointers: ; 499e1 (12:59e1)
	dw MtMoon1Text1
	dw MtMoon1Text2
	dw MtMoon1Text3
	dw MtMoon1Text4
	dw MtMoon1Text5
	dw MtMoon1Text6
	dw MtMoon1Text7
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw MtMoon1Text14

MtMoon1TrainerHeaders: ; 499fd (12:59fd)
MtMoon1TrainerHeader0: ; 499fd (12:59fd)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7f5 ; flag's byte
	dw MtMoon1BattleText2 ; TextBeforeBattle
	dw MtMoon1AfterBattleText2 ; TextAfterBattle
	dw MtMoon1EndBattleText2 ; TextEndBattle
	dw MtMoon1EndBattleText2 ; TextEndBattle

MtMoon1TrainerHeader2: ; 49a09 (12:5a09)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f5 ; flag's byte
	dw MtMoon1BattleText3 ; TextBeforeBattle
	dw MtMoon1AfterBattleText3 ; TextAfterBattle
	dw MtMoon1EndBattleText3 ; TextEndBattle
	dw MtMoon1EndBattleText3 ; TextEndBattle

MtMoon1TrainerHeader3: ; 49a15 (12:5a15)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f5 ; flag's byte
	dw MtMoon1BattleText4 ; TextBeforeBattle
	dw MtMoon1AfterBattleText4 ; TextAfterBattle
	dw MtMoon1EndBattleText4 ; TextEndBattle
	dw MtMoon1EndBattleText4 ; TextEndBattle

MtMoon1TrainerHeader4: ; 49a21 (12:5a21)
	db $4 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f5 ; flag's byte
	dw MtMoon1BattleText5 ; TextBeforeBattle
	dw MtMoon1AfterBattleText5 ; TextAfterBattle
	dw MtMoon1EndBattleText5 ; TextEndBattle
	dw MtMoon1EndBattleText5 ; TextEndBattle

MtMoon1TrainerHeader5: ; 49a2d (12:5a2d)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f5 ; flag's byte
	dw MtMoon1BattleText6 ; TextBeforeBattle
	dw MtMoon1AfterBattleText6 ; TextAfterBattle
	dw MtMoon1EndBattleText6 ; TextEndBattle
	dw MtMoon1EndBattleText6 ; TextEndBattle

MtMoon1TrainerHeader6: ; 49a39 (12:5a39)
	db $6 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f5 ; flag's byte
	dw MtMoon1BattleText7 ; TextBeforeBattle
	dw MtMoon1AfterBattleText7 ; TextAfterBattle
	dw MtMoon1EndBattleText7 ; TextEndBattle
	dw MtMoon1EndBattleText7 ; TextEndBattle

MtMoon1TrainerHeader7: ; 49a45 (12:5a45)
	db $7 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f5 ; flag's byte
	dw MtMoon1BattleText8 ; TextBeforeBattle
	dw MtMoon1AfterBattleText8 ; TextAfterBattle
	dw MtMoon1EndBattleText8 ; TextEndBattle
	dw MtMoon1EndBattleText8 ; TextEndBattle

	db $ff

MtMoon1Text1: ; 49a52 (12:5a52)
	TX_ASM
	ld hl, MtMoon1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text2: ; 49a5c (12:5a5c)
	TX_ASM
	ld hl, MtMoon1TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text3: ; 49a66 (12:5a66)
	TX_ASM
	ld hl, MtMoon1TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text4: ; 49a70 (12:5a70)
	TX_ASM
	ld hl, MtMoon1TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text5: ; 49a7a (12:5a7a)
	TX_ASM
	ld hl, MtMoon1TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text6: ; 49a84 (12:5a84)
	TX_ASM
	ld hl, MtMoon1TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1Text7: ; 49a8e (12:5a8e)
	TX_ASM
	ld hl, MtMoon1TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1BattleText2: ; 49a98 (12:5a98)
	TX_FAR _MtMoon1BattleText2
	db "@"

MtMoon1EndBattleText2: ; 49a9d (12:5a9d)
	TX_FAR _MtMoon1EndBattleText2
	db "@"

MtMoon1AfterBattleText2: ; 49aa2 (12:5aa2)
	TX_FAR _MtMoon1AfterBattleText2
	db "@"

MtMoon1BattleText3: ; 49aa7 (12:5aa7)
	TX_FAR _MtMoon1BattleText3
	db "@"

MtMoon1EndBattleText3: ; 49aac (12:5aac)
	TX_FAR _MtMoon1EndBattleText3
	db "@"

MtMoon1AfterBattleText3: ; 49ab1 (12:5ab1)
	TX_FAR _MtMoon1AfterBattleText3
	db "@"

MtMoon1BattleText4: ; 49ab6 (12:5ab6)
	TX_FAR _MtMoon1BattleText4
	db "@"

MtMoon1EndBattleText4: ; 49abb (12:5abb)
	TX_FAR _MtMoon1EndBattleText4
	db "@"

MtMoon1AfterBattleText4: ; 49ac0 (12:5ac0)
	TX_FAR _MtMoon1AfterBattleText4
	db "@"

MtMoon1BattleText5: ; 49ac5 (12:5ac5)
	TX_FAR _MtMoon1BattleText5
	db "@"

MtMoon1EndBattleText5: ; 49aca (12:5aca)
	TX_FAR _MtMoon1EndBattleText5
	db "@"

MtMoon1AfterBattleText5: ; 49acf (12:5acf)
	TX_FAR _MtMoon1AfterBattleText5
	db "@"

MtMoon1BattleText6: ; 49ad4 (12:5ad4)
	TX_FAR _MtMoon1BattleText6
	db "@"

MtMoon1EndBattleText6: ; 49ad9 (12:5ad9)
	TX_FAR _MtMoon1EndBattleText6
	db "@"

MtMoon1AfterBattleText6: ; 49ade (12:5ade)
	TX_FAR _MtMoon1AfterBattleText6
	db "@"

MtMoon1BattleText7: ; 49ae3 (12:5ae3)
	TX_FAR _MtMoon1BattleText7
	db "@"

MtMoon1EndBattleText7: ; 49ae8 (12:5ae8)
	TX_FAR _MtMoon1EndBattleText7
	db "@"

MtMoon1AfterBattleText7: ; 49aed (12:5aed)
	TX_FAR _MtMoon1AfterBattleText7
	db "@"

MtMoon1BattleText8: ; 49af2 (12:5af2)
	TX_FAR _MtMoon1BattleText8
	db "@"

MtMoon1EndBattleText8: ; 49af7 (12:5af7)
	TX_FAR _MtMoon1EndBattleText8
	db "@"

MtMoon1AfterBattleText8: ; 49afc (12:5afc)
	TX_FAR _MtMoon1AfterBattleText8
	db "@"

MtMoon1Text14: ; 49b01 (12:5b01)
	TX_FAR _MtMoon1Text14
	db "@"
