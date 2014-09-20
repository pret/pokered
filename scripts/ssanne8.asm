SSAnne8Script: ; 61976 (18:5976)
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne8TrainerHeaders
	ld de, SSAnne8ScriptPointers
	ld a, [W_SSANNE8CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SSANNE8CURSCRIPT], a
	ret

SSAnne8ScriptPointers: ; 61989 (18:5989)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne8TextPointers: ; 6198f (18:598f)
	dw SSAnne8Text1
	dw SSAnne8Text2
	dw SSAnne8Text3
	dw SSAnne8Text4
	dw SSAnne8Text5
	dw SSAnne8Text6
	dw SSAnne8Text7
	dw SSAnne8Text8
	dw SSAnne8Text9
	dw Predef5CText
	dw SSAnne8Text11

SSAnne8TrainerHeaders: ; 619a5 (18:59a5)
SSAnne8TrainerHeader0: ; 619a5 (18:59a5)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd805 ; flag's byte
	dw SSAnne8BattleText1 ; 0x5a0b TextBeforeBattle
	dw SSAnne8AfterBattleText1 ; 0x5a15 TextAfterBattle
	dw SSAnne8EndBattleText1 ; 0x5a10 TextEndBattle
	dw SSAnne8EndBattleText1 ; 0x5a10 TextEndBattle

SSAnne8TrainerHeader1: ; 619b1 (18:59b1)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd805 ; flag's byte
	dw SSAnne8BattleText2 ; 0x5a1a TextBeforeBattle
	dw SSAnne8AfterBattleText2 ; 0x5a24 TextAfterBattle
	dw SSAnne8EndBattleText2 ; 0x5a1f TextEndBattle
	dw SSAnne8EndBattleText2 ; 0x5a1f TextEndBattle

SSAnne8TrainerHeader2: ; 619bd (18:59bd)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd805 ; flag's byte
	dw SSAnne8BattleText3 ; 0x5a29 TextBeforeBattle
	dw SSAnne8AfterBattleText3 ; 0x5a33 TextAfterBattle
	dw SSAnne8EndBattleText3 ; 0x5a2e TextEndBattle
	dw SSAnne8EndBattleText3 ; 0x5a2e TextEndBattle

SSAnne8TrainerHeader3: ; 619c9 (18:59c9)
	db $4 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd805 ; flag's byte
	dw SSAnne8BattleText4 ; 0x5a38 TextBeforeBattle
	dw SSAnne8AfterBattleText4 ; 0x5a42 TextAfterBattle
	dw SSAnne8EndBattleText4 ; 0x5a3d TextEndBattle
	dw SSAnne8EndBattleText4 ; 0x5a3d TextEndBattle

	db $ff

SSAnne8Text1: ; 619d6 (18:59d6)
	db $08 ; asm
	ld hl, SSAnne8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text2: ; 619e0 (18:59e0)
	db $08 ; asm
	ld hl, SSAnne8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text3: ; 619ea (18:59ea)
	db $08 ; asm
	ld hl, SSAnne8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text4: ; 619f4 (18:59f4)
	db $08 ; asm
	ld hl, SSAnne8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text8: ; 619fe (18:59fe)
	TX_FAR _SSAnne8Text8
	db $08 ; asm
	ld a, WIGGLYTUFF
	call PlayCry
	jp TextScriptEnd

SSAnne8BattleText1: ; 61a0b (18:5a0b)
	TX_FAR _SSAnne8BattleText1
	db "@"

SSAnne8EndBattleText1: ; 61a10 (18:5a10)
	TX_FAR _SSAnne8EndBattleText1
	db "@"

SSAnne8AfterBattleText1: ; 61a15 (18:5a15)
	TX_FAR _SSAnne8AfterBattleText1
	db "@"

SSAnne8BattleText2: ; 61a1a (18:5a1a)
	TX_FAR _SSAnne8BattleText2
	db "@"

SSAnne8EndBattleText2: ; 61a1f (18:5a1f)
	TX_FAR _SSAnne8EndBattleText2
	db "@"

SSAnne8AfterBattleText2: ; 61a24 (18:5a24)
	TX_FAR _SSAnne8AfterBattleText2
	db "@"

SSAnne8BattleText3: ; 61a29 (18:5a29)
	TX_FAR _SSAnne8BattleText3
	db "@"

SSAnne8EndBattleText3: ; 61a2e (18:5a2e)
	TX_FAR _SSAnne8EndBattleText3
	db "@"

SSAnne8AfterBattleText3: ; 61a33 (18:5a33)
	TX_FAR _SSAnne8AfterBattleText3
	db "@"

SSAnne8BattleText4: ; 61a38 (18:5a38)
	TX_FAR _SSAnne8BattleText4
	db "@"

SSAnne8EndBattleText4: ; 61a3d (18:5a3d)
	TX_FAR _SSAnne8EndBattleText4
	db "@"

SSAnne8AfterBattleText4: ; 61a42 (18:5a42)
	TX_FAR _SSAnne8AfterBattleText4
	db "@"

SSAnne8Text5: ; 61a47 (18:5a47)
	TX_FAR _SSAnne8Text5
	db "@"

SSAnne8Text6: ; 61a4c (18:5a4c)
	TX_FAR _SSAnne8Text6
	db "@"

SSAnne8Text7: ; 61a51 (18:5a51)
	TX_FAR _SSAnne8Text7
	db "@"

SSAnne8Text9: ; 61a56 (18:5a56)
	TX_FAR _SSAnne8Text9
	db "@"

SSAnne8Text11: ; 61a5b (18:5a5b)
	TX_FAR _SSAnne8Text11
	db "@"
