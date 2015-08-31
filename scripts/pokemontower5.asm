PokemonTower5Script: ; 60932 (18:4932)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower5TrainerHeaders
	ld de, PokemonTower5ScriptPointers
	ld a, [wPokemonTower5CurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower5CurScript], a
	ret

PokemonTower5ScriptPointers: ; 60945 (18:4945)
	dw PokemonTower5Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower5Script0: ; 6094b (18:494b)
	ld hl, CoordsData_60992
	call ArePlayerCoordsInArray
	jr c, .asm_60960
	ld hl, wd72e
	res 4, [hl]
	ResetEvent EVENT_IN_PURIFIED_ZONE
	jp CheckFightingMapTrainers
.asm_60960
	CheckAndSetEvent EVENT_IN_PURIFIED_ZONE
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd72e
	set 4, [hl]
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call Delay3
	call GBFadeInFromWhite
	ld a, $7
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ret

CoordsData_60992: ; 60992 (18:4992)
	db $08,$0A
	db $08,$0B
	db $09,$0A
	db $09,$0B
	db $FF

PokemonTower5TextPointers: ; 6099b (18:499b)
	dw PokemonTower5Text1
	dw PokemonTower5Text2
	dw PokemonTower5Text3
	dw PokemonTower5Text4
	dw PokemonTower5Text5
	dw PickUpItemText
	dw PokemonTower5Text7

PokemonTower5TrainerHeaders: ; 609a9 (18:49a9)
PokemonTower5TrainerHeader0: ; 609a9 (18:49a9)
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_0
	dw PokemonTower5BattleText1 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText1 ; TextAfterBattle
	dw PokemonTower5EndBattleText1 ; TextEndBattle
	dw PokemonTower5EndBattleText1 ; TextEndBattle

PokemonTower5TrainerHeader1: ; 609b5 (18:49b5)
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_1
	dw PokemonTower5BattleText2 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText2 ; TextAfterBattle
	dw PokemonTower5EndBattleText2 ; TextEndBattle
	dw PokemonTower5EndBattleText2 ; TextEndBattle

PokemonTower5TrainerHeader2: ; 609c1 (18:49c1)
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_2
	dw PokemonTower5BattleText3 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText3 ; TextAfterBattle
	dw PokemonTower5EndBattleText3 ; TextEndBattle
	dw PokemonTower5EndBattleText3 ; TextEndBattle

PokemonTower5TrainerHeader3: ; 609cd (18:49cd)
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_3
	dw PokemonTower5BattleText4 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText4 ; TextAfterBattle
	dw PokemonTower5EndBattleText4 ; TextEndBattle
	dw PokemonTower5EndBattleText4 ; TextEndBattle

	db $ff

PokemonTower5Text1: ; 609da (18:49da)
	TX_FAR _PokemonTower5Text1
	db "@"

PokemonTower5Text2: ; 609df (18:49df)
	TX_ASM
	ld hl, PokemonTower5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText1: ; 609e9 (18:49e9)
	TX_FAR _PokemonTower5BattleText1
	db "@"

PokemonTower5EndBattleText1: ; 609ee (18:49ee)
	TX_FAR _PokemonTower5EndBattleText1
	db "@"

PokemonTower5AfterBattleText1: ; 609f3 (18:49f3)
	TX_FAR _PokemonTower5AfterBattleText1
	db "@"

PokemonTower5Text3: ; 609f8 (18:49f8)
	TX_ASM
	ld hl, PokemonTower5TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText2: ; 60a02 (18:4a02)
	TX_FAR _PokemonTower5BattleText2
	db "@"

PokemonTower5EndBattleText2: ; 60a07 (18:4a07)
	TX_FAR _PokemonTower5EndBattleText2
	db "@"

PokemonTower5AfterBattleText2: ; 60a0c (18:4a0c)
	TX_FAR _PokemonTower5AfterBattleText2
	db "@"

PokemonTower5Text4: ; 60a11 (18:4a11)
	TX_ASM
	ld hl, PokemonTower5TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText3: ; 60a1b (18:4a1b)
	TX_FAR _PokemonTower5BattleText3
	db "@"

PokemonTower5EndBattleText3: ; 60a20 (18:4a20)
	TX_FAR _PokemonTower5EndBattleText3
	db "@"

PokemonTower5AfterBattleText3: ; 60a25 (18:4a25)
	TX_FAR _PokemonTower5AfterBattleText3
	db "@"

PokemonTower5Text5: ; 60a2a (18:4a2a)
	TX_ASM
	ld hl, PokemonTower5TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText4: ; 60a34 (18:4a34)
	TX_FAR _PokemonTower5BattleText4
	db "@"

PokemonTower5EndBattleText4: ; 60a39 (18:4a39)
	TX_FAR _PokemonTower5EndBattleText4
	db "@"

PokemonTower5AfterBattleText4: ; 60a3e (18:4a3e)
	TX_FAR _PokemonTower5AfterBattleText4
	db "@"

PokemonTower5Text7: ; 60a43 (18:4a43)
	TX_FAR _PokemonTower5Text7
	db "@"
