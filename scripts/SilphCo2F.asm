SilphCo2F_Script:
	call SilphCo2Script_59d07
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo2TrainerHeaders
	ld de, SilphCo2F_ScriptPointers
	ld a, [wSilphCo2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo2FCurScript], a
	ret

SilphCo2Script_59d07:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo2GateCoords
	call SilphCo2Script_59d43
	call SilphCo2Script_59d6f
	CheckEvent EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	jr nz, .asm_59d2e
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef ReplaceTileBlock
	pop af
.asm_59d2e
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_2_UNLOCKED_DOOR2, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 5, 2
	predef_jump ReplaceTileBlock

SilphCo2GateCoords:
	dbmapcoord  2,  2
	dbmapcoord  2,  5
	db -1 ; end

SilphCo2Script_59d43:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.asm_59d4f
	ld a, [hli]
	cp $ff
	jr z, .asm_59d6b
	push hl
	ld hl, hUnlockedSilphCoDoors
	inc [hl]
	pop hl
	cp b
	jr z, .asm_59d60
	inc hl
	jr .asm_59d4f
.asm_59d60
	ld a, [hli]
	cp c
	jr nz, .asm_59d4f
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_59d6b
	xor a
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo2Script_59d6f:
	EventFlagAddress hl, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .next
	SetEventReuseHL EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret
.next
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_2_UNLOCKED_DOOR2, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret

SilphCo2F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo2F_TextPointers:
	dw SilphCo2Text1
	dw SilphCo2Text2
	dw SilphCo2Text3
	dw SilphCo2Text4
	dw SilphCo2Text5

SilphCo2TrainerHeaders:
	def_trainers 2
SilphCo2TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_0, 3, SilphCo2BattleText1, SilphCo2EndBattleText1, SilphCo2AfterBattleText1
SilphCo2TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_1, 4, SilphCo2BattleText2, SilphCo2EndBattleText2, SilphCo2AfterBattleText2
SilphCo2TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_2, 3, SilphCo2BattleText3, SilphCo2EndBattleText3, SilphCo2AfterBattleText3
SilphCo2TrainerHeader3:
	trainer EVENT_BEAT_SILPH_CO_2F_TRAINER_3, 3, SilphCo2BattleText4, SilphCo2EndBattleText4, SilphCo2AfterBattleText4
	db -1 ; end

SilphCo2Text1:
	text_asm
	CheckEvent EVENT_GOT_TM36
	jr nz, .asm_59de4
	ld hl, SilphCo2Text_59ded
	call PrintText
	lb bc, TM_SELFDESTRUCT, 1
	call GiveItem
	ld hl, TM36NoRoomText
	jr nc, .asm_59de7
	SetEvent EVENT_GOT_TM36
	ld hl, ReceivedTM36Text
	jr .asm_59de7
.asm_59de4
	ld hl, TM36ExplanationText
.asm_59de7
	call PrintText
	jp TextScriptEnd

SilphCo2Text_59ded:
	text_far _SilphCo2Text_59ded
	text_end

ReceivedTM36Text:
	text_far _ReceivedTM36Text
	sound_get_item_1
	text_end

TM36ExplanationText:
	text_far _TM36ExplanationText
	text_end

TM36NoRoomText:
	text_far _TM36NoRoomText
	text_end

SilphCo2Text2:
	text_asm
	ld hl, SilphCo2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text3:
	text_asm
	ld hl, SilphCo2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text4:
	text_asm
	ld hl, SilphCo2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text5:
	text_asm
	ld hl, SilphCo2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2BattleText1:
	text_far _SilphCo2BattleText1
	text_end

SilphCo2EndBattleText1:
	text_far _SilphCo2EndBattleText1
	text_end

SilphCo2AfterBattleText1:
	text_far _SilphCo2AfterBattleText1
	text_end

SilphCo2BattleText2:
	text_far _SilphCo2BattleText2
	text_end

SilphCo2EndBattleText2:
	text_far _SilphCo2EndBattleText2
	text_end

SilphCo2AfterBattleText2:
	text_far _SilphCo2AfterBattleText2
	text_end

SilphCo2BattleText3:
	text_far _SilphCo2BattleText3
	text_end

SilphCo2EndBattleText3:
	text_far _SilphCo2EndBattleText3
	text_end

SilphCo2AfterBattleText3:
	text_far _SilphCo2AfterBattleText3
	text_end

SilphCo2BattleText4:
	text_far _SilphCo2BattleText4
	text_end

SilphCo2EndBattleText4:
	text_far _SilphCo2EndBattleText4
	text_end

SilphCo2AfterBattleText4:
	text_far _SilphCo2AfterBattleText4
	text_end
