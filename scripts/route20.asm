Route20Script: ; 50ca9 (14:4ca9)
	ld hl, wd7e7
	bit 0, [hl]
	res 0, [hl]
	call nz, Route20Script_50cc6
	call EnableAutoTextBoxDrawing
	ld hl, Route20TrainerHeader0 ; $4d3a
	ld de, Route20ScriptPointers
	ld a, [W_ROUTE20CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE20CURSCRIPT], a
	ret

Route20Script_50cc6: ; 50cc6 (14:4cc6)
	ld a, [wd880]
	and $3
	cp $3
	jr z, .asm_50cef
	ld a, $d7
	call Route20Script_50d0c
	ld a, $d8
	call Route20Script_50d0c
	ld hl, .MissableObjectIDs ; $4ce8
.asm_50cdc
	ld a, [hli]
	cp $ff
	jr z, .asm_50cef
	push hl
	call Route20Script_50d14
	pop hl
	jr .asm_50cdc

.MissableObjectIDs: ; 50ce8 (14:4ce8)
	db HS_SEAFOAM_ISLANDS_2_BOULDER_1
	db HS_SEAFOAM_ISLANDS_2_BOULDER_2
	db HS_SEAFOAM_ISLANDS_3_BOULDER_1
	db HS_SEAFOAM_ISLANDS_3_BOULDER_2
	db HS_SEAFOAM_ISLANDS_4_BOULDER_3
	db HS_SEAFOAM_ISLANDS_4_BOULDER_4
	db $FF

.asm_50cef
	ld a, [wd881]
	and $3
	cp $3
	ret z
	ld a, HS_SEAFOAM_ISLANDS_4_BOULDER_1
	call Route20Script_50d0c
	ld a, HS_SEAFOAM_ISLANDS_4_BOULDER_2
	call Route20Script_50d0c
	ld a, HS_SEAFOAM_ISLANDS_5_BOULDER_1
	call Route20Script_50d14
	ld a, HS_SEAFOAM_ISLANDS_5_BOULDER_2
	call Route20Script_50d14
	ret

Route20Script_50d0c: ; 50d0c (14:4d0c)
	ld [wcc4d], a
	predef_jump ShowObject

Route20Script_50d14: ; 50d14 (14:4d14)
	ld [wcc4d], a
	predef_jump HideObject

Route20ScriptPointers: ; 50d1c (14:4d1c)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route20TextPointers: ; 50d22 (14:4d22)
	dw Route20Text1
	dw Route20Text2
	dw Route20Text3
	dw Route20Text4
	dw Route20Text5
	dw Route20Text6
	dw Route20Text7
	dw Route20Text8
	dw Route20Text9
	dw Route20Text10
	dw Route20Text11
	dw Route20Text12

Route20TrainerHeaders: ; 50d3a (14:4d3a)
Route20TrainerHeader0: ; 50d3a (14:4d3a)
	db $1 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText1 ; 0x4e17 TextBeforeBattle
	dw Route20AfterBattleText1 ; 0x4e21 TextAfterBattle
	dw Route20EndBattleText1 ; 0x4e1c TextEndBattle
	dw Route20EndBattleText1 ; 0x4e1c TextEndBattle

Route20TrainerHeader2: ; 50d46 (14:4d46)
	db $2 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText2 ; 0x4e26 TextBeforeBattle
	dw Route20AfterBattleText2 ; 0x4e30 TextAfterBattle
	dw Route20EndBattleText2 ; 0x4e2b TextEndBattle
	dw Route20EndBattleText2 ; 0x4e2b TextEndBattle

Route20TrainerHeader3: ; 50d52 (14:4d52)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText3 ; 0x4e35 TextBeforeBattle
	dw Route20AfterBattleText3 ; 0x4e3f TextAfterBattle
	dw Route20EndBattleText3 ; 0x4e3a TextEndBattle
	dw Route20EndBattleText3 ; 0x4e3a TextEndBattle

Route20TrainerHeader4: ; 50d5e (14:4d5e)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText4 ; 0x4e44 TextBeforeBattle
	dw Route20AfterBattleText4 ; 0x4e4e TextAfterBattle
	dw Route20EndBattleText4 ; 0x4e49 TextEndBattle
	dw Route20EndBattleText4 ; 0x4e49 TextEndBattle

Route20TrainerHeader5: ; 50d6a (14:4d6a)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText5 ; 0x4e53 TextBeforeBattle
	dw Route20AfterBattleText5 ; 0x4e5d TextAfterBattle
	dw Route20EndBattleText5 ; 0x4e58 TextEndBattle
	dw Route20EndBattleText5 ; 0x4e58 TextEndBattle

Route20TrainerHeader6: ; 50d76 (14:4d76)
	db $6 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText6 ; 0x4e62 TextBeforeBattle
	dw Route20AfterBattleText6 ; 0x4e6c TextAfterBattle
	dw Route20EndBattleText6 ; 0x4e67 TextEndBattle
	dw Route20EndBattleText6 ; 0x4e67 TextEndBattle

Route20TrainerHeader7: ; 50d82 (14:4d82)
	db $7 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText7 ; 0x4e71 TextBeforeBattle
	dw Route20AfterBattleText7 ; 0x4e7b TextAfterBattle
	dw Route20EndBattleText7 ; 0x4e76 TextEndBattle
	dw Route20EndBattleText7 ; 0x4e76 TextEndBattle

Route20TrainerHeader8: ; 50d8e (14:4d8e)
	db $8 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText8 ; 0x4e80 TextBeforeBattle
	dw Route20AfterBattleText8 ; 0x4e8a TextAfterBattle
	dw Route20EndBattleText8 ; 0x4e85 TextEndBattle
	dw Route20EndBattleText8 ; 0x4e85 TextEndBattle

Route20TrainerHeader9: ; 50d9a (14:4d9a)
	db $9 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText9 ; 0x4e8f TextBeforeBattle
	dw Route20AfterBattleText9 ; 0x4e99 TextAfterBattle
	dw Route20EndBattleText9 ; 0x4e94 TextEndBattle
	dw Route20EndBattleText9 ; 0x4e94 TextEndBattle

Route20TrainerHeader10: ; 50da6 (14:4da6)
	db $a ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd7e7 ; flag's byte
	dw Route20BattleText10 ; 0x4e9e TextBeforeBattle
	dw Route20AfterBattleText10 ; 0x4ea8 TextAfterBattle
	dw Route20EndBattleText10 ; 0x4ea3 TextEndBattle
	dw Route20EndBattleText10 ; 0x4ea3 TextEndBattle

	db $ff

Route20Text1: ; 50db3 (14:4db3)
	db $08 ; asm
	ld hl, Route20TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route20Text2: ; 50dbd (14:4dbd)
	db $08 ; asm
	ld hl, Route20TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route20Text3: ; 50dc7 (14:4dc7)
	db $08 ; asm
	ld hl, Route20TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route20Text4: ; 50dd1 (14:4dd1)
	db $08 ; asm
	ld hl, Route20TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route20Text5: ; 50ddb (14:4ddb)
	db $08 ; asm
	ld hl, Route20TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route20Text6: ; 50de5 (14:4de5)
	db $08 ; asm
	ld hl, Route20TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route20Text7: ; 50def (14:4def)
	db $08 ; asm
	ld hl, Route20TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route20Text8: ; 50df9 (14:4df9)
	db $08 ; asm
	ld hl, Route20TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route20Text9: ; 50e03 (14:4e03)
	db $08 ; asm
	ld hl, Route20TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route20Text10: ; 50e0d (14:4e0d)
	db $08 ; asm
	ld hl, Route20TrainerHeader10
	call TalkToTrainer
	jp TextScriptEnd

Route20BattleText1: ; 50e17 (14:4e17)
	TX_FAR _Route20BattleText1
	db "@"

Route20EndBattleText1: ; 50e1c (14:4e1c)
	TX_FAR _Route20EndBattleText1
	db "@"

Route20AfterBattleText1: ; 50e21 (14:4e21)
	TX_FAR _Route20AfterBattleText1
	db "@"

Route20BattleText2: ; 50e26 (14:4e26)
	TX_FAR _Route20BattleText2
	db "@"

Route20EndBattleText2: ; 50e2b (14:4e2b)
	TX_FAR _Route20EndBattleText2
	db "@"

Route20AfterBattleText2: ; 50e30 (14:4e30)
	TX_FAR _Route20AfterBattleText2
	db "@"

Route20BattleText3: ; 50e35 (14:4e35)
	TX_FAR _Route20BattleText3
	db "@"

Route20EndBattleText3: ; 50e3a (14:4e3a)
	TX_FAR _Route20EndBattleText3
	db "@"

Route20AfterBattleText3: ; 50e3f (14:4e3f)
	TX_FAR _Route20AfterBattleText3
	db "@"

Route20BattleText4: ; 50e44 (14:4e44)
	TX_FAR _Route20BattleText4
	db "@"

Route20EndBattleText4: ; 50e49 (14:4e49)
	TX_FAR _Route20EndBattleText4
	db "@"

Route20AfterBattleText4: ; 50e4e (14:4e4e)
	TX_FAR _Route20AfterBattleText4
	db "@"

Route20BattleText5: ; 50e53 (14:4e53)
	TX_FAR _Route20BattleText5
	db "@"

Route20EndBattleText5: ; 50e58 (14:4e58)
	TX_FAR _Route20EndBattleText5
	db "@"

Route20AfterBattleText5: ; 50e5d (14:4e5d)
	TX_FAR _Route20AfterBattleText5
	db "@"

Route20BattleText6: ; 50e62 (14:4e62)
	TX_FAR _Route20BattleText6
	db "@"

Route20EndBattleText6: ; 50e67 (14:4e67)
	TX_FAR _Route20EndBattleText6
	db "@"

Route20AfterBattleText6: ; 50e6c (14:4e6c)
	TX_FAR _Route20AfterBattleText6
	db "@"

Route20BattleText7: ; 50e71 (14:4e71)
	TX_FAR _Route20BattleText7
	db "@"

Route20EndBattleText7: ; 50e76 (14:4e76)
	TX_FAR _Route20EndBattleText7
	db "@"

Route20AfterBattleText7: ; 50e7b (14:4e7b)
	TX_FAR _Route20AfterBattleText7
	db "@"

Route20BattleText8: ; 50e80 (14:4e80)
	TX_FAR _Route20BattleText8
	db "@"

Route20EndBattleText8: ; 50e85 (14:4e85)
	TX_FAR _Route20EndBattleText8
	db "@"

Route20AfterBattleText8: ; 50e8a (14:4e8a)
	TX_FAR _Route20AfterBattleText8
	db "@"

Route20BattleText9: ; 50e8f (14:4e8f)
	TX_FAR _Route20BattleText9
	db "@"

Route20EndBattleText9: ; 50e94 (14:4e94)
	TX_FAR _Route20EndBattleText9
	db "@"

Route20AfterBattleText9: ; 50e99 (14:4e99)
	TX_FAR _Route20AfterBattleText9
	db "@"

Route20BattleText10: ; 50e9e (14:4e9e)
	TX_FAR _Route20BattleText10
	db "@"

Route20EndBattleText10: ; 50ea3 (14:4ea3)
	TX_FAR _Route20EndBattleText10
	db "@"

Route20AfterBattleText10: ; 50ea8 (14:4ea8)
	TX_FAR _Route20AfterBattleText10
	db "@"

Route20Text12: ; 50ead (14:4ead)
Route20Text11: ; 50ead (14:4ead)
	TX_FAR _Route20Text11
	db "@"
