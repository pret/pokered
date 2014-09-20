Route12Script: ; 595f3 (16:55f3)
	call EnableAutoTextBoxDrawing
	ld hl, Route12TrainerHeaders
	ld de, Route12ScriptPointers
	ld a, [W_ROUTE12CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE12CURSCRIPT], a
	ret

Route12Script_59606: ; 59606 (16:5606)
	xor a
	ld [wJoyIgnore], a
	ld [W_ROUTE12CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

Route12ScriptPointers: ; 59611 (16:5611)
	dw Route12Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route12Script3

Route12Script0: ; 59619 (16:5619)
	ld hl, wd7d8
	bit 7, [hl]
	jp nz, CheckFightingMapTrainers
	bit 6, [hl]
	res 6, [hl]
	jp z, CheckFightingMapTrainers
	ld a, $d
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld a, SNORLAX
	ld [W_CUROPPONENT], a ; wd059
	ld a, 30
	ld [W_CURENEMYLVL], a ; W_CURENEMYLVL
	ld a, $1d
	ld [wcc4d], a
	predef HideObject
	ld a, $3
	ld [W_ROUTE12CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

Route12Script3: ; 5964c (16:564c)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jr z, Route12Script_59606
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .asm_59664
	ld a, $e
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
.asm_59664
	ld hl, wd7d8
	set 7, [hl]
	call Delay3
	ld a, $0
	ld [W_ROUTE12CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

Route12TextPointers: ; 59675 (16:5675)
	dw Route12Text1
	dw Route12Text2
	dw Route12Text3
	dw Route12Text4
	dw Route12Text5
	dw Route12Text6
	dw Route12Text7
	dw Route12Text8
	dw Predef5CText
	dw Predef5CText
	dw Route12Text11
	dw Route12Text12
	dw Route12Text13
	dw Route12Text14

Route12TrainerHeaders: ; 59691 (16:5691)
Route12TrainerHeader0: ; 59691 (16:5691)
	db $2 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d7 ; flag's byte
	dw Route12BattleText1 ; 0x56ff TextBeforeBattle
	dw Route12AfterBattleText1 ; 0x5709 TextAfterBattle
	dw Route12EndBattleText1 ; 0x5704 TextEndBattle
	dw Route12EndBattleText1 ; 0x5704 TextEndBattle

Route12TrainerHeader1: ; 5969d (16:569d)
	db $3 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d7 ; flag's byte
	dw Route12BattleText2 ; 0x5718 TextBeforeBattle
	dw Route12AfterBattleText2 ; 0x5722 TextAfterBattle
	dw Route12EndBattleText2 ; 0x571d TextEndBattle
	dw Route12EndBattleText2 ; 0x571d TextEndBattle

Route12TrainerHeader2: ; 596a9 (16:56a9)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d7 ; flag's byte
	dw Route12BattleText3 ; 0x5731 TextBeforeBattle
	dw Route12AfterBattleText3 ; 0x573b TextAfterBattle
	dw Route12EndBattleText3 ; 0x5736 TextEndBattle
	dw Route12EndBattleText3 ; 0x5736 TextEndBattle

Route12TrainerHeader3: ; 596b5 (16:56b5)
	db $5 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d7 ; flag's byte
	dw Route12BattleText4 ; 0x574a TextBeforeBattle
	dw Route12AfterBattleText4 ; 0x5754 TextAfterBattle
	dw Route12EndBattleText4 ; 0x574f TextEndBattle
	dw Route12EndBattleText4 ; 0x574f TextEndBattle

Route12TrainerHeader4: ; 596c1 (16:56c1)
	db $6 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d7 ; flag's byte
	dw Route12BattleText5 ; 0x5763 TextBeforeBattle
	dw Route12AfterBattleText5 ; 0x576d TextAfterBattle
	dw Route12EndBattleText5 ; 0x5768 TextEndBattle
	dw Route12EndBattleText5 ; 0x5768 TextEndBattle

Route12TrainerHeader5: ; 596cd (16:56cd)
	db $7 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7d7 ; flag's byte
	dw Route12BattleText6 ; 0x577c TextBeforeBattle
	dw Route12AfterBattleText6 ; 0x5786 TextAfterBattle
	dw Route12EndBattleText6 ; 0x5781 TextEndBattle
	dw Route12EndBattleText6 ; 0x5781 TextEndBattle

Route12TrainerHeader6: ; 596d9 (16:56d9)
	db $8 ; flag's bit
	db ($1 << 4) ; trainer's view range
	dw wd7d7 ; flag's byte
	dw Route12BattleText7 ; 0x5795 TextBeforeBattle
	dw Route12AfterBattleText7 ; 0x579f TextAfterBattle
	dw Route12EndBattleText7 ; 0x579a TextEndBattle
	dw Route12EndBattleText7 ; 0x579a TextEndBattle

	db $ff

Route12Text1: ; 596e6 (16:56e6)
	TX_FAR _Route12Text1
	db "@"

Route12Text13: ; 596eb (16:56eb)
	TX_FAR _Route12Text13
	db "@"

Route12Text14: ; 596f0 (16:56f0)
	TX_FAR _Route12Text14
	db "@"

Route12Text2: ; 596f5 (16:56f5)
	db $08 ; asm
	ld hl, Route12TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText1: ; 596ff (16:56ff)
	TX_FAR _Route12BattleText1
	db "@"

Route12EndBattleText1: ; 59704 (16:5704)
	TX_FAR _Route12EndBattleText1
	db "@"

Route12AfterBattleText1: ; 59709 (16:5709)
	TX_FAR _Route12AfterBattleText1
	db "@"

Route12Text3: ; 5970e (16:570e)
	db $08 ; asm
	ld hl, Route12TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText2: ; 59718 (16:5718)
	TX_FAR _Route12BattleText2
	db "@"

Route12EndBattleText2: ; 5971d (16:571d)
	TX_FAR _Route12EndBattleText2
	db "@"

Route12AfterBattleText2: ; 59722 (16:5722)
	TX_FAR _Route12AfterBattleText2
	db "@"

Route12Text4: ; 59727 (16:5727)
	db $08 ; asm
	ld hl, Route12TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText3: ; 59731 (16:5731)
	TX_FAR _Route12BattleText3
	db "@"

Route12EndBattleText3: ; 59736 (16:5736)
	TX_FAR _Route12EndBattleText3
	db "@"

Route12AfterBattleText3: ; 5973b (16:573b)
	TX_FAR _Route12AfterBattleText3
	db "@"

Route12Text5: ; 59740 (16:5740)
	db $08 ; asm
	ld hl, Route12TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText4: ; 5974a (16:574a)
	TX_FAR _Route12BattleText4
	db "@"

Route12EndBattleText4: ; 5974f (16:574f)
	TX_FAR _Route12EndBattleText4
	db "@"

Route12AfterBattleText4: ; 59754 (16:5754)
	TX_FAR _Route12AfterBattleText4
	db "@"

Route12Text6: ; 59759 (16:5759)
	db $08 ; asm
	ld hl, Route12TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText5: ; 59763 (16:5763)
	TX_FAR _Route12BattleText5
	db "@"

Route12EndBattleText5: ; 59768 (16:5768)
	TX_FAR _Route12EndBattleText5
	db "@"

Route12AfterBattleText5: ; 5976d (16:576d)
	TX_FAR _Route12AfterBattleText5
	db "@"

Route12Text7: ; 59772 (16:5772)
	db $08 ; asm
	ld hl, Route12TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText6: ; 5977c (16:577c)
	TX_FAR _Route12BattleText6
	db "@"

Route12EndBattleText6: ; 59781 (16:5781)
	TX_FAR _Route12EndBattleText6
	db "@"

Route12AfterBattleText6: ; 59786 (16:5786)
	TX_FAR _Route12AfterBattleText6
	db "@"

Route12Text8: ; 5978b (16:578b)
	db $08 ; asm
	ld hl, Route12TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText7: ; 59795 (16:5795)
	TX_FAR _Route12BattleText7
	db "@"

Route12EndBattleText7: ; 5979a (16:579a)
	TX_FAR _Route12EndBattleText7
	db "@"

Route12AfterBattleText7: ; 5979f (16:579f)
	TX_FAR _Route12AfterBattleText7
	db "@"

Route12Text11: ; 597a4 (16:57a4)
	TX_FAR _Route12Text11
	db "@"

Route12Text12: ; 597a9 (16:57a9)
	TX_FAR _Route12Text12
	db "@"
