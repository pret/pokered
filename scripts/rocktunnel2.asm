RockTunnel2Script: ; 45feb (11:5feb)
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel2TrainerHeaders
	ld de, RockTunnel2ScriptPointers
	ld a, [W_ROCKTUNNEL2CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROCKTUNNEL2CURSCRIPT], a
	ret

RockTunnel2ScriptPointers: ; 45ffe (11:5ffe)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RockTunnel2TextPointers: ; 46004 (11:6004)
	dw RockTunnel2Text1
	dw RockTunnel2Text2
	dw RockTunnel2Text3
	dw RockTunnel2Text4
	dw RockTunnel2Text5
	dw RockTunnel2Text6
	dw RockTunnel2Text7
	dw RockTunnel2Text8

RockTunnel2TrainerHeaders: ; 46014 (11:6014)
RockTunnel2TrainerHeader0: ; 46014 (11:6014)
	db $1 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText2 ; 0x60c5 TextBeforeBattle
	dw RockTunnel2AfterBattleText2 ; 0x60cf TextAfterBattle
	dw RockTunnel2EndBattleText2 ; 0x60ca TextEndBattle
	dw RockTunnel2EndBattleText2 ; 0x60ca TextEndBattle

RockTunnel2TrainerHeader2: ; 46020 (11:6020)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText3 ; 0x60d4 TextBeforeBattle
	dw RockTunnel2AfterBattleText3 ; 0x60de TextAfterBattle
	dw RockTunnel2EndBattleText3 ; 0x60d9 TextEndBattle
	dw RockTunnel2EndBattleText3 ; 0x60d9 TextEndBattle

RockTunnel2TrainerHeader3: ; 4602c (11:602c)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText4 ; 0x60e3 TextBeforeBattle
	dw RockTunnel2AfterBattleText4 ; 0x60ed TextAfterBattle
	dw RockTunnel2EndBattleText4 ; 0x60e8 TextEndBattle
	dw RockTunnel2EndBattleText4 ; 0x60e8 TextEndBattle

RockTunnel2TrainerHeader4: ; 46038 (11:6038)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText5 ; 0x60f2 TextBeforeBattle
	dw RockTunnel2AfterBattleText5 ; 0x60fc TextAfterBattle
	dw RockTunnel2EndBattleText5 ; 0x60f7 TextEndBattle
	dw RockTunnel2EndBattleText5 ; 0x60f7 TextEndBattle

RockTunnel2TrainerHeader5: ; 46044 (11:6044)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText6 ; 0x6101 TextBeforeBattle
	dw RockTunnel2AfterBattleText6 ; 0x610b TextAfterBattle
	dw RockTunnel2EndBattleText6 ; 0x6106 TextEndBattle
	dw RockTunnel2EndBattleText6 ; 0x6106 TextEndBattle

RockTunnel2TrainerHeader6: ; 46050 (11:6050)
	db $6 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText7 ; 0x6110 TextBeforeBattle
	dw RockTunnel2AfterBattleText7 ; 0x611a TextAfterBattle
	dw RockTunnel2EndBattleText7 ; 0x6115 TextEndBattle
	dw RockTunnel2EndBattleText7 ; 0x6115 TextEndBattle

RockTunnel2TrainerHeader7: ; 4605c (11:605c)
	db $7 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText8 ; 0x611f TextBeforeBattle
	dw RockTunnel2AfterBattleText8 ; 0x6129 TextAfterBattle
	dw RockTunnel2EndBattleText8 ; 0x6124 TextEndBattle
	dw RockTunnel2EndBattleText8 ; 0x6124 TextEndBattle

RockTunnel2TrainerHeader8: ; 46068 (11:6068)
	db $8 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd87d ; flag's byte
	dw RockTunnel2BattleText9 ; 0x612e TextBeforeBattle
	dw RockTunnel2AfterBattleText9 ; 0x6138 TextAfterBattle
	dw RockTunnel2EndBattleText9 ; 0x6133 TextEndBattle
	dw RockTunnel2EndBattleText9 ; 0x6133 TextEndBattle

	db $ff

RockTunnel2Text1: ; 46075 (11:6075)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text2: ; 4607f (11:607f)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text3: ; 46089 (11:6089)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text4: ; 46093 (11:6093)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text5: ; 4609d (11:609d)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text6: ; 460a7 (11:60a7)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text7: ; 460b1 (11:60b1)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text8: ; 460bb (11:60bb)
	db $08 ; asm
	ld hl, RockTunnel2TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2BattleText2: ; 460c5 (11:60c5)
	TX_FAR _RockTunnel2BattleText2
	db "@"

RockTunnel2EndBattleText2: ; 460ca (11:60ca)
	TX_FAR _RockTunnel2EndBattleText2
	db "@"

RockTunnel2AfterBattleText2: ; 460cf (11:60cf)
	TX_FAR _RockTunnel2AfterBattleText2
	db "@"

RockTunnel2BattleText3: ; 460d4 (11:60d4)
	TX_FAR _RockTunnel2BattleText3
	db "@"

RockTunnel2EndBattleText3: ; 460d9 (11:60d9)
	TX_FAR _RockTunnel2EndBattleText3
	db "@"

RockTunnel2AfterBattleText3: ; 460de (11:60de)
	TX_FAR _RockTunnel2AfterBattleText3
	db "@"

RockTunnel2BattleText4: ; 460e3 (11:60e3)
	TX_FAR _RockTunnel2BattleText4
	db "@"

RockTunnel2EndBattleText4: ; 460e8 (11:60e8)
	TX_FAR _RockTunnel2EndBattleText4
	db "@"

RockTunnel2AfterBattleText4: ; 460ed (11:60ed)
	TX_FAR _RockTunnel2AfterBattleText4
	db "@"

RockTunnel2BattleText5: ; 460f2 (11:60f2)
	TX_FAR _RockTunnel2BattleText5
	db "@"

RockTunnel2EndBattleText5: ; 460f7 (11:60f7)
	TX_FAR _RockTunnel2EndBattleText5
	db "@"

RockTunnel2AfterBattleText5: ; 460fc (11:60fc)
	TX_FAR _RockTunnel2AfterBattleText5
	db "@"

RockTunnel2BattleText6: ; 46101 (11:6101)
	TX_FAR _RockTunnel2BattleText6
	db "@"

RockTunnel2EndBattleText6: ; 46106 (11:6106)
	TX_FAR _RockTunnel2EndBattleText6
	db "@"

RockTunnel2AfterBattleText6: ; 4610b (11:610b)
	TX_FAR _RockTunnel2AfterBattleText6
	db "@"

RockTunnel2BattleText7: ; 46110 (11:6110)
	TX_FAR _RockTunnel2BattleText7
	db "@"

RockTunnel2EndBattleText7: ; 46115 (11:6115)
	TX_FAR _RockTunnel2EndBattleText7
	db "@"

RockTunnel2AfterBattleText7: ; 4611a (11:611a)
	TX_FAR _RockTunnel2AfterBattleText7
	db "@"

RockTunnel2BattleText8: ; 4611f (11:611f)
	TX_FAR _RockTunnel2BattleText8
	db "@"

RockTunnel2EndBattleText8: ; 46124 (11:6124)
	TX_FAR _RockTunnel2EndBattleText8
	db "@"

RockTunnel2AfterBattleText8: ; 46129 (11:6129)
	TX_FAR _RockTunnel2AfterBattleText8
	db "@"

RockTunnel2BattleText9: ; 4612e (11:612e)
	TX_FAR _RockTunnel2BattleText9
	db "@"

RockTunnel2EndBattleText9: ; 46133 (11:6133)
	TX_FAR _RockTunnel2EndBattleText9
	db "@"

RockTunnel2AfterBattleText9: ; 46138 (11:6138)
	TX_FAR _RockTunnel2AfterBattleText9
	db "@"
