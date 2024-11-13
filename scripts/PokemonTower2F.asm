PokemonTower2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower2F_ScriptPointers
	ld a, [wPokemonTower2FCurScript]
	jp CallFunctionInTable

PokemonTower2FResetRivalEncounter:
	xor a ; SCRIPT_POKEMONTOWER2F_DEFAULT
	ld [wJoyIgnore], a
PokemonTower2FLoadMapScript::
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2F_ScriptPointers:
	def_script_pointers
	dw_const PokemonTower2FDefaultScript,       SCRIPT_POKEMONTOWER2F_DEFAULT
	dw_const PokemonTower2FDefeatedRivalScript, SCRIPT_POKEMONTOWER2F_DEFEATED_RIVAL
	dw_const PokemonTower2FRivalExitsScript,    SCRIPT_POKEMONTOWER2F_RIVAL_EXITS
	dw_const PokemonTower2FPlayerMovingScript,  SCRIPT_POKEMONTOWER2F_PLAYER_MOVING

PokemonTower2FDefaultScript:
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr z, .default
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	jr z, .notFirstLoad
	SetEvent EVENT_CHANNELER_WANTS_TO_TELL_PLAYER
	jr .default
.notFirstLoad
	CheckEvent EVENT_CHANNELER_WANTS_TO_TELL_PLAYER
	jr z, .default
	ld hl, wYCoord
	ld a, [hli]
	cp 7
	jr nz, .default
	ld a, [hl] ; wXCoord
	cp 6 ; 5 and 4 x coord will trigger the below code
	jr nc, .default
.forcePlayerWalk
	; check previous map
	ld a, [wWarpedFromWhichMap]
	cp POKEMON_TOWER_3F
	jr z, .checkHaveSilphScope
	cp POKEMON_TOWER_1F
	jr z, .checkBorrowed
	jr .default
.checkBorrowed
	CheckEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE
	jr .checkForceTalk
.checkHaveSilphScope
	ld b, SILPH_SCOPE
	call IsItemInBag
.checkForceTalk
	jr z, .default
	ld a, TEXT_POKEMONTOWER2F_CHANNELER_WAIT
	call PokemonTower2FDisplayTextID
	ld a, SCRIPT_POKEMONTOWER2F_PLAYER_MOVING
	jr PokemonTower2FLoadMapScript
.default
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	CheckEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	ret nz
	ld hl, PokemonTower2FRivalEncounterEventCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ResetEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	ld hl, wMapSpriteData + ((POKEMONTOWER2F_RIVAL - 1) * 2)
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	ld [hl], DOWN ; make rival stay facing down always
	jr nz, .player_below_rival
; the rival is on the left side and the player is on the right side
	ld [hl], RIGHT ; make rival stay facing right always
	SetEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
.player_below_rival
	ld [wPlayerMovingDirection], a
	ld a, POKEMONTOWER2F_RIVAL
	ldh [hSpriteIndex], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_POKEMONTOWER2F_RIVAL
	call PokemonTower2FDisplayTextID
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ret

PokemonTower2FPlayerMovingScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ld a, [wXCoord]
	cp 5
	jr nz, .doneMoving
.startMoving
	ld d, D_LEFT
	jpfar ForceStepFromDoor
.doneMoving
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	call PokemonTower2FResetRivalEncounter ; resets scripts and enables joypad
	ld a, TEXT_POKEMONTOWER2F_CHANNELER
	; fall through
PokemonTower2FDisplayTextID:
	ldh [hTextID], a
	jp DisplayTextID

PokemonTower2FRivalEncounterEventCoords:
	dbmapcoord 15,  5
	dbmapcoord 14,  6
	db $0F ; end? (should be $ff?)

PokemonTower2FDefeatedRivalScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower2FResetRivalEncounter
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	ld a, TEXT_POKEMONTOWER2F_RIVAL
	call PokemonTower2FDisplayTextID
	ld de, PokemonTower2FRivalDownThenRightMovement
	CheckEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	jr nz, .got_movement
	ld de, PokemonTower2FRivalRightThenDownMovement
.got_movement
	ld a, POKEMONTOWER2F_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
	farcall Music_RivalAlternateStart
	ld a, SCRIPT_POKEMONTOWER2F_RIVAL_EXITS
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2FRivalRightThenDownMovement:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

PokemonTower2FRivalDownThenRightMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower2FRivalExitsScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_POKEMON_TOWER_2F_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, SCRIPT_POKEMONTOWER2F_DEFAULT
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2F_TextPointers:
	def_text_pointers
	dw_const PokemonTower2FRivalText,     TEXT_POKEMONTOWER2F_RIVAL
	dw_const PokemonTower2FChannelerText, TEXT_POKEMONTOWER2F_CHANNELER
	dw_const PokemonTower2FChannelerWaitText, TEXT_POKEMONTOWER2F_CHANNELER_WAIT

PokemonTower2FRivalText:
	text_asm
	CheckEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	jr z, .do_battle
	ld hl, .HowsYourDexText
	rst _PrintText
	jr .text_script_end
.do_battle
	ld hl, .WhatBringsYouHereText
	rst _PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .DefeatedText
	ld de, .VictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL2
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	call StarterToPartyID
	add 3 ; second set of rival parties
	ld [wTrainerNo], a

	ld a, SCRIPT_POKEMONTOWER2F_DEFEATED_RIVAL
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
.text_script_end
	rst TextScriptEnd

.WhatBringsYouHereText:
	text_far _PokemonTower2FRivalWhatBringsYouHereText
	text_end

.DefeatedText:
	text_far _PokemonTower2FRivalDefeatedText
	text_end

.VictoryText:
	text_far _PokemonTower2FRivalVictoryText
	text_end

.HowsYourDexText:
	text_far _PokemonTower2FRivalHowsYourDexText
	text_end

PokemonTower2FChannelerText:
	text_asm
	ld a, SILPH_SCOPE
	ld [wNamedObjectIndex], a
	call GetItemName
	CheckEvent EVENT_RESCUED_MR_FUJI
	ld hl, .default
	jp z, .printDone
	CheckAndResetEvent EVENT_CHANNELER_WANTS_TO_TELL_PLAYER
	jr nz, .skip0
	CheckEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE_ONCE
	jr nz, .skip0
	ld hl, .wait
	rst _PrintText
	call DisplayTextPromptButton
.skip0
	CheckEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE
	jr nz, .askGiveBack
	CheckEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE_ONCE
	ld hl, .thanksAgain
	jr nz, .skip
	ld hl, .thanks
.skip
	rst _PrintText
	ld b, SILPH_SCOPE
	call IsItemInBag
	jr z, .done
	call DisplayTextPromptButton
	CheckEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE_ONCE
	ld hl, .borrowAgain
	jr nz, .skip2
	ld hl, .borrow
.skip2
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .no
	jr nz, .printDone
	ld a, SILPH_SCOPE
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE
	SetEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE_ONCE
	ld hl, .yes
	jr .printDone
.askGiveBack
	ld hl, .back
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .backNo
	jr nz, .printDone
	lb bc, SILPH_SCOPE, 1
	call GiveItem
	ld hl, .bagFull
	jr nc, .printDone
	ResetEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE
	ld hl, .backYes
.printDone
	rst _PrintText
.done
	rst TextScriptEnd
.default
	text_far _PokemonTower2FChannelerText
	text_end
.thanks
	text_far _PokemonTower2FChannelerText2
	text_end
.borrow
	text_far _PokemonTower2FChannelerTextBorrowSilphScope
	text_end
.yes
	text_far _PokemonTower2FChannelerTextBorrowSilphScopeYes
	text_asm
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	rst TextScriptEnd
.no
	text_far _LastTwoGurusTextNo
	text_end
.back
	text_far _PokemonTower2FChannelerTextBack
	text_end
.backYes
	text_far _HereYouGoText
	text_far _PlayerGotBackItem
	sound_get_item_1
	text_end
.backNo
	text_far _FossilGuyDenied
	text_end
.bagFull
	text_far _CeladonCityGramps3TM41NoRoomText
	text_end
.borrowAgain
	text_far _PokemonTower2FChannelerTextBorrowAgain
	text_end
.thanksAgain
	text_far _PokemonTower2FChannelerText3
	text_end
.wait
PokemonTower2FChannelerWaitText:
	text_asm
	CheckEvent EVENT_CHANNELER_BORROWED_SILPH_SCOPE
	ld hl, .wait
	jr z, .printDone
	ld hl, .ohHelloAgain
.printDone
	rst _PrintText
	rst TextScriptEnd
.ohHelloAgain
	text_far _OhHelloAgainText
	text_end
.wait
	text_far _GenericWaitText
	text_end