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
	jr nz, .loop ; player isn't facing the bench guy
	ld a, [hl]
	jp PrintPredefTextID

INCLUDE "data/events/bench_guys.asm"

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
	jr nz, .printText
	ld hl, SaffronCityPokecenterBenchGuyText1
.printText
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
