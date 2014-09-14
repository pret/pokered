Route13Script: ; 5581e (15:581e)
	call EnableAutoTextBoxDrawing
	ld hl, Route13TrainerHeaders
	ld de, Route13ScriptPointers
	ld a, [W_ROUTE13CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE13CURSCRIPT], a
	ret

Route13ScriptPointers: ; 55831 (15:5831)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route13TextPointers: ; 55837 (15:5837)
	dw Route13Text1
	dw Route13Text2
	dw Route13Text3
	dw Route13Text4
	dw Route13Text5
	dw Route13Text6
	dw Route13Text7
	dw Route13Text8
	dw Route13Text9
	dw Route13Text10
	dw Route13Text11
	dw Route13Text12
	dw Route13Text13

Route13TrainerHeaders: ; 55851 (15:5851)
Route13TrainerHeader0: ; 55851 (15:5851)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText2 ; 0x58d4 TextBeforeBattle
	dw Route13AfterBattleText2 ; 0x58de TextAfterBattle
	dw Route13EndBattleText2 ; 0x58d9 TextEndBattle
	dw Route13EndBattleText2 ; 0x58d9 TextEndBattle

Route13TrainerHeader2: ; 5585d (15:585d)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText3 ; 0x58ed TextBeforeBattle
	dw Route13AfterBattleText3 ; 0x58f7 TextAfterBattle
	dw Route13EndBattleText3 ; 0x58f2 TextEndBattle
	dw Route13EndBattleText3 ; 0x58f2 TextEndBattle

Route13TrainerHeader3: ; 55869 (15:5869)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText4 ; 0x5906 TextBeforeBattle
	dw Route13AfterBattleText4 ; 0x5910 TextAfterBattle
	dw Route13EndBattleText4 ; 0x590b TextEndBattle
	dw Route13EndBattleText4 ; 0x590b TextEndBattle

Route13TrainerHeader4: ; 55875 (15:5875)
	db $4 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText5 ; 0x591f TextBeforeBattle
	dw Route13AfterBattleText5 ; 0x5929 TextAfterBattle
	dw Route13EndBattleText5 ; 0x5924 TextEndBattle
	dw Route13EndBattleText5 ; 0x5924 TextEndBattle

Route13TrainerHeader5: ; 55881 (15:5881)
	db $5 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText6 ; 0x5938 TextBeforeBattle
	dw Route13AfterBattleText6 ; 0x5942 TextAfterBattle
	dw Route13EndBattleText6 ; 0x593d TextEndBattle
	dw Route13EndBattleText6 ; 0x593d TextEndBattle

Route13TrainerHeader6: ; 5588d (15:588d)
	db $6 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText7 ; 0x5951 TextBeforeBattle
	dw Route13AfterBattleText7 ; 0x595b TextAfterBattle
	dw Route13EndBattleText7 ; 0x5956 TextEndBattle
	dw Route13EndBattleText7 ; 0x5956 TextEndBattle

Route13TrainerHeader7: ; 55899 (15:5899)
	db $7 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText8 ; 0x596a TextBeforeBattle
	dw Route13AfterBattleText8 ; 0x5974 TextAfterBattle
	dw Route13EndBattleText8 ; 0x596f TextEndBattle
	dw Route13EndBattleText8 ; 0x596f TextEndBattle

Route13TrainerHeader8: ; 558a5 (15:58a5)
	db $8 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText9 ; 0x5983 TextBeforeBattle
	dw Route13AfterBattleText9 ; 0x598d TextAfterBattle
	dw Route13EndBattleText9 ; 0x5988 TextEndBattle
	dw Route13EndBattleText9 ; 0x5988 TextEndBattle

Route13TrainerHeader9: ; 558b1 (15:58b1)
	db $9 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText10 ; 0x599c TextBeforeBattle
	dw Route13AfterBattleText10 ; 0x59a6 TextAfterBattle
	dw Route13EndBattleText10 ; 0x59a1 TextEndBattle
	dw Route13EndBattleText10 ; 0x59a1 TextEndBattle

Route13TrainerHeader10: ; 558bd (15:58bd)
	db $a ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d9 ; flag's byte
	dw Route13BattleText11 ; 0x59b5 TextBeforeBattle
	dw Route13AfterBattleText11 ; 0x59bf TextAfterBattle
	dw Route13EndBattleText11 ; 0x59ba TextEndBattle
	dw Route13EndBattleText11 ; 0x59ba TextEndBattle

	db $ff

Route13Text1: ; 558ca (15:58ca)
	db $08 ; asm
	ld hl, Route13TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText2: ; 558d4 (15:58d4)
	TX_FAR _Route13BattleText2
	db "@"

Route13EndBattleText2: ; 558d9 (15:58d9)
	TX_FAR _Route13EndBattleText2
	db "@"

Route13AfterBattleText2: ; 558de (15:58de)
	TX_FAR _Route13AfterBattleText2
	db "@"

Route13Text2: ; 558e3 (15:58e3)
	db $08 ; asm
	ld hl, Route13TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText3: ; 558ed (15:58ed)
	TX_FAR _Route13BattleText3
	db "@"

Route13EndBattleText3: ; 558f2 (15:58f2)
	TX_FAR _Route13EndBattleText3
	db "@"

Route13AfterBattleText3: ; 558f7 (15:58f7)
	TX_FAR _Route13AfterBattleText3
	db "@"

Route13Text3: ; 558fc (15:58fc)
	db $08 ; asm
	ld hl, Route13TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText4: ; 55906 (15:5906)
	TX_FAR _Route13BattleText4
	db "@"

Route13EndBattleText4: ; 5590b (15:590b)
	TX_FAR _Route13EndBattleText4
	db "@"

Route13AfterBattleText4: ; 55910 (15:5910)
	TX_FAR _Route13AfterBattleText4
	db "@"

Route13Text4: ; 55915 (15:5915)
	db $08 ; asm
	ld hl, Route13TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText5: ; 5591f (15:591f)
	TX_FAR _Route13BattleText5
	db "@"

Route13EndBattleText5: ; 55924 (15:5924)
	TX_FAR _Route13EndBattleText5
	db "@"

Route13AfterBattleText5: ; 55929 (15:5929)
	TX_FAR _Route13AfterBattleText5
	db "@"

Route13Text5: ; 5592e (15:592e)
	db $08 ; asm
	ld hl, Route13TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText6: ; 55938 (15:5938)
	TX_FAR _Route13BattleText6
	db "@"

Route13EndBattleText6: ; 5593d (15:593d)
	TX_FAR _Route13EndBattleText6
	db "@"

Route13AfterBattleText6: ; 55942 (15:5942)
	TX_FAR _Route13AfterBattleText6
	db "@"

Route13Text6: ; 55947 (15:5947)
	db $08 ; asm
	ld hl, Route13TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText7: ; 55951 (15:5951)
	TX_FAR _Route13BattleText7
	db "@"

Route13EndBattleText7: ; 55956 (15:5956)
	TX_FAR _Route13EndBattleText7
	db "@"

Route13AfterBattleText7: ; 5595b (15:595b)
	TX_FAR _Route13AfterBattleText7
	db "@"

Route13Text7: ; 55960 (15:5960)
	db $08 ; asm
	ld hl, Route13TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText8: ; 5596a (15:596a)
	TX_FAR _Route13BattleText8
	db "@"

Route13EndBattleText8: ; 5596f (15:596f)
	TX_FAR _Route13EndBattleText8
	db "@"

Route13AfterBattleText8: ; 55974 (15:5974)
	TX_FAR _Route13AfterBattleText8
	db "@"

Route13Text8: ; 55979 (15:5979)
	db $08 ; asm
	ld hl, Route13TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText9: ; 55983 (15:5983)
	TX_FAR _Route13BattleText9
	db "@"

Route13EndBattleText9: ; 55988 (15:5988)
	TX_FAR _Route13EndBattleText9
	db "@"

Route13AfterBattleText9: ; 5598d (15:598d)
	TX_FAR _Route13AfterBattleText9
	db "@"

Route13Text9: ; 55992 (15:5992)
	db $08 ; asm
	ld hl, Route13TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText10: ; 5599c (15:599c)
	TX_FAR _Route13BattleText10
	db "@"

Route13EndBattleText10: ; 559a1 (15:59a1)
	TX_FAR _Route13EndBattleText10
	db "@"

Route13AfterBattleText10: ; 559a6 (15:59a6)
	TX_FAR _Route13AfterBattleText10
	db "@"

Route13Text10: ; 559ab (15:59ab)
	db $08 ; asm
	ld hl, Route13TrainerHeader10
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText11: ; 559b5 (15:59b5)
	TX_FAR _Route13BattleText11
	db "@"

Route13EndBattleText11: ; 559ba (15:59ba)
	TX_FAR _Route13EndBattleText11
	db "@"

Route13AfterBattleText11: ; 559bf (15:59bf)
	TX_FAR _Route13AfterBattleText11
	db "@"

Route13Text11: ; 559c4 (15:59c4)
	TX_FAR _Route13Text11
	db "@"

Route13Text12: ; 559c9 (15:59c9)
	TX_FAR _Route13Text12
	db "@"

Route13Text13: ; 559ce (15:59ce)
	TX_FAR _Route13Text13
	db "@"
