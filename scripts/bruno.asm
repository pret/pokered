BrunoScript: ; 762d6 (1d:62d6)
	call BrunoScript_762ec
	call EnableAutoTextBoxDrawing
	ld hl, BrunoTrainerHeaders
	ld de, BrunoScriptPointers
	ld a, [W_BRUNOCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_BRUNOCURSCRIPT], a
	ret

BrunoScript_762ec: ; 762ec (1d:62ec)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [wd864]
	bit 1, a
	jr z, .asm_76300
	ld a, $5
	jp BrunoScript_76302
.asm_76300
	ld a, $24

BrunoScript_76302: ; 76302 (1d:6302)
	ld [wd09f], a
	ld bc, $2
	predef_jump ReplaceTileBlock

BrunoScript_7630d: ; 7630d (1d:630d)
	xor a
	ld [W_BRUNOCURSCRIPT], a
	ret

BrunoScriptPointers: ; 76312 (1d:6312)
	dw BrunoScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw BrunoScript2
	dw BrunoScript3
	dw BrunoScript4

BrunoScript4: ; 7631c (1d:631c)
	ret
asm_7631d: ; 7631d (1d:631d)
	ld hl, wSimulatedJoypadStatesEnd
	ld a, D_UP
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [W_BRUNOCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

BrunoScript0: ; 76339 (1d:6339)
	ld hl, CoordsData_7637a
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [hJoyPressed], a
	ld [hJoyHeld], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, [wWhichTrade] ; wWhichTrade
	cp $3
	jr c, .asm_7635d
	ld hl, wd864
	bit 6, [hl]
	set 6, [hl]
	jr z, asm_7631d
.asm_7635d
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [W_BRUNOCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

CoordsData_7637a: ; 7637a (1d:637a)
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

BrunoScript3: ; 76383 (1d:6383)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [W_BRUNOCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

BrunoScript2: ; 76396 (1d:6396)
	call EndTrainerBattle
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, BrunoScript_7630d
	ld a, $1
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	jp DisplayTextID

BrunoTextPointers: ; 763a8 (1d:63a8)
	dw BrunoText1
	dw BrunoText2

BrunoTrainerHeaders: ; 763ac (1d:63ac)
BrunoTrainerHeader0: ; 763ac (1d:63ac)
	db $1 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw wd864 ; flag's byte
	dw BrunoBeforeBattleText ; 0x63c3 TextBeforeBattle
	dw BrunoAfterBattleText ; 0x63cd TextAfterBattle
	dw BrunoEndBattleText ; 0x63c8 TextEndBattle
	dw BrunoEndBattleText ; 0x63c8 TextEndBattle

	db $ff

BrunoText1: ; 763b9 (1d:63b9)
	db $08 ; asm
	ld hl, BrunoTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

BrunoBeforeBattleText: ; 763c3 (1d:63c3)
	TX_FAR _BrunoBeforeBattleText
	db "@"

BrunoEndBattleText: ; 763c8 (1d:63c8)
	TX_FAR _BrunoEndBattleText
	db "@"

BrunoAfterBattleText: ; 763cd (1d:63cd)
	TX_FAR _BrunoAfterBattleText
	db "@"

BrunoText2: ; 763d2 (1d:63d2)
	TX_FAR _UnnamedText_763d2
	db "@"
