SilphCo11Script: ; 620fa (18:60fa)
	call SilphCo11Script_62110
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo11TrainerHeaders
	ld de, SilphCo11ScriptPointers
	ld a, [W_SILPHCO11CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO11CURSCRIPT], a
	ret

SilphCo11Script_62110: ; 62110 (18:6110)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, DataTable_62134 ; $6134
	call SilphCo11Script_62137
	call SilphCo11Script_62163
	ld a, [wd838]
	bit 0, a
	ret nz
	ld a, $20
	ld [wd09f], a
	ld bc, $603
	predef_jump ReplaceTileBlock

DataTable_62134: ; 62134 (18:6134)
	db $06,$03,$FF

SilphCo11Script_62137: ; 62137 (18:6137)
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
	pop hl
.asm_62143
	ld a, [hli]
	cp $ff
	jr z, .asm_6215f
	push hl
	ld hl, $ffe0
	inc [hl]
	pop hl
	cp b
	jr z, .asm_62154
	inc hl
	jr .asm_62143
.asm_62154
	ld a, [hli]
	cp c
	jr nz, .asm_62143
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_6215f
	xor a
	ld [$ffe0], a
	ret

SilphCo11Script_62163: ; 62163 (18:6163)
	ld a, [$ffe0]
	and a
	ret z
	ld hl, wd838
	set 0, [hl]
	ret

SilphCo11Script_6216d: ; 6216d (18:616d)
	ld hl, MissableObjectIDs_6219b ; $619b
.asm_62170
	ld a, [hli]
	cp $ff
	jr z, .asm_62181
	push hl
	ld [wcc4d], a
	predef HideObject
	pop hl
	jr .asm_62170
.asm_62181
	ld hl, MissableObjectIDs_62194 ; $6194
.asm_62184
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wcc4d], a
	predef ShowObject
	pop hl
	jr .asm_62184

MissableObjectIDs_62194: ; 62194 (18:6194)
	db $11,$12,$13,$14,$15,$16,$FF

MissableObjectIDs_6219b: ; 6219b (18:619b)
	db $0A,$0B,$0C,$0D,$0E,$0F,$10,$17
	db $18,$8A,$8B,$8C,$8D,$8E,$8F,$91
	db $92,$93,$97,$98,$99,$9A,$9E,$9F
	db $A0,$A3,$A4,$A5,$A6,$AB,$AC,$AD
	db $AE,$AF,$B0,$B1,$B2,$B7,$B8,$B9
	db $FF

SilphCo11Script_621c4: ; 621c4 (18:61c4)
	xor a
	ld [wJoyIgnore], a

SilphCo11Script_621c8: ; 621c8 (18:61c8)
	ld [W_SILPHCO11CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

SilphCo11ScriptPointers: ; 621cf (18:61cf)
	dw SilphCo11Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SilphCo11Script3
	dw SilphCo11Script4
	dw SilphCo11Script5

SilphCo11Script0: ; 621db (18:61db)
	ld a, [wd838]
	bit 7, a
	ret nz
	ld hl, CoordsData_62211 ; $6211
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	ld a, [wWhichTrade] ; wWhichTrade
	ld [wcf0d], a
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $3
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld a, $3
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call SetSpriteMovementBytesToFF
	ld de, MovementData_62216
	call MoveSprite
	ld a, $3
	jp SilphCo11Script_621c8

CoordsData_62211: ; 62211 (18:6211)
	db $0D,$06
	db $0C,$07
	db $FF

MovementData_62216: ; 62216 (18:6216)
	db $00,$00,$00,$FF

SilphCo11Script_6221a: ; 6221a (18:621a)
	ld [wd528], a
	ld a, $3
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	ld a, b
	ld [$ff8d], a
	jp SetSpriteFacingDirectionAndDelay

SilphCo11Script5: ; 62227 (18:6227)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, SilphCo11Script_621c4
	ld a, [wcf0d]
	cp $1
	jr z, .asm_6223c
	ld a, $2
	ld b, $c
	jr .asm_62240
.asm_6223c
	ld a, $8
	ld b, $0
.asm_62240
	call SilphCo11Script_6221a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $6
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	call GBFadeOutToBlack
	call SilphCo11Script_6216d
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld hl, wd838
	set 7, [hl]
	xor a
	ld [wJoyIgnore], a
	jp SilphCo11Script_621c8

SilphCo11Script3: ; 6226a (18:626a)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $3
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call SetSpriteMovementBytesToFF
	ld a, [wcf0d]
	cp $1
	jr z, .asm_62284
	ld a, $2
	ld b, $c
	jr .asm_62288
.asm_62284
	ld a, $8
	ld b, $0
.asm_62288
	call SilphCo11Script_6221a
	call Delay3
	ld a, $4
	jp SilphCo11Script_621c8

SilphCo11Script4: ; 62293 (18:6293)
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SilphCo10Text_62330 ; $6330
	ld de, SilphCo10Text_62330 ; $6330
	call SaveEndBattleTextPointers
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ld [wJoyIgnore], a
	ld a, $5
	jp SilphCo11Script_621c8

SilphCo11TextPointers: ; 622b7 (18:62b7)
	dw SilphCo11Text1
	dw SilphCo11Text2
	dw SilphCo11Text3
	dw SilphCo11Text4
	dw SilphCo11Text5
	dw SilphCo11Text6

SilphCo11TrainerHeaders: ; 622c3 (18:62c3)
SilphCo11TrainerHeader0: ; 622c3 (18:62c3)
	db $4 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd837 ; flag's byte
	dw SilphCo11BattleText1 ; 0x6344 TextBeforeBattle
	dw SilphCo11AfterBattleText1 ; 0x634e TextAfterBattle
	dw SilphCo11EndBattleText1 ; 0x6349 TextEndBattle
	dw SilphCo11EndBattleText1 ; 0x6349 TextEndBattle

SilphCo11TrainerHeader1: ; 622cf (18:62cf)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd837 ; flag's byte
	dw SilphCo11BattleText2 ; 0x635d TextBeforeBattle
	dw SilphCo11AfterBattleText2 ; 0x6367 TextAfterBattle
	dw SilphCo11EndBattleText2 ; 0x6362 TextEndBattle
	dw SilphCo11EndBattleText2 ; 0x6362 TextEndBattle

	db $ff

SilphCo11Text1: ; 622dc (18:62dc)
	db $08 ; asm
	ld a, [wd838]
	bit 5, a
	jp nz, .asm_62308
	ld hl, SilphCoPresidentText
	call PrintText
	ld bc, (MASTER_BALL << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedSilphCoMasterBallText
	call PrintText
	ld hl, wd838
	set 5, [hl]
	jr .asm_fd405 ; 0x622fe
.BagFull
	ld hl, SilphCoMasterBallNoRoomText
	call PrintText
	jr .asm_fd405 ; 0x62306
.asm_62308 ; 0x62308
	ld hl, SilphCo10Text_6231c
	call PrintText
.asm_fd405 ; 0x6230e
	jp TextScriptEnd

SilphCoPresidentText: ; 62311 (18:6311)
	TX_FAR _SilphCoPresidentText
	db "@"

ReceivedSilphCoMasterBallText: ; 62316 (18:6316)
	TX_FAR _ReceivedSilphCoMasterBallText
	db $11, "@"

SilphCo10Text_6231c: ; 6231c (18:631c)
	TX_FAR _SilphCo10Text_6231c
	db "@"

SilphCoMasterBallNoRoomText: ; 62321 (18:6321)
	TX_FAR _SilphCoMasterBallNoRoomText
	db "@"

SilphCo11Text2: ; 62326 (18:6326)
	TX_FAR _SilphCo11Text2
	db "@"

SilphCo11Text3: ; 6232b (18:632b)
	TX_FAR _SilphCo11Text3
	db "@"

SilphCo10Text_62330: ; 62330 (18:6330)
	TX_FAR _SilphCo10Text_62330
	db "@"

SilphCo11Text6: ; 62335 (18:6335)
	TX_FAR _SilphCo10Text_62335
	db "@"

SilphCo11Text4: ; 6233a (18:633a)
	db $08 ; asm
	ld hl, SilphCo11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo11BattleText1: ; 62344 (18:6344)
	TX_FAR _SilphCo11BattleText1
	db "@"

SilphCo11EndBattleText1: ; 62349 (18:6349)
	TX_FAR _SilphCo11EndBattleText1
	db "@"

SilphCo11AfterBattleText1: ; 6234e (18:634e)
	TX_FAR _SilphCo11AfterBattleText1
	db "@"

SilphCo11Text5: ; 62353 (18:6353)
	db $08 ; asm
	ld hl, SilphCo11TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo11BattleText2: ; 6235d (18:635d)
	TX_FAR _SilphCo11BattleText2
	db "@"

SilphCo11EndBattleText2: ; 62362 (18:6362)
	TX_FAR _SilphCo11EndBattleText2
	db "@"

SilphCo11AfterBattleText2: ; 62367 (18:6367)
	TX_FAR _SilphCo11AfterBattleText2
	db "@"

SilphCo10Text_6236c: ; 6236c (18:636c)
	db $8
	ld hl, SilphCo10Text_6237b
	call PrintText
	ld a, PORYGON
	call DisplayPokedex
	jp TextScriptEnd

SilphCo10Text_6237b: ; 6237b (18:637b)
	TX_FAR _SilphCo10Text_6237b
	db "@"
