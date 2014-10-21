RocketHideout4Script: ; 4545d (11:545d)
	call RocketHideout4Script_45473
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout4TrainerHeader0
	ld de, RocketHideout4ScriptPointers
	ld a, [W_ROCKETHIDEOUT4CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROCKETHIDEOUT4CURSCRIPT], a
	ret

RocketHideout4Script_45473: ; 45473 (11:5473)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [wd81b]
	bit 5, a
	jr nz, .asm_45496
	and $c
	cp $c
	jr z, .asm_4548c
	ld a, $2d
	jr .asm_45498
.asm_4548c
	ld a, (SFX_02_57 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wd81b
	set 5, [hl]
.asm_45496
	ld a, $e
.asm_45498
	ld [wd09f], a
	ld bc, $050c
	predef_jump ReplaceTileBlock

RocketHideout4Script_454a3: ; 454a3 (11:54a3)
	xor a
	ld [wJoyIgnore], a
	ld [W_ROCKETHIDEOUT4CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

RocketHideout4ScriptPointers: ; 454ae (11:54ae)c
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RocketHideout4Script3

RocketHideout4Script3: ; 454b6 (11:54b6)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, RocketHideout4Script_454a3
	call UpdateSprites
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd81b
	set 7, [hl]
	ld a, $a
	ld [H_SPRITEHEIGHT], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, HS_ROCKET_HIDEOUT_4_GIOVANNI
	ld [wcc4d], a
	predef HideObject
	ld a, HS_ROCKET_HIDEOUT_4_ITEM_4
	ld [wcc4d], a
	predef ShowObject
	call UpdateSprites
	call GBFadeInFromBlack
	xor a
	ld [wJoyIgnore], a
	ld hl, wd126
	set 5, [hl]
	ld a, $0
	ld [W_ROCKETHIDEOUT4CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

RocketHideout4TextPointers: ; 45501 (11:5501)
	dw RocketHideout4Text1
	dw RocketHideout4Text2
	dw RocketHideout4Text3
	dw RocketHideout4Text4
	dw Predef5CText
	dw Predef5CText
	dw Predef5CText
	dw Predef5CText
	dw Predef5CText
	dw RocketHideout4Text10

RocketHideout4TrainerHeaders: ; 45515 (11:5515)
RocketHideout4TrainerHeader0: ; 45515 (11:5515)
	db $2 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw wd81b ; flag's byte
	dw RocketHideout4BattleText2 ; 0x5593 TextBeforeBattle
	dw RocketHideout4AfterBattleText2 ; 0x559d TextAfterBattle
	dw RocketHideout4EndBattleText2 ; 0x5598 TextEndBattle
	dw RocketHideout4EndBattleText2 ; 0x5598 TextEndBattle

RocketHideout4TrainerHeader2: ; 45521 (11:5521)
	db $3 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw wd81b ; flag's byte
	dw RocketHideout4BattleText3 ; 0x55ac TextBeforeBattle
	dw RocketHideout4AfterBattleText3 ; 0x55b6 TextAfterBattle
	dw RocketHideout4EndBattleText3 ; 0x55b1 TextEndBattle
	dw RocketHideout4EndBattleText3 ; 0x55b1 TextEndBattle

RocketHideout4TrainerHeader3: ; 4552d (11:552d)
	db $4 ; flag's bit
	db ($1 << 4) ; trainer's view range
	dw wd81b ; flag's byte
	dw RocketHideout4BattleText4 ; 0x55c5 TextBeforeBattle
	dw RocketHideout4AfterBattleText4 ; 0x55cf TextAfterBattle
	dw RocketHideout4EndBattleText4 ; 0x55ca TextEndBattle
	dw RocketHideout4EndBattleText4 ; 0x55ca TextEndBattle

	db $ff

RocketHideout4Text1: ; 4553a (11:553a)
	db $08 ; asm
	ld a, [wd81b]
	bit 7, a
	jp nz, .asm_545571
	ld hl, RocketHideout4Text_4557a
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, RocketHideout4Text_4557f
	ld de, RocketHideout4Text_4557f
	call SaveEndBattleTextPointers
	ldh a, [$8c]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [$b4], a
	ld a, $3
	ld [W_ROCKETHIDEOUT4CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	jr .asm_209f0 ; 0x4556f
.asm_545571
	ld hl, RocketHideout4Text10
	call PrintText
.asm_209f0 ; 0x45577
	jp TextScriptEnd

RocketHideout4Text_4557a: ; 4557a (11:557a)
	TX_FAR _RocketHideout4Text_4557a
	db "@"

RocketHideout4Text_4557f: ; 4557f (11:557f)
	TX_FAR _RocketHideout4Text_4557f
	db "@"

RocketHideout4Text10: ; 45584 (11:5584)
	TX_FAR _RocketHideout4Text_45584
	db "@"

RocketHideout4Text2: ; 45589 (11:5589)
	db $08 ; asm
	ld hl, RocketHideout4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText2: ; 45593 (11:5593)
	TX_FAR _RocketHideout4BattleText2
	db "@"

RocketHideout4EndBattleText2: ; 45598 (11:5598)
	TX_FAR _RocketHideout4EndBattleText2
	db "@"

RocketHideout4AfterBattleText2: ; 4559d (11:559d)
	TX_FAR _RocketHide4AfterBattleText2
	db "@"

RocketHideout4Text3: ; 455a2 (11:55a2)
	db $08 ; asm
	ld hl, RocketHideout4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText3: ; 455ac (11:55ac)
	TX_FAR _RocketHideout4BattleText3
	db "@"

RocketHideout4EndBattleText3: ; 455b1 (11:55b1)
	TX_FAR _RocketHideout4EndBattleText3
	db "@"

RocketHideout4AfterBattleText3: ; 455b6 (11:55b6)
	TX_FAR _RocketHide4AfterBattleText3
	db "@"

RocketHideout4Text4: ; 455bb (11:55bb)
	db $08 ; asm
	ld hl, RocketHideout4TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText4: ; 455c5 (11:55c5)
	TX_FAR _RocketHideout4BattleText4
	db "@"

RocketHideout4EndBattleText4: ; 455ca (11:55ca)
	TX_FAR _RocketHideout4EndBattleText4
	db "@"

RocketHideout4AfterBattleText4: ; 455cf (11:55cf)
	db $8
	ld hl, RocketHideout4Text_455ec ; $55ec
	call PrintText
	ld hl, wd81b
	bit 6, [hl]
	set 6, [hl]
	jr nz, .asm_455e9 ; 0x455dd $a
	ld a, HS_ROCKET_HIDEOUT_4_ITEM_5
	ld [wcc4d], a
	predef ShowObject
.asm_455e9
	jp TextScriptEnd

RocketHideout4Text_455ec: ; 455ec (11:55ec)
	TX_FAR _RocketHideout4Text_455ec
	db "@"
