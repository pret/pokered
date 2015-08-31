BrunoScript: ; 762d6 (1d:62d6)
	call BrunoScript_762ec
	call EnableAutoTextBoxDrawing
	ld hl, BrunoTrainerHeaders
	ld de, BrunoScriptPointers
	ld a, [wBrunoCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBrunoCurScript], a
	ret

BrunoScript_762ec: ; 762ec (1d:62ec)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	jr z, .asm_76300
	ld a, $5
	jp BrunoScript_76302
.asm_76300
	ld a, $24

BrunoScript_76302: ; 76302 (1d:6302)
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

BrunoScript_7630d: ; 7630d (1d:630d)
	xor a
	ld [wBrunoCurScript], a
	ret

BrunoScriptPointers: ; 76312 (1d:6312)
	dw BrunoScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw BrunoScript2
	dw BrunoScript3
	dw BrunoScript4

BrunoScript4: ; 7631c (1d:631c)
	ret

BrunoScript_7631d: ; 7631d (1d:631d)
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
	ld [wBrunoCurScript], a
	ld [wCurMapScript], a
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
	ld a, [wCoordIndex]
	cp $3
	jr c, .asm_7635d
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_BRUNOS_ROOM
	jr z, BrunoScript_7631d
.asm_7635d
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wBrunoCurScript], a
	ld [wCurMapScript], a
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
	ld [wBrunoCurScript], a
	ld [wCurMapScript], a
	ret

BrunoScript2: ; 76396 (1d:6396)
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, BrunoScript_7630d
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

BrunoTextPointers: ; 763a8 (1d:63a8)
	dw BrunoText1
	dw BrunoDontRunAwayText

BrunoTrainerHeaders: ; 763ac (1d:63ac)
BrunoTrainerHeader0: ; 763ac (1d:63ac)
	dbEventFlagBit EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	dw BrunoBeforeBattleText ; TextBeforeBattle
	dw BrunoAfterBattleText ; TextAfterBattle
	dw BrunoEndBattleText ; TextEndBattle
	dw BrunoEndBattleText ; TextEndBattle

	db $ff

BrunoText1: ; 763b9 (1d:63b9)
	TX_ASM
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

BrunoDontRunAwayText: ; 763d2 (1d:63d2)
	TX_FAR _BrunoDontRunAwayText
	db "@"
