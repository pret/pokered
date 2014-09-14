Route25Script: ; 515cb (14:55cb)
	call Route25Script_515e1
	call EnableAutoTextBoxDrawing
	ld hl, Route25TrainerHeaders
	ld de, Route25ScriptPointers
	ld a, [W_ROUTE25CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE25CURSCRIPT], a
	ret

Route25Script_515e1: ; 515e1 (14:55e1)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	ret z
	ld hl, wd7f2
	bit 7, [hl]
	ret nz
	bit 5, [hl]
	jr nz, .asm_515ff
	res 6, [hl]
	ld a, $61
	ld [wcc4d], a
	predef_jump ShowObject
.asm_515ff
	bit 4, [hl]
	ret z
	set 7, [hl]
	ld a, $24
	ld [wcc4d], a
	predef HideObject
	ld a, $62
	ld [wcc4d], a
	predef HideObject
	ld a, $63
	ld [wcc4d], a
	predef_jump ShowObject

Route25ScriptPointers: ; 51622 (14:5622)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route25TextPointers: ; 51628 (14:5628)
	dw Route25Text1
	dw Route25Text2
	dw Route25Text3
	dw Route25Text4
	dw Route25Text5
	dw Route25Text6
	dw Route25Text7
	dw Route25Text8
	dw Route25Text9
	dw Predef5CText
	dw Route25Text11

Route25TrainerHeaders: ; 5163e (14:563e)
Route25TrainerHeader0: ; 5163e (14:563e)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText1 ; 0x5705 TextBeforeBattle
	dw Route25AfterBattleText1 ; 0x570f TextAfterBattle
	dw Route25EndBattleText1 ; 0x570a TextEndBattle
	dw Route25EndBattleText1 ; 0x570a TextEndBattle

Route25TrainerHeader2: ; 5164a (14:564a)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText2 ; 0x5714 TextBeforeBattle
	dw Route25AfterBattleText2 ; 0x571e TextAfterBattle
	dw Route25EndBattleText2 ; 0x5719 TextEndBattle
	dw Route25EndBattleText2 ; 0x5719 TextEndBattle

Route25TrainerHeader3: ; 51656 (14:5656)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText3 ; 0x5723 TextBeforeBattle
	dw Route25AfterBattleText3 ; 0x572d TextAfterBattle
	dw Route25EndBattleText3 ; 0x5728 TextEndBattle
	dw Route25EndBattleText3 ; 0x5728 TextEndBattle

Route25TrainerHeader4: ; 51662 (14:5662)
	db $4 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText4 ; 0x5732 TextBeforeBattle
	dw Route25AfterBattleText4 ; 0x573c TextAfterBattle
	dw Route25EndBattleText4 ; 0x5737 TextEndBattle
	dw Route25EndBattleText4 ; 0x5737 TextEndBattle

Route25TrainerHeader5: ; 5166e (14:566e)
	db $5 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText5 ; 0x5741 TextBeforeBattle
	dw Route25AfterBattleText5 ; 0x574b TextAfterBattle
	dw Route25EndBattleText5 ; 0x5746 TextEndBattle
	dw Route25EndBattleText5 ; 0x5746 TextEndBattle

Route25TrainerHeader6: ; 5167a (14:567a)
	db $6 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText6 ; 0x5750 TextBeforeBattle
	dw Route25AfterBattleText6 ; 0x575a TextAfterBattle
	dw Route25EndBattleText6 ; 0x5755 TextEndBattle
	dw Route25EndBattleText6 ; 0x5755 TextEndBattle

Route25TrainerHeader7: ; 51686 (14:5686)
	db $7 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText7 ; 0x575f TextBeforeBattle
	dw Route25AfterBattleText7 ; 0x5769 TextAfterBattle
	dw Route25EndBattleText7 ; 0x5764 TextEndBattle
	dw Route25EndBattleText7 ; 0x5764 TextEndBattle

Route25TrainerHeader8: ; 51692 (14:5692)
	db $8 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText8 ; 0x576e TextBeforeBattle
	dw Route25AfterBattleText8 ; 0x5778 TextAfterBattle
	dw Route25EndBattleText8 ; 0x5773 TextEndBattle
	dw Route25EndBattleText8 ; 0x5773 TextEndBattle

Route25TrainerHeader9: ; 5169e (14:569e)
	db $9 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7f1 ; flag's byte
	dw Route25BattleText9 ; 0x577d TextBeforeBattle
	dw Route25AfterBattleText9 ; 0x5787 TextAfterBattle
	dw Route25EndBattleText9 ; 0x5782 TextEndBattle
	dw Route25EndBattleText9 ; 0x5782 TextEndBattle

	db $ff

Route25Text1: ; 516ab (14:56ab)
	db $08 ; asm
	ld hl, Route25TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route25Text2: ; 516b5 (14:56b5)
	db $08 ; asm
	ld hl, Route25TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route25Text3: ; 516bf (14:56bf)
	db $08 ; asm
	ld hl, Route25TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route25Text4: ; 516c9 (14:56c9)
	db $08 ; asm
	ld hl, Route25TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route25Text5: ; 516d3 (14:56d3)
	db $08 ; asm
	ld hl, Route25TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route25Text6: ; 516dd (14:56dd)
	db $08 ; asm
	ld hl, Route25TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route25Text7: ; 516e7 (14:56e7)
	db $08 ; asm
	ld hl, Route25TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route25Text8: ; 516f1 (14:56f1)
	db $08 ; asm
	ld hl, Route25TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route25Text9: ; 516fb (14:56fb)
	db $08 ; asm
	ld hl, Route25TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route25BattleText1: ; 51705 (14:5705)
	TX_FAR _Route25BattleText1
	db "@"

Route25EndBattleText1: ; 5170a (14:570a)
	TX_FAR _Route25EndBattleText1
	db "@"

Route25AfterBattleText1: ; 5170f (14:570f)
	TX_FAR _Route25AfterBattleText1
	db "@"

Route25BattleText2: ; 51714 (14:5714)
	TX_FAR _Route25BattleText2
	db "@"

Route25EndBattleText2: ; 51719 (14:5719)
	TX_FAR _Route25EndBattleText2
	db "@"

Route25AfterBattleText2: ; 5171e (14:571e)
	TX_FAR _Route25AfterBattleText2
	db "@"

Route25BattleText3: ; 51723 (14:5723)
	TX_FAR _Route25BattleText3
	db "@"

Route25EndBattleText3: ; 51728 (14:5728)
	TX_FAR _Route25EndBattleText3
	db "@"

Route25AfterBattleText3: ; 5172d (14:572d)
	TX_FAR _Route25AfterBattleText3
	db "@"

Route25BattleText4: ; 51732 (14:5732)
	TX_FAR _Route25BattleText4
	db "@"

Route25EndBattleText4: ; 51737 (14:5737)
	TX_FAR _Route25EndBattleText4
	db "@"

Route25AfterBattleText4: ; 5173c (14:573c)
	TX_FAR _Route25AfterBattleText4
	db "@"

Route25BattleText5: ; 51741 (14:5741)
	TX_FAR _Route25BattleText5
	db "@"

Route25EndBattleText5: ; 51746 (14:5746)
	TX_FAR _Route25EndBattleText5
	db "@"

Route25AfterBattleText5: ; 5174b (14:574b)
	TX_FAR _Route25AfterBattleText5
	db "@"

Route25BattleText6: ; 51750 (14:5750)
	TX_FAR _Route25BattleText6
	db "@"

Route25EndBattleText6: ; 51755 (14:5755)
	TX_FAR _Route25EndBattleText6
	db "@"

Route25AfterBattleText6: ; 5175a (14:575a)
	TX_FAR _Route25AfterBattleText6
	db "@"

Route25BattleText7: ; 5175f (14:575f)
	TX_FAR _Route25BattleText7
	db "@"

Route25EndBattleText7: ; 51764 (14:5764)
	TX_FAR _Route25EndBattleText7
	db "@"

Route25AfterBattleText7: ; 51769 (14:5769)
	TX_FAR _Route25AfterBattleText7
	db "@"

Route25BattleText8: ; 5176e (14:576e)
	TX_FAR _Route25BattleText8
	db "@"

Route25EndBattleText8: ; 51773 (14:5773)
	TX_FAR _Route25EndBattleText8
	db "@"

Route25AfterBattleText8: ; 51778 (14:5778)
	TX_FAR _Route25AfterBattleText8
	db "@"

Route25BattleText9: ; 5177d (14:577d)
	TX_FAR _Route25BattleText9
	db "@"

Route25EndBattleText9: ; 51782 (14:5782)
	TX_FAR _Route25EndBattleText9
	db "@"

Route25AfterBattleText9: ; 51787 (14:5787)
	TX_FAR _Route25AfterBattleText9
	db "@"

Route25Text11: ; 5178c (14:578c)
	TX_FAR _Route25Text11
	db "@"
