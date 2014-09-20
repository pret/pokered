VictoryRoad2Script: ; 5179d (14:579d)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	call nz, VictoryRoad2Script_517c4
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	call nz, VictoryRoad2Script_517c9
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad2TrainerHeaders
	ld de, VictoryRoad2ScriptPointers
	ld a, [W_VICTORYROAD2CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VICTORYROAD2CURSCRIPT], a
	ret

VictoryRoad2Script_517c4: ; 517c4 (14:57c4)
	ld hl, wd869
	res 7, [hl]

VictoryRoad2Script_517c9: ; 517c9 (14:57c9)
	ld a, [wd7ee]
	bit 0, a
	jr z, .asm_517da
	push af
	ld a, $15
	ld bc, $403
	call VictoryRoad2Script_517e2
	pop af
.asm_517da
	bit 7, a
	ret z
	ld a, $1d
	ld bc, $70b

VictoryRoad2Script_517e2: ; 517e2 (14:57e2)
	ld [wd09f], a
	predef ReplaceTileBlock
	ret

VictoryRoad2ScriptPointers: ; 517eb (14:57eb)
	dw VictoryRoad2Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad2Script0: ; 517f1 (14:57f1)
	ld hl, CoordsData_51816 ; $5816
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	ld hl, wd7ee
	ld a, [wWhichTrade] ; wWhichTrade
	cp $2
	jr z, .asm_5180b
	bit 0, [hl]
	set 0, [hl]
	ret nz
	jr .asm_51810
.asm_5180b
	bit 7, [hl]
	set 7, [hl]
	ret nz
.asm_51810
	ld hl, wd126
	set 5, [hl]
	ret

CoordsData_51816: ; 51816 (14:5816)
	db $10,$01
	db $10,$09
	db $FF

VictoryRoad2TextPointers: ; 5181b (14:581b)
	dw VictoryRoad2Text1
	dw VictoryRoad2Text2
	dw VictoryRoad2Text3
	dw VictoryRoad2Text4
	dw VictoryRoad2Text5
	dw VictoryRoad2Text6
	dw Predef5CText
	dw Predef5CText
	dw Predef5CText
	dw Predef5CText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad2TrainerHeaders: ; 51835 (14:5835)
VictoryRoad2TrainerHeader0: ; 51835 (14:5835)
	db $1 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7ee ; flag's byte
	dw VictoryRoad2BattleText1 ; 0x58ca TextBeforeBattle
	dw VictoryRoad2AfterBattleText1 ; 0x58d4 TextAfterBattle
	dw VictoryRoad2EndBattleText1 ; 0x58cf TextEndBattle
	dw VictoryRoad2EndBattleText1 ; 0x58cf TextEndBattle

VictoryRoad2TrainerHeader2: ; 51841 (14:5841)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7ee ; flag's byte
	dw VictoryRoad2BattleText2 ; 0x58d9 TextBeforeBattle
	dw VictoryRoad2AfterBattleText2 ; 0x58e3 TextAfterBattle
	dw VictoryRoad2EndBattleText2 ; 0x58de TextEndBattle
	dw VictoryRoad2EndBattleText2 ; 0x58de TextEndBattle

VictoryRoad2TrainerHeader3: ; 5184d (14:584d)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7ee ; flag's byte
	dw VictoryRoad2BattleText3 ; 0x58e8 TextBeforeBattle
	dw VictoryRoad2AfterBattleText3 ; 0x58f2 TextAfterBattle
	dw VictoryRoad2EndBattleText3 ; 0x58ed TextEndBattle
	dw VictoryRoad2EndBattleText3 ; 0x58ed TextEndBattle

VictoryRoad2TrainerHeader4: ; 51859 (14:5859)
	db $4 ; flag's bit
	db ($1 << 4) ; trainer's view range
	dw wd7ee ; flag's byte
	dw VictoryRoad2BattleText4 ; 0x58f7 TextBeforeBattle
	dw VictoryRoad2AfterBattleText4 ; 0x5901 TextAfterBattle
	dw VictoryRoad2EndBattleText4 ; 0x58fc TextEndBattle
	dw VictoryRoad2EndBattleText4 ; 0x58fc TextEndBattle

VictoryRoad2TrainerHeader5: ; 51865 (14:5865)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7ee ; flag's byte
	dw VictoryRoad2BattleText5 ; 0x5906 TextBeforeBattle
	dw VictoryRoad2AfterBattleText5 ; 0x5910 TextAfterBattle
	dw VictoryRoad2EndBattleText5 ; 0x590b TextEndBattle
	dw VictoryRoad2EndBattleText5 ; 0x590b TextEndBattle

VictoryRoad2TrainerHeader6: ; 51871 (14:5871)
	db $6 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw wd7ee ; flag's byte
	dw VictoryRoad2BattleText6 ; 0x58ba TextBeforeBattle
	dw VictoryRoad2BattleText6 ; 0x58ba TextAfterBattle
	dw VictoryRoad2BattleText6 ; 0x58ba TextEndBattle
	dw VictoryRoad2BattleText6 ; 0x58ba TextEndBattle

	db $ff

VictoryRoad2Text1: ; 5187e (14:587e)
	db $08 ; asm
	ld hl, VictoryRoad2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text2: ; 51888 (14:5888)
	db $08 ; asm
	ld hl, VictoryRoad2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text3: ; 51892 (14:5892)
	db $08 ; asm
	ld hl, VictoryRoad2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text4: ; 5189c (14:589c)
	db $08 ; asm
	ld hl, VictoryRoad2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text5: ; 518a6 (14:58a6)
	db $08 ; asm
	ld hl, VictoryRoad2TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text6: ; 518b0 (14:58b0)
	db $08 ; asm
	ld hl, VictoryRoad2TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2BattleText6: ; 518ba (14:58ba)
	TX_FAR _VictoryRoad2BattleText6
	db $8
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VictoryRoad2BattleText1: ; 518ca (14:58ca)
	TX_FAR _VictoryRoad2BattleText1
	db "@"

VictoryRoad2EndBattleText1: ; 518cf (14:58cf)
	TX_FAR _VictoryRoad2EndBattleText1
	db "@"

VictoryRoad2AfterBattleText1: ; 518d4 (14:58d4)
	TX_FAR _VictoryRoad2AfterBattleText1
	db "@"

VictoryRoad2BattleText2: ; 518d9 (14:58d9)
	TX_FAR _VictoryRoad2BattleText2
	db "@"

VictoryRoad2EndBattleText2: ; 518de (14:58de)
	TX_FAR _VictoryRoad2EndBattleText2
	db "@"

VictoryRoad2AfterBattleText2: ; 518e3 (14:58e3)
	TX_FAR _VictoryRoad2AfterBattleText2
	db "@"

VictoryRoad2BattleText3: ; 518e8 (14:58e8)
	TX_FAR _VictoryRoad2BattleText3
	db "@"

VictoryRoad2EndBattleText3: ; 518ed (14:58ed)
	TX_FAR _VictoryRoad2EndBattleText3
	db "@"

VictoryRoad2AfterBattleText3: ; 518f2 (14:58f2)
	TX_FAR _VictoryRoad2AfterBattleText3
	db "@"

VictoryRoad2BattleText4: ; 518f7 (14:58f7)
	TX_FAR _VictoryRoad2BattleText4
	db "@"

VictoryRoad2EndBattleText4: ; 518fc (14:58fc)
	TX_FAR _VictoryRoad2EndBattleText4
	db "@"

VictoryRoad2AfterBattleText4: ; 51901 (14:5901)
	TX_FAR _VictoryRoad2AfterBattleText4
	db "@"

VictoryRoad2BattleText5: ; 51906 (14:5906)
	TX_FAR _VictoryRoad2BattleText5
	db "@"

VictoryRoad2EndBattleText5: ; 5190b (14:590b)
	TX_FAR _VictoryRoad2EndBattleText5
	db "@"

VictoryRoad2AfterBattleText5: ; 51910 (14:5910)
	TX_FAR _VictoryRoad2AfterBattleText5
	db "@"
