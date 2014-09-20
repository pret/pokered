GymStatues: ; 62419 (18:6419)
; if in a gym and have the corresponding badge, a = $D and jp PrintPredefTextID
; if in a gym and don’t have the corresponding badge, a = $C and jp PrintPredefTextID
; else ret
	call EnableAutoTextBoxDrawing
	ld a, [wSpriteStateData1 + 9]
	cp $4
	ret nz
	ld hl, .BadgeFlags
	ld a, [W_CURMAP]
	ld b, a
.asm_62429
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .asm_62433 ; 0x6242e $3
	inc hl
	jr .asm_62429 ; 0x62431 $f6
.asm_62433
	ld b, [hl]
	ld a, [wd72a]
	and b
	cp b
	ld a, $d
	jr z, .asm_6243f ; 0x6243b $2
	ld a, $c
.asm_6243f
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
	ld hl, PokeCenterMapIDList
	ld a, [W_CURMAP]
	ld b, a
.asm_62467
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .asm_62472
	inc hl
	inc hl
	jr .asm_62467
.asm_62472
	ld a, [hli]
	ld b, a
	ld a, [wSpriteStateData1 + 9]
	cp b
	jr nz, .asm_62467
	ld a, [hl]
	jp PrintPredefTextID

; format: db map id, 08, text id of PredefTextIDPointerTable
PokeCenterMapIDList: ; 6247e (18:647e)
	db VIRIDIAN_POKECENTER,$08,$0F
	db PEWTER_POKECENTER,$08,$10
	db CERULEAN_POKECENTER,$08,$11
	db LAVENDER_POKECENTER,$08,$12
	db VERMILION_POKECENTER,$08,$13
	db CELADON_POKECENTER,$08,$14
	db CELADON_HOTEL,$08,$15
	db FUCHSIA_POKECENTER,$08,$16
	db CINNABAR_POKECENTER,$08,$17
	db SAFFRON_POKECENTER,$08,$18
	db MT_MOON_POKECENTER,$08,$19
	db ROCK_TUNNEL_POKECENTER,$08,$1A
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
	db $8 ; asm
	ld a, [wd838]
	bit 7, a
	ld hl, SaffronCityPokecenterBenchGuyText2
	jr nz, .asm_624f2 ; 0x624ed $3
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

TerminatorText_62508: ; 62508 (18:6508)
	db "@"

PrintBookcaseText: ; 6509 (18:6509)
	call EnableAutoTextBoxDrawing
	ld a, $e ; BookcaseText
	jp PrintPredefTextID

BookcaseText: ; 62511 (18:6511)
	TX_FAR _BookcaseText
	db "@"

OpenPokemonCenterPC: ; 62516 (18:6516)
	ld a, [wSpriteStateData1 + 9]
	cp $4 ; check to see if player is facing up
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	ld a, $1f ; PredefText1f
	jp PrintPredefTextID

PredefText1f: ; 62529 (18:6529)
	db $F9 ; FuncTX_PokemonCenterPC
