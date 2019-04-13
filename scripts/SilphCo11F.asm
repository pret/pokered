SilphCo11F_Script:
	call SilphCo11Script_62110
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo11TrainerHeader0
	ld de, SilphCo11F_ScriptPointers
	ld a, [wSilphCo11FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo11FCurScript], a
	ret

SilphCo11Script_62110:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo11GateCoords
	call SilphCo11Script_62137
	call SilphCo11Script_62163
	CheckEvent EVENT_SILPH_CO_11_UNLOCKED_DOOR
	ret nz
	ld a, $20
	ld [wNewTileBlockID], a
	lb bc, 6, 3
	predef_jump ReplaceTileBlock

SilphCo11GateCoords:
	db $06,$03
	db $FF

SilphCo11Script_62137:
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

SilphCo11Script_62163:
	ld a, [$ffe0]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_11_UNLOCKED_DOOR
	ret

SilphCo11Script_6216d:
	ld hl, MissableObjectIDs_6219b
.asm_62170
	ld a, [hli]
	cp $ff
	jr z, .asm_62181
	push hl
	ld [wMissableObjectIndex], a
	predef HideObject
	pop hl
	jr .asm_62170
.asm_62181
	ld hl, MissableObjectIDs_62194
.asm_62184
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wMissableObjectIndex], a
	predef ShowObject
	pop hl
	jr .asm_62184

MissableObjectIDs_62194:
	db HS_SAFFRON_CITY_8
	db HS_SAFFRON_CITY_9
	db HS_SAFFRON_CITY_A
	db HS_SAFFRON_CITY_B
	db HS_SAFFRON_CITY_C
	db HS_SAFFRON_CITY_D
	db $FF

MissableObjectIDs_6219b:
	db HS_SAFFRON_CITY_1
	db HS_SAFFRON_CITY_2
	db HS_SAFFRON_CITY_3
	db HS_SAFFRON_CITY_4
	db HS_SAFFRON_CITY_5
	db HS_SAFFRON_CITY_6
	db HS_SAFFRON_CITY_7
	db HS_SAFFRON_CITY_E
	db HS_SAFFRON_CITY_F
	db HS_SILPH_CO_2F_2
	db HS_SILPH_CO_2F_3
	db HS_SILPH_CO_2F_4
	db HS_SILPH_CO_2F_5
	db HS_SILPH_CO_3F_1
	db HS_SILPH_CO_3F_2
	db HS_SILPH_CO_4F_1
	db HS_SILPH_CO_4F_2
	db HS_SILPH_CO_4F_3
	db HS_SILPH_CO_5F_1
	db HS_SILPH_CO_5F_2
	db HS_SILPH_CO_5F_3
	db HS_SILPH_CO_5F_4
	db HS_SILPH_CO_6F_1
	db HS_SILPH_CO_6F_2
	db HS_SILPH_CO_6F_3
	db HS_SILPH_CO_7F_1
	db HS_SILPH_CO_7F_2
	db HS_SILPH_CO_7F_3
	db HS_SILPH_CO_7F_4
	db HS_SILPH_CO_8F_1
	db HS_SILPH_CO_8F_2
	db HS_SILPH_CO_8F_3
	db HS_SILPH_CO_9F_1
	db HS_SILPH_CO_9F_2
	db HS_SILPH_CO_9F_3
	db HS_SILPH_CO_10F_1
	db HS_SILPH_CO_10F_2
	db HS_SILPH_CO_11F_1
	db HS_SILPH_CO_11F_2
	db HS_SILPH_CO_11F_3
	db $FF

SilphCo11Script_621c4:
	xor a
	ld [wJoyIgnore], a

SilphCo11Script_621c8:
	ld [wSilphCo11FCurScript], a
	ld [wCurMapScript], a
	ret

SilphCo11F_ScriptPointers:
	dw SilphCo11Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SilphCo11Script3
	dw SilphCo11Script4
	dw SilphCo11Script5

SilphCo11Script0:
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret nz
	ld hl, CoordsData_62211
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	ld a, [wCoordIndex]
	ld [wcf0d], a
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $3
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_62216
	call MoveSprite
	ld a, $3
	jp SilphCo11Script_621c8

CoordsData_62211:
	db $0D,$06
	db $0C,$07
	db $FF

MovementData_62216:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

SilphCo11Script_6221a:
	ld [wPlayerMovingDirection], a
	ld a, $3
	ld [H_SPRITEINDEX], a
	ld a, b
	ld [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay

SilphCo11Script5:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SilphCo11Script_621c4
	ld a, [wcf0d]
	cp $1
	jr z, .asm_6223c
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
	jr .asm_62240
.asm_6223c
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
.asm_62240
	call SilphCo11Script_6221a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $6
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	call SilphCo11Script_6216d
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	SetEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	xor a
	ld [wJoyIgnore], a
	jp SilphCo11Script_621c8

SilphCo11Script3:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $3
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld a, [wcf0d]
	cp $1
	jr z, .asm_62284
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
	jr .asm_62288
.asm_62284
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
.asm_62288
	call SilphCo11Script_6221a
	call Delay3
	ld a, $4
	jp SilphCo11Script_621c8

SilphCo11Script4:
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SilphCo10Text_62330
	ld de, SilphCo10Text_62330
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ld [wJoyIgnore], a
	ld a, $5
	jp SilphCo11Script_621c8

SilphCo11F_TextPointers:
	dw SilphCo11Text1
	dw SilphCo11Text2
	dw SilphCo11Text3
	dw SilphCo11Text4
	dw SilphCo11Text5
	dw SilphCo11Text6

SilphCo11TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_11F_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_11F_TRAINER_0
	dw SilphCo11BattleText1 ; TextBeforeBattle
	dw SilphCo11AfterBattleText1 ; TextAfterBattle
	dw SilphCo11EndBattleText1 ; TextEndBattle
	dw SilphCo11EndBattleText1 ; TextEndBattle

SilphCo11TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_11F_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_11F_TRAINER_1
	dw SilphCo11BattleText2 ; TextBeforeBattle
	dw SilphCo11AfterBattleText2 ; TextAfterBattle
	dw SilphCo11EndBattleText2 ; TextEndBattle
	dw SilphCo11EndBattleText2 ; TextEndBattle

	db $ff

SilphCo11Text1:
	TX_ASM
	CheckEvent EVENT_GOT_MASTER_BALL
	jp nz, .asm_62308
	ld hl, SilphCoPresidentText
	call PrintText
	lb bc, MASTER_BALL, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedSilphCoMasterBallText
	call PrintText
	SetEvent EVENT_GOT_MASTER_BALL
	jr .asm_6230e
.BagFull
	ld hl, SilphCoMasterBallNoRoomText
	call PrintText
	jr .asm_6230e
.asm_62308
	ld hl, SilphCo10Text_6231c
	call PrintText
.asm_6230e
	jp TextScriptEnd

SilphCoPresidentText:
	TX_FAR _SilphCoPresidentText
	db "@"

ReceivedSilphCoMasterBallText:
	TX_FAR _ReceivedSilphCoMasterBallText
	TX_SFX_KEY_ITEM
	db "@"

SilphCo10Text_6231c:
	TX_FAR _SilphCo10Text_6231c
	db "@"

SilphCoMasterBallNoRoomText:
	TX_FAR _SilphCoMasterBallNoRoomText
	db "@"

SilphCo11Text2:
	TX_FAR _SilphCo11Text2
	db "@"

SilphCo11Text3:
	TX_FAR _SilphCo11Text3
	db "@"

SilphCo10Text_62330:
	TX_FAR _SilphCo10Text_62330
	db "@"

SilphCo11Text6:
	TX_FAR _SilphCo10Text_62335
	db "@"

SilphCo11Text4:
	TX_ASM
	ld hl, SilphCo11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo11BattleText1:
	TX_FAR _SilphCo11BattleText1
	db "@"

SilphCo11EndBattleText1:
	TX_FAR _SilphCo11EndBattleText1
	db "@"

SilphCo11AfterBattleText1:
	TX_FAR _SilphCo11AfterBattleText1
	db "@"

SilphCo11Text5:
	TX_ASM
	ld hl, SilphCo11TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo11BattleText2:
	TX_FAR _SilphCo11BattleText2
	db "@"

SilphCo11EndBattleText2:
	TX_FAR _SilphCo11EndBattleText2
	db "@"

SilphCo11AfterBattleText2:
	TX_FAR _SilphCo11AfterBattleText2
	db "@"

SilphCo10Text_6236c:
	TX_ASM
	ld hl, SilphCo10Text_6237b
	call PrintText
	ld a, PORYGON
	call DisplayPokedex
	jp TextScriptEnd

SilphCo10Text_6237b:
	TX_FAR _SilphCo10Text_6237b
	db "@"
