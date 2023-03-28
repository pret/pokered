GymStatues:
; if in a gym and have the corresponding badge, a = GymStatueText2_id and jp PrintPredefTextID
; if in a gym and don't have the corresponding badge, a = GymStatueText1_id and jp PrintPredefTextID
; else ret
	call EnableAutoTextBoxDrawing
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld hl, MapBadgeFlags
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

INCLUDE "data/maps/badge_maps.asm"

GymStatueText1::
	text_asm
	call GetStatueNames
	ld hl, GymStatueText1Text
	rst _PrintText
	rst TextScriptEnd

GymStatueText1Text::
	text_far _GymStatueText1
	text_end

GymStatueText2::
	text_asm
	call GetStatueNames
	ld hl, GymStatueText2Text
	rst _PrintText
	rst TextScriptEnd

GymStatueText2Text::
	text_far _GymStatueText2
	text_end

; PureRGBnote: CHANGED: Previously gym statue name data was loaded by the respective gym's map script into wram, 
; but it was wasteful because it's not even hard to load without even using wram values right when you read the statue.
; this was refactored from some free wram space.

GetStatueNames:
	ld hl, StatueTextMap
	ld a, [wCurMap]
	ld de, 5
	call IsInArray
	ret nc
	inc hl
	push hl
	call GetAddressFromPointer
	ld de, wStringBuffer
	ld bc, 17 ; original byte length of wGymCityName
	ld a, BANK(PewterCityName)
	call FarCopyData2
	pop hl
	inc hl
	inc hl
	call GetAddressFromPointer
	ld d, h
	ld e, l
	ld hl, wcd6d
	jp CopyString

StatueTextMap::
	db PEWTER_GYM, 
	dw PewterCityName, BrockName
	db CERULEAN_GYM,
	dw CeruleanCityName, MistyName
	db VERMILION_GYM,
	dw VermilionCityName, SurgeName
	db CELADON_GYM,
	dw CeladonCityName, ErikaName
	db FUCHSIA_GYM
	dw FuchsiaCityName, KogaName
	db SAFFRON_GYM
	dw SaffronCityName, SabrinaName
	db CINNABAR_GYM
	dw CinnabarIslandName, BlaineName
	db VIRIDIAN_GYM
	dw ViridianCityName, GiovanniName

BrockName: db "BROCK@"
MistyName: db "MISTY@"
SurgeName: db "LT.SURGE@"
ErikaName: db "ERIKA@"
KogaName: db "KOGA@"
SabrinaName: db "SABRINA@"
BlaineName: db "BLAINE@"
GiovanniName: db "GIOVANNI@"
