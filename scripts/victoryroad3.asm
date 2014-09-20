VictoryRoad3Script: ; 44980 (11:4980)
	call VictoryRoad3Script_44996
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad3TrainerHeaders
	ld de, VictoryRoad3ScriptPointers
	ld a, [W_VICTORYROAD3CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VICTORYROAD3CURSCRIPT], a
	ret

VictoryRoad3Script_44996: ; 44996 (11:4996)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, wd813
	bit 0, [hl]
	ret z
	ld a, $1d
	ld [wd09f], a
	ld bc, $503
	predef_jump ReplaceTileBlock

VictoryRoad3ScriptPointers: ; 449b1 (11:49b1)
	dw VictoryRoad3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad3Script0: ; 449b7 (11:49b7)
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jp z, .asm_449fe
	ld hl, .coordsData_449f9 ; $49f9
	call CheckBoulderCoords
	jp nc, .asm_449fe
	ld a, [wWhichTrade] ; wWhichTrade
	cp $1
	jr nz, .asm_449dc
	ld hl, wd126
	set 5, [hl]
	ld hl, wd813
	set 0, [hl]
	ret
.asm_449dc
	ld hl, wd813
	bit 6, [hl]
	set 6, [hl]
	jr nz, .asm_449fe
	ld a, $7a
	ld [wcc4d], a
	predef HideObject
	ld a, $60
	ld [wcc4d], a
	predef_jump ShowObject

.coordsData_449f9: ; 449f9 (11:49f9)
	db $05,$03
	db $0F,$17
	db $FF

.asm_449fe
	ld a, $c2
	ld [wDungeonWarpDestinationMap], a
	ld hl, .coordsData_449f9 ; $49f9
	call Func_46981
	ld a, [wWhichTrade] ; wWhichTrade
	cp $1
	jr nz, .asm_44a1b
	ld hl, wd72d
	res 4, [hl]
	ld hl, wd732
	res 4, [hl]
	ret
.asm_44a1b
	ld a, [wd72d]
	bit 4, a
	jp z, CheckFightingMapTrainers
	ret

VictoryRoad3TextPointers: ; 44a24 (11:4a24)
	dw VictoryRoad3Text1
	dw VictoryRoad3Text2
	dw VictoryRoad3Text3
	dw VictoryRoad3Text4
	dw Predef5CText
	dw Predef5CText
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad3TrainerHeaders: ; 44a38 (11:4a38)
VictoryRoad3TrainerHeader0: ; 44a38 (11:4a38)
	db $1 ; flag's bit
	db ($1 << 4) ; trainer's view range
	dw wd813 ; flag's byte
	dw VictoryRoad3BattleText2 ; 0x4a91 TextBeforeBattle
	dw VictoryRoad3AfterBattleText2 ; 0x4a9b TextAfterBattle
	dw VictoryRoad3EndBattleText2 ; 0x4a96 TextEndBattle
	dw VictoryRoad3EndBattleText2 ; 0x4a96 TextEndBattle

VictoryRoad3TrainerHeader2: ; 44a44 (11:4a44)
	db $2 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd813 ; flag's byte
	dw VictoryRoad3BattleText3 ; 0x4aa0 TextBeforeBattle
	dw VictoryRoad3AfterBattleText3 ; 0x4aaa TextAfterBattle
	dw VictoryRoad3EndBattleText3 ; 0x4aa5 TextEndBattle
	dw VictoryRoad3EndBattleText3 ; 0x4aa5 TextEndBattle

VictoryRoad3TrainerHeader3: ; 44a50 (11:4a50)
	db $3 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd813 ; flag's byte
	dw VictoryRoad3BattleText4 ; 0x4aaf TextBeforeBattle
	dw VictoryRoad3AfterBattleText4 ; 0x4ab9 TextAfterBattle
	dw VictoryRoad3EndBattleText4 ; 0x4ab4 TextEndBattle
	dw VictoryRoad3EndBattleText4 ; 0x4ab4 TextEndBattle

VictoryRoad3TrainerHeader4: ; 44a5c (11:4a5c)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd813 ; flag's byte
	dw VictoryRoad3BattleText5 ; 0x4abe TextBeforeBattle
	dw VictoryRoad3AfterBattleText5 ; 0x4ac8 TextAfterBattle
	dw VictoryRoad3EndBattleText5 ; 0x4ac3 TextEndBattle
	dw VictoryRoad3EndBattleText5 ; 0x4ac3 TextEndBattle

	db $ff

VictoryRoad3Text1: ; 44a69 (11:4a69)
	db $08 ; asm
	ld hl, VictoryRoad3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text2: ; 44a73 (11:4a73)
	db $08 ; asm
	ld hl, VictoryRoad3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text3: ; 44a7d (11:4a7d)
	db $08 ; asm
	ld hl, VictoryRoad3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text4: ; 44a87 (11:4a87)
	db $08 ; asm
	ld hl, VictoryRoad3TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3BattleText2: ; 44a91 (11:4a91)
	TX_FAR _VictoryRoad3BattleText2
	db "@"

VictoryRoad3EndBattleText2: ; 44a96 (11:4a96)
	TX_FAR _VictoryRoad3EndBattleText2
	db "@"

VictoryRoad3AfterBattleText2: ; 44a9b (11:4a9b)
	TX_FAR _VictoryRoad3AfterBattleText2
	db "@"

VictoryRoad3BattleText3: ; 44aa0 (11:4aa0)
	TX_FAR _VictoryRoad3BattleText3
	db "@"

VictoryRoad3EndBattleText3: ; 44aa5 (11:4aa5)
	TX_FAR _VictoryRoad3EndBattleText3
	db "@"

VictoryRoad3AfterBattleText3: ; 44aaa (11:4aaa)
	TX_FAR _VictoryRoad3AfterBattleText3
	db "@"

VictoryRoad3BattleText4: ; 44aaf (11:4aaf)
	TX_FAR _VictoryRoad3BattleText4
	db "@"

VictoryRoad3EndBattleText4: ; 44ab4 (11:4ab4)
	TX_FAR _VictoryRoad3EndBattleText4
	db "@"

VictoryRoad3AfterBattleText4: ; 44ab9 (11:4ab9)
	TX_FAR _VictoryRoad3AfterBattleText4
	db "@"

VictoryRoad3BattleText5: ; 44abe (11:4abe)
	TX_FAR _VictoryRoad3BattleText5
	db "@"

VictoryRoad3EndBattleText5: ; 44ac3 (11:4ac3)
	TX_FAR _VictoryRoad3EndBattleText5
	db "@"

VictoryRoad3AfterBattleText5: ; 44ac8 (11:4ac8)
	TX_FAR _VictoryRoad3AfterBattleText5
	db "@"
