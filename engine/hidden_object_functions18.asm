GymStatues: ; 62419 (18:6419)
; if in a gym and have the corresponding badge, a = GymStatueText2_id and jp PrintPredefTextID
; if in a gym and don’t have the corresponding badge, a = GymStatueText1_id and jp PrintPredefTextID
; else ret
	call EnableAutoTextBoxDrawing
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	ld hl, .BadgeFlags
	ld a, [wCurMap]
	ld b, a
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .match
	inc hl
	jr .loop
.match
	ld b, [hl]
	ld a, [wBeatGymFlags]
	and b
	cp b
	tx_pre_id GymStatueText2
	jr z, .haveBadge
	tx_pre_id GymStatueText1
.haveBadge
	jp PrintPredefTextID

.BadgeFlags: ; 62442 (18:6442)
	db PEWTER_GYM,   %00000001
	db CERULEAN_GYM, %00000010
	db VERMILION_GYM,%00000100
	db CELADON_GYM,  %00001000
	db FUCHSIA_GYM,  %00010000
	db SAFFRON_GYM,  %00100000
	db CINNABAR_GYM, %01000000
	db VIRIDIAN_GYM, %10000000
	db $ff

GymStatueText1: ; 62453 (18:6453)
	TX_FAR _GymStatueText1
	db "@"

GymStatueText2: ; 62458 (18:6458)
	TX_FAR _GymStatueText2
	db "@"

PrintBenchGuyText: ; 6245d (18:645d)
	call EnableAutoTextBoxDrawing
	ld hl, BenchGuyTextPointers
	ld a, [wCurMap]
	ld b, a
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .match
	inc hl
	inc hl
	jr .loop
.match
	ld a, [hli]
	ld b, a
	ld a, [wSpriteStateData1 + 9]
	cp b
	jr nz, .loop ; player isn't facing left at the bench guy
	ld a, [hl]
	jp PrintPredefTextID

; format: db map id, player sprite facing direction, text id of PredefTextIDPointerTable
BenchGuyTextPointers: ; 6247e (18:647e)
	db VIRIDIAN_POKECENTER,   SPRITE_FACING_LEFT
	db (ViridianCityPokecenterBenchGuyText_id   - TextPredefs) / 2 + 1
	db PEWTER_POKECENTER,     SPRITE_FACING_LEFT
	db (PewterCityPokecenterBenchGuyText_id     - TextPredefs) / 2 + 1
	db CERULEAN_POKECENTER,   SPRITE_FACING_LEFT
	db (CeruleanCityPokecenterBenchGuyText_id   - TextPredefs) / 2 + 1
	db LAVENDER_POKECENTER,   SPRITE_FACING_LEFT
	db (LavenderCityPokecenterBenchGuyText_id   - TextPredefs) / 2 + 1
	db VERMILION_POKECENTER,  SPRITE_FACING_LEFT
	db (VermilionCityPokecenterBenchGuyText_id  - TextPredefs) / 2 + 1
	db CELADON_POKECENTER,    SPRITE_FACING_LEFT
	db (CeladonCityPokecenterBenchGuyText_id    - TextPredefs) / 2 + 1
	db CELADON_HOTEL,         SPRITE_FACING_LEFT
	db (CeladonCityHotelText_id                 - TextPredefs) / 2 + 1
	db FUCHSIA_POKECENTER,    SPRITE_FACING_LEFT
	db (FuchsiaCityPokecenterBenchGuyText_id    - TextPredefs) / 2 + 1
	db CINNABAR_POKECENTER,   SPRITE_FACING_LEFT
	db (CinnabarIslandPokecenterBenchGuyText_id - TextPredefs) / 2 + 1
	db SAFFRON_POKECENTER,    SPRITE_FACING_LEFT
	db (SaffronCityPokecenterBenchGuyText_id    - TextPredefs) / 2 + 1
	db MT_MOON_POKECENTER,    SPRITE_FACING_LEFT
	db (MtMoonPokecenterBenchGuyText_id         - TextPredefs) / 2 + 1
	db ROCK_TUNNEL_POKECENTER,SPRITE_FACING_LEFT
	db (RockTunnelPokecenterBenchGuyText_id     - TextPredefs) / 2 + 1
	db $FF

ViridianCityPokecenterBenchGuyText: ; 624a3 (18:64a3)
	TX_FAR _ViridianCityPokecenterGuyText
	db "@"

PewterCityPokecenterBenchGuyText: ; 624a8 (18:64a8)
	TX_FAR _PewterCityPokecenterGuyText
	db "@"

CeruleanCityPokecenterBenchGuyText: ; 624ad (18:64ad)
	TX_FAR _CeruleanPokecenterGuyText
	db "@"

LavenderCityPokecenterBenchGuyText: ; 624b2 (18:64b2)
	TX_FAR _LavenderPokecenterGuyText
	db "@"

MtMoonPokecenterBenchGuyText: ; 624b7 (18:64b7)
	TX_FAR _MtMoonPokecenterBenchGuyText
	db "@"

RockTunnelPokecenterBenchGuyText: ; 624bc (18:64bc)
	TX_FAR _RockTunnelPokecenterGuyText
	db "@"

UnusedBenchGuyText1: ; 624c1 (18:64c1)
	TX_FAR _UnusedBenchGuyText1
	db "@"

UnusedBenchGuyText2: ; 624c6 (18:64c6)
	TX_FAR _UnusedBenchGuyText2
	db "@"

UnusedBenchGuyText3: ; 624cb (18:64cb)
	TX_FAR _UnusedBenchGuyText3
	db "@"

VermilionCityPokecenterBenchGuyText: ; 624d0 (18:64d0)
	TX_FAR _VermilionPokecenterGuyText
	db "@"

CeladonCityPokecenterBenchGuyText: ; 624d5 (18:64d5)
	TX_FAR _CeladonCityPokecenterGuyText
	db "@"

FuchsiaCityPokecenterBenchGuyText: ; 624da (18:64da)
	TX_FAR _FuchsiaCityPokecenterGuyText
	db "@"

CinnabarIslandPokecenterBenchGuyText: ; 624df (18:64df)
	TX_FAR _CinnabarPokecenterGuyText
	db "@"

SaffronCityPokecenterBenchGuyText: ; 624e4 (18:64e4)
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SaffronCityPokecenterBenchGuyText2
	jr nz, .asm_624f2
	ld hl, SaffronCityPokecenterBenchGuyText1
.asm_624f2
	call PrintText
	jp TextScriptEnd

SaffronCityPokecenterBenchGuyText1: ; 624f8 (18:64f8)
	TX_FAR _SaffronCityPokecenterGuyText1
	db "@"

SaffronCityPokecenterBenchGuyText2: ; 624fd (18:64fd)
	TX_FAR _SaffronCityPokecenterGuyText2
	db "@"

CeladonCityHotelText: ; 62502 (18:6502)
	TX_FAR _CeladonCityHotelText
	db "@"

	ret

UnusedPredefText: ; 62508 (18:6508)
	db "@"

PrintBookcaseText: ; 6509 (18:6509)
	call EnableAutoTextBoxDrawing
	tx_pre_jump BookcaseText

BookcaseText: ; 62511 (18:6511)
	TX_FAR _BookcaseText
	db "@"

OpenPokemonCenterPC: ; 62516 (18:6516)
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP ; check to see if player is facing up
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	tx_pre_jump PokemonCenterPCText

PokemonCenterPCText: ; 62529 (18:6529)
	db $F9 ; FuncTX_PokemonCenterPC
