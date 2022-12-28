SilphCo11F_Script:
	call SilphCo11Script_62110
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo11TrainerHeaders
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
	dbmapcoord  3,  6
	db -1 ; end

SilphCo11Script_62137:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.asm_62143
	ld a, [hli]
	cp $ff
	jr z, .asm_6215f
	push hl
	ld hl, hUnlockedSilphCoDoors
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
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo11Script_62163:
	ldh a, [hUnlockedSilphCoDoors]
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
	cp -1
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
	db -1 ; end

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
	db -1 ; end

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
	ldh [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $3
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_62216
	call MoveSprite
	ld a, $3
	jp SilphCo11Script_621c8

CoordsData_62211:
	dbmapcoord  6, 13
	dbmapcoord  7, 12
	db -1 ; end

MovementData_62216:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

SilphCo11Script_6221a:
	ld [wPlayerMovingDirection], a
	ld a, $3
	ldh [hSpriteIndex], a
	ld a, b
	ldh [hSpriteFacingDirection], a
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
	ldh [hSpriteIndexOrTextID], a
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
	ldh [hSpriteIndex], a
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
	ldh a, [hSpriteIndex]
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

SilphCo11TrainerHeaders:
	def_trainers 4
SilphCo11TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_11F_TRAINER_0, 4, SilphCo11BattleText1, SilphCo11EndBattleText1, SilphCo11AfterBattleText1
SilphCo11TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_11F_TRAINER_1, 3, SilphCo11BattleText2, SilphCo11EndBattleText2, SilphCo11AfterBattleText2
	db -1 ; end

SilphCo11Text1:
	text_asm
	CheckEvent EVENT_GOT_MASTER_BALL
	jp nz, .got_item
	ld hl, SilphCoPresidentText
	call PrintText
	lb bc, MASTER_BALL, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedSilphCoMasterBallText
	call PrintText
	SetEvent EVENT_GOT_MASTER_BALL
	jr .done
.bag_full
	ld hl, SilphCoMasterBallNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, SilphCo10Text_6231c
	call PrintText
.done
	jp TextScriptEnd

SilphCoPresidentText:
	text_far _SilphCoPresidentText
	text_end

ReceivedSilphCoMasterBallText:
	text_far _ReceivedSilphCoMasterBallText
	sound_get_key_item
	text_end

SilphCo10Text_6231c:
	text_far _SilphCo10Text_6231c
	text_end

SilphCoMasterBallNoRoomText:
	text_far _SilphCoMasterBallNoRoomText
	text_end

SilphCo11Text2:
	text_far _SilphCo11Text2
	text_end

SilphCo11Text3:
	text_far _SilphCo11Text3
	text_end

SilphCo10Text_62330:
	text_far _SilphCo10Text_62330
	text_end

SilphCo11Text6:
	text_far _SilphCo10Text_62335
	text_end

SilphCo11Text4:
	text_asm
	ld hl, SilphCo11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo11BattleText1:
	text_far _SilphCo11BattleText1
	text_end

SilphCo11EndBattleText1:
	text_far _SilphCo11EndBattleText1
	text_end

SilphCo11AfterBattleText1:
	text_far _SilphCo11AfterBattleText1
	text_end

SilphCo11Text5:
	text_asm
	ld hl, SilphCo11TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo11BattleText2:
	text_far _SilphCo11BattleText2
	text_end

SilphCo11EndBattleText2:
	text_far _SilphCo11EndBattleText2
	text_end

SilphCo11AfterBattleText2:
	text_far _SilphCo11AfterBattleText2
	text_end

SilphCo10Text_6236c:
	text_asm
	ld hl, SilphCo10Text_6237b
	call PrintText
	ld a, PORYGON
	call DisplayPokedex
	jp TextScriptEnd

SilphCo10Text_6237b:
	text_far _SilphCo10Text_6237b
	text_end
