Mansion3Script: ; 521ee (14:61ee)
	call Mansion3Script_52204
	call EnableAutoTextBoxDrawing
	ld hl, Mansion3TrainerHeader0
	ld de, Mansion3ScriptPointers
	ld a, [W_MANSION3CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_MANSION3CURSCRIPT], a
	ret

Mansion3Script_52204: ; 52204 (14:6204)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [wd796]
	bit 0, a
	jr nz, .asm_52224
	ld a, $e
	ld bc, $207
	call Mansion2Script_5202f
	ld a, $5f
	ld bc, $507
	call Mansion2Script_5202f
	ret
.asm_52224
	ld a, $5f
	ld bc, $207
	call Mansion2Script_5202f
	ld a, $e
	ld bc, $507
	call Mansion2Script_5202f
	ret

Mansion3ScriptPointers: ; 52235 (14:6235)
	dw Mansion3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion3Script0: ; 5223b (14:623b)
	ld hl, CoordsData_52254
	call Mansion3Script_5225b
	ld a, [wWhichDungeonWarp]
	and a
	jp z, CheckFightingMapTrainers
	cp $3
	ld a, $a5
	jr nz, .asm_52250
	ld a, $d6
.asm_52250
	ld [wDungeonWarpDestinationMap], a
	ret

CoordsData_52254: ; 52254 (14:6254)
	db $0E,$10
	db $0E,$11
	db $0E,$13
	db $FF

Mansion3Script_5225b: ; 5225b (14:625b)
	xor a
	ld [wWhichDungeonWarp], a
	ld a, [wd72d]
	bit 4, a
	ret nz
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wWhichTrade] ; wWhichTrade
	ld [wWhichDungeonWarp], a
	ld hl, wd72d
	set 4, [hl]
	ld hl, wd732
	set 4, [hl]
	ret

Mansion3Script_Switches: ; 5227a (14:627a)
	ld a, [wSpriteStateData1 + 9]
	cp $4
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $6
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	jp DisplayTextID

Mansion3TextPointers: ; 5228a (14:628a)
	dw Mansion3Text1
	dw Mansion3Text2
	dw Predef5CText
	dw Predef5CText
	dw Mansion3Text5
	dw Mansion3Text6

Mansion3TrainerHeaders: ; 52296 (14:6296)
Mansion3TrainerHeader0: ; 52296 (14:6296)
	db $1 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw wd849 ; flag's byte
	dw Mansion3BattleText1 ; 0x62c3 TextBeforeBattle
	dw Mansion3AfterBattleText1 ; 0x62cd TextAfterBattle
	dw Mansion3EndBattleText1 ; 0x62c8 TextEndBattle
	dw Mansion3EndBattleText1 ; 0x62c8 TextEndBattle

Mansion3TrainerHeader2: ; 522a2 (14:62a2)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd849 ; flag's byte
	dw Mansion3BattleText2 ; 0x62d2 TextBeforeBattle
	dw Mansion3AfterBattleText2 ; 0x62dc TextAfterBattle
	dw Mansion3EndBattleText2 ; 0x62d7 TextEndBattle
	dw Mansion3EndBattleText2 ; 0x62d7 TextEndBattle

	db $ff

Mansion3Text1: ; 522af (14:62af)
	db $08 ; asm
	ld hl, Mansion3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion3Text2: ; 522b9 (14:62b9)
	db $08 ; asm
	ld hl, Mansion3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Mansion3BattleText1: ; 522c3 (14:62c3)
	TX_FAR _Mansion3BattleText1
	db "@"

Mansion3EndBattleText1: ; 522c8 (14:62c8)
	TX_FAR _Mansion3EndBattleText1
	db "@"

Mansion3AfterBattleText1: ; 522cd (14:62cd)
	TX_FAR _Mansion3AfterBattleText1
	db "@"

Mansion3BattleText2: ; 522d2 (14:62d2)
	TX_FAR _Mansion3BattleText2
	db "@"

Mansion3EndBattleText2: ; 522d7 (14:62d7)
	TX_FAR _Mansion3EndBattleText2
	db "@"

Mansion3AfterBattleText2: ; 522dc (14:62dc)
	TX_FAR _Mansion3AfterBattleText2
	db "@"

Mansion3Text5: ; 522e1 (14:62e1)
	TX_FAR _Mansion3Text5
	db "@"
