AgathaScript: ; 7642d (1d:642d)
	call AgathaScript_76443
	call EnableAutoTextBoxDrawing
	ld hl, AgathaTrainerHeaders
	ld de, AgathaScriptPointers
	ld a, [W_AGATHACURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_AGATHACURSCRIPT], a
	ret

AgathaScript_76443: ; 76443 (1d:6443)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BEAT_AGATHAS_ROOM_TRAINER_0
	jr z, .asm_76457
	ld a, $e
	jp AgathaScript_76459
.asm_76457
	ld a, $3b

AgathaScript_76459: ; 76459 (1d:6459)
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

AgathaScript_76464: ; 76464 (1d:6464)
	xor a
	ld [W_AGATHACURSCRIPT], a
	ret

AgathaScriptPointers: ; 76469 (1d:6469)
	dw AgathaScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw AgathaScript2
	dw AgathaScript3
	dw AgathaScript4

AgathaScript4: ; 76473 (1d:6473)
	ret

AgathaScript_76474: ; 76474 (1d:6474)
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
	ld [W_AGATHACURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

AgathaScript0: ; 76490 (1d:6490)
	ld hl, CoordsData_764d1
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [hJoyPressed], a
	ld [hJoyHeld], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, [wCoordIndex]
	cp $3
	jr c, .asm_764b4
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_AGATHAS_ROOM
	jr z, AgathaScript_76474
.asm_764b4
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [W_AGATHACURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

CoordsData_764d1: ; 764d1 (1d:64d1)
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

AgathaScript3: ; 764da (1d:64da)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [W_AGATHACURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

AgathaScript2: ; 764ed (1d:64ed)
	call EndTrainerBattle
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, AgathaScript_76464
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [W_GARYCURSCRIPT], a
	ret

AgathaTextPointers: ; 76505 (1d:6505)
	dw AgathaText1
	dw AgathaDontRunAwayText

AgathaTrainerHeaders: ; 76509 (1d:6509)
AgathaTrainerHeader0: ; 76509 (1d:6509)
	dbEventFlagBit EVENT_BEAT_AGATHAS_ROOM_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_AGATHAS_ROOM_TRAINER_0
	dw AgathaBeforeBattleText ; TextBeforeBattle
	dw AgathaAfterBattleText ; TextAfterBattle
	dw AgathaEndBattleText ; TextEndBattle
	dw AgathaEndBattleText ; TextEndBattle

	db $ff

AgathaText1: ; 76516 (1d:6516)
	TX_ASM
	ld hl, AgathaTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

AgathaBeforeBattleText: ; 76520 (1d:6520)
	TX_FAR _AgathaBeforeBattleText
	db "@"

AgathaEndBattleText: ; 76525 (1d:6525)
	TX_FAR _AgathaEndBattleText
	db "@"

AgathaAfterBattleText: ; 7652a (1d:652a)
	TX_FAR _AgathaAfterBattleText
	db "@"

AgathaDontRunAwayText: ; 7652f (1d:652f)
	TX_FAR _AgathaDontRunAwayText
	db "@"
