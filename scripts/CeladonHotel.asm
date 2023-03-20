CeladonHotel_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeladonHotelTrainerHeaders
	ld de, CeladonHotel_ScriptPointers
	ld a, [wCeladonHotelCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonHotelCurScript], a
	ret

CeladonHotel_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw CeladonLaprasGuyLeaves
	dw CeladonLaprasGuyGoesThroughDoor
	dw CeladonLaprasGuyWaitingForLoserToMove


CeladonHotel_TextPointers:
	dw CeladonChannelerText
	dw CeladonHotelText1
	dw CeladonHotelText2
	dw CeladonHotelText3
	dw CeladonLaprasGuyText

CeladonHotelTrainerHeaders:
	def_trainers 2
CeladonHotelTrainerHeader0:
	trainer EVENT_BEAT_CELADON_HOTEL_TRAINER_0, 0, CeladonHotelBattleText1, CeladonHotelEndBattleText1, CeladonHotelAfterBattleText1
	db -1 ; end

; PureRGBnote: ADDED: new trainer in the hotel who humorously is looking for the "ghost PC" which actually exists in this hotel.
CeladonChannelerText: 
	text_asm
	CheckEvent EVENT_BEAT_CELADON_HOTEL_TRAINER_0
	jr nz, .beat
	ld hl, CeladonChannelerIntroText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no1
	jr .q2
.no1
	ld hl, CeladonChannelerNo1
	rst _PrintText
	jr .done
.q2
	ld hl, CeladonChannelerQ2
	rst _PrintText
	call YesNoChoice
	ld hl, CeladonHotelTrainerHeader0
	call TalkToTrainer
	jr .done
.beat
	ld hl, CeladonHotelAfterBattleText1
	rst _PrintText
.done
	rst TextScriptEnd

CeladonChannelerIntroText:
	text_far _CeladonChannelerIntro
	text_end

CeladonChannelerNo1:
	text_far _CeladonChannelerNo1
	text_end

CeladonChannelerQ2:
	text_far _CeladonChannelerQ2
	text_end

CeladonHotelBattleText1:
	text_far _CeladonHotelBattleText1
	text_end

CeladonHotelEndBattleText1:
	text_far _CeladonHotelEndBattleText1
	text_end

CeladonHotelAfterBattleText1:
	text_far _CeladonHotelAfterBattleText1
	text_end

CeladonHotelText1:
	text_far _CeladonHotelText1
	text_end

CeladonHotelText2:
	text_far _CeladonHotelText2
	text_end

CeladonHotelText3:
	text_far _CeladonHotelText3
	text_end

; PureRGBnote: ADDED: NPC who will give you lapras earlier once you beat rocket hideout.
; He's supposed to be the same guy who gives you lapras in silph co. but he's on a business trip 
; and goes back to silph co just in time for it to be occupied by team rocket.
CeladonLaprasGuyText:
	text_asm
	CheckEventHL EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jr nz, .celadonRocketsGone
	ld hl, CeladonLaprasGuyIntro
	rst _PrintText
	jr .done
.celadonRocketsGone
	ld hl, CeladonLaprasGuyReady
	rst _PrintText
	lb bc, LAPRAS, 30
	call GivePokemon
	jr nc, .noBoxRoom
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	ld hl, CeladonHeresYourLaprasText
	rst _PrintText
	SetEvent EVENT_GOT_LAPRAS_EARLY
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	ld hl, CeladonLaprasGuyAfter
	rst _PrintText
	ld a, 3
	ld [wCeladonHotelCurScript], a
	jr .done
.noBoxRoom
	ld hl, CeladonLaprasGuyNoBoxRoom
	rst _PrintText
.done
	rst TextScriptEnd

CeladonLaprasGuyLeaves:
	; if the guy who can walk left and right is on a specific position we have to make him get out of the way first
	ld a, [wSprite04StateData2MapX]
	cp 8
	ld de, CeladonLoserMovement
	jr z, .loserinway
	cp 9
	ld de, CeladonLoserMovement2
	jr z, .loserinway
	jr .losernotinway
.loserinway
	ld a, 4
	ldh [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, 5
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret
.losernotinway
	; make the other guy stop moving
	ld a, 4
	ldh [hSpriteIndexOrTextID], a
	call GetSpriteMovementByte1Pointer
	ld a, STAY
	ld [hl], a
	; silph guy walks away according to where you are
	ld a, [wXCoord]
	cp 4
	ld de, CeladonLaprasGuyMovement1
	jr nz, .notLeftOfLaprasGuy
	ld de, CeladonLaprasGuyMovement2
.notLeftOfLaprasGuy
	ld a, 5
	ldh [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, 4
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret

CeladonLoserMovement2:
	db NPC_MOVEMENT_LEFT
CeladonLoserMovement:
	db NPC_MOVEMENT_LEFT
	db -1

CeladonLaprasGuyMovement1:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

CeladonLaprasGuyMovement2:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

CeladonLaprasGuyGoesThroughDoor:
	; leaves through the door with a sound
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, SFX_GO_OUTSIDE
	rst _PlaySound
	ld a, HS_LAPRAS_GUY_CELADON
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, 4
	ldh [hSpriteIndexOrTextID], a
	call GetSpriteMovementByte1Pointer
	ld a, WALK
	ld [hl], a
	call GetSpriteMovementByte2Pointer
	ld a, LEFT_RIGHT
	ld [hl], a
	xor a
	ld [wJoyIgnore], a
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret	

CeladonLaprasGuyWaitingForLoserToMove:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, 3
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret

CeladonLaprasGuyIntro:
	text_far _CeladonLaprasGuyIntro
	text_end

CeladonLaprasGuyReady:
	text_far _CeladonLaprasGuyReady
	text_end

CeladonHeresYourLaprasText:
	text_far _HeresYourLaprasText
	text_end

CeladonLaprasGuyNoBoxRoom:
	text_far _SwitchPCBoxesFirst
	text_end

CeladonLaprasGuyAfter:
	text_far _CeladonLaprasGuyAfter
	text_end