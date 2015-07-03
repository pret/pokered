SilphCo6Script: ; 1a1a9 (6:61a9)
	call SilphCo6Script_1a1bf
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo6TrainerHeaders
	ld de, SilphCo6ScriptPointers
	ld a, [W_SILPHCO6CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO6CURSCRIPT], a
	ret

SilphCo6Script_1a1bf: ; 1a1bf (6:61bf)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo6Coords1
	call SilphCo4Script_19d5d
	call SilphCo6Script_1a1e6
	ld a, [wd82e]
	bit 7, a
	ret nz
	ld a, $5f
	ld [wd09f], a
	ld bc, $0602
	predef_jump ReplaceTileBlock

SilphCo6Coords1: ; 1a1e3 (6:61e3)
	db $06, $02
	db $ff

SilphCo6Script_1a1e6: ; 1a1e6 (6:61e6)
	ld a, [$ffe0]
	and a
	ret z
	ld hl, wd82e
	set 7, [hl]
	ret

SilphCo6ScriptPointers: ; 1a1f0 (6:61f0)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo6TextPointers: ; 1a1f6 (6:61f6)
	dw SilphCo6Text1
	dw SilphCo6Text2
	dw SilphCo6Text3
	dw SilphCo6Text4
	dw SilphCo6Text5
	dw SilphCo6Text6
	dw SilphCo6Text7
	dw SilphCo6Text8
	dw Predef5CText
	dw Predef5CText

SilphCo6TrainerHeaders: ; 1a20a (6:620a)
SilphCo6TrainerHeader0: ; 1a20a (6:620a)
	db $6 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd82d ; flag's byte
	dw SilphCo6BattleText2 ; TextBeforeBattle
	dw SilphCo6AfterBattleText2 ; TextAfterBattle
	dw SilphCo6EndBattleText2 ; TextEndBattle
	dw SilphCo6EndBattleText2 ; TextEndBattle

SilphCo6TrainerHeader2: ; 1a216 (6:6216)
	db $7 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd82d ; flag's byte
	dw SilphCo6BattleText3 ; TextBeforeBattle
	dw SilphCo6AfterBattleText3 ; TextAfterBattle
	dw SilphCo6EndBattleText3 ; TextEndBattle
	dw SilphCo6EndBattleText3 ; TextEndBattle

SilphCo6TrainerHeader3: ; 1a222 (6:6222)
	db $8 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd82d ; flag's byte
	dw SilphCo6BattleText4 ; TextBeforeBattle
	dw SilphCo6AfterBattleText4 ; TextAfterBattle
	dw SilphCo6EndBattleText4 ; TextEndBattle
	dw SilphCo6EndBattleText4 ; TextEndBattle

	db $ff

SilphCo6Script_1a22f: ; 1a22f (6:622f)
	ld a, [wd838]
	bit 7, a
	jr nz, .asm_1a238
	jr .asm_1a23a
.asm_1a238
	ld h, d
	ld l, e
.asm_1a23a
	jp PrintText

SilphCo6Text1: ; 1a23d (6:623d)
	TX_ASM
	ld hl, SilphCo6Text_1a24a
	ld de, SilphCo6Text_1a24f
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a24a: ; 1a24a (6:624a)
	TX_FAR _SilphCo6Text_1a24a
	db "@"

SilphCo6Text_1a24f: ; 1a24f (6:624f)
	TX_FAR _SilphCo6Text_1a24f
	db "@"

SilphCo6Text2: ; 1a254 (6:6254)
	TX_ASM
	ld hl, SilphCo6Text_1a261
	ld de, SilphCo6Text_1a266
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a261: ; 1a261 (6:6261)
	TX_FAR _SilphCo6Text_1a261
	db "@"

SilphCo6Text_1a266: ; 1a266 (6:6266)
	TX_FAR _SilphCo6Text_1a266
	db "@"

SilphCo6Text3: ; 1a26b (6:626b)
	TX_ASM
	ld hl, SilphCo6Text_1a278
	ld de, SilphCo6Text_1a27d
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a278: ; 1a278 (6:6278)
	TX_FAR _SilphCo6Text_1a278
	db "@"

SilphCo6Text_1a27d: ; 1a27d (6:627d)
	TX_FAR _SilphCo6Text_1a27d
	db "@"

SilphCo6Text4: ; 1a282 (6:6282)
	TX_ASM
	ld hl, SilphCo6Text_1a28f
	ld de, SilphCo6Text_1a294
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a28f: ; 1a28f (6:628f)
	TX_FAR _SilphCo6Text_1a28f
	db "@"

SilphCo6Text_1a294: ; 1a294 (6:6294)
	TX_FAR _SilphCo6Text_1a294
	db "@"

SilphCo6Text5: ; 1a299 (6:6299)
	TX_ASM
	ld hl, SilphCo6Text_1a2a6
	ld de, SilphCo6Text_1a2ab
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a2a6: ; 1a2a6 (6:62a6)
	TX_FAR _SilphCo6Text_1a2a6
	db "@"

SilphCo6Text_1a2ab: ; 1a2ab (6:62ab)
	TX_FAR _SilphCo6Text_1a2ab
	db "@"

SilphCo6Text6: ; 1a2b0 (6:62b0)
	TX_ASM
	ld hl, SilphCo6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText2: ; 1a2ba (6:62ba)
	TX_FAR _SilphCo6BattleText2
	db "@"

SilphCo6EndBattleText2: ; 1a2bf (6:62bf)
	TX_FAR _SilphCo6EndBattleText2
	db "@"

SilphCo6AfterBattleText2: ; 1a2c4 (6:62c4)
	TX_FAR _SilphCo6AfterBattleText2
	db "@"

SilphCo6Text7: ; 1a2c9 (6:62c9)
	TX_ASM
	ld hl, SilphCo6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText3: ; 1a2d3 (6:62d3)
	TX_FAR _SilphCo6BattleText3
	db "@"

SilphCo6EndBattleText3: ; 1a2d8 (6:62d8)
	TX_FAR _SilphCo6EndBattleText3
	db "@"

SilphCo6AfterBattleText3: ; 1a2dd (6:62dd)
	TX_FAR _SilphCo6AfterBattleText3
	db "@"

SilphCo6Text8: ; 1a2e2 (6:62e2)
	TX_ASM
	ld hl, SilphCo6TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText4: ; 1a2ec (6:62ec)
	TX_FAR _SilphCo6BattleText4
	db "@"

SilphCo6EndBattleText4: ; 1a2f1 (6:62f1)
	TX_FAR _SilphCo6EndBattleText4
	db "@"

SilphCo6AfterBattleText4: ; 1a2f6 (6:62f6)
	TX_FAR _SilphCo6AfterBattleText4
	db "@"
