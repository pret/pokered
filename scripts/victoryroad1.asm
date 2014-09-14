VictoryRoad1Script: ; 5da0a (17:5a0a)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	call nz, .next
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad1TrainerHeaders
	ld de, VictoryRoad1ScriptPointers
	ld a, [W_VICTORYROAD1CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VICTORYROAD1CURSCRIPT], a
	ret
.next
	ld a, [wd869]
	bit 7, a
	ret z
	ld a, $1d
	ld [wd09f], a
	ld bc, $604
	predef_jump ReplaceTileBlock

VictoryRoad1ScriptPointers: ; 5da3a (17:5a3a)
	dw VictoryRoad1Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad1Script0: ; 5da40 (17:5a40)
	ld a, [wd869]
	bit 7, a
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_5da5c ; $5a5c
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	ld hl, wd126
	set 5, [hl]
	ld hl, wd869
	set 7, [hl]
	ret

CoordsData_5da5c: ; 5da5c (17:5a5c)
	db $0D,$11,$FF

VictoryRoad1TextPointers: ; 5da5f (17:5a5f)
	dw VictoryRoad1Text1
	dw VictoryRoad1Text2
	dw Predef5CText
	dw Predef5CText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad1TrainerHeaders: ; 5da6d (17:5a6d)
VictoryRoad1TrainerHeader0: ; 5da6d (17:5a6d)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd869 ; flag's byte
	dw VictoryRoad1BattleText1 ; 0x5a9a TextBeforeBattle
	dw VictoryRoad1AfterBattleText1 ; 0x5aa4 TextAfterBattle
	dw VictoryRoad1EndBattleText1 ; 0x5a9f TextEndBattle
	dw VictoryRoad1EndBattleText1 ; 0x5a9f TextEndBattle

VictoryRoad1TrainerHeader1: ; 5da79 (17:5a79)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd869 ; flag's byte
	dw VictoryRoad1BattleText2 ; 0x5aa9 TextBeforeBattle
	dw VictoryRoad1AfterBattleText2 ; 0x5ab3 TextAfterBattle
	dw VictoryRoad1EndBattleText2 ; 0x5aae TextEndBattle
	dw VictoryRoad1EndBattleText2 ; 0x5aae TextEndBattle

	db $ff

VictoryRoad1Text1: ; 5da86 (17:5a86)
	db $08 ; asm
	ld hl, VictoryRoad1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad1Text2: ; 5da90 (17:5a90)
	db $08 ; asm
	ld hl, VictoryRoad1TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad1BattleText1: ; 5da9a (17:5a9a)
	TX_FAR _VictoryRoad1BattleText1
	db "@"

VictoryRoad1EndBattleText1: ; 5da9f (17:5a9f)
	TX_FAR _VictoryRoad1EndBattleText1
	db "@"

VictoryRoad1AfterBattleText1: ; 5daa4 (17:5aa4)
	TX_FAR _VictoryRoad1AfterBattleText1
	db "@"

VictoryRoad1BattleText2: ; 5daa9 (17:5aa9)
	TX_FAR _VictoryRoad1BattleText2
	db "@"

VictoryRoad1EndBattleText2: ; 5daae (17:5aae)
	TX_FAR _VictoryRoad1EndBattleText2
	db "@"

VictoryRoad1AfterBattleText2: ; 5dab3 (17:5ab3)
	TX_FAR _VictoryRoad1AfterBattleText2
	db "@"
