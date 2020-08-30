PrintBenchGuyText:
	call EnableAutoTextBoxDrawing
	ld hl, BenchGuyTextPointers
	ld a, [wCurMap]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .match
	inc hl
	inc hl
	jr .loop
.match
	ld a, [hli]
	ld b, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp b
	jr nz, .loop ; player isn't facing left at the bench guy
	ld a, [hl]
	jp PrintPredefTextID

bench_guy_text: MACRO
	db \1, \2
	db_tx_pre \3
ENDM

BenchGuyTextPointers:
	; map id, player facing direction, predef text
	bench_guy_text VIRIDIAN_POKECENTER,    SPRITE_FACING_LEFT, ViridianCityPokecenterBenchGuyText
	bench_guy_text PEWTER_POKECENTER,      SPRITE_FACING_LEFT, PewterCityPokecenterBenchGuyText
	bench_guy_text CERULEAN_POKECENTER,    SPRITE_FACING_LEFT, CeruleanCityPokecenterBenchGuyText
	bench_guy_text LAVENDER_POKECENTER,    SPRITE_FACING_LEFT, LavenderCityPokecenterBenchGuyText
	bench_guy_text VERMILION_POKECENTER,   SPRITE_FACING_LEFT, VermilionCityPokecenterBenchGuyText
	bench_guy_text CELADON_POKECENTER,     SPRITE_FACING_LEFT, CeladonCityPokecenterBenchGuyText
	bench_guy_text CELADON_HOTEL,          SPRITE_FACING_LEFT, CeladonCityHotelText
	bench_guy_text FUCHSIA_POKECENTER,     SPRITE_FACING_LEFT, FuchsiaCityPokecenterBenchGuyText
	bench_guy_text CINNABAR_POKECENTER,    SPRITE_FACING_LEFT, CinnabarIslandPokecenterBenchGuyText
	bench_guy_text SAFFRON_POKECENTER,     SPRITE_FACING_LEFT, SaffronCityPokecenterBenchGuyText
	bench_guy_text MT_MOON_POKECENTER,     SPRITE_FACING_LEFT, MtMoonPokecenterBenchGuyText
	bench_guy_text ROCK_TUNNEL_POKECENTER, SPRITE_FACING_LEFT, RockTunnelPokecenterBenchGuyText
	db -1 ; end

ViridianCityPokecenterBenchGuyText::
	text_far _ViridianCityPokecenterGuyText
	text_end

PewterCityPokecenterBenchGuyText::
	text_far _PewterCityPokecenterGuyText
	text_end

CeruleanCityPokecenterBenchGuyText::
	text_far _CeruleanPokecenterGuyText
	text_end

LavenderCityPokecenterBenchGuyText::
	text_far _LavenderPokecenterGuyText
	text_end

MtMoonPokecenterBenchGuyText::
	text_far _MtMoonPokecenterBenchGuyText
	text_end

RockTunnelPokecenterBenchGuyText::
	text_far _RockTunnelPokecenterGuyText
	text_end

UnusedBenchGuyText1::
	text_far _UnusedBenchGuyText1
	text_end

UnusedBenchGuyText2::
	text_far _UnusedBenchGuyText2
	text_end

UnusedBenchGuyText3::
	text_far _UnusedBenchGuyText3
	text_end

VermilionCityPokecenterBenchGuyText::
	text_far _VermilionPokecenterGuyText
	text_end

CeladonCityPokecenterBenchGuyText::
	text_far _CeladonCityPokecenterGuyText
	text_end

FuchsiaCityPokecenterBenchGuyText::
	text_far _FuchsiaCityPokecenterGuyText
	text_end

CinnabarIslandPokecenterBenchGuyText::
	text_far _CinnabarPokecenterGuyText
	text_end

SaffronCityPokecenterBenchGuyText::
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SaffronCityPokecenterBenchGuyText2
	jr nz, .asm_624f2
	ld hl, SaffronCityPokecenterBenchGuyText1
.asm_624f2
	call PrintText
	jp TextScriptEnd

SaffronCityPokecenterBenchGuyText1:
	text_far _SaffronCityPokecenterGuyText1
	text_end

SaffronCityPokecenterBenchGuyText2:
	text_far _SaffronCityPokecenterGuyText2
	text_end

CeladonCityHotelText::
	text_far _CeladonCityHotelText
	text_end
