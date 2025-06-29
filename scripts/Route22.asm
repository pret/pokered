Route22_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22_ScriptPointers
	ld a, [wRoute22CurScript]
	jp CallFunctionInTable

Route22_ScriptPointers:
	def_script_pointers
	dw_const Route22DefaultScript,           SCRIPT_ROUTE22_DEFAULT
	dw_const Route22Rival1StartBattleScript, SCRIPT_ROUTE22_RIVAL1_START_BATTLE
	dw_const Route22Rival1AfterBattleScript, SCRIPT_ROUTE22_RIVAL1_AFTER_BATTLE
	dw_const Route22Rival1ExitScript,        SCRIPT_ROUTE22_RIVAL1_EXIT
	dw_const Route22Rival2StartBattleScript, SCRIPT_ROUTE22_RIVAL2_START_BATTLE
	dw_const Route22Rival2AfterBattleScript, SCRIPT_ROUTE22_RIVAL2_AFTER_BATTLE
	dw_const Route22Rival2ExitScript,        SCRIPT_ROUTE22_RIVAL2_EXIT
	dw_const Route22NoopScript,              SCRIPT_ROUTE22_NOOP

Route22SetDefaultScript:
	xor a ; SCRIPT_ROUTE22_DEFAULT
	ld [wJoyIgnore], a
	ld [wRoute22CurScript], a
Route22NoopScript:
	ret

Route22GetRivalTrainerNoByStarterScript:
	ld a, [wRivalStarter]
	ld b, a
.next_trainer_no
	ld a, [hli]
	cp b
	jr z, .got_trainer_no
	inc hl
	jr .next_trainer_no
.got_trainer_no
	ld a, [hl]
	ld [wTrainerNo], a
	ret

Route22MoveRivalRightScript:
	ld de, Route22RivalMovementData
	ld a, [wSavedCoordIndex]
	cp $1
	jr z, .skip_first_right
	inc de
.skip_first_right
	call MoveSprite
	ld a, SPRITE_FACING_RIGHT
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay

Route22RivalMovementData:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

Route22DefaultScript:
	CheckEvent EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ret z
	ld hl, .Route22RivalBattleCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	ld [wSavedCoordIndex], a
	xor a
	ldh [hJoyHeld], a
	ld a, PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	CheckEvent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	jr nz, Route22FirstRivalBattleScript
	CheckEventReuseA EVENT_2ND_ROUTE22_RIVAL_BATTLE
	jp nz, Route22SecondRivalBattleScript
	ret

.Route22RivalBattleCoords
	dbmapcoord 29,  4
	dbmapcoord 29,  5
	db -1 ; end

Route22FirstRivalBattleScript:
	ld a, ROUTE22_RIVAL1
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .walking
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
.walking
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	call Route22MoveRivalRightScript
	ld a, SCRIPT_ROUTE22_RIVAL1_START_BATTLE
	ld [wRoute22CurScript], a
	ret

Route22Rival1StartBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, lower entry in Route22DefaultScript.Route22RivalBattleCoords
	jr nz, .set_rival_facing_right
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_UP
	jr .set_rival_facing_direction
.set_rival_facing_right
	ld a, SPRITE_FACING_RIGHT
.set_rival_facing_direction
	ldh [hSpriteFacingDirection], a
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_ROUTE22_RIVAL1
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, Route22Rival1DefeatedText
	ld de, Route22Rival1VictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL1
	ld [wCurOpponent], a
	ld hl, .StarterTable
	call Route22GetRivalTrainerNoByStarterScript
	ld a, SCRIPT_ROUTE22_RIVAL1_AFTER_BATTLE
	ld [wRoute22CurScript], a
	ret

.StarterTable:
; starter the rival picked, rival trainer number
	db STARTER2, 4
	db STARTER3, 5
	db STARTER1, 6

Route22Rival1AfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route22SetDefaultScript
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	jr nz, .not_facing_down
	ld a, SPRITE_FACING_UP
	jr .set_rival_facing
.not_facing_down
	ld a, SPRITE_FACING_RIGHT
.set_rival_facing
	ldh [hSpriteFacingDirection], a
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	ld a, PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	ld a, TEXT_ROUTE22_RIVAL1
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, lower entry in Route22DefaultScript.Route22RivalBattleCoords
	jr nz, .exit_movement_2
	call .RivalExit1Script
	jr .next_script
.exit_movement_2
	call .RivalExit2Script
.next_script
	ld a, SCRIPT_ROUTE22_RIVAL1_EXIT
	ld [wRoute22CurScript], a
	ret

.RivalExit1Script:
	ld de, Route22Rival1ExitMovementData1
	jr Route22MoveRival1

.RivalExit2Script:
	ld de, Route22Rival1ExitMovementData2
Route22MoveRival1:
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	jp MoveSprite

Route22Rival1ExitMovementData1:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

Route22Rival1ExitMovementData2:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

Route22Rival1ExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, HS_ROUTE_22_RIVAL_1
	ld [wMissableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	ResetEvents EVENT_1ST_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ld a, SCRIPT_ROUTE22_DEFAULT
	ld [wRoute22CurScript], a
	ret

Route22SecondRivalBattleScript:
	ld a, ROUTE22_RIVAL2
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .walking
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
.walking
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateTempo
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	call Route22MoveRivalRightScript
	ld a, SCRIPT_ROUTE22_RIVAL2_START_BATTLE
	ld [wRoute22CurScript], a
	ret

Route22Rival2StartBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, lower entry in Route22DefaultScript.Route22RivalBattleCoords
	jr nz, .set_player_direction_left
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_UP
	jr .set_rival_facing_direction
.set_player_direction_left
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_RIGHT
.set_rival_facing_direction
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_ROUTE22_RIVAL2
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, Route22Rival2DefeatedText
	ld de, Route22Rival2VictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL2
	ld [wCurOpponent], a
	ld hl, .StarterTable
	call Route22GetRivalTrainerNoByStarterScript
	ld a, SCRIPT_ROUTE22_RIVAL2_AFTER_BATTLE
	ld [wRoute22CurScript], a
	ret

.StarterTable:
	db STARTER2, 10
	db STARTER3, 11
	db STARTER1, 12

Route22Rival2AfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route22SetDefaultScript
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, lower entry in Route22DefaultScript.Route22RivalBattleCoords
	jr nz, .set_player_direction_left
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_UP
	jr .set_rival_facing_direction
.set_player_direction_left
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_RIGHT
.set_rival_facing_direction
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	ld a, TEXT_ROUTE22_RIVAL2
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStartAndTempo
	ld a, [wSavedCoordIndex]
	cp 1 ; index of second, lower entry in Route22DefaultScript.Route22RivalBattleCoords
	jr nz, .exit_movement_2
	call .RivalExit1Script
	jr .next_script
.exit_movement_2
	call .RivalExit2Script
.next_script
	ld a, SCRIPT_ROUTE22_RIVAL2_EXIT
	ld [wRoute22CurScript], a
	ret

.RivalExit1Script:
	ld de, Route22Rival2ExitMovementData1
	jr Route22MoveRival2

.RivalExit2Script:
	ld de, Route22Rival2ExitMovementData2
Route22MoveRival2:
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	jp MoveSprite

Route22Rival2ExitMovementData1:
	db NPC_MOVEMENT_LEFT
Route22Rival2ExitMovementData2:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db -1 ; end

Route22Rival2ExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, HS_ROUTE_22_RIVAL_2
	ld [wMissableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	ResetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ld a, SCRIPT_ROUTE22_NOOP
	ld [wRoute22CurScript], a
	ret

Route22_TextPointers:
	def_text_pointers
	dw_const Route22Rival1Text,            TEXT_ROUTE22_RIVAL1
	dw_const Route22Rival2Text,            TEXT_ROUTE22_RIVAL2
	dw_const Route22PokemonLeagueSignText, TEXT_ROUTE22_POKEMON_LEAGUE_SIGN

Route22Rival1Text:
	text_asm
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	jr z, .before_battle
	ld hl, Route22RivalAfterBattleText1
	call PrintText
	jr .text_script_end
.before_battle
	ld hl, Route22RivalBeforeBattleText1
	call PrintText
.text_script_end
	jp TextScriptEnd

Route22Rival2Text:
	text_asm
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	jr z, .before_battle
	ld hl, Route22RivalAfterBattleText2
	call PrintText
	jr .text_script_end
.before_battle
	ld hl, Route22RivalBeforeBattleText2
	call PrintText
.text_script_end
	jp TextScriptEnd

Route22RivalBeforeBattleText1:
	text_far _Route22RivalBeforeBattleText1
	text_end

Route22RivalAfterBattleText1:
	text_far _Route22RivalAfterBattleText1
	text_end

Route22Rival1DefeatedText:
	text_far _Route22Rival1DefeatedText
	text_end

Route22Rival1VictoryText:
	text_far _Route22Rival1VictoryText
	text_end

Route22RivalBeforeBattleText2:
	text_far _Route22RivalBeforeBattleText2
	text_end

Route22RivalAfterBattleText2:
	text_far _Route22RivalAfterBattleText2
	text_end

Route22Rival2DefeatedText:
	text_far _Route22Rival2DefeatedText
	text_end

Route22Rival2VictoryText:
	text_far _Route22Rival2VictoryText
	text_end

Route22PokemonLeagueSignText:
	text_far _Route22PokemonLeagueSignText
	text_end
