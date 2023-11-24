; PureRGBnote: ADDED: new trainers were added to this location

PokemonMansion2F_Script:
	call Mansion2CheckReplaceSwitchDoorBlocks
	call EnableAutoTextBoxDrawing
	ld hl, Mansion2TrainerHeaders
	ld de, PokemonMansion2F_ScriptPointers
	ld a, [wPokemonMansion2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansion2FCurScript], a
	ret

Mansion2CheckReplaceSwitchDoorBlocks:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .switchTurnedOn
	ld a, $e
	lb bc, 2, 4
	call Mansion2ReplaceBlock
	ld a, $54
	lb bc, 4, 9
	call Mansion2ReplaceBlock
	ld a, $5f
	lb bc, 11, 3
	jp Mansion2ReplaceBlock
.switchTurnedOn
	ld a, $5f
	lb bc, 2, 4
	call Mansion2ReplaceBlock
	ld a, $e
	lb bc, 4, 9
	call Mansion2ReplaceBlock
	ld a, $e
	lb bc, 11, 3
	; fall through
Mansion2ReplaceBlock:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

Mansion2Script_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONMANSION2F_SWITCH
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

PokemonMansion2F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONMANSION2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONMANSION2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONMANSION2F_END_BATTLE

PokemonMansion2F_TextPointers:
	def_text_pointers
	dw_const PokemonMansion2FSuperNerdText, TEXT_POKEMONMANSION2F_SUPER_NERD
	dw_const Mansion2Trainer2,              TEXT_POKEMONMANSION2F_COOLTRAINER_M
	dw_const Mansion2Trainer3,              TEXT_POKEMONMANSION2F_COOLTRAINER_F1
	dw_const Mansion2Trainer4,              TEXT_POKEMONMANSION2F_SCIENTIST
	dw_const Mansion2Trainer5,              TEXT_POKEMONMANSION2F_COOLTRAINER_F2
	dw_const PickUpItemText,                TEXT_POKEMONMANSION2F_ITEM1
	dw_const PokemonMansion2FDiary1Text,    TEXT_POKEMONMANSION2F_DIARY1
	dw_const PokemonMansion2FDiary2Text,    TEXT_POKEMONMANSION2F_DIARY2
	dw_const PokemonMansion2FSwitchText,    TEXT_POKEMONMANSION2F_SWITCH

Mansion2TrainerHeaders:
	def_trainers
Mansion2TrainerHeader0:
	trainer EVENT_BEAT_MANSION_2_TRAINER_0, 0, PokemonMansion2FSuperNerdBattleText, PokemonMansion2FSuperNerdEndBattleText, PokemonMansion2FSuperNerdAfterBattleText
Mansion2TrainerHeader1:
	trainer EVENT_BEAT_MANSION_2_TRAINER_1, 0, Mansion2BattleText2, Mansion2EndBattleText2, Mansion2AfterBattleText2
Mansion2TrainerHeader2:
	trainer EVENT_BEAT_MANSION_2_TRAINER_2, 0, Mansion2BattleText3, Mansion2EndBattleText3, Mansion2AfterBattleText3
Mansion2TrainerHeader3:
	trainer EVENT_BEAT_MANSION_2_TRAINER_3, 3, Mansion2BattleText4, Mansion2EndBattleText4, Mansion2AfterBattleText4
Mansion2TrainerHeader4:
	trainer EVENT_BEAT_MANSION_2_TRAINER_4, 0, Mansion2BattleText5, Mansion2EndBattleText5, Mansion2AfterBattleText5
	db -1 ; end

PokemonMansion2FSuperNerdText:
	text_asm
	ld hl, Mansion2TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

PokemonMansion2FSuperNerdBattleText:
	text_far _PokemonMansion2FSuperNerdBattleText
	text_end

PokemonMansion2FSuperNerdEndBattleText:
	text_far _PokemonMansion2FSuperNerdEndBattleText
	text_end

PokemonMansion2FSuperNerdAfterBattleText:
	text_far _PokemonMansion2FSuperNerdAfterBattleText
	text_end

Mansion2Trainer2:
	text_asm
	ld hl, Mansion2TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

Mansion2BattleText2:
	text_far _Mansion2BattleText2
	text_end

Mansion2EndBattleText2:
	text_far _Mansion2EndBattleText2
	text_end

Mansion2AfterBattleText2:
	text_far _Mansion2AfterBattleText2
	text_end

Mansion2Trainer3:
	text_asm
	ld hl, Mansion2TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

Mansion2BattleText3:
	text_far _Mansion2BattleText3
	text_end

Mansion2EndBattleText3:
	text_far _Mansion2EndBattleText3
	text_end

Mansion2AfterBattleText3:
	text_far _Mansion2AfterBattleText3
	text_end

Mansion2Trainer4:
	text_asm
	ld hl, Mansion2TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

Mansion2BattleText4:
	text_far _Mansion2BattleText4
	text_end

Mansion2EndBattleText4:
	text_far _Mansion2EndBattleText4
	text_end

Mansion2AfterBattleText4:
	text_far _Mansion2AfterBattleText4
	text_end

Mansion2Trainer5:
	text_asm
	ld hl, Mansion2TrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

Mansion2BattleText5:
	text_far _Mansion2BattleText5
	text_end

Mansion2EndBattleText5:
	text_far _Mansion2EndBattleText5
	text_end

Mansion2AfterBattleText5:
	text_far _Mansion2AfterBattleText5
	text_end

PokemonMansion2FDiary1Text:
	text_far _PokemonMansion2FDiary1Text
	text_end

PokemonMansion2FDiary2Text:
	text_far _PokemonMansion2FDiary2Text
	text_end

PokemonMansion2FSwitchText:
	text_asm
	ld hl, .Text
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .not_pressed
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld hl, .PressedText
	rst _PrintText
	ld a, SFX_GO_INSIDE
	rst _PlaySound
	CheckAndSetEvent EVENT_MANSION_SWITCH_ON
	jr z, .done
	ResetEventReuseHL EVENT_MANSION_SWITCH_ON
	jr .done
.not_pressed
	ld hl, .NotPressed
	rst _PrintText
.done
	rst TextScriptEnd

.Text:
	text_far _PokemonMansion2FSwitchText
	text_end

.PressedText:
	text_far _PokemonMansion2FSwitchPressedText
	text_end

.NotPressed:
	text_far _PokemonMansion2FSwitchNotPressedText
	text_end
