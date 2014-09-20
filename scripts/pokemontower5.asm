PokemonTower5Script: ; 60932 (18:4932)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower5TrainerHeaders
	ld de, PokemonTower5ScriptPointers
	ld a, [W_POKEMONTOWER5CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_POKEMONTOWER5CURSCRIPT], a
	ret

PokemonTower5ScriptPointers: ; 60945 (18:4945)
	dw PokemonTower5Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower5Script0: ; 6094b (18:494b)
	ld hl, CoordsData_60992 ; $4992
	call ArePlayerCoordsInArray
	jr c, .asm_60960
	ld hl, wd72e
	res 4, [hl]
	ld hl, wd767
	res 7, [hl]
	jp CheckFightingMapTrainers
.asm_60960
	ld hl, wd767
	bit 7, [hl]
	set 7, [hl]
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
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
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
	dw Predef5CText
	dw PokemonTower5Text7

PokemonTower5TrainerHeaders: ; 609a9 (18:49a9)
PokemonTower5TrainerHeader0: ; 609a9 (18:49a9)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd767 ; flag's byte
	dw PokemonTower5BattleText1 ; 0x49e9 TextBeforeBattle
	dw PokemonTower5AfterBattleText1 ; 0x49f3 TextAfterBattle
	dw PokemonTower5EndBattleText1 ; 0x49ee TextEndBattle
	dw PokemonTower5EndBattleText1 ; 0x49ee TextEndBattle

PokemonTower5TrainerHeader1: ; 609b5 (18:49b5)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd767 ; flag's byte
	dw PokemonTower5BattleText2 ; 0x4a02 TextBeforeBattle
	dw PokemonTower5AfterBattleText2 ; 0x4a0c TextAfterBattle
	dw PokemonTower5EndBattleText2 ; 0x4a07 TextEndBattle
	dw PokemonTower5EndBattleText2 ; 0x4a07 TextEndBattle

PokemonTower5TrainerHeader2: ; 609c1 (18:49c1)
	db $4 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd767 ; flag's byte
	dw PokemonTower5BattleText3 ; 0x4a1b TextBeforeBattle
	dw PokemonTower5AfterBattleText3 ; 0x4a25 TextAfterBattle
	dw PokemonTower5EndBattleText3 ; 0x4a20 TextEndBattle
	dw PokemonTower5EndBattleText3 ; 0x4a20 TextEndBattle

PokemonTower5TrainerHeader3: ; 609cd (18:49cd)
	db $5 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd767 ; flag's byte
	dw PokemonTower5BattleText4 ; 0x4a34 TextBeforeBattle
	dw PokemonTower5AfterBattleText4 ; 0x4a3e TextAfterBattle
	dw PokemonTower5EndBattleText4 ; 0x4a39 TextEndBattle
	dw PokemonTower5EndBattleText4 ; 0x4a39 TextEndBattle

	db $ff

PokemonTower5Text1: ; 609da (18:49da)
	TX_FAR _PokemonTower5Text1
	db "@"

PokemonTower5Text2: ; 609df (18:49df)
	db $08 ; asm
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
	db $08 ; asm
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
	db $08 ; asm
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
	db $08 ; asm
	ld hl, PokemonTower5TrainerHeader3 ; $49cd
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
