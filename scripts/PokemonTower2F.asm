PokemonTower2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower2F_ScriptPointers
	ld a, [wPokemonTower2FCurScript]
	jp CallFunctionInTable

PokemonTower2Script_604fe:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2F_ScriptPointers:
	dw PokemonTower2Script0
	dw PokemonTower2Script1
	dw PokemonTower2Script2

PokemonTower2Script0:
	CheckEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	ret nz
	ld hl, CoordsData_6055e
	call ArePlayerCoordsInArray
	ret nc
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ResetEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr nz, .asm_60544
; the rival is on the left side and the player is on the right side
	SetEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
.asm_60544
	ld [wPlayerMovingDirection], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, b
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ret

CoordsData_6055e:
	db $05,$0F
	db $06,$0E
	db $0F ; isn't this supposed to end in $ff?

PokemonTower2Script1:
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower2Script_604fe
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld de, MovementData_605b2
	CheckEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	jr nz, .asm_60589
	ld de, MovementData_605a9
.asm_60589
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $2
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

MovementData_605a9:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

MovementData_605b2:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

PokemonTower2Script2:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_POKEMON_TOWER_2F_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, $0
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2F_TextPointers:
	dw PokemonTower2Text1
	dw PokemonTower2Text2

PokemonTower2Text1:
	TX_ASM
	CheckEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	jr z, .asm_16f24
	ld hl, PokemonTower2Text_6063c
	call PrintText
	jr .asm_41852
.asm_16f24
	ld hl, PokemonTower2Text_6062d
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, PokemonTower2Text_60632
	ld de, PokemonTower2Text_60637
	call SaveEndBattleTextPointers
	ld a, OPP_SONY2
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $4
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $5
	jr .done
.Charmander
	ld a, $6
.done
	ld [wTrainerNo], a

	ld a, $1
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
.asm_41852
	jp TextScriptEnd

PokemonTower2Text_6062d:
	TX_FAR _PokemonTower2Text_6062d
	db "@"

PokemonTower2Text_60632:
	TX_FAR _PokemonTower2Text_60632
	db "@"

PokemonTower2Text_60637:
	TX_FAR _PokemonTower2Text_60637
	db "@"

PokemonTower2Text_6063c:
	TX_FAR _PokemonTower2Text_6063c
	db "@"

PokemonTower2Text2:
	TX_FAR _PokemonTower2Text2
	db "@"
