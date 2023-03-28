; PureRGBnote: ADDED: new trainers were added to this location
; PureRGBnote: ADDED: code that unlocks a stairway to the Secret Lab after certain conditions are fulfilled was added

PokemonMansionB1F_Script:
	call Mansion4Script_523cf
	call EnableAutoTextBoxDrawing
	ld hl, Mansion4TrainerHeaders
	ld de, PokemonMansionB1F_ScriptPointers
	ld a, [wPokemonMansionB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansionB1FCurScript], a
	ret

Mansion4Script_523cf:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_UNLOCKED_SECRET_LAB
	call nz, UnlockLab
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .asm_523ff
	ld a, $e
	ld bc, $80d
	call Mansion2Script_5202f
	ld a, $e
	ld bc, $b06
	call Mansion2Script_5202f
	ld a, $5f
	ld bc, $304
	call Mansion2Script_5202f
	ld a, $54
	ld bc, $808
	call Mansion2Script_5202f
	ret
.asm_523ff
	ld a, $2d
	ld bc, $80d
	call Mansion2Script_5202f
	ld a, $5f
	ld bc, $b06
	call Mansion2Script_5202f
	ld a, $e
	ld bc, $304
	call Mansion2Script_5202f
	ld a, $e
	ld bc, $808
	call Mansion2Script_5202f
	ret

UnlockLab::
	ld a, $78
	lb bc, 6, 2
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

CheckUnlockLab::
	CheckEvent EVENT_UNLOCKED_SECRET_LAB
	ret nz
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld b, TOPSECRETKEY
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	ret z
	; remove TOPSECRETKEY from inventory
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	ld a, 12
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	ld a, SFX_59
	call PlaySoundWaitForCurrent
	ld c, 30
	rst _DelayFrames
	ld a, SFX_GO_INSIDE
	call PlaySoundWaitForCurrent
	SetEvent EVENT_UNLOCKED_SECRET_LAB
	jp UnlockLab

Mansion4Text8:
	text_far _MansionB1FKeyHoleText
	text_end

Mansion4Script_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, 11
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

PokemonMansionB1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonMansionB1F_TextPointers:
	dw Mansion4Text1
	dw Mansion4Text2
	dw Mansion4Text3
	dw Mansion4Text4
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw Mansion4Text7
	dw PickUpItemText
	dw Mansion3Text6
	dw Mansion4Text8

Mansion4TrainerHeaders:
	def_trainers
Mansion4TrainerHeader0:
	trainer EVENT_BEAT_MANSION_4_TRAINER_0, 0, Mansion4BattleText1, Mansion4EndBattleText1, Mansion4AfterBattleText1
Mansion4TrainerHeader1:
	trainer EVENT_BEAT_MANSION_4_TRAINER_1, 3, Mansion4BattleText2, Mansion4EndBattleText2, Mansion4AfterBattleText2
Mansion4TrainerHeader2:
	trainer EVENT_BEAT_MANSION_4_TRAINER_2, 0, Mansion4BattleText3, Mansion4EndBattleText3, Mansion4AfterBattleText3
Mansion4TrainerHeader3:
	trainer EVENT_BEAT_MANSION_4_TRAINER_3, 0, Mansion4BattleText4, Mansion4EndBattleText4, Mansion4AfterBattleText4
	db -1 ; end

Mansion4Text1:
	text_asm
	ld hl, Mansion4TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

Mansion4Text2:
	text_asm
	ld hl, Mansion4TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

Mansion4Text3:
	text_asm
	ld hl, Mansion4TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

Mansion4Text4:
	text_asm
	ld hl, Mansion4TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

Mansion4BattleText1:
	text_far _Mansion4BattleText1
	text_end

Mansion4EndBattleText1:
	text_far _Mansion4EndBattleText1
	text_end

Mansion4AfterBattleText1:
	text_far _Mansion4AfterBattleText1
	text_end

Mansion4BattleText2:
	text_far _Mansion4BattleText2
	text_end

Mansion4EndBattleText2:
	text_far _Mansion4EndBattleText2
	text_end

Mansion4AfterBattleText2:
	text_far _Mansion4AfterBattleText2
	text_end

Mansion4BattleText3:
	text_far _Mansion4BattleText3
	text_end

Mansion4EndBattleText3:
	text_far _Mansion4EndBattleText3
	text_end

Mansion4AfterBattleText3:
	text_far _Mansion4AfterBattleText3
	text_end

Mansion4BattleText4:
	text_far _Mansion4BattleText4
	text_end

Mansion4EndBattleText4:
	text_far _Mansion4EndBattleText4
	text_end

Mansion4AfterBattleText4:
	text_far _Mansion4AfterBattleText4
	text_end	

Mansion4Text7:
	text_far _Mansion4Text7
	text_end
