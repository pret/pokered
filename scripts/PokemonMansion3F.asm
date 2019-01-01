PokemonMansion3F_Script:
	call Mansion3Script_52204
	call EnableAutoTextBoxDrawing
	ld hl, Mansion3TrainerHeader0
	ld de, PokemonMansion3F_ScriptPointers
	ld a, [wPokemonMansion3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansion3FCurScript], a
	ret

Mansion3Script_52204:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .asm_52224
	ld a, $e
	ld bc, $207
	call Mansion2Script_5202f
	ld a, $5f
	ld bc, $507
	call Mansion2Script_5202f
	ret
.asm_52224
	ld a, $5f
	ld bc, $207
	call Mansion2Script_5202f
	ld a, $e
	ld bc, $507
	call Mansion2Script_5202f
	ret

PokemonMansion3F_ScriptPointers:
	dw Mansion3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion3Script0:
	ld hl, CoordsData_52254
	call Mansion3Script_5225b
	ld a, [wWhichDungeonWarp]
	and a
	jp z, CheckFightingMapTrainers
	cp $3
	ld a, $a5
	jr nz, .asm_52250
	ld a, $d6
.asm_52250
	ld [wDungeonWarpDestinationMap], a
	ret

CoordsData_52254:
	db $0E,$10
	db $0E,$11
	db $0E,$13
	db $FF

Mansion3Script_5225b:
	xor a
	ld [wWhichDungeonWarp], a
	ld a, [wd72d]
	bit 4, a
	ret nz
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	ld [wWhichDungeonWarp], a
	ld hl, wd72d
	set 4, [hl]
	ld hl, wd732
	set 4, [hl]
	ret

Mansion3Script_Switches:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $6
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

PokemonMansion3F_TextPointers:
	dw Mansion3Text1
	dw Mansion3Text2
	dw PickUpItemText
	dw PickUpItemText
	dw Mansion3Text5
	dw Mansion3Text6

Mansion3TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_MANSION_3_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_3_TRAINER_0
	dw Mansion3BattleText1 ; TextBeforeBattle
	dw Mansion3AfterBattleText1 ; TextAfterBattle
	dw Mansion3EndBattleText1 ; TextEndBattle
	dw Mansion3EndBattleText1 ; TextEndBattle

Mansion3TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_MANSION_3_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_3_TRAINER_1
	dw Mansion3BattleText2 ; TextBeforeBattle
	dw Mansion3AfterBattleText2 ; TextAfterBattle
	dw Mansion3EndBattleText2 ; TextEndBattle
	dw Mansion3EndBattleText2 ; TextEndBattle

	db $ff

Mansion3Text1:
	TX_ASM
	ld hl, Mansion3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion3Text2:
	TX_ASM
	ld hl, Mansion3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Mansion3BattleText1:
	TX_FAR _Mansion3BattleText1
	db "@"

Mansion3EndBattleText1:
	TX_FAR _Mansion3EndBattleText1
	db "@"

Mansion3AfterBattleText1:
	TX_FAR _Mansion3AfterBattleText1
	db "@"

Mansion3BattleText2:
	TX_FAR _Mansion3BattleText2
	db "@"

Mansion3EndBattleText2:
	TX_FAR _Mansion3EndBattleText2
	db "@"

Mansion3AfterBattleText2:
	TX_FAR _Mansion3AfterBattleText2
	db "@"

Mansion3Text5:
	TX_FAR _Mansion3Text5
	db "@"
