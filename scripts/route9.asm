Route9Script: ; 556bc (15:56bc)
	call EnableAutoTextBoxDrawing
	ld hl, Route9TrainerHeaders
	ld de, Route9ScriptPointers
	ld a, [W_ROUTE9CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE9CURSCRIPT], a
	ret

Route9ScriptPointers: ; 556cf (15:56cf)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route9TextPointers: ; 556d5 (15:56d5)
	dw Route9Text1
	dw Route9Text2
	dw Route9Text3
	dw Route9Text4
	dw Route9Text5
	dw Route9Text6
	dw Route9Text7
	dw Route9Text8
	dw Route9Text9
	dw PickUpItemText
	dw Route9Text11

Route9TrainerHeaders: ; 556eb (15:56eb)
Route9TrainerHeader0: ; 556eb (15:56eb)
	db $1 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText1 ; TextBeforeBattle
	dw Route9AfterBattleText1 ; TextAfterBattle
	dw Route9EndBattleText1 ; TextEndBattle
	dw Route9EndBattleText1 ; TextEndBattle

Route9TrainerHeader2: ; 556f7 (15:56f7)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText2 ; TextBeforeBattle
	dw Route9AfterBattleText2 ; TextAfterBattle
	dw Route9EndBattleText2 ; TextEndBattle
	dw Route9EndBattleText2 ; TextEndBattle

Route9TrainerHeader3: ; 55703 (15:5703)
	db $3 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText3 ; TextBeforeBattle
	dw Route9AfterBattleText3 ; TextAfterBattle
	dw Route9EndBattleText3 ; TextEndBattle
	dw Route9EndBattleText3 ; TextEndBattle

Route9TrainerHeader4: ; 5570f (15:570f)
	db $4 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText4 ; TextBeforeBattle
	dw Route9AfterBattleText4 ; TextAfterBattle
	dw Route9EndBattleText4 ; TextEndBattle
	dw Route9EndBattleText4 ; TextEndBattle

Route9TrainerHeader5: ; 5571b (15:571b)
	db $5 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText5 ; TextBeforeBattle
	dw Route9AfterBattleText5 ; TextAfterBattle
	dw Route9EndBattleText5 ; TextEndBattle
	dw Route9EndBattleText5 ; TextEndBattle

Route9TrainerHeader6: ; 55727 (15:5727)
	db $6 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText6 ; TextBeforeBattle
	dw Route9AfterBattleText6 ; TextAfterBattle
	dw Route9EndBattleText6 ; TextEndBattle
	dw Route9EndBattleText6 ; TextEndBattle

Route9TrainerHeader7: ; 55733 (15:5733)
	db $7 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText7 ; TextBeforeBattle
	dw Route9AfterBattleText7 ; TextAfterBattle
	dw Route9EndBattleText7 ; TextEndBattle
	dw Route9EndBattleText7 ; TextEndBattle

Route9TrainerHeader8: ; 5573f (15:573f)
	db $8 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText8 ; TextBeforeBattle
	dw Route9AfterBattleText8 ; TextAfterBattle
	dw Route9EndBattleText8 ; TextEndBattle
	dw Route9EndBattleText8 ; TextEndBattle

Route9TrainerHeader9: ; 5574b (15:574b)
	db $9 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7cf ; flag's byte
	dw Route9BattleText9 ; TextBeforeBattle
	dw Route9AfterBattleText9 ; TextAfterBattle
	dw Route9EndBattleText9 ; TextEndBattle
	dw Route9EndBattleText9 ; TextEndBattle

	db $ff

Route9Text1: ; 55758 (15:5758)
	TX_ASM
	ld hl, Route9TrainerHeader0
	jr Route9TalkToTrainer

Route9Text2: ; 5575e (15:575e)
	TX_ASM
	ld hl, Route9TrainerHeader2
	jr Route9TalkToTrainer

Route9Text3: ; 55764 (15:5764)
	TX_ASM
	ld hl, Route9TrainerHeader3
	jr Route9TalkToTrainer

Route9Text4: ; 5576a (15:576a)
	TX_ASM
	ld hl, Route9TrainerHeader4
	jr Route9TalkToTrainer

Route9Text5: ; 55770 (15:5770)
	TX_ASM
	ld hl, Route9TrainerHeader5
	jr Route9TalkToTrainer

Route9Text6: ; 55776 (15:5776)
	TX_ASM
	ld hl, Route9TrainerHeader6
	jr Route9TalkToTrainer

Route9Text7: ; 5577c (15:577c)
	TX_ASM
	ld hl, Route9TrainerHeader7
	jr Route9TalkToTrainer

Route9Text8: ; 55782 (15:5782)
	TX_ASM
	ld hl, Route9TrainerHeader8
	jr Route9TalkToTrainer

Route9Text9: ; 55788 (15:5788)
	TX_ASM
	ld hl, Route9TrainerHeader9
Route9TalkToTrainer: ; 5578c (15:578c)
	call TalkToTrainer
	jp TextScriptEnd

Route9BattleText1: ; 55792 (15:5792)
	TX_FAR _Route9BattleText1
	db "@"

Route9EndBattleText1: ; 55797 (15:5797)
	TX_FAR _Route9EndBattleText1
	db "@"

Route9AfterBattleText1: ; 5579c (15:579c)
	TX_FAR _Route9AfterBattleText1
	db "@"

Route9BattleText2: ; 557a1 (15:57a1)
	TX_FAR _Route9BattleText2
	db "@"

Route9EndBattleText2: ; 557a6 (15:57a6)
	TX_FAR _Route9EndBattleText2
	db "@"

Route9AfterBattleText2: ; 557ab (15:57ab)
	TX_FAR _Route9AfterBattleText2
	db "@"

Route9BattleText3: ; 557b0 (15:57b0)
	TX_FAR _Route9BattleText3
	db "@"

Route9EndBattleText3: ; 557b5 (15:57b5)
	TX_FAR _Route9EndBattleText3
	db "@"

Route9AfterBattleText3: ; 557ba (15:57ba)
	TX_FAR _Route9AfterBattleText3
	db "@"

Route9BattleText4: ; 557bf (15:57bf)
	TX_FAR _Route9BattleText4
	db "@"

Route9EndBattleText4: ; 557c4 (15:57c4)
	TX_FAR _Route9EndBattleText4
	db "@"

Route9AfterBattleText4: ; 557c9 (15:57c9)
	TX_FAR _Route9AfterBattleText4
	db "@"

Route9BattleText5: ; 557ce (15:57ce)
	TX_FAR _Route9BattleText5
	db "@"

Route9EndBattleText5: ; 557d3 (15:57d3)
	TX_FAR _Route9EndBattleText5
	db "@"

Route9AfterBattleText5: ; 557d8 (15:57d8)
	TX_FAR _Route9AfterBattleText5
	db "@"

Route9BattleText6: ; 557dd (15:57dd)
	TX_FAR _Route9BattleText6
	db "@"

Route9EndBattleText6: ; 557e2 (15:57e2)
	TX_FAR _Route9EndBattleText6
	db "@"

Route9AfterBattleText6: ; 557e7 (15:57e7)
	TX_FAR _Route9AfterBattleText6
	db "@"

Route9BattleText7: ; 557ec (15:57ec)
	TX_FAR _Route9BattleText7
	db "@"

Route9EndBattleText7: ; 557f1 (15:57f1)
	TX_FAR _Route9EndBattleText7
	db "@"

Route9AfterBattleText7: ; 557f6 (15:57f6)
	TX_FAR _Route9AfterBattleText7
	db "@"

Route9BattleText8: ; 557fb (15:57fb)
	TX_FAR _Route9BattleText8
	db "@"

Route9EndBattleText8: ; 55800 (15:5800)
	TX_FAR _Route9EndBattleText8
	db "@"

Route9AfterBattleText8: ; 55805 (15:5805)
	TX_FAR _Route9AfterBattleText8
	db "@"

Route9BattleText9: ; 5580a (15:580a)
	TX_FAR _Route9BattleText9
	db "@"

Route9EndBattleText9: ; 5580f (15:580f)
	TX_FAR _Route9EndBattleText9
	db "@"

Route9AfterBattleText9: ; 55814 (15:5814)
	TX_FAR _Route9AfterBattleText9
	db "@"

Route9Text11: ; 55819 (15:5819)
	TX_FAR _Route9Text11
	db "@"
