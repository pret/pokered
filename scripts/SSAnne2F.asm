SSAnne2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne2F_ScriptPointers
	ld a, [wSSAnne2FCurScript]
	jp CallFunctionInTable

SSAnne2FResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wSSAnne2FCurScript], a
	ret

SSAnne2F_ScriptPointers:
	def_script_pointers
	dw_const SSAnne2FDefaultScript,          SCRIPT_SSANNE2F_DEFAULT
	dw_const SSAnne2FRivalStartBattleScript, SCRIPT_SSANNE2F_RIVAL_START_BATTLE
	dw_const SSAnne2FRivalAfterBattleScript, SCRIPT_SSANNE2F_RIVAL_AFTER_BATTLE
	dw_const SSAnne2FRivalExitScript,        SCRIPT_SSANNE2F_RIVAL_EXIT
	dw_const SSAnne2FNoopScript,             SCRIPT_SSANNE2F_NOOP

SSAnne2FNoopScript:
	ret

SSAnne2FDefaultScript:
	ld hl, .PlayerCoordinatesArray
	call ArePlayerCoordsInArray
	ret nc
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, [wCoordIndex]
	ldh [hSavedCoordIndex], a
	ld a, HS_SS_ANNE_2F_RIVAL
	ld [wMissableObjectIndex], a
	predef ShowObject
	call Delay3
	ld a, SSANNE2F_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	xor a
	ldh [hJoyHeld], a
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ldh a, [hSavedCoordIndex]
	cp $2
	jr nz, .player_standing_right
	ld de, .RivalDownFourMovement
	jr .move_sprite
.player_standing_right
	ld de, .RivalDownThreeMovement
.move_sprite
	call MoveSprite
	ld a, SCRIPT_SSANNE2F_RIVAL_START_BATTLE
	ld [wSSAnne2FCurScript], a
	ret

.RivalDownFourMovement:
	db NPC_MOVEMENT_DOWN
.RivalDownThreeMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

.PlayerCoordinatesArray:
	dbmapcoord 36,  8
	dbmapcoord 37,  8
	db -1 ; end

SSAnne2FSetFacingDirectionScript:
	ld a, [wXCoord]
	cp 37
	jr nz, .player_standing_left
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_RIGHT
	jr .set_facing_direction
.player_standing_left
	xor a ; SPRITE_FACING_DOWN
.set_facing_direction
	ldh [hSpriteFacingDirection], a
	ld a, SSANNE2F_RIVAL
	ldh [hSpriteIndex], a
	jp SetSpriteFacingDirectionAndDelay

SSAnne2FRivalStartBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	call SSAnne2FSetFacingDirectionScript
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_SSANNE2F_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld a, OPP_RIVAL2
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

	call SSAnne2FSetFacingDirectionScript
	ld a, SCRIPT_SSANNE2F_RIVAL_AFTER_BATTLE
	ld [wSSAnne2FCurScript], a
	ret

SSAnne2FRivalAfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SSAnne2FResetScripts
	call SSAnne2FSetFacingDirectionScript
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_SSANNE2F_RIVAL_CUT_MASTER
	ldh [hTextID], a
	call DisplayTextID
	ld a, SSANNE2F_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, [wXCoord]
	cp 37
	jr nz, .player_standing_left
	ld de, .RivalDownFourMovement
	jr .move_sprite
.player_standing_left
	ld de, .RivalWalkAroundPlayerMovement
.move_sprite
	ld a, SSANNE2F_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld a, SCRIPT_SSANNE2F_RIVAL_EXIT
	ld [wSSAnne2FCurScript], a
	ret

.RivalWalkAroundPlayerMovement:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
.RivalDownFourMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

SSAnne2FRivalExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, HS_SS_ANNE_2F_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	ld a, SCRIPT_SSANNE2F_NOOP
	ld [wSSAnne2FCurScript], a
	ret

SSAnne2F_TextPointers:
	def_text_pointers
	dw_const SSAnne2FWaiterText,         TEXT_SSANNE2F_WAITER
	dw_const SSAnne2FRivalText,          TEXT_SSANNE2F_RIVAL
	dw_const SSAnne2FRivalCutMasterText, TEXT_SSANNE2F_RIVAL_CUT_MASTER

SSAnne2FWaiterText:
	text_far _SSAnne2FWaiterText
	text_end

SSAnne2FRivalText:
	text_asm
	ld hl, .Text
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, SSAnne2FRivalDefeatedText
	ld de, SSAnne2FRivalVictoryText
	call SaveEndBattleTextPointers
	jp TextScriptEnd

.Text:
	text_far _SSAnne2FRivalText
	text_end

SSAnne2FRivalDefeatedText:
	text_far _SSAnne2FRivalDefeatedText
	text_end

SSAnne2FRivalVictoryText:
	text_far _SSAnne2FRivalVictoryText
	text_end

SSAnne2FRivalCutMasterText:
	text_far _SSAnne2FRivalCutMasterText
	text_end
