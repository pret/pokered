SSAnne5Script: ; 616ae (18:56ae)
	call EnableAutoTextBoxDrawing
	ld hl, SSAnneTrainerHeader0 ; $56d1
	ld de, SSAnne5ScriptPointers
	ld a, [W_SSANNE5CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SSANNE5CURSCRIPT], a
	ret

SSAnne5ScriptPointers: ; 616c1 (18:56c1)
	dw CheckFightingMapTrainers
	dw Func_324c
	dw EndTrainerBattle

SSAnne5TextPointers: ; 616c7 (18:56c7)
	dw SSAnne5Text1
	dw SSAnne5Text2
	dw SSAnne5Text3
	dw SSAnne5Text4
	dw SSAnne5Text5

SSAnneTrainerHeaders: ; 616d1 (18:56d1)
SSAnneTrainerHeader0: ; 616d1 (18:56d1)
	db $4 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d7ff ; flag's byte
	dw SSAnneBattleText1 ; 0x5703 TextBeforeBattle
	dw SSAnneAfterBattleText1 ; 0x570d TextAfterBattle
	dw SSAnneEndBattleText1 ; 0x5708 TextEndBattle
	dw SSAnneEndBattleText1 ; 0x5708 TextEndBattle

SSAnneTrainerHeader1: ; 616dd (18:56dd)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d7ff ; flag's byte
	dw SSAnneBattleText2 ; 0x571c TextBeforeBattle
	dw SSAnneAfterBattleText2 ; 0x5726 TextAfterBattle
	dw SSAnneEndBattleText2 ; 0x5721 TextEndBattle
	dw SSAnneEndBattleText2 ; 0x5721 TextEndBattle

	db $ff

SSAnne5Text1: ; 616ea (18:56ea)
	TX_FAR _SSAnne5Text1
	db "@"

SSAnne5Text2: ; 616ef (18:56ef)
	TX_FAR _SSAnne5Text2
	db "@"

SSAnne5Text3: ; 616f4 (18:56f4)
	TX_FAR _SSAnne5Text3
	db "@"

SSAnne5Text4: ; 616f9 (18:56f9)
	db $08 ; asm
	ld hl, SSAnneTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnneBattleText1: ; 61703 (18:5703)
	TX_FAR _SSAnneBattleText1
	db "@"

SSAnneEndBattleText1: ; 61708 (18:5708)
	TX_FAR _SSAnneEndBattleText1
	db "@"

SSAnneAfterBattleText1: ; 6170d (18:570d)
	TX_FAR _SSAnneAfterBattleText1
	db "@"

SSAnne5Text5: ; 61712 (18:5712)
	db $08 ; asm
	ld hl, SSAnneTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnneBattleText2: ; 6171c (18:571c)
	TX_FAR _SSAnneBattleText2
	db "@"

SSAnneEndBattleText2: ; 61721 (18:5721)
	TX_FAR _SSAnneEndBattleText2
	db "@"

SSAnneAfterBattleText2: ; 61726 (18:5726)
	TX_FAR _SSAnneAfterBattleText2
	db "@"
	
