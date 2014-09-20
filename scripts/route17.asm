Route17Script: ; 55b7a (15:5b7a)
	call EnableAutoTextBoxDrawing
	ld hl, Route17TrainerHeaders
	ld de, Route17ScriptPointers
	ld a, [W_ROUTE17CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE17CURSCRIPT], a
	ret

Route17ScriptPointers: ; 55b8d (15:5b8d)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route17TextPointers: ; 55b93 (15:5b93)
	dw Route17Text1
	dw Route17Text2
	dw Route17Text3
	dw Route17Text4
	dw Route17Text5
	dw Route17Text6
	dw Route17Text7
	dw Route17Text8
	dw Route17Text9
	dw Route17Text10
	dw Route17Text11
	dw Route17Text12
	dw Route17Text13
	dw Route17Text14
	dw Route17Text15
	dw Route17Text16

Route17TrainerHeaders: ; 55bb3 (15:5bb3)
Route17TrainerHeader0: ; 55bb3 (15:5bb3)
	db $1 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText1 ; 0x5c36 TextBeforeBattle
	dw Route17AfterBattleText1 ; 0x5c40 TextAfterBattle
	dw Route17EndBattleText1 ; 0x5c3b TextEndBattle
	dw Route17EndBattleText1 ; 0x5c3b TextEndBattle

Route17TrainerHeader1: ; 55bbf (15:5bbf)
	db $2 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText2 ; 0x5c4f TextBeforeBattle
	dw Route17AfterBattleText2 ; 0x5c59 TextAfterBattle
	dw Route17EndBattleText2 ; 0x5c54 TextEndBattle
	dw Route17EndBattleText2 ; 0x5c54 TextEndBattle

Route17TrainerHeader2: ; 55bcb (15:5bcb)
	db $3 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText3 ; 0x5c68 TextBeforeBattle
	dw Route17AfterBattleText3 ; 0x5c72 TextAfterBattle
	dw Route17EndBattleText3 ; 0x5c6d TextEndBattle
	dw Route17EndBattleText3 ; 0x5c6d TextEndBattle

Route17TrainerHeader3: ; 55bd7 (15:5bd7)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText4 ; 0x5c81 TextBeforeBattle
	dw Route17AfterBattleText4 ; 0x5c8b TextAfterBattle
	dw Route17EndBattleText4 ; 0x5c86 TextEndBattle
	dw Route17EndBattleText4 ; 0x5c86 TextEndBattle

Route17TrainerHeader4: ; 55be3 (15:5be3)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText5 ; 0x5c9a TextBeforeBattle
	dw Route17AfterBattleText5 ; 0x5ca4 TextAfterBattle
	dw Route17EndBattleText5 ; 0x5c9f TextEndBattle
	dw Route17EndBattleText5 ; 0x5c9f TextEndBattle

Route17TrainerHeader5: ; 55bef (15:5bef)
	db $6 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText6 ; 0x5cb3 TextBeforeBattle
	dw Route17AfterBattleText6 ; 0x5cbd TextAfterBattle
	dw Route17EndBattleText6 ; 0x5cb8 TextEndBattle
	dw Route17EndBattleText6 ; 0x5cb8 TextEndBattle

Route17TrainerHeader6: ; 55bfb (15:5bfb)
	db $7 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText7 ; 0x5ccc TextBeforeBattle
	dw Route17AfterBattleText7 ; 0x5cd6 TextAfterBattle
	dw Route17EndBattleText7 ; 0x5cd1 TextEndBattle
	dw Route17EndBattleText7 ; 0x5cd1 TextEndBattle

Route17TrainerHeader7: ; 55c07 (15:5c07)
	db $8 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText8 ; 0x5ce5 TextBeforeBattle
	dw Route17AfterBattleText8 ; 0x5cef TextAfterBattle
	dw Route17EndBattleText8 ; 0x5cea TextEndBattle
	dw Route17EndBattleText8 ; 0x5cea TextEndBattle

Route17TrainerHeader8: ; 55c13 (15:5c13)
	db $9 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText9 ; 0x5cfe TextBeforeBattle
	dw Route17AfterBattleText9 ; 0x5d08 TextAfterBattle
	dw Route17EndBattleText9 ; 0x5d03 TextEndBattle
	dw Route17EndBattleText9 ; 0x5d03 TextEndBattle

Route17TrainerHeader9: ; 55c1f (15:5c1f)
	db $a ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e1 ; flag's byte
	dw Route17BattleText10 ; 0x5d17 TextBeforeBattle
	dw Route17AfterBattleText10 ; 0x5d21 TextAfterBattle
	dw Route17EndBattleText10 ; 0x5d1c TextEndBattle
	dw Route17EndBattleText10 ; 0x5d1c TextEndBattle

	db $ff

Route17Text1: ; 55c2c (15:5c2c)
	db $08 ; asm
	ld hl, Route17TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText1: ; 55c36 (15:5c36)
	TX_FAR _Route17BattleText1
	db "@"

Route17EndBattleText1: ; 55c3b (15:5c3b)
	TX_FAR _Route17EndBattleText1
	db "@"

Route17AfterBattleText1: ; 55c40 (15:5c40)
	TX_FAR _Route17AfterBattleText1
	db "@"

Route17Text2: ; 55c45 (15:5c45)
	db $08 ; asm
	ld hl, Route17TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText2: ; 55c4f (15:5c4f)
	TX_FAR _Route17BattleText2
	db "@"

Route17EndBattleText2: ; 55c54 (15:5c54)
	TX_FAR _Route17EndBattleText2
	db "@"

Route17AfterBattleText2: ; 55c59 (15:5c59)
	TX_FAR _Route17AfterBattleText2
	db "@"

Route17Text3: ; 55c5e (15:5c5e)
	db $08 ; asm
	ld hl, Route17TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText3: ; 55c68 (15:5c68)
	TX_FAR _Route17BattleText3
	db "@"

Route17EndBattleText3: ; 55c6d (15:5c6d)
	TX_FAR _Route17EndBattleText3
	db "@"

Route17AfterBattleText3: ; 55c72 (15:5c72)
	TX_FAR _Route17AfterBattleText3
	db "@"

Route17Text4: ; 55c77 (15:5c77)
	db $08 ; asm
	ld hl, Route17TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText4: ; 55c81 (15:5c81)
	TX_FAR _Route17BattleText4
	db "@"

Route17EndBattleText4: ; 55c86 (15:5c86)
	TX_FAR _Route17EndBattleText4
	db "@"

Route17AfterBattleText4: ; 55c8b (15:5c8b)
	TX_FAR _Route17AfterBattleText4
	db "@"

Route17Text5: ; 55c90 (15:5c90)
	db $08 ; asm
	ld hl, Route17TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText5: ; 55c9a (15:5c9a)
	TX_FAR _Route17BattleText5
	db "@"

Route17EndBattleText5: ; 55c9f (15:5c9f)
	TX_FAR _Route17EndBattleText5
	db "@"

Route17AfterBattleText5: ; 55ca4 (15:5ca4)
	TX_FAR _Route17AfterBattleText5
	db "@"

Route17Text6: ; 55ca9 (15:5ca9)
	db $08 ; asm
	ld hl, Route17TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText6: ; 55cb3 (15:5cb3)
	TX_FAR _Route17BattleText6
	db "@"

Route17EndBattleText6: ; 55cb8 (15:5cb8)
	TX_FAR _Route17EndBattleText6
	db "@"

Route17AfterBattleText6: ; 55cbd (15:5cbd)
	TX_FAR _Route17AfterBattleText6
	db "@"

Route17Text7: ; 55cc2 (15:5cc2)
	db $08 ; asm
	ld hl, Route17TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText7: ; 55ccc (15:5ccc)
	TX_FAR _Route17BattleText7
	db "@"

Route17EndBattleText7: ; 55cd1 (15:5cd1)
	TX_FAR _Route17EndBattleText7
	db "@"

Route17AfterBattleText7: ; 55cd6 (15:5cd6)
	TX_FAR _Route17AfterBattleText7
	db "@"

Route17Text8: ; 55cdb (15:5cdb)
	db $08 ; asm
	ld hl, Route17TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText8: ; 55ce5 (15:5ce5)
	TX_FAR _Route17BattleText8
	db "@"

Route17EndBattleText8: ; 55cea (15:5cea)
	TX_FAR _Route17EndBattleText8
	db "@"

Route17AfterBattleText8: ; 55cef (15:5cef)
	TX_FAR _Route17AfterBattleText8
	db "@"

Route17Text9: ; 55cf4 (15:5cf4)
	db $08 ; asm
	ld hl, Route17TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText9: ; 55cfe (15:5cfe)
	TX_FAR _Route17BattleText9
	db "@"

Route17EndBattleText9: ; 55d03 (15:5d03)
	TX_FAR _Route17EndBattleText9
	db "@"

Route17AfterBattleText9: ; 55d08 (15:5d08)
	TX_FAR _Route17AfterBattleText9
	db "@"

Route17Text10: ; 55d0d (15:5d0d)
	db $08 ; asm
	ld hl, Route17TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText10: ; 55d17 (15:5d17)
	TX_FAR _Route17BattleText10
	db "@"

Route17EndBattleText10: ; 55d1c (15:5d1c)
	TX_FAR _Route17EndBattleText10
	db "@"

Route17AfterBattleText10: ; 55d21 (15:5d21)
	TX_FAR _Route17AfterBattleText10
	db "@"

Route17Text11: ; 55d26 (15:5d26)
	TX_FAR _Route17Text11
	db "@"

Route17Text12: ; 55d2b (15:5d2b)
	TX_FAR _Route17Text12
	db "@"

Route17Text13: ; 55d30 (15:5d30)
	TX_FAR _Route17Text13
	db "@"

Route17Text14: ; 55d35 (15:5d35)
	TX_FAR _Route17Text14
	db "@"

Route17Text15: ; 55d3a (15:5d3a)
	TX_FAR _Route17Text15
	db "@"

Route17Text16: ; 55d3f (15:5d3f)
	TX_FAR _Route17Text16
	db "@"
