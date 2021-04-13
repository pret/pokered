SilphCo7F_Script:
	call SilphCo7Script_51b77
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo7TrainerHeaders
	ld de, SilphCo7F_ScriptPointers
	ld a, [wSilphCo7FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo7FCurScript], a
	ret

SilphCo7Script_51b77:
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

SilphCo7GateCoords:
	dbmapcoord  5,  3
	dbmapcoord 10,  2
	dbmapcoord 10,  6
	db -1 ; end

SilphCo7Text_51bc8:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.asm_51bd4
	ld a, [hli]
	cp $ff
	jr z, .asm_51bf0
	push hl
	ld hl, hUnlockedSilphCoDoors
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
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo7Text_51bf4:
	EventFlagAddress hl, EVENT_SILPH_CO_7_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
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

SilphCo7Text_51c0c:
	xor a
	ld [wJoyIgnore], a

SilphCo7Text_51c10:
	ld [wSilphCo7FCurScript], a
	ld [wCurMapScript], a
	ret

SilphCo7F_ScriptPointers:
	dw SilphCo7Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SilphCo7Script3
	dw SilphCo7Script4
	dw SilphCo7Script5

SilphCo7Script0:
	CheckEvent EVENT_BEAT_SILPH_CO_RIVAL
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_51c78
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, $9
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $9
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_51c7d
	ld a, [wCoordIndex]
	ld [wcf0d], a
	cp $1
	jr z, .asm_51c6c
	inc de
.asm_51c6c
	ld a, $9
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $3
	jp SilphCo7Text_51c10

CoordsData_51c78:
	dbmapcoord  3,  2
	dbmapcoord  3,  3
	db -1 ; end

MovementData_51c7d:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

SilphCo7Script3:
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $d
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SilphCo7Text14
	ld de, SilphCo7Text_51ecd
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL2
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

SilphCo7Script4:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SilphCo7Text_51c0c
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_SILPH_CO_RIVAL
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, $9
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $f
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld de, MovementData_51d1d
	ld a, [wcf0d]
	cp $1
	jr nz, .asm_51d0e
	ld de, MovementData_51d1a
.asm_51d0e
	ld a, $9
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $5
	jp SilphCo7Text_51c10

MovementData_51d1a:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

MovementData_51d1d:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db -1 ; end

SilphCo7Script5:
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

SilphCo7F_TextPointers:
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

SilphCo7TrainerHeaders:
	def_trainers 5
SilphCo7TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_0, 2, SilphCo7BattleText1, SilphCo7EndBattleText1, SilphCo7AfterBattleText1
SilphCo7TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_1, 3, SilphCo7BattleText2, SilphCo7EndBattleText2, SilphCo7AfterBattleText2
SilphCo7TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_2, 3, SilphCo7BattleText3, SilphCo7EndBattleText3, SilphCo7AfterBattleText3
SilphCo7TrainerHeader3:
	trainer EVENT_BEAT_SILPH_CO_7F_TRAINER_3, 4, SilphCo7BattleText4, SilphCo7EndBattleText4, SilphCo7AfterBattleText4
	db -1 ; end

SilphCo7Text1:
; lapras guy
	text_asm
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
	text_far _MeetLaprasGuyText
	text_end

.HeresYourLaprasText
	text_far _HeresYourLaprasText
	text_end

.LaprasGuyText
	text_far _LaprasGuyText
	text_end

.LaprasGuySavedText
	text_far _LaprasGuySavedText
	text_end

SilphCo7Text2:
	text_asm
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
	text_far _SilphCo7Text_51e00
	text_end

.savedtext
	text_far _CanceledMasterBallText
	text_end

SilphCo7Text3:
	text_asm
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
	text_far _SilphCo7Text_51e23
	text_end

.savedtext
	text_far _SilphCo7Text_51e28
	text_end

SilphCo7Text4:
	text_asm
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
	text_far _SilphCo7Text_51e46
	text_end

.savedtext
	text_far _SilphCo7Text_51e4b
	text_end

SilphCo7Text5:
	text_asm
	ld hl, SilphCo7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText1:
	text_far _SilphCo7BattleText1
	text_end

SilphCo7EndBattleText1:
	text_far _SilphCo7EndBattleText1
	text_end

SilphCo7AfterBattleText1:
	text_far _SilphCo7AfterBattleText1
	text_end

SilphCo7Text6:
	text_asm
	ld hl, SilphCo7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText2:
	text_far _SilphCo7BattleText2
	text_end

SilphCo7EndBattleText2:
	text_far _SilphCo7EndBattleText2
	text_end

SilphCo7AfterBattleText2:
	text_far _SilphCo7AfterBattleText2
	text_end

SilphCo7Text7:
	text_asm
	ld hl, SilphCo7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText3:
	text_far _SilphCo7BattleText3
	text_end

SilphCo7EndBattleText3:
	text_far _SilphCo7EndBattleText3
	text_end

SilphCo7AfterBattleText3:
	text_far _SilphCo7AfterBattleText3
	text_end

SilphCo7Text8:
	text_asm
	ld hl, SilphCo7TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText4:
	text_far _SilphCo7BattleText4
	text_end

SilphCo7EndBattleText4:
	text_far _SilphCo7EndBattleText4
	text_end

SilphCo7AfterBattleText4:
	text_far _SilphCo7AfterBattleText4
	text_end

SilphCo7Text9:
	text_asm
	ld hl, SilphCo7Text_51ebe
	call PrintText
	jp TextScriptEnd

SilphCo7Text_51ebe:
	text_far _SilphCo7Text_51ebe
	text_end

SilphCo7Text13:
	text_far _SilphCo7Text_51ec3
	text_end

SilphCo7Text14:
	text_far _SilphCo7Text_51ec8
	text_end

SilphCo7Text_51ecd:
	text_far _SilphCo7Text_51ecd
	text_end

SilphCo7Text15:
	text_far _SilphCo7Text_51ed2
	text_end
