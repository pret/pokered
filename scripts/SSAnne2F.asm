SSAnne2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne2F_ScriptPointers
	ld a, [wSSAnne2FCurScript]
	jp CallFunctionInTable

SSAnne2Script_613ab:
	xor a
	ld [wJoyIgnore], a
	ld [wSSAnne2FCurScript], a
	ret

SSAnne2F_ScriptPointers:
	dw SSAnne2Script0
	dw SSAnne2Script1
	dw SSAnne2Script2
	dw SSAnne2Script3
	dw SSAnne2Script4

SSAnne2Script4:
	ret

SSAnne2Script0:
	ld hl, CoordsData_61411
	call ArePlayerCoordsInArray
	ret nc
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, [wCoordIndex]
	ld [$ffdb], a
	ld a, HS_SS_ANNE_2F_RIVAL
	ld [wMissableObjectIndex], a
	predef ShowObject
	call Delay3
	ld a, $2
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [$ffdb]
	cp $2
	jr nz, .asm_61400
	ld de, MovementData_6140c
	jr .asm_61403
.asm_61400
	ld de, MovementData_6140d
.asm_61403
	call MoveSprite
	ld a, $1
	ld [wSSAnne2FCurScript], a
	ret

MovementData_6140c:
	db NPC_MOVEMENT_DOWN

MovementData_6140d:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

CoordsData_61411:
	db $08,$24
	db $08,$25
	db $FF

SSAnne2Script_61416:
	ld a, [wXCoord]
	cp $25
	jr nz, .asm_61426
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_RIGHT
	jr .asm_61427
.asm_61426
	xor a ; SPRITE_FACING_DOWN
.asm_61427
	ld [hSpriteFacingDirection], a
	ld a, $2
	ld [H_SPRITEINDEX], a
	jp SetSpriteFacingDirectionAndDelay

SSAnne2Script1:
	ld a, [wd730]
	bit 0, a
	ret nz
	call SSAnne2Script_61416
	xor a
	ld [wJoyIgnore], a
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld a, OPP_SONY2
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $1
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $2
	jr .done
.Charmander
	ld a, $3
.done
	ld [wTrainerNo], a

	call SSAnne2Script_61416
	ld a, $2
	ld [wSSAnne2FCurScript], a
	ret

SSAnne2Script2:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SSAnne2Script_613ab
	call SSAnne2Script_61416
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $2
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld a, [wXCoord]
	cp $25
	jr nz, .asm_61497
	ld de, MovementData_614b9
	jr .asm_6149a
.asm_61497
	ld de, MovementData_614b7
.asm_6149a
	ld a, $2
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $3
	ld [wSSAnne2FCurScript], a
	ret

MovementData_614b7:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN

MovementData_614b9:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

SSAnne2Script3:
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, HS_SS_ANNE_2F_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	ld a, $4
	ld [wSSAnne2FCurScript], a
	ret

SSAnne2F_TextPointers:
	dw SSAnne2Text1
	dw SSAnne2Text2
	dw SSAnne2Text3

SSAnne2Text1:
	TX_FAR _SSAnne2Text1
	db "@"

SSAnne2Text2:
	TX_ASM
	ld hl, SSAnneRivalBeforeBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SSAnneRivalDefeatedText
	ld de, SSAnneRivalWonText
	call SaveEndBattleTextPointers
	jp TextScriptEnd

SSAnneRivalBeforeBattleText:
	TX_FAR _SSAnneRivalBeforeBattleText
	db "@"

SSAnneRivalDefeatedText:
	TX_FAR _SSAnneRivalDefeatedText
	db "@"

SSAnneRivalWonText:
	TX_FAR _SSAnneRivalWonText
	db "@"

SSAnne2Text3:
	TX_FAR _SSAnneRivalCaptainText
	db "@"
