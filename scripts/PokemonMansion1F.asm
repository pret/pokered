PokemonMansion1F_Script:
	call Mansion1CheckReplaceSwitchDoorBlocks
	call EnableAutoTextBoxDrawing
	ld hl, Mansion1TrainerHeaders
	ld de, PokemonMansion1F_ScriptPointers
	ld a, [wPokemonMansion1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansion1FCurScript], a
	ret

Mansion1CheckReplaceSwitchDoorBlocks:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .switchTurnedOn
	lb bc, 6, 12
	call Mansion1LoadEmptyFloorTileBlock
	lb bc, 3, 8
	call Mansion1LoadHorizontalGateBlock
	lb bc, 8, 10
	call Mansion1LoadHorizontalGateBlock
	lb bc, 13, 13
	jp Mansion1LoadHorizontalGateBlock
.switchTurnedOn
	lb bc, 6, 12
	call Mansion1LoadHorizontalGateBlock
	lb bc, 3, 8
	call Mansion1LoadEmptyFloorTileBlock
	lb bc, 8, 10
	call Mansion1LoadEmptyFloorTileBlock
	lb bc, 13, 13
	jp Mansion1LoadEmptyFloorTileBlock

Mansion1LoadHorizontalGateBlock:
	ld a, $2d
	ld [wNewTileBlockID], a
	jr Mansion1ReplaceBlock

Mansion1LoadEmptyFloorTileBlock:
	ld a, $e
	ld [wNewTileBlockID], a
Mansion1ReplaceBlock:
	predef ReplaceTileBlock
	ret

Mansion1Script_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONMANSION1F_SWITCH
	ldh [hTextID], a
	jp DisplayTextID

PokemonMansion1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONMANSION1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONMANSION1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONMANSION1F_END_BATTLE

PokemonMansion1F_TextPointers:
	def_text_pointers
	dw_const PokemonMansion1FScientistText, TEXT_POKEMONMANSION1F_SCIENTIST
	dw_const PickUpItemText,                TEXT_POKEMONMANSION1F_ESCAPE_ROPE
	dw_const PickUpItemText,                TEXT_POKEMONMANSION1F_CARBOS
	dw_const PokemonMansion1FSwitchText,    TEXT_POKEMONMANSION1F_SWITCH

Mansion1TrainerHeaders:
	def_trainers
Mansion1TrainerHeader0:
	trainer EVENT_BEAT_MANSION_1_TRAINER_0, 3, PokemonMansion1FScientistBattleText, PokemonMansion1FScientistEndBattleText, PokemonMansion1FScientistAfterBattleText
	db -1 ; end

PokemonMansion1FScientistText:
	text_asm
	ld hl, Mansion1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonMansion1FScientistBattleText:
	text_far _PokemonMansion1FScientistBattleText
	text_end

PokemonMansion1FScientistEndBattleText:
	text_far _PokemonMansion1FScientistEndBattleText
	text_end

PokemonMansion1FScientistAfterBattleText:
	text_far _PokemonMansion1FScientistAfterBattleText
	text_end

PokemonMansion1FSwitchText:
	text_asm
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .not_pressed
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ld hl, .PressedText
	call PrintText
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckAndSetEvent EVENT_MANSION_SWITCH_ON
	jr z, .done
	ResetEventReuseHL EVENT_MANSION_SWITCH_ON
	jr .done
.not_pressed
	ld hl, .NotPressedText
	call PrintText
.done
	jp TextScriptEnd

.Text:
	text_far _PokemonMansion1FSwitchText
	text_end

.PressedText:
	text_far _PokemonMansion1FSwitchPressedText
	text_end

.NotPressedText:
	text_far _PokemonMansion1FSwitchNotPressedText
	text_end
