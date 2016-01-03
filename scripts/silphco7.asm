SilphCo7Script: ; 51b61 (14:5b61)
	call SilphCo7Script_51b77
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo7TrainerHeaders
	ld de, SilphCo7ScriptPointers
	ld a, [wSilphCo7CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo7CurScript], a
	ret

SilphCo7Script_51b77: ; 51b77 (14:5b77)
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo7GateCoords
	call SilphCo7Text_51bc8
	call SilphCo7Text_51bf4
	CheckEvent EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	jr nz, .asm_51b9e
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 3, 5
	predef ReplaceTileBlock
	pop af
.asm_51b9e
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_7_UNLOCKED_DOOR2, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	jr nz, .asm_51bb1
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 2, 10
	predef ReplaceTileBlock
	pop af
.asm_51bb1
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_7_UNLOCKED_DOOR3, EVENT_SILPH_CO_7_UNLOCKED_DOOR2
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 6, 10
	predef_jump ReplaceTileBlock

SilphCo7GateCoords: ; 51bc1 (14:5bc1)
	db $03,$05
	db $02,$0A
	db $06,$0A
	db $FF

SilphCo7Text_51bc8: ; 51bc8 (14:5bc8)
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
	pop hl
.asm_51bd4
	ld a, [hli]
	cp $ff
	jr z, .asm_51bf0
	push hl
	ld hl, $ffe0
	inc [hl]
	pop hl
	cp b
	jr z, .asm_51be5
	inc hl
	jr .asm_51bd4
.asm_51be5
	ld a, [hli]
	cp c
	jr nz, .asm_51bd4
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_51bf0
	xor a
	ld [$ffe0], a
	ret

SilphCo7Text_51bf4: ; 51bf4 (14:5bf4)
	EventFlagAddress hl, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ld a, [$ffe0]
	and a
	ret z
	cp $1
	jr nz, .next1
	SetEventReuseHL EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ret
.next1
	cp $2
	jr nz, .next2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_7_UNLOCKED_DOOR2, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ret
.next2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_7_UNLOCKED_DOOR3, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ret

SilphCo7Text_51c0c: ; 51c0c (14:5c0c)
	xor a
	ld [wJoyIgnore], a

SilphCo7Text_51c10: ; 51c10 (14:5c10)
	ld [wSilphCo7CurScript], a
	ld [wCurMapScript], a
	ret

SilphCo7ScriptPointers: ; 51c17 (14:5c17)
	dw SilphCo7Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SilphCo7Script3
	dw SilphCo7Script4
	dw SilphCo7Script5

SilphCo7Script0: ; 51c23 (14:5c23)
	CheckEvent EVENT_BEAT_SILPH_CO_RIVAL
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_51c78
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, $9
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $9
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_51c7d
	ld a, [wCoordIndex]
	ld [wcf0d], a
	cp $1
	jr z, .asm_51c6c
	inc de
.asm_51c6c
	ld a, $9
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $3
	jp SilphCo7Text_51c10

CoordsData_51c78: ; 51c78 (14:5c78)
	db $02,$03
	db $03,$03
	db $FF

MovementData_51c7d: ; 51c7d (14:5c7d)
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

SilphCo7Script3: ; 51c82 (14:5c82)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $d
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SilphCo7Text14
	ld de, SilphCo7Text_51ecd
	call SaveEndBattleTextPointers
	ld a, OPP_SONY2
	ld [wCurOpponent], a
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .asm_51cb6
	ld a, $7
	jr .asm_51cc0
.asm_51cb6
	cp STARTER3
	jr nz, .asm_51cbe
	ld a, $8
	jr .asm_51cc0
.asm_51cbe
	ld a, $9
.asm_51cc0
	ld [wTrainerNo], a
	ld a, $4
	jp SilphCo7Text_51c10

SilphCo7Script4: ; 51cc8 (14:5cc8)
	ld a, [wIsInBattle]
	cp $ff
	jp z, SilphCo7Text_51c0c
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_SILPH_CO_RIVAL
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, $9
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_UP
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $f
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld de, MovementData_51d1d
	ld a, [wcf0d]
	cp $1
	jr nz, .asm_51d0e
	ld de, MovementData_51d1a
.asm_51d0e
	ld a, $9
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $5
	jp SilphCo7Text_51c10

MovementData_51d1a: ; 51d1a (14:5d1a)
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

MovementData_51d1d: ; 51d1d (14:5d1d)
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db $FF

SilphCo7Script5: ; 51d25 (14:5d25)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_SILPH_CO_7F_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	xor a
	ld [wJoyIgnore], a
	jp SilphCo7Text_51c10

SilphCo7TextPointers: ; 51d3f (14:5d3f)
	dw SilphCo7Text1
	dw SilphCo7Text2
	dw SilphCo7Text3
	dw SilphCo7Text4
	dw SilphCo7Text5
	dw SilphCo7Text6
	dw SilphCo7Text7
	dw SilphCo7Text8
	dw SilphCo7Text9
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SilphCo7Text13
	dw SilphCo7Text14
	dw SilphCo7Text15

SilphCo7TrainerHeaders: ; 51d5d (14:5d5d)
SilphCo7TrainerHeader0: ; 51d5d (14:5d5d)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_7F_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_7F_TRAINER_0
	dw SilphCo7BattleText1 ; TextBeforeBattle
	dw SilphCo7AfterBattleText1 ; TextAfterBattle
	dw SilphCo7EndBattleText1 ; TextEndBattle
	dw SilphCo7EndBattleText1 ; TextEndBattle

SilphCo7TrainerHeader2: ; 51d69 (14:5d69)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_7F_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_7F_TRAINER_2
	dw SilphCo7BattleText2 ; TextBeforeBattle
	dw SilphCo7AfterBattleText2 ; TextAfterBattle
	dw SilphCo7EndBattleText2 ; TextEndBattle
	dw SilphCo7EndBattleText2 ; TextEndBattle

SilphCo7TrainerHeader3: ; 51d75 (14:5d75)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_7F_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_7F_TRAINER_3
	dw SilphCo7BattleText3 ; TextBeforeBattle
	dw SilphCo7AfterBattleText3 ; TextAfterBattle
	dw SilphCo7EndBattleText3 ; TextEndBattle
	dw SilphCo7EndBattleText3 ; TextEndBattle

SilphCo7TrainerHeader4: ; 51d81 (14:5d81)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_7F_TRAINER_4, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_7F_TRAINER_4, 1
	dw SilphCo7BattleText4 ; TextBeforeBattle
	dw SilphCo7AfterBattleText4 ; TextAfterBattle
	dw SilphCo7EndBattleText4 ; TextEndBattle
	dw SilphCo7EndBattleText4 ; TextEndBattle

	db $ff

SilphCo7Text1:
; lapras guy
	TX_ASM
	ld a, [wd72e]
	bit 0, a ; got lapras?
	jr z, .givelapras
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .savedsilph
	ld hl, .LaprasGuyText
	call PrintText
	jr .done
.givelapras
	ld hl, .MeetLaprasGuyText
	call PrintText
	lb bc, LAPRAS, 15
	call GivePokemon
	jr nc, .done
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	call EnableAutoTextBoxDrawing
	ld hl, .HeresYourLaprasText
	call PrintText
	ld hl, wd72e
	set 0, [hl]
	jr .done
.savedsilph
	ld hl, .LaprasGuySavedText
	call PrintText
.done
	jp TextScriptEnd

.MeetLaprasGuyText
	TX_FAR _MeetLaprasGuyText
	db "@"

.HeresYourLaprasText
	TX_FAR _HeresYourLaprasText
	db "@"

.LaprasGuyText
	TX_FAR _LaprasGuyText
	db "@"

.LaprasGuySavedText
	TX_FAR _LaprasGuySavedText
	db "@"

SilphCo7Text2:
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .savedsilph
	ld hl, .rockettext
	call PrintText
	jr .done
.savedsilph
	ld hl, .savedtext
	call PrintText
.done
	jp TextScriptEnd

.rockettext
	TX_FAR _SilphCo7Text_51e00
	db "@"

.savedtext
	TX_FAR _CanceledMasterBallText
	db "@"

SilphCo7Text3:
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .savedsilph
	ld hl, .rockettext
	call PrintText
	jr .done
.savedsilph
	ld hl, .savedtext
	call PrintText
.done
	jp TextScriptEnd

.rockettext
	TX_FAR _SilphCo7Text_51e23
	db "@"

.savedtext
	TX_FAR _SilphCo7Text_51e28
	db "@"

SilphCo7Text4:
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .savedsilph
	ld hl, .rockettext
	call PrintText
	jr .done
.savedsilph
	ld hl, .savedtext
	call PrintText
.done
	jp TextScriptEnd

.rockettext
	TX_FAR _SilphCo7Text_51e46
	db "@"

.savedtext
	TX_FAR _SilphCo7Text_51e4b
	db "@"

SilphCo7Text5: ; 51e50 (14:5e50)
	TX_ASM
	ld hl, SilphCo7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText1: ; 51e5a (14:5e5a)
	TX_FAR _SilphCo7BattleText1
	db "@"

SilphCo7EndBattleText1: ; 51e5f (14:5e5f)
	TX_FAR _SilphCo7EndBattleText1
	db "@"

SilphCo7AfterBattleText1: ; 51e64 (14:5e64)
	TX_FAR _SilphCo7AfterBattleText1
	db "@"

SilphCo7Text6: ; 51e69 (14:5e69)
	TX_ASM
	ld hl, SilphCo7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText2: ; 51e73 (14:5e73)
	TX_FAR _SilphCo7BattleText2
	db "@"

SilphCo7EndBattleText2: ; 51e78 (14:5e78)
	TX_FAR _SilphCo7EndBattleText2
	db "@"

SilphCo7AfterBattleText2: ; 51e7d (14:5e7d)
	TX_FAR _SilphCo7AfterBattleText2
	db "@"

SilphCo7Text7: ; 51e82 (14:5e82)
	TX_ASM
	ld hl, SilphCo7TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText3: ; 51e8c (14:5e8c)
	TX_FAR _SilphCo7BattleText3
	db "@"

SilphCo7EndBattleText3: ; 51e91 (14:5e91)
	TX_FAR _SilphCo7EndBattleText3
	db "@"

SilphCo7AfterBattleText3: ; 51e96 (14:5e96)
	TX_FAR _SilphCo7AfterBattleText3
	db "@"

SilphCo7Text8: ; 51e9b (14:5e9b)
	TX_ASM
	ld hl, SilphCo7TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText4: ; 51ea5 (14:5ea5)
	TX_FAR _SilphCo7BattleText4
	db "@"

SilphCo7EndBattleText4: ; 51eaa (14:5eaa)
	TX_FAR _SilphCo7EndBattleText4
	db "@"

SilphCo7AfterBattleText4: ; 51eaf (14:5eaf)
	TX_FAR _SilphCo7AfterBattleText4
	db "@"

SilphCo7Text9: ; 51eb4 (14:5eb4)
	TX_ASM
	ld hl, SilphCo7Text_51ebe
	call PrintText
	jp TextScriptEnd

SilphCo7Text_51ebe: ; 51ebe (14:5ebe)
	TX_FAR _SilphCo7Text_51ebe
	db "@"

SilphCo7Text13: ; 51ec3 (14:5ec3)
	TX_FAR _SilphCo7Text_51ec3
	db "@"

SilphCo7Text14: ; 51ec8 (14:5ec8)
	TX_FAR _SilphCo7Text_51ec8
	db "@"

SilphCo7Text_51ecd: ; 51ecd (14:5ecd)
	TX_FAR _SilphCo7Text_51ecd
	db "@"

SilphCo7Text15: ; 51ed2 (14:5ed2)
	TX_FAR _SilphCo7Text_51ed2
	db "@"
