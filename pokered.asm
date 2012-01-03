INCLUDE "constants.asm"

; the rst vectors are unused
SECTION "rst00",HOME[0]
	db $FF
SECTION "rst08",HOME[8]
	db $FF
SECTION "rst10",HOME[$10]
	db $FF
SECTION "rst18",HOME[$18]
	db $FF
SECTION "rst20",HOME[$20]
	db $FF
SECTION "rst28",HOME[$28]
	db $FF
SECTION "rst30",HOME[$30]
	db $FF
SECTION "rst38",HOME[$38]
	db $FF

; interrupts
SECTION "vblank",HOME[$40]
	jp $2024
SECTION "lcdc",HOME[$48]
	db $FF
SECTION "timer",HOME[$50]
	jp $2306
SECTION "serial",HOME[$58]
	jp $2125
SECTION "joypad",HOME[$60]
	reti

SECTION "bank0",HOME[$61]
DisableLCD:
;$0061
	xor a
	ld [$ff0f],a
	ld a,[$ffff]
	ld b,a
	res 0,a
	ld [$ffff],a
.jr0\@
	ld a,[$ff44]
	cp a,$91
	jr nz,.jr0\@
	ld a,[$ff40]
	and a,$7f	; res 7,a
	ld [$ff40],a
	ld a,b
	ld [$ffff],a
	ret

EnableLCD:
;$007b
	ld a,[$ff40]
	set 7,a
	ld [$ff40],a
	ret

CleanLCD_OAM:
;$0082
	xor a
	ld hl,$c300
	ld b,$a0
.jr0\@
	ld [hli],a
	dec b
	jr nz,.jr0\@
	ret

ResetLCD_OAM:
;$008d
	ld a,$a0
	ld hl,$c300
	ld de,$0004
	ld b,$28
.jr0\@
	ld [hl],a
	add hl,de
	dec b
	jr nz,.jr0\@
	ret

FarCopyData: ; 009D
; copy bc bytes of data from a:hl to de
	ld [$CEE9],a ; save future bank # for later
	ld a,[$FFB8] ; get current bank #
	push af
	ld a,[$CEE9] ; get future bank #, switch
	ld [$FFB8],a
	ld [$2000],a
	call CopyData
	pop af       ; okay, done, time to switch back
	ld [$FFB8],a
	ld [$2000],a
	ret
CopyData: ; 00B5
; copy bc bytes of data from hl to de
	ld a,[hli]
	ld [de],a
	inc de
	dec bc
	ld a,c
	or b
	jr nz,CopyData
	ret


SECTION "romheader",HOME[$100]
nop
jp Start

Section "start",HOME[$150]
Start:
INCBIN "baserom.gbc",$150,$1AE - $150
; see also MapHeaderBanks
MapHeaderPointers: ; $01AE
	dw PalletTown_h ; PALLET_TOWN
	dw ViridianCity_h ; VIRIDIAN_CITY
	dw PewterCity_h ; PEWTER_CITY
	dw CeruleanCity_h ; CERULEAN_CITY
	dw LavendarTown_h ; LAVENDER_TOWN
	dw VermilionCity_h ; VERMILION_CITY
	dw CeladonCity_h ; CELADON_CITY
	dw FuchsiaCity_h ; FUCHSIA_CITY
	dw CinnabarIsland_h ; CINNABAR_ISLAND
	dw $491e ; INDIGO_PLATEAU
	dw $49a4 ; SAFFRON_CITY
	dw $49a4 ; unused
	dw Route1_h ; ROUTE_1
	dw $4000 ; ROUTE_2
	dw $41e6 ; ROUTE_3
	dw $4390 ; ROUTE_4
	dw $4581 ; ROUTE_5
	dw $4000 ; ROUTE_6
	dw Route7_h ; ROUTE_7
	dw $412d ; ROUTE_8
	dw $4686 ; ROUTE_9
	dw $42d4 ; ROUTE_10
	dw $44be ; ROUTE_11
	dw $466d ; ROUTE_12
	dw $480c ; ROUTE_13
	dw $4999 ; ROUTE_14
	dw $492c ; ROUTE_15
	dw $4ada ; ROUTE_16
	dw $4b20 ; ROUTE_17
	dw $4c38 ; ROUTE_18
	dw $4e78 ; ROUTE_19
	dw $40f1 ; ROUTE_20
	dw $4fff ; ROUTE_21
	dw $4000 ; ROUTE_22
	dw $433f ; ROUTE_23
	dw $4682 ; ROUTE_24
	dw $479b ; ROUTE_25
	dw RedsHouse1F_h
	dw RedsHouse2F_h
	dw BluesHouse_h
	dw OaksLab_h
	dw ViridianPokeCenter_h
	dw ViridianMart_h
	dw School_h
	dw ViridianHouse_h
	dw $4897
	dw DiglettsCaveRoute2_h
	dw $557b
	dw Route2House_h
	dw $55c8
	dw $5650
	dw $5101
	dw $40eb
	dw $430b
	dw $437b
	dw PewterHouse1_h
	dw $4ca1
	dw PewterHouse2_h
	dw $457b
	dw $59bc
	dw $5a36
	dw $5cff
	dw CeruleanHouseTrashed_h
	dw CeruleanHouse2_h
	dw $4639
	dw $46a7
	dw BikeShop_h
	dw $4889
	dw MtMoonPokecenter_h
	dw CeruleanHouseTrashed_h ; copy of map 62
	dw Route5Gate_h
	dw $569d
	dw $6243
	dw Route6Gate_h
	dw $56e3
	dw $56e3
	dw Route7Gate_h
	dw $5720
	dw $575d
	dw Route8Gate_h
	dw UndergroundPathEntranceRoute8_h
	dw $53ae
	dw RockTunnel1_h
	dw PowerPlant_h
	dw $5400
	dw DiglettsCaveEntranceRoute11_h
	dw $5448
	dw $54f8
	dw BillsHouse_h
	dw $4983
	dw $5b64
	dw $49d5
	dw $4a1a
	dw VermilionHouse1_h
	dw VermilionDock_h
	dw $5259
	dw $5393
	dw SSAnne3_h
	dw $5622
	dw $56a2
	dw $57a7
	dw $5889
	dw $596a
	dw $5b3f
	dw $5d49
	dw $62a2
	dw $62a2
	dw $62a2
	dw $59fe
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $6492
	dw $5f1a
	dw $5f11
	dw $5f3e
	dw $4f7a
	dw $60e9
	dw CeladonMart3_h
	dw CeladonMart4_h
	dw CeladonMart5_h
	dw CeladonMart6_h
	dw CeladonMansion1_h
	dw CeladonMansion2_h
	dw CeladonMansion3_h
	dw CeladonMansion4_h
	dw CeladonMansion5_h
	dw CeladonPokecenter_h
	dw CeladonGYM_h
	dw CeladonGameCorner_h
	dw CeladonHouse_h
	dw CeladonPrizeRoom_h
	dw CeladonDiner_h
	dw CeladonHouse2_h
	dw CeladonHotel_h
	dw $48ce
	dw $4420
	dw $44e6
	dw $46c0
	dw $47ea
	dw $4926
	dw $4ae3
	dw $4cf9
	dw LavenderHouse1_h
	dw $4920
	dw LavenderHouse2_h
	dw FuchsiaMart_h
	dw $500c
	dw $5057
	dw $50a9
	dw $51c1
	dw $5431
	dw $56d7
	dw SeafoamIslands2_h
	dw SeafoamIslands3_h
	dw SeafoamIslands4_h
	dw SeafoamIslands5_h
	dw $6064
	dw $6170
	dw Mansion1_h
	dw $573e
	dw $5b80
	dw $5c15
	dw $5c7b
	dw $5d25
	dw $5e20
	dw $5e72
	dw $5e72
	dw IndigoPlateauLobby_h 
	dw $5eb7
	dw $4c65
	dw $4d51
	dw $5001
	dw SaffronHouse1_h
	dw $53fd
	dw $5442
	dw $5529
	dw SaffronHouse2_h
	dw $55f6
	dw $563e
	dw $56b2
	dw $57ff
	dw Route16House_h
	dw $6473
	dw $586a
	dw $5969
	dw SeafoamIslands1_h
	dw Route22Gate_h
	dw $5791
	dw $5554
	dw VermilionHouse3_h
	dw $5f62
	dw VictoryRoad3_h
	dw RocketHideout1_h
	dw RocketHideout2_h
	dw RocketHideout3_h
	dw RocketHideout4_h
	dw RocketHideoutElevator_h
	dw $5704
	dw $5704
	dw $5704
	dw $5ce5
	dw $5f4f
	dw SilphCo4_h
	dw SilphCo5_h
	dw SilphCo6_h
	dw $5b55
	dw $64f8
	dw $5fcc
	dw $61e2
	dw $63ad
	dw SafariZoneEast_h
	dw SafariZoneNorth_h
	dw $61a9
	dw SafariZoneCenter_h
	dw SafariZoneRestHouse1_h
	dw $630b
	dw SafariZoneRestHouse2_h
	dw SafariZoneRestHouse3_h
	dw SafariZoneRestHouse4_h
	dw UnknownDungeon2_h
	dw UnknownDungeon3_h
	dw $4d00
	dw NameRater_h
	dw $4dfd
	dw $56b2
	dw RockTunnel2_h
	dw $57af
	dw $612d
	dw $60ee
	dw SilphCoElevator_h
	dw $5ce5
	dw $5ce5
	dw $7d04
	dw $7d71
	dw $5CE5
	dw $5CE5
	dw $5CE5
	dw $5CE5
	dw $616F
	dw $62CA
	dw $6421

INCBIN "baserom.gbc",$39E,$1627 - $39E

;XXX what does this do
;XXX what points to this
; offset 1627
	ld bc,$D0B8
	add hl,bc
	ld a,[hli]
	ld [$D0AB],a
	ld a,[hl]
	ld [$D0AC],a

; offset 1633
; define (by index number) the bank that a pokemon's image is in
; index = Mew, bank 1
; index = Kabutops fossil, bank $B
;	index < $1F, bank 9
; $1F ≤ index < $4A, bank $A
; $4A ≤ index < $74, bank $B
; $74 ≤ index < $99, bank $C
; $99 ≤ index,       bank $D
	ld a,[$CF91] ; XXX name for this ram location
	ld b,a
	cp $15
	ld a,$01
	jr z,.GotBank\@
	ld a,b
	cp $B6
	ld a,$0B
	jr z,.GotBank\@
	ld a,b
	cp $1F
	ld a,$09
	jr c,.GotBank\@
	ld a,b
	cp $4A
	ld a,$0A
	jr c,.GotBank\@
	ld a,b
	cp $74
	ld a,$0B
	jr c,.GotBank\@
	ld a,b
	cp $99
	ld a,$0C
	jr c,.GotBank\@
	ld a,$0D
.GotBank\@
	jp $24FD

INCBIN "baserom.gbc",$1665,$172F - $1665

Tset0B_Coll:
	INCBIN "baserom.gbc",$172F,$1735-$172F
Tset00_Coll:
	INCBIN "baserom.gbc",$1735,$1749-$1735
Tset01_Coll:
	INCBIN "baserom.gbc",$1749,$1753-$1749
Tset02_Coll:
	INCBIN "baserom.gbc",$1753,$1759-$1753
Tset05_Coll:
	INCBIN "baserom.gbc",$1759,$1765-$1759
Tset03_Coll:
	INCBIN "baserom.gbc",$1765,$1775-$1765
Tset08_Coll:
	INCBIN "baserom.gbc",$1775,$177F-$1775
Tset09_Coll:
	INCBIN "baserom.gbc",$177F,$178A-$177F
Tset0D_Coll:
	INCBIN "baserom.gbc",$178A,$1795-$178A
Tset0E_Coll:
	INCBIN "baserom.gbc",$1795,$179A-$1795
Tset0F_Coll:
	INCBIN "baserom.gbc",$179A,$17A2-$179A
Tset10_Coll:
	INCBIN "baserom.gbc",$17A2,$17AC-$17A2
Tset11_Coll:
	INCBIN "baserom.gbc",$17AC,$17B8-$17AC
Tset12_Coll:
	INCBIN "baserom.gbc",$17B8,$17C0-$17B8
Tset13_Coll:
	INCBIN "baserom.gbc",$17C0,$17CA-$17C0
Tset14_Coll:
	INCBIN "baserom.gbc",$17CA,$17D1-$17CA
Tset15_Coll:
	INCBIN "baserom.gbc",$17D1,$17DD-$17D1
Tset16_Coll:
	INCBIN "baserom.gbc",$17DD,$17F0-$17DD
Tset17_Coll:
	INCBIN "baserom.gbc",$17F0,$190F-$17F0

ClearScreen: ; 190F
; clears all tiles in the tilemap,
; then wait three frames
	ld bc,$0168 ; tilemap size
	inc b
	ld hl,$C3A0 ; TILEMAP_START
	ld a,$7F    ; $7F is blank tile
.loop\@
	ld [hli],a
	dec c
	jr nz,.loop\@
	dec b
	jr nz,.loop\@
	jp Delay3

TextBoxBorder: ; 1922
; draw a text box
; upper-left corner at coordinates hl
; height b
; width c

	; first row
	push hl
	ld a,"┌"
	ld [hli],a
	inc a    ; horizontal border ─
	call NPlaceChar
	inc a    ; upper-right border ┐
	ld [hl],a

	; middle rows
	pop hl
	ld de,20
	add hl,de ; skip the top row

.PlaceRow\@
	push hl
	ld a,"│"
	ld [hli],a
	ld a," "
	call NPlaceChar
	ld [hl],"│"

	pop hl
	ld de,20
	add hl,de ; move to next row
	dec b
	jr nz,.PlaceRow\@

	; bottom row
	ld a,"└"
	ld [hli],a
	ld a,"─"
	call NPlaceChar
	ld [hl],"┘"
	ret
;
NPlaceChar:
; place a row of width c of identical characters
	ld d,c
.loop\@
	ld [hli],a
	dec d
	jr nz,.loop\@
	ret

PlaceString: ; 1955
	push hl
PlaceNextChar: ; 1956
	ld a,[de]

	cp "@"
	jr nz,.PlaceText\@
	ld b,h
	ld c,l
	pop hl
	ret

.PlaceText\@
	cp $4E
	jr nz,.next\@
	ld bc,$0028
	ld a,[$FFF6]
	bit 2,a
	jr z,.next2\@
	ld bc,$14
.next2\@
	pop hl
	add hl,bc
	push hl
	jp Next19E8

.next\@
	cp $4F
	jr nz,.next3\@
	pop hl
	ld hl,$C4E1
	push hl
	jp Next19E8

.next3\@ ; Check against a dictionary
	and a
	jp z,Char00
	cp $4C
	jp z,$1B0A
	cp $4B
	jp z,Char4B
	cp $51
	jp z,Char51
	cp $49
	jp z,Char49
	cp $52
	jp z,Char52
	cp $53
	jp z,Char53
	cp $54
	jp z,Char54
	cp $5B
	jp z,Char5B
	cp $5E
	jp z,Char5E
	cp $5C
	jp z,Char5C
	cp $5D
	jp z,Char5D
	cp $55
	jp z,$1A7C
	cp $56
	jp z,Char56
	cp $57
	jp z,$1AAD
	cp $58
	jp z,Char58
	cp $4A
	jp z,Char4A
	cp $5F
	jp z,Char5F
	cp $59
	jp z,Char59
	cp $5A
	jp z,Char5A
	ld [hli],a
	call $38D3
Next19E8:
	inc de
	jp PlaceNextChar

Char00:
	ld b,h
	ld c,l
	pop hl
	ld de,Char00Text
	dec de
	ret

Char00Text: ; “%d ERROR.”
	TX_FAR _Char00Text
	db "@"

Char52: ; player’s name
	push de
	ld de,W_PLAYERNAME
	jr FinishDTE

Char53: ; rival’s name
	push de
	ld de,W_RIVALNAME
	jr FinishDTE

Char5D: ; TRAINER
	push de
	ld de,Char5DText
	jr FinishDTE

Char5C: ; TM
	push de
	ld de,Char5CText
	jr FinishDTE

Char5B: ; PC
	push de
	ld de,Char5BText
	jr FinishDTE

Char5E: ; ROCKET
	push de
	ld de,Char5EText
	jr FinishDTE

Char54: ; POKé
	push de
	ld de,Char54Text
	jr FinishDTE

Char56: ; ……
	push de
	ld de,Char56Text
	jr FinishDTE

Char4A: ; PKMN
	push de
	ld de,Char4AText
	jr FinishDTE

Char59:
; depending on whose turn it is, print
; enemy active monster’s name, prefixed with “Enemy ”
; or
; player active monster’s name
; (like Char5A but flipped)
	ld a,[H_WHOSETURN]
	xor 1
	jr MonsterNameCharsCommon

Char5A:
; depending on whose turn it is, print
; player active monster’s name
; or
; enemy active monster’s name, prefixed with “Enemy ”
	ld a,[H_WHOSETURN]
MonsterNameCharsCommon:
	push de
	and a
	jr nz,.Enemy\@
	ld de,$D009 ; player active monster name
	jr FinishDTE

.Enemy\@ ; 1A40
	; print “Enemy ”
	ld de,Char5AText
	call PlaceString

	ld h,b
	ld l,c
	ld de,$CFDA ; enemy active monster name

FinishDTE:
	call PlaceString
	ld h,b
	ld l,c
	pop de
	inc de
	jp PlaceNextChar

Char5CText:
	db "TM@"
Char5DText:
	db "TRAINER@"
Char5BText:
	db "PC@"
Char5EText:
	db "ROCKET@"
Char54Text:
	db "POKé@"
Char56Text:
	db "……@"
Char5AText:
	db "Enemy @"
Char4AText:
	db $E1,$E2,"@" ; PKMN

Char55:
	push de
	ld b,h
	ld c,l
	ld hl,Char55Text
	call $1B40
	ld h,b
	ld l,c
	pop de
	inc de
	jp PlaceNextChar

Char55Text:
; equivalent to Char4B
	TX_FAR _Char55Text
	db "@"

Char5F:
; ends a Pokédex entry
	ld [hl],"."
	pop hl
	ret

Char58:
	ld a,[$D12B]
	cp 4
	jp z,Next1AA2
	ld a,$EE
	ld [$C4F2],a
Next1AA2:
	call ProtectedDelay3
	call $3898
	ld a,$7F
	ld [$C4F2],a
	pop hl
	ld de,Char58Text
	dec de
	ret

Char58Text:
	db "@"

Char51:
	push de
	ld a,$EE
	ld [$C4F2],a
	call ProtectedDelay3
	call $3898
	ld hl,$C4A5
	ld bc,$0412
	call $18C4
	ld c,$14
	call DelayFrames
	pop de
	ld hl,$C4B9
	jp Next19E8

Char49:
	push de
	ld a,$EE
	ld [$C4F2],a
	call ProtectedDelay3
	call $3898
	ld hl,$C469
	ld bc,$0712
	call $18C4
	ld c,$14
	call DelayFrames
	pop de
	pop hl
	ld hl,$C47D
	push hl
	jp Next19E8

Char4B:
	ld a,$EE
	ld [$C4F2],a
	call ProtectedDelay3
	push de
	call $3898
	pop de
	ld a,$7F
	ld [$C4F2],a
	push de
	call Next1B18
	call Next1B18
	ld hl,$C4E1
	pop de
	jp Next19E8

Next1B18:
	ld hl,$C4B8
	ld de,$C4A4
	ld b,$3C
.next\@
	ld a,[hli]
	ld [de],a
	inc de
	dec b
	jr nz,.next\@
	ld hl,$C4E1
	ld a,$7F
	ld b,$12
.next2\@
	ld [hli],a
	dec b
	jr nz,.next2\@

	; wait five frames
	ld b,5
.WaitFrame\@
	call DelayFrame
	dec b
	jr nz,.WaitFrame\@

	ret

ProtectedDelay3:
	push bc
	call Delay3
	pop bc
	ret

INCBIN "baserom.gbc",$1B40,$20AF - $1B40

DelayFrame: ; 20AF
; delay for one frame
	ld a,1
	ld [$FFD6],a

; wait for the next Vblank, halting to conserve battery
.halt\@
	db $76 ; XXX this is a hack--rgbasm adds a nop after this instr
	       ; even when ints are enabled
	ld a,[$FFD6]
	and a
	jr nz,.halt\@

	ret

; These routines manage gradual fading
; (e.g., entering a doorway)
LoadGBPal: ; 20BA
	ld a,[$d35d]		;tells if cur.map is dark
	ld b,a			;(requires HM5_FLASH?)
	ld hl,GBPalTable_00	;16
	ld a,l
	sub b
	ld l,a
	jr nc,.jr0\@
	dec h
.jr0\@
	ld a,[hli]
	ld [rBGP],a
	ld a,[hli]
	ld [rOBP0],a
	ld a,[hli]
	ld [rOBP1],a
	ret

GBFadeOut1: ; 20D1
	ld hl,IncGradGBPalTable_01	;0d
	ld b,$04
	jr GBFadeOutCommon

GBFadeOut2: ; 20D8
	ld hl,IncGradGBPalTable_02	;1c
	ld b,$03

GBFadeOutCommon:
	ld a,[hli]
	ld [rBGP],a
	ld a,[hli]
	ld [rOBP0],a
	ld a,[hli]
	ld [rOBP1],a
	ld c,8
	call DelayFrames
	dec b
	jr nz,GBFadeOutCommon
	ret

GBFadeIn1: ; 20EF
	ld hl,DecGradGBPalTable_01	;18
	ld b,$04
	jr GBFadeInCommon

GBFadeIn2: ; 20F6
	ld hl,DecGradGBPalTable_02	;21
	ld b,$03

GBFadeInCommon:
	ld a,[hld]
	ld [rOBP1],a
	ld a,[hld]
	ld [rOBP0],a
	ld a,[hld]
	ld [rBGP],a
	ld c,8
	call DelayFrames
	dec b
	jr nz,GBFadeInCommon
	ret

IncGradGBPalTable_01: ; 210D
	db %11111111	;BG Pal
	db %11111111	;OBJ Pal 1
	db %11111111	;OBJ Pal 2
			;and so on...
	db %11111110
	db %11111110
	db %11111000

	db %11111001
	db %11100100
	db %11100100
GBPalTable_00:		;16
	db %11100100
	db %11010000
DecGradGBPalTable_01:	;18
	db %11100000
	;19
	db %11100100
	db %11010000
	db %11100000
IncGradGBPalTable_02:	;1c
	db %10010000
	db %10000000
	db %10010000

	db %01000000
	db %01000000
DecGradGBPalTable_02:	;21
	db %01000000

	db %00000000
	db %00000000
	db %00000000

INCBIN "baserom.gbc",$2125,$2442 - $2125

; XXX where is the pointer to this data?
MartInventories: ; 2442
	; first byte $FE, next byte # of items, last byte $FF
; Viridian
	db $FE,4,POKE_BALL,ANTIDOTE,PARLYZ_HEAL,BURN_HEAL,$FF
; Pewter
	db $FE,7,POKE_BALL,POTION,ESCAPE_ROPE,ANTIDOTE,BURN_HEAL,AWAKENING
	db PARLYZ_HEAL,$FF
; Cerulean
	db $FE,7,POKE_BALL,POTION,REPEL,ANTIDOTE,BURN_HEAL,AWAKENING
	db PARLYZ_HEAL,$FF
; Bike shop
	db $FE,1,BICYCLE,$FF
; Vermilion
	db $FE,6,POKE_BALL,SUPER_POTION,ICE_HEAL,AWAKENING,PARLYZ_HEAL
	db REPEL,$FF
; Lavender
	db $FE,9,GREAT_BALL,SUPER_POTION,REVIVE,ESCAPE_ROPE,SUPER_REPEL
	db ANTIDOTE,BURN_HEAL,ICE_HEAL,PARLYZ_HEAL,$FF
; Celadon Dept. Store 2F (1)
	db $FE,9,GREAT_BALL,SUPER_POTION,REVIVE,SUPER_REPEL,ANTIDOTE
	db BURN_HEAL,ICE_HEAL,AWAKENING,PARLYZ_HEAL,$FF
; Celadon Dept. Store 2F (2)
	db $FE,9,TM_32,TM_33,TM_02,TM_07,TM_37,TM_01,TM_05,TM_09,TM_17,$FF
; Celadon Dept. Store 4F
	db $FE,5,POKE_DOLL,FIRE_STONE,THUNDER_STONE,WATER_STONE,LEAF_STONE,$FF
; Celadon Dept. Store 5F (1)
	db $FE,7,X_ACCURACY,GUARD_SPEC_,DIRE_HIT,X_ATTACK,X_DEFEND,X_SPEED
	db X_SPECIAL,$FF
; Celadon Dept. Store 5F (2)
	db $FE,5,HP_UP,PROTEIN,IRON,CARBOS,CALCIUM,$FF
; Fuchsia
	db $FE,6,ULTRA_BALL,GREAT_BALL,SUPER_POTION,REVIVE,FULL_HEAL
	db SUPER_REPEL,$FF
; unused?
	db $FE,5,GREAT_BALL,HYPER_POTION,SUPER_POTION,FULL_HEAL,REVIVE,$FF
; Cinnabar
	db $FE,7,ULTRA_BALL,GREAT_BALL,HYPER_POTION,MAX_REPEL,ESCAPE_ROPE
	db FULL_HEAL,REVIVE,$FF
; Saffron
	db $FE,6,GREAT_BALL,HYPER_POTION,MAX_REPEL,ESCAPE_ROPE,FULL_HEAL
	db REVIVE,$FF
; Indigo
	db $FE,7,ULTRA_BALL,GREAT_BALL,FULL_RESTORE,MAX_POTION,FULL_HEAL
	db REVIVE,MAX_REPEL,$FF

INCBIN "baserom.gbc",$24D6,$2FCF - $24D6

GetItemName: ; 2FCF
; given an item ID at [$D11E], store the name of the item into a string
;     starting at $CD6D
	push hl
	push bc
	ld a,[$D11E]
	cp HM_01 ; is this a TM/HM?
	jr nc,.Machine\@

	ld [$D0B5],a
	ld a,ITEM_NAME
	ld [$D0B6],a
	ld a,BANK(ItemNames)
	ld [$D0B7],a
	call GetName
	jr .Finish\@

.Machine\@
	call GetMachineName
.Finish\@
	ld de,$CD6D ; pointer to where item name is stored in RAM
	pop bc
	pop hl
	ret

GetMachineName:
; copies the name of the TM/HM in [$D11E] to $CD6D
	push hl
	push de
	push bc
	ld a,[$D11E]
	push af
	cp TM_01 ; is this a TM? [not HM]
	jr nc,.WriteTM\@
; if HM, then write "HM" and add 5 to the item ID, so we can reuse the
; TM printing code
	add 5
	ld [$D11E],a
	ld hl,HiddenPrefix ; points to "HM"
	ld bc,2
	jr .WriteMachinePrefix\@
.WriteTM\@
	ld hl,TechnicalPrefix ; points to "TM"
	ld bc,2
.WriteMachinePrefix\@
	ld de,$CD6D
	call CopyData

; now get the machine number and convert it to text
	ld a,[$D11E]
	sub TM_01 - 1
	ld b,$F6 ; "0"
.FirstDigit\@
	sub 10
	jr c,.SecondDigit\@
	inc b
	jr .FirstDigit\@
.SecondDigit\@
	add 10
	push af
	ld a,b
	ld [de],a
	inc de
	pop af
	ld b,$F6 ; "0"
	add b
	ld [de],a
	inc de
	ld a,"@"
	ld [de],a

	pop af
	ld [$D11E],a
	pop bc
	pop de
	pop hl
	ret

TechnicalPrefix:
	db "TM"
HiddenPrefix:
	db "HM"

INCBIN "baserom.gbc",$3040,$3493 - $3040

Function3493: ; 3493
; XXX what does this do
; related to Pokémon Tower and ghosts
	ld a,$1C
	call Predef
	ld a,b
	and a
	ret

INCBIN "baserom.gbc",$349B,$3541 - $349B

Function3541: ; 3541
; XXX what do these three functions do
	push hl
	call Function354E
	ld [hl],$FF
	call Function3558
	ld [hl],$FF
	pop hl
	ret

Function354E: ; 354E
	ld h,$C2
	ld a,[$FF8C] ; the sprite to move
	swap a
	add a,6
	ld l,a
	ret

Function3558: ; 3558
	push de
	ld hl,$D4E4
	ld a,[$FF8C] ; the sprite to move
	dec a
	add a
	ld d,0
	ld e,a
	add hl,de
	pop de
	ret

INCBIN "baserom.gbc",$3566,$35BC - $3566

BankswitchHome: ; 35BC
; switches to bank # in a
; Only use this when in the home bank!
	ld [$CF09],a
	ld a,[$FFB8]
	ld [$CF08],a
	ld a,[$CF09]
	ld [$FFB8],a
	ld [$2000],a
	ret

BankswitchBack: ; 35CD
; returns from BankswitchHome
	ld a,[$CF08]
	ld [$FFB8],a
	ld [$2000],a
	ret

Bankswitch: ; 35D6
; self-contained bankswitch, use this when not in the home bank
; switches to the bank in b
	ld a,[$FFB8]
	push af
	ld a,b
	ld [$FFB8],a
	ld [$2000],a
	ld bc,.Return\@
	push bc
	jp [hl]
.Return\@
	pop bc
	ld a,b
	ld [$FFB8],a
	ld [$2000],a
	ret

INCBIN "baserom.gbc",$35EC,$363A - $35EC

MoveSprite: ; 363A
; move the sprite [$FF8C] with the movement pointed to by de
; actually only copies the movement data to $CC5B for later
	call Function3541
	push hl
	push bc
	call Function354E
	xor a
	ld [hl],a
	ld hl,$CC5B
	ld c,0

.loop\@
	ld a,[de]
	ldi [hl],a
	inc de
	inc c
	cp a,$FF ; have we reached the end of the movement data?
	jr nz,.loop\@

	ld a,c
	ld [$CF0F],a ; number of steps taken

	pop bc
	ld hl,$D730
	set 0,[hl]
	pop hl
	xor a
	ld [$CD3B],a
	ld [$CCD3],a
	dec a
	ld [$CD6B],a
	ld [$CD3A],a
	ret

INCBIN "baserom.gbc",$366B,$3739 - $366B

DelayFrames: ; 3739
; wait n frames, where n is the value in c
	call DelayFrame
	dec c
	jr nz,DelayFrames
	ret

INCBIN "baserom.gbc",$3740,$375D - $3740

NamePointers: ; 375D
	dw MonsterNames
	dw MoveNames
	dw UnusedNames
	dw ItemNames
	dw $D273 ; player's OT names list
	dw $D9AC ; enemy's OT names list
	dw TrainerNames

GetName: ; 376B
; arguments:
; [$D0B5] = which name
; [$D0B6] = which list
; [$D0B7] = bank of list
;
; returns pointer to name in de
	ld a,[$d0b5]
	ld [$d11e],a
	cp a,$C4        ;it's TM/HM
	jp nc,GetMachineName
	ld a,[$ffb8]
	push af
	push hl
	push bc
	push de
	ld a,[$d0b6]    ;List3759_entrySelector
	dec a
	jr nz,.otherEntries\@
	;1 = MON_NAMES
	call $2f9e; GetMonName
	ld hl,11
	add hl,de
	ld e,l
	ld d,h
	jr .gotPtr\@
.otherEntries\@ ;$378d
	;2-7 = OTHER ENTRIES
	ld a,[$d0b7]
	ld [$ffb8],a
	ld [$2000],a
	ld a,[$d0b6]    ;VariousNames' entryID
	dec a
	add a
	ld d,0
	ld e,a
	jr nc,.skip\@
	inc d
.skip\@ ;$37a0
	ld hl,NamePointers
	add hl,de
	ld a,[hli]
	ld [$ff96],a
	ld a,[hl]
	ld [$ff95],a
	ld a,[$ff95]
	ld h,a
	ld a,[$ff96]
	ld l,a
	ld a,[$d0b5]
	ld b,a
	ld c,0
.nextName\@
	ld d,h
	ld e,l
.nextChar\@
	ld a,[hli]
	cp a,$50
	jr nz,.nextChar\@
	inc c           ;entry counter
	ld a,b          ;wanted entry
	cp c
	jr nz,.nextName\@
	ld h,d
	ld l,e
	ld de,$cd6d
	ld bc,$0014
	call CopyData
.gotPtr\@       ;$37cd
	ld a,e
	ld [$cf8d],a
	ld a,d
	ld [$cf8e],a
	pop de
	pop bc
	pop hl
	pop af
	ld [$ffb8],a
	ld [$2000],a
	ret

INCBIN "baserom.gbc",$37DF,$3A87 - $37DF

AddNTimes: ; 3A87
; add bc to hl a times
	and a
	ret z
.loop\@
	add hl,bc
	dec a
	jr nz,.loop\@
	ret

INCBIN "baserom.gbc",$3A8E,$3C49 - $3A8E

PrintText: ; 3C49
; given a pointer in hl, print the text there
	push hl
	ld a,1
	ld [$D125],a
	call $30E8
	call $2429
	call Delay3
	pop hl
	ld bc,$C4B9
	jp $1B40

Func3C5F: ; 3C5F
	push bc
	xor a
	ld [$FF95],a
	ld [$FF96],a
	ld [$FF97],a
	ld a,b
	and $F
	cp 1
	jr z,.next\@
	cp 2
	jr z,.next2\@
	ld a,[de]
	ld [$FF96],a
	inc de
	ld a,[de]
	ld [$FF97],a
	inc de
	ld a,[de]
	ld [$FF98],a
	jr .next3\@

.next2\@
	ld a,[de]
	ld [$FF97],a
	inc de
	ld a,[de]
	ld [$FF98],a
	jr .next3\@

.next\@
	ld a,[de]
	ld [$FF98],a

.next3\@
	push de
	ld d,b
	ld a,c
	ld b,a
	xor a
	ld c,a
	ld a,b
	cp 2
	jr z,.next4\@
	cp 3
	jr z,.next5\@
	cp 4
	jr z,.next6\@
	cp 5
	jr z,.next7\@
	cp 6
	jr z,.next8\@
	ld a,$F
	ld [$FF99],a
	ld a,$42
	ld [$FF9A],a
	ld a,$40
	ld [$FF9B],a
	call $3D25
	call $3D89
.next8\@
	ld a,1
	ld [$FF99],a
	ld a,$86
	ld [$FF9A],a
	ld a,$A0
	ld [$FF9B],a
	call $3D25
	call $3D89
.next7\@
	xor a
	ld [$FF99],a
	ld a,$27
	ld [$FF9A],a
	ld a,$10
	ld [$FF9B],a
	call $3D25
	call $3D89
.next6\@
	xor a
	ld [$FF99],a
	ld a,3
	ld [$FF9A],a
	ld a,$E8
	ld [$FF9B],a
	call $3D25
	call $3D89
.next5\@
	xor a
	ld [$FF99],a
	xor a
	ld [$FF9A],a
	ld a,$64
	ld [$FF9B],a
	call $3D25
	call $3D89
.next4\@
	ld c,0
	ld a,[$FF98]
.next10\@
	cp $A
	jr c,.next9\@
	sub $A
	inc c
	jr .next10\@
.next9\@
	ld b,a
	ld a,[$FF95]
	or c
	ld [$FF95],a
	jr nz,.next11\@
	call $3D83
	jr .next12\@
.next11\@
	ld a,$F6
	add a,c
	ld [hl],a
.next12\@
	call $3D89
	ld a,$F6
	add a,b
	ld [hli],a
	pop de
	dec de
	pop bc
	ret

INCBIN "baserom.gbc",$3D25,$3DAB - $3D25

IsInArray: ; 3DAB
; searches an array at hl for the value in a.
; skips (de − 1) bytes between reads, so to check every byte, de should be 1.
; if found, returns count in b and sets carry.
	ld b,0
	ld c,a
.loop\@
	ld a,[hl]
	cp a,$FF
	jr z,.NotInArray\@
	cp c
	jr z,.InArray\@
	inc b
	add hl,de
	jr .loop\@
.NotInArray\@
	and a
	ret
.InArray\@
	scf
	ret

INCBIN "baserom.gbc",$3DBE,$3DD7 - $3DBE

Delay3: ; 3DD7
; call Delay with a parameter of 3
	ld c,3
	jp DelayFrames

INCBIN "baserom.gbc",$3DDC,$3DED - $3DDC
GoPAL_SET_CF1C:	; 3ded
	ld b,$ff
GoPAL_SET: 	; 3def
	ld a,[$cf1b]
	and a
	ret z
	ld a,$45
	jp Predef

INCBIN "baserom.gbc",$3DF9,$3E5C - $3DF9
GenRandom: ; 3E5C
; store a random 8-bit value in a
	push hl
	push de
	push bc
	ld b,BANK(GenRandom_)
	ld hl,GenRandom_
	call Bankswitch
	ld a,[H_RAND1]
	pop bc
	pop de
	pop hl
	ret

Predef: ; 3E6D
; runs a predefined ASM command, where the command ID is read from $D0B7

	ld [$CC4E],a ; save the predef routine's ID for later

	ld a,[$FFB8]
	ld [$CF12],a

	; save bank and call 13:7E49
	push af
	ld a,BANK(GetPredefPointer)
	ld [$FFB8],a
	ld [$2000],a
	call GetPredefPointer

	; call the predef function
	; ($D0B7 has the bank of the predef routine)
	ld a,[$D0B7]
	ld [$FFB8],a
	ld [$2000],a
	ld de,.Return\@
	push de
	jp [hl]
	; after the predefined function finishes it returns here
.Return\@
	pop af
	ld [$FFB8],a
	ld [$2000],a
	ret

INCBIN "baserom.gbc",$3E94,$4000 - $3E94

SECTION "bank1",DATA,BANK[$1]

INCBIN "baserom.gbc",$4000,$112

MewPicFront:
	INCBIN "pic/bmon/mew.pic"
MewPicBack:
	INCBIN "pic/monback/mewb.pic"

INCBIN "baserom.gbc",$425B,$4588-$425B

TitleMons: ; 4588
; mons on the title screen are randomly chosen from here
IF RED
	db CHARMANDER
	db SQUIRTLE
	db BULBASAUR
	db WEEDLE
	db NIDORAN_M
	db SCYTHER
	db PIKACHU
	db CLEFAIRY
	db RHYDON
	db ABRA
	db GASTLY
	db DITTO
	db PIDGEOTTO
	db ONIX
	db PONYTA
	db MAGIKARP
ENDC
IF GREEN
	db BULBASAUR
	db CHARMANDER
	db SQUIRTLE
	db CATERPIE
	db NIDORAN_F
	db PINSIR
	db PIKACHU
	db CLEFAIRY
	db RHYDON
	db ABRA
	db GASTLY
	db DITTO
	db PIDGEOTTO
	db ONIX
	db PONYTA
	db MAGIKARP
ENDC
IF BLUE
	db SQUIRTLE
	db CHARMANDER
	db BULBASAUR
	db MANKEY
	db HITMONLEE
	db VULPIX
	db CHANSEY
	db AERODACTYL
	db JOLTEON
	db SNORLAX
	db GLOOM
	db POLIWAG
	db DODUO
	db PORYGON
	db GENGAR
	db RAICHU
ENDC

INCBIN "baserom.gbc",$4598,$472B-$4598

ItemNames: ; 472B
	db "MASTER BALL@"
	db "ULTRA BALL@"
	db "GREAT BALL@"
	db "POKé BALL@"
	db "TOWN MAP@"
	db "BICYCLE@"
	db "?????@"
	db "SAFARI BALL@"
	db "POKéDEX@"
	db "MOON STONE@"
	db "ANTIDOTE@"
	db "BURN HEAL@"
	db "ICE HEAL@"
	db "AWAKENING@"
	db "PARLYZ HEAL@"
	db "FULL RESTORE@"
	db "MAX POTION@"
	db "HYPER POTION@"
	db "SUPER POTION@"
	db "POTION@"
	db "BOULDERBADGE@"
	db "CASCADEBADGE@"
	db "THUNDERBADGE@"
	db "RAINBOWBADGE@"
	db "SOULBADGE@"
	db "MARSHBADGE@"
	db "VOLCANOBADGE@"
	db "EARTHBADGE@"
	db "ESCAPE ROPE@"
	db "REPEL@"
	db "OLD AMBER@"
	db "FIRE STONE@"
	db "THUNDERSTONE@"
	db "WATER STONE@"
	db "HP UP@"
	db "PROTEIN@"
	db "IRON@"
	db "CARBOS@"
	db "CALCIUM@"
	db "RARE CANDY@"
	db "DOME FOSSIL@"
	db "HELIX FOSSIL@"
	db "SECRET KEY@"
	db "?????@"
	db "BIKE VOUCHER@"
	db "X ACCURACY@"
	db "LEAF STONE@"
	db "CARD KEY@"
	db "NUGGET@"
	db "PP UP@"
	db "POKé DOLL@"
	db "FULL HEAL@"
	db "REVIVE@"
	db "MAX REVIVE@"
	db "GUARD SPEC.@"
	db "SUPER REPEL@"
	db "MAX REPEL@"
	db "DIRE HIT@"
	db "COIN@"
	db "FRESH WATER@"
	db "SODA POP@"
	db "LEMONADE@"
	db "S.S.TICKET@"
	db "GOLD TEETH@"
	db "X ATTACK@"
	db "X DEFEND@"
	db "X SPEED@"
	db "X SPECIAL@"
	db "COIN CASE@"
	db "OAK's PARCEL@"
	db "ITEMFINDER@"
	db "SILPH SCOPE@"
	db "POKé FLUTE@"
	db "LIFT KEY@"
	db "EXP.ALL@"
	db "OLD ROD@"
	db "GOOD ROD@"
	db "SUPER ROD@"
	db "PP UP@"
	db "ETHER@"
	db "MAX ETHER@"
	db "ELIXER@"
	db "MAX ELIXER@"
	db "B2F@"
	db "B1F@"
	db "1F@"
	db "2F@"
	db "3F@"
	db "4F@"
	db "5F@"
	db "6F@"
	db "7F@"
	db "8F@"
	db "9F@"
	db "10F@"
	db "11F@"
	db "B4F@"

UnusedNames: ; 4A92
	db "かみなりバッヂ@"
	db "かいがらバッヂ@"
	db "おじぞうバッヂ@"
	db "はやぶさバッヂ@"
	db "ひんやりバッヂ@"
	db "なかよしバッヂ@"
	db "バラバッヂ@"
	db "ひのたまバッヂ@"
	db "ゴールドバッヂ@"
	db "たまご@"
	db "ひよこ@"
	db "ブロンズ@"
	db "シルバー@"
	db "ゴールド@"
	db "プチキャプテン@"
	db "キャプテン@"
	db "プチマスター@"
	db "マスター@"

INCBIN "baserom.gbc",$4B09,$5AF2-$4B09

MainMenu:
; Check save file
	call Func_5bff
	xor a
	ld [$D08A],a
	inc a
	ld [$D088],a
	call $609E
	jr nc,.next0\@

	; Predef 52 loads the save from SRAM to RAM
	ld a,$52
	call Predef

.next0\@
	ld c,20
	call DelayFrames
	xor a
	ld [$D12B],a
	ld hl,$CC2B
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld [$D07C],a
	ld hl,$D72E
	res 6,[hl]
	call ClearScreen
	call $3DED
	call $36A0 ; load some graphics in VRAM
	call $3680 ; load fonts in VRAM
	ld hl,$D730
	set 6,[hl]
	ld a,[$D088]
	cp a,1
	jr z,.next1\@
	FuncCoord 0,0
	ld hl,Coord
	ld b,6
	ld c,13
	call TextBoxBorder
	FuncCoord 2,2
	ld hl,Coord
	ld de,$5D7E
	call PlaceString
	jr .next2\@
.next1\@
	FuncCoord 0,0
	ld hl,Coord
	ld b,4
	ld c,13
	call TextBoxBorder
	FuncCoord 2,2
	ld hl,Coord
	ld de,$5D87
	call PlaceString
.next2\@
	ld hl,$D730
	res 6,[hl]
	call $2429 ; OAM?
	xor a
	ld [$CC26],a
	ld [$CC2A],a
	ld [$CC34],a
	inc a
	ld [$CC25],a
	inc a
	ld [$CC24],a
	ld a,$B
	ld [$CC29],a
	ld a,[$D088]
	ld [$CC28],a
	call $3ABE
	bit 1,a
	jp nz,$42DD ; load title screen (gfx and arrangement)
	ld c,20
	call DelayFrames
	ld a,[$CC26]
	ld b,a
	ld a,[$D088]
	cp a,2
	jp z,.next3\@
	inc b ; adjust MenuArrow_Counter
.next3\@
	ld a,b
	and a
	jr z,.next4\@ ; if press_A on Continue
	cp a,1
	jp z,$5D52 ; if press_A on NewGame
	call $5E8A ; if press_a on Options
	ld a,1
	ld [$D08A],a
	jp .next0\@
.next4\@
	call $5DB5
	ld hl,$D126
	set 5,[hl]
.next6\@
	xor a
	ld [$FFB3],a
	ld [$FFB2],a
	ld [$FFB4],a
	call $19A
	ld a,[$FFB4]
	bit 0,a
	jr nz,.next5\@
	bit 1,a
	jp nz,.next0\@
	jr .next6\@
.next5\@
	call $3DD4
	call ClearScreen
	ld a,4
	ld [$D52A],a
	ld c,10
	call DelayFrames
	ld a,[$D5A2]
	and a
	jp z,$5D5F
	ld a,[W_CURMAP] ; map ID
	cp a,$76 ; Hall of Fame
	jp nz,$5D5F
	xor a
	ld [$D71A],a
	ld hl,$D732
	set 2,[hl]
	call $62CE
	jp $5D5F
Func_5bff:
	ld a,1
	ld [$D358],a
	ld a,3
	ld [$D355],a
	ret

INCBIN "baserom.gbc",$5C0A,$6115 - $5C0A

OakSpeech: ; 6115
	ld a,$FF
	call $23B1 ; stop music
	ld a,2     ; bank of song
	ld c,a
	ld a,$EF    ; song #
	call $23A1  ; plays music
	call ClearScreen
	call $36A0
	call $60CA
	ld a,$18
	call Predef
	ld hl,$D53A
	ld a,$14
	ld [$CF91],a
	ld a,1
	ld [$CF96],a
	call $2BCF
	ld a,[$D07C]
	ld [$D71A],a
	call Function62CE
	xor a
	ld [$FFD7],a
	ld a,[$D732]
	bit 1,a ; XXX when is bit 1 set?
	jp nz,Function61BC ; easter egg: skip the intro
	ld de,$615F
	ld bc,$1300
	call IntroPredef3B   ; displays Oak pic?
	call FadeInIntroPic
	ld hl,OakSpeechText1
	call PrintText      ; prints text box
	call GBFadeOut2
	call ClearScreen
	ld a,NIDORINO
	ld [$D0B5],a    ; pic displayed is stored at this location
	ld [$CF91],a
	call $1537      ; this is also related to the pic
	ld hl,$C3F6     ; position on tilemap the pic is displayed
	call $1384      ; displays pic?
	call MovePicLeft
	ld hl,OakSpeechText2
	call PrintText      ; Prints text box
	call GBFadeOut2
	call ClearScreen
	ld de,$6EDE
	ld bc,$0400     ; affects the position of the player pic
	call IntroPredef3B      ; displays player pic?
	call MovePicLeft
	ld hl,IntroducePlayerText
	call PrintText
	call $695D ; brings up NewName/Red/etc menu
	call GBFadeOut2
	call ClearScreen
	ld de,$6049
	ld bc,$1300
	call IntroPredef3B ; displays rival pic
	call FadeInIntroPic
	ld hl,IntroduceRivalText
	call PrintText
	call $69A4
Function61BC:
	call GBFadeOut2
	call ClearScreen
	ld de,$6EDE
	ld bc,$0400
	call IntroPredef3B
	call GBFadeIn2
	ld a,[$D72D]
	and a
	jr nz,.next\@
	ld hl,OakSpeechText3
	call PrintText
.next\@	ld a,[$FFB8]
	push af
	ld a,$9C
	call $23B1
	pop af
	ld [$FFB8],a
	ld [$2000],a
	ld c,4
	call DelayFrames
	ld de,$4180
	ld hl,$8000
	ld bc,$050C
	call $1848
	ld de,$6FE8
	ld bc,$0400
	call IntroPredef3B
	ld c,4
	call DelayFrames
	ld de,$7042
	ld bc,$0400
	call IntroPredef3B
	call $28A6
	ld a,[$FFB8]
	push af
	ld a,2
	ld [$C0EF],a
	ld [$C0F0],a
	ld a,$A
	ld [$CFC7],a
	ld a,$FF
	ld [$C0EE],a
	call $23B1 ; stop music
	pop af
	ld [$FFB8],a
	ld [$2000],a
	ld c,$14
	call DelayFrames
	ld hl,$C40A
	ld b,7
	ld c,7
	call $18C4
	call $36A0
	ld a,1
	ld [$CFCB],a
	ld c,$32
	call DelayFrames
	call GBFadeOut2
	jp ClearScreen
OakSpeechText1:
	TX_FAR _OakSpeechText1
	db "@"
OakSpeechText2:
	TX_FAR _OakSpeechText2A
	db $14
	TX_FAR _OakSpeechText2B
	db "@"
IntroducePlayerText:
	TX_FAR _IntroducePlayerText
	db "@"
IntroduceRivalText:
	TX_FAR _IntroduceRivalText
	db "@"
OakSpeechText3:
	TX_FAR _OakSpeechText3
	db "@"

FadeInIntroPic:
	ld hl,IntroFadePalettes
	ld b,6
.next\@
	ld a,[hli]
	ld [rBGP],a
	ld c,10
	call DelayFrames
	dec b
	jr nz,.next\@
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft:
	ld a,119
	ld [$FF4B],a
	call DelayFrame

	ld a,$E4
	ld [rBGP],a
.next\@
	call DelayFrame
	ld a,[$FF4B]
	sub 8
	cp $FF
	ret z
	ld [$FF4B],a
	jr .next\@

Predef3B: ; 62A1
	call $3E94
IntroPredef3B: ; 62A4
	push bc
	ld a,b
	call $36EB
	ld hl,$A188
	ld de,$A000
	ld bc,$0310
	call CopyData
	ld de,$9000
	call $16EA
	pop bc
	ld a,c
	and a
	ld hl,$C3C3
	jr nz,.next\@
	ld hl,$C3F6
.next\@
	xor a
	ld [$FFE1],a
	ld a,1
	jp $3E6D

Function62CE: ; 62CE, XXX called by 4B2 948 989 5BF9 5D15
	call $62FF
	ld a,$19
	call $3E6D
	ld hl,$D732
	bit 2,[hl]
	res 2,[hl]
	jr z,.next\@
	ld a,[$D71A]
	jr .next2\@
.next\@
	bit 1,[hl]
	jr z,.next3\@
	call $64EA
.next3\@
	ld a,0
.next2\@
	ld b,a
	ld a,[$D72D]
	and a
	jr nz,.next4\@
	ld a,b
.next4\@
	ld hl,$D732
	bit 4,[hl]
	ret nz
	ld [$D365],a
	ret

INCBIN "baserom.gbc",$62FF,$778D - $62FF

FieldMoveNames: ; 778D
	db "CUT@"
	db "FLY@"
	db "@"
	db "SURF@"
	db "STRENGTH@"
	db "FLASH@"
	db "DIG@"
	db "TELEPORT@"
	db "SOFTBOILED@"

PokemonMenuEntries: ; 77C2
	db "STATS",$4E
	db "SWITCH",$4E
	db "CANCEL@"

INCBIN "baserom.gbc",$77D6,$7AF5 - $77D6

PlayersPCMenuEntries: ; 7AF5
	db "WITHDRAW ITEM",$4E
	db "DEPOSIT ITEM",$4E
	db "TOSS ITEM",$4E
	db "LOG OFF@"

INCBIN "baserom.gbc",$7B22,$7C49 - $7B22

SECTION "bank2",DATA,BANK[$2]
INCBIN "baserom.gbc",$8000,$4000

SECTION "bank3",DATA,BANK[$3]
INCBIN "baserom.gbc",$C000,$C23D - $C000

; see also MapHeaderPointers
MapHeaderBanks: ; 423D
	db BANK(PalletTown_h)
	db BANK(ViridianCity_h) ; VIRIDIAN_CITY
	db BANK(PewterCity_h) ; PEWTER_CITY
	db BANK(CeruleanCity_h) ; CERULEAN_CITY
	db BANK(LavendarTown_h) ; LAVENDER_TOWN
	db BANK(VermilionCity_h) ; VERMILION_CITY
	db BANK(CeladonCity_h) ; CELADON_CITY
	db BANK(FuchsiaCity_h) ; FUCHSIA_CITY
	db BANK(CinnabarIsland_h) ; CINNABAR_ISLAND
	db $14 ; INDIGO_PLATEAU
	db $14 ; SAFFRON_CITY
	db $01 ; unused
	db BANK(Route1_h) ; ROUTE_1
	db $15 ; ROUTE_2
	db $15 ; ROUTE_3
	db $15 ; ROUTE_4
	db $15 ; ROUTE_5
	db $16 ; ROUTE_6
	db BANK(Route7_h) ; ROUTE_7
	db $16 ; ROUTE_8
	db $15 ; ROUTE_9
	db $16 ; ROUTE_10
	db $16 ; ROUTE_11
	db $16 ; ROUTE_12
	db $15 ; ROUTE_13
	db $15 ; ROUTE_14
	db $16 ; ROUTE_15
	db $16 ; ROUTE_16
	db $15 ; ROUTE_17
	db $16 ; ROUTE_18
	db $15 ; ROUTE_19
	db $14 ; ROUTE_20
	db $15 ; ROUTE_21
	db $14 ; ROUTE_22
	db $14 ; ROUTE_23
	db $14 ; ROUTE_24
	db $14 ; ROUTE_25
	db BANK(RedsHouse1F_h)
	db BANK(RedsHouse2F_h)
	db BANK(BluesHouse_h)
	db BANK(OaksLab_h)
	db BANK(ViridianPokeCenter_h)
	db BANK(ViridianMart_h)
	db BANK(School_h)
	db BANK(ViridianHouse_h)
	db $1D
	db BANK(DiglettsCaveRoute2_h)
	db $17
	db BANK(Route2House_h)
	db $17
	db $17
	db $18
	db $17
	db $17
	db $17
	db BANK(PewterHouse1_h)
	db $1D
	db BANK(PewterHouse2_h)
	db $17
	db $12
	db $14
	db $12
	db BANK(CeruleanHouseTrashed_h)
	db BANK(CeruleanHouse2_h)
	db $17
	db $17
	db BANK(BikeShop_h)
	db $17
	db BANK(MtMoonPokecenter_h)
	db BANK(CeruleanHouseTrashed_h) ; copy of map 62
	db BANK(Route5Gate_h)
	db $17
	db $15
	db BANK(Route6Gate_h)
	db $17
	db $17
	db BANK(Route7Gate_h)
	db $17
	db $17
	db BANK(Route8Gate_h)
	db BANK(UndergroundPathEntranceRoute8_h)
	db $12
	db BANK(RockTunnel1_h)
	db BANK(PowerPlant_h)
	db $12
	db BANK(DiglettsCaveEntranceRoute11_h)
	db $12
	db $12
	db BANK(BillsHouse_h)
	db $17
	db $16
	db $17
	db $17
	db BANK(VermilionHouse1_h)
	db BANK(VermilionDock_h)
	db $18
	db $18
	db BANK(SSAnne3_h)
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $1D
	db $1D
	db $1D
	db $17
	db $1D
	db $1D
	db $1D
	db $1D
	db $16
	db $1D
	db $1D
	db $1D
	db $1D
	db $16
	db $18
	db $1D
	db $18
	db $18
	db $15
	db BANK(CeladonMart3_h)
	db BANK(CeladonMart4_h)
	db BANK(CeladonMart5_h)
	db BANK(CeladonMart6_h)
	db BANK(CeladonMansion1_h)
	db BANK(CeladonMansion2_h)
	db BANK(CeladonMansion3_h)
	db BANK(CeladonMansion4_h)
	db BANK(CeladonMansion5_h)
	db BANK(CeladonPokecenter_h)
	db BANK(CeladonGYM_h)
	db BANK(CeladonGameCorner_h)
	db BANK(CeladonHouse_h)
	db BANK(CeladonPrizeRoom_h)
	db BANK(CeladonDiner_h)
	db BANK(CeladonHouse2_h)
	db BANK(CeladonHotel_h)
	db $17
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db BANK(LavenderHouse1_h)
	db $17
	db BANK(LavenderHouse2_h)
	db BANK(FuchsiaMart_h)
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db BANK(SeafoamIslands2_h)
	db BANK(SeafoamIslands3_h)
	db BANK(SeafoamIslands4_h)
	db BANK(SeafoamIslands5_h)
	db $15
	db $15
	db BANK(Mansion1_h)
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $06
	db $1D
	db $17
	db $17
	db $17
	db BANK(SaffronHouse1_h)
	db $17
	db $17
	db $17
	db BANK(SaffronHouse2_h)
	db $12
	db $12
	db $12
	db $12
	db BANK(Route16House_h)
	db $15
	db $12
	db $12
	db BANK(SeafoamIslands1_h)
	db BANK(Route22Gate_h)
	db $14
	db $12
	db $06
	db $18
	db BANK(VictoryRoad3_h)
	db BANK(RocketHideout1_h)
	db BANK(RocketHideout2_h)
	db BANK(RocketHideout3_h)
	db BANK(RocketHideout4_h)
	db BANK(RocketHideoutElevator_h)
	db $01
	db $01
	db $01
	db $16
	db $16
	db BANK(SilphCo4_h)
	db BANK(SilphCo5_h)
	db BANK(SilphCo6_h)
	db $14
	db $15
	db $14
	db $14
	db $14
	db BANK(SafariZoneEast_h)
	db BANK(SafariZoneNorth_h)
	db $12
	db BANK(SafariZoneCenter_h)
	db BANK(SafariZoneRestHouse1_h)
	db $12
	db BANK(SafariZoneRestHouse2_h)
	db BANK(SafariZoneRestHouse3_h)
	db BANK(SafariZoneRestHouse4_h)
	db BANK(UnknownDungeon2_h)
	db BANK(UnknownDungeon3_h)
	db $1D
	db BANK(NameRater_h)
	db $1D
	db $01
	db BANK(RockTunnel2_h)
	db $17
	db $16
	db $18
	db BANK(SilphCoElevator_h)
	db $11
	db $11
	db $13
	db $13
	db $11
	db $11
	db $11
	db $11
	db $1D
	db $1D
	db $1D

INCBIN "baserom.gbc",$C335,$C766-$C335
	ld hl,TilesetsHeadPtr
INCBIN "baserom.gbc",$C769,$C7BE-$C769
TilesetsHeadPtr:
	TSETHEAD Tset00_Block,Tset00_GFX,Tset00_Coll,$FF,$FF,$FF,$52,2
	TSETHEAD Tset01_Block,Tset01_GFX,Tset01_Coll,$FF,$FF,$FF,$FF,0
	TSETHEAD Tset02_Block,Tset02_GFX,Tset02_Coll,$18,$19,$1E,$FF,0
	TSETHEAD Tset03_Block,Tset03_GFX,Tset03_Coll,$FF,$FF,$FF,$20,1
	TSETHEAD Tset01_Block,Tset01_GFX,Tset01_Coll,$FF,$FF,$FF,$FF,0
	TSETHEAD Tset05_Block,Tset05_GFX,Tset05_Coll,$3A,$FF,$FF,$FF,2
	TSETHEAD Tset02_Block,Tset02_GFX,Tset02_Coll,$18,$19,$1E,$FF,0
	TSETHEAD Tset05_Block,Tset05_GFX,Tset05_Coll,$3A,$FF,$FF,$FF,2
	TSETHEAD Tset08_Block,Tset08_GFX,Tset08_Coll,$FF,$FF,$FF,$FF,0
	TSETHEAD Tset09_Block,Tset09_GFX,Tset09_Coll,$17,$32,$FF,$FF,0
	TSETHEAD Tset09_Block,Tset09_GFX,Tset09_Coll,$17,$32,$FF,$FF,0
	TSETHEAD Tset0B_Block,Tset0B_GFX,Tset0B_Coll,$FF,$FF,$FF,$FF,0
	TSETHEAD Tset09_Block,Tset09_GFX,Tset09_Coll,$17,$32,$FF,$FF,0
	TSETHEAD Tset0D_Block,Tset0D_GFX,Tset0D_Coll,$FF,$FF,$FF,$FF,1
	TSETHEAD Tset0E_Block,Tset0E_GFX,Tset0E_Coll,$FF,$FF,$FF,$FF,1
	TSETHEAD Tset0F_Block,Tset0F_GFX,Tset0F_Coll,$12,$FF,$FF,$FF,0
	TSETHEAD Tset10_Block,Tset10_GFX,Tset10_Coll,$FF,$FF,$FF,$FF,0
	TSETHEAD Tset11_Block,Tset11_GFX,Tset11_Coll,$FF,$FF,$FF,$FF,1
	TSETHEAD Tset12_Block,Tset12_GFX,Tset12_Coll,$15,$36,$FF,$FF,0
	TSETHEAD Tset13_Block,Tset13_GFX,Tset13_Coll,$FF,$FF,$FF,$FF,0
	TSETHEAD Tset14_Block,Tset14_GFX,Tset14_Coll,$FF,$FF,$FF,$FF,0
	TSETHEAD Tset15_Block,Tset15_GFX,Tset15_Coll,$07,$17,$FF,$FF,0
	TSETHEAD Tset16_Block,Tset16_GFX,Tset16_Coll,$12,$FF,$FF,$FF,1
	TSETHEAD Tset17_Block,Tset17_GFX,Tset17_Coll,$FF,$FF,$FF,$45,1

INCBIN "baserom.gbc",$C8DE,$C8F5-$C8DE

; data for default hidden/shown
; objects for each map ($00-$F8)

; Table of 2-Byte pointers, one pointer per map,
; goes up to Map_F7, ends with $FFFF.
MapHSPointers: ; 48F5
	dw MapHS00
	dw MapHS01
	dw MapHS02
	dw MapHS03
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS0A
	dw MapHSXX
	dw MapHSXX
	dw MapHS0D
	dw MapHSXX
	dw MapHS0F
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS14
	dw MapHSXX
	dw MapHSXX
	dw MapHS17
	dw MapHSXX
	dw MapHSXX
	dw MapHS1A
	dw MapHS1B
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS21
	dw MapHSXX
	dw MapHS23
	dw MapHS24
	dw MapHSXX
	dw MapHSXX
	dw MapHS27
	dw MapHS28
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS2D
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS33
	dw MapHS34
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS3B
	dw MapHSXX
	dw MapHS3D
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS53
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS58
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS60
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS66
	dw MapHS67
	dw MapHS68
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS6C
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS78
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS84
	dw MapHSXX
	dw MapHSXX
	dw MapHS87
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS8F
	dw MapHS90
	dw MapHS91
	dw MapHS92
	dw MapHS93
	dw MapHS94
	dw MapHS95
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS9B
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHS9F
	dw MapHSA0
	dw MapHSA1
	dw MapHSA2
	dw MapHSXX
	dw MapHSXX
	dw MapHSA5
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSB1
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSB5
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSC0
	dw MapHSXX
	dw MapHSC2
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSC6
	dw MapHSC7
	dw MapHSC8
	dw MapHSC9
	dw MapHSCA
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSCF
	dw MapHSD0
	dw MapHSD1
	dw MapHSD2
	dw MapHSD3
	dw MapHSD4
	dw MapHSD5
	dw MapHSD6
	dw MapHSD7
	dw MapHSD8
	dw MapHSD9
	dw MapHSDA
	dw MapHSDB
	dw MapHSDC
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSE2
	dw MapHSE3
	dw MapHSE4
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSE9
	dw MapHSEA
	dw MapHSEB
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw MapHSF4
	dw MapHSXX
	dw MapHSXX
	dw MapHSXX
	dw $FFFF

; Structure:
; 3 bytes per object
; [Map_ID][Object_ID][H/S]
;
; Program stops reading when either:
; a) Map_ID = $FF
; b) Map_ID ≠ currentMapID
;
; This Data is loaded into RAM at $D5CE-$D5F?.

; These constants come from the bytes for Predef functions:
Hide	equ $11
Show	equ $15

MapHSXX:
	db $FF,$FF,$FF
MapHS00:
	db $00,$01,Hide
MapHS01:
	db $01,$05,Show
	db $01,$07,Hide
MapHS02:
	db $02,$03,Show
	db $02,$05,Show
MapHS03:
	db $03,$01,Hide
	db $03,$02,Show
	db $03,$06,Hide
	db $03,$0A,Show
	db $03,$0B,Show
MapHS0A:
	db $0A,$01,Show
	db $0A,$02,Show
	db $0A,$03,Show
	db $0A,$04,Show
	db $0A,$05,Show
	db $0A,$06,Show
	db $0A,$07,Show
	db $0A,$08,Hide
	db $0A,$09,Hide
	db $0A,$0A,Hide
	db $0A,$0B,Hide
	db $0A,$0C,Hide
	db $0A,$0D,Hide
	db $0A,$0E,Show
	db $0A,$0F,Hide
MapHS0D:
	db $0D,$01,Show
	db $0D,$02,Show
MapHS0F:
	db $0F,$03,Show
MapHS14:
	db $14,$0A,Show
MapHS17:
	db $17,$01,Show
	db $17,$09,Show
	db $17,$0A,Show
MapHS1A:
	db $1A,$0B,Show
MapHS1B:
	db $1B,$07,Show
MapHS21:
	db $21,$01,Hide
	db $21,$02,Hide
MapHS23:
	db $23,$01,Show
	db $23,$08,Show
MapHS24:
	db $24,$0A,Show
MapHS27:
	db $27,$01,Show
	db $27,$02,Hide
	db $27,$03,Show
MapHS28:
	db $28,$01,Show
	db $28,$02,Show
	db $28,$03,Show
	db $28,$04,Show
	db $28,$05,Hide
	db $28,$06,Show
	db $28,$07,Show
	db $28,$08,Hide
MapHS2D:
	db $2D,$01,Show
	db $2D,$0B,Show
MapHS34:
	db $34,$05,Show
MapHSE4:
	db $E4,$01,Show
	db $E4,$02,Show
	db $E4,$03,Show
MapHS8F:
	db $8F,$01,Show
MapHS90:
	db $90,$04,Show
MapHS91:
	db $91,$04,Show
	db $91,$05,Show
	db $91,$06,Show
MapHS92:
	db $92,$06,Show
MapHS93:
	db $93,$04,Show
	db $93,$05,Show
MapHS94:
	db $94,$01,Show
	db $94,$02,Show
	db $94,$03,Show
	db $94,$04,Show
MapHS95:
	db $95,$05,Hide
MapHS84:
	db $84,$02,Show
MapHS87:
	db $87,$0B,Show
MapHS9B:
	db $9B,$02,Show
MapHSA5:
	db $A5,$02,Show
	db $A5,$03,Show
MapHSB1:
	db $B1,$06,Show
	db $B1,$07,Show
MapHSB5:
	db $B5,$01,Hide
MapHS53:
	db $53,$01,Show
	db $53,$02,Show
	db $53,$03,Show
	db $53,$04,Show
	db $53,$05,Show
	db $53,$06,Show
	db $53,$07,Show
	db $53,$08,Show
	db $53,$09,Show
	db $53,$0A,Show
	db $53,$0B,Show
	db $53,$0C,Show
	db $53,$0D,Show
	db $53,$0E,Show
MapHSC2:
	db $C2,$06,Show
	db $C2,$07,Show
	db $C2,$08,Show
	db $C2,$09,Show
	db $C2,$0A,Show
	db $C2,$0D,Show
MapHS58:
	db $58,$01,Show
	db $58,$02,Hide
	db $58,$03,Hide
MapHS33:
	db $33,$05,Show
	db $33,$06,Show
	db $33,$07,Show
MapHS3B:
	db $3B,$08,Show
	db $3B,$09,Show
	db $3B,$0A,Show
	db $3B,$0B,Show
	db $3B,$0C,Show
	db $3B,$0D,Show
MapHS3D:
	db $3D,$06,Show
	db $3D,$07,Show
	db $3D,$08,Show
	db $3D,$09,Show
MapHS60:
	db $60,$02,Hide
MapHS66:
	db $66,$0A,Show
MapHS67:
	db $67,$06,Show
	db $67,$09,Show
MapHS68:
	db $68,$09,Show
	db $68,$0A,Show
	db $68,$0B,Show
MapHSC6:
	db $C6,$05,Show
	db $C6,$06,Show
	db $C6,$0A,Show
MapHSC7:
	db $C7,$06,Show
	db $C7,$07,Show
MapHSC8:
	db $C8,$02,Show
	db $C8,$03,Show
	db $C8,$04,Show
	db $C8,$05,Show
MapHSC9:
	db $C9,$03,Show
	db $C9,$04,Show
MapHSCA:
	db $CA,$01,Show
	db $CA,$05,Show
	db $CA,$06,Show
	db $CA,$07,Show
	db $CA,$08,Hide
	db $CA,$09,Hide
MapHSCF:
	db $CF,$01,Show
	db $CF,$02,Show
	db $CF,$03,Show
	db $CF,$04,Show
	db $CF,$05,Show
MapHSD0:
	db $D0,$02,Show
	db $D0,$03,Show
	db $D0,$04,Show
MapHSD1:
	db $D1,$02,Show
	db $D1,$03,Show
	db $D1,$04,Show
	db $D1,$05,Show
	db $D1,$06,Show
	db $D1,$07,Show
MapHSD2:
	db $D2,$02,Show
	db $D2,$03,Show
	db $D2,$04,Show
	db $D2,$05,Show
	db $D2,$06,Show
	db $D2,$07,Show
	db $D2,$08,Show
MapHSD3:
	db $D3,$06,Show
	db $D3,$07,Show
	db $D3,$08,Show
	db $D3,$09,Show
	db $D3,$0A,Show
MapHSD4:
	db $D4,$05,Show
	db $D4,$06,Show
	db $D4,$07,Show
	db $D4,$08,Show
	db $D4,$09,Show
	db $D4,$0A,Show
	db $D4,$0B,Show
	db $D4,$0C,Show
MapHSD5:
	db $D5,$02,Show
	db $D5,$03,Show
	db $D5,$04,Show
MapHSE9:
	db $E9,$02,Show
	db $E9,$03,Show
	db $E9,$04,Show
MapHSEA:
	db $EA,$01,Show
	db $EA,$02,Show
	db $EA,$03,Show
	db $EA,$04,Show
	db $EA,$05,Show
	db $EA,$06,Show
MapHSEB:
	db $EB,$03,Show
	db $EB,$04,Show
	db $EB,$05,Show
MapHSF4:
	db $F4,$02,Show
MapHSD6:
	db $D6,$02,Show
MapHSD7:
	db $D7,$03,Show
	db $D7,$04,Show
MapHSD8:
	db $D8,$03,Show
	db $D8,$04,Show
	db $D8,$05,Show
	db $D8,$06,Show
	db $D8,$08,Show
MapHSD9:
	db $D9,$01,Show
	db $D9,$02,Show
	db $D9,$03,Show
	db $D9,$04,Show
MapHSDA:
	db $DA,$01,Show
	db $DA,$02,Show
MapHSDB:
	db $DB,$01,Show
	db $DB,$02,Show
	db $DB,$03,Show
	db $DB,$04,Show
MapHSDC:
	db $DC,$01,Show
MapHSE2:
	db $E2,$01,Show
	db $E2,$02,Show
	db $E2,$03,Show
MapHSE3:
	db $E3,$01,Show
	db $E3,$02,Show
	db $E3,$03,Show
MapHS6C:
	db $6C,$03,Show
	db $6C,$04,Show
MapHS78:
	db $78,$02,Hide
MapHSC0:
	db $C0,$01,Show
	db $C0,$02,Show
MapHS9F:
	db $9F,$01,Hide
	db $9F,$02,Hide
MapHSA0:
	db $A0,$01,Hide
	db $A0,$02,Hide
MapHSA1:
	db $A1,$02,Show
	db $A1,$03,Show
	db $A1,$05,Hide
	db $A1,$06,Hide
MapHSA2:
	db $A2,$01,Hide
	db $A2,$02,Hide
	db $A2,$03,Show

	db $FF

INCBIN "baserom.gbc",$CD97,$CEB8-$CD97

; wild pokemon data: from 4EB8 to 55C7

LoadWildData: ; 4EB8
	ld hl,WildDataPointers
	ld a,[W_CURMAP]

	; get wild data for current map
	ld c,a
	ld b,0
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a       ; hl now points to wild data for current map
	ld a,[hli]
	ld [W_GRASSRATE],a
	and a
	jr z,.NoGrassData\@ ; if no grass data, skip to surfing data
	push hl
	ld de,W_GRASSMONS ; otherwise, load grass data
	ld bc,$0014
	call CopyData
	pop hl
	ld bc,$0014
	add hl,bc
.NoGrassData\@
	ld a,[hli]
	ld [W_WATERRATE],a
	and a
	ret z        ; if no water data, we're done
	ld de,W_WATERMONS  ; otherwise, load surfing data
	ld bc,$0014
	jp CopyData

WildDataPointers: ; 4EEB
	dw NoMons      ; PALLET_TOWN
	dw NoMons      ; VIRIDIAN_CITY
	dw NoMons      ; PEWTER_CITY
	dw NoMons      ; CERULEAN_CITY
	dw NoMons      ; LAVENDER_TOWN
	dw NoMons      ; VERMILION_CITY
	dw NoMons      ; CELADON_CITY
	dw NoMons      ; FUCHSIA_CITY
	dw NoMons      ; CINNABAR_ISLAND
	dw NoMons      ; INDIGO_PLATEAU
	dw NoMons      ; SAFFRON_CITY
	dw NoMons      ; unused
	dw Route1Mons  ; ROUTE_1
	dw Route2Mons  ; ROUTE_2
	dw Route3Mons  ; ROUTE_3
	dw Route4Mons  ; ROUTE_4
	dw Route5Mons  ; ROUTE_5
	dw Route6Mons  ; ROUTE_6
	dw Route7Mons  ; ROUTE_7
	dw Route8Mons  ; ROUTE_8
	dw Route9Mons  ; ROUTE_9
	dw Route10Mons ; ROUTE_10
	dw Route11Mons ; ROUTE_11
	dw Route12Mons ; ROUTE_12
	dw Route13Mons ; ROUTE_13
	dw Route14Mons ; ROUTE_14
	dw Route15Mons ; ROUTE_15
	dw Route16Mons ; ROUTE_16
	dw Route17Mons ; ROUTE_17
	dw Route18Mons ; ROUTE_18
	dw WaterMons   ; ROUTE_19
	dw WaterMons   ; ROUTE_20
	dw Route21Mons ; ROUTE_21
	dw Route22Mons ; ROUTE_22
	dw Route23Mons ; ROUTE_23
	dw Route24Mons ; ROUTE_24
	dw Route25Mons ; ROUTE_25
	dw NoMons      ; REDS_HOUSE_1F
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw ForestMons ; ViridianForest
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw MoonMons1
	dw MoonMonsB1
	dw MoonMonsB2
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw TunnelMonsB1
	dw PowerPlantMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw PlateauMons1
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw TowerMons1
	dw TowerMons2
	dw TowerMons3
	dw TowerMons4
	dw TowerMons5
	dw TowerMons6
	dw TowerMons7
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw IslandMonsB1
	dw IslandMonsB2
	dw IslandMonsB3
	dw IslandMonsB4
	dw NoMons
	dw NoMons
	dw MansionMons1
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw IslandMons1
	dw NoMons
	dw PlateauMons2
	dw NoMons
	dw NoMons
	dw CaveMons
	dw PlateauMons3
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw MansionMons2
	dw MansionMons3
	dw MansionMonsB1
	dw ZoneMons1
	dw ZoneMons2
	dw ZoneMons3
	dw ZoneMonsCenter
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw DungeonMons2
	dw DungeonMonsB1
	dw DungeonMons1
	dw NoMons
	dw NoMons
	dw NoMons
	dw TunnelMonsB2
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw NoMons
	dw $FFFF

; wild pokemon data is divided into two parts.
; first part:  pokemon found in grass
; second part: pokemon found while surfing
; each part goes as follows:
	; if first byte == 00, then
		; no wild pokemon on this map
	; if first byte != 00, then
		; first byte is encounter rate
		; followed by 20 bytes:
		; level, species (ten times)

NoMons: ; no wild pokemon
	db 0
	db 0

Route1Mons:
	db $19
	db 3,PIDGEY
	db 3,RATTATA
	db 3,RATTATA
	db 2,RATTATA
	db 2,PIDGEY
	db 3,PIDGEY
	db 3,PIDGEY
	db 4,RATTATA
	db 4,PIDGEY
	db 5,PIDGEY

	db 0

Route2Mons:
	db $19
	db 3,RATTATA
	db 3,PIDGEY
	db 4,PIDGEY
	db 4,RATTATA
	db 5,PIDGEY
	db 3,WEEDLE
	db 2,RATTATA
	db 5,RATTATA
	db 4,WEEDLE
	db 5,WEEDLE

	db 0

Route22Mons:
	db $19
	db 3,RATTATA
	db 3,NIDORAN_M
	db 4,RATTATA
	db 4,NIDORAN_M
	db 2,RATTATA
	db 2,NIDORAN_M
	db 3,SPEAROW
	db 5,SPEAROW
	db 3,NIDORAN_F
	db 4,NIDORAN_F

	db 0

ForestMons:
	db $08
	db 4,WEEDLE
	db 5,KAKUNA
	db 3,WEEDLE
	db 5,WEEDLE
	db 4,KAKUNA
	db 6,KAKUNA
	db 4,METAPOD
	db 3,CATERPIE
	db 3,PIKACHU
	db 5,PIKACHU

	db 0

Route3Mons:
	db $14
	db 6,PIDGEY
	db 5,SPEAROW
	db 7,PIDGEY
	db 6,SPEAROW
	db 7,SPEAROW
	db 8,PIDGEY
	db 8,SPEAROW
	db 3,JIGGLYPUFF
	db 5,JIGGLYPUFF
	db 7,JIGGLYPUFF

	db 0

MoonMons1:
	db $0A
	db 8,ZUBAT
	db 7,ZUBAT
	db 9,ZUBAT
	db 8,GEODUDE
	db 6,ZUBAT
	db 10,ZUBAT
	db 10,GEODUDE
	db 8,PARAS
	db 11,ZUBAT
	db 8,CLEFAIRY

	db 0

MoonMonsB1:
	db $0A
	db 8,ZUBAT
	db 7,ZUBAT
	db 7,GEODUDE
	db 8,GEODUDE
	db 9,ZUBAT
	db 10,PARAS
	db 10,ZUBAT
	db 11,ZUBAT
	db 9,CLEFAIRY
	db 9,GEODUDE

	db 0

MoonMonsB2:
	db $0A
	db 9,ZUBAT
	db 9,GEODUDE
	db 10,ZUBAT
	db 10,GEODUDE
	db 11,ZUBAT
	db 10,PARAS
	db 12,PARAS
	db 10,CLEFAIRY
	db 12,ZUBAT
	db 12,CLEFAIRY

	db 0

Route4Mons:
	db $14
	db 10,RATTATA
	db 10,SPEAROW
	db 8,RATTATA
	db 6,EKANS
	db 8,SPEAROW
	db 10,EKANS
	db 12,RATTATA
	db 12,SPEAROW
	db 8,EKANS
	db 12,EKANS

	db 0

Route24Mons:
	db $19
	db 7,WEEDLE
	db 8,KAKUNA
	db 12,PIDGEY
	db 12,ODDISH
	db 13,ODDISH
	db 10,ABRA
	db 14,ODDISH
	db 13,PIDGEY
	db 8,ABRA
	db 12,ABRA

	db 0

Route25Mons:
	db 15
	db 8,WEEDLE
	db 9,KAKUNA
	db 13,PIDGEY
	db 12,ODDISH
	db 13,ODDISH
	db 12,ABRA
	db 14,ODDISH
	db 10,ABRA
	db 7,METAPOD
	db 8,CATERPIE

	db 0

Route9Mons:
	db 15
	db 16,RATTATA
	db 16,SPEAROW
	db 14,RATTATA
	db 11,EKANS
	db 13,SPEAROW
	db 15,EKANS
	db 17,RATTATA
	db 17,SPEAROW
	db 13,EKANS
	db 17,EKANS

	db 0

Route5Mons:
	db 15
	db 13,ODDISH
	db 13,PIDGEY
	db 15,PIDGEY
	db 10,MANKEY
	db 12,MANKEY
	db 15,ODDISH
	db 16,ODDISH
	db 16,PIDGEY
	db 14,MANKEY
	db 16,MANKEY

	db 0

Route6Mons:
	db 15
	db 13,ODDISH
	db 13,PIDGEY
	db 15,PIDGEY
	db 10,MANKEY
	db 12,MANKEY
	db 15,ODDISH
	db 16,ODDISH
	db 16,PIDGEY
	db 14,MANKEY
	db 16,MANKEY

	db 0

Route11Mons:
	db 15
	db 14,EKANS
	db 15,SPEAROW
	db 12,EKANS
	db 9,DROWZEE
	db 13,SPEAROW
	db 13,DROWZEE
	db 15,EKANS
	db 17,SPEAROW
	db 11,DROWZEE
	db 15,DROWZEE

	db 0

TunnelMonsB1:
	db 15
	db 16,ZUBAT
	db 17,ZUBAT
	db 17,GEODUDE
	db 15,MACHOP
	db 16,GEODUDE
	db 18,ZUBAT
	db 15,ZUBAT
	db 17,MACHOP
	db 13,ONIX
	db 15,ONIX

	db 0

TunnelMonsB2:
	db 15
	db 16,ZUBAT
	db 17,ZUBAT
	db 17,GEODUDE
	db 15,MACHOP
	db 16,GEODUDE
	db 18,ZUBAT
	db 17,MACHOP
	db 17,ONIX
	db 13,ONIX
	db 18,GEODUDE

	db 0

Route10Mons:
	db 15
	db 16,VOLTORB
	db 16,SPEAROW
	db 14,VOLTORB
	db 11,EKANS
	db 13,SPEAROW
	db 15,EKANS
	db 17,VOLTORB
	db 17,SPEAROW
	db 13,EKANS
	db 17,EKANS

	db 0

Route12Mons:
	db 15
	db 24,ODDISH
	db 25,PIDGEY
	db 23,PIDGEY
	db 24,VENONAT
	db 22,ODDISH
	db 26,VENONAT
	db 26,ODDISH
	db 27,PIDGEY
	db 28,GLOOM
	db 30,GLOOM

	db 0

Route8Mons:
	db 15
	db 18,PIDGEY
	db 18,MANKEY
	db 17,EKANS
	db 16,GROWLITHE
	db 20,PIDGEY
	db 20,MANKEY
	db 19,EKANS
	db 17,GROWLITHE
	db 15,GROWLITHE
	db 18,GROWLITHE

	db 0

Route7Mons:
	db 15
	db 19,PIDGEY
	db 19,ODDISH
	db 17,MANKEY
	db 22,ODDISH
	db 22,PIDGEY
	db 18,MANKEY
	db 18,GROWLITHE
	db 20,GROWLITHE
	db 19,MANKEY
	db 20,MANKEY

	db 0

TowerMons1:
	db 0
	db 0

TowerMons2:
	db 0
	db 0

TowerMons3:
	db $0A
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 19,GASTLY
	db 18,GASTLY
	db 24,GASTLY
	db 20,CUBONE
	db 22,CUBONE
	db 25,HAUNTER

	db 0

TowerMons4:
	db $0A
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 19,GASTLY
	db 18,GASTLY
	db 25,HAUNTER
	db 20,CUBONE
	db 22,CUBONE
	db 24,GASTLY

	db 0

TowerMons5:
	db $0A
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 19,GASTLY
	db 18,GASTLY
	db 25,HAUNTER
	db 20,CUBONE
	db 22,CUBONE
	db 24,GASTLY

	db 0

TowerMons6:
	db 15
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 24,GASTLY
	db 20,GASTLY
	db 19,GASTLY
	db 26,HAUNTER
	db 22,CUBONE
	db 24,CUBONE
	db 28,HAUNTER

	db 0

TowerMons7:
	db 15
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 24,GASTLY
	db 20,GASTLY
	db 28,HAUNTER
	db 22,CUBONE
	db 24,CUBONE
	db 28,HAUNTER
	db 30,HAUNTER

	db 0

Route13Mons:
	db $14
	db 24,ODDISH
	db 25,PIDGEY
	db 27,PIDGEY
	db 24,VENONAT
	db 22,ODDISH
	db 26,VENONAT
	db 26,ODDISH
	db 25,DITTO
	db 28,GLOOM
	db 30,GLOOM

	db 0

Route14Mons:
	db 15
	db 24,ODDISH
	db 26,PIDGEY
	db 23,DITTO
	db 24,VENONAT
	db 22,ODDISH
	db 26,VENONAT
	db 26,ODDISH
	db 30,GLOOM
	db 28,PIDGEOTTO
	db 30,PIDGEOTTO

	db 0

Route15Mons:
	db 15
	db 24,ODDISH
	db 26,DITTO
	db 23,PIDGEY
	db 26,VENONAT
	db 22,ODDISH
	db 28,VENONAT
	db 26,ODDISH
	db 30,GLOOM
	db 28,PIDGEOTTO
	db 30,PIDGEOTTO

	db 0

Route16Mons:
	db $19
	db 20,SPEAROW
	db 22,SPEAROW
	db 18,RATTATA
	db 20,DODUO
	db 20,RATTATA
	db 18,DODUO
	db 22,DODUO
	db 22,RATTATA
	db 23,RATICATE
	db 25,RATICATE

	db 0

Route17Mons:
	db $19
	db 20,SPEAROW
	db 22,SPEAROW
	db 25,RATICATE
	db 24,DODUO
	db 27,RATICATE
	db 26,DODUO
	db 28,DODUO
	db 29,RATICATE
	db 25,FEAROW
	db 27,FEAROW

	db 0

Route18Mons:
	db $19
	db 20,SPEAROW
	db 22,SPEAROW
	db 25,RATICATE
	db 24,DODUO
	db 25,FEAROW
	db 26,DODUO
	db 28,DODUO
	db 29,RATICATE
	db 27,FEAROW
	db 29,FEAROW

	db 0

ZoneMonsCenter:
	db $1E
	db 22,NIDORAN_M
	db 25,RHYHORN
	db 22,VENONAT
	db 24,EXEGGCUTE
	db 31,NIDORINO
	db 25,EXEGGCUTE
	db 31,NIDORINA
	db 30,PARASECT
	db 23,SCYTHER
	db 23,CHANSEY

	db 0

ZoneMons1:
	db $1E
	db 24,NIDORAN_M
	db 26,DODUO
	db 22,PARAS
	db 25,EXEGGCUTE
	db 33,NIDORINO
	db 23,EXEGGCUTE
	db 24,NIDORAN_F
	db 25,PARASECT
	db 25,KANGASKHAN
	db 28,SCYTHER

	db 0

ZoneMons2:
	db $1E
	db 22,NIDORAN_M
	db 26,RHYHORN
	db 23,PARAS
	db 25,EXEGGCUTE
	db 30,NIDORINO
	db 27,EXEGGCUTE
	db 30,NIDORINA
	db 32,VENOMOTH
	db 26,CHANSEY
	db 28,TAUROS

	db 0

ZoneMons3:
	db $1E
	db 25,NIDORAN_M
	db 26,DODUO
	db 23,VENONAT
	db 24,EXEGGCUTE
	db 33,NIDORINO
	db 26,EXEGGCUTE
	db 25,NIDORAN_F
	db 31,VENOMOTH
	db 26,TAUROS
	db 28,KANGASKHAN

	db 0

WaterMons:
	db 0

	db 5
	db 5,   TENTACOOL
	db 10,  TENTACOOL
	db 15,  TENTACOOL
	db 5,   TENTACOOL
	db 10,  TENTACOOL
	db 15,  TENTACOOL
	db 20,  TENTACOOL
	db 30,  TENTACOOL
	db 35,  TENTACOOL
	db 40,  TENTACOOL

IslandMons1:
	db 15
	db 30,SEEL
	db 30,SLOWPOKE
	db 30,SHELLDER
	db 30,HORSEA
	db 28,HORSEA
	db 21,ZUBAT
	db 29,GOLBAT
	db 28,PSYDUCK
	db 28,SHELLDER
	db 38,GOLDUCK

	db 0

IslandMonsB1:
	db $0A
	db 30,STARYU
	db 30,HORSEA
	db 32,SHELLDER
	db 32,HORSEA
	db 28,SLOWPOKE
	db 30,SEEL
	db 30,SLOWPOKE
	db 28,SEEL
	db 38,DEWGONG
	db 37,SEADRA

	db 0

IslandMonsB2:
	db $0A
	db 30,SEEL
	db 30,SLOWPOKE
	db 32,SEEL
	db 32,SLOWPOKE
	db 28,HORSEA
	db 30,STARYU
	db 30,HORSEA
	db 28,SHELLDER
	db 30,GOLBAT
	db 37,SLOWBRO

	db 0

IslandMonsB3:
	db $0A
	db 31,SLOWPOKE
	db 31,SEEL
	db 33,SLOWPOKE
	db 33,SEEL
	db 29,HORSEA
	db 31,SHELLDER
	db 31,HORSEA
	db 29,SHELLDER
	db 39,SEADRA
	db 37,DEWGONG

	db 0

IslandMonsB4:
	db $0A
	db 31,HORSEA
	db 31,SHELLDER
	db 33,HORSEA
	db 33,SHELLDER
	db 29,SLOWPOKE
	db 31,SEEL
	db 31,SLOWPOKE
	db 29,SEEL
	db 39,SLOWBRO
	db 32,GOLBAT

	db 0

MansionMons1:
	db $0A
	db 32,KOFFING
	db 30,KOFFING
	db 34,PONYTA
	db 30,PONYTA
	db 34,GROWLITHE
	db 32,PONYTA
	db 30,GRIMER
	db 28,PONYTA
	db 37,WEEZING
	db 39,MUK

	db 0

MansionMons2:
	db $0A
	db 32,GROWLITHE
	db 34,KOFFING
	db 34,KOFFING
	db 30,PONYTA
	db 30,KOFFING
	db 32,PONYTA
	db 30,GRIMER
	db 28,PONYTA
	db 39,WEEZING
	db 37,MUK

	db 0

MansionMons3:
	db $0A
	db 31,KOFFING
	db 33,GROWLITHE
	db 35,KOFFING
	db 32,PONYTA
	db 34,PONYTA
	db 40,WEEZING
	db 34,GRIMER
	db 38,WEEZING
	db 36,PONYTA
	db 42,MUK

	db 0

MansionMonsB1:
	db $0A
	db 33,KOFFING
	db 31,KOFFING
	db 35,GROWLITHE
	db 32,PONYTA
	db 31,KOFFING
	db 40,WEEZING
	db 34,PONYTA
	db 35,GRIMER
	db 42,WEEZING
	db 42,MUK

	db 0

Route21Mons:
	db $19
	db 21,RATTATA
	db 23,PIDGEY
	db 30,RATICATE
	db 23,RATTATA
	db 21,PIDGEY
	db 30,PIDGEOTTO
	db 32,PIDGEOTTO
	db 28,TANGELA
	db 30,TANGELA
	db 32,TANGELA

	db 5
	db 5,TENTACOOL
	db 10,TENTACOOL
	db 15,TENTACOOL
	db 5,TENTACOOL
	db 10,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACOOL
	db 40,TENTACOOL

DungeonMons1:
	db $0A
	db 46,GOLBAT
	db 46,HYPNO
	db 46,MAGNETON
	db 49,DODRIO
	db 49,VENOMOTH
	db 52,ARBOK
	db 49,KADABRA
	db 52,PARASECT
	db 53,RAICHU
	db 53,DITTO

	db 0

DungeonMons2:
	db 15
	db 51,DODRIO
	db 51,VENOMOTH
	db 51,KADABRA
	db 52,RHYDON
	db 52,MAROWAK
	db 52,ELECTRODE
	db 56,CHANSEY
	db 54,WIGGLYTUFF
	db 55,DITTO
	db 60,DITTO

	db 0

DungeonMonsB1:
	db $19
	db 55,RHYDON
	db 55,MAROWAK
	db 55,ELECTRODE
	db 64,CHANSEY
	db 64,PARASECT
	db 64,RAICHU
	db 57,ARBOK
	db 65,DITTO
	db 63,DITTO
	db 67,DITTO

	db 0

PowerPlantMons:
	db $0A
	db 21,VOLTORB
	db 21,MAGNEMITE
	db 20,PIKACHU
	db 24,PIKACHU
	db 23,MAGNEMITE
	db 23,VOLTORB
	db 32,MAGNETON
	db 35,MAGNETON
	db 33,ELECTABUZZ
	db 36,ELECTABUZZ

	db 0

Route23Mons:
	db $0A
	db 26,EKANS
	db 33,DITTO
	db 26,SPEAROW
	db 38,FEAROW
	db 38,DITTO
	db 38,FEAROW
	db 41,ARBOK
	db 43,DITTO
	db 41,FEAROW
	db 43,FEAROW

	db 0

PlateauMons2:
	db $0A
	db 22,MACHOP
	db 24,GEODUDE
	db 26,ZUBAT
	db 36,ONIX
	db 39,ONIX
	db 42,ONIX
	db 41,MACHOKE
	db 40,GOLBAT
	db 40,MAROWAK
	db 43,GRAVELER

	db 0

PlateauMons3:
	db 15
	db 24,MACHOP
	db 26,GEODUDE
	db 22,ZUBAT
	db 42,ONIX
	db 40,VENOMOTH
	db 45,ONIX
	db 43,GRAVELER
	db 41,GOLBAT
	db 42,MACHOKE
	db 45,MACHOKE

	db 0

PlateauMons1:
	db 15
	db 24,MACHOP
	db 26,GEODUDE
	db 22,ZUBAT
	db 36,ONIX
	db 39,ONIX
	db 42,ONIX
	db 41,GRAVELER
	db 41,GOLBAT
	db 42,MACHOKE
	db 43,MAROWAK

	db 0

CaveMons:
	db $14
	db 18,DIGLETT
	db 19,DIGLETT
	db 17,DIGLETT
	db 20,DIGLETT
	db 16,DIGLETT
	db 15,DIGLETT
	db 21,DIGLETT
	db 22,DIGLETT
	db 29,DUGTRIO
	db 31,DUGTRIO

	db 0

GetItemUse:		;$D5C7
	ld a,1
	ld [$cd6a],a
	ld a,[$cf91]	;contains item_ID
	cp a,HM_01
	jp nc,ItemUseTMHM
	ld hl,ItemUsePtrTable
	dec a
	add a
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp [hl]

ItemUsePtrTable:	;$D5E1
	dw ItemUseBall		;$5687 masterball
	dw ItemUseBall		;$5687 ultraball
	dw ItemUseBall		;$5687 greatball
	dw ItemUseBall		;$5687 pokeball
	dw ItemUseTownMap	;$5968 TownMap
	dw $5977                ;ItemUseBicycle
	dw $59B4                ;ItemUseSurfBoard (UNUSED, glitchy!)
	dw ItemUseBall		;$5687 Safariball
	dw $5A56
	dw $5A5B
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $5F52
	dw $5F67
	dw $6476
	dw $6476
	dw $6476
	dw $6476
	dw $6476
	dw $6476
	dw $5FAF
	dw $6003
	dw $6476
	dw $5A5B
	dw $5A5B
	dw $5A5B
	dw $5AB4
	dw $5AB4
	dw $5AB4
	dw $5AB4
	dw $5AB4
	dw $5AB4
	dw $6476
	dw $6476
	dw $6476
	dw $6476
	dw $6476
	dw $6013
	dw $5A5B
	dw $6022
	dw $6476
	dw $6476
	dw $60CD
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $60DC
	dw $60EB
	dw $60F0
	dw $60F5
	dw $6476
	dw $5ABB
	dw $5ABB
	dw $5ABB
	dw $6476
	dw $6476
	dw $6104
	dw $6104
	dw $6104
	dw $6104
	dw $623A
	dw $62DE
	dw $62E1
	dw $6476
	dw $6140
	dw $6476
	dw $6476
	dw $624C
	dw GoodRodCode ;$6259
	dw $6283
	dw $6317
	dw $631E
	dw $631E
	dw $631E
	dw $631E

ItemUseBall:	;03:5687
	ld a,[W_ISINBATTLE]
	and a
	jp z,ItemUseNotTime ; not in battle
	dec a
	jp nz,$658b ; in trainer battle
	ld a,[W_BATTLETYPE]
	dec a
	jr z,.UseBall\@
	ld a,[W_NUMINPARTY]	;is Party full?
	cp a,6
	jr nz,.UseBall\@
	ld a,[W_NUMINBOX]	;is Box full?
	cp a,20
	jp z,$65b1
.UseBall\@	;$56a7
;ok, you can use a ball
	xor a
	ld [$d11c],a
	ld a,[W_BATTLETYPE]
	cp a,2		;SafariBattle
	jr nz,.next2\@
	; remove a Safari Ball from inventory
	ld hl,W_NUMSAFARIBALLS
	dec [hl]
.next2\@	;$56b6
	call GoPAL_SET_CF1C
	ld a,$43
	ld [$d11e],a
	call $3725	;restore screenBuffer from Backup
	ld hl,ItemUseText00
	call PrintText
	ld hl,$583a
	ld b,$0f
	call Bankswitch
	ld b,$10
	jp z,$5801
	ld a,[W_BATTLETYPE]
	dec a
	jr nz,.next3\@
	ld hl,W_GRASSRATE	;backups wildMon data
	ld de,W_PLAYERNAME
	ld bc,11
	call CopyData
	jp .BallSuccess\@	;$578b
.next3\@	;$56e9
	ld a,[W_CURMAP]
	cp a,$93	;MonTower 6F
	jr nz,.next4\@
	ld a,[$cfd8]
	cp a,MAROWAK
	ld b,$10
	jp z,$5801
.next4\@	;$56fa
	call $3e5c	;GetRandom
	ld b,a
	ld hl,$cf91
	ld a,[hl]
	cp a,MASTER_BALL;1
	jp z,.BallSuccess\@	;$578b
	cp a,POKE_BALL	;4
	jr z,.next5\@
	ld a,200
        cp b
	jr c,.next4\@	;get only numbers < 200
	ld a,[hl]
	cp a,GREAT_BALL	;3
	jr z,.next5\@
	ld a,150	;get only numbers < 150
	cp b
	jr c,.next4\@
.next5\@	;$571a
	ld a,[$cfe9]	;status ailments
	and a
	jr z,.next6\@
	and a,(FRZ + SLP)	;is frozen and/or asleep?
	ld c,12
	jr z,.noAilments\@
	ld c,25
.noAilments\@	;$5728
	ld a,b
	sub c
	jp c,.BallSuccess\@	;$578b
	ld b,a
.next6\@	;$572e
	push bc		;save RANDOM number
	xor a
	ld [$ff96],a
	ld hl,$cff4	;enemy: Max HP
	ld a,[hli]
	ld [$ff97],a
	ld a,[hl]
	ld [$ff98],a
	ld a,255
	ld [$ff99],a
	call $38ac	;Multiply: MaxHP * 255
	ld a,[$cf91]
	cp a,GREAT_BALL
	ld a,12		;any other BallFactor
	jr nz,.next7\@
	ld a,8
.next7\@	;$574d
	ld [$ff99],a
	ld b,4		;GreatBall's BallFactor
	call $38b9	;Divide
	ld hl,$cfe6	;currentHP
	ld a,[hli]
	ld b,a
	ld a,[hl]
	srl b		;explanation:
	rr a		;we have a 16 bit value
	srl b		;equal to [b << 8 | a].
	rr a		;This number is divided
	and a		;by 4. The result is
	jr nz,.next8\@	;8 bit (reg. a). Always
	inc a		;bigger than zero.
.next8\@	;$5766
	ld [$ff99],a
	ld b,4
	call $38b9	;Divide
	ld a,[$ff97]
	and a
	jr z,.next9\@
	ld a,255
	ld [$ff98],a
.next9\@	;$5776
	pop bc
	ld a,[$d007]	;enemy: Catch Rate
	cp b
	jr c,.next10\@
        ld a,[$ff97]
        and a
        jr nz,.BallSuccess\@
	call $3e5c	;get random number
	ld b,a
	ld a,[$ff98]
	cp b
	jr c,.next10\@
.BallSuccess\@	;$578b
	jr .BallSuccess2\@
.next10\@	;$578d
	ld a,[$ff98]
	ld [$d11e],a
	xor a
	ld [$ff96],a
	ld [$ff97],a
	ld a,[$d007]	;enemy: Catch Rate
	ld [$ff98],a
	ld a,100
	ld [$ff99],a
	call $38ac	;Multiply: CatchRate * 100
	ld a,[$cf91]
	ld b,255
	cp a,POKE_BALL
	jr z,.next11\@
	ld b,200
	cp a,GREAT_BALL
	jr z,.next11\@
	ld b,150
	cp a,ULTRA_BALL
	jr z,.next11\@
.next11\@	;$57b8
	ld a,b
	ld [$ff99],a
	ld b,4
	call $38b9	;Divide
	ld a,[$ff97]
	and a
	ld b,$63
	jr nz,.next12\@
	ld a,[$d11e]
	ld [$ff99],a
	call $38ac
	ld a,255
	ld [$ff99],a
	ld b,4
	call $38b9
	ld a,[$cfe9]	;status ailments
	and a
	jr z,.next13\@
	and a,(FRZ + SLP)
	ld b,5
	jr z,.next14\@
	ld b,10
.next14\@	;$57e6
	ld a,[$ff98]
	add b
	ld [$ff98],a
.next13\@	;$57eb
	ld a,[$ff98]
	cp a,10
	ld b,$20
	jr c,.next12\@
	cp a,30
	ld b,$61
	jr c,.next12\@
	cp a,70
	ld b,$62
	jr c,.next12\@
	ld b,$63
.next12\@	;$5801
	ld a,b
	ld [$d11e],a
.BallSuccess2\@	;$5805
	ld c,20
	call DelayFrames
	ld a,$c1
	ld [$d07c],a
	xor a
	ld [$fff3],a
	ld [$cc5b],a
	ld [$d05b],a
	ld a,[$cf92]
	push af
	ld a,[$cf91]
	push af
	ld a,$08	;probably animations
	call Predef
	pop af
	ld [$cf91],a
	pop af
	ld [$cf92],a
	ld a,[$d11e]
	cp a,$10
	ld hl,ItemUseBallText00
	jp z,.printText0\@
	cp a,$20
	ld hl,ItemUseBallText01
	jp z,.printText0\@
	cp a,$61
	ld hl,ItemUseBallText02
	jp z,.printText0\@
	cp a,$62
	ld hl,ItemUseBallText03
	jp z,.printText0\@
	cp a,$63
	ld hl,ItemUseBallText04
	jp z,.printText0\@
	ld hl,$cfe6	;current HP
	ld a,[hli]
	push af
	ld a,[hli]
	push af		;backup currentHP...
	inc hl
	ld a,[hl]
	push af		;...and status ailments
	push hl
	ld hl,$d069
	bit 3,[hl]
	jr z,.next15\@
	ld a,$4c
	ld [$cfd8],a
	jr .next16\@
.next15\@	;$5871
	set 3,[hl]
	ld hl,$cceb
	ld a,[$cff1]
	ld [hli],a
	ld a,[$cff2]
	ld [hl],a
.next16\@	;$587e
	ld a,[$cf91]
	push af
	ld a,[$cfd8]
	ld [$cf91],a
	ld a,[$cff3]
	ld [$d127],a
	ld hl,$6b01
	ld b,$0f
	call Bankswitch
	pop af
	ld [$cf91],a
	pop hl
	pop af
	ld [hld],a
	dec hl
	pop af
	ld [hld],a
	pop af
	ld [hl],a
	ld a,[$cfe5]	;enemy
	ld [$d11c],a
	ld [$cf91],a
	ld [$d11e],a
	ld a,[W_BATTLETYPE]
	dec a
	jr z,.printText1\@
	ld hl,ItemUseBallText05
	call PrintText
	ld a,$3a	;convert order: Internal->Dex
	call Predef
	ld a,[$d11e]
	dec a
	ld c,a
	ld b,2
	ld hl,$d2f7	;Dex_own_flags (pokemon)
	ld a,$10
	call Predef	;check Dex flag (own already or not)
	ld a,c
	push af
	ld a,[$d11e]
	dec a
	ld c,a
	ld b,1
	ld a,$10	;set Dex_own_flag?
	call Predef
	pop af
	and a
	jr nz,.checkParty\@
	ld hl,ItemUseBallText06
	call PrintText
	call CleanLCD_OAM
	ld a,[$cfe5]	;caught mon_ID
	ld [$d11e],a
	ld a,$3d
	call Predef
.checkParty\@	;$58f4
	ld a,[W_NUMINPARTY]
	cp a,6		;is party full?
	jr z,.sendToBox\@
	xor a
	ld [$cc49],a
	call CleanLCD_OAM
	call $3927	;add mon to Party
	jr .End\@
.sendToBox\@	;$5907
	call CleanLCD_OAM
	call $67a4
	ld hl,ItemUseBallText07
	ld a,[$d7f1]
	bit 0,a		;already met Bill?
	jr nz,.sendToBox2\@
	ld hl,ItemUseBallText08
.sendToBox2\@	;$591a
	call PrintText
	jr .End\@
.printText1\@	;$591f
	ld hl,ItemUseBallText05
.printText0\@	;$5922
	call PrintText
	call CleanLCD_OAM
.End\@	;$5928
	ld a,[W_BATTLETYPE]
	and a
	ret nz
	ld hl,$d31d
	inc a
	ld [$cf96],a
	jp $2bbb	;remove ITEM (XXX)
ItemUseBallText00:
;"It dodged the thrown ball!"
;"This pokemon can't be caught"
	TX_FAR _ItemUseBallText00
	db "@"
ItemUseBallText01:
;"You missed the pokemon!"
	TX_FAR _ItemUseBallText01
	db "@"
ItemUseBallText02:
;"Darn! The pokemon broke free!"
	TX_FAR _ItemUseBallText02
	db "@"
ItemUseBallText03:
;"Aww! It appeared to be caught!"
	TX_FAR _ItemUseBallText03
	db "@"
ItemUseBallText04:
;"Shoot! It was so close too!"
	TX_FAR _ItemUseBallText04
	db "@"
ItemUseBallText05:
;"All right! {MonName} was caught!"
;play sound
	TX_FAR _ItemUseBallText05
	db $12,$06
	db "@"
ItemUseBallText07:
;"X was transferred to Bill's PC"
	TX_FAR _ItemUseBallText07
	db "@"
ItemUseBallText08:
;"X was transferred to someone's PC"
	TX_FAR _ItemUseBallText08
	db "@"

ItemUseBallText06:
;"New DEX data will be added..."
;play sound
	TX_FAR _ItemUseBallText06
	db $13,$06
	db "@"

ItemUseTownMap:	;03:5968
	ld a,[W_ISINBATTLE]	;in-battle or outside
	and a
	jp nz,ItemUseNotTime	;OAK: "this isn't the time..."

INCBIN "baserom.gbc",$D96F,$E259 - $D96F

GoodRodCode: ; 6259
	call $62B4
	jp c,ItemUseNotTime
Next625F:
	call GenRandom
	srl a
	jr c,Next6278
	and 3
	cp 2
	jr nc,Next625F
	; choose which monster appears
	ld hl,GoodRodMons
	add a,a
	ld c,a
	ld b,0
	add hl,bc
	ld b,[hl]
	inc hl
	ld c,[hl]
	and a
Next6278:
	ld a,0
	rla
	xor 1
	jr Next628E

GoodRodMons:
	db 10,GOLDEEN
	db 10,POLIWAG

Next6283:
	call $62B4
	jp c,ItemUseNotTime
Next6289:
	call $68EA
	ld a,e
Next628E:
	ld [$CD3D],a
	dec a
	jr nz,.next\@
	ld a,1
	ld [$D05F],a
	ld a,b
	ld [$D127],a
	ld a,c
	ld [$D059],a
.next\@
	ld hl,$D700
	ld a,[hl]
	push af
	push hl
	ld [hl],0
	ld b,$1C
	ld hl,$47B6
	call Bankswitch
	pop hl
	pop af
	ld [hl],a
	ret

INCBIN "baserom.gbc",$E2B4,$E479 - $E2B4

ItemUseTMHM:	;03:6479
    	INCBIN "baserom.gbc",$E479,$E581 - $E479
ItemUseNotTime:	;03:6581
    	INCBIN "baserom.gbc",$E581,$E5E8 - $E581
;ItemUseTexts:	;03:65e8
ItemUseText00:	;03:65e8
	TX_FAR _ItemUseText001
        db $05
	TX_FAR _ItemUseText002
	db "@"
INCBIN "baserom.gbc",$E5F2,$E919 - $E5F2

; super rod data
; map, pointer to fishing group
SuperRodData: ; 6919
	dbw $00,FishingGroup1
	dbw $01,FishingGroup1
	dbw $03,FishingGroup3
	dbw $05,FishingGroup4
	dbw $06,FishingGroup5
	dbw $07,FishingGroup10
	dbw $08,FishingGroup8
	dbw $0F,FishingGroup3
	dbw $11,FishingGroup4
	dbw $15,FishingGroup5
	dbw $16,FishingGroup4
	dbw $17,FishingGroup7
	dbw $18,FishingGroup7
	dbw $1C,FishingGroup7
	dbw $1D,FishingGroup7
	dbw $1E,FishingGroup8
	dbw $1F,FishingGroup8
	dbw $20,FishingGroup8
	dbw $21,FishingGroup2
	dbw $22,FishingGroup9
	dbw $23,FishingGroup3
	dbw $24,FishingGroup3
	dbw $41,FishingGroup3
	dbw $5E,FishingGroup4
	dbw $A1,FishingGroup8
	dbw $A2,FishingGroup8
	dbw $D9,FishingGroup6
	dbw $DA,FishingGroup6
	dbw $DB,FishingGroup6
	dbw $DC,FishingGroup6
	dbw $E2,FishingGroup9
	dbw $E3,FishingGroup9
	dbw $E4,FishingGroup9
	db $FF

; fishing groups
; number of monsters, followed by level/monster pairs
FishingGroup1:
	db 2
	db 15,TENTACOOL
	db 15,POLIWAG

FishingGroup2:
	db 2
	db 15,GOLDEEN
	db 15,POLIWAG

FishingGroup3:
	db 3
	db 15,PSYDUCK
	db 15,GOLDEEN
	db 15,KRABBY

FishingGroup4:
	db 2
	db 15,KRABBY
	db 15,SHELLDER

FishingGroup5:
	db 2
	db 23,POLIWHIRL
	db 15,SLOWPOKE

FishingGroup6:
	db 4
	db 15,DRATINI
	db 15,KRABBY
	db 15,PSYDUCK
	db 15,SLOWPOKE

FishingGroup7:
	db 4
	db 5,TENTACOOL
	db 15,KRABBY
	db 15,GOLDEEN
	db 15,MAGIKARP

FishingGroup8:
	db 4
	db 15,STARYU
	db 15,HORSEA
	db 15,SHELLDER
	db 15,GOLDEEN

FishingGroup9:
	db 4
	db 23,SLOWBRO
	db 23,SEAKING
	db 23,KINGLER
	db 23,SEADRA

FishingGroup10:
	db 4
	db 23,SEAKING
	db 15,KRABBY
	db 15,GOLDEEN
	db 15,MAGIKARP

INCBIN "baserom.gbc",$E9C5,$10000 - $E9C5

SECTION "bank4",DATA,BANK[$4]
INCBIN "baserom.gbc",$10000,$2EDE

RedPicFront:
	INCBIN "pic/trainer/red.pic"
ShrinkPic1:
	INCBIN "pic/trainer/shrink1.pic"
ShrinkPic2:
	INCBIN "pic/trainer/shrink2.pic"

INCBIN "baserom.gbc",$13074,$13A8F-$13074

GenRandom_: ; 7A8F
; generate a random 16-bit integer and store it at $FFD3,$FFD4
	ld a,[rDIV]
	ld b,a
	ld a,[H_RAND1]
	adc b
	ld [H_RAND1],a
	ld a,[rDIV]
	ld b,a
	ld a,[H_RAND2]
	sbc b
	ld [H_RAND2],a
	ret

SECTION "bank5",DATA,BANK[$5]
INCBIN "baserom.gbc",$14000,$4000

SECTION "bank6",DATA,BANK[$6]

CeladonCity_h: ; 0x18000
    db $00 ; tileset
    db $12,$19 ; dimensions
    dw $40df, $5966, $5956 ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connection data

    db $1B ; some map
    dw $4B95, $C7C1 ; pointers (connected, current) (strip)
    db $09, $14 ; bigness, width
    db $F8, $27 ; alignments (y, x)
    dw $C716 ; window

    db $12 ; some map
    dw $4051, $C7DD ; pointers (connected, current) (strip)
    db $09, $0A ; bigness, width
    db $F8, $00 ; alignments (y, x)
    dw $C6F9 ; window

    ; end connection data

    dw $4022 ; objects

INCBIN "baserom.gbc",$18022,$2A1-$22

PalletTown_h:
	db $00 ; tileset
	db $09,$0A ; dimensions
	dw PalletTownBlocks,PalletTownTexts,PalletTownScript
	db NORTH | SOUTH ; connections

	db $0C ; Route 1
	dw $4192,$C6EB ; pointers
	db $0A,$0A ; bigness, width
	db $23,$00 ; alignments
	dw $C809 ; window

	db $20 ; Route 21
	dw $506D,$C7AB ; pointers
	db $0A,$0A ; bigness, width
	db $00,$00 ; alignments
	dw $C6F9 ; window

	dw PalletTownObject

PalletTownObject: ; 182C3
	db $0B ; border tile

	db 3 ; warps
	db 5,5,0,$25 ; Red’s house 1F
	db 5,$D,0,$27 ; Blue’s house
	db $B,$C,1,$28 ; Oak’s Lab

	db 4 ; signs
	db $D,$D,4 ; sign by lab
	db 9,7,5 ; Pallet Town sign
	db 5,3,6 ; sign by Red’s house
	db 5,$B,7 ; sign by Blue’s house

	db 3 ; people
	db 3,5+4,8+4,$FF,$FF,1 ; Oak
	db $D,8+4,3+4,$FE,0,2 ; girl
	db $2F,$E+4,$B+4,$FE,0,3 ; fat man

	; warp‐to

	dw $C71B
	db 5,5

	dw $C71F
	db 5,$D

	dw $C74F
	db $B,$C

PalletTownBlocks:
	INCBIN "maps/pallettown.blk"

ViridianCity_h: ; 0x18357 to 0x18384 (45 bytes) (bank=6) (id=1)
    db $00 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $43ec, $50e4, $4ff1 ; blocks, texts, scripts
    db NORTH | SOUTH | WEST ; connections

    ; connections data

    db $0d ; some map
    dw $41C8, $C6F0 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $47, $f6 ; alignments (y, x)
    dw $c929 ; window

    db $0c ; some map
    dw $40fc, $c912 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $f6 ; alignments (y, x)
    dw $c6f9 ; window

    db $21 ; some map
    dw $404e, $c79e ; pointers (connected, current) (strip)
    db $09, $14 ; bigness, width
    db $f8, $27 ; alignments (y, x)
    dw $c716 ; window

    ; end connection data

    dw $4384 ; objects

INCBIN "baserom.gbc",$18384,$18554-$18384

PewterCity_h: ; 0x18554 to 0x18576 (34 bytes) (bank=6) (id=2)
    db $00 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $45e6, $538b, $5237 ; blocks, texts, scripts
    db SOUTH | EAST ; connections

    ; connections data

    db $0d ; some map
    dw $407e, $c912 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $f6 ; alignments (y, x)
    dw $c6f9 ; window

    db $0e ; some map
    dw $4255, $c7b5 ; pointers (connected, current) (strip)
    db $09, $23 ; bigness, width
    db $f8, $00 ; alignments (y, x)
    dw $c712 ; window

    ; end connection data

    dw $4577 ; objects

INCBIN "baserom.gbc",$18576,$1874e-$18576

CeruleanCity_h: ; 0x1874e to 0x18786 (56 bytes) (bank=6) (id=3)
    db $00 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $4830, $562d, $5480 ; blocks, texts, scripts
    db NORTH | SOUTH | WEST | EAST ; connections

    ; connections data

    db $23 ; some map
    dw $477d, $c6f0 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $23, $f6 ; alignments (y, x)
    dw $c809 ; window

    db $10 ; some map
    dw $45d2, $c912 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $f6 ; alignments (y, x)
    dw $c6f9 ; window

    db $0f ; some map
    dw $4416, $c79e ; pointers (connected, current) (strip)
    db $09, $2d ; bigness, width
    db $f8, $59 ; alignments (y, x)
    dw $c748 ; window

    db $14 ; some map
    dw $46fe, $c7b5 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $f8, $00 ; alignments (y, x)
    dw $c70d ; window

    ; end connection data

    dw $4786 ; objects

INCBIN "baserom.gbc",$18786,$18998-$18786

VermilionCity_h: ; 0x18998 to 0x189ba (34 bytes) (bank=6) (id=5)
    db $00 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $4a3f, $586f, $57a1 ; blocks, texts, scripts
    db NORTH | EAST ; connections

    ; connections data

    db $11 ; some map
    dw $410f, $c6f0 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $23, $f6 ; alignments (y, x)
    dw $c809 ; window

    db $16 ; some map
    dw $455f, $c7b5 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $f8, $00 ; alignments (y, x)
    dw $c70d ; window

    ; end connection data

    dw $49ba ; objects

INCBIN "baserom.gbc",$189BA,$18BA7-$189BA

FuchsiaCity_h: ; 0x18ba7 to 0x18bd4 (45 bytes) (bank=6) (id=7)
    db $00 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $4c86, $5a2e, $5a2b ; blocks, texts, scripts
    db SOUTH | WEST | EAST ; connections

    ; connections data

    db $1e ; some map
    dw $4ef1, $c912 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $f6 ; alignments (y, x)
    dw $c6f9 ; window

    db $1d ; some map
    dw $4cb2, $c79e ; pointers (connected, current) (strip)
    db $09, $19 ; bigness, width
    db $f8, $31 ; alignments (y, x)
    dw $c720 ; window

    db $1a ; some map
    dw $49cc, $c7b5 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $f8, $00 ; alignments (y, x)
    dw $c70d ; window

    ; end connection data

    dw $4bd4 ; objects

INCBIN "baserom.gbc",$18BD4,$18E5B-$18BD4

PalletTownScript:
	ld a,[$D74B]
	bit 4,a
	jr z,.next\@
	ld hl,$D747
	set 6,[hl]
.next\@
	call $3C3C
	ld hl,PalletTownScriptPointers
	ld a,[$D5F1]
	jp $3D97

PalletTownScriptPointers:
	dw PalletTownScript1,PalletTownScript2,PalletTownScript3,PalletTownScript4,PalletTownScript5,PalletTownScript6,PalletTownScript7

PalletTownScript1:
	ld a,[$D747]
	bit 0,a
	ret nz
	ld a,[W_YCOORD]
	cp 1 ; is player near north exit?
	ret nz
	xor a
	ld [$FFB4],a
	ld a,4
	ld [$D528],a
	ld a,$FF
	call $23B1 ; stop music
	ld a,2
	ld c,a ; song bank
	ld a,$DB ; “oak appears” music
	call $23A1 ; plays music
	ld a,$FC
	ld [$CD6B],a
	ld hl,$D74B
	set 7,[hl]

	; trigger the next script
	ld a,1
	ld [$D5F1],a
	ret

PalletTownScript2:
	xor a
	ld [$CF0D],a
	ld a,1
	ld [$FF8C],a
	call $2920
	ld a,$FF
	ld [$CD6B],a
	ld a,0
	ld [$CC4D],a
	ld a,$15
	call Predef

	; trigger the next script
	ld a,2
	ld [$D5F1],a
	ret

PalletTownScript3:
	ld a,1
	ld [$FF8C],a
	ld a,4
	ld [$FF8D],a
	call $34A6
	call Delay3
	ld a,1
	ld [W_YCOORD],a
	ld a,1
	ld [$FF9B],a
	ld a,1
	swap a
	ld [$FF95],a
	ld a,$22
	call Predef
	ld hl,$FF95
	dec [hl]
	ld a,$20
	call Predef ; load Oak’s movement into $CC97
	ld de,$CC97
	ld a,1 ; oak
	ld [$FF8C],a
	call MoveSprite
	ld a,$FF
	ld [$CD6B],a

	; trigger the next script
	ld a,3
	ld [$D5F1],a
	ret

PalletTownScript4:
	ld a,[$D730]
	bit 0,a
	ret nz
	xor a
	ld [$C109],a
	ld a,1
	ld [$CF0D],a
	ld a,$FC
	ld [$CD6B],a
	ld a,1
	ld [$FF8C],a
	call $2920
	ld a,$FF
	ld [$CD6B],a
	ld a,1
	ld [$CF13],a
	xor a
	ld [$CF10],a
	ld a,1
	ld [$CC57],a
	ld a,[$FFB8]
	ld [$CC58],a

	; trigger the next script
	ld a,4
	ld [$D5F1],a
	ret

PalletTownScript5:
	ld a,[$CC57]
	and a
	ret nz

	; trigger the next script
	ld a,5
	ld [$D5F1],a
	ret

PalletTownScript6:
	ld a,[$D74A]
	bit 2,a
	jr nz,.next\@
	and 3
	cp 3
	jr nz,.next\@
	ld hl,$D74A
	set 2,[hl]
	ld a,$27
	ld [$CC4D],a
	ld a,$11
	call Predef
	ld a,$28
	ld [$CC4D],a
	ld a,$15
	jp Predef
.next\@
	ld a,[$D74B]
	bit 4,a
	ret z
	ld hl,$D74B
	set 6,[hl]
PalletTownScript7:
	ret

PalletTownTexts:
	dw PalletTownText1,PalletTownText2,PalletTownText3,PalletTownText4,PalletTownText5,PalletTownText6,PalletTownText7

PalletTownText1:
	db 8
	ld a,[$CF0D]
	and a
	jr nz,.next\@
	ld a,1
	ld [$CC3C],a
	ld hl,OakAppearsText
	jr .done\@
.next\@
	ld hl,OakWalksUpText
.done\@
	call PrintText
	jp $24D7

OakAppearsText:
	TX_FAR _OakAppearsText
	db 8
	ld c,10
	call DelayFrames
	xor a
	ld [$CD4F],a
	ld [$CD50],a
	ld a,$4C
	call Predef ; display ! over head
	ld a,4
	ld [$D528],a
	jp $24D7

OakWalksUpText:
	TX_FAR _OakWalksUpText
	db "@"

PalletTownText2: ; girl
	TX_FAR _PalletTownText2
	db "@"

PalletTownText3: ; fat man
	TX_FAR _PalletTownText3
	db "@"

PalletTownText4: ; sign by lab
	TX_FAR _PalletTownText4
	db "@"

PalletTownText5: ; sign by fence
	TX_FAR _PalletTownText5
	db "@"

PalletTownText6: ; sign by Red’s house
	TX_FAR _PalletTownText6
	db "@"

PalletTownText7: ; sign by Blue’s house
	TX_FAR _PalletTownText7
	db "@"

INCBIN "baserom.gbc",$18FF1,$1B2F-$FF1

BluesHouse_h:
	db $08 ; tileset
	db $04,$04 ; dimensions
	dw BluesHouseBlocks,BluesHouseTexts,BluesHouseScript
	db 0
	dw BluesHouseObject

BluesHouseScript:
	call $3C3C
	ld hl,BluesHouseScriptPointers
	ld a,[$D5F3]
	jp $3D97

BluesHouseScriptPointers:
	dw BluesHouseScript1,BluesHouseScript2

BluesHouseScript1:
	ld hl,$D74A
	set 1,[hl]

	; trigger the next script
	ld a,1
	ld [$D5F3],a
	ret

BluesHouseScript2:
	ret

BluesHouseTexts:
	dw BluesHouseText1,BluesHouseText2,BluesHouseText3

BluesHouseText1:
	db 8
	ld a,[$D74A]
	bit 0,a
	jr nz,.GotMap\@
	ld a,[$D74B]
	bit 5,a
	jr nz,.GiveMap\@
	ld hl,DaisyInitialText
	call PrintText
	jr .done\@
.GiveMap\@
	ld hl,DaisyOfferMapText
	call PrintText
	ld bc,(TOWN_MAP << 8) | 1
	call $3E2E
	jr nc,.BagFull\@
	ld a,$29
	ld [$CC4D],a
	ld a,$11
	call Predef ; hide table map object
	ld hl,GotMapText
	call PrintText
	ld hl,$D74A
	set 0,[hl]
	jr .done\@
.GotMap\@
	ld hl,DaisyUseMapText
	call PrintText
	jr .done\@
.BagFull\@
	ld hl,DaisyBagFullText
	call PrintText
.done\@
	jp $24D7

DaisyInitialText:
	TX_FAR _DaisyInitialText
	db "@"
DaisyOfferMapText:
	TX_FAR _DaisyOfferMapText
	db "@"
GotMapText:
	TX_FAR _GotMapText
	db $11,"@"
DaisyBagFullText:
	TX_FAR _DaisyBagFullText
	db "@"
DaisyUseMapText:
	TX_FAR _DaisyUseMapText
	db "@"
BluesHouseText2: ; Daisy, walking around
	TX_FAR _BluesHouseText2
	db "@"
BluesHouseText3: ; map on table
	TX_FAR _BluesHouseText3
	db "@"

BluesHouseObject:
	db $0A ; border tile

	db 2 ; warps
	db 7,2,1,$FF
	db 7,3,1,$FF

	db 0 ; signs

	db 3 ; people
	db $11,4+3,4+2,$FF,$D3,1 ; Daisy, sitting by map
	db $11,4+4,4+6,$FE,1,ITEM|2,0 ; map on table
	db $41,4+3,4+3,$FF,$FF,ITEM|3,0 ; Daisy, walking around

	; warp-to
	dw $C712
	db 7,2

	dw $C712
	db 7,3

BluesHouseBlocks:
	INCBIN "maps/blueshouse.blk"

VermilionHouse3_h: ; 0x19c06 to 0x19c12 (12 bytes) (bank=6) (id=196)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $5c3f, $5c15, $5c12 ; blocks, texts, scripts
    db $00 ; connections

    dw $5c25 ; objects

INCBIN "baserom.gbc",$19C12,$19C4F-$19C12

IndigoPlateauLobby_h: ; 0x19c4f to 0x19c5b (12 bytes) (bank=6) (id=174)
    db $02 ; tileset
    db $06, $08 ; dimensions (y, x)
    dw $5ccf, $5c7f, $5c5b ; blocks, texts, scripts
    db $00 ; connections

    dw $5c95 ; objects

INCBIN "baserom.gbc",$19C5B,$19CFF-$19C5B

SilphCo4_h: ; 0x19cff to 0x19d0b (12 bytes) (bank=6) (id=209)
    db $16 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $5ea4, $5da0, $5d0b ; blocks, texts, scripts
    db $00 ; connections

    dw $5e35 ; objects

INCBIN "baserom.gbc",$19D0B,$19F2B-$19D0B

SilphCo5_h: ; 0x19f2b to 0x19f37 (12 bytes) (bank=6) (id=210)
    db $16 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $6116, $5fbc, $5f37 ; blocks, texts, scripts
    db $00 ; connections

    dw $608d ; objects

INCBIN "baserom.gbc",$19F37,$1A19D-$19F37

SilphCo6_h: ; 0x1a19d to 0x1a1a9 (12 bytes) (bank=6) (id=211)
    db $16 ; tileset
    db $09, $0d ; dimensions (y, x)
    dw $636b, $61f6, $61a9 ; blocks, texts, scripts
    db $00 ; connections

    dw $62fb ; objects

INCBIN "baserom.gbc",$1A1A9,$1C000-$1A1A9

SECTION "bank7",DATA,BANK[$7]

CinnabarIsland_h: ; 0x1c000 to 0x1c022 (34 bytes) (bank=7) (id=8)
    db $00 ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4069, $4a81, $4a19 ; blocks, texts, scripts
    db NORTH | EAST ; connections

    ; connections data

    db $20 ; some map
    dw $5211, $c6eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $59, $00 ; alignments (y, x)
    dw $c9b9 ; window

    db $1f ; some map
    dw $417d, $c725 ; pointers (connected, current) (strip)
    db $09, $32 ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c721 ; window

    ; end connection data

    dw $4022 ; objects

;INCBIN "baserom.gbc",$1C022,$21E-34

INCBIN "baserom.gbc",$1C022,$1C0C3-$1C022

Route1_h: ; 0x1c0c3 to 0x1c0e5 (34 bytes) (bank=7) (id=12)
    db $00 ; tileset
    db $12, $0a ; dimensions (y, x)
    dw $40fc, $4ab2, $4aaf ; blocks, texts, scripts
    db NORTH | SOUTH ; connections

    ; connections data

    db $01 ; some map
    dw $451a, $c6e8 ; pointers (connected, current) (strip)
    db $10, $14 ; bigness, width
    db $23, $0a ; alignments (y, x)
    dw $c8bd ; window

    db $00 ; some map
    dw $42fd, $c83b ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $40e5 ; objects

INCBIN "baserom.gbc",$1C0E5,$1C21E-$1C0E5

MonsterNames: ; 421E
	db "RHYDON@@@@"
	db "KANGASKHAN"
	db "NIDORAN♂@@"
	db "CLEFAIRY@@"
	db "SPEAROW@@@"
	db "VOLTORB@@@"
	db "NIDOKING@@"
	db "SLOWBRO@@@"
	db "IVYSAUR@@@"
	db "EXEGGUTOR@"
	db "LICKITUNG@"
	db "EXEGGCUTE@"
	db "GRIMER@@@@"
	db "GENGAR@@@@"
	db "NIDORAN♀@@"
	db "NIDOQUEEN@"
	db "CUBONE@@@@"
	db "RHYHORN@@@"
	db "LAPRAS@@@@"
	db "ARCANINE@@"
	db "MEW@@@@@@@"
	db "GYARADOS@@"
	db "SHELLDER@@"
	db "TENTACOOL@"
	db "GASTLY@@@@"
	db "SCYTHER@@@"
	db "STARYU@@@@"
	db "BLASTOISE@"
	db "PINSIR@@@@"
	db "TANGELA@@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "GROWLITHE@"
	db "ONIX@@@@@@"
	db "FEAROW@@@@"
	db "PIDGEY@@@@"
	db "SLOWPOKE@@"
	db "KADABRA@@@"
	db "GRAVELER@@"
	db "CHANSEY@@@"
	db "MACHOKE@@@"
	db "MR.MIME@@@"
	db "HITMONLEE@"
	db "HITMONCHAN"
	db "ARBOK@@@@@"
	db "PARASECT@@"
	db "PSYDUCK@@@"
	db "DROWZEE@@@"
	db "GOLEM@@@@@"
	db "MISSINGNO."
	db "MAGMAR@@@@"
	db "MISSINGNO."
	db "ELECTABUZZ"
	db "MAGNETON@@"
	db "KOFFING@@@"
	db "MISSINGNO."
	db "MANKEY@@@@"
	db "SEEL@@@@@@"
	db "DIGLETT@@@"
	db "TAUROS@@@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "MISSINGNO."
	db "FARFETCH'D"
	db "VENONAT@@@"
	db "DRAGONITE@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "MISSINGNO."
	db "DODUO@@@@@"
	db "POLIWAG@@@"
	db "JYNX@@@@@@"
	db "MOLTRES@@@"
	db "ARTICUNO@@"
	db "ZAPDOS@@@@"
	db "DITTO@@@@@"
	db "MEOWTH@@@@"
	db "KRABBY@@@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "MISSINGNO."
	db "VULPIX@@@@"
	db "NINETALES@"
	db "PIKACHU@@@"
	db "RAICHU@@@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "DRATINI@@@"
	db "DRAGONAIR@"
	db "KABUTO@@@@"
	db "KABUTOPS@@"
	db "HORSEA@@@@"
	db "SEADRA@@@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "SANDSHREW@"
	db "SANDSLASH@"
	db "OMANYTE@@@"
	db "OMASTAR@@@"
	db "JIGGLYPUFF"
	db "WIGGLYTUFF"
	db "EEVEE@@@@@"
	db "FLAREON@@@"
	db "JOLTEON@@@"
	db "VAPOREON@@"
	db "MACHOP@@@@"
	db "ZUBAT@@@@@"
	db "EKANS@@@@@"
	db "PARAS@@@@@"
	db "POLIWHIRL@"
	db "POLIWRATH@"
	db "WEEDLE@@@@"
	db "KAKUNA@@@@"
	db "BEEDRILL@@"
	db "MISSINGNO."
	db "DODRIO@@@@"
	db "PRIMEAPE@@"
	db "DUGTRIO@@@"
	db "VENOMOTH@@"
	db "DEWGONG@@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "CATERPIE@@"
	db "METAPOD@@@"
	db "BUTTERFREE"
	db "MACHAMP@@@"
	db "MISSINGNO."
	db "GOLDUCK@@@"
	db "HYPNO@@@@@"
	db "GOLBAT@@@@"
	db "MEWTWO@@@@"
	db "SNORLAX@@@"
	db "MAGIKARP@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "MUK@@@@@@@"
	db "MISSINGNO."
	db "KINGLER@@@"
	db "CLOYSTER@@"
	db "MISSINGNO."
	db "ELECTRODE@"
	db "CLEFABLE@@"
	db "WEEZING@@@"
	db "PERSIAN@@@"
	db "MAROWAK@@@"
	db "MISSINGNO."
	db "HAUNTER@@@"
	db "ABRA@@@@@@"
	db "ALAKAZAM@@"
	db "PIDGEOTTO@"
	db "PIDGEOT@@@"
	db "STARMIE@@@"
	db "BULBASAUR@"
	db "VENUSAUR@@"
	db "TENTACRUEL"
	db "MISSINGNO."
	db "GOLDEEN@@@"
	db "SEAKING@@@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "MISSINGNO."
	db "MISSINGNO."
	db "PONYTA@@@@"
	db "RAPIDASH@@"
	db "RATTATA@@@"
	db "RATICATE@@"
	db "NIDORINO@@"
	db "NIDORINA@@"
	db "GEODUDE@@@"
	db "PORYGON@@@"
	db "AERODACTYL"
	db "MISSINGNO."
	db "MAGNEMITE@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "CHARMANDER"
	db "SQUIRTLE@@"
	db "CHARMELEON"
	db "WARTORTLE@"
	db "CHARIZARD@"
	db "MISSINGNO."
	db "MISSINGNO."
	db "MISSINGNO."
	db "MISSINGNO."
	db "ODDISH@@@@"
	db "GLOOM@@@@@"
	db "VILEPLUME@"
	db "BELLSPROUT"
	db "WEEPINBELL"
	db "VICTREEBEL"

INCBIN "baserom.gbc",$1C98A,$1CB02-$1C98A

OaksLab_h: ; 0x1cb02 to 0x1cb0e (12 bytes) (bank=7) (id=40)
    db $05 ; tileset
    db $06, $05 ; dimensions (y, x)
    dw $41c0, $5082, $4b0e ; blocks, texts, scripts
    db $00 ; connections

    dw $540a ; objects

INCBIN "baserom.gbc",$1CB0E,$1D462-$1CB0E

ViridianMart_h: ; 0x1d462 to 0x1d46e (12 bytes) (bank=7) (id=42)
    db $02 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $5530, $54e0, $546e ; blocks, texts, scripts
    db $00 ; connections

    dw $550a ; objects

INCBIN "baserom.gbc",$1D46E,$1D540-$1D46E

School_h: ; 0x1d540 to 0x1d54c (12 bytes) (bank=7) (id=43)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41ee, $554f, $554c ; blocks, texts, scripts
    db $00 ; connections

    dw $555d ; objects

INCBIN "baserom.gbc",$1D54C,$1D57D-$1D54C

ViridianHouse_h: ; 0x1d57d to 0x1d589 (12 bytes) (bank=7) (id=44)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $558d, $558a ; blocks, texts, scripts
    db $00 ; connections

    dw $55bb ; objects

INCBIN "baserom.gbc",$1D589,$1D5E7-$1D589

PewterHouse1_h: ; 0x1d5e7 to 0x1d5f3 (12 bytes) (bank=7) (id=55)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $55f6, $55f3 ; blocks, texts, scripts
    db $00 ; connections

    dw $5616 ; objects

INCBIN "baserom.gbc",$1D5F3,$1D63C-$1D5F3

PewterHouse2_h: ; 0x1d63c to 0x1d648 (12 bytes) (bank=7) (id=57)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $564b, $5648 ; blocks, texts, scripts
    db $00 ; connections

    dw $5659 ; objects

INCBIN "baserom.gbc",$1D648,$1D679-$1D648

CeruleanHouseTrashed_h: ; 0x1d679 to 0x1d685 (12 bytes) (bank=7) (id=62)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41fe, $5689, $5685 ; blocks, texts, scripts
    db $00 ; connections

    dw $56bf ; objects

INCBIN "baserom.gbc",$1D685,$1D6EA-$1D685

CeruleanHouse2_h: ; 0x1d6ea to 0x1d6f6 (12 bytes) (bank=7) (id=63)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $56f9, $56f6 ; blocks, texts, scripts
    db $00 ; connections

    dw $5710 ; objects

INCBIN "baserom.gbc",$1D6F6,$1D730-$1D6F6

BikeShop_h: ; 0x1d730 to 0x1d73c (12 bytes) (bank=7) (id=66)
    db $15 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $588c, $573f, $573c ; blocks, texts, scripts
    db $00 ; connections

    dw $5866 ; objects

INCBIN "baserom.gbc",$1D73C,$1D89C-$1D73C

LavenderHouse1_h: ; 0x1d89c to 0x1d8a8 (12 bytes) (bank=7) (id=149)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $58ac, $58a8 ; blocks, texts, scripts
    db $00 ; connections

    dw $596a ; objects

INCBIN "baserom.gbc",$1D8A8,$1D9A2-$1D8A8

LavenderHouse2_h: ; 0x1d9a2 to 0x1d9ae (12 bytes) (bank=7) (id=151)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $59b2, $59ae ; blocks, texts, scripts
    db $00 ; connections

    dw $59e6 ; objects

INCBIN "baserom.gbc",$1D9AE,$1DA06-$1D9AE

NameRater_h: ; 0x1da06 to 0x1da12 (12 bytes) (bank=7) (id=229)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $5a54, $5a12 ; blocks, texts, scripts
    db $00 ; connections

    dw $5ad6 ; objects

INCBIN "baserom.gbc",$1DA12,$1DAF0-$1DA12

VermilionHouse1_h: ; 0x1daf0 to 0x1dafc (12 bytes) (bank=7) (id=93)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $5b00, $5afc ; blocks, texts, scripts
    db $00 ; connections

    dw $5b20 ; objects

INCBIN "baserom.gbc",$1DAFC,$1DB46-$1DAFC

VermilionDock_h: ; 0x1db46 to 0x1db52 (12 bytes) (bank=7) (id=94)
    db $0e ; tileset
    db $06, $0e ; dimensions (y, x)
    dw $5cda, $5cbf, $5b52 ; blocks, texts, scripts
    db $00 ; connections

    dw $5cc6 ; objects

INCBIN "baserom.gbc",$1DB52,$1DD2E-$1DB52

CeladonMansion5_h: ; 0x1dd2e to 0x1dd3a (12 bytes) (bank=7) (id=132)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41ee, $5d3d, $5d3a ; blocks, texts, scripts
    db $00 ; connections

    dw $5d5c ; objects

INCBIN "baserom.gbc",$1DD3A,$1DD7C-$1DD3A

FuchsiaMart_h: ; 0x1dd7c to 0x1dd88 (12 bytes) (bank=7) (id=152)
    db $02 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $5dc1, $5d8b, $5d88 ; blocks, texts, scripts
    db $00 ; connections

    dw $5d9b ; objects

INCBIN "baserom.gbc",$1DD88,$1DDD1-$1DD88

SaffronHouse1_h: ; 0x1ddd1 to 0x1dddd (12 bytes) (bank=7) (id=179)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $5de0, $5ddd ; blocks, texts, scripts
    db $00 ; connections

    dw $5e04 ; objects

INCBIN "baserom.gbc",$1DDDD,$1DE30-$1DDDD

SaffronHouse2_h: ; 0x1de30 to 0x1de3c (12 bytes) (bank=7) (id=183)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $5e3f, $5e3c ; blocks, texts, scripts
    db $00 ; connections

    dw $5e8a ; objects

INCBIN "baserom.gbc",$1DE3C,$1DEA4-$1DE3C

DiglettsCaveRoute2_h: ; 0x1dea4 to 0x1deb0 (12 bytes) (bank=7) (id=46)
    db $11 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $420e, $5eb8, $5eb0 ; blocks, texts, scripts
    db $00 ; connections

    dw $5ebf ; objects

INCBIN "baserom.gbc",$1DEB0,$1DEE1-$1DEB0

Route2House_h: ; 0x1dee1 to 0x1deed (12 bytes) (bank=7) (id=48)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $5ef0, $5eed ; blocks, texts, scripts
    db $00 ; connections

    dw $5f07 ; objects

INCBIN "baserom.gbc",$1DEED,$1DF27-$1DEED

Route5Gate_h: ; 0x1df27 to 0x1df33 (12 bytes) (bank=7) (id=70)
    db $0c ; tileset
    db $03, $04 ; dimensions (y, x)
    dw $6025, $5fa4, $5f33 ; blocks, texts, scripts
    db $00 ; connections

    dw $5ffb ; objects

INCBIN "baserom.gbc",$1DF33,$1E031-$1DF33

Route6Gate_h: ; 0x1e031 to 0x1e03d (12 bytes) (bank=7) (id=73)
    db $0c ; tileset
    db $03, $04 ; dimensions (y, x)
    dw $60e8, $60b8, $603d ; blocks, texts, scripts
    db $00 ; connections

    dw $60be ; objects

INCBIN "baserom.gbc",$1E03D,$1E0F4-$1E03D

Route7Gate_h: ; 0x1e0f4 to 0x1e100 (12 bytes) (bank=7) (id=76)
    db $0c ; tileset
    db $04, $03 ; dimensions (y, x)
    dw $61af, $617f, $6100 ; blocks, texts, scripts
    db $00 ; connections

    dw $6185 ; objects

INCBIN "baserom.gbc",$1E100,$1E1BB-$1E100

Route8Gate_h: ; 0x1e1bb to 0x1e1c7 (12 bytes) (bank=7) (id=79)
    db $0c ; tileset
    db $04, $03 ; dimensions (y, x)
    dw $6271, $6241, $61c7 ; blocks, texts, scripts
    db $00 ; connections

    dw $6247 ; objects

INCBIN "baserom.gbc",$1E1C7,$1E27D-$1E1C7

UndergroundPathEntranceRoute8_h: ; 0x1e27d to 0x1e289 (12 bytes) (bank=7) (id=80)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41b0, $6291, $6289 ; blocks, texts, scripts
    db $00 ; connections

    dw $6298 ; objects

INCBIN "baserom.gbc",$1E289,$1E2BA-$1E289

PowerPlant_h: ; 0x1e2ba to 0x1e2c6 (12 bytes) (bank=7) (id=83)
    db $16 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $6446, $62df, $62c6 ; blocks, texts, scripts
    db $00 ; connections

    dw $63bf ; objects

INCBIN "baserom.gbc",$1E2C6,$1E5AE-$1E2C6

DiglettsCaveEntranceRoute11_h: ; 0x1e5ae to 0x1e5ba (12 bytes) (bank=7) (id=85)
    db $11 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $420e, $65c3, $65ba ; blocks, texts, scripts
    db $00 ; connections

    dw $65ca ; objects

INCBIN "baserom.gbc",$1E5BA,$1E5EC-$1E5BA

Route16House_h: ; 0x1e5ec to 0x1e5f8 (12 bytes) (bank=7) (id=188)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $41de, $65fb, $65f8 ; blocks, texts, scripts
    db $00 ; connections

    dw $6657 ; objects

INCBIN "baserom.gbc",$1E5F8,$1E677-$1E5F8

Route22Gate_h: ; 0x1e677 to 0x1e683 (12 bytes) (bank=7) (id=193)
    db $0c ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $674a, $66df, $6683 ; blocks, texts, scripts
    db $00 ; connections

    dw $6720 ; objects

INCBIN "baserom.gbc",$1E683,$1E75E-$1E683

BillsHouse_h: ; 0x1e75e to 0x1e76a (12 bytes) (bank=7) (id=88)
    db $10 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $6905, $6834, $676a ; blocks, texts, scripts
    db $00 ; connections

    dw $68df ; objects

INCBIN "baserom.gbc",$1E76A,$20000-$1E76A

SECTION "bank8",DATA,BANK[$8]
INCBIN "baserom.gbc",$20000,$4000

SECTION "bank9",DATA,BANK[$9]
RhydonPicFront:
	INCBIN "pic/bmon/rhydon.pic"
RhydonPicBack:
	INCBIN "pic/monback/rhydonb.pic"
KangaskhanPicFront:
	INCBIN "pic/bmon/kangaskhan.pic"
KangaskhanPicBack:
	INCBIN "pic/monback/kangaskhanb.pic"
NidoranMPicFront:
	INCBIN "pic/bmon/nidoranm.pic"
NidoranMPicBack:
	INCBIN "pic/monback/nidoranmb.pic"
ClefairyPicFront:
	INCBIN "pic/bmon/clefairy.pic"
ClefairyPicBack:
	INCBIN "pic/monback/clefairyb.pic"
SpearowPicFront:
	INCBIN "pic/bmon/spearow.pic"
SpearowPicBack:
	INCBIN "pic/monback/spearowb.pic"
VoltorbPicFront:
	INCBIN "pic/bmon/voltorb.pic"
VoltorbPicBack:
	INCBIN "pic/monback/voltorbb.pic"
NidokingPicFront:
	INCBIN "pic/bmon/nidoking.pic"
NidokingPicBack:
	INCBIN "pic/monback/nidokingb.pic"
SlowbroPicFront:
	INCBIN "pic/bmon/slowbro.pic"
SlowbroPicBack:
	INCBIN "pic/monback/slowbrob.pic"
IvysaurPicFront:
	INCBIN "pic/bmon/ivysaur.pic"
IvysaurPicBack:
	INCBIN "pic/monback/ivysaurb.pic"
ExeggutorPicFront:
	INCBIN "pic/bmon/exeggutor.pic"
ExeggutorPicBack:
	INCBIN "pic/monback/exeggutorb.pic"
LickitungPicFront:
	INCBIN "pic/bmon/lickitung.pic"
LickitungPicBack:
	INCBIN "pic/monback/lickitungb.pic"
ExeggcutePicFront:
	INCBIN "pic/bmon/exeggcute.pic"
ExeggcutePicBack:
	INCBIN "pic/monback/exeggcuteb.pic"
GrimerPicFront:
	INCBIN "pic/bmon/grimer.pic"
GrimerPicBack:
	INCBIN "pic/monback/grimerb.pic"
GengarPicFront:
	INCBIN "pic/bmon/gengar.pic"
GengarPicBack:
	INCBIN "pic/monback/gengarb.pic"
NidoranFPicFront:
	INCBIN "pic/bmon/nidoranf.pic"
NidoranFPicBack:
	INCBIN "pic/monback/nidoranfb.pic"
NidoqueenPicFront:
	INCBIN "pic/bmon/nidoqueen.pic"
NidoqueenPicBack:
	INCBIN "pic/monback/nidoqueenb.pic"
CubonePicFront:
	INCBIN "pic/bmon/cubone.pic"
CubonePicBack:
	INCBIN "pic/monback/cuboneb.pic"
RhyhornPicFront:
	INCBIN "pic/bmon/rhyhorn.pic"
RhyhornPicBack:
	INCBIN "pic/monback/rhyhornb.pic"
LaprasPicFront:
	INCBIN "pic/bmon/lapras.pic"
LaprasPicBack:
	INCBIN "pic/monback/laprasb.pic"
ArcaninePicFront:
	INCBIN "pic/bmon/arcanine.pic"
ArcaninePicBack:
	INCBIN "pic/monback/arcanineb.pic"
GyaradosPicFront:
	INCBIN "pic/bmon/gyarados.pic"
GyaradosPicBack:
	INCBIN "pic/monback/gyaradosb.pic"
ShellderPicFront:
	INCBIN "pic/bmon/shellder.pic"
ShellderPicBack:
	INCBIN "pic/monback/shellderb.pic"
TentacoolPicFront:
	INCBIN "pic/bmon/tentacool.pic"
TentacoolPicBack:
	INCBIN "pic/monback/tentacoolb.pic"
GastlyPicFront:
	INCBIN "pic/bmon/gastly.pic"
GastlyPicBack:
	INCBIN "pic/monback/gastlyb.pic"
ScytherPicFront:
	INCBIN "pic/bmon/scyther.pic"
ScytherPicBack:
	INCBIN "pic/monback/scytherb.pic"
StaryuPicFront:
	INCBIN "pic/bmon/staryu.pic"
StaryuPicBack:
	INCBIN "pic/monback/staryub.pic"
BlastoisePicFront:
	INCBIN "pic/bmon/blastoise.pic"
BlastoisePicBack:
	INCBIN "pic/monback/blastoiseb.pic"
PinsirPicFront:
	INCBIN "pic/bmon/pinsir.pic"
PinsirPicBack:
	INCBIN "pic/monback/pinsirb.pic"
TangelaPicFront:
	INCBIN "pic/bmon/tangela.pic"
TangelaPicBack:
	INCBIN "pic/monback/tangelab.pic"

INCBIN "baserom.gbc",$27d6b,$27DAE - $27d6b

TypeNamePointers: ; 7DAE
	dw Type00Name
	dw Type01Name
	dw Type02Name
	dw Type03Name
	dw Type04Name
	dw Type05Name
	dw Type06Name
	dw Type07Name
	dw Type08Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type00Name
	dw Type14Name
	dw Type15Name
	dw Type16Name
	dw Type17Name
	dw Type18Name
	dw Type19Name
	dw Type1AName

Type00Name:
	db "NORMAL@"
Type01Name:
	db "FIGHTING@"
Type02Name:
	db "FLYING@"
Type03Name:
	db "POISON@"
Type14Name:
	db "FIRE@"
Type15Name:
	db "WATER@"
Type16Name:
	db "GRASS@"
Type17Name:
	db "ELECTRIC@"
Type18Name:
	db "PSYCHIC@"
Type19Name:
	db "ICE@"
Type04Name:
	db "GROUND@"
Type05Name:
	db "ROCK@"
Type06Name:
	db "BIRD@"
Type07Name:
	db "BUG@"
Type08Name:
	db "GHOST@"
Type1AName:
	db "DRAGON@"

SaveTrainerName: ; 7E4A
	ld hl,TrainerNamePointers
	ld a,[W_TRAINERCLASS]
	dec a
	ld c,a
	ld b,0
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,$CD6D
.CopyCharacter\@
	ld a,[hli]
	ld [de],a
	inc de
	cp "@"
	jr nz,.CopyCharacter\@
	ret

TrainerNamePointers:
; what is the point of these?
	dw YoungsterName
	dw BugCatcherName
	dw LassName
	dw $D04A
	dw JrTrainerMName
	dw JrTrainerFName
	dw PokemaniacName
	dw SuperNerdName
	dw $D04A
	dw $D04A
	dw BurglarName
	dw EngineerName
	dw JugglerXName
	dw $D04A
	dw SwimmerName
	dw $D04A
	dw $D04A
	dw BeautyName
	dw $D04A
	dw RockerName
	dw JugglerName
	dw $D04A
	dw $D04A
	dw BlackbeltName
	dw $D04A
	dw ProfOakName
	dw ChiefName
	dw ScientistName
	dw $D04A
	dw RocketName
	dw CooltrainerMName
	dw CooltrainerFName
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A
	dw $D04A

YoungsterName:
	db "YOUNGSTER@"
BugCatcherName:
	db "BUG CATCHER@"
LassName:
	db "LASS@"
JrTrainerMName:
	db "JR.TRAINER♂@"
JrTrainerFName:
	db "JR.TRAINER♀@"
PokemaniacName:
	db "POKéMANIAC@"
SuperNerdName:
	db "SUPER NERD@"
BurglarName:
	db "BURGLAR@"
EngineerName:
	db "ENGINEER@"
JugglerXName:
	db "JUGGLER@"
SwimmerName:
	db "SWIMMER@"
BeautyName:
	db "BEAUTY@"
RockerName:
	db "ROCKER@"
JugglerName:
	db "JUGGLER@"
BlackbeltName:
	db "BLACKBELT@"
ProfOakName:
	db "PROF.OAK@"
ChiefName:
	db "CHIEF@"
ScientistName:
	db "SCIENTIST@"
RocketName:
	db "ROCKET@"
CooltrainerMName:
	db "COOLTRAINER♂@"
CooltrainerFName:
	db "COOLTRAINER♀@"

INCBIN "baserom.gbc",$27f86,$27fb8-$27f86

SECTION "bankA",DATA,BANK[$A]
GrowlithePicFront:
	INCBIN "pic/bmon/growlithe.pic"
GrowlithePicBack:
	INCBIN "pic/monback/growlitheb.pic"
OnixPicFront:
	INCBIN "pic/bmon/onix.pic"
OnixPicBack:
	INCBIN "pic/monback/onixb.pic"
FearowPicFront:
	INCBIN "pic/bmon/fearow.pic"
FearowPicBack:
	INCBIN "pic/monback/fearowb.pic"
PidgeyPicFront:
	INCBIN "pic/bmon/pidgey.pic"
PidgeyPicBack:
	INCBIN "pic/monback/pidgeyb.pic"
SlowpokePicFront:
	INCBIN "pic/bmon/slowpoke.pic"
SlowpokePicBack:
	INCBIN "pic/monback/slowpokeb.pic"
KadabraPicFront:
	INCBIN "pic/bmon/kadabra.pic"
KadabraPicBack:
	INCBIN "pic/monback/kadabrab.pic"
GravelerPicFront:
	INCBIN "pic/bmon/graveler.pic"
GravelerPicBack:
	INCBIN "pic/monback/gravelerb.pic"
ChanseyPicFront:
	INCBIN "pic/bmon/chansey.pic"
ChanseyPicBack:
	INCBIN "pic/monback/chanseyb.pic"
MachokePicFront:
	INCBIN "pic/bmon/machoke.pic"
MachokePicBack:
	INCBIN "pic/monback/machokeb.pic"
MrMimePicFront:
	INCBIN "pic/bmon/mr.mime.pic"
MrMimePicBack:
	INCBIN "pic/monback/mr.mimeb.pic"
HitmonleePicFront:
	INCBIN "pic/bmon/hitmonlee.pic"
HitmonleePicBack:
	INCBIN "pic/monback/hitmonleeb.pic"
HitmonchanPicFront:
	INCBIN "pic/bmon/hitmonchan.pic"
HitmonchanPicBack:
	INCBIN "pic/monback/hitmonchanb.pic"
ArbokPicFront:
	INCBIN "pic/bmon/arbok.pic"
ArbokPicBack:
	INCBIN "pic/monback/arbokb.pic"
ParasectPicFront:
	INCBIN "pic/bmon/parasect.pic"
ParasectPicBack:
	INCBIN "pic/monback/parasectb.pic"
PsyduckPicFront:
	INCBIN "pic/bmon/psyduck.pic"
PsyduckPicBack:
	INCBIN "pic/monback/psyduckb.pic"
DrowzeePicFront:
	INCBIN "pic/bmon/drowzee.pic"
DrowzeePicBack:
	INCBIN "pic/monback/drowzeeb.pic"
GolemPicFront:
	INCBIN "pic/bmon/golem.pic"
GolemPicBack:
	INCBIN "pic/monback/golemb.pic"
MagmarPicFront:
	INCBIN "pic/bmon/magmar.pic"
MagmarPicBack:
	INCBIN "pic/monback/magmarb.pic"
ElectabuzzPicFront:
	INCBIN "pic/bmon/electabuzz.pic"
ElectabuzzPicBack:
	INCBIN "pic/monback/electabuzzb.pic"
MagnetonPicFront:
	INCBIN "pic/bmon/magneton.pic"
MagnetonPicBack:
	INCBIN "pic/monback/magnetonb.pic"
KoffingPicFront:
	INCBIN "pic/bmon/koffing.pic"
KoffingPicBack:
	INCBIN "pic/monback/koffingb.pic"
MankeyPicFront:
	INCBIN "pic/bmon/mankey.pic"
MankeyPicBack:
	INCBIN "pic/monback/mankeyb.pic"
SeelPicFront:
	INCBIN "pic/bmon/seel.pic"
SeelPicBack:
	INCBIN "pic/monback/seelb.pic"
DiglettPicFront:
	INCBIN "pic/bmon/diglett.pic"
DiglettPicBack:
	INCBIN "pic/monback/diglettb.pic"
TaurosPicFront:
	INCBIN "pic/bmon/tauros.pic"
TaurosPicBack:
	INCBIN "pic/monback/taurosb.pic"
FarfetchdPicFront:
	INCBIN "pic/bmon/farfetchd.pic"
FarfetchdPicBack:
	INCBIN "pic/monback/farfetchdb.pic"
VenonatPicFront:
	INCBIN "pic/bmon/venonat.pic"
VenonatPicBack:
	INCBIN "pic/monback/venonatb.pic"
DragonitePicFront:
	INCBIN "pic/bmon/dragonite.pic"
DragonitePicBack:
	INCBIN "pic/monback/dragoniteb.pic"
DoduoPicFront:
	INCBIN "pic/bmon/doduo.pic"
DoduoPicBack:
	INCBIN "pic/monback/doduob.pic"
PoliwagPicFront:
	INCBIN "pic/bmon/poliwag.pic"
PoliwagPicBack:
	INCBIN "pic/monback/poliwagb.pic"
JynxPicFront:
	INCBIN "pic/bmon/jynx.pic"
JynxPicBack:
	INCBIN "pic/monback/jynxb.pic"
MoltresPicFront:
	INCBIN "pic/bmon/moltres.pic"
MoltresPicBack:
	INCBIN "pic/monback/moltresb.pic"

INCBIN "baserom.gbc",$2bea9,$3efc-$3ea9

SECTION "bankB",DATA,BANK[$B]
ArticunoPicFront:
	INCBIN "pic/bmon/articuno.pic"
ArticunoPicBack:
	INCBIN "pic/monback/articunob.pic"
ZapdosPicFront:
	INCBIN "pic/bmon/zapdos.pic"
ZapdosPicBack:
	INCBIN "pic/monback/zapdosb.pic"
DittoPicFront:
	INCBIN "pic/bmon/ditto.pic"
DittoPicBack:
	INCBIN "pic/monback/dittob.pic"
MeowthPicFront:
	INCBIN "pic/bmon/meowth.pic"
MeowthPicBack:
	INCBIN "pic/monback/meowthb.pic"
KrabbyPicFront:
	INCBIN "pic/bmon/krabby.pic"
KrabbyPicBack:
	INCBIN "pic/monback/krabbyb.pic"
VulpixPicFront:
	INCBIN "pic/bmon/vulpix.pic"
VulpixPicBack:
	INCBIN "pic/monback/vulpixb.pic"
NinetalesPicFront:
	INCBIN "pic/bmon/ninetales.pic"
NinetalesPicBack:
	INCBIN "pic/monback/ninetalesb.pic"
PikachuPicFront:
	INCBIN "pic/bmon/pikachu.pic"
PikachuPicBack:
	INCBIN "pic/monback/pikachub.pic"
RaichuPicFront:
	INCBIN "pic/bmon/raichu.pic"
RaichuPicBack:
	INCBIN "pic/monback/raichub.pic"
DratiniPicFront:
	INCBIN "pic/bmon/dratini.pic"
DratiniPicBack:
	INCBIN "pic/monback/dratinib.pic"
DragonairPicFront:
	INCBIN "pic/bmon/dragonair.pic"
DragonairPicBack:
	INCBIN "pic/monback/dragonairb.pic"
KabutoPicFront:
	INCBIN "pic/bmon/kabuto.pic"
KabutoPicBack:
	INCBIN "pic/monback/kabutob.pic"
KabutopsPicFront:
	INCBIN "pic/bmon/kabutops.pic"
KabutopsPicBack:
	INCBIN "pic/monback/kabutopsb.pic"
HorseaPicFront:
	INCBIN "pic/bmon/horsea.pic"
HorseaPicBack:
	INCBIN "pic/monback/horseab.pic"
SeadraPicFront:
	INCBIN "pic/bmon/seadra.pic"
SeadraPicBack:
	INCBIN "pic/monback/seadrab.pic"
SandshrewPicFront:
	INCBIN "pic/bmon/sandshrew.pic"
SandshrewPicBack:
	INCBIN "pic/monback/sandshrewb.pic"
SandslashPicFront:
	INCBIN "pic/bmon/sandslash.pic"
SandslashPicBack:
	INCBIN "pic/monback/sandslashb.pic"
OmanytePicFront:
	INCBIN "pic/bmon/omanyte.pic"
OmanytePicBack:
	INCBIN "pic/monback/omanyteb.pic"
OmastarPicFront:
	INCBIN "pic/bmon/omastar.pic"
OmastarPicBack:
	INCBIN "pic/monback/omastarb.pic"
JigglypuffPicFront:
	INCBIN "pic/bmon/jigglypuff.pic"
JigglypuffPicBack:
	INCBIN "pic/monback/jigglypuffb.pic"
WigglytuffPicFront:
	INCBIN "pic/bmon/wigglytuff.pic"
WigglytuffPicBack:
	INCBIN "pic/monback/wigglytuffb.pic"
EeveePicFront:
	INCBIN "pic/bmon/eevee.pic"
EeveePicBack:
	INCBIN "pic/monback/eeveeb.pic"
FlareonPicFront:
	INCBIN "pic/bmon/flareon.pic"
FlareonPicBack:
	INCBIN "pic/monback/flareonb.pic"
JolteonPicFront:
	INCBIN "pic/bmon/jolteon.pic"
JolteonPicBack:
	INCBIN "pic/monback/jolteonb.pic"
VaporeonPicFront:
	INCBIN "pic/bmon/vaporeon.pic"
VaporeonPicBack:
	INCBIN "pic/monback/vaporeonb.pic"
MachopPicFront:
	INCBIN "pic/bmon/machop.pic"
MachopPicBack:
	INCBIN "pic/monback/machopb.pic"
ZubatPicFront:
	INCBIN "pic/bmon/zubat.pic"
ZubatPicBack:
	INCBIN "pic/monback/zubatb.pic"
EkansPicFront:
	INCBIN "pic/bmon/ekans.pic"
EkansPicBack:
	INCBIN "pic/monback/ekansb.pic"
ParasPicFront:
	INCBIN "pic/bmon/paras.pic"
ParasPicBack:
	INCBIN "pic/monback/parasb.pic"
PoliwhirlPicFront:
	INCBIN "pic/bmon/poliwhirl.pic"
PoliwhirlPicBack:
	INCBIN "pic/monback/poliwhirlb.pic"
PoliwrathPicFront:
	INCBIN "pic/bmon/poliwrath.pic"
PoliwrathPicBack:
	INCBIN "pic/monback/poliwrathb.pic"
WeedlePicFront:
	INCBIN "pic/bmon/weedle.pic"
WeedlePicBack:
	INCBIN "pic/monback/weedleb.pic"
KakunaPicFront:
	INCBIN "pic/bmon/kakuna.pic"
KakunaPicBack:
	INCBIN "pic/monback/kakunab.pic"
BeedrillPicFront:
	INCBIN "pic/bmon/beedrill.pic"
BeedrillPicBack:
	INCBIN "pic/monback/beedrillb.pic"
FossilKabutopsPic:
	INCBIN "pic/bmon/fossilkabutops.pic"

INCBIN "baserom.gbc",$2fb7b,$2ff3c-$2fb7b

SECTION "bankC",DATA,BANK[$C]
DodrioPicFront:
	INCBIN "pic/bmon/dodrio.pic"
DodrioPicBack:
	INCBIN "pic/monback/dodriob.pic"
PrimeapePicFront:
	INCBIN "pic/bmon/primeape.pic"
PrimeapePicBack:
	INCBIN "pic/monback/primeapeb.pic"
DugtrioPicFront:
	INCBIN "pic/bmon/dugtrio.pic"
DugtrioPicBack:
	INCBIN "pic/monback/dugtriob.pic"
VenomothPicFront:
	INCBIN "pic/bmon/venomoth.pic"
VenomothPicBack:
	INCBIN "pic/monback/venomothb.pic"
DewgongPicFront:
	INCBIN "pic/bmon/dewgong.pic"
DewgongPicBack:
	INCBIN "pic/monback/dewgongb.pic"
CaterpiePicFront:
	INCBIN "pic/bmon/caterpie.pic"
CaterpiePicBack:
	INCBIN "pic/monback/caterpieb.pic"
MetapodPicFront:
	INCBIN "pic/bmon/metapod.pic"
MetapodPicBack:
	INCBIN "pic/monback/metapodb.pic"
ButterfreePicFront:
	INCBIN "pic/bmon/butterfree.pic"
ButterfreePicBack:
	INCBIN "pic/monback/butterfreeb.pic"
MachampPicFront:
	INCBIN "pic/bmon/machamp.pic"
MachampPicBack:
	INCBIN "pic/monback/machampb.pic"
GolduckPicFront:
	INCBIN "pic/bmon/golduck.pic"
GolduckPicBack:
	INCBIN "pic/monback/golduckb.pic"
HypnoPicFront:
	INCBIN "pic/bmon/hypno.pic"
HypnoPicBack:
	INCBIN "pic/monback/hypnob.pic"
GolbatPicFront:
	INCBIN "pic/bmon/golbat.pic"
GolbatPicBack:
	INCBIN "pic/monback/golbatb.pic"
MewtwoPicFront:
	INCBIN "pic/bmon/mewtwo.pic"
MewtwoPicBack:
	INCBIN "pic/monback/mewtwob.pic"
SnorlaxPicFront:
	INCBIN "pic/bmon/snorlax.pic"
SnorlaxPicBack:
	INCBIN "pic/monback/snorlaxb.pic"
MagikarpPicFront:
	INCBIN "pic/bmon/magikarp.pic"
MagikarpPicBack:
	INCBIN "pic/monback/magikarpb.pic"
MukPicFront:
	INCBIN "pic/bmon/muk.pic"
MukPicBack:
	INCBIN "pic/monback/mukb.pic"
KinglerPicFront:
	INCBIN "pic/bmon/kingler.pic"
KinglerPicBack:
	INCBIN "pic/monback/kinglerb.pic"
CloysterPicFront:
	INCBIN "pic/bmon/cloyster.pic"
CloysterPicBack:
	INCBIN "pic/monback/cloysterb.pic"
ElectrodePicFront:
	INCBIN "pic/bmon/electrode.pic"
ElectrodePicBack:
	INCBIN "pic/monback/electrodeb.pic"
ClefablePicFront:
	INCBIN "pic/bmon/clefable.pic"
ClefablePicBack:
	INCBIN "pic/monback/clefableb.pic"
WeezingPicFront:
	INCBIN "pic/bmon/weezing.pic"
WeezingPicBack:
	INCBIN "pic/monback/weezingb.pic"
PersianPicFront:
	INCBIN "pic/bmon/persian.pic"
PersianPicBack:
	INCBIN "pic/monback/persianb.pic"
MarowakPicFront:
	INCBIN "pic/bmon/marowak.pic"
MarowakPicBack:
	INCBIN "pic/monback/marowakb.pic"
HaunterPicFront:
	INCBIN "pic/bmon/haunter.pic"
HaunterPicBack:
	INCBIN "pic/monback/haunterb.pic"
AbraPicFront:
	INCBIN "pic/bmon/abra.pic"
AbraPicBack:
	INCBIN "pic/monback/abrab.pic"
AlakazamPicFront:
	INCBIN "pic/bmon/alakazam.pic"
AlakazamPicBack:
	INCBIN "pic/monback/alakazamb.pic"
PidgeottoPicFront:
	INCBIN "pic/bmon/pidgeotto.pic"
PidgeottoPicBack:
	INCBIN "pic/monback/pidgeottob.pic"
PidgeotPicFront:
	INCBIN "pic/bmon/pidgeot.pic"
PidgeotPicBack:
	INCBIN "pic/monback/pidgeotb.pic"
StarmiePicFront:
	INCBIN "pic/bmon/starmie.pic"
StarmiePicBack:
	INCBIN "pic/monback/starmieb.pic"
RedPicBack:
	INCBIN "pic/trainer/redb.pic"
OldManPic:
	INCBIN "pic/trainer/oldman.pic"

INCBIN "baserom.gbc",$33f2b,$3f90-$3f2b

SECTION "bankD",DATA,BANK[$D]
BulbasaurPicFront:
	INCBIN "pic/bmon/bulbasaur.pic"
BulbasaurPicBack:
	INCBIN "pic/monback/bulbasaurb.pic"
VenusaurPicFront:
	INCBIN "pic/bmon/venusaur.pic"
VenusaurPicBack:
	INCBIN "pic/monback/venusaurb.pic"
TentacruelPicFront:
	INCBIN "pic/bmon/tentacruel.pic"
TentacruelPicBack:
	INCBIN "pic/monback/tentacruelb.pic"
GoldeenPicFront:
	INCBIN "pic/bmon/goldeen.pic"
GoldeenPicBack:
	INCBIN "pic/monback/goldeenb.pic"
SeakingPicFront:
	INCBIN "pic/bmon/seaking.pic"
SeakingPicBack:
	INCBIN "pic/monback/seakingb.pic"
PonytaPicFront:
	INCBIN "pic/bmon/ponyta.pic"
RapidashPicFront:
	INCBIN "pic/bmon/rapidash.pic"
PonytaPicBack:
	INCBIN "pic/monback/ponytab.pic"
RapidashPicBack:
	INCBIN "pic/monback/rapidashb.pic"
RattataPicFront:
	INCBIN "pic/bmon/rattata.pic"
RattataPicBack:
	INCBIN "pic/monback/rattatab.pic"
RaticatePicFront:
	INCBIN "pic/bmon/raticate.pic"
RaticatePicBack:
	INCBIN "pic/monback/raticateb.pic"
NidorinoPicFront:
	INCBIN "pic/bmon/nidorino.pic"
NidorinoPicBack:
	INCBIN "pic/monback/nidorinob.pic"
NidorinaPicFront:
	INCBIN "pic/bmon/nidorina.pic"
NidorinaPicBack:
	INCBIN "pic/monback/nidorinab.pic"
GeodudePicFront:
	INCBIN "pic/bmon/geodude.pic"
GeodudePicBack:
	INCBIN "pic/monback/geodudeb.pic"
PorygonPicFront:
	INCBIN "pic/bmon/porygon.pic"
PorygonPicBack:
	INCBIN "pic/monback/porygonb.pic"
AerodactylPicFront:
	INCBIN "pic/bmon/aerodactyl.pic"
AerodactylPicBack:
	INCBIN "pic/monback/aerodactylb.pic"
MagnemitePicFront:
	INCBIN "pic/bmon/magnemite.pic"
MagnemitePicBack:
	INCBIN "pic/monback/magnemiteb.pic"
CharmanderPicFront:
	INCBIN "pic/bmon/charmander.pic"
CharmanderPicBack:
	INCBIN "pic/monback/charmanderb.pic"
SquirtlePicFront:
	INCBIN "pic/bmon/squirtle.pic"
SquirtlePicBack:
	INCBIN "pic/monback/squirtleb.pic"
CharmeleonPicFront:
	INCBIN "pic/bmon/charmeleon.pic"
CharmeleonPicBack:
	INCBIN "pic/monback/charmeleonb.pic"
WartortlePicFront:
	INCBIN "pic/bmon/wartortle.pic"
WartortlePicBack:
	INCBIN "pic/monback/wartortleb.pic"
CharizardPicFront:
	INCBIN "pic/bmon/charizard.pic"
CharizardPicBack:
	INCBIN "pic/monback/charizardb.pic"
FossilAerodactylPic:
	INCBIN "pic/bmon/fossilaerodactyl.pic"
GhostPic:
	INCBIN "pic/other/ghost.pic"
OddishPicFront:
	INCBIN "pic/bmon/oddish.pic"
OddishPicBack:
	INCBIN "pic/monback/oddishb.pic"
GloomPicFront:
	INCBIN "pic/bmon/gloom.pic"
GloomPicBack:
	INCBIN "pic/monback/gloomb.pic"
VileplumePicFront:
	INCBIN "pic/bmon/vileplume.pic"
VileplumePicBack:
	INCBIN "pic/monback/vileplumeb.pic"
BellsproutPicFront:
	INCBIN "pic/bmon/bellsprout.pic"
BellsproutPicBack:
	INCBIN "pic/monback/bellsproutb.pic"
WeepinbellPicFront:
	INCBIN "pic/bmon/weepinbell.pic"
WeepinbellPicBack:
	INCBIN "pic/monback/weepinbellb.pic"
VictreebelPicFront:
	INCBIN "pic/bmon/victreebel.pic"
VictreebelPicBack:
	INCBIN "pic/monback/victreebelb.pic"

INCBIN "baserom.gbc",$37244,$3e88-$3244

SECTION "bankE",DATA,BANK[$E]

Attacks: ; 4000
; characteristics of each attack
; animation, effect, power, type, accuracy, PP
db POUND       ,$00,$28,NORMAL,$FF,35
db KARATE_CHOP ,$00,$32,NORMAL,$FF,25
db DOUBLESLAP  ,$1D,$0F,NORMAL,$D8,10
db COMET_PUNCH ,$1D,$12,NORMAL,$D8,15
db MEGA_PUNCH  ,$00,$50,NORMAL,$D8,20
db PAY_DAY     ,$10,$28,NORMAL,$FF,20
db FIRE_PUNCH  ,$04,$4B,FIRE,$FF,15
db ICE_PUNCH   ,$05,$4B,ICE,$FF,15
db THUNDERPUNCH,$06,$4B,ELECTRIC,$FF,15
db SCRATCH     ,$00,$28,NORMAL,$FF,35
db VICEGRIP    ,$00,$37,NORMAL,$FF,30
db GUILLOTINE  ,$26,$01,NORMAL,$4C,5
db RAZOR_WIND  ,$27,$50,NORMAL,$BF,10
db SWORDS_DANCE,$32,$00,NORMAL,$FF,30
db CUT         ,$00,$32,NORMAL,$F2,30
db GUST        ,$00,$28,NORMAL,$FF,35
db WING_ATTACK ,$00,$23,FLYING,$FF,35
db WHIRLWIND   ,$1C,$00,NORMAL,$D8,20
db FLY         ,$2B,$46,FLYING,$F2,15
db BIND        ,$2A,$0F,NORMAL,$BF,20
db SLAM        ,$00,$50,NORMAL,$BF,20
db VINE_WHIP   ,$00,$23,GRASS,$FF,10
db STOMP       ,$25,$41,NORMAL,$FF,20
db DOUBLE_KICK ,$2C,$1E,FIGHTING,$FF,30
db MEGA_KICK   ,$00,$78,NORMAL,$BF,5
db JUMP_KICK   ,$2D,$46,FIGHTING,$F2,25
db ROLLING_KICK,$25,$3C,FIGHTING,$D8,15
db SAND_ATTACK ,$16,$00,NORMAL,$FF,15
db HEADBUTT    ,$25,$46,NORMAL,$FF,15
db HORN_ATTACK ,$00,$41,NORMAL,$FF,25
db FURY_ATTACK ,$1D,$0F,NORMAL,$D8,20
db HORN_DRILL  ,$26,$01,NORMAL,$4C,5
db TACKLE      ,$00,$23,NORMAL,$F2,35
db BODY_SLAM   ,$24,$55,NORMAL,$FF,15
db WRAP        ,$2A,$0F,NORMAL,$D8,20
db TAKE_DOWN   ,$30,$5A,NORMAL,$D8,20
db THRASH      ,$1B,$5A,NORMAL,$FF,20
db DOUBLE_EDGE ,$30,$64,NORMAL,$FF,15
db TAIL_WHIP   ,$13,$00,NORMAL,$FF,30
db POISON_STING,$02,$0F,POISON,$FF,35
db TWINEEDLE   ,$4D,$19,BUG,$FF,20
db PIN_MISSILE ,$1D,$0E,BUG,$D8,20
db LEER        ,$13,$00,NORMAL,$FF,30
db BITE        ,$1F,$3C,NORMAL,$FF,25
db GROWL       ,$12,$00,NORMAL,$FF,40
db ROAR        ,$1C,$00,NORMAL,$FF,20
db SING        ,$20,$00,NORMAL,$8C,15
db SUPERSONIC  ,$31,$00,NORMAL,$8C,20
db SONICBOOM   ,$29,$01,NORMAL,$E5,20
db DISABLE     ,$56,$00,NORMAL,$8C,20
db ACID        ,$45,$28,POISON,$FF,30
db EMBER       ,$04,$28,FIRE,$FF,25
db FLAMETHROWER,$04,$5F,FIRE,$FF,15
db MIST        ,$2E,$00,ICE,$FF,30
db WATER_GUN   ,$00,$28,WATER,$FF,25
db HYDRO_PUMP  ,$00,$78,WATER,$CC,5
db SURF        ,$00,$5F,WATER,$FF,15
db ICE_BEAM    ,$05,$5F,ICE,$FF,10
db BLIZZARD    ,$05,$78,ICE,$E5,5
db PSYBEAM     ,$4C,$41,PSYCHIC,$FF,20
db BUBBLEBEAM  ,$46,$41,WATER,$FF,20
db AURORA_BEAM ,$44,$41,ICE,$FF,20
db HYPER_BEAM  ,$50,$96,NORMAL,$E5,5
db PECK        ,$00,$23,FLYING,$FF,35
db DRILL_PECK  ,$00,$50,FLYING,$FF,20
db SUBMISSION  ,$30,$50,FIGHTING,$CC,25
db LOW_KICK    ,$25,$32,FIGHTING,$E5,20
db COUNTER     ,$00,$01,FIGHTING,$FF,20
db SEISMIC_TOSS,$29,$01,FIGHTING,$FF,20
db STRENGTH    ,$00,$50,NORMAL,$FF,15
db ABSORB      ,$03,$14,GRASS,$FF,20
db MEGA_DRAIN  ,$03,$28,GRASS,$FF,10
db LEECH_SEED  ,$54,$00,GRASS,$E5,10
db GROWTH      ,$0D,$00,NORMAL,$FF,40
db RAZOR_LEAF  ,$00,$37,GRASS,$F2,25
db SOLARBEAM   ,$27,$78,GRASS,$FF,10
db POISONPOWDER,$42,$00,POISON,$BF,35
db STUN_SPORE  ,$43,$00,GRASS,$BF,30
db SLEEP_POWDER,$20,$00,GRASS,$BF,15
db PETAL_DANCE ,$1B,$46,GRASS,$FF,20
db STRING_SHOT ,$14,$00,BUG,$F2,40
db DRAGON_RAGE ,$29,$01,DRAGON,$FF,10
db FIRE_SPIN   ,$2A,$0F,FIRE,$B2,15
db THUNDERSHOCK,$06,$28,ELECTRIC,$FF,30
db THUNDERBOLT ,$06,$5F,ELECTRIC,$FF,15
db THUNDER_WAVE,$43,$00,ELECTRIC,$FF,20
db THUNDER     ,$06,$78,ELECTRIC,$B2,10
db ROCK_THROW  ,$00,$32,ROCK,$A5,15
db EARTHQUAKE  ,$00,$64,GROUND,$FF,10
db FISSURE     ,$26,$01,GROUND,$4C,5
db DIG         ,$27,$64,GROUND,$FF,10
db TOXIC       ,$42,$00,POISON,$D8,10
db CONFUSION   ,$4C,$32,PSYCHIC,$FF,25
db PSYCHIC_M   ,$47,$5A,PSYCHIC,$FF,10
db HYPNOSIS    ,$20,$00,PSYCHIC,$99,20
db MEDITATE    ,$0A,$00,PSYCHIC,$FF,40
db AGILITY     ,$34,$00,PSYCHIC,$FF,30
db QUICK_ATTACK,$00,$28,NORMAL,$FF,30
db RAGE        ,$51,$14,NORMAL,$FF,20
db TELEPORT    ,$1C,$00,PSYCHIC,$FF,20
db NIGHT_SHADE ,$29,$00,GHOST,$FF,15
db MIMIC       ,$52,$00,NORMAL,$FF,10
db SCREECH     ,$3B,$00,NORMAL,$D8,40
db DOUBLE_TEAM ,$0F,$00,NORMAL,$FF,15
db RECOVER     ,$38,$00,NORMAL,$FF,20
db HARDEN      ,$0B,$00,NORMAL,$FF,30
db MINIMIZE    ,$0F,$00,NORMAL,$FF,20
db SMOKESCREEN ,$16,$00,NORMAL,$FF,20
db CONFUSE_RAY ,$31,$00,GHOST,$FF,10
db WITHDRAW    ,$0B,$00,WATER,$FF,40
db DEFENSE_CURL,$0B,$00,NORMAL,$FF,40
db BARRIER     ,$33,$00,PSYCHIC,$FF,30
db LIGHT_SCREEN,$40,$00,PSYCHIC,$FF,30
db HAZE        ,$19,$00,ICE,$FF,30
db REFLECT     ,$41,$00,PSYCHIC,$FF,20
db FOCUS_ENERGY,$2F,$00,NORMAL,$FF,30
db BIDE        ,$1A,$00,NORMAL,$FF,10
db METRONOME   ,$53,$00,NORMAL,$FF,10
db MIRROR_MOVE ,$09,$00,FLYING,$FF,20
db SELFDESTRUCT,$07,$82,NORMAL,$FF,5
db EGG_BOMB    ,$00,$64,NORMAL,$BF,10
db LICK        ,$24,$14,GHOST,$FF,30
db SMOG        ,$21,$14,POISON,$B2,20
db SLUDGE      ,$21,$41,POISON,$FF,20
db BONE_CLUB   ,$1F,$41,GROUND,$D8,20
db FIRE_BLAST  ,$22,$78,FIRE,$D8,5
db WATERFALL   ,$00,$50,WATER,$FF,15
db CLAMP       ,$2A,$23,WATER,$BF,10
db SWIFT       ,$11,$3C,NORMAL,$FF,20
db SKULL_BASH  ,$27,$64,NORMAL,$FF,15
db SPIKE_CANNON,$1D,$14,NORMAL,$FF,15
db CONSTRICT   ,$46,$0A,NORMAL,$FF,35
db AMNESIA     ,$35,$00,PSYCHIC,$FF,20
db KINESIS     ,$16,$00,PSYCHIC,$CC,15
db SOFTBOILED  ,$38,$00,NORMAL,$FF,10
db HI_JUMP_KICK,$2D,$55,FIGHTING,$E5,20
db GLARE       ,$43,$00,NORMAL,$BF,30
db DREAM_EATER ,$08,$64,PSYCHIC,$FF,15
db POISON_GAS  ,$42,$00,POISON,$8C,40
db BARRAGE     ,$1D,$0F,NORMAL,$D8,20
db LEECH_LIFE  ,$03,$14,BUG,$FF,15
db LOVELY_KISS ,$20,$00,NORMAL,$BF,10
db SKY_ATTACK  ,$27,$8C,FLYING,$E5,5
db TRANSFORM   ,$39,$00,NORMAL,$FF,10
db BUBBLE      ,$46,$14,WATER,$FF,30
db DIZZY_PUNCH ,$00,$46,NORMAL,$FF,10
db SPORE       ,$20,$00,GRASS,$FF,15
db FLASH       ,$16,$00,NORMAL,$B2,20
db PSYWAVE     ,$29,$01,PSYCHIC,$CC,15
db SPLASH      ,$55,$00,NORMAL,$FF,40
db ACID_ARMOR  ,$33,$00,POISON,$FF,40
db CRABHAMMER  ,$00,$5A,WATER,$D8,10
db EXPLOSION   ,$07,$AA,NORMAL,$FF,5
db FURY_SWIPES ,$1D,$12,NORMAL,$CC,15
db BONEMERANG  ,$2C,$32,GROUND,$E5,10
db REST        ,$38,$00,PSYCHIC,$FF,10
db ROCK_SLIDE  ,$00,$4B,ROCK,$E5,10
db HYPER_FANG  ,$1F,$50,NORMAL,$E5,15
db SHARPEN     ,$0A,$00,NORMAL,$FF,30
db CONVERSION  ,$18,$00,NORMAL,$FF,30
db TRI_ATTACK  ,$00,$50,NORMAL,$FF,10
db SUPER_FANG  ,$28,$01,NORMAL,$E5,10
db SLASH       ,$00,$46,NORMAL,$FF,20
db SUBSTITUTE  ,$4F,$00,NORMAL,$FF,10
db STRUGGLE    ,$30,$32,NORMAL,$FF,10

INCBIN "baserom.gbc",$383DE,$39884 - $383DE

ReadAttack: ; 5884
	push hl
	push de
	push bc
	dec a
	ld hl,Attacks
	ld bc,6
	call AddNTimes
	ld de,$CFCC
	call CopyData
	pop bc
	pop de
	pop hl
	ret

; trainer data: from 5C53 to 652E
INCBIN "baserom.gbc",$3989B,$399FF - $3989B

TrainerNames: ; 59FF
	db "YOUNGSTER@"
	db "BUG CATCHER@"
	db "LASS@"
	db "SAILOR@"
	db "JR.TRAINER♂@"
	db "JR.TRAINER♀@"
	db "POKéMANIAC@"
	db "SUPER NERD@"
	db "HIKER@"
	db "BIKER@"
	db "BURGLAR@"
	db "ENGINEER@"
	db "JUGGLER@"
	db "FISHERMAN@"
	db "SWIMMER@"
	db "CUE BALL@"
	db "GAMBLER@"
	db "BEAUTY@"
	db "PSYCHIC@"
	db "ROCKER@"
	db "JUGGLER@"
	db "TAMER@"
	db "BIRD KEEPER@"
	db "BLACKBELT@"
	db "RIVAL1@"
	db "PROF.OAK@"
	db "CHIEF@"
	db "SCIENTIST@"
	db "GIOVANNI@"
	db "ROCKET@"
	db "COOLTRAINER♂@"
	db "COOLTRAINER♀@"
	db "BRUNO@"
	db "BROCK@"
	db "MISTY@"
	db "LT.SURGE@"
	db "ERIKA@"
	db "KOGA@"
	db "BLAINE@"
	db "SABRINA@"
	db "GENTLEMAN@"
	db "RIVAL2@"
	db "RIVAL3@"
	db "LORELEI@"
	db "CHANNELER@"
	db "AGATHA@"
	db "LANCE@"

INCBIN "baserom.gbc",$39B87,$39C53 - $39B87
ReadTrainer: ; 5C53

; don't change any moves in a link battle
	ld a,[W_ISLINKBATTLE]
	and a
	ret nz

; set [W_ENEMYMONCOUNT] to 0, [$D89D] to FF
; XXX first is total enemy pokemon?
; XXX second is species of first pokemon?
	ld hl,W_ENEMYMONCOUNT
	xor a
	ld [hli],a
	dec a
	ld [hl],a

; get the pointer to trainer data for this class
	ld a,[W_CUROPPONENT]
	sub $C9 ; convert value from pokemon to trainer
	add a,a
	ld hl,TrainerDataPointers
	ld c,a
	ld b,0
	add hl,bc ; hl points to trainer class
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[W_TRAINERNO]
	ld b,a
; At this point b contains the trainer number,
; and hl points to the trainer class.
; Our next task is to iterate through the trainers,
; decrementing b each time, until we get to the right one.
.outer\@
	dec b
	jr z,.IterateTrainer
.inner\@
	ld a,[hli]
	and a
	jr nz,.inner\@
	jr .outer\@

; if the first byte of trainer data is FF,
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [W_LONEATTACKNO] != 0, one pokemon on the team has a special move
; else the first byte is the level of every pokemon on the team
.IterateTrainer
	ld a,[hli]
	cp $FF ; is the trainer special?
	jr z,.SpecialTrainer\@ ; if so, check for special attacks
	ld [W_CURENEMYLVL],a
.LoopTrainerData\@
	ld a,[hli]
	and a ; have we reached the end of the trainer data?
	jr z,.FinishUp\@
	ld [$CF91],a ; write species somewhere (XXX why?)
	ld a,1
	ld [$CC49],a
	push hl
	call $3927
	pop hl
	jr .LoopTrainerData\@
.SpecialTrainer\@
; if this code is being run:
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [W_LONEATTACKNO] != 0, one pokemon on the team has a special move
	ld a,[hli]
	and a ; have we reached the end of the trainer data?
	jr z,.AddLoneAttack\@
	ld [W_CURENEMYLVL],a
	ld a,[hli]
	ld [$CF91],a
	ld a,1
	ld [$CC49],a
	push hl
	call $3927
	pop hl
	jr .SpecialTrainer\@
.AddLoneAttack\@
; does the trainer have a single monster with a different move
	ld a,[W_LONEATTACKNO] ; Brock is 01, Misty is 02, Erika is 04, etc
	and a
	jr z,.AddTeamAttack\@
	dec a
	add a,a
	ld c,a
	ld b,0
	ld hl,LoneAttacks
	add hl,bc
	ld a,[hli]
	ld d,[hl]
	ld hl,W_ENEMYMON1MOVE3
	ld bc,W_ENEMYMON2MOVE3 - W_ENEMYMON1MOVE3
	call AddNTimes
	ld [hl],d
	jr .FinishUp\@
.AddTeamAttack\@
; check if our trainer's team has special moves

; get trainer class number
	ld a,[$D059]
	sub $C8
	ld b,a
	ld hl,TeamAttacks

; iterate through entries in TeamAttacks, checking each for our trainer class
.IterateTeamAttacks\@
	ld a,[hli]
	cp b
	jr z,.GiveTeamAttacks\@ ; is there a match?
	inc hl ; if not, go to the next entry
	inc a
	jr nz,.IterateTeamAttacks\@

	; no matches found. is this trainer champion rival?
	ld a,b
	cp SONY3
	jr z,.ChampionRival\@
	jr .FinishUp\@ ; nope
.GiveTeamAttacks\@
	ld a,[hl]
	ld [$D95E],a
	jr .FinishUp\@
.ChampionRival\@ ; give attacks to his team

; pidgeot
	ld a,SKY_ATTACK
	ld [W_ENEMYMON1MOVE3],a

; starter
	ld a,[W_RIVALSTARTER]
	cp BULBASAUR
	ld b,MEGA_DRAIN
	jr z,.GiveStarterMove\@
	cp CHARMANDER
	ld b,FIRE_BLAST
	jr z,.GiveStarterMove\@
	ld b,BLIZZARD ; must be squirtle
.GiveStarterMove\@
	ld a,b
	ld [W_ENEMYMON6MOVE3],a
.FinishUp\@ ; XXX this needs documenting
	xor a       ; clear D079-D07B
	ld de,$D079
	ld [de],a
	inc de
	ld [de],a
	inc de
	ld [de],a
	ld a,[W_CURENEMYLVL]
	ld b,a
.LastLoop\@
	ld hl,$D047
	ld c,2
	push bc
	ld a,$B
	call Predef
	pop bc
	inc de
	inc de
	dec b
	jr nz,.LastLoop\@
	ret

LoneAttacks: ; 5D22
; these are used for gym leaders.
; this is not automatic! you have to write the number you want to W_LONEATTACKNO
; first. e.g., erika's script writes 4 to W_LONEATTACKNO to get mega drain,
; the fourth entry in the list.

; first byte:  pokemon in the trainer's party that gets the move
; second byte: move
; unterminated
	db 1,BIDE
	db 1,BUBBLEBEAM
	db 2,THUNDERBOLT
	db 2,MEGA_DRAIN
	db 3,TOXIC
	db 3,PSYWAVE
	db 3,FIRE_BLAST
	db 4,FISSURE

TeamAttacks: ; 5D32
; these are used for elite four.
; this is automatic, based on trainer class.
; don't be confused by LoneAttacks above, the two data structures are
	; _completely_ unrelated.

; first byte: trainer (all trainers in this class have this move)
; second byte: move
; ff-terminated
	db LORELEI,BLIZZARD
	db BRUNO,FISSURE
	db AGATHA,TOXIC
	db LANCE,BARRIER
	db $FF

TrainerDataPointers: ; 5D3B
	dw YoungsterData,BugCatcherData,LassData,SailorData,JrTrainerMData
	dw JrTrainerFData,PokemaniacData,SuperNerdData,HikerData,BikerData
	dw BurglarData,EngineerData,Juggler1Data,FisherData,SwimmerData
	dw CueBallData,GamblerData,BeautyData,PsychicData,RockerData
	dw JugglerData,TamerData,BirdKeeperData,BlackbeltData,Green1Data
	dw ProfOakData,ChiefData,ScientistData,GiovanniData,RocketData
	dw CooltrainerMData,CooltrainerFData,BrunoData,BrockData,MistyData
	dw LtSurgeData,ErikaData,KogaData,BlaineData,SabrinaData
	dw GentlemanData,Green2Data,Green3Data,LoreleiData,ChannelerData
	dw AgathaData,LanceData

; if first byte != FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == FF, then
	; first byte is FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
	db 11,RATTATA,EKANS,0
	db 14,SPEAROW,0
	db 10,RATTATA,RATTATA,ZUBAT,0
	db 14,RATTATA,EKANS,ZUBAT,0
	db 15,RATTATA,SPEAROW,0
	db 17,SLOWPOKE,0
	db 14,EKANS,SANDSHREW,0
	db 21,NIDORAN_M,0
	db 21,EKANS,0
	db 19,SANDSHREW,ZUBAT,0
	db 17,RATTATA,RATTATA,RATICATE,0
	db 18,NIDORAN_M,NIDORINO,0
	db 17,SPEAROW,RATTATA,RATTATA,SPEAROW,0
BugCatcherData:
	db 6,WEEDLE,CATERPIE,0
	db 7,WEEDLE,KAKUNA,WEEDLE,0
	db 9,WEEDLE,0
	db 10,CATERPIE,WEEDLE,CATERPIE,0
	db 9,WEEDLE,KAKUNA,CATERPIE,METAPOD,0
	db 11,CATERPIE,METAPOD,0
	db 11,WEEDLE,KAKUNA,0
	db 10,CATERPIE,METAPOD,CATERPIE,0
	db 14,CATERPIE,WEEDLE,0
	db 16,WEEDLE,CATERPIE,WEEDLE,0
	db 20,BUTTERFREE,0
	db 18,METAPOD,CATERPIE,VENONAT,0
	db 19,BEEDRILL,BEEDRILL,0
	db 20,CATERPIE,WEEDLE,VENONAT,0
LassData:
	db 9,PIDGEY,PIDGEY,0
	db 10,RATTATA,NIDORAN_M,0
	db 14,JIGGLYPUFF,0
	db 31,PARAS,PARAS,PARASECT,0
	db 11,ODDISH,BELLSPROUT,0
	db 14,CLEFAIRY,0
	db 16,PIDGEY,NIDORAN_F,0
	db 14,PIDGEY,NIDORAN_F,0
	db 15,NIDORAN_M,NIDORAN_F,0
	db 13,ODDISH,PIDGEY,ODDISH,0
	db 18,PIDGEY,NIDORAN_F,0
	db 18,RATTATA,PIKACHU,0
	db 23,NIDORAN_F,NIDORINA,0
	db 24,MEOWTH,MEOWTH,MEOWTH,0
	db 19,PIDGEY,RATTATA,NIDORAN_M,MEOWTH,PIKACHU,0
	db 22,CLEFAIRY,CLEFAIRY,0
	db 23,BELLSPROUT,WEEPINBELL,0
	db 23,ODDISH,GLOOM,0
SailorData:
	db 18,MACHOP,SHELLDER,0
	db 17,MACHOP,TENTACOOL,0
	db 21,SHELLDER,0
	db 17,HORSEA,SHELLDER,TENTACOOL,0
	db 18,TENTACOOL,STARYU,0
	db 17,HORSEA,HORSEA,HORSEA,0
	db 20,MACHOP,0
	db 21,PIKACHU,PIKACHU,0
JrTrainerMData:
	db 11,DIGLETT,SANDSHREW,0
	db 14,RATTATA,EKANS,0
	db 18,MANKEY,0
	db 20,SQUIRTLE,0
	db 16,SPEAROW,RATICATE,0
	db 18,DIGLETT,DIGLETT,SANDSHREW,0
	db 21,GROWLITHE,CHARMANDER,0
	db 19,RATTATA,DIGLETT,EKANS,SANDSHREW,0
	db 29,NIDORAN_M,NIDORINO,0
JrTrainerFData:
	db 19,GOLDEEN,0
	db 16,RATTATA,PIKACHU,0
	db 16,PIDGEY,PIDGEY,PIDGEY,0
	db 22,BULBASAUR,0
	db 18,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0
	db 23,MEOWTH,0
	db 20,PIKACHU,CLEFAIRY,0
	db 21,PIDGEY,PIDGEOTTO,0
	db 21,JIGGLYPUFF,PIDGEY,MEOWTH,0
	db 22,ODDISH,BULBASAUR,0
	db 24,BULBASAUR,IVYSAUR,0
	db 24,PIDGEY,MEOWTH,RATTATA,PIKACHU,MEOWTH,0
	db 30,POLIWAG,POLIWAG,0
	db 27,PIDGEY,MEOWTH,PIDGEY,PIDGEOTTO,0
	db 28,GOLDEEN,POLIWAG,HORSEA,0
	db 31,GOLDEEN,SEAKING,0
	db 22,BELLSPROUT,CLEFAIRY,0
	db 20,MEOWTH,ODDISH,PIDGEY,0
	db 19,PIDGEY,RATTATA,RATTATA,BELLSPROUT,0
	db 28,GLOOM,ODDISH,ODDISH,0
	db 29,PIKACHU,RAICHU,0
	db 33,CLEFAIRY,0
	db 29,BELLSPROUT,ODDISH,TANGELA,0
	db 30,TENTACOOL,HORSEA,SEEL,0
PokemaniacData:
	db 30,RHYHORN,LICKITUNG,0
	db 20,CUBONE,SLOWPOKE,0
	db 20,SLOWPOKE,SLOWPOKE,SLOWPOKE,0
	db 22,CHARMANDER,CUBONE,0
	db 25,SLOWPOKE,0
	db 40,CHARMELEON,LAPRAS,LICKITUNG,0
	db 23,CUBONE,SLOWPOKE,0
SuperNerdData:
	db 11,MAGNEMITE,VOLTORB,0
	db 12,GRIMER,VOLTORB,KOFFING,0
	db 20,VOLTORB,KOFFING,VOLTORB,MAGNEMITE,0
	db 22,GRIMER,MUK,GRIMER,0
	db 26,KOFFING,0
	db 22,KOFFING,MAGNEMITE,WEEZING,0
	db 20,MAGNEMITE,MAGNEMITE,KOFFING,MAGNEMITE,0
	db 24,MAGNEMITE,VOLTORB,0
	db 36,VULPIX,VULPIX,NINETALES,0
	db 34,PONYTA,CHARMANDER,VULPIX,GROWLITHE,0
	db 41,RAPIDASH,0
	db 37,GROWLITHE,VULPIX,0
HikerData:
	db 10,GEODUDE,GEODUDE,ONIX,0
	db 15,MACHOP,GEODUDE,0
	db 13,GEODUDE,GEODUDE,MACHOP,GEODUDE,0
	db 17,ONIX,0
	db 21,GEODUDE,ONIX,0
	db 20,GEODUDE,MACHOP,GEODUDE,0
	db 21,GEODUDE,ONIX,0
	db 19,ONIX,GRAVELER,0
	db 21,GEODUDE,GEODUDE,GRAVELER,0
	db 25,GEODUDE,0
	db 20,MACHOP,ONIX,0
	db 19,GEODUDE,MACHOP,GEODUDE,GEODUDE,0
	db 20,ONIX,ONIX,GEODUDE,0
	db 21,GEODUDE,GRAVELER,0
BikerData:
	db 28,KOFFING,KOFFING,KOFFING,0
	db 29,KOFFING,GRIMER,0
	db 25,KOFFING,KOFFING,WEEZING,KOFFING,GRIMER,0
	db 28,KOFFING,GRIMER,WEEZING,0
	db 29,GRIMER,KOFFING,0
	db 33,WEEZING,0
	db 26,GRIMER,GRIMER,GRIMER,GRIMER,0
	db 28,WEEZING,KOFFING,WEEZING,0
	db 33,MUK,0
	db 29,VOLTORB,VOLTORB,0
	db 29,WEEZING,MUK,0
	db 25,KOFFING,WEEZING,KOFFING,KOFFING,WEEZING,0
	db 26,KOFFING,KOFFING,GRIMER,KOFFING,0
	db 28,GRIMER,GRIMER,KOFFING,0
	db 29,KOFFING,MUK,0
BurglarData:
	db 29,GROWLITHE,VULPIX,0
	db 33,GROWLITHE,0
	db 28,VULPIX,CHARMANDER,PONYTA,0
	db 36,GROWLITHE,VULPIX,NINETALES,0
	db 41,PONYTA,0
	db 37,VULPIX,GROWLITHE,0
	db 34,CHARMANDER,CHARMELEON,0
	db 38,NINETALES,0
	db 34,GROWLITHE,PONYTA,0
EngineerData:
	db 21,VOLTORB,MAGNEMITE,0
	db 21,MAGNEMITE,0
	db 18,MAGNEMITE,MAGNEMITE,MAGNETON,0
Juggler1Data:
; none
FisherData:
	db 17,GOLDEEN,TENTACOOL,GOLDEEN,0
	db 17,TENTACOOL,STARYU,SHELLDER,0
	db 22,GOLDEEN,POLIWAG,GOLDEEN,0
	db 24,TENTACOOL,GOLDEEN,0
	db 27,GOLDEEN,0
	db 21,POLIWAG,SHELLDER,GOLDEEN,HORSEA,0
	db 28,SEAKING,GOLDEEN,SEAKING,SEAKING,0
	db 31,SHELLDER,CLOYSTER,0
	db 27,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,0
	db 33,SEAKING,GOLDEEN,0
	db 24,MAGIKARP,MAGIKARP,0
SwimmerData:
	db 16,HORSEA,SHELLDER,0
	db 30,TENTACOOL,SHELLDER,0
	db 29,GOLDEEN,HORSEA,STARYU,0
	db 30,POLIWAG,POLIWHIRL,0
	db 27,HORSEA,TENTACOOL,TENTACOOL,GOLDEEN,0
	db 29,GOLDEEN,SHELLDER,SEAKING,0
	db 30,HORSEA,HORSEA,0
	db 27,TENTACOOL,TENTACOOL,STARYU,HORSEA,TENTACRUEL,0
	db 31,SHELLDER,CLOYSTER,0
	db 35,STARYU,0
	db 28,HORSEA,HORSEA,SEADRA,HORSEA,0
	db 33,SEADRA,TENTACRUEL,0
	db 37,STARMIE,0
	db 33,STARYU,WARTORTLE,0
	db 32,POLIWHIRL,TENTACOOL,SEADRA,0
CueBallData:
	db 28,MACHOP,MANKEY,MACHOP,0
	db 29,MANKEY,MACHOP,0
	db 33,MACHOP,0
	db 29,MANKEY,PRIMEAPE,0
	db 29,MACHOP,MACHOKE,0
	db 33,MACHOKE,0
	db 26,MANKEY,MANKEY,MACHOKE,MACHOP,0
	db 29,PRIMEAPE,MACHOKE,0
	db 31,TENTACOOL,TENTACOOL,TENTACRUEL,0
GamblerData:
	db 18,POLIWAG,HORSEA,0
	db 18,BELLSPROUT,ODDISH,0
	db 18,VOLTORB,MAGNEMITE,0
	db 18,GROWLITHE,VULPIX,0
	db 22,POLIWAG,POLIWAG,POLIWHIRL,0
	db 22,ONIX,GEODUDE,GRAVELER,0
	db 24,GROWLITHE,VULPIX,0
BeautyData:
	db 21,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0
	db 24,BELLSPROUT,BELLSPROUT,0
	db 26,EXEGGCUTE,0
	db 27,RATTATA,PIKACHU,RATTATA,0
	db 29,CLEFAIRY,MEOWTH,0
	db 35,SEAKING,0
	db 30,SHELLDER,SHELLDER,CLOYSTER,0
	db 31,POLIWAG,SEAKING,0
	db 29,PIDGEOTTO,WIGGLYTUFF,0
	db 29,BULBASAUR,IVYSAUR,0
	db 33,WEEPINBELL,BELLSPROUT,WEEPINBELL,0
	db 27,POLIWAG,GOLDEEN,SEAKING,GOLDEEN,POLIWAG,0
	db 30,GOLDEEN,SEAKING,0
	db 29,STARYU,STARYU,STARYU,0
	db 30,SEADRA,HORSEA,SEADRA,0
PsychicData:
	db 31,KADABRA,SLOWPOKE,MR__MIME,KADABRA,0
	db 34,MR__MIME,KADABRA,0
	db 33,SLOWPOKE,SLOWPOKE,SLOWBRO,0
	db 38,SLOWBRO,0
RockerData:
	db 20,VOLTORB,MAGNEMITE,VOLTORB,0
	db 29,VOLTORB,ELECTRODE,0
JugglerData:
	db 29,KADABRA,MR__MIME,0
	db 41,DROWZEE,HYPNO,KADABRA,KADABRA,0
	db 31,DROWZEE,DROWZEE,KADABRA,DROWZEE,0
	db 34,DROWZEE,HYPNO,0
	db 48,MR__MIME,0
	db 33,HYPNO,0
	db 38,HYPNO,0
	db 34,DROWZEE,KADABRA,0
TamerData:
	db 34,SANDSLASH,ARBOK,0
	db 33,ARBOK,SANDSLASH,ARBOK,0
	db 43,RHYHORN,0
	db 39,ARBOK,TAUROS,0
	db 44,PERSIAN,GOLDUCK,0
	db 42,RHYHORN,PRIMEAPE,ARBOK,TAUROS,0
BirdKeeperData:
	db 29,PIDGEY,PIDGEOTTO,0
	db 25,SPEAROW,PIDGEY,PIDGEY,SPEAROW,SPEAROW,0
	db 26,PIDGEY,PIDGEOTTO,SPEAROW,FEAROW,0
	db 33,FARFETCH_D,0
	db 29,SPEAROW,FEAROW,0
	db 26,PIDGEOTTO,FARFETCH_D,DODUO,PIDGEY,0
	db 28,DODRIO,DODUO,DODUO,0
	db 29,SPEAROW,FEAROW,0
	db 34,DODRIO,0
	db 26,SPEAROW,SPEAROW,FEAROW,SPEAROW,0
	db 30,FEAROW,FEAROW,PIDGEOTTO,0
	db 39,PIDGEOTTO,PIDGEOTTO,PIDGEY,PIDGEOTTO,0
	db 42,FARFETCH_D,FEAROW,0
	db 28,PIDGEY,DODUO,PIDGEOTTO,0
	db 26,PIDGEY,SPEAROW,PIDGEY,FEAROW,0
	db 29,PIDGEOTTO,FEAROW,0
	db 28,SPEAROW,DODUO,FEAROW,0
BlackbeltData:
	db 37,HITMONLEE,HITMONCHAN,0
	db 31,MANKEY,MANKEY,PRIMEAPE,0
	db 32,MACHOP,MACHOKE,0
	db 36,PRIMEAPE,0
	db 31,MACHOP,MANKEY,PRIMEAPE,0
	db 40,MACHOP,MACHOKE,0
	db 43,MACHOKE,0
	db 38,MACHOKE,MACHOP,MACHOKE,0
	db 43,MACHOKE,MACHOP,MACHOKE,0
Green1Data:
	db 5,SQUIRTLE,0
	db 5,BULBASAUR,0
	db 5,CHARMANDER,0
	db $FF,9,PIDGEY,8,SQUIRTLE,0
	db $FF,9,PIDGEY,8,BULBASAUR,0
	db $FF,9,PIDGEY,8,CHARMANDER,0
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,SQUIRTLE,0
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,BULBASAUR,0
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,CHARMANDER,0
ProfOakData:
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,BLASTOISE,70,GYARADOS,0
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,VENUSAUR,70,GYARADOS,0
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,CHARIZARD,70,GYARADOS,0
ChiefData:
; none
ScientistData:
	db 34,KOFFING,VOLTORB,0
	db 26,GRIMER,WEEZING,KOFFING,WEEZING,0
	db 28,MAGNEMITE,VOLTORB,MAGNETON,0
	db 29,ELECTRODE,WEEZING,0
	db 33,ELECTRODE,0
	db 26,MAGNETON,KOFFING,WEEZING,MAGNEMITE,0
	db 25,VOLTORB,KOFFING,MAGNETON,MAGNEMITE,KOFFING,0
	db 29,ELECTRODE,MUK,0
	db 29,GRIMER,ELECTRODE,0
	db 28,VOLTORB,KOFFING,MAGNETON,0
	db 29,MAGNEMITE,KOFFING,0
	db 33,MAGNEMITE,MAGNETON,VOLTORB,0
	db 34,MAGNEMITE,ELECTRODE,0
GiovanniData:
	db $FF,25,ONIX,24,RHYHORN,29,KANGASKHAN,0
	db $FF,37,NIDORINO,35,KANGASKHAN,37,RHYHORN,41,NIDOQUEEN,0
	db $FF,45,RHYHORN,42,DUGTRIO,44,NIDOQUEEN,45,NIDOKING,50,RHYDON,0
RocketData:
	db 13,RATTATA,ZUBAT,0
	db 11,SANDSHREW,RATTATA,ZUBAT,0
	db 12,ZUBAT,EKANS,0
	db 16,RATICATE,0
	db 17,MACHOP,DROWZEE,0
	db 15,EKANS,ZUBAT,0
	db 20,RATICATE,ZUBAT,0
	db 21,DROWZEE,MACHOP,0
	db 21,RATICATE,RATICATE,0
	db 20,GRIMER,KOFFING,KOFFING,0
	db 19,RATTATA,RATICATE,RATICATE,RATTATA,0
	db 22,GRIMER,KOFFING,0
	db 17,ZUBAT,KOFFING,GRIMER,ZUBAT,RATICATE,0
	db 20,RATTATA,RATICATE,DROWZEE,0
	db 21,MACHOP,MACHOP,0
	db 23,SANDSHREW,EKANS,SANDSLASH,0
	db 23,EKANS,SANDSHREW,ARBOK,0
	db 21,KOFFING,ZUBAT,0
	db 25,ZUBAT,ZUBAT,GOLBAT,0
	db 26,KOFFING,DROWZEE,0
	db 23,ZUBAT,RATTATA,RATICATE,ZUBAT,0
	db 26,DROWZEE,KOFFING,0
	db 29,CUBONE,ZUBAT,0
	db 25,GOLBAT,ZUBAT,ZUBAT,RATICATE,ZUBAT,0
	db 28,RATICATE,HYPNO,RATICATE,0
	db 29,MACHOP,DROWZEE,0
	db 28,EKANS,ZUBAT,CUBONE,0
	db 33,ARBOK,0
	db 33,HYPNO,0
	db 29,MACHOP,MACHOKE,0
	db 28,ZUBAT,ZUBAT,GOLBAT,0
	db 26,RATICATE,ARBOK,KOFFING,GOLBAT,0
	db 29,CUBONE,CUBONE,0
	db 29,SANDSHREW,SANDSLASH,0
	db 26,RATICATE,ZUBAT,GOLBAT,RATTATA,0
	db 28,WEEZING,GOLBAT,KOFFING,0
	db 28,DROWZEE,GRIMER,MACHOP,0
	db 28,GOLBAT,DROWZEE,HYPNO,0
	db 33,MACHOKE,0
	db 25,RATTATA,RATTATA,ZUBAT,RATTATA,EKANS,0
	db 32,CUBONE,DROWZEE,MAROWAK,0
CooltrainerMData:
	db 39,NIDORINO,NIDOKING,0
	db 43,EXEGGUTOR,CLOYSTER,ARCANINE,0
	db 43,KINGLER,TENTACRUEL,BLASTOISE,0
	db 45,KINGLER,STARMIE,0
	db 42,IVYSAUR,WARTORTLE,CHARMELEON,CHARIZARD,0
	db 44,IVYSAUR,WARTORTLE,CHARMELEON,0
	db 49,NIDOKING,0
	db 44,KINGLER,CLOYSTER,0
	db 39,SANDSLASH,DUGTRIO,0
	db 43,RHYHORN,0
CooltrainerFData:
	db 24,WEEPINBELL,GLOOM,IVYSAUR,0
	db 43,BELLSPROUT,WEEPINBELL,VICTREEBEL,0
	db 43,PARASECT,DEWGONG,CHANSEY,0
	db 46,VILEPLUME,BUTTERFREE,0
	db 44,PERSIAN,NINETALES,0
	db 45,IVYSAUR,VENUSAUR,0
	db 45,NIDORINA,NIDOQUEEN,0
	db 43,PERSIAN,NINETALES,RAICHU,0
BrunoData:
	db $FF,53,ONIX,55,HITMONCHAN,55,HITMONLEE,56,ONIX,58,MACHAMP,0
BrockData:
	db $FF,12,GEODUDE,14,ONIX,0
MistyData:
	db $FF,18,STARYU,21,STARMIE,0
LtSurgeData:
	db $FF,21,VOLTORB,18,PIKACHU,24,RAICHU,0
ErikaData:
	db $FF,29,VICTREEBEL,24,TANGELA,29,VILEPLUME,0
KogaData:
	db $FF,37,KOFFING,39,MUK,37,KOFFING,43,WEEZING,0
BlaineData:
	db $FF,42,GROWLITHE,40,PONYTA,42,RAPIDASH,47,ARCANINE,0
SabrinaData:
	db $FF,38,KADABRA,37,MR__MIME,38,VENOMOTH,43,ALAKAZAM,0
GentlemanData:
	db 18,GROWLITHE,GROWLITHE,0
	db 19,NIDORAN_M,NIDORAN_F,0
	db 23,PIKACHU,0
	db 48,PRIMEAPE,0
	db 17,GROWLITHE,PONYTA,0
Green2Data:
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,WARTORTLE,0
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,IVYSAUR,0
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,CHARMELEON,0
	db $FF,25,PIDGEOTTO,23,GROWLITHE,22,EXEGGCUTE,20,KADABRA,25,WARTORTLE,0
	db $FF,25,PIDGEOTTO,23,GYARADOS,22,GROWLITHE,20,KADABRA,25,IVYSAUR,0
	db $FF,25,PIDGEOTTO,23,EXEGGCUTE,22,GYARADOS,20,KADABRA,25,CHARMELEON,0
	db $FF,37,PIDGEOT,38,GROWLITHE,35,EXEGGCUTE,35,ALAKAZAM,40,BLASTOISE,0
	db $FF,37,PIDGEOT,38,GYARADOS,35,GROWLITHE,35,ALAKAZAM,40,VENUSAUR,0
	db $FF,37,PIDGEOT,38,EXEGGCUTE,35,GYARADOS,35,ALAKAZAM,40,CHARIZARD,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,GROWLITHE,47,EXEGGCUTE,50,ALAKAZAM ;\
		db 53,BLASTOISE,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,GYARADOS,47,GROWLITHE,50,ALAKAZAM ;\
		db 53,VENUSAUR,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,EXEGGCUTE,47,GYARADOS,50,ALAKAZAM ;\
		db 53,CHARIZARD,0
Green3Data:
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,ARCANINE,63,EXEGGUTOR ;\
		db 65,BLASTOISE,0
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,GYARADOS,63,ARCANINE ;\
		db 65,VENUSAUR,0
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,EXEGGUTOR,63,GYARADOS ;\
		db 65,CHARIZARD,0
LoreleiData:
	db $FF,54,DEWGONG,53,CLOYSTER,54,SLOWBRO,56,JYNX,56,LAPRAS,0
ChannelerData:
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 23,GASTLY,GASTLY,0
	db 24,GASTLY,0
	db 23,GASTLY,0
	db 24,GASTLY,0
	db 24,HAUNTER,0
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 23,GASTLY,GASTLY,0
	db 24,GASTLY,0
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 23,HAUNTER,0
	db 24,GASTLY,0
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 22,HAUNTER,0
	db 22,GASTLY,GASTLY,GASTLY,0
	db 24,GASTLY,0
	db 24,GASTLY,0
	db 34,GASTLY,HAUNTER,0
	db 38,HAUNTER,0
	db 33,GASTLY,GASTLY,HAUNTER,0
AgathaData:
	db $FF,56,GENGAR,56,GOLBAT,55,HAUNTER,58,ARBOK,60,GENGAR,0
LanceData:
	db $FF,58,GYARADOS,56,DRAGONAIR,56,DRAGONAIR,60,AERODACTYL ;\
		db 62,DRAGONITE,0

TrainerAI: ; 652E
;XXX called at 34964, 3c342, 3c398
	and a
	ld a,[W_ISINBATTLE]
	dec a
	ret z ; if not a trainer, we're done here
	ld a,[W_ISLINKBATTLE]
	cp 4
	ret z
	ld a,[W_TRAINERCLASS] ; what trainer class is this?
	dec a
	ld c,a
	ld b,0
	ld hl,TrainerAIPointers
	add hl,bc
	add hl,bc
	add hl,bc
	ld a,[W_AICOUNT]
	and a
	ret z ; if no AI uses left, we're done here
	inc hl
	inc a
	jr nz,.getpointer\@
	dec hl
	ld a,[hli]
	ld [W_AICOUNT],a
.getpointer\@
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call GenRandom
	jp [hl]

TrainerAIPointers: ; 655C
; one entry per trainer class
; first byte, number of times (per Pokémon) it can occur
; next two bytes, pointer to AI subroutine for trainer class
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,JugglerAI ; juggler_x
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,JugglerAI ; juggler
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 2,BlackbeltAI ; blackbelt
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 1,GenericAI ; chief
	dbw 3,GenericAI
	dbw 1,GiovanniAI ; giovanni
	dbw 3,GenericAI
	dbw 2,CooltrainerMAI ; cooltrainerm
	dbw 1,CooltrainerFAI ; cooltrainerf
	dbw 2,BrunoAI ; bruno
	dbw 5,BrockAI ; brock
	dbw 1,MistyAI ; misty
	dbw 1,LtSurgeAI ; surge
	dbw 1,ErikaAI ; erika
	dbw 2,KogaAI ; koga
	dbw 2,BlaineAI ; blaine
	dbw 1,SabrinaAI ; sabrina
	dbw 3,GenericAI
	dbw 1,Sony2AI ; sony2
	dbw 1,Sony3AI ; sony3
	dbw 2,LoreleiAI ; lorelei
	dbw 3,GenericAI
	dbw 2,AgathaAI ; agatha
	dbw 1,LanceAI ; lance

JugglerAI:
	cp $40
	ret nc
	jp $672A

BlackbeltAI:
	cp $20
	ret nc
	jp AIUseXAttack

GiovanniAI:
	cp $40
	ret nc
	jp AIUseGuardSpec

CooltrainerMAI:
	cp $40
	ret nc
	jp AIUseXAttack

CooltrainerFAI:
	cp $40
	ld a,$A
	call $67CF
	jp c,AIUseHyperPotion
	ld a,5
	call $67CF
	ret nc
	jp $672A

BrockAI:
; if his active monster has a status condition, use a full heal
	ld a,[W_OPPONENTSTATUS]
	and a
	ret z
	jp AIUseFullHeal

MistyAI:
	cp $40
	ret nc
	jp AIUseXDefend

LtSurgeAI:
	cp $40
	ret nc
	jp AIUseXSpeed

ErikaAI:
	cp $80
	ret nc
	ld a,$A
	call $67CF
	ret nc
	jp AIUseSuperPotion

KogaAI:
	cp $40
	ret nc
	jp AIUseXAttack

BlaineAI:
	cp $40
	ret nc
	jp AIUseSuperPotion

SabrinaAI:
	cp $40
	ret nc
	ld a,$A
	call $67CF
	ret nc
	jp AIUseHyperPotion

Sony2AI:
	cp $20
	ret nc
	ld a,5
	call $67CF
	ret nc
	jp AIUsePotion

Sony3AI:
	cp $20
	ret nc
	ld a,5
	call $67CF
	ret nc
	jp AIUseFullRestore

LoreleiAI:
	cp $80
	ret nc
	ld a,5
	call $67CF
	ret nc
	jp AIUseSuperPotion

BrunoAI:
	cp $40
	ret nc
	jp AIUseXDefend

AgathaAI:
	cp $14
	jp c,$672A
	cp $80
	ret nc
	ld a,4
	call $67CF
	ret nc
	jp AIUseSuperPotion

LanceAI:
	cp $80
	ret nc
	ld a,5
	call $67CF
	ret nc
	jp AIUseHyperPotion

GenericAI:
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount: ; 6695
	ld hl,W_AICOUNT
	dec [hl]
	scf
	ret

Function669B: ; 669B
; XXX what does this do
	ld a,$8E
	jp $3740

AIUseFullRestore:
	call AICureStatus
	ld a,FULL_RESTORE
	ld [$CF05],a
	ld de,$CEEB
	ld hl,$CFE7
	ld a,[hld]
	ld [de],a
	inc de
	ld a,[hl]
	ld [de],a
	inc de
	ld hl,$CFF5
	ld a,[hld]
	ld [de],a
	inc de
	ld [$CEE9],a
	ld [$CFE7],a
	ld a,[hl]
	ld [de],a
	ld [$CEEA],a
	ld [W_OPPONENTHP],a
	jr Function6718

AIUsePotion:
; enemy trainer heals his monster with a potion
	ld a,POTION
	ld b,20
	jr AIRecoverHP

AIUseSuperPotion:
; enemy trainer heals his monster with a super potion
	ld a,SUPER_POTION
	ld b,50
	jr AIRecoverHP

AIUseHyperPotion:
; enemy trainer heals his monster with a hyper potion
	ld a,HYPER_POTION
	ld b,200
	; fallthrough

AIRecoverHP: ; 66DA
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [$CF05],a
	ld hl,$CFE7
	ld a,[hl]
	ld [$CEEB],a
	add b
	ld [hld],a
	ld [$CEED],a
	ld a,[hl]
	ld [$CEEC],a
	ld [$CEEE],a
	jr nc,.next\@
	inc a
	ld [hl],a
	ld [$CEEE],a
.next\@
	inc hl
	ld a,[hld]
	ld b,a
	ld de,$CFF5
	ld a,[de]
	dec de
	ld [$CEE9],a
	sub b
	ld a,[hli]
	ld b,a
	ld a,[de]
	ld [$CEEA],a
	sbc b
	jr nc,Function6718
	inc de
	ld a,[de]
	dec de
	ld [hld],a
	ld [$CEED],a
	ld a,[de]
	ld [hl],a
	ld [$CEEE],a
	; fallthrough

Function6718: ; 6718
	call AIPrintItemUse_
	ld hl,$C3CA
	xor a
	ld [$CF94],a
	ld a,$48
	call Predef
	jp DecrementAICount

Function672A: ; 672A
	ld a,[W_ENEMYMONCOUNT]
	ld c,a
	ld hl,W_ENEMYMON1HP

	ld d,0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop\@
	ld a,[hli]
	ld b,a
	ld a,[hld]
	or b
	jr z,.Fainted\@ ; has monster fainted?
	inc d
.Fainted\@
	push bc
	ld bc,$2C
	add hl,bc
	pop bc
	dec c
	jr nz,.loop\@

	ld a,d ; how many available monsters are there?
	cp 2 ; don't bother if only 1 or 2
	jp nc,Function674B ; XXX check, does this jump when a = 2?
	and a
	ret

Function674B: ; 674B

; prepare to withdraw the active monster: copy hp, number, and status to roster

	ld a,[W_OPPONENTNUMBER]
	ld hl,W_ENEMYMON1HP
	ld bc,$2C
	call AddNTimes
	ld d,h
	ld e,l
	ld hl,W_OPPONENTHP
	ld bc,4
	call CopyData

	ld hl,AIBattleWithdrawText
	call PrintText

	ld a,1
	ld [$D11D],a
	ld hl,EnemySendOut
	ld b,BANK(EnemySendOut)
	call Bankswitch
	xor a
	ld [$D11D],a

	ld a,[W_ISLINKBATTLE]
	cp 4
	ret z
	scf
	ret

AIBattleWithdrawText:
	TX_FAR _AIBattleWithdrawText
	db "@"

AIUseFullHeal:
	call $669B
	call AICureStatus
	ld a,FULL_HEAL
	jp AIPrintItemUse

AICureStatus:
; cures the status of enemy's active pokemon
	ld a,[W_OPPONENTNUMBER]
	ld hl,$D8A8
	ld bc,$2C
	call AddNTimes
	xor a
	ld [hl],a ; clear status in enemy team roster
	ld [W_OPPONENTSTATUS],a ; clear status of active enemy
	ld hl,$D069
	res 0,[hl]
	ret

AIUseXAccuracy: ; unused
	call $669B
	ld hl,$D068
	set 0,[hl]
	ld a,X_ACCURACY
	jp AIPrintItemUse

AIUseGuardSpec:
	call $669B
	ld hl,$D068
	set 1,[hl]
	ld a,GUARD_SPEC_
	jp AIPrintItemUse

AIUseDireHit: ; unused
	call $669B
	ld hl,$D068
	set 2,[hl]
	ld a,DIRE_HIT
	jp AIPrintItemUse

Function67CF: ; 67CF
	ld [$FF99],a
	ld hl,$CFF4
	ld a,[hli]
	ld [$FF95],a
	ld a,[hl]
	ld [$FF96],a
	ld b,2
	call $38B9
	ld a,[$FF98]
	ld c,a
	ld a,[$FF97]
	ld b,a
	ld hl,$CFE7
	ld a,[hld]
	ld e,a
	ld a,[hl]
	ld d,a
	ld a,d
	sub b
	ret nz
	ld a,e
	sub c
	ret

AIUseXAttack:
	ld b,$A
	ld a,X_ATTACK
	jr AIIncreaseStat

AIUseXDefend:
	ld b,$B
	ld a,X_DEFEND
	jr AIIncreaseStat

AIUseXSpeed:
	ld b,$C
	ld a,X_SPEED
	jr AIIncreaseStat

AIUseXSpecial:
	ld b,$D
	ld a,X_SPECIAL
	; fallthrough

AIIncreaseStat:
	ld [$CF05],a
	push bc
	call AIPrintItemUse_
	pop bc
	ld hl,$CFCD
	ld a,[hld]
	push af
	ld a,[hl]
	push af
	push hl
	ld a,$AF
	ld [hli],a
	ld [hl],b
	ld hl,$7428
	ld b,$F
	call Bankswitch
	pop hl
	pop af
	ld [hli],a
	pop af
	ld [hl],a
	jp DecrementAICount

AIPrintItemUse:
	ld [$CF05],a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_:
; print "x used [$CF05] on z!"
	ld a,[$CF05]
	ld [$D11E],a
	call GetItemName
	ld hl,AIBattleUseItemText
	jp PrintText

AIBattleUseItemText:
	TX_FAR _AIBattleUseItemText
	db "@"


INCBIN "baserom.gbc",$3A849,$3B05C - $3A849

EvosAttacksPointerTable: ; 705C
	dw Mon112_EvosAttacks
	dw Mon115_EvosAttacks
	dw Mon032_EvosAttacks
	dw Mon035_EvosAttacks
	dw Mon021_EvosAttacks
	dw Mon100_EvosAttacks
	dw Mon034_EvosAttacks
	dw Mon080_EvosAttacks
	dw Mon002_EvosAttacks
	dw Mon103_EvosAttacks
	dw Mon108_EvosAttacks
	dw Mon102_EvosAttacks
	dw Mon088_EvosAttacks
	dw Mon094_EvosAttacks
	dw Mon029_EvosAttacks
	dw Mon031_EvosAttacks
	dw Mon104_EvosAttacks
	dw Mon111_EvosAttacks
	dw Mon131_EvosAttacks
	dw Mon059_EvosAttacks
	dw Mon151_EvosAttacks
	dw Mon130_EvosAttacks
	dw Mon090_EvosAttacks
	dw Mon072_EvosAttacks
	dw Mon092_EvosAttacks
	dw Mon123_EvosAttacks
	dw Mon120_EvosAttacks
	dw Mon009_EvosAttacks
	dw Mon127_EvosAttacks
	dw Mon114_EvosAttacks
	dw Mon152_EvosAttacks	;MissingNo
	dw Mon153_EvosAttacks	;MissingNo
	dw Mon058_EvosAttacks
	dw Mon095_EvosAttacks
	dw Mon022_EvosAttacks
	dw Mon016_EvosAttacks
	dw Mon079_EvosAttacks
	dw Mon064_EvosAttacks
	dw Mon075_EvosAttacks
	dw Mon113_EvosAttacks
	dw Mon067_EvosAttacks
	dw Mon122_EvosAttacks
	dw Mon106_EvosAttacks
	dw Mon107_EvosAttacks
	dw Mon024_EvosAttacks
	dw Mon047_EvosAttacks
	dw Mon054_EvosAttacks
	dw Mon096_EvosAttacks
	dw Mon076_EvosAttacks
	dw Mon154_EvosAttacks	;MissingNo
	dw Mon126_EvosAttacks
	dw Mon155_EvosAttacks	;MissingNo
	dw Mon125_EvosAttacks
	dw Mon082_EvosAttacks
	dw Mon109_EvosAttacks
	dw Mon156_EvosAttacks	;MissingNo
	dw Mon056_EvosAttacks
	dw Mon086_EvosAttacks
	dw Mon050_EvosAttacks
	dw Mon128_EvosAttacks
	dw Mon157_EvosAttacks	;MissingNo
	dw Mon158_EvosAttacks	;MissingNo
	dw Mon159_EvosAttacks	;MissingNo
	dw Mon083_EvosAttacks
	dw Mon048_EvosAttacks
	dw Mon149_EvosAttacks
	dw Mon160_EvosAttacks	;MissingNo
	dw Mon161_EvosAttacks	;MissingNo
	dw Mon162_EvosAttacks	;MissingNo
	dw Mon084_EvosAttacks
	dw Mon060_EvosAttacks
	dw Mon124_EvosAttacks
	dw Mon146_EvosAttacks
	dw Mon144_EvosAttacks
	dw Mon145_EvosAttacks
	dw Mon132_EvosAttacks
	dw Mon052_EvosAttacks
	dw Mon098_EvosAttacks
	dw Mon163_EvosAttacks	;MissingNo
	dw Mon164_EvosAttacks	;MissingNo
	dw Mon165_EvosAttacks	;MissingNo
	dw Mon037_EvosAttacks
	dw Mon038_EvosAttacks
	dw Mon025_EvosAttacks
	dw Mon026_EvosAttacks
	dw Mon166_EvosAttacks	;MissingNo
	dw Mon167_EvosAttacks	;MissingNo
	dw Mon147_EvosAttacks
	dw Mon148_EvosAttacks
	dw Mon140_EvosAttacks
	dw Mon141_EvosAttacks
	dw Mon116_EvosAttacks
	dw Mon117_EvosAttacks
	dw Mon168_EvosAttacks	;MissingNo
	dw Mon169_EvosAttacks	;MissingNo
	dw Mon027_EvosAttacks
	dw Mon028_EvosAttacks
	dw Mon138_EvosAttacks
	dw Mon139_EvosAttacks
	dw Mon039_EvosAttacks
	dw Mon040_EvosAttacks
	dw Mon133_EvosAttacks
	dw Mon136_EvosAttacks
	dw Mon135_EvosAttacks
	dw Mon134_EvosAttacks
	dw Mon066_EvosAttacks
	dw Mon041_EvosAttacks
	dw Mon023_EvosAttacks
	dw Mon046_EvosAttacks
	dw Mon061_EvosAttacks
	dw Mon062_EvosAttacks
	dw Mon013_EvosAttacks
	dw Mon014_EvosAttacks
	dw Mon015_EvosAttacks
	dw Mon170_EvosAttacks	;MissingNo
	dw Mon085_EvosAttacks
	dw Mon057_EvosAttacks
	dw Mon051_EvosAttacks
	dw Mon049_EvosAttacks
	dw Mon087_EvosAttacks
	dw Mon171_EvosAttacks	;MissingNo
	dw Mon172_EvosAttacks	;MissingNo
	dw Mon010_EvosAttacks
	dw Mon011_EvosAttacks
	dw Mon012_EvosAttacks
	dw Mon068_EvosAttacks
	dw Mon173_EvosAttacks	;MissingNo
	dw Mon055_EvosAttacks
	dw Mon097_EvosAttacks
	dw Mon042_EvosAttacks
	dw Mon150_EvosAttacks
	dw Mon143_EvosAttacks
	dw Mon129_EvosAttacks
	dw Mon174_EvosAttacks	;MissingNo
	dw Mon175_EvosAttacks	;MissingNo
	dw Mon089_EvosAttacks
	dw Mon176_EvosAttacks	;MissingNo
	dw Mon099_EvosAttacks
	dw Mon091_EvosAttacks
	dw Mon177_EvosAttacks	;MissingNo
	dw Mon101_EvosAttacks
	dw Mon036_EvosAttacks
	dw Mon110_EvosAttacks
	dw Mon053_EvosAttacks
	dw Mon105_EvosAttacks
	dw Mon178_EvosAttacks	;MissingNo
	dw Mon093_EvosAttacks
	dw Mon063_EvosAttacks
	dw Mon065_EvosAttacks
	dw Mon017_EvosAttacks
	dw Mon018_EvosAttacks
	dw Mon121_EvosAttacks
	dw Mon001_EvosAttacks
	dw Mon003_EvosAttacks
	dw Mon073_EvosAttacks
	dw Mon179_EvosAttacks	;MissingNo
	dw Mon118_EvosAttacks
	dw Mon119_EvosAttacks
	dw Mon180_EvosAttacks	;MissingNo
	dw Mon181_EvosAttacks	;MissingNo
	dw Mon182_EvosAttacks	;MissingNo
	dw Mon183_EvosAttacks	;MissingNo
	dw Mon077_EvosAttacks
	dw Mon078_EvosAttacks
	dw Mon019_EvosAttacks
	dw Mon020_EvosAttacks
	dw Mon033_EvosAttacks
	dw Mon030_EvosAttacks
	dw Mon074_EvosAttacks
	dw Mon137_EvosAttacks
	dw Mon142_EvosAttacks
	dw Mon184_EvosAttacks	;MissingNo
	dw Mon081_EvosAttacks
	dw Mon185_EvosAttacks	;MissingNo
	dw Mon186_EvosAttacks	;MissingNo
	dw Mon004_EvosAttacks
	dw Mon007_EvosAttacks
	dw Mon005_EvosAttacks
	dw Mon008_EvosAttacks
	dw Mon006_EvosAttacks
	dw Mon187_EvosAttacks	;MissingNo
	dw Mon188_EvosAttacks	;MissingNo
	dw Mon189_EvosAttacks	;MissingNo
	dw Mon190_EvosAttacks	;MissingNo
	dw Mon043_EvosAttacks
	dw Mon044_EvosAttacks
	dw Mon045_EvosAttacks
	dw Mon069_EvosAttacks
	dw Mon070_EvosAttacks
	dw Mon071_EvosAttacks

Mon112_EvosAttacks:
;RHYDON
;Evolutions
	db 0
;Learnset
	db 30,STOMP
	db 35,TAIL_WHIP
	db 40,FURY_ATTACK
	db 48,HORN_DRILL
	db 55,LEER
	db 64,TAKE_DOWN
	db 0
Mon115_EvosAttacks:
;KANGASKHAN
;Evolutions
	db 0
;Learnset
	db 26,BITE
	db 31,TAIL_WHIP
	db 36,MEGA_PUNCH
	db 41,LEER
	db 46,DIZZY_PUNCH
	db 0
Mon032_EvosAttacks:
;NIDORAN_M
;Evolutions
	db EV_LEVEL,16,NIDORINO
	db 0
;Learnset
	db 8,HORN_ATTACK
	db 14,POISON_STING
	db 21,FOCUS_ENERGY
	db 29,FURY_ATTACK
	db 36,HORN_DRILL
	db 43,DOUBLE_KICK
	db 0
Mon035_EvosAttacks:
;CLEFAIRY
;Evolutions
	db EV_ITEM,MOON_STONE,1,CLEFABLE
	db 0
;Learnset
	db 13,SING
	db 18,DOUBLESLAP
	db 24,MINIMIZE
	db 31,METRONOME
	db 39,DEFENSE_CURL
	db 48,LIGHT_SCREEN
	db 0
Mon021_EvosAttacks:
;SPEAROW
;Evolutions
	db EV_LEVEL,20,FEAROW
	db 0
;Learnset
	db 9,LEER
	db 15,FURY_ATTACK
	db 22,MIRROR_MOVE
	db 29,DRILL_PECK
	db 36,AGILITY
	db 0
Mon100_EvosAttacks:
;VOLTORB
;Evolutions
	db EV_LEVEL,30,ELECTRODE
	db 0
;Learnset
	db 17,SONICBOOM
	db 22,SELFDESTRUCT
	db 29,LIGHT_SCREEN
	db 36,SWIFT
	db 43,EXPLOSION
	db 0
Mon034_EvosAttacks:
;NIDOKING
;Evolutions
	db 0
;Learnset
	db 8,HORN_ATTACK
	db 14,POISON_STING
	db 23,THRASH
	db 0
Mon080_EvosAttacks:
;SLOWBRO
;Evolutions
	db 0
;Learnset
	db 18,DISABLE
	db 22,HEADBUTT
	db 27,GROWL
	db 33,WATER_GUN
	db 37,WITHDRAW
	db 44,AMNESIA
	db 55,PSYCHIC_M
	db 0
Mon002_EvosAttacks:
;IVYSAUR
;Evolutions
	db EV_LEVEL,32,VENUSAUR
	db 0
;Learnset
	db 7,LEECH_SEED
	db 13,VINE_WHIP
	db 22,POISONPOWDER
	db 30,RAZOR_LEAF
	db 38,GROWTH
	db 46,SLEEP_POWDER
	db 54,SOLARBEAM
	db 0
Mon103_EvosAttacks:
;EXEGGUTOR
;Evolutions
	db 0
;Learnset
	db 28,STOMP
	db 0
Mon108_EvosAttacks:
;LICKITUNG
;Evolutions
	db 0
;Learnset
	db 7,STOMP
	db 15,DISABLE
	db 23,DEFENSE_CURL
	db 31,SLAM
	db 39,SCREECH
	db 0
Mon102_EvosAttacks:
;EXEGGCUTE
;Evolutions
	db EV_ITEM,LEAF_STONE ,1,EXEGGUTOR
	db 0
;Learnset
	db 25,REFLECT
	db 28,LEECH_SEED
	db 32,STUN_SPORE
	db 37,POISONPOWDER
	db 42,SOLARBEAM
	db 48,SLEEP_POWDER
	db 0
Mon088_EvosAttacks:
;GRIMER
;Evolutions
	db EV_LEVEL,38,MUK
	db 0
;Learnset
	db 30,POISON_GAS
	db 33,MINIMIZE
	db 37,SLUDGE
	db 42,HARDEN
	db 48,SCREECH
	db 55,ACID_ARMOR
	db 0
Mon094_EvosAttacks:
;GENGAR
;Evolutions
	db 0
;Learnset
	db 29,HYPNOSIS
	db 38,DREAM_EATER
	db 0
Mon029_EvosAttacks:
;NIDORAN_F
;Evolutions
	db EV_LEVEL,16,NIDORINA
	db 0
;Learnset
	db 8,SCRATCH
	db 14,POISON_STING
	db 21,TAIL_WHIP
	db 29,BITE
	db 36,FURY_SWIPES
	db 43,DOUBLE_KICK
	db 0
Mon031_EvosAttacks:
;NIDOQUEEN
;Evolutions
	db 0
;Learnset
	db 8,SCRATCH
	db 14,POISON_STING
	db 23,BODY_SLAM
	db 0
Mon104_EvosAttacks:
;CUBONE
;Evolutions
	db EV_LEVEL,28,MAROWAK
	db 0
;Learnset
	db 25,LEER
	db 31,FOCUS_ENERGY
	db 38,THRASH
	db 43,BONEMERANG
	db 46,RAGE
	db 0
Mon111_EvosAttacks:
;RHYHORN
;Evolutions
	db EV_LEVEL,42,RHYDON
	db 0
;Learnset
	db 30,STOMP
	db 35,TAIL_WHIP
	db 40,FURY_ATTACK
	db 45,HORN_DRILL
	db 50,LEER
	db 55,TAKE_DOWN
	db 0
Mon131_EvosAttacks:
;LAPRAS
;Evolutions
	db 0
;Learnset
	db 16,SING
	db 20,MIST
	db 25,BODY_SLAM
	db 31,CONFUSE_RAY
	db 38,ICE_BEAM
	db 46,HYDRO_PUMP
	db 0
Mon059_EvosAttacks:
;ARCANINE
;Evolutions
	db 0
;Learnset
	db 0
Mon151_EvosAttacks:
;MEW
;Evolutions
	db 0
;Learnset
	db 10,TRANSFORM
	db 20,MEGA_PUNCH
	db 30,METRONOME
	db 40,PSYCHIC_M
	db 0
Mon130_EvosAttacks:
;GYARADOS
;Evolutions
	db 0
;Learnset
	db 20,BITE
	db 25,DRAGON_RAGE
	db 32,LEER
	db 41,HYDRO_PUMP
	db 52,HYPER_BEAM
	db 0
Mon090_EvosAttacks:
;SHELLDER
;Evolutions
	db EV_ITEM,WATER_STONE ,1,CLOYSTER
	db 0
;Learnset
	db 18,SUPERSONIC
	db 23,CLAMP
	db 30,AURORA_BEAM
	db 39,LEER
	db 50,ICE_BEAM
	db 0
Mon072_EvosAttacks:
;TENTACOOL
;Evolutions
	db EV_LEVEL,30,TENTACRUEL
	db 0
;Learnset
	db 7,SUPERSONIC
	db 13,WRAP
	db 18,POISON_STING
	db 22,WATER_GUN
	db 27,CONSTRICT
	db 33,BARRIER
	db 40,SCREECH
	db 48,HYDRO_PUMP
	db 0
Mon092_EvosAttacks:
;GASTLY
;Evolutions
	db EV_LEVEL,25,HAUNTER
	db 0
;Learnset
	db 27,HYPNOSIS
	db 35,DREAM_EATER
	db 0
Mon123_EvosAttacks:
;SCYTHER
;Evolutions
	db 0
;Learnset
	db 17,LEER
	db 20,FOCUS_ENERGY
	db 24,DOUBLE_TEAM
	db 29,SLASH
	db 35,SWORDS_DANCE
	db 42,AGILITY
	db 0
Mon120_EvosAttacks:
;STARYU
;Evolutions
	db EV_ITEM,WATER_STONE ,1,STARMIE
	db 0
;Learnset
	db 17,WATER_GUN
	db 22,HARDEN
	db 27,RECOVER
	db 32,SWIFT
	db 37,MINIMIZE
	db 42,LIGHT_SCREEN
	db 47,HYDRO_PUMP
	db 0
Mon009_EvosAttacks:
;BLASTOISE
;Evolutions
	db 0
;Learnset
	db 8,BUBBLE
	db 15,WATER_GUN
	db 24,BITE
	db 31,WITHDRAW
	db 42,SKULL_BASH
	db 52,HYDRO_PUMP
	db 0
Mon127_EvosAttacks:
;PINSIR
;Evolutions
	db 0
;Learnset
	db 25,SEISMIC_TOSS
	db 30,GUILLOTINE
	db 36,FOCUS_ENERGY
	db 43,HARDEN
	db 49,SLASH
	db 54,SWORDS_DANCE
	db 0
Mon114_EvosAttacks:
;TANGELA
;Evolutions
	db 0
;Learnset
	db 29,ABSORB
	db 32,POISONPOWDER
	db 36,STUN_SPORE
	db 39,SLEEP_POWDER
	db 45,SLAM
	db 49,GROWTH
	db 0

Mon152_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon153_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon058_EvosAttacks:
;GROWLITHE
;Evolutions
	db EV_ITEM,FIRE_STONE,1,ARCANINE
	db 0
;Learnset
	db 18,EMBER
	db 23,LEER
	db 30,TAKE_DOWN
	db 39,AGILITY
	db 50,FLAMETHROWER
	db 0
Mon095_EvosAttacks:
;ONIX
;Evolutions
	db 0
;Learnset
	db 15,BIND
	db 19,ROCK_THROW
	db 25,RAGE
	db 33,SLAM
	db 43,HARDEN
	db 0
Mon022_EvosAttacks:
;FEAROW
;Evolutions
	db 0
;Learnset
	db 9,LEER
	db 15,FURY_ATTACK
	db 25,MIRROR_MOVE
	db 34,DRILL_PECK
	db 43,AGILITY
	db 0
Mon016_EvosAttacks:
;PIDGEY
;Evolutions
	db EV_LEVEL,18,PIDGEOTTO
	db 0
;Learnset
	db 5,SAND_ATTACK
	db 12,QUICK_ATTACK
	db 19,WHIRLWIND
	db 28,WING_ATTACK
	db 36,AGILITY
	db 44,MIRROR_MOVE
	db 0
Mon079_EvosAttacks:
;SLOWPOKE
;Evolutions
	db EV_LEVEL,37,SLOWBRO
	db 0
;Learnset
	db 18,DISABLE
	db 22,HEADBUTT
	db 27,GROWL
	db 33,WATER_GUN
	db 40,AMNESIA
	db 48,PSYCHIC_M
	db 0
Mon064_EvosAttacks:
;KADABRA
;Evolutions
	db EV_TRADE,1,ALAKAZAM
	db 0
;Learnset
	db 16,CONFUSION
	db 20,DISABLE
	db 27,PSYBEAM
	db 31,RECOVER
	db 38,PSYCHIC_M
	db 42,REFLECT
	db 0
Mon075_EvosAttacks:
;GRAVELER
;Evolutions
	db EV_TRADE,1,GOLEM
	db 0
;Learnset
	db 11,DEFENSE_CURL
	db 16,ROCK_THROW
	db 21,SELFDESTRUCT
	db 29,HARDEN
	db 36,EARTHQUAKE
	db 43,EXPLOSION
	db 0
Mon113_EvosAttacks:
;CHANSEY
;Evolutions
	db 0
;Learnset
	db 24,SING
	db 30,GROWL
	db 38,MINIMIZE
	db 44,DEFENSE_CURL
	db 48,LIGHT_SCREEN
	db 54,DOUBLE_EDGE
	db 0
Mon067_EvosAttacks:
;MACHOKE
;Evolutions
	db EV_TRADE,1,MACHAMP
	db 0
;Learnset
	db 20,LOW_KICK
	db 25,LEER
	db 36,FOCUS_ENERGY
	db 44,SEISMIC_TOSS
	db 52,SUBMISSION
	db 0
Mon122_EvosAttacks:
;MR__MIME
;Evolutions
	db 0
;Learnset
	db 15,CONFUSION
	db 23,LIGHT_SCREEN
	db 31,DOUBLESLAP
	db 39,MEDITATE
	db 47,SUBSTITUTE
	db 0
Mon106_EvosAttacks:
;HITMONLEE
;Evolutions
	db 0
;Learnset
	db 33,ROLLING_KICK
	db 38,JUMP_KICK
	db 43,FOCUS_ENERGY
	db 48,HI_JUMP_KICK
	db 53,MEGA_KICK
	db 0
Mon107_EvosAttacks:
;HITMONCHAN
;Evolutions
	db 0
;Learnset
	db 33,FIRE_PUNCH
	db 38,ICE_PUNCH
	db 43,THUNDERPUNCH
	db 48,MEGA_PUNCH
	db 53,COUNTER
	db 0
Mon024_EvosAttacks:
;ARBOK
;Evolutions
	db 0
;Learnset
	db 10,POISON_STING
	db 17,BITE
	db 27,GLARE
	db 36,SCREECH
	db 47,ACID
	db 0
Mon047_EvosAttacks:
;PARASECT
;Evolutions
	db 0
;Learnset
	db 13,STUN_SPORE
	db 20,LEECH_LIFE
	db 30,SPORE
	db 39,SLASH
	db 48,GROWTH
	db 0
Mon054_EvosAttacks:
;PSYDUCK
;Evolutions
	db EV_LEVEL,33,GOLDUCK
	db 0
;Learnset
	db 28,TAIL_WHIP
	db 31,DISABLE
	db 36,CONFUSION
	db 43,FURY_SWIPES
	db 52,HYDRO_PUMP
	db 0
Mon096_EvosAttacks:
;DROWZEE
;Evolutions
	db EV_LEVEL,26,HYPNO
	db 0
;Learnset
	db 12,DISABLE
	db 17,CONFUSION
	db 24,HEADBUTT
	db 29,POISON_GAS
	db 32,PSYCHIC_M
	db 37,MEDITATE
	db 0
Mon076_EvosAttacks:
;GOLEM
;Evolutions
	db 0
;Learnset
	db 11,DEFENSE_CURL
	db 16,ROCK_THROW
	db 21,SELFDESTRUCT
	db 29,HARDEN
	db 36,EARTHQUAKE
	db 43,EXPLOSION
	db 0

Mon154_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon126_EvosAttacks:
;MAGMAR
;Evolutions
	db 0
;Learnset
	db 36,LEER
	db 39,CONFUSE_RAY
	db 43,FIRE_PUNCH
	db 48,SMOKESCREEN
	db 52,SMOG
	db 55,FLAMETHROWER
	db 0

Mon155_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon125_EvosAttacks:
;ELECTABUZZ
;Evolutions
	db 0
;Learnset
	db 34,THUNDERSHOCK
	db 37,SCREECH
	db 42,THUNDERPUNCH
	db 49,LIGHT_SCREEN
	db 54,THUNDER
	db 0
Mon082_EvosAttacks:
;MAGNETON
;Evolutions
	db 0
;Learnset
	db 21,SONICBOOM
	db 25,THUNDERSHOCK
	db 29,SUPERSONIC
	db 38,THUNDER_WAVE
	db 46,SWIFT
	db 54,SCREECH
	db 0
Mon109_EvosAttacks:
;KOFFING
;Evolutions
	db EV_LEVEL,35,WEEZING
	db 0
;Learnset
	db 32,SLUDGE
	db 37,SMOKESCREEN
	db 40,SELFDESTRUCT
	db 45,HAZE
	db 48,EXPLOSION
	db 0

Mon156_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon056_EvosAttacks:
;MANKEY
;Evolutions
	db EV_LEVEL,28,PRIMEAPE
	db 0
;Learnset
	db 15,KARATE_CHOP
	db 21,FURY_SWIPES
	db 27,FOCUS_ENERGY
	db 33,SEISMIC_TOSS
	db 39,THRASH
	db 0
Mon086_EvosAttacks:
;SEEL
;Evolutions
	db EV_LEVEL,34,DEWGONG
	db 0
;Learnset
	db 30,GROWL
	db 35,AURORA_BEAM
	db 40,REST
	db 45,TAKE_DOWN
	db 50,ICE_BEAM
	db 0
Mon050_EvosAttacks:
;DIGLETT
;Evolutions
	db EV_LEVEL,26,DUGTRIO
	db 0
;Learnset
	db 15,GROWL
	db 19,DIG
	db 24,SAND_ATTACK
	db 31,SLASH
	db 40,EARTHQUAKE
	db 0
Mon128_EvosAttacks:
;TAUROS
;Evolutions
	db 0
;Learnset
	db 21,STOMP
	db 28,TAIL_WHIP
	db 35,LEER
	db 44,RAGE
	db 51,TAKE_DOWN
	db 0

Mon157_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon158_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon159_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon083_EvosAttacks:
;FARFETCH_D
;Evolutions
	db 0
;Learnset
	db 7,LEER
	db 15,FURY_ATTACK
	db 23,SWORDS_DANCE
	db 31,AGILITY
	db 39,SLASH
	db 0
Mon048_EvosAttacks:
;VENONAT
;Evolutions
	db EV_LEVEL,31,VENOMOTH
	db 0
;Learnset
	db 24,POISONPOWDER
	db 27,LEECH_LIFE
	db 30,STUN_SPORE
	db 35,PSYBEAM
	db 38,SLEEP_POWDER
	db 43,PSYCHIC_M
	db 0
Mon149_EvosAttacks:
;DRAGONITE
;Evolutions
	db 0
;Learnset
	db 10,THUNDER_WAVE
	db 20,AGILITY
	db 35,SLAM
	db 45,DRAGON_RAGE
	db 60,HYPER_BEAM
	db 0

Mon160_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon161_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon162_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon084_EvosAttacks:
;DODUO
;Evolutions
	db EV_LEVEL,31,DODRIO
	db 0
;Learnset
	db 20,GROWL
	db 24,FURY_ATTACK
	db 30,DRILL_PECK
	db 36,RAGE
	db 40,TRI_ATTACK
	db 44,AGILITY
	db 0
Mon060_EvosAttacks:
;POLIWAG
;Evolutions
	db EV_LEVEL,25,POLIWHIRL
	db 0
;Learnset
	db 16,HYPNOSIS
	db 19,WATER_GUN
	db 25,DOUBLESLAP
	db 31,BODY_SLAM
	db 38,AMNESIA
	db 45,HYDRO_PUMP
	db 0
Mon124_EvosAttacks:
;JYNX
;Evolutions
	db 0
;Learnset
	db 18,LICK
	db 23,DOUBLESLAP
	db 31,ICE_PUNCH
	db 39,BODY_SLAM
	db 47,THRASH
	db 58,BLIZZARD
	db 0
Mon146_EvosAttacks:
;MOLTRES
;Evolutions
	db 0
;Learnset
	db 51,LEER
	db 55,AGILITY
	db 60,SKY_ATTACK
	db 0
Mon144_EvosAttacks:
;ARTICUNO
;Evolutions
	db 0
;Learnset
	db 51,BLIZZARD
	db 55,AGILITY
	db 60,MIST
	db 0
Mon145_EvosAttacks:
;ZAPDOS
;Evolutions
	db 0
;Learnset
	db 51,THUNDER
	db 55,AGILITY
	db 60,LIGHT_SCREEN
	db 0
Mon132_EvosAttacks:
;DITTO
;Evolutions
	db 0
;Learnset
	db 0
Mon052_EvosAttacks:
;MEOWTH
;Evolutions
	db EV_LEVEL,28,PERSIAN
	db 0
;Learnset
	db 12,BITE
	db 17,PAY_DAY
	db 24,SCREECH
	db 33,FURY_SWIPES
	db 44,SLASH
	db 0
Mon098_EvosAttacks:
;KRABBY
;Evolutions
	db EV_LEVEL,28,KINGLER
	db 0
;Learnset
	db 20,VICEGRIP
	db 25,GUILLOTINE
	db 30,STOMP
	db 35,CRABHAMMER
	db 40,HARDEN
	db 0

Mon163_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon164_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon165_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon037_EvosAttacks:
;VULPIX
;Evolutions
	db EV_ITEM,FIRE_STONE,1,NINETALES
	db 0
;Learnset
	db 16,QUICK_ATTACK
	db 21,ROAR
	db 28,CONFUSE_RAY
	db 35,FLAMETHROWER
	db 42,FIRE_SPIN
	db 0
Mon038_EvosAttacks:
;NINETALES
;Evolutions
	db 0
;Learnset
	db 0
Mon025_EvosAttacks:
;PIKACHU
;Evolutions
	db EV_ITEM,THUNDER_STONE ,1,RAICHU
	db 0
;Learnset
	db 9,THUNDER_WAVE
	db 16,QUICK_ATTACK
	db 26,SWIFT
	db 33,AGILITY
	db 43,THUNDER
	db 0
Mon026_EvosAttacks:
;RAICHU
;Evolutions
	db 0
;Learnset
	db 0

Mon166_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon167_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon147_EvosAttacks:
;DRATINI
;Evolutions
	db EV_LEVEL,30,DRAGONAIR
	db 0
;Learnset
	db 10,THUNDER_WAVE
	db 20,AGILITY
	db 30,SLAM
	db 40,DRAGON_RAGE
	db 50,HYPER_BEAM
	db 0
Mon148_EvosAttacks:
;DRAGONAIR
;Evolutions
	db EV_LEVEL,55,DRAGONITE
	db 0
;Learnset
	db 10,THUNDER_WAVE
	db 20,AGILITY
	db 35,SLAM
	db 45,DRAGON_RAGE
	db 55,HYPER_BEAM
	db 0
Mon140_EvosAttacks:
;KABUTO
;Evolutions
	db EV_LEVEL,40,KABUTOPS
	db 0
;Learnset
	db 34,ABSORB
	db 39,SLASH
	db 44,LEER
	db 49,HYDRO_PUMP
	db 0
Mon141_EvosAttacks:
;KABUTOPS
;Evolutions
	db 0
;Learnset
	db 34,ABSORB
	db 39,SLASH
	db 46,LEER
	db 53,HYDRO_PUMP
	db 0
Mon116_EvosAttacks:
;HORSEA
;Evolutions
	db EV_LEVEL,32,SEADRA
	db 0
;Learnset
	db 19,SMOKESCREEN
	db 24,LEER
	db 30,WATER_GUN
	db 37,AGILITY
	db 45,HYDRO_PUMP
	db 0
Mon117_EvosAttacks:
;SEADRA
;Evolutions
	db 0
;Learnset
	db 19,SMOKESCREEN
	db 24,LEER
	db 30,WATER_GUN
	db 41,AGILITY
	db 52,HYDRO_PUMP
	db 0

Mon168_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon169_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon027_EvosAttacks:
;SANDSHREW
;Evolutions
	db EV_LEVEL,22,SANDSLASH
	db 0
;Learnset
	db 10,SAND_ATTACK
	db 17,SLASH
	db 24,POISON_STING
	db 31,SWIFT
	db 38,FURY_SWIPES
	db 0
Mon028_EvosAttacks:
;SANDSLASH
;Evolutions
	db 0
;Learnset
	db 10,SAND_ATTACK
	db 17,SLASH
	db 27,POISON_STING
	db 36,SWIFT
	db 47,FURY_SWIPES
	db 0
Mon138_EvosAttacks:
;OMANYTE
;Evolutions
	db EV_LEVEL,40,OMASTAR
	db 0
;Learnset
	db 34,HORN_ATTACK
	db 39,LEER
	db 46,SPIKE_CANNON
	db 53,HYDRO_PUMP
	db 0
Mon139_EvosAttacks:
;OMASTAR
;Evolutions
	db 0
;Learnset
	db 34,HORN_ATTACK
	db 39,LEER
	db 44,SPIKE_CANNON
	db 49,HYDRO_PUMP
	db 0
Mon039_EvosAttacks:
;JIGGLYPUFF
;Evolutions
	db EV_ITEM,MOON_STONE,1,WIGGLYTUFF
	db 0
;Learnset
	db 9,POUND
	db 14,DISABLE
	db 19,DEFENSE_CURL
	db 24,DOUBLESLAP
	db 29,REST
	db 34,BODY_SLAM
	db 39,DOUBLE_EDGE
	db 0
Mon040_EvosAttacks:
;WIGGLYTUFF
;Evolutions
	db 0
;Learnset
	db 0
Mon133_EvosAttacks:
;EEVEE
;Evolutions
	db EV_ITEM,FIRE_STONE,1,FLAREON
	db EV_ITEM,THUNDER_STONE ,1,JOLTEON
	db EV_ITEM,WATER_STONE ,1,VAPOREON
	db 0
;Learnset
	db 27,QUICK_ATTACK
	db 31,TAIL_WHIP
	db 37,BITE
	db 45,TAKE_DOWN
	db 0
Mon136_EvosAttacks:
;FLAREON
;Evolutions
	db 0
;Learnset
	db 27,QUICK_ATTACK
	db 31,EMBER
	db 37,TAIL_WHIP
	db 40,BITE
	db 42,LEER
	db 44,FIRE_SPIN
	db 48,RAGE
	db 54,FLAMETHROWER
	db 0
Mon135_EvosAttacks:
;JOLTEON
;Evolutions
	db 0
;Learnset
	db 27,QUICK_ATTACK
	db 31,THUNDERSHOCK
	db 37,TAIL_WHIP
	db 40,THUNDER_WAVE
	db 42,DOUBLE_KICK
	db 44,AGILITY
	db 48,PIN_MISSILE
	db 54,THUNDER
	db 0
Mon134_EvosAttacks:
;VAPOREON
;Evolutions
	db 0
;Learnset
	db 27,QUICK_ATTACK
	db 31,WATER_GUN
	db 37,TAIL_WHIP
	db 40,BITE
	db 42,ACID_ARMOR
	db 44,HAZE
	db 48,MIST
	db 54,HYDRO_PUMP
	db 0
Mon066_EvosAttacks:
;MACHOP
;Evolutions
	db EV_LEVEL,28,MACHOKE
	db 0
;Learnset
	db 20,LOW_KICK
	db 25,LEER
	db 32,FOCUS_ENERGY
	db 39,SEISMIC_TOSS
	db 46,SUBMISSION
	db 0
Mon041_EvosAttacks:
;ZUBAT
;Evolutions
	db EV_LEVEL,22,GOLBAT
	db 0
;Learnset
	db 10,SUPERSONIC
	db 15,BITE
	db 21,CONFUSE_RAY
	db 28,WING_ATTACK
	db 36,HAZE
	db 0
Mon023_EvosAttacks:
;EKANS
;Evolutions
	db EV_LEVEL,22,ARBOK
	db 0
;Learnset
	db 10,POISON_STING
	db 17,BITE
	db 24,GLARE
	db 31,SCREECH
	db 38,ACID
	db 0
Mon046_EvosAttacks:
;PARAS
;Evolutions
	db EV_LEVEL,24,PARASECT
	db 0
;Learnset
	db 13,STUN_SPORE
	db 20,LEECH_LIFE
	db 27,SPORE
	db 34,SLASH
	db 41,GROWTH
	db 0
Mon061_EvosAttacks:
;POLIWHIRL
;Evolutions
	db EV_ITEM,WATER_STONE ,1,POLIWRATH
	db 0
;Learnset
	db 16,HYPNOSIS
	db 19,WATER_GUN
	db 26,DOUBLESLAP
	db 33,BODY_SLAM
	db 41,AMNESIA
	db 49,HYDRO_PUMP
	db 0
Mon062_EvosAttacks:
;POLIWRATH
;Evolutions
	db 0
;Learnset
	db 16,HYPNOSIS
	db 19,WATER_GUN
	db 0
Mon013_EvosAttacks:
;WEEDLE
;Evolutions
	db EV_LEVEL,7,KAKUNA
	db 0
;Learnset
	db 0
Mon014_EvosAttacks:
;KAKUNA
;Evolutions
	db EV_LEVEL,10,BEEDRILL
	db 0
;Learnset
	db 0
Mon015_EvosAttacks:
;BEEDRILL
;Evolutions
	db 0
;Learnset
	db 12,FURY_ATTACK
	db 16,FOCUS_ENERGY
	db 20,TWINEEDLE
	db 25,RAGE
	db 30,PIN_MISSILE
	db 35,AGILITY
	db 0

Mon170_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon085_EvosAttacks:
;DODRIO
;Evolutions
	db 0
;Learnset
	db 20,GROWL
	db 24,FURY_ATTACK
	db 30,DRILL_PECK
	db 39,RAGE
	db 45,TRI_ATTACK
	db 51,AGILITY
	db 0
Mon057_EvosAttacks:
;PRIMEAPE
;Evolutions
	db 0
;Learnset
	db 15,KARATE_CHOP
	db 21,FURY_SWIPES
	db 27,FOCUS_ENERGY
	db 37,SEISMIC_TOSS
	db 46,THRASH
	db 0
Mon051_EvosAttacks:
;DUGTRIO
;Evolutions
	db 0
;Learnset
	db 15,GROWL
	db 19,DIG
	db 24,SAND_ATTACK
	db 35,SLASH
	db 47,EARTHQUAKE
	db 0
Mon049_EvosAttacks:
;VENOMOTH
;Evolutions
	db 0
;Learnset
	db 24,POISONPOWDER
	db 27,LEECH_LIFE
	db 30,STUN_SPORE
	db 38,PSYBEAM
	db 43,SLEEP_POWDER
	db 50,PSYCHIC_M
	db 0
Mon087_EvosAttacks:
;DEWGONG
;Evolutions
	db 0
;Learnset
	db 30,GROWL
	db 35,AURORA_BEAM
	db 44,REST
	db 50,TAKE_DOWN
	db 56,ICE_BEAM
	db 0

Mon171_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon172_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon010_EvosAttacks:
;CATERPIE
;Evolutions
	db EV_LEVEL,7,METAPOD
	db 0
;Learnset
	db 0
Mon011_EvosAttacks:
;METAPOD
;Evolutions
	db EV_LEVEL,10,BUTTERFREE
	db 0
;Learnset
	db 0
Mon012_EvosAttacks:
;BUTTERFREE
;Evolutions
	db 0
;Learnset
	db 12,CONFUSION
	db 15,POISONPOWDER
	db 16,STUN_SPORE
	db 17,SLEEP_POWDER
	db 21,SUPERSONIC
	db 26,WHIRLWIND
	db 32,PSYBEAM
	db 0
Mon068_EvosAttacks:
;MACHAMP
;Evolutions
	db 0
;Learnset
	db 20,LOW_KICK
	db 25,LEER
	db 36,FOCUS_ENERGY
	db 44,SEISMIC_TOSS
	db 52,SUBMISSION
	db 0

Mon173_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon055_EvosAttacks:
;GOLDUCK
;Evolutions
	db 0
;Learnset
	db 28,TAIL_WHIP
	db 31,DISABLE
	db 39,CONFUSION
	db 48,FURY_SWIPES
	db 59,HYDRO_PUMP
	db 0
Mon097_EvosAttacks:
;HYPNO
;Evolutions
	db 0
;Learnset
	db 12,DISABLE
	db 17,CONFUSION
	db 24,HEADBUTT
	db 33,POISON_GAS
	db 37,PSYCHIC_M
	db 43,MEDITATE
	db 0
Mon042_EvosAttacks:
;GOLBAT
;Evolutions
	db 0
;Learnset
	db 10,SUPERSONIC
	db 15,BITE
	db 21,CONFUSE_RAY
	db 32,WING_ATTACK
	db 43,HAZE
	db 0
Mon150_EvosAttacks:
;MEWTWO
;Evolutions
	db 0
;Learnset
	db 63,BARRIER
	db 66,PSYCHIC_M
	db 70,RECOVER
	db 75,MIST
	db 81,AMNESIA
	db 0
Mon143_EvosAttacks:
;SNORLAX
;Evolutions
	db 0
;Learnset
	db 35,BODY_SLAM
	db 41,HARDEN
	db 48,DOUBLE_EDGE
	db 56,HYPER_BEAM
	db 0
Mon129_EvosAttacks:
;MAGIKARP
;Evolutions
	db EV_LEVEL,20,GYARADOS
	db 0
;Learnset
	db 15,TACKLE
	db 0

Mon174_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon175_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon089_EvosAttacks:
;MUK
;Evolutions
	db 0
;Learnset
	db 30,POISON_GAS
	db 33,MINIMIZE
	db 37,SLUDGE
	db 45,HARDEN
	db 53,SCREECH
	db 60,ACID_ARMOR
	db 0

Mon176_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon099_EvosAttacks:
;KINGLER
;Evolutions
	db 0
;Learnset
	db 20,VICEGRIP
	db 25,GUILLOTINE
	db 34,STOMP
	db 42,CRABHAMMER
	db 49,HARDEN
	db 0
Mon091_EvosAttacks:
;CLOYSTER
;Evolutions
	db 0
;Learnset
	db 50,SPIKE_CANNON
	db 0

Mon177_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon101_EvosAttacks:
;ELECTRODE
;Evolutions
	db 0
;Learnset
	db 17,SONICBOOM
	db 22,SELFDESTRUCT
	db 29,LIGHT_SCREEN
	db 40,SWIFT
	db 50,EXPLOSION
	db 0
Mon036_EvosAttacks:
;CLEFABLE
;Evolutions
	db 0
;Learnset
	db 0
Mon110_EvosAttacks:
;WEEZING
;Evolutions
	db 0
;Learnset
	db 32,SLUDGE
	db 39,SMOKESCREEN
	db 43,SELFDESTRUCT
	db 49,HAZE
	db 53,EXPLOSION
	db 0
Mon053_EvosAttacks:
;PERSIAN
;Evolutions
	db 0
;Learnset
	db 12,BITE
	db 17,PAY_DAY
	db 24,SCREECH
	db 37,FURY_SWIPES
	db 51,SLASH
	db 0
Mon105_EvosAttacks:
;MAROWAK
;Evolutions
	db 0
;Learnset
	db 25,LEER
	db 33,FOCUS_ENERGY
	db 41,THRASH
	db 48,BONEMERANG
	db 55,RAGE
	db 0

Mon178_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon093_EvosAttacks:
;HAUNTER
;Evolutions
	db EV_TRADE,1,GENGAR
	db 0
;Learnset
	db 29,HYPNOSIS
	db 38,DREAM_EATER
	db 0
Mon063_EvosAttacks:
;ABRA
;Evolutions
	db EV_LEVEL,16,KADABRA
	db 0
;Learnset
	db 0
Mon065_EvosAttacks:
;ALAKAZAM
;Evolutions
	db 0
;Learnset
	db 16,CONFUSION
	db 20,DISABLE
	db 27,PSYBEAM
	db 31,RECOVER
	db 38,PSYCHIC_M
	db 42,REFLECT
	db 0
Mon017_EvosAttacks:
;PIDGEOTTO
;Evolutions
	db EV_LEVEL,36,PIDGEOT
	db 0
;Learnset
	db 5,SAND_ATTACK
	db 12,QUICK_ATTACK
	db 21,WHIRLWIND
	db 31,WING_ATTACK
	db 40,AGILITY
	db 49,MIRROR_MOVE
	db 0
Mon018_EvosAttacks:
;PIDGEOT
;Evolutions
	db 0
;Learnset
	db 5,SAND_ATTACK
	db 12,QUICK_ATTACK
	db 21,WHIRLWIND
	db 31,WING_ATTACK
	db 44,AGILITY
	db 54,MIRROR_MOVE
	db 0
Mon121_EvosAttacks:
;STARMIE
;Evolutions
	db 0
;Learnset
	db 0
Mon001_EvosAttacks:
;BULBASAUR
;Evolutions
	db EV_LEVEL,16,IVYSAUR
	db 0
;Learnset
	db 7,LEECH_SEED
	db 13,VINE_WHIP
	db 20,POISONPOWDER
	db 27,RAZOR_LEAF
	db 34,GROWTH
	db 41,SLEEP_POWDER
	db 48,SOLARBEAM
	db 0
Mon003_EvosAttacks:
;VENUSAUR
;Evolutions
	db 0
;Learnset
	db 7,LEECH_SEED
	db 13,VINE_WHIP
	db 22,POISONPOWDER
	db 30,RAZOR_LEAF
	db 43,GROWTH
	db 55,SLEEP_POWDER
	db 65,SOLARBEAM
	db 0
Mon073_EvosAttacks:
;TENTACRUEL
;Evolutions
	db 0
;Learnset
	db 7,SUPERSONIC
	db 13,WRAP
	db 18,POISON_STING
	db 22,WATER_GUN
	db 27,CONSTRICT
	db 35,BARRIER
	db 43,SCREECH
	db 50,HYDRO_PUMP
	db 0

Mon179_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon118_EvosAttacks:
;GOLDEEN
;Evolutions
	db EV_LEVEL,33,SEAKING
	db 0
;Learnset
	db 19,SUPERSONIC
	db 24,HORN_ATTACK
	db 30,FURY_ATTACK
	db 37,WATERFALL
	db 45,HORN_DRILL
	db 54,AGILITY
	db 0
Mon119_EvosAttacks:
;SEAKING
;Evolutions
	db 0
;Learnset
	db 19,SUPERSONIC
	db 24,HORN_ATTACK
	db 30,FURY_ATTACK
	db 39,WATERFALL
	db 48,HORN_DRILL
	db 54,AGILITY
	db 0

Mon180_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon181_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon182_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon183_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon077_EvosAttacks:
;PONYTA
;Evolutions
	db EV_LEVEL,40,RAPIDASH
	db 0
;Learnset
	db 30,TAIL_WHIP
	db 32,STOMP
	db 35,GROWL
	db 39,FIRE_SPIN
	db 43,TAKE_DOWN
	db 48,AGILITY
	db 0
Mon078_EvosAttacks:
;RAPIDASH
;Evolutions
	db 0
;Learnset
	db 30,TAIL_WHIP
	db 32,STOMP
	db 35,GROWL
	db 39,FIRE_SPIN
	db 47,TAKE_DOWN
	db 55,AGILITY
	db 0
Mon019_EvosAttacks:
;RATTATA
;Evolutions
	db EV_LEVEL,20,RATICATE
	db 0
;Learnset
	db 7,QUICK_ATTACK
	db 14,HYPER_FANG
	db 23,FOCUS_ENERGY
	db 34,SUPER_FANG
	db 0
Mon020_EvosAttacks:
;RATICATE
;Evolutions
	db 0
;Learnset
	db 7,QUICK_ATTACK
	db 14,HYPER_FANG
	db 27,FOCUS_ENERGY
	db 41,SUPER_FANG
	db 0
Mon033_EvosAttacks:
;NIDORINO
;Evolutions
	db EV_ITEM,MOON_STONE,1,NIDOKING
	db 0
;Learnset
	db 8,HORN_ATTACK
	db 14,POISON_STING
	db 23,FOCUS_ENERGY
	db 32,FURY_ATTACK
	db 41,HORN_DRILL
	db 50,DOUBLE_KICK
	db 0
Mon030_EvosAttacks:
;NIDORINA
;Evolutions
	db EV_ITEM,MOON_STONE,1,NIDOQUEEN
	db 0
;Learnset
	db 8,SCRATCH
	db 14,POISON_STING
	db 23,TAIL_WHIP
	db 32,BITE
	db 41,FURY_SWIPES
	db 50,DOUBLE_KICK
	db 0
Mon074_EvosAttacks:
;GEODUDE
;Evolutions
	db EV_LEVEL,25,GRAVELER
	db 0
;Learnset
	db 11,DEFENSE_CURL
	db 16,ROCK_THROW
	db 21,SELFDESTRUCT
	db 26,HARDEN
	db 31,EARTHQUAKE
	db 36,EXPLOSION
	db 0
Mon137_EvosAttacks:
;PORYGON
;Evolutions
	db 0
;Learnset
	db 23,PSYBEAM
	db 28,RECOVER
	db 35,AGILITY
	db 42,TRI_ATTACK
	db 0
Mon142_EvosAttacks:
;AERODACTYL
;Evolutions
	db 0
;Learnset
	db 33,SUPERSONIC
	db 38,BITE
	db 45,TAKE_DOWN
	db 54,HYPER_BEAM
	db 0

Mon184_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon081_EvosAttacks:
;MAGNEMITE
;Evolutions
	db EV_LEVEL,30,MAGNETON
	db 0
;Learnset
	db 21,SONICBOOM
	db 25,THUNDERSHOCK
	db 29,SUPERSONIC
	db 35,THUNDER_WAVE
	db 41,SWIFT
	db 47,SCREECH
	db 0

Mon185_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon186_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon004_EvosAttacks:
;CHARMANDER
;Evolutions
	db EV_LEVEL,16,CHARMELEON
	db 0
;Learnset
	db 9,EMBER
	db 15,LEER
	db 22,RAGE
	db 30,SLASH
	db 38,FLAMETHROWER
	db 46,FIRE_SPIN
	db 0
Mon007_EvosAttacks:
;SQUIRTLE
;Evolutions
	db EV_LEVEL,16,WARTORTLE
	db 0
;Learnset
	db 8,BUBBLE
	db 15,WATER_GUN
	db 22,BITE
	db 28,WITHDRAW
	db 35,SKULL_BASH
	db 42,HYDRO_PUMP
	db 0
Mon005_EvosAttacks:
;CHARMELEON
;Evolutions
	db EV_LEVEL,36,CHARIZARD
	db 0
;Learnset
	db 9,EMBER
	db 15,LEER
	db 24,RAGE
	db 33,SLASH
	db 42,FLAMETHROWER
	db 56,FIRE_SPIN
	db 0
Mon008_EvosAttacks:
;WARTORTLE
;Evolutions
	db EV_LEVEL,36,BLASTOISE
	db 0
;Learnset
	db 8,BUBBLE
	db 15,WATER_GUN
	db 24,BITE
	db 31,WITHDRAW
	db 39,SKULL_BASH
	db 47,HYDRO_PUMP
	db 0
Mon006_EvosAttacks:
;CHARIZARD
;Evolutions
	db 0
;Learnset
	db 9,EMBER
	db 15,LEER
	db 24,RAGE
	db 36,SLASH
	db 46,FLAMETHROWER
	db 55,FIRE_SPIN
	db 0

Mon187_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon188_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon189_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0

Mon190_EvosAttacks:
;MISSINGNO
;Evolutions
	db 0
;Learnset
	db 0
Mon043_EvosAttacks:
;ODDISH
;Evolutions
	db EV_LEVEL,21,GLOOM
	db 0
;Learnset
	db 15,POISONPOWDER
	db 17,STUN_SPORE
	db 19,SLEEP_POWDER
	db 24,ACID
	db 33,PETAL_DANCE
	db 46,SOLARBEAM
	db 0
Mon044_EvosAttacks:
;GLOOM
;Evolutions
	db EV_ITEM,LEAF_STONE ,1,VILEPLUME
	db 0
;Learnset
	db 15,POISONPOWDER
	db 17,STUN_SPORE
	db 19,SLEEP_POWDER
	db 28,ACID
	db 38,PETAL_DANCE
	db 52,SOLARBEAM
	db 0
Mon045_EvosAttacks:
;VILEPLUME
;Evolutions
	db 0
;Learnset
	db 15,POISONPOWDER
	db 17,STUN_SPORE
	db 19,SLEEP_POWDER
	db 0
Mon069_EvosAttacks:
;BELLSPROUT
;Evolutions
	db EV_LEVEL,21,WEEPINBELL
	db 0
;Learnset
	db 13,WRAP
	db 15,POISONPOWDER
	db 18,SLEEP_POWDER
	db 21,STUN_SPORE
	db 26,ACID
	db 33,RAZOR_LEAF
	db 42,SLAM
	db 0
Mon070_EvosAttacks:
;WEEPINBELL
;Evolutions
	db EV_ITEM,LEAF_STONE ,1,VICTREEBEL
	db 0
;Learnset
	db 13,WRAP
	db 15,POISONPOWDER
	db 18,SLEEP_POWDER
	db 23,STUN_SPORE
	db 29,ACID
	db 38,RAZOR_LEAF
	db 49,SLAM
	db 0
Mon071_EvosAttacks:
;VICTREEBEL
;Evolutions
	db 0
;Learnset
	db 13,WRAP
	db 15,POISONPOWDER
	db 18,SLEEP_POWDER
	db 0

INCBIN "baserom.gbc",$3B9EC, $3C000 - $3B9EC

SECTION "bankF",DATA,BANK[$F]

; These are move effects (second value from the Attacks table in bank $E).
EffectsArray1: ; 4000
	db $18,$19,$1C,$2E,$2F,$31,$38,$39,$40,$41,$42,$43,$4F,$52,$54,$55,$FF
EffectsArray2: ; 4011
; attacks that do damage but not through normal calculations
; e.g., Super Fang, Psywave
	db $28,$29,$FF
EffectsArray3: ; 4014
; non-damaging, stat‐affecting or status‐causing attacks?
; e.g., Meditate, Bide, Hypnosis
	db $01,$0A,$0B,$0C,$0D,$0E,$0F,$12,$13,$14,$15,$16,$17,$1A,$20,$32,$33,$34,$35,$36,$37,$3A,$3B,$3C,$3D,$3E,$3F,$FF
EffectsArray4: ; 4030
	db $03,$07,$08,$10,$1D,$1E,$2C,$30,$4D,$51,$FF
EffectsArray5: ; 403B
	db $03,$07,$08,$10,$11,$1D,$1E,$27,$28,$29,$2B,$2C,$2D,$30 ; fallthru
EffectsArray5B: ; 4049
; attacks that prevent the player from switching attacks?
	db $1B,$2A,$FF

INCBIN "baserom.gbc",$3C04C,$90E - $4C

; XXX this needs cleaning up. it's what runs when a juggler switches pokemon
EnemySendOut: ; 490E
	ld hl,$D058
	xor a
	ld [hl],a
	ld a,[$CC2F]
	ld c,a
	ld b,1
	push bc
	ld a,$10
	call Predef
	ld hl,$CCF5
	xor a
	ld [hl],a
	pop bc
	ld a,$10
	call Predef
	xor a
	ld hl,$D065
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld [$D072],a
	ld [$CCEF],a
	ld [$CCF3],a
	ld hl,$CCF1
	ld [hli],a
	ld [hl],a
	dec a
	ld [W_AICOUNT],a
	ld hl,$D062
	res 5,[hl]
	ld hl,$C3B2
	ld a,8
	call $48DF
	call $6E94
	call $3719
	ld a,[$D12B]
	cp 4
	jr nz,.next\@
	ld a,[$CC3E]
	sub 4
	ld [$CF92],a
	jr .next3\@
.next\@
	ld b,$FF
.next2\@
	inc b
	ld a,[$CFE8]
	cp b
	jr z,.next2\@
	ld hl,$D8A4
	ld a,b
	ld [$CF92],a
	push bc
	ld bc,$2C
	call AddNTimes
	pop bc
	inc hl
	ld a,[hli]
	ld c,a
	ld a,[hl]
	or c
	jr z,.next2\@
.next3\@
	ld a,[$CF92]
	ld hl,$D8C5
	ld bc,$2C
	call AddNTimes
	ld a,[hl]
	ld [$D127],a
	ld a,[$CF92]
	inc a
	ld hl,$D89C
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hl]
	ld [$CFD8],a
	ld [$CF91],a
	call $6B01
	ld hl,$CFE6
	ld a,[hli]
	ld [$CCE3],a
	ld a,[hl]
	ld [$CCE4],a
	ld a,1
	ld [$CC26],a
	ld a,[$D11D]
	dec a
	jr z,.next4\@
	ld a,[W_NUMINPARTY]
	dec a
	jr z,.next4\@
	ld a,[$D12B]
	cp 4
	jr z,.next4\@
	ld a,[$D355]
	bit 6,a
	jr nz,.next4\@
	ld hl,TrainerAboutToUseText
	call PrintText
	ld hl,$C42C
	ld bc,$0801
	ld a,$14
	ld [$D125],a
	call $30E8
	ld a,[$CC26]
	and a
	jr nz,.next4\@
	ld a,2
	ld [$D07D],a
	call $13FC
.next9\@
	ld a,1
	ld [$CC26],a
	jr c,.next7\@
	ld hl,$CC2F
	ld a,[$CF92]
	cp [hl]
	jr nz,.next6\@
	ld hl,$51F5
	call PrintText
.next8\@
	call $1411
	jr .next9\@
.next6\@
	call $4A97
	jr z,.next8\@
	xor a
	ld [$CC26],a
.next7\@
	call $3DE5
	call $6E5B
	call $3725
.next4\@
	call $0082
	ld hl,$C3A0
	ld bc,$040B
	call $18C4
	ld b,1
	call $3DEF
	call $3DDC
	ld hl,TrainerSentOutText
	call PrintText
	ld a,[$CFD8]
	ld [$CF91],a
	ld [$D0B5],a
	call $1537
	ld de,$9000
	call $1665
	ld a,$CF
	ld [$FFE1],a
	ld hl,$C427
	ld a,2
	call Predef
	ld a,[$CFD8]
	call $13D0
	call $4DEC
	ld a,[$CC26]
	and a
	ret nz
	xor a
	ld [$D058],a
	ld [$CCF5],a
	call $3719
	jp $51BA

TrainerAboutToUseText:
	TX_FAR _TrainerAboutToUseText
	db "@"

TrainerSentOutText:
	TX_FAR _TrainerSentOutText
	db "@"

INCBIN "baserom.gbc",$3CA83,$3D6A9 - $3CA83
; in-battle stuff
	ld hl,$D062
	res 4,[hl]
	res 6,[hl]
	call $5AF5
	ld hl,DecrementPP
	ld de,$CCDC ; pointer to the move just used
	ld b,BANK(DecrementPP)
	call Bankswitch
	ld a,[$CFD3] ; effect of the attack just used
	ld hl,EffectsArray1
	ld de,1
	call IsInArray
	jp c,$7132
	ld a,[$CFD3]
	ld hl,EffectsArray5B
	ld de,1
	call IsInArray
	call c,$7132
	ld a,[$CFD3]
	ld hl,EffectsArray2
	ld de,1
	call IsInArray
	jp c,$5702
	call $6023
	call $6093
	jr z,.next11\@
	call $5DCF
	call $5F65
	jp z,$574B
	call $63A5
	call $6687
	call $656B
.next11\@
	ld a,[$D05F]
	and a
	jr z,.next\@
	ld a,[$CFD3]
	sub a,7
	jr z,.next2\@
	jr .next3\@ ; 574B
.next\@
	ld a,[$CFD3]
	and a
	ld a,4
	jr z,.next2\@
	ld a,5
.next2\@
	push af
	ld a,[$D063]
	bit 4,a
	ld hl,$5747
	ld b,$1E
	call nz,Bankswitch
	pop af
	ld [$CC5B],a
	ld a,[$CFD2]
	call $6F07
	call $6ED3
	call $4D60
	ld a,[$D063]
	bit 4,a
	ld hl,$5771
	ld b,$1E
	call nz,Bankswitch
	jr .next4\@
.next3\@
	ld c,$1E
	call $3739
	ld a,[$CFD3]
	cp a,$2B
	jr z,.next5\@
	cp a,$27 ; XXX SLP | FRZ ?
	jr z,.next5\@
	jr .next4\@
.next5\@
	xor a
	ld [$CC5B],a
	ld a,$A7
	call $6F07
.next4\@
	ld a,[$CFD3]
	cp a,9
	jr nz,.next6\@ ; 577A
	call $62FD
	jp z,Function580A
	xor a
	ld [$CCED],a
	jp $569A
.next6\@
	cp a,$53
	jr nz,.next7\@ ; 5784
	call $6348
	jp $569A
.next7\@
	ld a,[$CFD3]
	ld hl,EffectsArray3
	ld de,1
	call IsInArray
	jp c,$7132
	ld a,[$D05F]
	and a
	jr z,.next8\@ ; 57A6
	call $5BE2
	ld a,[$CFD3]
	cp a,7
	jr z,.next9\@ ; 57B9
	jp Function580A
.next8\@
	call $60DF
	call $5C5C
	ld hl,$7B7B
	ld b,$B
	call $35D6
	ld a,1
	ld [$CCF4],a
.next9\@
	ld a,[$CFD3]
	ld hl,EffectsArray4
	ld de,1
	call IsInArray
	call c,$7132
	ld hl,$CFE6
	ld a,[hli]
	ld b,[hl]
	or b
	ret z
	call $62B6

	ld hl,$D062
	bit 2,[hl]
	jr z,.next10\@ ; 57EF
	ld a,[$D06A]
	dec a
	ld [$D06A],a
	jp nz,$5714

	res 2,[hl]
	ld hl,MultiHitText
	call PrintText
	xor a
	ld [W_NUMHITS],a ; reset
.next10\@
	ld a,[$CFD3]
	and a
	jp z,Function580A
	ld hl,EffectsArray5
	ld de,1
	call IsInArray
	call nc,$7132
	jp Function580A

MultiHitText:
	TX_FAR _MultiHitText
	db "@"

Function580A: ; 580A
	xor a
	ld [$CD6A],a
	ld b,1
	ret

Function5811: ; 5811
; print the ghost battle messages
	call $583A
	ret nz
	ld a,[H_WHOSETURN]
	and a
	jr nz,.Ghost\@
	ld a,[W_CURMONSTATUS] ; player’s turn
	and a,SLP | FRZ
	ret nz
	ld hl,ScaredText
	call PrintText
	xor a
	ret
.Ghost\@ ; ghost’s turn
	ld hl,GetOutText
	call PrintText
	xor a
	ret

ScaredText:
	TX_FAR _ScaredText
	db "@"

GetOutText:
	TX_FAR _GetOutText
	db "@"

Function583A: ; 583A
	ld a,[W_ISINBATTLE]
	dec a
	ret nz
	ld a,[W_CURMAP]
	cp a,$8E ; Lavender Town
	jr c,.next\@
	cp a,$95 ; Pokémon Tower
	jr nc,.next\@
	ld b,SILPH_SCOPE
	call Function3493
	ret z
.next\@
	ld a,1
	and a
	ret

Function5854: ; 5854
	ld hl,W_CURMONSTATUS
	ld a,[hl]
	and a,SLP
	jr z,.FrozenCheck\@ ; to 5884

	dec a
	ld [W_CURMONSTATUS],a ; decrement sleep count
	and a
	jr z,.WakeUp\@ ; to 5874

	xor a
	ld [$CC5B],a
	ld a,SLP_ANIM - 1
	call $6F07
	ld hl,FastAsleepText
	call PrintText
	jr .sleepDone\@
.WakeUp\@
	ld hl,WokeUpText
	call PrintText
.sleepDone\@
	xor a
	ld [$CCF1],a
	ld hl,Function580A
	jp $5A37

.FrozenCheck\@
	bit 5,[hl] ; frozen?
	jr z,.HeldInPlaceCheck\@ ; to 5898
	ld hl,FrozenText
	call PrintText
	xor a
	ld [$CCF1],a
	ld hl,Function580A
	jp $5A37

.HeldInPlaceCheck\@
	ld a,[W_CURMONBATTSTATUS]
	bit 5,a
	jp z,FlinchedCheck
	ld hl,CantMoveText
	call PrintText
	ld hl,Function580A
	jp $5A37

FlinchedCheck: ; 58AC
	ld hl,$D062
	bit 3,[hl]
	jp z,HyperBeamCheck
	res 3,[hl]
	ld hl,FlinchedText
	call PrintText
	ld hl,Function580A
	jp $5A37

HyperBeamCheck: ; 58C2
	ld hl,$D063
	bit 5,[hl]
	jr z,.next\@ ; 58D7
	res 5,[hl]
	ld hl,MustRechargeText
	call PrintText
	ld hl,$580A
	jp $5A37
.next\@
	ld hl,$D06D
	ld a,[hl]
	and a
	jr z,.next2\@ ; 58EE
	dec a
	ld [hl],a
	and a,$F
	jr nz,.next2\@
	ld [hl],a
	ld [$CCEE],a
	ld hl,DisabledNoMoreText
	call PrintText
.next2\@
	ld a,[$D062]
	add a
	jr nc,.next3\@ ; 5929
	ld hl,$D06B
	dec [hl]
	jr nz,.next4\@ ; 5907
	ld hl,$D062
	res 7,[hl]
	ld hl,ConfusedNoMoreText
	call PrintText
	jr .next3\@
.next4\@
	ld hl,IsConfusedText
	call PrintText
	xor a
	ld [$CC5B],a
	ld a,CONF_ANIM - 1
	call $6F07
	call $6E9B
	cp a,$80
	jr c,.next3\@
	ld hl,$D062
	ld a,[hl]
	and a,$80
	ld [hl],a
	call $5AAD
	jr .next5\@ ; 5952
.next3\@
	ld a,[$CCEE]
	and a
	jr z,.ParalysisCheck\@ ; 593E
	ld hl,$CCDC
	cp [hl]
	jr nz,.ParalysisCheck\@
	call $5A88
	ld hl,$580A
	jp $5A37
.ParalysisCheck\@
	ld hl,W_CURMONSTATUS
	bit 6,[hl]
	jr z,.next7\@ ; 5975
	call $6E9B ; random number?
	cp a,$3F
	jr nc,.next7\@
	ld hl,FullyParalyzedText
	call PrintText
.next5\@
	ld hl,$D062
	ld a,[hl]
	and a,$CC
	ld [hl],a
	ld a,[$CFD3]
	cp a,$2B
	jr z,.next8\@ ; 5966
	cp a,$27
	jr z,.next8\@
	jr .next9\@ ; 596F
.next8\@
	xor a
	ld [$CC5B],a
	ld a,$A7
	call $6F07
.next9\@
	ld hl,$580A
	jp $5A37
.next7\@
	ld hl,$D062
	bit 0,[hl]
	jr z,.next10\@ ; 59D0
	xor a
	ld [$CFD2],a
	ld hl,$D0D7
	ld a,[hli]
	ld b,a
	ld c,[hl]
	ld hl,$D075
	ld a,[hl]
	add c
	ld [hld],a
	ld a,[hl]
	adc b
	ld [hl],a
	ld hl,$D06A
	dec [hl]
	jr z,.next11\@ ; 599B
	ld hl,$580A
	jp $5A37
.next11\@
	ld hl,$D062
	res 0,[hl]
	ld hl,UnleashedEnergyText
	call PrintText
	ld a,1
	ld [$CFD4],a
	ld hl,$D075
	ld a,[hld]
	add a
	ld b,a
	ld [$D0D8],a
	ld a,[hl]
	rl a
	ld [$D0D7],a
	or b
	jr nz,.next12\@ ; 59C2
	ld a,1
	ld [$D05F],a
.next12\@
	xor a
	ld [hli],a
	ld [hl],a
	ld a,$75
	ld [$CFD2],a
	ld hl,$5705
	jp $5A37
.next10\@
	bit 1,[hl]
	jr z,.next13\@ ; 59FF
	ld a,$25
	ld [$CFD2],a
	ld hl,ThrashingAboutText
	call PrintText
	ld hl,$D06A
	dec [hl]
	ld hl,$56DC
	jp nz,$5A37
	push hl
	ld hl,$D062
	res 1,[hl]
	set 7,[hl]
	call $6E9B ; random number?
	and a,3
	inc a
	inc a
	ld [$D06B],a
	pop hl
	jp $5A37
.next13\@
	bit 5,[hl]
	jp z,$5A1A
	ld hl,AttackContinuesText
	call PrintText
	ld a,[$D06A]
	dec a
	ld [$D06A],a
	ld hl,$5714
	jp nz,$5A37
	jp $5A37

INCBIN "baserom.gbc",$3DA1A,$3DA3D - $3DA1A

FastAsleepText:
	TX_FAR _FastAsleepText
	db "@"

WokeUpText:
	TX_FAR _WokeUpText
	db "@"

FrozenText:
	TX_FAR _FrozenText
	db "@"

FullyParalyzedText:
	TX_FAR _FullyParalyzedText
	db "@"

FlinchedText:
	TX_FAR _FlinchedText
	db "@"

MustRechargeText:
	TX_FAR _MustRechargeText
	db "@"

DisabledNoMoreText:
	TX_FAR _DisabledNoMoreText
	db "@"

IsConfusedText:
	TX_FAR _IsConfusedText
	db "@"

HurtItselfText:
	TX_FAR _HurtItselfText
	db "@"

ConfusedNoMoreText:
	TX_FAR _ConfusedNoMoreText
	db "@"

SavingEnergyText:
	TX_FAR _SavingEnergyText
	db "@"

UnleashedEnergyText:
	TX_FAR _UnleashedEnergyText
	db "@"

ThrashingAboutText:
	TX_FAR _ThrashingAboutText
	db "@"

AttackContinuesText:
	TX_FAR _AttackContinuesText
	db "@"

CantMoveText:
	TX_FAR _CantMoveText
	db "@"

INCBIN "baserom.gbc",$3DA88,$3E474 - $3DA88

TypeEffects: ; 6474
; format: attacking type, defending type, damage multiplier
; the multiplier is a (decimal) fixed-point number:
;     20 is ×2.0
;     05 is ×0.5
;     00 is ×0
	db WATER,FIRE,20
	db FIRE,GRASS,20
	db FIRE,ICE,20
	db GRASS,WATER,20
	db ELECTRIC,WATER,20
	db WATER,ROCK,20
	db GROUND,FLYING,00
	db WATER,WATER,05
	db FIRE,FIRE,05
	db ELECTRIC,ELECTRIC,05
	db ICE,ICE,05
	db GRASS,GRASS,05
	db PSYCHIC,PSYCHIC,05
	db FIRE,WATER,05
	db GRASS,FIRE,05
	db WATER,GRASS,05
	db ELECTRIC,GRASS,05
	db NORMAL,ROCK,05
	db NORMAL,GHOST,00
	db GHOST,GHOST,20
	db FIRE,BUG,20
	db FIRE,ROCK,05
	db WATER,GROUND,20
	db ELECTRIC,GROUND,00
	db ELECTRIC,FLYING,20
	db GRASS,GROUND,20
	db GRASS,BUG,05
	db GRASS,POISON,05
	db GRASS,ROCK,20
	db GRASS,FLYING,05
	db ICE,WATER,05
	db ICE,GRASS,20
	db ICE,GROUND,20
	db ICE,FLYING,20
	db FIGHTING,NORMAL,20
	db FIGHTING,POISON,05
	db FIGHTING,FLYING,05
	db FIGHTING,PSYCHIC,05
	db FIGHTING,BUG,05
	db FIGHTING,ROCK,20
	db FIGHTING,ICE,20
	db FIGHTING,GHOST,00
	db POISON,GRASS,20
	db POISON,POISON,05
	db POISON,GROUND,05
	db POISON,BUG,20
	db POISON,ROCK,05
	db POISON,GHOST,05
	db GROUND,FIRE,20
	db GROUND,ELECTRIC,20
	db GROUND,GRASS,05
	db GROUND,BUG,05
	db GROUND,ROCK,20
	db GROUND,POISON,20
	db FLYING,ELECTRIC,05
	db FLYING,FIGHTING,20
	db FLYING,BUG,20
	db FLYING,GRASS,20
	db FLYING,ROCK,05
	db PSYCHIC,FIGHTING,20
	db PSYCHIC,POISON,20
	db BUG,FIRE,05
	db BUG,GRASS,20
	db BUG,FIGHTING,05
	db BUG,FLYING,05
	db BUG,PSYCHIC,20
	db BUG,GHOST,05
	db BUG,POISON,20
	db ROCK,FIRE,20
	db ROCK,FIGHTING,05
	db ROCK,GROUND,05
	db ROCK,FLYING,20
	db ROCK,BUG,20
	db ROCK,ICE,20
	db GHOST,NORMAL,00
	db GHOST,PSYCHIC,00
	db FIRE,DRAGON,05
	db WATER,DRAGON,05
	db ELECTRIC,DRAGON,05
	db GRASS,DRAGON,05
	db ICE,DRAGON,20
	db DRAGON,DRAGON,20
	db $FF

INCBIN "baserom.gbc",$3E56B,$3EF07 - $3E56B

PlayAttackAnimation: ; 6F07
	ld [$D07C],a
	call Delay3
	ld a,8
	jp Predef

INCBIN "baserom.gbc",$3EF12,$40000 - $3EF12

SECTION "bank10",DATA,BANK[$10]
INCBIN "baserom.gbc",$40000,$47E

PokedexEntryPointers: ; 447E
	dw RhydonDexEntry
	dw KangaskhanDexEntry
	dw NidoranMDexEntry
	dw ClefairyDexEntry
	dw SpearowDexEntry
	dw VoltorbDexEntry
	dw NidokingDexEntry
	dw SlowbroDexEntry
	dw IvysaurDexEntry
	dw ExeggutorDexEntry
	dw LickitungDexEntry
	dw ExeggcuteDexEntry
	dw GrimerDexEntry
	dw GengarDexEntry
	dw NidoranFDexEntry
	dw NidoqueenDexEntry
	dw CuboneDexEntry
	dw RhyhornDexEntry
	dw LaprasDexEntry
	dw ArcanineDexEntry
	dw MewDexEntry
	dw GyaradosDexEntry
	dw ShellderDexEntry
	dw TentacoolDexEntry
	dw GastlyDexEntry
	dw ScytherDexEntry
	dw StaryuDexEntry
	dw BlastoiseDexEntry
	dw PinsirDexEntry
	dw TangelaDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw GrowlitheDexEntry
	dw OnixDexEntry
	dw FearowDexEntry
	dw PidgeyDexEntry
	dw SlowpokeDexEntry
	dw KadabraDexEntry
	dw GravelerDexEntry
	dw ChanseyDexEntry
	dw MachokeDexEntry
	dw MrMimeDexEntry
	dw HitmonleeDexEntry
	dw HitmonchanDexEntry
	dw ArbokDexEntry
	dw ParasectDexEntry
	dw PsyduckDexEntry
	dw DrowzeeDexEntry
	dw GolemDexEntry
	dw MissingNoDexEntry
	dw MagmarDexEntry
	dw MissingNoDexEntry
	dw ElectabuzzDexEntry
	dw MagnetonDexEntry
	dw KoffingDexEntry
	dw MissingNoDexEntry
	dw MankeyDexEntry
	dw SeelDexEntry
	dw DiglettDexEntry
	dw TaurosDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw FarfetchdDexEntry
	dw VenonatDexEntry
	dw DragoniteDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw DoduoDexEntry
	dw PoliwagDexEntry
	dw JynxDexEntry
	dw MoltresDexEntry
	dw ArticunoDexEntry
	dw ZapdosDexEntry
	dw DittoDexEntry
	dw MeowthDexEntry
	dw KrabbyDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw VulpixDexEntry
	dw NinetalesDexEntry
	dw PikachuDexEntry
	dw RaichuDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw DratiniDexEntry
	dw DragonairDexEntry
	dw KabutoDexEntry
	dw KabutopsDexEntry
	dw HorseaDexEntry
	dw SeadraDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw SandshrewDexEntry
	dw SandslashDexEntry
	dw OmanyteDexEntry
	dw OmastarDexEntry
	dw JigglypuffDexEntry
	dw WigglytuffDexEntry
	dw EeveeDexEntry
	dw FlareonDexEntry
	dw JolteonDexEntry
	dw VaporeonDexEntry
	dw MachopDexEntry
	dw ZubatDexEntry
	dw EkansDexEntry
	dw ParasDexEntry
	dw PoliwhirlDexEntry
	dw PoliwrathDexEntry
	dw WeedleDexEntry
	dw KakunaDexEntry
	dw BeedrillDexEntry
	dw MissingNoDexEntry
	dw DodrioDexEntry
	dw PrimeapeDexEntry
	dw DugtrioDexEntry
	dw VenomothDexEntry
	dw DewgongDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw CaterpieDexEntry
	dw MetapodDexEntry
	dw ButterfreeDexEntry
	dw MachampDexEntry
	dw MissingNoDexEntry
	dw GolduckDexEntry
	dw HypnoDexEntry
	dw GolbatDexEntry
	dw MewtwoDexEntry
	dw SnorlaxDexEntry
	dw MagikarpDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MukDexEntry
	dw MissingNoDexEntry
	dw KinglerDexEntry
	dw CloysterDexEntry
	dw MissingNoDexEntry
	dw ElectrodeDexEntry
	dw ClefableDexEntry
	dw WeezingDexEntry
	dw PersianDexEntry
	dw MarowakDexEntry
	dw MissingNoDexEntry
	dw HaunterDexEntry
	dw AbraDexEntry
	dw AlakazamDexEntry
	dw PidgeottoDexEntry
	dw PidgeotDexEntry
	dw StarmieDexEntry
	dw BulbasaurDexEntry
	dw VenusaurDexEntry
	dw TentacruelDexEntry
	dw MissingNoDexEntry
	dw GoldeenDexEntry
	dw SeakingDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw PonytaDexEntry
	dw RapidashDexEntry
	dw RattataDexEntry
	dw RaticateDexEntry
	dw NidorinoDexEntry
	dw NidorinaDexEntry
	dw GeodudeDexEntry
	dw PorygonDexEntry
	dw AerodactylDexEntry
	dw MissingNoDexEntry
	dw MagnemiteDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw CharmanderDexEntry
	dw SquirtleDexEntry
	dw CharmeleonDexEntry
	dw WartortleDexEntry
	dw CharizardDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw MissingNoDexEntry
	dw OddishDexEntry
	dw GloomDexEntry
	dw VileplumeDexEntry
	dw BellsproutDexEntry
	dw WeepinbellDexEntry
	dw VictreebelDexEntry

; string: species name
; height in feet, inches
; weight in pounds
; text entry

RhydonDexEntry:
	db "DRILL@"
	db 6,3
	dw 2650
	TX_FAR _RhydonDexEntry
	db "@"

KangaskhanDexEntry:
	db "PARENT@"
	db 7,3
	dw 1760
	TX_FAR _KangaskhanDexEntry
	db "@"

NidoranMDexEntry:
	db "POISON PIN@"
	db 1,8
	dw 200
	TX_FAR _NidoranMDexEntry
	db "@"

ClefairyDexEntry:
	db "FAIRY@"
	db 2,0
	dw 170
	TX_FAR _ClefairyDexEntry
	db "@"

SpearowDexEntry:
	db "TINY BIRD@"
	db 1,0
	dw 40
	TX_FAR _SpearowDexEntry
	db "@"

VoltorbDexEntry:
	db "BALL@"
	db 1,8
	dw 230
	TX_FAR _VoltorbDexEntry
	db "@"

NidokingDexEntry:
	db "DRILL@"
	db 4,7
	dw 1370
	TX_FAR _NidokingDexEntry
	db "@"

SlowbroDexEntry:
	db "HERMITCRAB@"
	db 5,3
	dw 1730
	TX_FAR _SlowbroDexEntry
	db "@"

IvysaurDexEntry:
	db "SEED@"
	db 3,3
	dw 290
	TX_FAR _IvysaurDexEntry
	db "@"

ExeggutorDexEntry:
	db "COCONUT@"
	db 6,7
	dw 2650
	TX_FAR _ExeggutorDexEntry
	db "@"

LickitungDexEntry:
	db "LICKING@"
	db 3,11
	dw 1440
	TX_FAR _LickitungDexEntry
	db "@"

ExeggcuteDexEntry:
	db "EGG@"
	db 1,4
	dw 60
	TX_FAR _ExeggcuteDexEntry
	db "@"

GrimerDexEntry:
	db "SLUDGE@"
	db 2,11
	dw 660
	TX_FAR _GrimerDexEntry
	db "@"

GengarDexEntry:
	db "SHADOW@"
	db 4,11
	dw 890
	TX_FAR _GengarDexEntry
	db "@"

NidoranFDexEntry:
	db "POISON PIN@"
	db 1,4
	dw 150
	TX_FAR _NidoranFDexEntry
	db "@"

NidoqueenDexEntry:
	db "DRILL@"
	db 4,3
	dw 1320
	TX_FAR _NidoqueenDexEntry
	db "@"

CuboneDexEntry:
	db "LONELY@"
	db 1,4
	dw 140
	TX_FAR _CuboneDexEntry
	db "@"

RhyhornDexEntry:
	db "SPIKES@"
	db 3,3
	dw 2540
	TX_FAR _RhyhornDexEntry
	db "@"

LaprasDexEntry:
	db "TRANSPORT@"
	db 8,2
	dw 4850
	TX_FAR _LaprasDexEntry
	db "@"

ArcanineDexEntry:
	db "LEGENDARY@"
	db 6,3
	dw 3420
	TX_FAR _ArcanineDexEntry
	db "@"

MewDexEntry:
	db "NEW SPECIE@"
	db 1,4
	dw 90
	TX_FAR _MewDexEntry
	db "@"

GyaradosDexEntry:
	db "ATROCIOUS@"
	db 21,4
	dw 5180
	TX_FAR _GyaradosDexEntry
	db "@"

ShellderDexEntry:
	db "BIVALVE@"
	db 1,0
	dw 90
	TX_FAR _ShellderDexEntry
	db "@"

TentacoolDexEntry:
	db "JELLYFISH@"
	db 2,11
	dw 1000
	TX_FAR _TentacoolDexEntry
	db "@"

GastlyDexEntry:
	db "GAS@"
	db 4,3
	dw 2
	TX_FAR _GastlyDexEntry
	db "@"

ScytherDexEntry:
	db "MANTIS@"
	db 4,11
	dw 1230
	TX_FAR _ScytherDexEntry
	db "@"

StaryuDexEntry:
	db "STARSHAPE@"
	db 2,7
	dw 760
	TX_FAR _StaryuDexEntry
	db "@"

BlastoiseDexEntry:
	db "SHELLFISH@"
	db 5,3
	dw 1890
	TX_FAR _BlastoiseDexEntry
	db "@"

PinsirDexEntry:
	db "STAGBEETLE@"
	db 4,11
	dw 1210
	TX_FAR _PinsirDexEntry
	db "@"

TangelaDexEntry:
	db "VINE@"
	db 3,3
	dw 770
	TX_FAR _TangelaDexEntry
	db "@"

GrowlitheDexEntry:
	db "PUPPY@"
	db 2,4
	dw 420
	TX_FAR _GrowlitheDexEntry
	db "@"

OnixDexEntry:
	db "ROCK SNAKE@"
	db 28,10
	dw 4630
	TX_FAR _OnixDexEntry
	db "@"

FearowDexEntry:
	db "BEAK@"
	db 3,11
	dw 840
	TX_FAR _FearowDexEntry
	db "@"

PidgeyDexEntry:
	db "TINY BIRD@"
	db 1,0
	dw 40
	TX_FAR _PidgeyDexEntry
	db "@"

SlowpokeDexEntry:
	db "DOPEY@"
	db 3,11
	dw 790
	TX_FAR _SlowpokeDexEntry
	db "@"

KadabraDexEntry:
	db "PSI@"
	db 4,3
	dw 1250
	TX_FAR _KadabraDexEntry
	db "@"

GravelerDexEntry:
	db "ROCK@"
	db 3,3
	dw 2320
	TX_FAR _GravelerDexEntry
	db "@"

ChanseyDexEntry:
	db "EGG@"
	db 3,7
	dw 760
	TX_FAR _ChanseyDexEntry
	db "@"

MachokeDexEntry:
	db "SUPERPOWER@"
	db 4,11
	dw 1550
	TX_FAR _MachokeDexEntry
	db "@"

MrMimeDexEntry:
	db "BARRIER@"
	db 4,3
	dw 1200
	TX_FAR _MrMimeDexEntry
	db "@"

HitmonleeDexEntry:
	db "KICKING@"
	db 4,11
	dw 1100
	TX_FAR _HitmonleeDexEntry
	db "@"

HitmonchanDexEntry:
	db "PUNCHING@"
	db 4,7
	dw 1110
	TX_FAR _HitmonchanDexEntry
	db "@"

ArbokDexEntry:
	db "COBRA@"
	db 11,6
	dw 1430
	TX_FAR _ArbokDexEntry
	db "@"

ParasectDexEntry:
	db "MUSHROOM@"
	db 3,3
	dw 650
	TX_FAR _ParasectDexEntry
	db "@"

PsyduckDexEntry:
	db "DUCK@"
	db 2,7
	dw 430
	TX_FAR _PsyduckDexEntry
	db "@"

DrowzeeDexEntry:
	db "HYPNOSIS@"
	db 3,3
	dw 710
	TX_FAR _DrowzeeDexEntry
	db "@"

GolemDexEntry:
	db "MEGATON@"
	db 4,7
	dw 6620
	TX_FAR _GolemDexEntry
	db "@"

MagmarDexEntry:
	db "SPITFIRE@"
	db 4,3
	dw 980
	TX_FAR _MagmarDexEntry
	db "@"

ElectabuzzDexEntry:
	db "ELECTRIC@"
	db 3,7
	dw 660
	TX_FAR _ElectabuzzDexEntry
	db "@"

MagnetonDexEntry:
	db "MAGNET@"
	db 3,3
	dw 1320
	TX_FAR _MagnetonDexEntry
	db "@"

KoffingDexEntry:
	db "POISON GAS@"
	db 2,0
	dw 20
	TX_FAR _KoffingDexEntry
	db "@"

MankeyDexEntry:
	db "PIG MONKEY@"
	db 1,8
	dw 620
	TX_FAR _MankeyDexEntry
	db "@"

SeelDexEntry:
	db "SEA LION@"
	db 3,7
	dw 1980
	TX_FAR _SeelDexEntry
	db "@"

DiglettDexEntry:
	db "MOLE@"
	db 0,8
	dw 20
	TX_FAR _DiglettDexEntry
	db "@"

TaurosDexEntry:
	db "WILD BULL@"
	db 4,7
	dw 1950
	TX_FAR _TaurosDexEntry
	db "@"

FarfetchdDexEntry:
	db "WILD DUCK@"
	db 2,7
	dw 330
	TX_FAR _FarfetchdDexEntry
	db "@"

VenonatDexEntry:
	db "INSECT@"
	db 3,3
	dw 660
	TX_FAR _VenonatDexEntry
	db "@"

DragoniteDexEntry:
	db "DRAGON@"
	db 7,3
	dw 4630
	TX_FAR _DragoniteDexEntry
	db "@"

DoduoDexEntry:
	db "TWIN BIRD@"
	db 4,7
	dw 860
	TX_FAR _DoduoDexEntry
	db "@"

PoliwagDexEntry:
	db "TADPOLE@"
	db 2,0
	dw 270
	TX_FAR _PoliwagDexEntry
	db "@"

JynxDexEntry:
	db "HUMANSHAPE@"
	db 4,7
	dw 900
	TX_FAR _JynxDexEntry
	db "@"

MoltresDexEntry:
	db "FLAME@"
	db 6,7
	dw 1320
	TX_FAR _MoltresDexEntry
	db "@"

ArticunoDexEntry:
	db "FREEZE@"
	db 5,7
	dw 1220
	TX_FAR _ArticunoDexEntry
	db "@"

ZapdosDexEntry:
	db "ELECTRIC@"
	db 5,3
	dw 1160
	TX_FAR _ZapdosDexEntry
	db "@"

DittoDexEntry:
	db "TRANSFORM@"
	db 1,0
	dw 90
	TX_FAR _DittoDexEntry
	db "@"

MeowthDexEntry:
	db "SCRATCHCAT@"
	db 1,4
	dw 90
	TX_FAR _MeowthDexEntry
	db "@"

KrabbyDexEntry:
	db "RIVER CRAB@"
	db 1,4
	dw 140
	TX_FAR _KrabbyDexEntry
	db "@"

VulpixDexEntry:
	db "FOX@"
	db 2,0
	dw 220
	TX_FAR _VulpixDexEntry
	db "@"

NinetalesDexEntry:
	db "FOX@"
	db 3,7
	dw 440
	TX_FAR _NinetalesDexEntry
	db "@"

PikachuDexEntry:
	db "MOUSE@"
	db 1,4
	dw 130
	TX_FAR _PikachuDexEntry
	db "@"

RaichuDexEntry:
	db "MOUSE@"
	db 2,7
	dw 660
	TX_FAR _RaichuDexEntry
	db "@"

DratiniDexEntry:
	db "DRAGON@"
	db 5,11
	dw 70
	TX_FAR _DratiniDexEntry
	db "@"

DragonairDexEntry:
	db "DRAGON@"
	db 13,1
	dw 360
	TX_FAR _DragonairDexEntry
	db "@"

KabutoDexEntry:
	db "SHELLFISH@"
	db 1,8
	dw 250
	TX_FAR _KabutoDexEntry
	db "@"

KabutopsDexEntry:
	db "SHELLFISH@"
	db 4,3
	dw 890
	TX_FAR _KabutopsDexEntry
	db "@"

HorseaDexEntry:
	db "DRAGON@"
	db 1,4
	dw 180
	TX_FAR _HorseaDexEntry
	db "@"

SeadraDexEntry:
	db "DRAGON@"
	db 3,11
	dw 550
	TX_FAR _SeadraDexEntry
	db "@"

SandshrewDexEntry:
	db "MOUSE@"
	db 2,0
	dw 260
	TX_FAR _SandshrewDexEntry
	db "@"

SandslashDexEntry:
	db "MOUSE@"
	db 3,3
	dw 650
	TX_FAR _SandslashDexEntry
	db "@"

OmanyteDexEntry:
	db "SPIRAL@"
	db 1,4
	dw 170
	TX_FAR _OmanyteDexEntry
	db "@"

OmastarDexEntry:
	db "SPIRAL@"
	db 3,3
	dw 770
	TX_FAR _OmastarDexEntry
	db "@"

JigglypuffDexEntry:
	db "BALLOON@"
	db 1,8
	dw 120
	TX_FAR _JigglypuffDexEntry
	db "@"

WigglytuffDexEntry:
	db "BALLOON@"
	db 3,3
	dw 260
	TX_FAR _WigglytuffDexEntry
	db "@"

EeveeDexEntry:
	db "EVOLUTION@"
	db 1,0
	dw 140
	TX_FAR _EeveeDexEntry
	db "@"

FlareonDexEntry:
	db "FLAME@"
	db 2,11
	dw 550
	TX_FAR _FlareonDexEntry
	db "@"

JolteonDexEntry:
	db "LIGHTNING@"
	db 2,7
	dw 540
	TX_FAR _JolteonDexEntry
	db "@"

VaporeonDexEntry:
	db "BUBBLE JET@"
	db 3,3
	dw 640
	TX_FAR _VaporeonDexEntry
	db "@"

MachopDexEntry:
	db "SUPERPOWER@"
	db 2,7
	dw 430
	TX_FAR _MachopDexEntry
	db "@"

ZubatDexEntry:
	db "BAT@"
	db 2,7
	dw 170
	TX_FAR _ZubatDexEntry
	db "@"

EkansDexEntry:
	db "SNAKE@"
	db 6,7
	dw 150
	TX_FAR _EkansDexEntry
	db "@"

ParasDexEntry:
	db "MUSHROOM@"
	db 1,0
	dw 120
	TX_FAR _ParasDexEntry
	db "@"

PoliwhirlDexEntry:
	db "TADPOLE@"
	db 3,3
	dw 440
	TX_FAR _PoliwhirlDexEntry
	db "@"

PoliwrathDexEntry:
	db "TADPOLE@"
	db 4,3
	dw 1190
	TX_FAR _PoliwrathDexEntry
	db "@"

WeedleDexEntry:
	db "HAIRY BUG@"
	db 1,0
	dw 70
	TX_FAR _WeedleDexEntry
	db "@"

KakunaDexEntry:
	db "COCOON@"
	db 2,0
	dw 220
	TX_FAR _KakunaDexEntry
	db "@"

BeedrillDexEntry:
	db "POISON BEE@"
	db 3,3
	dw 650
	TX_FAR _BeedrillDexEntry
	db "@"

DodrioDexEntry:
	db "TRIPLEBIRD@"
	db 5,11
	dw 1880
	TX_FAR _DodrioDexEntry
	db "@"

PrimeapeDexEntry:
	db "PIG MONKEY@"
	db 3,3
	dw 710
	TX_FAR _PrimeapeDexEntry
	db "@"

DugtrioDexEntry:
	db "MOLE@"
	db 2,4
	dw 730
	TX_FAR _DugtrioDexEntry
	db "@"

VenomothDexEntry:
	db "POISONMOTH@"
	db 4,11
	dw 280
	TX_FAR _VenomothDexEntry
	db "@"

DewgongDexEntry:
	db "SEA LION@"
	db 5,7
	dw 2650
	TX_FAR _DewgongDexEntry
	db "@"

CaterpieDexEntry:
	db "WORM@"
	db 1,0
	dw 60
	TX_FAR _CaterpieDexEntry
	db "@"

MetapodDexEntry:
	db "COCOON@"
	db 2,4
	dw 220
	TX_FAR _MetapodDexEntry
	db "@"

ButterfreeDexEntry:
	db "BUTTERFLY@"
	db 3,7
	dw 710
	TX_FAR _ButterfreeDexEntry
	db "@"

MachampDexEntry:
	db "SUPERPOWER@"
	db 5,3
	dw 2870
	TX_FAR _MachampDexEntry
	db "@"

GolduckDexEntry:
	db "DUCK@"
	db 5,7
	dw 1690
	TX_FAR _GolduckDexEntry
	db "@"

HypnoDexEntry:
	db "HYPNOSIS@"
	db 5,3
	dw 1670
	TX_FAR _HypnoDexEntry
	db "@"

GolbatDexEntry:
	db "BAT@"
	db 5,3
	dw 1210
	TX_FAR _GolbatDexEntry
	db "@"

MewtwoDexEntry:
	db "GENETIC@"
	db 6,7
	dw 2690
	TX_FAR _MewtwoDexEntry
	db "@"

SnorlaxDexEntry:
	db "SLEEPING@"
	db 6,11
	dw 10140
	TX_FAR _SnorlaxDexEntry
	db "@"

MagikarpDexEntry:
	db "FISH@"
	db 2,11
	dw 220
	TX_FAR _MagikarpDexEntry
	db "@"

MukDexEntry:
	db "SLUDGE@"
	db 3,11
	dw 660
	TX_FAR _MukDexEntry
	db "@"

KinglerDexEntry:
	db "PINCER@"
	db 4,3
	dw 1320
	TX_FAR _KinglerDexEntry
	db "@"

CloysterDexEntry:
	db "BIVALVE@"
	db 4,11
	dw 2920
	TX_FAR _CloysterDexEntry
	db "@"

ElectrodeDexEntry:
	db "BALL@"
	db 3,11
	dw 1470
	TX_FAR _ElectrodeDexEntry
	db "@"

ClefableDexEntry:
	db "FAIRY@"
	db 4,3
	dw 880
	TX_FAR _ClefableDexEntry
	db "@"

WeezingDexEntry:
	db "POISON GAS@"
	db 3,11
	dw 210
	TX_FAR _WeezingDexEntry
	db "@"

PersianDexEntry:
	db "CLASSY CAT@"
	db 3,3
	dw 710
	TX_FAR _PersianDexEntry
	db "@"

MarowakDexEntry:
	db "BONEKEEPER@"
	db 3,3
	dw 990
	TX_FAR _MarowakDexEntry
	db "@"

HaunterDexEntry:
	db "GAS@"
	db 5,3
	dw 2
	TX_FAR _HaunterDexEntry
	db "@"

AbraDexEntry:
	db "PSI@"
	db 2,11
	dw 430
	TX_FAR _AbraDexEntry
	db "@"

AlakazamDexEntry:
	db "PSI@"
	db 4,11
	dw 1060
	TX_FAR _AlakazamDexEntry
	db "@"

PidgeottoDexEntry:
	db "BIRD@"
	db 3,7
	dw 660
	TX_FAR _PidgeottoDexEntry
	db "@"

PidgeotDexEntry:
	db "BIRD@"
	db 4,11
	dw 870
	TX_FAR _PidgeotDexEntry
	db "@"

StarmieDexEntry:
	db "MYSTERIOUS@"
	db 3,7
	dw 1760
	TX_FAR _StarmieDexEntry
	db "@"

BulbasaurDexEntry:
	db "SEED@"
	db 2,4
	dw 150
	TX_FAR _BulbasaurDexEntry
	db "@"

VenusaurDexEntry:
	db "SEED@"
	db 6,7
	dw 2210
	TX_FAR _VenusaurDexEntry
	db "@"

TentacruelDexEntry:
	db "JELLYFISH@"
	db 5,3
	dw 1210
	TX_FAR _TentacruelDexEntry
	db "@"

GoldeenDexEntry:
	db "GOLDFISH@"
	db 2,0
	dw 330
	TX_FAR _GoldeenDexEntry
	db "@"

SeakingDexEntry:
	db "GOLDFISH@"
	db 4,3
	dw 860
	TX_FAR _SeakingDexEntry
	db "@"

PonytaDexEntry:
	db "FIRE HORSE@"
	db 3,3
	dw 660
	TX_FAR _PonytaDexEntry
	db "@"

RapidashDexEntry:
	db "FIRE HORSE@"
	db 5,7
	dw 2090
	TX_FAR _RapidashDexEntry
	db "@"

RattataDexEntry:
	db "RAT@"
	db 1,0
	dw 80
	TX_FAR _RattataDexEntry
	db "@"

RaticateDexEntry:
	db "RAT@"
	db 2,4
	dw 410
	TX_FAR _RaticateDexEntry
	db "@"

NidorinoDexEntry:
	db "POISON PIN@"
	db 2,11
	dw 430
	TX_FAR _NidorinoDexEntry
	db "@"

NidorinaDexEntry:
	db "POISON PIN@"
	db 2,7
	dw 440
	TX_FAR _NidorinaDexEntry
	db "@"

GeodudeDexEntry:
	db "ROCK@"
	db 1,4
	dw 440
	TX_FAR _GeodudeDexEntry
	db "@"

PorygonDexEntry:
	db "VIRTUAL@"
	db 2,7
	dw 800
	TX_FAR _PorygonDexEntry
	db "@"

AerodactylDexEntry:
	db "FOSSIL@"
	db 5,11
	dw 1300
	TX_FAR _AerodactylDexEntry
	db "@"

MagnemiteDexEntry:
	db "MAGNET@"
	db 1,0
	dw 130
	TX_FAR _MagnemiteDexEntry
	db "@"

CharmanderDexEntry:
	db "LIZARD@"
	db 2,0
	dw 190
	TX_FAR _CharmanderDexEntry
	db "@"

SquirtleDexEntry:
	db "TINYTURTLE@"
	db 1,8
	dw 200
	TX_FAR _SquirtleDexEntry
	db "@"

CharmeleonDexEntry:
	db "FLAME@"
	db 3,7
	dw 420
	TX_FAR _CharmeleonDexEntry
	db "@"

WartortleDexEntry:
	db "TURTLE@"
	db 3,3
	dw 500
	TX_FAR _WartortleDexEntry
	db "@"

CharizardDexEntry:
	db "FLAME@"
	db 5,7
	dw 2000
	TX_FAR _CharizardDexEntry
	db "@"

OddishDexEntry:
	db "WEED@"
	db 1,8
	dw 120
	TX_FAR _OddishDexEntry
	db "@"

GloomDexEntry:
	db "WEED@"
	db 2,7
	dw 190
	TX_FAR _GloomDexEntry
	db "@"

VileplumeDexEntry:
	db "FLOWER@"
	db 3,11
	dw 410
	TX_FAR _VileplumeDexEntry
	db "@"

BellsproutDexEntry:
	db "FLOWER@"
	db 2,4
	dw 90
	TX_FAR _BellsproutDexEntry
	db "@"

WeepinbellDexEntry:
	db "FLYCATCHER@"
	db 3,3
	dw 140
	TX_FAR _WeepinbellDexEntry
	db "@"

VictreebelDexEntry:
	db "FLYCATCHER@"
	db 5,7
	dw 340
	TX_FAR _VictreebelDexEntry
	db "@"

MissingNoDexEntry:
	db "???@"
	db 10 ; 1.0 m
	db 100 ; 10.0 kg
	db 0,"コメント さくせいちゅう@" ; コメント作成中 (Comment to be written)

PokedexToIndex:
	; converts the Pokédex number at $D11E to an index
	push bc
	push hl
	ld a,[$D11E]
	ld b,a
	ld c,0
	ld hl,PokedexOrder

.loop\@ ; go through the list until we find an entry with a matching dex number
	inc c
	ld a,[hli]
	cp b
	jr nz,.loop\@

	ld a,c
	ld [$D11E],a
	pop hl
	pop bc
	ret

IndexToPokedex:
	; converts the indexédex number at $D11E to a Pokédex number
	push bc
	push hl
	ld a,[$D11E]
	dec a
	ld hl,PokedexOrder
	ld b,0
	ld c,a
	add hl,bc
	ld a,[hl]
	ld [$D11E],a
	pop hl
	pop bc
	ret

PokedexOrder: ; 5024
	db DEX_RHYDON
	db DEX_KANGASKHAN
	db DEX_NIDORAN_M
	db DEX_CLEFAIRY
	db DEX_SPEAROW
	db DEX_VOLTORB
	db DEX_NIDOKING
	db DEX_SLOWBRO
	db DEX_IVYSAUR
	db DEX_EXEGGUTOR
	db DEX_LICKITUNG
	db DEX_EXEGGCUTE
	db DEX_GRIMER
	db DEX_GENGAR
	db DEX_NIDORAN_F
	db DEX_NIDOQUEEN
	db DEX_CUBONE
	db DEX_RHYHORN
	db DEX_LAPRAS
	db DEX_ARCANINE
	db DEX_MEW
	db DEX_GYARADOS
	db DEX_SHELLDER
	db DEX_TENTACOOL
	db DEX_GASTLY
	db DEX_SCYTHER
	db DEX_STARYU
	db DEX_BLASTOISE
	db DEX_PINSIR
	db DEX_TANGELA
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_GROWLITHE
	db DEX_ONIX
	db DEX_FEAROW
	db DEX_PIDGEY
	db DEX_SLOWPOKE
	db DEX_KADABRA
	db DEX_GRAVELER
	db DEX_CHANSEY
	db DEX_MACHOKE
	db DEX_MR__MIME
	db DEX_HITMONLEE
	db DEX_HITMONCHAN
	db DEX_ARBOK
	db DEX_PARASECT
	db DEX_PSYDUCK
	db DEX_DROWZEE
	db DEX_GOLEM
	db 0 ; MISSINGNO.
	db DEX_MAGMAR
	db 0 ; MISSINGNO.
	db DEX_ELECTABUZZ
	db DEX_MAGNETON
	db DEX_KOFFING
	db 0 ; MISSINGNO.
	db DEX_MANKEY
	db DEX_SEEL
	db DEX_DIGLETT
	db DEX_TAUROS
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_FARFETCH_D
	db DEX_VENONAT
	db DEX_DRAGONITE
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_DODUO
	db DEX_POLIWAG
	db DEX_JYNX
	db DEX_MOLTRES
	db DEX_ARTICUNO
	db DEX_ZAPDOS
	db DEX_DITTO
	db DEX_MEOWTH
	db DEX_KRABBY
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_VULPIX
	db DEX_NINETALES
	db DEX_PIKACHU
	db DEX_RAICHU
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_DRATINI
	db DEX_DRAGONAIR
	db DEX_KABUTO
	db DEX_KABUTOPS
	db DEX_HORSEA
	db DEX_SEADRA
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_SANDSHREW
	db DEX_SANDSLASH
	db DEX_OMANYTE
	db DEX_OMASTAR
	db DEX_JIGGLYPUFF
	db DEX_WIGGLYTUFF
	db DEX_EEVEE
	db DEX_FLAREON
	db DEX_JOLTEON
	db DEX_VAPOREON
	db DEX_MACHOP
	db DEX_ZUBAT
	db DEX_EKANS
	db DEX_PARAS
	db DEX_POLIWHIRL
	db DEX_POLIWRATH
	db DEX_WEEDLE
	db DEX_KAKUNA
	db DEX_BEEDRILL
	db 0 ; MISSINGNO.
	db DEX_DODRIO
	db DEX_PRIMEAPE
	db DEX_DUGTRIO
	db DEX_VENOMOTH
	db DEX_DEWGONG
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_CATERPIE
	db DEX_METAPOD
	db DEX_BUTTERFREE
	db DEX_MACHAMP
	db 0 ; MISSINGNO.
	db DEX_GOLDUCK
	db DEX_HYPNO
	db DEX_GOLBAT
	db DEX_MEWTWO
	db DEX_SNORLAX
	db DEX_MAGIKARP
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_MUK
	db 0 ; MISSINGNO.
	db DEX_KINGLER
	db DEX_CLOYSTER
	db 0 ; MISSINGNO.
	db DEX_ELECTRODE
	db DEX_CLEFABLE
	db DEX_WEEZING
	db DEX_PERSIAN
	db DEX_MAROWAK
	db 0 ; MISSINGNO.
	db DEX_HAUNTER
	db DEX_ABRA
	db DEX_ALAKAZAM
	db DEX_PIDGEOTTO
	db DEX_PIDGEOT
	db DEX_STARMIE
	db DEX_BULBASAUR
	db DEX_VENUSAUR
	db DEX_TENTACRUEL
	db 0 ; MISSINGNO.
	db DEX_GOLDEEN
	db DEX_SEAKING
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_PONYTA
	db DEX_RAPIDASH
	db DEX_RATTATA
	db DEX_RATICATE
	db DEX_NIDORINO
	db DEX_NIDORINA
	db DEX_GEODUDE
	db DEX_PORYGON
	db DEX_AERODACTYL
	db 0 ; MISSINGNO.
	db DEX_MAGNEMITE
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_CHARMANDER
	db DEX_SQUIRTLE
	db DEX_CHARMELEON
	db DEX_WARTORTLE
	db DEX_CHARIZARD
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db 0 ; MISSINGNO.
	db DEX_ODDISH
	db DEX_GLOOM
	db DEX_VILEPLUME
	db DEX_BELLSPROUT
	db DEX_WEEPINBELL
	db DEX_VICTREEBEL
INCBIN "baserom.gbc",$410E2,$2769 - $10E2


; XXX what do these do
	FuncCoord 5,0
	ld hl,Coord
	ld de,OTString67E5
	call PlaceString
	ld a,[$CD3D]
	ld [$D11E],a
	ld a,$3A
	call Predef
	ld hl,$C3A9
	ld de,$D11E
	ld bc,$8103
	call $3C5F
	FuncCoord 5,2
	ld hl,Coord
	ld de,$CF4B
	call PlaceString
	FuncCoord 8,4
	ld hl,Coord
	ld de,$CD41
	call PlaceString
	ld hl,$C420
	ld de,$CD4C
	ld bc,$8205
	jp $3C5F

	FuncCoord 5,10
	ld hl,Coord
	ld de,OTString67E5
	call PlaceString
	ld a,[$CD3E]
	ld [$D11E],a
	ld a,$3A
	call Predef
	ld hl,$C471
	ld de,$D11E
	ld bc,$8103
	call $3C5F
	FuncCoord 5,12
	ld hl,Coord
	ld de,$CD6D
	call PlaceString
	FuncCoord 8,14
	ld hl,Coord
	ld de,$CD4E
	call PlaceString
	ld hl,$C4E8
	ld de,$CD59
	ld bc,$8205
	jp $3C5F

OTString67E5: ; 67E5
	db "──",$74,$F2,$4E
	db $4E
	db "OT/",$4E
	db $73,"№",$F2,"@"

SECTION "bank11",DATA,BANK[$11]

LavendarTown_h: ; 0x44000 to 0x4402d (45 bytes) (bank=11) (id=4)
    db $00 ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4085, $410e, $410b ; blocks, texts, scripts
    db NORTH | SOUTH | WEST ; connections

    ; connections data

    db $15 ; some map
    dw $44a0, $c6eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $47, $00 ; alignments (y, x)
    dw $c929 ; window

    db $17 ; some map
    dw $4710, $c7ab ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    db $13 ; some map
    dw $41e1, $c718 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $00, $3b ; alignments (y, x)
    dw $c72a ; window

    ; end connection data

    dw $402d ; objects

INCBIN "baserom.gbc",$4402D,$44251-$4402D

ViridianPokeCenter_h: ; 0x44251 to 0x4425d (12 bytes) (bank=11) (id=41)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $40df, $4263, $425d ; blocks, texts, scripts
    db $00 ; connections

    dw $4277 ; objects

INCBIN "baserom.gbc",$4425D,$442A3-$4425D

Mansion1_h: ; 0x442a3 to 0x442af (12 bytes) (bank=11) (id=165)
    db $16 ; tileset
    db $0e, $0f ; dimensions (y, x)
    dw $43fe, $432c, $42af ; blocks, texts, scripts
    db $00 ; connections

    dw $43a4 ; objects

INCBIN "baserom.gbc",$442AF,$444D0-$442AF

RockTunnel1_h: ; 0x444d0 to 0x444dc (12 bytes) (bank=11) (id=82)
    db $11 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $4675, $44f5, $44dc ; blocks, texts, scripts
    db $00 ; connections

    dw $45f6 ; objects

INCBIN "baserom.gbc",$444DC,$447DD-$444DC

SeafoamIslands1_h: ; 0x447dd to 0x447e9 (12 bytes) (bank=11) (id=192)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $489f, $484b, $47e9 ; blocks, texts, scripts
    db $00 ; connections

    dw $484f ; objects

INCBIN "baserom.gbc",$447E9,$44926-$447E9

SSAnne3_h: ; 0x44926 to 0x44932 (12 bytes) (bank=11) (id=97)
    db $0d ; tileset
    db $03, $0a ; dimensions (y, x)
    dw $4956, $4935, $4932 ; blocks, texts, scripts
    db $00 ; connections

    dw $493c ; objects

INCBIN "baserom.gbc",$44932,$44974-$44932

VictoryRoad3_h: ; 0x44974 to 0x44980 (12 bytes) (bank=11) (id=198)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $4b37, $4a24, $4980 ; blocks, texts, scripts
    db $00 ; connections

    dw $4acd ; objects

INCBIN "baserom.gbc",$44980,$44BBE-$44980

RocketHideout1_h: ; 0x44bbe to 0x44bca (12 bytes) (bank=11) (id=199)
    db $16 ; tileset
    db $0e, $0f ; dimensions (y, x)
    dw $4d49, $4c14, $4bca ; blocks, texts, scripts
    db $00 ; connections

    dw $4ce7 ; objects

INCBIN "baserom.gbc",$44BCA,$44E1B-$44BCA

RocketHideout2_h: ; 0x44e1b to 0x44e27 (12 bytes) (bank=11) (id=200)
    db $16 ; tileset
    db $0e, $0f ; dimensions (y, x)
    dw $5147, $50c7, $4e27 ; blocks, texts, scripts
    db $00 ; connections

    dw $50f7 ; objects

INCBIN "baserom.gbc",$44E27,$45219-$44E27

RocketHideout3_h: ; 0x45219 to 0x45225 (12 bytes) (bank=11) (id=201)
    db $16 ; tileset
    db $0e, $0f ; dimensions (y, x)
    dw $537f, $52fa, $5225 ; blocks, texts, scripts
    db $00 ; connections

    dw $534d ; objects

INCBIN "baserom.gbc",$45225,$45451-$45225

RocketHideout4_h: ; 0x45451 to 0x4545d (12 bytes) (bank=11) (id=202)
    db $16 ; tileset
    db $0c, $0f ; dimensions (y, x)
    dw $5650, $5501, $545d ; blocks, texts, scripts
    db $00 ; connections

    dw $55f1 ; objects

INCBIN "baserom.gbc",$4545D,$45704-$4545D

RocketHideoutElevator_h: ; 0x45704 to 0x45710 (12 bytes) (bank=11) (id=203)
    db $12 ; tileset
    db $04, $03 ; dimensions (y, x)
    dw $57a8, $576b, $5710 ; blocks, texts, scripts
    db $00 ; connections

    dw $5791 ; objects

INCBIN "baserom.gbc",$45710,$457B4-$45710

SilphCoElevator_h: ; 0x457b4 to 0x457c0 (12 bytes) (bank=11) (id=236)
    db $12 ; tileset
    db $02, $02 ; dimensions (y, x)
    dw $585b, $5833, $57c0 ; blocks, texts, scripts
    db $00 ; connections

    dw $5844 ; objects

INCBIN "baserom.gbc",$457C0,$4585F-$457C0

SafariZoneEast_h: ; 0x4585f to 0x4586b (12 bytes) (bank=11) (id=217)
    db $03 ; tileset
    db $0d, $0f ; dimensions (y, x)
    dw $58dc, $586e, $586b ; blocks, texts, scripts
    db $00 ; connections

    dw $588b ; objects

INCBIN "baserom.gbc",$4586B,$4599F-$4586B

SafariZoneNorth_h: ; 0x4599f to 0x459ab (12 bytes) (bank=11) (id=218)
    db $03 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $5a3e, $59ae, $59ab ; blocks, texts, scripts
    db $00 ; connections

    dw $59d5 ; objects

INCBIN "baserom.gbc",$459AB,$45BA6-$459AB

SafariZoneCenter_h: ; 0x45ba6 to 0x45bb2 (12 bytes) (bank=11) (id=220)
    db $03 ; tileset
    db $0d, $0f ; dimensions (y, x)
    dw $5c1e, $5bb5, $5bb2 ; blocks, texts, scripts
    db $00 ; connections

    dw $5bc5 ; objects

INCBIN "baserom.gbc",$45BB2,$45CE1-$45BB2

SafariZoneRestHouse1_h: ; 0x45ce1 to 0x45ced (12 bytes) (bank=11) (id=221)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40fb, $5cf0, $5ced ; blocks, texts, scripts
    db $00 ; connections

    dw $5cfe ; objects

INCBIN "baserom.gbc",$45CED,$45D1E-$45CED

SafariZoneRestHouse2_h: ; 0x45d1e to 0x45d2a (12 bytes) (bank=11) (id=223)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40fb, $5d2e, $5d2a ; blocks, texts, scripts
    db $00 ; connections

    dw $5d43 ; objects

INCBIN "baserom.gbc",$45D2A,$45D69-$45D2A

SafariZoneRestHouse3_h: ; 0x45d69 to 0x45d75 (12 bytes) (bank=11) (id=224)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40fb, $5d79, $5d75 ; blocks, texts, scripts
    db $00 ; connections

    dw $5d8e ; objects

INCBIN "baserom.gbc",$45D75,$45DB4-$45D75

SafariZoneRestHouse4_h: ; 0x45db4 to 0x45dc0 (12 bytes) (bank=11) (id=225)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40fb, $5dc4, $5dc0 ; blocks, texts, scripts
    db $00 ; connections

    dw $5dd9 ; objects

INCBIN "baserom.gbc",$45DC0,$45DFF-$45DC0

UnknownDungeon2_h: ; 0x45dff to 0x45e0b (12 bytes) (bank=11) (id=226)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $5e5d, $5e0e, $5e0b ; blocks, texts, scripts
    db $00 ; connections

    dw $5e14 ; objects

INCBIN "baserom.gbc",$45E0B,$45EE4-$45E0B

UnknownDungeon3_h: ; 0x45ee4 to 0x45ef0 (12 bytes) (bank=11) (id=227)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $5f58, $5f09, $5ef0 ; blocks, texts, scripts
    db $00 ; connections

    dw $5f36 ; objects

INCBIN "baserom.gbc",$45EF0,$45FDF-$45EF0

RockTunnel2_h: ; 0x45fdf to 0x45feb (12 bytes) (bank=11) (id=232)
    db $11 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $61a1, $6004, $5feb ; blocks, texts, scripts
    db $00 ; connections

    dw $613d ; objects

INCBIN "baserom.gbc",$45FEB,$46309-$45FEB

SeafoamIslands2_h: ; 0x46309 to 0x46315 (12 bytes) (bank=11) (id=159)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $63be, $6372, $6315 ; blocks, texts, scripts
    db $00 ; connections

    dw $6376 ; objects

INCBIN "baserom.gbc",$46315,$46445-$46315

SeafoamIslands3_h: ; 0x46445 to 0x46451 (12 bytes) (bank=11) (id=160)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $64fa, $64ae, $6451 ; blocks, texts, scripts
    db $00 ; connections

    dw $64b2 ; objects

INCBIN "baserom.gbc",$46451,$46581-$46451

SeafoamIslands4_h: ; 0x46581 to 0x4658d (12 bytes) (bank=11) (id=161)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $6706, $669a, $658d ; blocks, texts, scripts
    db $00 ; connections

    dw $66a6 ; objects

INCBIN "baserom.gbc",$4658D,$4678D-$4658D

SeafoamIslands5_h: ; 0x4678d to 0x46799 (12 bytes) (bank=11) (id=162)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $68fa, $687c, $6799 ; blocks, texts, scripts
    db $00 ; connections

    dw $68bc ; objects

INCBIN "baserom.gbc",$46799,$48000-$46799

SECTION "bank12",DATA,BANK[$12]

Route7_h: ; 0x48000 to 0x48022 (34 bytes) (bank=12) (id=18)
    db $00 ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4051, $4155, $4152 ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connections data

    db $06 ; some map
    dw $410e, $c6e8 ; pointers (connected, current) (strip)
    db $0f, $19 ; bigness, width
    db $08, $31 ; alignments (y, x)
    dw $c720 ; window

    db $0a ; some map
    dw $4aac, $c6f5 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $00 ; alignments (y, x)
    dw $c703 ; window

    ; end connection data

    dw $4022 ; objects

INCBIN "baserom.gbc",$48022,$4815C-$48022

RedsHouse1F_h: ; 415C
	db $01 ; tileset
	db $04,$04 ; dimensions
	dw RedsHouse1FBlocks,RedsHouse1FTexts,RedsHouse1FScript
	db 0 ; no connections
	dw RedsHouse1FObject

RedsHouse1FScript: ; 4168
	jp $3C3C

RedsHouse1FTexts: ; 416B
	dw RedsHouse1FText1,RedsHouse1FText2

RedsHouse1FText1: ; Mom
	db 8
	ld a,[$D72E]
	bit 3,a
	jr nz,.heal\@ ; if player has received a Pokémon from Oak, heal team
	ld hl,MomWakeUpText
	call PrintText
	jr .done\@
.heal\@
	call MomHealPokemon
.done\@
	jp $24D7

MomWakeUpText:
	TX_FAR _MomWakeUpText
	db "@"

MomHealPokemon:
	ld hl,MomHealText1
	call PrintText
	call GBFadeOut2
	call $3071
	ld a,7
	call Predef
	ld a,$E8
	ld [$C0EE],a
	call $23B1 ; play sound?
.next\@
	ld a,[$C026]
	cp $E8
	jr z,.next\@
	ld a,[$D35B]
	ld [$C0EE],a
	call $23B1
	call GBFadeIn2
	ld hl,MomHealText2
	jp PrintText

MomHealText1:
	TX_FAR _MomHealText1
	db "@"
MomHealText2:
	TX_FAR _MomHealText2
	db "@"

RedsHouse1FText2: ; TV
	db 8
	ld a,[$C109]
	cp 4
	ld hl,TVWrongSideText
	jr nz,.done\@ ; if player is not facing up
	ld hl,StandByMeText
.done\@
	call PrintText
	jp $24D7

StandByMeText:
	TX_FAR _StandByMeText
	db "@"

TVWrongSideText:
	TX_FAR _TVWrongSideText
	db "@"

RedsHouse1FObject:
	db $0A ; border tile

	db 3 ; warps
	db 7,2,0,$FF ; exit1
	db 7,3,0,$FF ; exit2
	db 1,7,0,$26 ; staircase

	db 1 ; signs
	db 1,3,2 ; TV

	db 1 ; people
	db $33,4+4,5+4,$FF,$D2,1 ; Mom

	; warp-to

	dw $C6EF + 4 + (4 + 6) * (3) + 1
	db 7,2

	dw $C6EF + 4 + (4 + 6) * (3) + 1
	db 7,3

	dw $C6EF + 4 + (4 + 6) * (0) + 3
	db 1,7

RedsHouse1FBlocks:
	INCBIN "maps/redshouse1f.blk"

CeladonMart3_h: ; 0x48219 to 0x48225 (12 bytes) (bank=12) (id=124)
    db $12 ; tileset
    db $04, $0a ; dimensions (y, x)
    dw $4322, $4228, $4225 ; blocks, texts, scripts
    db $00 ; connections

    dw $42c4 ; objects

INCBIN "baserom.gbc",$48225,$4834A-$48225

CeladonMart4_h: ; 0x4834a to 0x48356 (12 bytes) (bank=12) (id=125)
    db $12 ; tileset
    db $04, $0a ; dimensions (y, x)
    dw $43a1, $4359, $4356 ; blocks, texts, scripts
    db $00 ; connections

    dw $4370 ; objects

INCBIN "baserom.gbc",$48356,$483C9-$48356

CeladonMart5_h: ; 0x483c9 to 0x483d5 (12 bytes) (bank=12) (id=126)
    db $12 ; tileset
    db $04, $0a ; dimensions (y, x)
    dw $45cc, $455b, $43d5 ; blocks, texts, scripts
    db $00 ; connections

    dw $45a8 ; objects

INCBIN "baserom.gbc",$483D5,$485F4-$483D5

CeladonMart6_h: ; 0x485f4 to 0x48600 (12 bytes) (bank=12) (id=127)
    db $12 ; tileset
    db $02, $02 ; dimensions (y, x)
    dw $4684, $465c, $4600 ; blocks, texts, scripts
    db $00 ; connections

    dw $466d ; objects

INCBIN "baserom.gbc",$48600,$48688-$48600

CeladonMansion1_h: ; 0x48688 to 0x48694 (12 bytes) (bank=12) (id=128)
    db $13 ; tileset
    db $06, $04 ; dimensions (y, x)
    dw $4716, $4697, $4694 ; blocks, texts, scripts
    db $00 ; connections

    dw $46cf ; objects

INCBIN "baserom.gbc",$48694,$4872E-$48694

CeladonMansion2_h: ; 0x4872e to 0x4873a (12 bytes) (bank=12) (id=129)
    db $13 ; tileset
    db $06, $04 ; dimensions (y, x)
    dw $476c, $473e, $473a ; blocks, texts, scripts
    db $00 ; connections

    dw $4745 ; objects

INCBIN "baserom.gbc",$4873A,$48784-$4873A

CeladonMansion3_h: ; 0x48784 to 0x48790 (12 bytes) (bank=12) (id=130)
    db $13 ; tileset
    db $06, $04 ; dimensions (y, x)
    dw $4847, $4793, $4790 ; blocks, texts, scripts
    db $00 ; connections

    dw $47ff ; objects

INCBIN "baserom.gbc",$48790,$4885F-$48790

CeladonMansion4_h: ; 0x4885f to 0x4886b (12 bytes) (bank=12) (id=131)
    db $13 ; tileset
    db $06, $04 ; dimensions (y, x)
    dw $4894, $486e, $486b ; blocks, texts, scripts
    db $00 ; connections

    dw $4875 ; objects

INCBIN "baserom.gbc",$4886B,$488AC-$4886B

CeladonPokecenter_h: ; 0x488ac to 0x488b8 (12 bytes) (bank=12) (id=133)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $40ab, $48be, $48b8 ; blocks, texts, scripts
    db $00 ; connections

    dw $48d2 ; objects

INCBIN "baserom.gbc",$488B8,$488FE-$488B8

CeladonGYM_h: ; 0x488fe to 0x4890a (12 bytes) (bank=12) (id=134)
    db $07 ; tileset
    db $09, $05 ; dimensions (y, x)
    dw $4b84, $49a6, $490a ; blocks, texts, scripts
    db $00 ; connections

    dw $4b30 ; objects

INCBIN "baserom.gbc",$4890A,$48BB1-$4890A

CeladonGameCorner_h: ; 0x48bb1 to 0x48bbd (12 bytes) (bank=12) (id=135)
    db $12 ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $5003, $4c8a, $4bbd ; blocks, texts, scripts
    db $00 ; connections

    dw $4fa0 ; objects

INCBIN "baserom.gbc",$48BBD,$4905D-$48BBD

CeladonHouse_h: ; 0x4905d to 0x49069 (12 bytes) (bank=12) (id=136)
    db $12 ; tileset
    db $04, $0a ; dimensions (y, x)
    dw $50bc, $506c, $5069 ; blocks, texts, scripts
    db $00 ; connections

    dw $5085 ; objects

INCBIN "baserom.gbc",$49069,$490E4-$49069

CeladonPrizeRoom_h: ; 0x490e4 to 0x490f0 (12 bytes) (bank=12) (id=137)
    db $12 ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $5131, $50f3, $50f0 ; blocks, texts, scripts
    db $00 ; connections

    dw $5108 ; objects

INCBIN "baserom.gbc",$490F0,$49145-$490F0

CeladonDiner_h: ; 0x49145 to 0x49151 (12 bytes) (bank=12) (id=138)
    db $12 ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $51ee, $5155, $5151 ; blocks, texts, scripts
    db $00 ; connections

    dw $51bc ; objects

INCBIN "baserom.gbc",$49151,$49202-$49151

CeladonHouse2_h: ; 0x49202 to 0x4920e (12 bytes) (bank=12) (id=139)
    db $13 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $524d, $5212, $520e ; blocks, texts, scripts
    db $00 ; connections

    dw $5227 ; objects

INCBIN "baserom.gbc",$4920E,$4925D-$4920E

CeladonHotel_h: ; 0x4925d to 0x49269 (12 bytes) (bank=12) (id=140)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $52a7, $526c, $5269 ; blocks, texts, scripts
    db $00 ; connections

    dw $5281 ; objects

INCBIN "baserom.gbc",$49269,$492C3-$49269

MtMoonPokecenter_h: ; 0x492c3 to 0x492cf (12 bytes) (bank=12) (id=68)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $40ab, $52d5, $52cf ; blocks, texts, scripts
    db $00 ; connections

    dw $5376 ; objects

INCBIN "baserom.gbc",$492cf,$493ae - $492cf

RockTunnelPokecenter_h: ; 0x493ae to 0x493ba (12 bytes) (id=81)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $40ab, $53c0, $53ba ; blocks, texts, scripts
    db $00 ; connections

    dw $53d4 ; objects

INCBIN "baserom.gbc",$493ba,$49400 - $493ba

Route11Gate_h: ; 0x49400 to 0x4940c (12 bytes) (id=84)
    db $0c ; tileset
    db $05, $04 ; dimensions (y, x)
    dw $40c7, $540f, $540c ; blocks, texts, scripts
    db $00 ; connections

    dw $5416 ; objects

INCBIN "baserom.gbc",$4940c,$49448 - $4940c

Route11GateUpstairs_h: ; 0x49448 to 0x49454 (12 bytes) (id=86)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40db, $5457, $5454 ; blocks, texts, scripts
    db $00 ; connections

    dw $54da ; objects

INCBIN "baserom.gbc",$49454,$494f8 - $49454

Route12Gate_h: ; 0x494f8 to 0x49504 (12 bytes) (id=87)
    db $0c ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $5540, $5507, $5504 ; blocks, texts, scripts
    db $00 ; connections

    dw $550e ; objects

INCBIN "baserom.gbc",$49504,$49554 - $49504

Route12GateUpstairs_h: ; 0x49554 to 0x49560 (12 bytes) (id=195)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40db, $5563, $5560 ; blocks, texts, scripts
    db $00 ; connections

    dw $55de ; objects

INCBIN "baserom.gbc",$49560,$495f6 - $49560

Route15Gate_h: ; 0x495f6 to 0x49602 (12 bytes) (id=184)
    db $0c ; tileset
    db $05, $04 ; dimensions (y, x)
    dw $40c7, $5605, $5602 ; blocks, texts, scripts
    db $00 ; connections

    dw $560c ; objects

INCBIN "baserom.gbc",$49602,$496b2 - $49602

Route16GateMap_h: ; 0x496b2 to 0x496be (12 bytes) (id=186)
    db $0c ; tileset
    db $07, $04 ; dimensions (y, x)
    dw $57e3, $575a, $56be ; blocks, texts, scripts
    db $00 ; connections

    dw $578b ; objects

INCBIN "baserom.gbc",$496be,$497ff - $496be

Route16GateUpstairs_h: ; 0x497ff to 0x4980b (12 bytes) (id=187)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40db, $580e, $580b ; blocks, texts, scripts
    db $00 ; connections

    dw $584c ; objects

INCBIN "baserom.gbc",$4980b,$4986a - $4980b

Route18Gate_h: ; 0x4986a to 0x49876 (12 bytes) (id=190)
    db $0c ; tileset
    db $05, $04 ; dimensions (y, x)
    dw $40c7, $590d, $5876 ; blocks, texts, scripts
    db $00 ; connections

    dw $5937 ; objects

INCBIN "baserom.gbc",$49876,$49969 - $49876

Route18GateHeader_h: ; 0x49969 to 0x49975 (12 bytes) (id=191)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $40db, $5978, $5975 ; blocks, texts, scripts
    db $00 ; connections

    dw $59a4 ; objects

INCBIN "baserom.gbc",$49975,$499bc - $49975

MtMoon1_h: ; 0x499bc to 0x499c8 (12 bytes) (id=59)
    db $11 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $5b97, $59e1, $59c8 ; blocks, texts, scripts
    db $00 ; connections

    dw $5b06 ; objects

INCBIN "baserom.gbc",$499c8,$49cff - $499c8

MtMoon3_h: ; 0x49cff to 0x49d0b (12 bytes) (id=61)
    db $11 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $6041, $5e34, $5d0b ; blocks, texts, scripts
    db $00 ; connections

    dw $5fdb ; objects

INCBIN "baserom.gbc",$49d0b,$4a1a9 - $49d0b

SafariZoneWest_h: ; 0x4a1a9 to 0x4a1b5 (12 bytes) (id=219)
    db $03 ; tileset
    db $0d, $0f ; dimensions (y, x)
    dw $6248, $61b8, $61b5 ; blocks, texts, scripts
    db $00 ; connections

    dw $61dc ; objects

INCBIN "baserom.gbc",$4a1b5,$4a30b - $4a1b5

SafariZoneSecretHouse_h: ; 0x4a30b to 0x4a317 (12 bytes) (id=222)
    db $14 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $637f, $631a, $6317 ; blocks, texts, scripts
    db $00 ; connections

    dw $6365 ; objects

INCBIN "baserom.gbc",$4a317,$1ce9

SECTION "bank13",DATA,BANK[$13]

YoungsterPic:
	INCBIN "pic/trainer/youngster.pic"
BugCatcherPic:
	INCBIN "pic/trainer/bugcatcher.pic"
LassPic:
	INCBIN "pic/trainer/lass.pic"
SailorPic:
	INCBIN "pic/trainer/sailor.pic"
JrTrainerMPic:
	INCBIN "pic/trainer/jr.trainerm.pic"
JrTrainerFPic:
	INCBIN "pic/trainer/jr.trainerf.pic"
PokemaniacPic:
	INCBIN "pic/trainer/pokemaniac.pic"
SuperNerdPic:
	INCBIN "pic/trainer/supernerd.pic"
HikerPic:
	INCBIN "pic/trainer/hiker.pic"
BikerPic:
	INCBIN "pic/trainer/biker.pic"
BurglarPic:
	INCBIN "pic/trainer/burglar.pic"
EngineerPic:
	INCBIN "pic/trainer/engineer.pic"
FisherPic:
	INCBIN "pic/trainer/fisher.pic"
SwimmerPic:
	INCBIN "pic/trainer/swimmer.pic"
CueBallPic:
	INCBIN "pic/trainer/cueball.pic"
GamblerPic:
	INCBIN "pic/trainer/gambler.pic"
BeautyPic:
	INCBIN "pic/trainer/beauty.pic"
PsychicPic:
	INCBIN "pic/trainer/psychic.pic"
RockerPic:
	INCBIN "pic/trainer/rocker.pic"
JugglerPic:
	INCBIN "pic/trainer/juggler.pic"
TamerPic:
	INCBIN "pic/trainer/tamer.pic"
BirdKeeperPic:
	INCBIN "pic/trainer/birdkeeper.pic"
BlackbeltPic:
	INCBIN "pic/trainer/blackbelt.pic"
Rival1Pic:
	INCBIN "pic/trainer/rival1.pic"
ProfOakPic:
	INCBIN "pic/trainer/prof.oak.pic"
ChiefPic:
ScientistPic:
	INCBIN "pic/trainer/scientist.pic"
GiovanniPic:
	INCBIN "pic/trainer/giovanni.pic"
RocketPic:
	INCBIN "pic/trainer/rocket.pic"
CooltrainerMPic:
	INCBIN "pic/trainer/cooltrainerm.pic"
CooltrainerFPic:
	INCBIN "pic/trainer/cooltrainerf.pic"
BrunoPic:
	INCBIN "pic/trainer/bruno.pic"
BrockPic:
	INCBIN "pic/trainer/brock.pic"
MistyPic:
	INCBIN "pic/trainer/misty.pic"
LtSurgePic:
	INCBIN "pic/trainer/lt.surge.pic"
ErikaPic:
	INCBIN "pic/trainer/erika.pic"
KogaPic:
	INCBIN "pic/trainer/koga.pic"
BlainePic:
	INCBIN "pic/trainer/blaine.pic"
SabrinaPic:
	INCBIN "pic/trainer/sabrina.pic"
GentlemanPic:
	INCBIN "pic/trainer/gentleman.pic"
Rival2Pic:
	INCBIN "pic/trainer/rival2.pic"
Rival3Pic:
	INCBIN "pic/trainer/rival3.pic"
LoreleiPic:
	INCBIN "pic/trainer/lorelei.pic"
ChannelerPic:
	INCBIN "pic/trainer/channeler.pic"
AgathaPic:
	INCBIN "pic/trainer/agatha.pic"
LancePic:
	INCBIN "pic/trainer/lance.pic"

BattleCenterM_h: ; 0x4fd04 to 0x4fd10 (12 bytes) (id=239)
    db $15 ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $7d5d, $7d4c, $7d10 ; blocks, texts, scripts
    db $00 ; connections

    dw $7d53 ; objects

INCBIN "baserom.gbc",$4fd10,$4fd71 - $4fd10

TradeCenterM_h: ; 0x4fd71 to 0x4fd7d (12 bytes) (id=240)
    db $15 ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $7d91, $7d80, $7d7d ; blocks, texts, scripts
    db $00 ; connections

    dw $7d87 ; objects

INCBIN "baserom.gbc",$4fd7d,$cc

GetPredefPointer: ; 7E49
; stores hl in $CC4F,$CC50
; stores de in $CC51,$CC52
; stores bc in $CC53,$CC54
; grabs a byte "n" from $CC4E,
;    and gets the nth (3-byte) pointer in PredefPointers
; stores the bank of said pointer in [$D0B7]
; stores the pointer in hl and returns
        ; ld $CC4F,hl
        ld a,h
        ld [$CC4F],a
        ld a,l
        ld [$CC50],a

        ; ld $CC51,de
        ld hl,$CC51
        ld a,d
        ld [hli],a
        ld a,e
        ld [hli],a

        ; ld $CC53,bc
        ld a,b
        ld [hli],a
        ld [hl],c

        ld hl,PredefPointers
        ld de,0

        ; de = 3 * [$CC4E]
        ld a,[$CC4E]
        ld e,a
        add a,a
        add a,e
        ld e,a
        jr nc,.next\@
        inc d

.next\@
        add hl,de
        ld d,h
        ld e,l

	; get bank of predef routine
        ld a,[de]
        ld [$D0B7],a

	; get pointer
        inc de
        ld a,[de]
        ld l,a
        inc de
        ld a,[de]
        ld h,a

        ret

PredefPointers: ; 7E79
; these are pointers to ASM routines.
; they appear to be used in overworld map scripts.
        dbw $0F,$4D60
        dbw $0F,$70C6
        dbw $0F,$7073
        dbw $0B,$7E40
        dbw $0F,$7103
        dbw $1E,$5ABA
        dbw $03,$7132
        dbw $03,$76A5
        dbw BANK(AttackAnimation),AttackAnimation; 08 play attack animation
        dbw $03,$771E
        dbw $03,$771E
        dbw $03,$781D
        dbw $03,$7836
        dbw $03,$771E
        dbw $03,$771E
        dbw $03,$7850
        dbw $03,$7666
        dbw $03,$71D7
        dbw $03,$71A6
        dbw $03,$469C
        dbw $0F,$4A83
        dbw $03,$71C8
        dbw $03,$71C8
        dbw $03,$6E9E
        dbw $03,$7850
        dbw $03,$4754
        dbw $0E,$6F5B
        dbw $01,$6E43
        dbw $03,$78A5; 1C, used in Pokémon Tower
        dbw $03,$3EB5
        dbw $03,$3E2E
        dbw $12,$40EB
        dbw $03,$78BA
        dbw $12,$40FF
        dbw $03,$7929
        dbw $03,$79A0
        dbw $12,$4125
        dbw $03,$7A1D
        dbw $03,$79DC
        dbw $01,$5AB0
        dbw $0F,$6D02
        dbw $10,$4000
        dbw $0E,$6D1C
        dbw $1C,$778C
        dbw $0F,$6F18
        dbw $01,$5A5F
        dbw $03,$6A03
        dbw $10,$50F3
        dbw $1C,$496D
        dbw $1E,$5DDA
        dbw $10,$5682
        dbw $1E,$5869
        dbw $1C,$4B5D
        dbw $03,$4586
        dbw $04,$6953
        dbw $04,$6B57
        dbw $10,$50E2
        dbw $15,$690F
        dbw $10,$5010
        dbw BANK(Predef3B),Predef3B; 3B display pic?
        dbw $03,$6F54
        dbw $10,$42D1
        dbw $0E,$6FB8
        dbw $1C,$770A
        dbw $1C,$602B
        dbw $03,$7113
	dbw $17,$5B5E
        dbw $04,$773E
        dbw $04,$7763
        dbw $1C,$5DDF
        dbw $17,$40DC; 46 load dex screen
        dbw $03,$72E5
        dbw $03,$7A1D
        dbw $0F,$4DEC
        dbw $1C,$4F60
        dbw $09,$7D6B
        dbw $05,$7C47; 4C player exclamation
        dbw $01,$5AAF
        dbw $01,$64EB
        dbw $0D,$7CA1
        dbw $1C,$780F
        dbw $1C,$76BD
        dbw $1C,$75E8
        dbw $1C,$77E2
        dbw $1C,$5AD9
        dbw $1D,$405C
        dbw $11,$4169
        dbw $1E,$45BA
        dbw $1E,$4510
        dbw $03,$45BE
        dbw $03,$460B
        dbw $03,$4D99
        dbw $01,$4DE1
        dbw $09,$7D98
        dbw $03,$7473
        dbw $04,$68EF
        dbw $04,$68F6
        dbw $07,$49C6
        dbw $16,$5035

SECTION "bank14",DATA,BANK[$14]
Route22_h: ; 0x50000 to 0x50022 (34 bytes) (id=33)
    db $00 ; tileset
    db $09, $14 ; dimensions (y, x)
    dw $403d, $5175, $4eb2 ; blocks, texts, scripts
    db NORTH | EAST ; connections

    ; connections data

    db $22 ; some map
    dw $4664, $c6eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $8f, $00 ; alignments (y, x)
    dw $cb69 ; window

    db $01 ; some map
    dw $4400, $c6ff ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $00 ; alignments (y, x)
    dw $c703 ; window

    ; end connection data

    dw $4022 ; objects

INCBIN "baserom.gbc",$50022,$500f1 - $50022

Route20_h: ; 0x500f1 to 0x50113 (34 bytes) (id=31)
    db $00 ; tileset
    db $09, $32 ; dimensions (y, x)
    dw $417d, $4d22, $4ca9 ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connections data

    db $08 ; some map
    dw $4070, $c790 ; pointers (connected, current) (strip)
    db $09, $0a ; bigness, width
    db $00, $13 ; alignments (y, x)
    dw $c702 ; window

    db $1e ; some map
    dw $4f87, $c71d ; pointers (connected, current) (strip)
    db $0c, $0a ; bigness, width
    db $24, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $4113 ; objects

INCBIN "baserom.gbc",$50113,$5033f - $50113

Route23_h: ; 0x5033f to 0x50361 (34 bytes) (id=34)
    db $17 ; tileset
    db $48, $0a ; dimensions (y, x)
    dw $43b2, $52f7, $51da ; blocks, texts, scripts
    db NORTH | SOUTH ; connections

    ; connections data

    db $09 ; some map
    dw $4986, $c6eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $11, $00 ; alignments (y, x)
    dw $c779 ; window

    db $21 ; some map
    dw $403d, $cb9b ; pointers (connected, current) (strip)
    db $0d, $14 ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c703 ; window

    ; end connection data

    dw $4361 ; objects

INCBIN "baserom.gbc",$50361,$50682 - $50361

Route24_h: ; 0x50682 to 0x506a4 (34 bytes) (id=35)
    db $00 ; tileset
    db $12, $0a ; dimensions (y, x)
    dw $46e7, $544b, $53ad ; blocks, texts, scripts
    db SOUTH | EAST ; connections

    ; connections data

    db $03 ; some map
    dw $4832, $c838 ; pointers (connected, current) (strip)
    db $10, $14 ; bigness, width
    db $00, $0a ; alignments (y, x)
    dw $c703 ; window

    db $24 ; some map
    dw $4810, $c725 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c70d ; window

    ; end connection data

    dw $46a4 ; objects

INCBIN "baserom.gbc",$506a4,$5079b - $506a4

Route25_h: ; 0x5079b to 0x507b2 (23 bytes) (id=36)
    db $00 ; tileset
    db $09, $1e ; dimensions (y, x)
    dw $4810, $5628, $55cb ; blocks, texts, scripts
    db WEST ; connections

    ; connections data

    db $23 ; some map
    dw $46ee, $c754 ; pointers (connected, current) (strip)
    db $0c, $0a ; bigness, width
    db $00, $13 ; alignments (y, x)
    dw $c702 ; window

    ; end connection data

    dw $47b2 ; objects

INCBIN "baserom.gbc",$507b2,$5091e - $507b2

IndigoPlateau_h: ; 0x5091e to 0x50935 (23 bytes) (id=9)
    db $17 ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $494a, $4936, $4935 ; blocks, texts, scripts
    db SOUTH ; connections

    ; connections data

    db $22 ; some map
    dw $43b2, $c7ab ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $4936 ; objects

INCBIN "baserom.gbc",$50935,$509a4 - $50935

SaffronCity_h: ; 0x509a4 to 0x509dc (56 bytes) (id=10)
    db $00 ; tileset
    db $12, $14 ; dimensions (y, x)
    dw $4a98, $4c03, $4c00 ; blocks, texts, scripts
    db NORTH | SOUTH | WEST | EAST ; connections

    ; connections data

    db $10 ; some map
    dw $4668, $c6f0 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $23, $f6 ; alignments (y, x)
    dw $c809 ; window

    db $11 ; some map
    dw $4079, $c912 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $f6 ; alignments (y, x)
    dw $c6f9 ; window

    db $12 ; some map
    dw $4058, $c79e ; pointers (connected, current) (strip)
    db $09, $0a ; bigness, width
    db $f8, $13 ; alignments (y, x)
    dw $c702 ; window

    db $13 ; some map
    dw $41c6, $c7b5 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $f8, $00 ; alignments (y, x)
    dw $c70d ; window

    ; end connection data

    dw $49dc ; objects

INCBIN "baserom.gbc",$509dc,$51791 - $509dc

VictoryRoad2_h: ; 0x51791 to 0x5179d (12 bytes) (id=194)
    db $11 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $59af, $581b, $579d ; blocks, texts, scripts
    db $00 ; connections

    dw $5915 ; objects

INCBIN "baserom.gbc",$5179d,$51a36 - $5179d

MtMoon2_h: ; 0x51a36 to 0x51a42 (12 bytes) (id=60)
    db $11 ; tileset
    db $0e, $0e ; dimensions (y, x)
    dw $5a91, $5a46, $5a42 ; blocks, texts, scripts
    db $00 ; connections

    dw $5a4d ; objects

INCBIN "baserom.gbc",$51a42,$51b55 - $51a42

SilphCo7_h: ; 0x51b55 to 0x51b61 (12 bytes) (id=212)
    db $16 ; tileset
    db $09, $0d ; dimensions (y, x)
    dw $5f57, $5d3f, $5b61 ; blocks, texts, scripts
    db $00 ; connections

    dw $5ed7 ; objects

INCBIN "baserom.gbc",$51b61,$51fcc - $51b61

Mansion2_h: ; 0x51fcc to 0x51fd8 (12 bytes) (id=214)
    db $16 ; tileset
    db $0e, $0f ; dimensions (y, x)
    dw $6110, $604d, $5fd8 ; blocks, texts, scripts
    db $00 ; connections

    dw $60d1 ; objects

INCBIN "baserom.gbc",$51fd8,$521e2 - $51fd8

Mansion3_h: ; 0x521e2 to 0x521ee (12 bytes) (id=215)
    db $16 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $6326, $628a, $61ee ; blocks, texts, scripts
    db $00 ; connections

    dw $62e6 ; objects

INCBIN "baserom.gbc",$521ee,$523ad - $521ee

Mansion4_h: ; 0x523ad to 0x523b9 (12 bytes) (id=216)
    db $16 ; tileset
    db $0e, $0f ; dimensions (y, x)
    dw $64dd, $6436, $63b9 ; blocks, texts, scripts
    db $00 ; connections

    dw $6498 ; objects

INCBIN "baserom.gbc",$523b9,$1c47

SECTION "bank15",DATA,BANK[$15]
INCBIN "baserom.gbc",$54000,$541e6 - $54000

Route3_h: ; 0x541e6 to 0x54208 (34 bytes) (id=14)
    db $00 ; tileset
    db $09, $23 ; dimensions (y, x)
    dw $4255, $5511, $54f8 ; blocks, texts, scripts
    db NORTH | WEST ; connections

    ; connections data

    db $0f ; some map
    dw $44fa, $c704 ; pointers (connected, current) (strip)
    db $0d, $2d ; bigness, width
    db $11, $ce ; alignments (y, x)
    dw $c8b4 ; window

    db $02 ; some map
    dw $460b, $c6e8 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $27 ; alignments (y, x)
    dw $c716 ; window

    ; end connection data

    dw $4208 ; objects

INCBIN "baserom.gbc",$54208,$54390 - $54208

Route4_h: ; 0x54390 to 0x543b2 (34 bytes) (id=15)
    db $00 ; tileset
    db $09, $2d ; dimensions (y, x)
    dw $43ec, $5671, $5658 ; blocks, texts, scripts
    db SOUTH | EAST ; connections

    ; connections data

    db $0e ; some map
    dw $426b, $c94c ; pointers (connected, current) (strip)
    db $0d, $23 ; bigness, width
    db $00, $32 ; alignments (y, x)
    dw $c712 ; window

    db $03 ; some map
    dw $4844, $c718 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $00 ; alignments (y, x)
    dw $c703 ; window

    ; end connection data

    dw $43b2 ; objects

INCBIN "baserom.gbc",$543b2,$54581 - $543b2

Route5_h: ; 0x54581 to 0x545a3 (34 bytes) (id=16)
    db $00 ; tileset
    db $12, $0a ; dimensions (y, x)
    dw $45d2, $56b5, $56b2 ; blocks, texts, scripts
    db NORTH | SOUTH ; connections

    ; connections data

    db $03 ; some map
    dw $495e, $c6e8 ; pointers (connected, current) (strip)
    db $10, $14 ; bigness, width
    db $23, $0a ; alignments (y, x)
    dw $c8bd ; window

    db $0a ; some map
    dw $4a9a, $c838 ; pointers (connected, current) (strip)
    db $10, $14 ; bigness, width
    db $00, $0a ; alignments (y, x)
    dw $c703 ; window

    ; end connection data

    dw $45a3 ; objects

INCBIN "baserom.gbc",$545a3,$54686 - $545a3

Route9_h: ; 0x54686 to 0x546a8 (34 bytes) (id=20)
    db $00 ; tileset
    db $09, $1e ; dimensions (y, x)
    dw $46fe, $56d5, $56bc ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connections data

    db $03 ; some map
    dw $4855, $c6e8 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $27 ; alignments (y, x)
    dw $c716 ; window

    db $15 ; some map
    dw $4356, $c775 ; pointers (connected, current) (strip)
    db $0c, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $46a8 ; objects

INCBIN "baserom.gbc",$546a8,$5480c - $546a8

Route13_h: ; 0x5480c to 0x5482e (34 bytes) (id=24)
    db $00 ; tileset
    db $09, $1e ; dimensions (y, x)
    dw $488b, $5837, $581e ; blocks, texts, scripts
    db NORTH | WEST ; connections

    ; connections data

    db $17 ; some map
    dw $490e, $c6ff ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $6b, $d8 ; alignments (y, x)
    dw $ca49 ; window

    db $19 ; some map
    dw $4a19, $c754 ; pointers (connected, current) (strip)
    db $0c, $0a ; bigness, width
    db $00, $13 ; alignments (y, x)
    dw $c702 ; window

    ; end connection data

    dw $482e ; objects

INCBIN "baserom.gbc",$5482e,$54999 - $5482e

Route14_h: ; 0x54999 to 0x549bb (34 bytes) (id=25)
    db $00 ; tileset
    db $1b, $0a ; dimensions (y, x)
    dw $4a12, $59ec, $59d3 ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connections data

    db $1a ; some map
    dw $49e7, $c838 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $dc, $3b ; alignments (y, x)
    dw $c72a ; window

    db $18 ; some map
    dw $488b, $c725 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c70d ; window

    ; end connection data

    dw $49bb ; objects

INCBIN "baserom.gbc",$549bb,$54b20 - $549bb

Route17_h: ; 0x54b20 to 0x54b42 (34 bytes) (id=28)
    db $00 ; tileset
    db $48, $0a ; dimensions (y, x)
    dw $4ba8, $5b93, $5b7a ; blocks, texts, scripts
    db NORTH | SOUTH ; connections

    ; connections data

    db $1b ; some map
    dw $4bfc, $c6eb ; pointers (connected, current) (strip)
    db $0d, $14 ; bigness, width
    db $11, $00 ; alignments (y, x)
    dw $c7d3 ; window

    db $1d ; some map
    dw $4c9c, $cb9b ; pointers (connected, current) (strip)
    db $0d, $19 ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c708 ; window

    ; end connection data

    dw $4b42 ; objects

INCBIN "baserom.gbc",$54b42,$54e78 - $54b42

Route19_h: ; 0x54e78 to 0x54e9a (34 bytes) (id=30)
    db $00 ; tileset
    db $1b, $0a ; dimensions (y, x)
    dw $4ef1, $5d5d, $5d44 ; blocks, texts, scripts
    db NORTH | WEST ; connections

    ; connections data

    db $07 ; some map
    dw $4db4, $c6e8 ; pointers (connected, current) (strip)
    db $10, $14 ; bigness, width
    db $23, $0a ; alignments (y, x)
    dw $c8bd ; window

    db $1f ; some map
    dw $41ac, $c838 ; pointers (connected, current) (strip)
    db $09, $32 ; bigness, width
    db $dc, $63 ; alignments (y, x)
    dw $c752 ; window

    ; end connection data

    dw $4e9a ; objects

INCBIN "baserom.gbc",$54e9a,$54fff - $54e9a

Route21_h: ; 0x54fff to 0x55021 (34 bytes) (id=32)
    db $00 ; tileset
    db $2d, $0a ; dimensions (y, x)
    dw $506d, $5f04, $5eeb ; blocks, texts, scripts
    db NORTH | SOUTH ; connections

    ; connections data

    db $00 ; some map
    dw $4339, $c6eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $11, $00 ; alignments (y, x)
    dw $c779 ; window

    db $08 ; some map
    dw $4069, $c9eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $5021 ; objects

INCBIN "baserom.gbc",$55021,$56064 - $55021

VermilionHouse2_h: ; 0x56064 to 0x56070 (12 bytes) (id=163)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $522f, $6073, $6070 ; blocks, texts, scripts
    db $00 ; connections

    dw $60cf ; objects

INCBIN "baserom.gbc",$56070,$560e9 - $56070

CeladonMart2_h: ; 0x560e9 to 0x560f5 (12 bytes) (id=123)
    db $12 ; tileset
    db $04, $0a ; dimensions (y, x)
    dw $6148, $60f8, $60f5 ; blocks, texts, scripts
    db $00 ; connections

    dw $6111 ; objects

INCBIN "baserom.gbc",$560f5,$56170 - $560f5

FuchsiaHouse3_h: ; 0x56170 to 0x5617c (12 bytes) (id=164)
    db $0d ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $523f, $617f, $617c ; blocks, texts, scripts
    db $00 ; connections

    dw $6221 ; objects

INCBIN "baserom.gbc",$5617c,$56243 - $5617c

DayCareM_h: ; 0x56243 to 0x5624f (12 bytes) (id=72)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $522f, $6252, $624f ; blocks, texts, scripts
    db $00 ; connections

    dw $6459 ; objects

INCBIN "baserom.gbc",$5624f,$56473 - $5624f

Route12House_h: ; 0x56473 to 0x5647f (12 bytes) (id=189)
    db $08 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $522f, $6482, $647f ; blocks, texts, scripts
    db $00 ; connections

    dw $64de ; objects

INCBIN "baserom.gbc",$5647f,$564f8 - $5647f

SilphCo8_h: ; 0x564f8 to 0x56504 (12 bytes) (id=213)
    db $16 ; tileset
    db $09, $0d ; dimensions (y, x)
    dw $666d, $657d, $6504 ; blocks, texts, scripts
    db $00 ; connections

    dw $6613 ; objects

INCBIN "baserom.gbc",$56504,$1afc

SECTION "bank16",DATA,BANK[$16]
Route6_h: ; 0x58000 to 0x58022 (34 bytes) (id=17)
    db $00 ; tileset
    db $12, $0a ; dimensions (y, x)
    dw $4079, $50c9, $50b0 ; blocks, texts, scripts
    db NORTH | SOUTH ; connections

    ; connections data

    db $0a ; some map
    dw $4bc6, $c6e8 ; pointers (connected, current) (strip)
    db $10, $14 ; bigness, width
    db $23, $0a ; alignments (y, x)
    dw $c8bd ; window

    db $05 ; some map
    dw $4a41, $c838 ; pointers (connected, current) (strip)
    db $10, $14 ; bigness, width
    db $00, $0a ; alignments (y, x)
    dw $c703 ; window

    ; end connection data

    dw $4022 ; objects

INCBIN "baserom.gbc",$58022,$5812d - $58022

Route8_h: ; 0x5812d to 0x5814f (34 bytes) (id=19)
    db $00 ; tileset
    db $09, $1e ; dimensions (y, x)
    dw $41c6, $51cf, $51b6 ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connections data

    db $0a ; some map
    dw $4abd, $c6e8 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $27 ; alignments (y, x)
    dw $c716 ; window

    db $04 ; some map
    dw $4085, $c775 ; pointers (connected, current) (strip)
    db $09, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $414f ; objects

INCBIN "baserom.gbc",$5814f,$582d4 - $5814f

Route10_h: ; 0x582d4 to 0x582f6 (34 bytes) (id=21)
    db $00 ; tileset
    db $24, $0a ; dimensions (y, x)
    dw $4356, $534f, $5336 ; blocks, texts, scripts
    db SOUTH | WEST ; connections

    ; connections data

    db $04 ; some map
    dw $4085, $c95b ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    db $14 ; some map
    dw $4719, $c718 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $00, $3b ; alignments (y, x)
    dw $c72a ; window

    ; end connection data

    dw $42f6 ; objects

INCBIN "baserom.gbc",$582f6,$584be - $582f6

Route11_h: ; 0x584be to 0x584e0 (34 bytes) (id=22)
    db $00 ; tileset
    db $09, $1e ; dimensions (y, x)
    dw $455f, $5465, $544c ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connections data

    db $05 ; some map
    dw $4a64, $c6e8 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $27 ; alignments (y, x)
    dw $c716 ; window

    db $17 ; some map
    dw $4800, $c709 ; pointers (connected, current) (strip)
    db $0f, $0a ; bigness, width
    db $36, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $44e0 ; objects

INCBIN "baserom.gbc",$584e0,$5866d - $584e0

Route12_h: ; 0x5866d to 0x5869a (45 bytes) (id=23)
    db $00 ; tileset
    db $36, $0a ; dimensions (y, x)
    dw $4710, $5675, $55f3 ; blocks, texts, scripts
    db NORTH | SOUTH | WEST ; connections

    ; connections data

    db $04 ; some map
    dw $40c1, $c6eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $11, $00 ; alignments (y, x)
    dw $c779 ; window

    db $18 ; some map
    dw $489c, $ca78 ; pointers (connected, current) (strip)
    db $0d, $1e ; bigness, width
    db $00, $28 ; alignments (y, x)
    dw $c70d ; window

    db $16 ; some map
    dw $457a, $c8c8 ; pointers (connected, current) (strip)
    db $09, $1e ; bigness, width
    db $ca, $3b ; alignments (y, x)
    dw $c72a ; window

    ; end connection data

    dw $469a ; objects

INCBIN "baserom.gbc",$5869a,$5892c - $5869a

Route15_h: ; 0x5892c to 0x5894e (34 bytes) (id=26)
    db $00 ; tileset
    db $09, $1e ; dimensions (y, x)
    dw $49cc, $57c7, $57ae ; blocks, texts, scripts
    db WEST | EAST ; connections

    ; connections data

    db $07 ; some map
    dw $4cab, $c6e8 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $27 ; alignments (y, x)
    dw $c716 ; window

    db $19 ; some map
    dw $4aa8, $c709 ; pointers (connected, current) (strip)
    db $0c, $0a ; bigness, width
    db $24, $00 ; alignments (y, x)
    dw $c6f9 ; window

    ; end connection data

    dw $494e ; objects

INCBIN "baserom.gbc",$5894e,$58ada - $5894e

Route16_h: ; 0x58ada to 0x58afc (34 bytes) (id=27)
    db $00 ; tileset
    db $09, $14 ; dimensions (y, x)
    dw $4b84, $59b9, $5933 ; blocks, texts, scripts
    db SOUTH | EAST ; connections

    ; connections data

    db $1c ; some map
    dw $4ba8, $c823 ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $00, $00 ; alignments (y, x)
    dw $c6f9 ; window

    db $06 ; some map
    dw $40f8, $c6ff ; pointers (connected, current) (strip)
    db $0f, $19 ; bigness, width
    db $08, $00 ; alignments (y, x)
    dw $c708 ; window

    ; end connection data

    dw $4afc ; objects

INCBIN "baserom.gbc",$58afc,$58c38 - $58afc

Route18_h: ; 0x58c38 to 0x58c5a (34 bytes) (id=29)
    db $00 ; tileset
    db $09, $19 ; dimensions (y, x)
    dw $4c9c, $5ae0, $5ac7 ; blocks, texts, scripts
    db NORTH | EAST ; connections

    ; connections data

    db $1c ; some map
    dw $4e5a, $c6eb ; pointers (connected, current) (strip)
    db $0a, $0a ; bigness, width
    db $8f, $00 ; alignments (y, x)
    dw $cb69 ; window

    db $07 ; some map
    dw $4c9a, $c704 ; pointers (connected, current) (strip)
    db $0f, $14 ; bigness, width
    db $08, $00 ; alignments (y, x)
    dw $c703 ; window

    ; end connection data

    dw $4c5a ; objects

INCBIN "baserom.gbc",$58c5a,$59b64 - $58c5a

FanClub_h: ; 0x59b64 to 0x59b70 (12 bytes) (id=90)
    db $10 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $5cd5, $5b84, $5b70 ; blocks, texts, scripts
    db $00 ; connections

    dw $5c97 ; objects

INCBIN "baserom.gbc",$59b70,$59ce5 - $59b70

SilphCo2_h: ; 0x59ce5 to 0x59cf1 (12 bytes) (id=207)
    db $16 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $5ec8, $5d86, $5cf1 ; blocks, texts, scripts
    db $00 ; connections

    dw $5e66 ; objects

INCBIN "baserom.gbc",$59cf1,$59f4f - $59cf1

SilphCo3_h: ; 0x59f4f to 0x59f5b (12 bytes) (id=208)
    db $16 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $60a6, $5fc4, $5f5b ; blocks, texts, scripts
    db $00 ; connections

    dw $6035 ; objects

INCBIN "baserom.gbc",$59f5b,$5a12d - $59f5b

SilphCo10_h: ; 0x5a12d to 0x5a139 (12 bytes) (id=234)
    db $16 ; tileset
    db $09, $08 ; dimensions (y, x)
    dw $625a, $6186, $6139 ; blocks, texts, scripts
    db $00 ; connections

    dw $61fb ; objects

INCBIN "baserom.gbc",$5a139,$5a2a2 - $5a139

Lance_h: ; 0x5a2a2 to 0x5a2ae (12 bytes) (id=113)
    db $05 ; tileset
    db $0d, $0d ; dimensions (y, x)
    dw $63e9, $6395, $62ae ; blocks, texts, scripts
    db $00 ; connections

    dw $63c5 ; objects

INCBIN "baserom.gbc",$5a2ae,$5a492 - $5a2ae

HallofFameRoom_h: ; 0x5a492 to 0x5a49e (12 bytes) (id=118)
    db $07 ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $658b, $656a, $649e ; blocks, texts, scripts
    db $00 ; connections

    dw $6571 ; objects

INCBIN "baserom.gbc",$5a49e,$1b62

SECTION "bank17",DATA,BANK[$17]

INCBIN "baserom.gbc",$5C000,$10

RedsHouse2FBlocks:
	INCBIN "maps/redshouse2f.blk"

INCBIN "baserom.gbc",$5C020,$84

RedsHouse2F_h:
	db $04 ; tileset
	db $04,$04 ; dimensions
	dw RedsHouse2FBlocks,RedsHouse2FTexts,RedsHouse2FScript
	db 0 ; no connections
	dw RedsHouse2FObject

RedsHouse2FScript:
	call $3C3C
	ld hl,RedsHouse2FScriptPointers
	ld a,[$D60C]
	jp $3D97

RedsHouse2FScriptPointers:
	dw RedsHouse2FScript1,RedsHouse2FScript2

RedsHouse2FScript1:
	xor a
	ld [$FFB4],a
	ld a,8
	ld [$D528],a
	ld a,1
	ld [$D60C],a
	ret

RedsHouse2FScript2:
	ret

RedsHouse2FTexts:
	db "@"

RedsHouse2FObject:
	db $0A ; border tile

	db 1 ; warps
	db 1,7,2,$25

	db 0 ; signs

	db 0 ; people

	dw $C6EF + 4 + (4 + 6) * 0 + 3
	db 1,7

INCBIN "baserom.gbc",$5c0dc,$5c0eb - $5c0dc

MuseumF1_h: ; 0x5c0eb to 0x5c0f7 (12 bytes) (id=52)
    db $0a ; tileset
    db $04, $0a ; dimensions (y, x)
    dw $4020, $412b, $40f7 ; blocks, texts, scripts
    db $00 ; connections

    dw $42c1 ; objects

INCBIN "baserom.gbc",$5c0f7,$5c30b - $5c0f7

MuseumF2_h: ; 0x5c30b to 0x5c317 (12 bytes) (id=53)
    db $0a ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $4048, $431a, $4317 ; blocks, texts, scripts
    db $00 ; connections

    dw $434b ; objects

INCBIN "baserom.gbc",$5c317,$5c37b - $5c317

PewterGym_h: ; 0x5c37b to 0x5c387 (12 bytes) (id=54)
    db $07 ; tileset
    db $07, $05 ; dimensions (y, x)
    dw $4558, $4435, $4387 ; blocks, texts, scripts
    db $00 ; connections

    dw $452e ; objects

INCBIN "baserom.gbc",$5c387,$5c57b - $5c387

PewterPokeCenter_h: ; 0x5c57b to 0x5c587 (12 bytes) (id=58)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $4064, $458d, $4587 ; blocks, texts, scripts
    db $00 ; connections

    dw $460d ; objects

INCBIN "baserom.gbc",$5c587,$5c639 - $5c587

CeruleanPokecenter_h: ; 0x5c639 to 0x5c645 (12 bytes) (id=64)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $468b, $464b, $4645 ; blocks, texts, scripts
    db $00 ; connections

    dw $465f ; objects

INCBIN "baserom.gbc",$5c645,$5c6a7 - $5c645

CeruleanGym_h: ; 0x5c6a7 to 0x5c6b3 (12 bytes) (id=65)
    db $07 ; tileset
    db $07, $05 ; dimensions (y, x)
    dw $4866, $474a, $46b3 ; blocks, texts, scripts
    db $00 ; connections

    dw $4834 ; objects

INCBIN "baserom.gbc",$5c6b3,$5c889 - $5c6b3

CeruleanMart_h: ; 0x5c889 to 0x5c895 (12 bytes) (id=67)
    db $02 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4000, $4898, $4895 ; blocks, texts, scripts
    db $00 ; connections

    dw $48a8 ; objects

INCBIN "baserom.gbc",$5c895,$5c8ce - $5c895

LavenderPokecenter_h: ; 0x5c8ce to 0x5c8da (12 bytes) (id=141)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $4064, $48e0, $48da ; blocks, texts, scripts
    db $00 ; connections

    dw $48f4 ; objects

INCBIN "baserom.gbc",$5c8da,$5c920 - $5c8da

LavenderMart_h: ; 0x5c920 to 0x5c92c (12 bytes) (id=150)
    db $02 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4000, $492f, $492c ; blocks, texts, scripts
    db $00 ; connections

    dw $495d ; objects

INCBIN "baserom.gbc",$5c92c,$5c983 - $5c92c

VermilionPokeCenter_h: ; 0x5c983 to 0x5c98f (12 bytes) (id=89)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $4064, $4995, $498f ; blocks, texts, scripts
    db $00 ; connections

    dw $49a9 ; objects

INCBIN "baserom.gbc",$5c98f,$5c9d5 - $5c98f

VermilionMart_h: ; 0x5c9d5 to 0x5c9e1 (12 bytes) (id=91)
    db $02 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4000, $49e4, $49e1 ; blocks, texts, scripts
    db $00 ; connections

    dw $49f4 ; objects

INCBIN "baserom.gbc",$5c9e1,$5ca1a - $5c9e1

VermilionGym_h: ; 0x5ca1a to 0x5ca26 (12 bytes) (id=92)
    db $07 ; tileset
    db $09, $05 ; dimensions (y, x)
    dw $4c38, $4ae8, $4a26 ; blocks, texts, scripts
    db $00 ; connections

    dw $4bfe ; objects

INCBIN "baserom.gbc",$5ca26,$5cc65 - $5ca26

CopycatsHouseF2_h: ; 0x5cc65 to 0x5cc71 (12 bytes) (id=176)
    db $04 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4010, $4c74, $4c71 ; blocks, texts, scripts
    db $00 ; connections

    dw $4d21 ; objects

INCBIN "baserom.gbc",$5cc71,$5cd51 - $5cc71

FightingDojo_h: ; 0x5cd51 to 0x5cd5d (12 bytes) (id=177)
    db $05 ; tileset
    db $06, $05 ; dimensions (y, x)
    dw $4fe3, $4e03, $4d5d ; blocks, texts, scripts
    db $00 ; connections

    dw $4f9b ; objects

INCBIN "baserom.gbc",$5cd5d,$5d001 - $5cd5d

SaffronGym_h: ; 0x5d001 to 0x5d00d (12 bytes) (id=178)
    db $16 ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $53a3, $50ab, $500d ; blocks, texts, scripts
    db $00 ; connections

    dw $5259 ; objects

INCBIN "baserom.gbc",$5d00d,$5d3fd - $5d00d

SaffronMart_h: ; 0x5d3fd to 0x5d409 (12 bytes) (id=180)
    db $02 ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4000, $540c, $5409 ; blocks, texts, scripts
    db $00 ; connections

    dw $541c ; objects

INCBIN "baserom.gbc",$5d409,$5d442 - $5d409

SilphCo1_h: ; 0x5d442 to 0x5d44e (12 bytes) (id=181)
    db $16 ; tileset
    db $09, $0f ; dimensions (y, x)
    dw $54a2, $5469, $544e ; blocks, texts, scripts
    db $00 ; connections

    dw $5470 ; objects

INCBIN "baserom.gbc",$5d44e,$5d529 - $5d44e

SaffronPokecenter_h: ; 0x5d529 to 0x5d535 (12 bytes) (id=182)
    db $06 ; tileset
    db $04, $07 ; dimensions (y, x)
    dw $4064, $553b, $5535 ; blocks, texts, scripts
    db $00 ; connections

    dw $554f ; objects

INCBIN "baserom.gbc",$5d535,$5d57b - $5d535

ViridianForestexit_h: ; 0x5d57b to 0x5d587 (12 bytes) (id=47)
    db $09 ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $4090, $558a, $5587 ; blocks, texts, scripts
    db $00 ; connections

    dw $5598 ; objects

INCBIN "baserom.gbc",$5d587,$5d5c8 - $5d587

Route2Gate_h: ; 0x5d5c8 to 0x5d5d4 (12 bytes) (id=49)
    db $0c ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $4090, $55d7, $55d4 ; blocks, texts, scripts
    db $00 ; connections

    dw $5620 ; objects

INCBIN "baserom.gbc",$5d5d4,$5d650 - $5d5d4

ViridianForestEntrance_h: ; 0x5d650 to 0x5d65c (12 bytes) (id=50)
    db $09 ; tileset
    db $04, $05 ; dimensions (y, x)
    dw $4090, $565f, $565c ; blocks, texts, scripts
    db $00 ; connections

    dw $566d ; objects

INCBIN "baserom.gbc",$5d65c,$5d69d - $5d65c

UndergroundTunnelEntranceRoute5_h: ; 0x5d69d to 0x5d6a9 (12 bytes) (id=71)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4080, $56b0, $56a9 ; blocks, texts, scripts
    db $00 ; connections

    dw $56c1 ; objects

INCBIN "baserom.gbc",$5d6a9,$5d6e3 - $5d6a9

UndergroundTunnelEntranceRoute6_h: ; 0x5d6e3 to 0x5d6ef (12 bytes) (id=74)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4080, $56f7, $56ef ; blocks, texts, scripts
    db $00 ; connections

    dw $56fe ; objects

INCBIN "baserom.gbc",$5d6ef,$5d720 - $5d6ef

UndergroundPathEntranceRoute7_h: ; 0x5d720 to 0x5d72c (12 bytes) (id=77)
    db $0c ; tileset
    db $04, $04 ; dimensions (y, x)
    dw $4080, $5734, $572c ; blocks, texts, scripts
    db $00 ; connections

    dw $573b ; objects

INCBIN "baserom.gbc",$5d72c,$5d7af - $5d72c

SilphCo9_h: ; 0x5d7af to 0x5d7bb (12 bytes) (id=233)
    db $16 ; tileset
    db $09, $0d ; dimensions (y, x)
    dw $5989, $588b, $57bb ; blocks, texts, scripts
    db $00 ; connections

    dw $593f ; objects

INCBIN "baserom.gbc",$5d7bb,$5d9fe - $5d7bb

VictoryRoad1_h: ; 0x5d9fe to 0x5da0a (12 bytes) (id=108)
    db $11 ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $5b04, $5a5f, $5a0a ; blocks, texts, scripts
    db $00 ; connections

    dw $5ab8 ; objects

INCBIN "baserom.gbc",$5da0a,$25f6

SECTION "bank18",DATA,BANK[$18]
INCBIN "baserom.gbc",$60000,$60420 - $60000

PokemonTower1_h: ; 0x60420 to 0x6042c (12 bytes) (id=142)
    db $0f ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $448c, $442f, $442c ; blocks, texts, scripts
    db $00 ; connections

    dw $4452 ; objects

INCBIN "baserom.gbc",$6042c,$604e6 - $6042c

PokemonTower2_h: ; 0x604e6 to 0x604f2 (12 bytes) (id=143)
    db $0f ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4666, $45db, $44f2 ; blocks, texts, scripts
    db $00 ; connections

    dw $4646 ; objects

INCBIN "baserom.gbc",$604f2,$606c0 - $604f2

PokemonTower3_h: ; 0x606c0 to 0x606cc (12 bytes) (id=144)
    db $0f ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4790, $46e5, $46cc ; blocks, texts, scripts
    db $00 ; connections

    dw $475d ; objects

INCBIN "baserom.gbc",$606cc,$607ea - $606cc

PokemonTower4_h: ; 0x607ea to 0x607f6 (12 bytes) (id=145)
    db $0f ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $48cc, $480f, $47f6 ; blocks, texts, scripts
    db $00 ; connections

    dw $488b ; objects

INCBIN "baserom.gbc",$607f6,$60926 - $607f6

PokemonTower5_h: ; 0x60926 to 0x60932 (12 bytes) (id=146)
    db $0f ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4a89, $499b, $4932 ; blocks, texts, scripts
    db $00 ; connections

    dw $4a48 ; objects

INCBIN "baserom.gbc",$60932,$60ae3 - $60932

PokemonTower6_h: ; 0x60ae3 to 0x60aef (12 bytes) (id=147)
    db $0f ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4c95, $4bb1, $4aef ; blocks, texts, scripts
    db $00 ; connections

    dw $4c5b ; objects

INCBIN "baserom.gbc",$60aef,$60cf9 - $60aef

PokemonTower7_h: ; 0x60cf9 to 0x60d05 (12 bytes) (id=148)
    db $0f ; tileset
    db $09, $0a ; dimensions (y, x)
    dw $4f20, $4e3f, $4d05 ; blocks, texts, scripts
    db $00 ; connections

    dw $4ef6 ; objects

INCBIN "baserom.gbc",$60d05,$60f7a - $60d05

CeladonMart1_h: ; 0x60f7a to 0x60f86 (12 bytes) (id=122)
    db $12 ; tileset
    db $04, $0a ; dimensions (y, x)
    dw $4fde, $4f89, $4f86 ; blocks, texts, scripts
    db $00 ; connections

    dw $4f9e ; objects

INCBIN "baserom.gbc",$60f86,$61101 - $60f86

ViridianForest_h: ; 0x61101 to 0x6110d (12 bytes) (id=51)
    db $03 ; tileset
    db $18, $11 ; dimensions (y, x)
    dw $4000, $5126, $510d ; blocks, texts, scripts
    db $00 ; connections

    dw $51da ; objects

INCBIN "baserom.gbc",$6110d,$2ef3

SECTION "bank19",DATA,BANK[$19]
Tset00_GFX:
	INCBIN "baserom.gbc",$64000,$645E0-$64000
Tset00_Block:
	INCBIN "baserom.gbc",$645E0,$64DE0-$645E0
Tset01_GFX:
	INCBIN "baserom.gbc",$64DE0,$65270-$64DE0
Tset01_Block:
	INCBIN "baserom.gbc",$65270,$653A0-$65270
Tset08_GFX:
	INCBIN "baserom.gbc",$653A0,$65980-$653A0
Tset08_Block:
	INCBIN "baserom.gbc",$65980,$65BB0-$65980
Tset13_GFX:
	INCBIN "baserom.gbc",$65BB0,$66190-$65BB0
Tset13_Block:
	INCBIN "baserom.gbc",$66190,$66610-$66190
Tset0E_GFX:
	INCBIN "baserom.gbc",$66610,$66BF0-$66610
Tset0E_Block:
	INCBIN "baserom.gbc",$66BF0,$66D60-$66BF0
Tset10_GFX:
	INCBIN "baserom.gbc",$66D60,$67350-$66D60
Tset10_Block:
	INCBIN "baserom.gbc",$67350,$676F0-$67350
Tset17_GFX:
	INCBIN "baserom.gbc",$676F0,$67B50-$676F0
Tset17_Block:
	INCBIN "baserom.gbc",$67B50,$68000-$67B50

SECTION "bank1A",DATA,BANK[$1A]

DecrementPP:
; after using a move, decrement pp in battle and (if not transformed?) in party
	ld a,[de]
	cp a,STRUGGLE
	ret z
	ld hl,$D062
	ld a,[hli]
	and a,7
	ret nz
	bit 6,[hl]
	ret nz
	ld hl,$D02D ; PP of first move (in battle)
	call .DecrementPP\@

	ld a,[$D064]
	bit 3,a ; XXX transform status?
	ret nz

	ld hl,$D188 ; PP of first move (in party)
	ld a,[$CC2F] ; which mon in party is active
	ld bc,$2C
	call AddNTimes
.DecrementPP\@
	ld a,[$CC2E] ; which move (0, 1, 2, 3) did we use?
	ld c,a
	ld b,0
	add hl,bc
	dec [hl] ; Decrement PP
	ret

INCBIN "baserom.gbc",$6802F,$6807F-$6802F
Tset05_GFX:
	INCBIN "baserom.gbc",$6807F,$6867F-$6807F
Tset05_Block:
	INCBIN "baserom.gbc",$6867F,$68DBF-$6867F
Tset02_GFX:
	INCBIN "baserom.gbc",$68DBF,$693BF-$68DBF
Tset02_Block:
	INCBIN "baserom.gbc",$693BF,$6960F-$693BF
Tset09_GFX:
	INCBIN "baserom.gbc",$6960F,$69BFF-$6960F
Tset09_Block:
	INCBIN "baserom.gbc",$69BFF,$6A3FF-$69BFF
Tset03_GFX:
	INCBIN "baserom.gbc",$6A3FF,$6A9FF-$6A3FF
Tset03_Block:
	INCBIN "baserom.gbc",$6A9FF,$6B1FF-$6A9FF
Tset16_GFX:
	INCBIN "baserom.gbc",$6B1FF,$6B7FF-$6B1FF
Tset16_Block:
	INCBIN "baserom.gbc",$6B7FF,$6C000-$6B7FF

SECTION "bank1B",DATA,BANK[$1B]
Tset0F_GFX:
	INCBIN "baserom.gbc",$6C000,$6C5C0-$6C000
Tset0F_Block:
	INCBIN "baserom.gbc",$6C5C0,$6CCA0-$6C5C0
Tset11_GFX:
	INCBIN "baserom.gbc",$6CCA0,$6D0C0-$6CCA0
Tset11_Block:
	INCBIN "baserom.gbc",$6D0C0,$6D8C0-$6D0C0
Tset12_GFX:
	INCBIN "baserom.gbc",$6D8C0,$6DEA0-$6D8C0
Tset12_Block:
	INCBIN "baserom.gbc",$6DEA0,$6E390-$6DEA0
Tset0D_GFX:
	INCBIN "baserom.gbc",$6E390,$6E930-$6E390
Tset0D_Block:
	INCBIN "baserom.gbc",$6E930,$6ED10-$6E930
Tset14_GFX:
	INCBIN "baserom.gbc",$6ED10,$6F2D0-$6ED10
Tset14_Block:
	INCBIN "baserom.gbc",$6F2D0,$6F670-$6F2D0
Tset15_GFX:
	INCBIN "baserom.gbc",$6F670,$6FB20-$6F670
Tset15_Block:
	INCBIN "baserom.gbc",$6FB20,$6FD60-$6FB20
Tset0B_GFX:
	INCBIN "baserom.gbc",$6FD60,$6FEF0-$6FD60
Tset0B_Block:
	INCBIN "baserom.gbc",$6FEF0,$70000-$6FEF0

SECTION "bank1C",DATA,BANK[$1C]
INCBIN "baserom.gbc",$70000,$1100

CompressedMap: ; 5100
; you can decompress this file with the redrle program in the extras/ dir
	INCBIN "baserom.gbc",$71100,$711AB-$71100

INCBIN "baserom.gbc",$711AB,$71313-$711AB

ExternalMapEntries: ; 5313
	EMAP $2,$B,PalletTownName
	EMAP $2,$8,ViridianCityName
	EMAP $2,$3,PewterCityName
	EMAP $A,$2,CeruleanCityName
	EMAP $E,$5,LavenderTownName
	EMAP $A,$9,VermilionCityName
	EMAP $7,$5,CeladonCityName
	EMAP $8,$D,FuchsiaCityName
	EMAP $2,$F,CinnabarIslandName
	EMAP $0,$2,IndigoPlateauName
	EMAP $A,$5,SaffronCityName
	EMAP $0,$0,PalletTownName ; unused
	EMAP $2,$A,Route1Name
	EMAP $2,$6,Route2Name
	EMAP $4,$3,Route3Name
	EMAP $8,$2,Route4Name
	EMAP $A,$3,Route5Name
	EMAP $A,$8,Route6Name
	EMAP $8,$5,Route7Name
	EMAP $D,$5,Route8Name
	EMAP $D,$2,Route9Name
	EMAP $E,$4,Route10Name
	EMAP $C,$9,Route11Name
	EMAP $E,$9,Route12Name
	EMAP $D,$B,Route13Name
	EMAP $B,$C,Route14Name
	EMAP $A,$D,Route15Name
	EMAP $5,$5,Route16Name
	EMAP $4,$8,Route17Name
	EMAP $6,$D,Route18Name
	EMAP $6,$F,Route19Name
	EMAP $4,$F,Route20Name
	EMAP $2,$D,Route21Name
	EMAP $0,$8,Route22Name
	EMAP $0,$6,Route23Name
	EMAP $A,$1,Route24Name
	EMAP $B,$0,Route25Name

InternalMapEntries: ; 5382
	IMAP $29,$2,$B,PalletTownName
	IMAP $2E,$2,$8,ViridianCityName
	IMAP $33,$2,$6,Route2Name
	IMAP $34,$2,$4,ViridianForestName
	IMAP $3B,$2,$3,PewterCityName
	IMAP $3E,$6,$2,MountMoonName
	IMAP $44,$A,$2,CeruleanCityName
	IMAP $45,$5,$2,Route4Name
	IMAP $46,$A,$2,CeruleanCityName
	IMAP $49,$A,$4,Route5Name
	IMAP $4C,$A,$6,Route6Name
	IMAP $4F,$9,$5,Route7Name
	IMAP $51,$B,$5,Route8Name
	IMAP $53,$E,$3,RockTunnelName
	IMAP $54,$F,$4,PowerPlantName
	IMAP $57,$D,$9,Route11Name
	IMAP $58,$E,$7,Route12Name
	IMAP $59,$C,$0,SeaCottageName
	IMAP $5F,$A,$9,VermilionCityName
	IMAP $69,$9,$A,SSAnneName
	IMAP $6D,$0,$4,VictoryRoadName
	IMAP $77,$0,$2,PokemonLeagueName
	IMAP $78,$A,$5,UndergroundPathName
	IMAP $79,$0,$2,PokemonLeagueName
	IMAP $7A,$A,$5,UndergroundPathName
	IMAP $8D,$7,$5,CeladonCityName
	IMAP $8E,$E,$5,LavenderTownName
	IMAP $95,$F,$5,PokemonTowerName
	IMAP $98,$E,$5,LavenderTownName
	IMAP $9C,$8,$D,FuchsiaCityName
	IMAP $9D,$8,$C,SafariZoneName
	IMAP $9F,$8,$D,FuchsiaCityName
	IMAP $A3,$5,$F,SeafoamIslandsName
	IMAP $A4,$A,$9,VermilionCityName
	IMAP $A5,$8,$D,FuchsiaCityName
	IMAP $A6,$2,$F,PokemonMansionName
	IMAP $AE,$2,$F,CinnabarIslandName
	IMAP $AF,$0,$2,IndigoPlateauName
	IMAP $B8,$A,$5,SaffronCityName
	IMAP $BA,$9,$D,Route15Name
	IMAP $BD,$4,$5,Route16Name
	IMAP $BE,$E,$A,Route12Name
	IMAP $C0,$7,$D,Route18Name
	IMAP $C1,$5,$F,SeafoamIslandsName
	IMAP $C2,$0,$7,Route22Name
	IMAP $C3,$0,$4,VictoryRoadName
	IMAP $C4,$E,$7,Route12Name
	IMAP $C5,$A,$9,VermilionCityName
	IMAP $C6,$3,$4,DiglettsCaveName
	IMAP $C7,$0,$4,VictoryRoadName
	IMAP $CF,$7,$5,RocketHQName
	IMAP $D6,$A,$5,SilphCoName
	IMAP $D9,$2,$F,PokemonMansionName
	IMAP $E2,$8,$C,SafariZoneName
	IMAP $E5,$9,$1,CeruleanCaveName
	IMAP $E6,$E,$5,LavenderTownName
	IMAP $E7,$A,$2,CeruleanCityName
	IMAP $E9,$E,$3,RockTunnelName
	IMAP $ED,$A,$5,SilphCoName
	IMAP $F8,$0,$2,PokemonLeagueName
	db $FF

MapNames: ; 5473
PalletTownName:
	db "PALLET TOWN@"
ViridianCityName:
	db "VIRIDIAN CITY@"
PewterCityName:
	db "PEWTER CITY@"
CeruleanCityName:
	db "CERULEAN CITY@"
LavenderTownName:
	db "LAVENDER TOWN@"
VermilionCityName:
	db "VERMILION CITY@"
CeladonCityName:
	db "CELADON CITY@"
FuchsiaCityName:
	db "FUCHSIA CITY@"
CinnabarIslandName:
	db "CINNABAR ISLAND@"
IndigoPlateauName:
	db "INDIGO PLATEAU@"
SaffronCityName:
	db "SAFFRON CITY@"
Route1Name:
	db "ROUTE 1@"
Route2Name:
	db "ROUTE 2@"
Route3Name:
	db "ROUTE 3@"
Route4Name:
	db "ROUTE 4@"
Route5Name:
	db "ROUTE 5@"
Route6Name:
	db "ROUTE 6@"
Route7Name:
	db "ROUTE 7@"
Route8Name:
	db "ROUTE 8@"
Route9Name:
	db "ROUTE 9@"
Route10Name:
	db "ROUTE 10@"
Route11Name:
	db "ROUTE 11@"
Route12Name:
	db "ROUTE 12@"
Route13Name:
	db "ROUTE 13@"
Route14Name:
	db "ROUTE 14@"
Route15Name:
	db "ROUTE 15@"
Route16Name:
	db "ROUTE 16@"
Route17Name:
	db "ROUTE 17@"
Route18Name:
	db "ROUTE 18@"
Route19Name:
	db "SEA ROUTE 19@"
Route20Name:
	db "SEA ROUTE 20@"
Route21Name:
	db "SEA ROUTE 21@"
Route22Name:
	db "ROUTE 22@"
Route23Name:
	db "ROUTE 23@"
Route24Name:
	db "ROUTE 24@"
Route25Name:
	db "ROUTE 25@"
ViridianForestName:
	db "VIRIDIAN FOREST@"
MountMoonName:
	db "MT.MOON@"
RockTunnelName:
	db "ROCK TUNNEL@"
SeaCottageName:
	db "SEA COTTAGE@"
SSAnneName:
	db "S.S.ANNE@"
PokemonLeagueName:
	db "#MON LEAGUE@"
UndergroundPathName:
	db "UNDERGROUND PATH@"
PokemonTowerName:
	db "#MON TOWER@"
SeafoamIslandsName:
	db "SEAFOAM ISLANDS@"
VictoryRoadName:
	db "VICTORY ROAD@"
DiglettsCaveName:
	db "DIGLETT's CAVE@"
RocketHQName:
	db "ROCKET HQ@"
SilphCoName:
	db "SILPH CO.@"
PokemonMansionName:
	db $4a," MANSION@"
SafariZoneName:
	db "SAFARI ZONE@"
CeruleanCaveName:
	db "CERULEAN CAVE@"
PowerPlantName:
	db "POWER PLANT@"

INCBIN "baserom.gbc",$716BE,$71B7B-$716BE

TradeMons: ; 5B7B
; givemonster, getmonster, textstring, nickname (11 bytes), 14 bytes total
	db NIDORINO,  NIDORINA,  0,"TERRY@@@@@@"
	db ABRA,      MR__MIME,  0,"MARCEL@@@@@"
	db BUTTERFREE,BEEDRILL,  2,"CHIKUCHIKU@"
	db PONYTA,    SEEL,      0,"SAILOR@@@@@"
	db SPEAROW,   FARFETCH_D,2,"DUX@@@@@@@@"
	db SLOWBRO,   LICKITUNG, 0,"MARC@@@@@@@"
	db POLIWHIRL, JYNX,      1,"LOLA@@@@@@@"
	db RAICHU,    ELECTRODE, 1,"DORIS@@@@@@"
	db VENONAT,   TANGELA,   2,"CRINKLES@@@"
	db NIDORAN_M, NIDORAN_F, 2,"SPOT@@@@@@@"

INCBIN "baserom.gbc",$71C07,$725C8-$71C07

MonsterPalettes: ; 65C8
	db PAL_MEWMON    ; MISSINGNO
	db PAL_GREENMON  ; BULBASAUR
	db PAL_GREENMON  ; IVYSAUR
	db PAL_GREENMON  ; VENUSAUR
	db PAL_REDMON    ; CHARMANDER
	db PAL_REDMON    ; CHARMELEON
	db PAL_REDMON    ; CHARIZARD
	db PAL_CYANMON   ; SQUIRTLE
	db PAL_CYANMON   ; WARTORTLE
	db PAL_CYANMON   ; BLASTOISE
	db PAL_GREENMON  ; CATERPIE
	db PAL_GREENMON  ; METAPOD
	db PAL_CYANMON   ; BUTTERFREE
	db PAL_YELLOWMON ; WEEDLE
	db PAL_YELLOWMON ; KAKUNA
	db PAL_YELLOWMON ; BEEDRILL
	db PAL_BROWNMON  ; PIDGEY
	db PAL_BROWNMON  ; PIDGEOTTO
	db PAL_BROWNMON  ; PIDGEOT
	db PAL_GREYMON   ; RATTATA
	db PAL_GREYMON   ; RATICATE
	db PAL_BROWNMON  ; SPEAROW
	db PAL_BROWNMON  ; FEAROW
	db PAL_PURPLEMON ; EKANS
	db PAL_PURPLEMON ; ARBOK
	db PAL_YELLOWMON ; PIKACHU
	db PAL_YELLOWMON ; RAICHU
	db PAL_BROWNMON  ; SANDSHREW
	db PAL_BROWNMON  ; SANDSLASH
	db PAL_BLUEMON   ; NIDORAN_F
	db PAL_BLUEMON   ; NIDORINA
	db PAL_BLUEMON   ; NIDOQUEEN
	db PAL_PURPLEMON ; NIDORAN_M
	db PAL_PURPLEMON ; NIDORINO
	db PAL_PURPLEMON ; NIDOKING
	db PAL_PINKMON   ; CLEFAIRY
	db PAL_PINKMON   ; CLEFABLE
	db PAL_REDMON    ; VULPIX
	db PAL_YELLOWMON ; NINETALES
	db PAL_PINKMON   ; JIGGLYPUFF
	db PAL_PINKMON   ; WIGGLYTUFF
	db PAL_BLUEMON   ; ZUBAT
	db PAL_BLUEMON   ; GOLBAT
	db PAL_GREENMON  ; ODDISH
	db PAL_REDMON    ; GLOOM
	db PAL_REDMON    ; VILEPLUME
	db PAL_REDMON    ; PARAS
	db PAL_REDMON    ; PARASECT
	db PAL_PURPLEMON ; VENONAT
	db PAL_PURPLEMON ; VENOMOTH
	db PAL_BROWNMON  ; DIGLETT
	db PAL_BROWNMON  ; DUGTRIO
	db PAL_YELLOWMON ; MEOWTH
	db PAL_YELLOWMON ; PERSIAN
	db PAL_YELLOWMON ; PSYDUCK
	db PAL_CYANMON   ; GOLDUCK
	db PAL_BROWNMON  ; MANKEY
	db PAL_BROWNMON  ; PRIMEAPE
	db PAL_BROWNMON  ; GROWLITHE
	db PAL_REDMON    ; ARCANINE
	db PAL_BLUEMON   ; POLIWAG
	db PAL_BLUEMON   ; POLIWHIRL
	db PAL_BLUEMON   ; POLIWRATH
	db PAL_YELLOWMON ; ABRA
	db PAL_YELLOWMON ; KADABRA
	db PAL_YELLOWMON ; ALAKAZAM
	db PAL_GREYMON   ; MACHOP
	db PAL_GREYMON   ; MACHOKE
	db PAL_GREYMON   ; MACHAMP
	db PAL_GREENMON  ; BELLSPROUT
	db PAL_GREENMON  ; WEEPINBELL
	db PAL_GREENMON  ; VICTREEBEL
	db PAL_CYANMON   ; TENTACOOL
	db PAL_CYANMON   ; TENTACRUEL
	db PAL_GREYMON   ; GEODUDE
	db PAL_GREYMON   ; GRAVELER
	db PAL_GREYMON   ; GOLEM
	db PAL_REDMON    ; PONYTA
	db PAL_REDMON    ; RAPIDASH
	db PAL_PINKMON   ; SLOWPOKE
	db PAL_PINKMON   ; SLOWBRO
	db PAL_GREYMON   ; MAGNEMITE
	db PAL_GREYMON   ; MAGNETON
	db PAL_BROWNMON  ; FARFETCH_D
	db PAL_BROWNMON  ; DODUO
	db PAL_BROWNMON  ; DODRIO
	db PAL_BLUEMON   ; SEEL
	db PAL_BLUEMON   ; DEWGONG
	db PAL_PURPLEMON ; GRIMER
	db PAL_PURPLEMON ; MUK
	db PAL_GREYMON   ; SHELLDER
	db PAL_GREYMON   ; CLOYSTER
	db PAL_PURPLEMON ; GASTLY
	db PAL_PURPLEMON ; HAUNTER
	db PAL_PURPLEMON ; GENGAR
	db PAL_GREYMON   ; ONIX
	db PAL_YELLOWMON ; DROWZEE
	db PAL_YELLOWMON ; HYPNO
	db PAL_REDMON    ; KRABBY
	db PAL_REDMON    ; KINGLER
	db PAL_YELLOWMON ; VOLTORB
	db PAL_YELLOWMON ; ELECTRODE
	db PAL_PINKMON   ; EXEGGCUTE
	db PAL_GREENMON  ; EXEGGUTOR
	db PAL_GREYMON   ; CUBONE
	db PAL_GREYMON   ; MAROWAK
	db PAL_BROWNMON  ; HITMONLEE
	db PAL_BROWNMON  ; HITMONCHAN
	db PAL_PINKMON   ; LICKITUNG
	db PAL_PURPLEMON ; KOFFING
	db PAL_PURPLEMON ; WEEZING
	db PAL_GREYMON   ; RHYHORN
	db PAL_GREYMON   ; RHYDON
	db PAL_PINKMON   ; CHANSEY
	db PAL_BLUEMON   ; TANGELA
	db PAL_BROWNMON  ; KANGASKHAN
	db PAL_CYANMON   ; HORSEA
	db PAL_CYANMON   ; SEADRA
	db PAL_REDMON    ; GOLDEEN
	db PAL_REDMON    ; SEAKING
	db PAL_REDMON    ; STARYU
	db PAL_GREYMON   ; STARMIE
	db PAL_PINKMON   ; MR__MIME
	db PAL_GREENMON  ; SCYTHER
	db PAL_MEWMON    ; JYNX
	db PAL_YELLOWMON ; ELECTABUZZ
	db PAL_REDMON    ; MAGMAR
	db PAL_BROWNMON  ; PINSIR
	db PAL_GREYMON   ; TAUROS
	db PAL_REDMON    ; MAGIKARP
	db PAL_BLUEMON   ; GYARADOS
	db PAL_CYANMON   ; LAPRAS
	db PAL_GREYMON   ; DITTO
	db PAL_GREYMON   ; EEVEE
	db PAL_CYANMON   ; VAPOREON
	db PAL_YELLOWMON ; JOLTEON
	db PAL_REDMON    ; FLAREON
	db PAL_GREYMON   ; PORYGON
	db PAL_BLUEMON   ; OMANYTE
	db PAL_BLUEMON   ; OMASTAR
	db PAL_BROWNMON  ; KABUTO
	db PAL_BROWNMON  ; KABUTOPS
	db PAL_GREYMON   ; AERODACTYL
	db PAL_PINKMON   ; SNORLAX
	db PAL_BLUEMON   ; ARTICUNO
	db PAL_YELLOWMON ; ZAPDOS
	db PAL_REDMON    ; MOLTRES
	db PAL_GREYMON   ; DRATINI
	db PAL_BLUEMON   ; DRAGONAIR
	db PAL_BROWNMON  ; DRAGONITE
	db PAL_MEWMON    ; MEWTWO
	db PAL_MEWMON    ; MEW

; palettes for overworlds, title screen, monsters
SuperPalettes: ; 6660
	RGB 31,29,31 ; PAL_ROUTE
	RGB 21,28,11
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_PALLET
	RGB 25,28,27
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_VIRIDIAN
	RGB 17,26,3
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_PEWTER
	RGB 23,25,16
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_CERULEAN
	RGB 17,20,30
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_LAVENDER
	RGB 27,20,27
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_VERMILION
	RGB 30,18,0
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_CELADON
	RGB 16,30,22
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_FUCHSIA
	RGB 31,15,22
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_CINNABAR
	RGB 26,10,6
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_INDIGO
	RGB 22,14,24
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; PAL_SAFFRON
	RGB 27,27,3
	RGB 20,26,31
	RGB 3,2,2
	RGB 31,29,31 ; XXX
	RGB 20,26,31
	RGB 17,23,10
	RGB 3,2,2
	RGB 31,29,31 ; PAL_LOGO1
	RGB 30,30,17
	RGB 17,23,10
	RGB 21,0,4
	RGB 31,29,31 ; XXX
	RGB 30,30,17
	RGB 18,18,24
	RGB 7,7,16
	RGB 31,29,31 ; PAL_LOGO2
	RGB 24,20,30
	RGB 11,20,30
	RGB 3,2,2
	RGB 31,29,31 ; PAL_MEWMON
	RGB 30,22,17
	RGB 16,14,19
	RGB 3,2,2
	RGB 31,29,31 ; PAL_BLUEMON
	RGB 18,20,27
	RGB 11,15,23
	RGB 3,2,2
	RGB 31,29,31 ; PAL_REDMON
	RGB 31,20,10
	RGB 26,10,6
	RGB 3,2,2
	RGB 31,29,31 ; PAL_CYANMON
	RGB 21,25,29
	RGB 14,19,25
	RGB 3,2,2
	RGB 31,29,31 ; PAL_PURPLEMON
	RGB 27,22,24
	RGB 21,15,23
	RGB 3,2,2
	RGB 31,29,31 ; PAL_BROWNMON
	RGB 28,20,15
	RGB 21,14,9
	RGB 3,2,2
	RGB 31,29,31 ; PAL_GREENMON
	RGB 20,26,16
	RGB 9,20,11
	RGB 3,2,2
	RGB 31,29,31 ; PAL_PINKMON
	RGB 30,22,24
	RGB 28,15,21
	RGB 3,2,2
	RGB 31,29,31 ; PAL_YELLOWMON
	RGB 31,28,14
	RGB 26,20,0
	RGB 3,2,2
	RGB 31,29,31 ; PAL_GREYMON
	RGB 26,21,22
	RGB 15,15,18
	RGB 3,2,2
	RGB 31,29,31 ; PAL_SLOTS1
	RGB 26,21,22
	RGB 27,20,6
	RGB 3,2,2
	RGB 31,29,31 ; PAL_SLOTS2
	RGB 31,31,17
	RGB 25,17,21
	RGB 3,2,2
	RGB 31,29,31 ; PAL_SLOTS3
	RGB 22,31,16
	RGB 25,17,21
	RGB 3,2,2
	RGB 31,29,31 ; PAL_SLOTS4
	RGB 16,19,29
	RGB 25,17,21
	RGB 3,2,2
	RGB 31,29,31 ; PAL_BLACK
	RGB 7,7,7
	RGB 2,3,3
	RGB 3,2,2
	RGB 31,29,31 ; PAL_GREENBAR
	RGB 30,26,15
	RGB 9,20,11
	RGB 3,2,2
	RGB 31,29,31 ; PAL_YELLOWBAR
	RGB 30,26,15
	RGB 26,20,0
	RGB 3,2,2
	RGB 31,29,31 ; PAL_REDBAR
	RGB 30,26,15
	RGB 26,10,6
	RGB 3,2,2
	RGB 31,29,31 ; PAL_BADGE
	RGB 30,22,17
	RGB 11,15,23
	RGB 3,2,2
	RGB 31,29,31 ; PAL_CAVE
	RGB 21,14,9
	RGB 18,24,22
	RGB 3,2,2
	RGB 31,29,31 ; XXX
	RGB 31,28,14
	RGB 24,20,10
	RGB 3,2,2
BorderPalettes: ; 6788
INCBIN "baserom.gbc",$72788,$4000 - $2788


SECTION "bank1D",DATA,BANK[$1D]
INCBIN "baserom.gbc",$74000,$CB

Func40CB: ; 40CB
	xor a
	ld [$FFBA],a
	call $3719
	call $4183

	; display the next monster from CreditsMons
	ld hl,$CD3E
	ld c,[hl] ; how many monsters have we displayed so far?
	inc [hl]
	ld b,0
	ld hl,CreditsMons
	add hl,bc ; go that far in the list of monsters and get the next one
	ld a,[hl]
	ld [$CF91],a
	ld [$D0B5],a
	ld hl,$C420
	call $1537
	call $1389
	ld hl,$980C
	call $4164
	xor a
	ld [$FFBA],a
	call $3725
	ld hl,$9800
	call $4164
	ld a,$A7
	ld [$FF4B],a
	ld hl,$9C00
	call $4164
	call $4183
	ld a,$FC
	ld [$FF47],a
	ld bc,7
.next\@
	call $4140
	dec c
	jr nz,.next\@
	ld c,$14
.next2\@
	call $4140
	ld a,[$FF4B]
	sub 8
	ld [$FF4B],a
	dec c
	jr nz,.next2\@
	xor a
	ld [$FFB0],a
	ld a,$C0
	ld [$FF47],a
	ret

CreditsMons: ; 4131
	db VENUSAUR
	db ARBOK
	db RHYHORN
	db FEAROW
	db ABRA
	db GRAVELER
	db HITMONLEE
	db TANGELA
	db STARMIE
	db GYARADOS
	db DITTO
	db OMASTAR
	db VILEPLUME
	db NIDOKING
	db PARASECT

INCBIN "baserom.gbc",$74140,$2C3 - $140

CreditsTextPointers: ; 42C3

	dw CredRed
	dw CredTajiri
	dw CredTaOota
	dw CredMorimoto
	dw CredWatanabe
	dw CredMasuda
	dw CredNisino
	dw CredSugimori
	dw CredNishida
	dw CredMiyamoto
	dw CredKawaguchi
	dw CredIshihara
	dw CredYamauchi
	dw CredZinnai
	dw CredHishida
	dw CredSakai
	dw CredYamaguchi
	dw CredYamamoto
	dw CredTaniguchi
	dw CredNonomura
	dw CredFuziwara
	dw CredMatsusima
	dw CredTomisawa
	dw CredKawamoto
	dw CredKakei
	dw CredTsuchiya
	dw CredTaNakamura
	dw CredYuda
	dw CredMon
	dw CredDirector
	dw CredProgrammers
	dw CredCharDesign
	dw CredMusic
	dw CredSoundEffects
	dw CredGameDesign
	dw CredMonsterDesign
	dw CredGameScene
	dw CredParam
	dw CredMap
	dw CredTest
	dw CredSpecial
	dw CredProducers
	dw CredProducer
	dw CredExecutive
	dw CredTamada
	dw CredSaOota
	dw CredYoshikawa
	dw CredToOota
	dw CredUSStaff
	dw CredUSCoord
	dw CredTilden
	dw CredKawakami
	dw CredHiNakamura
	dw CredGiese
	dw CredOsborne
	dw CredTrans
	dw CredOgasawara
	dw CredIwata
	dw CredIzushi
	dw CredHarada
	dw CredMurakawa
	dw CredFukui
	dw CredClub
	dw CredPAAD

CredRed:
	db "2RED VERSION STAFF@"
CredTajiri:
	db "4SATOSHI TAJIRI@"
CredTaOota:
	db "4TAKENORI OOTA@"
CredMorimoto:
	db "3SHIGEKI MORIMOTO@"
CredWatanabe:
	db "3TETSUYA WATANABE@"
CredMasuda:
	db "4JUNICHI MASUDA@"
CredNisino:
	db "5KOHJI NISINO@"
CredSugimori:
	db "5KEN SUGIMORI@"
CredNishida:
	db "4ATSUKO NISHIDA@"
CredMiyamoto:
	db "3SHIGERU MIYAMOTO@"
CredKawaguchi:
	db "2TAKASHI KAWAGUCHI@"
CredIshihara:
	db "2TSUNEKAZU ISHIHARA@"
CredYamauchi:
	db "3HIROSHI YAMAUCHI@"
CredZinnai:
	db "3HIROYUKI ZINNAI@"
CredHishida:
	db "3TATSUYA HISHIDA@"
CredSakai:
	db "4YASUHIRO SAKAI@"
CredYamaguchi:
	db "3WATARU YAMAGUCHI@"
CredYamamoto:
	db "2KAZUYUKI YAMAMOTO@"
CredTaniguchi:
	db "2RYOHSUKE TANIGUCHI@"
CredNonomura:
	db "2FUMIHIRO NONOMURA@"
CredFuziwara:
	db "3MOTOFUMI FUZIWARA@"
CredMatsusima:
	db "3KENJI MATSUSIMA@"
CredTomisawa:
	db "3AKIHITO TOMISAWA@"
CredKawamoto:
	db "3HIROSHI KAWAMOTO@"
CredKakei:
	db "4AKIYOSHI KAKEI@"
CredTsuchiya:
	db "3KAZUKI TSUCHIYA@"
CredTaNakamura:
	db "4TAKEO NAKAMURA@"
CredYuda:
	db "4MASAMITSU YUDA@"
CredMon:
	db "7#MON@"
CredDirector:
	db "7DIRECTOR@"
CredProgrammers:
	db "5PROGRAMMERS@"
CredCharDesign:
	db "3CHARACTER DESIGN@"
CredMusic:
	db "8MUSIC@"
CredSoundEffects:
	db "4SOUND EFFECTS@"
CredGameDesign:
	db "5GAME DESIGN@"
CredMonsterDesign:
	db "4MONSTER DESIGN@"
CredGameScene:
	db "4GAME SCENARIO@"
CredParam:
	db "2PARAMETRIC DESIGN@"
CredMap:
	db "6MAP DESIGN@"
CredTest:
	db "3PRODUCT TESTING@"
CredSpecial:
	db "4SPECIAL THANKS@"
CredProducers:
	db "6PRODUCERS@"
CredProducer:
	db "6PRODUCER@"
CredExecutive:
	db "2EXECUTIVE PRODUCER@"
CredTamada:
	db "4SOUSUKE TAMADA@"
CredSaOota:
	db "5SATOSHI OOTA@"
CredYoshikawa:
	db "4RENA YOSHIKAWA@"
CredToOota:
	db "4TOMOMICHI OOTA@"
CredUSStaff:
	db "3US VERSION STAFF@"
CredUSCoord:
	db "3US COORDINATION@"
CredTilden:
	db "5GAIL TILDEN@"
CredKawakami:
	db "4NAOKO KAWAKAMI@"
CredHiNakamura:
	db "4HIRO NAKAMURA@"
CredGiese:
	db "4WILLIAM GIESE@"
CredOsborne:
	db "5SARA OSBORNE@"
CredTrans:
	db "3TEXT TRANSLATION@"
CredOgasawara:
	db "4NOB OGASAWARA@"
CredIwata:
	db "5SATORU IWATA@"
CredIzushi:
	db "3TAKEHIRO IZUSHI@"
CredHarada:
	db "3TAKAHIRO HARADA@"
CredMurakawa:
	db "3TERUKI MURAKAWA@"
CredFukui:
	db "5KOHTA FUKUI@"
CredClub:
	db "1NCL SUPER MARIO CLUB@"
CredPAAD:
	db "5PAAD TESTING@"

TheEndGfx: ; 473E
	INCBIN "gfx/theend.2bpp"

INCBIN "baserom.gbc",$747DE,$4000 - $7DE

SECTION "bank1E",DATA,BANK[$1E]
INCBIN "baserom.gbc",$78000,$F1

PlayAnimation: ; 40F1
	xor a
	ld [$FF8B],a
	ld [$D08B],a
	ld a,[$D07C] ; get animation number
	dec a
	ld l,a
	ld h,0
	add hl,hl
	ld de,$607D
	add hl,de
	ld a,[hli]
	ld h,[hl]
	ld l,a
.next7\@
	ld a,[hli]
	cp a,$FF
	jr z,.AnimationOver\@
	cp a,$C0 ; is this animation for a monster onscreen?
	jr c,.next2\@
	ld c,a
	ld de,$50DA
.next4\@
	ld a,[de]
	cp c
	jr z,.next3\@
	inc de
	inc de
	inc de
	jr .next4\@
.next3\@
	ld a,[hli]
	cp a,$FF
	jr z,.next5\@
	ld [$CF07],a
	push hl
	push de
	call $586F
	call $23B1
	pop de
	pop hl
.next5\@
	push hl
	inc de
	ld a,[de]
	ld l,a
	inc de
	ld a,[de]
	ld h,a
	ld de,.next6\@
	push de
	jp [hl]
.next2\@
	ld c,a
	and a,$3F
	ld [$D086],a
	xor a
	sla c
	rla
	sla c
	rla
	ld [$D09F],a
	ld a,[hli]
	ld [$CF07],a
	ld a,[hli]
	ld c,l
	ld b,h
	ld l,a
	ld h,0
	add hl,hl
	ld de,$676D
	add hl,de
	ld a,l
	ld [$D094],a
	ld a,h
	ld [$D095],a
	ld l,c
	ld h,b
	push hl
	ld a,[rOBP0]
	push af
	ld a,[$CC79]
	ld [rOBP0],a
	call $41D2
	call $417C
	call RealPlayAnimation
	pop af
	ld [rOBP0],a
.next6\@
	pop hl
	jr .next7\@
.AnimationOver\@ ; 417B
	ret

INCBIN "baserom.gbc",$7817C,$78D5E - $7817C

AttackAnimation: ; 4D5E
	push hl
	push de
	push bc
	push af
	call $3748
	call $4E23
	ld a,[$D07C]
	and a
	jr z,.AnimationFinished\@

	; if throwing a Poké Ball, skip the regular animation code
	cp a,TOSS_ANIM
	jr nz,.AttackAnimation\@
	ld de,.AnimationFinished\@
	push de
	jp TossBallAnimation

.AttackAnimation\@
	; check if battle animations are disabled in the options
	ld a,[$D355]
	bit 7,a
	jr nz,.AnimationsDisabled\@
	call ShareAttackAnimations
	call PlayAnimation
	jr .next4\@
.AnimationsDisabled\@
	ld c,30
	call DelayFrames
.next4\@
	call $4DBD ; reload pic and flash the pic in and out (to show damage)
.AnimationFinished\@
	call $3748
	xor a
	ld [$D096],a
	ld [$D09B],a
	ld [$D08B],a
	dec a
	ld [$CF07],a
	pop af
	pop bc
	pop de
	pop hl
	ret

ShareAttackAnimations: ; 4DA6
; some moves just reuse animations from status conditions
	ld a,[H_WHOSETURN]
	and a
	ret z

	; opponent’s turn

	ld a,[$D07C]

	cp a,AMNESIA
	ld b,CONF_ANIM
	jr z,.Replace\@

	cp a,REST
	ld b,SLP_ANIM
	ret nz

.Replace\@
	ld a,b
	ld [$D07C],a
	ret

Function4DBD: ; 4DBD
	ld a,[$CC5B]
	and a
	ret z
	dec a
	add a
	ld c,a
	ld b,0
	ld hl,Pointer4DCF
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp [hl]

Pointer4DCF: ; 4DCF
	dw $4DDB,$4DE3,$4DEB,$4DF0,$4DF6,$4DFE

INCBIN "baserom.gbc",$78DDB,$78E53-$78DDB
RealPlayAnimation: ; 4E53
	ld a,[$CF07] ; get animation # − 1
	cp a,$FF
	jr z,.Next4E60
	call $586F
	call $23B1 ; play sound effect
.Next4E60
	ld hl,$C300
	ld a,l
	ld [$D09D],a
	ld a,h
	ld [$D09C],a
	ld a,[$D097]
	ld h,a
	ld a,[$D096]
	ld l,a
	push hl
	ld c,[hl]
	ld b,0
	ld hl,PointerTable6F74
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	pop hl
	inc hl
	push hl
	ld e,[hl]
	ld d,0
	ld hl,$7C85
	add hl,de
	add hl,de
	ld a,[hli]
	ld [$D082],a
	ld a,[hl]
	ld [$D081],a
	pop hl
	inc hl
	ld a,[hl]
	ld [$D09E],a
	call $4000
	call $4ED7
	ld a,[$D087]
	dec a
	ld [$D087],a
	ret z
	ld a,[$D097]
	ld h,a
	ld a,[$D096]
	ld l,a
	ld a,[$D08B]
	cp a,4
	ld bc,3
	jr nz,.Next4EBC
	ld bc,$FFFD
.Next4EBC
	add hl,bc
	ld a,h
	ld [$D097],a
	ld a,l
	ld [$D096],a
	jp $4E73

INCBIN "baserom.gbc",$78EC8,$7986F - $78EC8

Func586F: ; 586F
	ld hl,MoveSoundTable
	ld e,a
	ld d,0
	add hl,de
	add hl,de
	add hl,de
	ld a,[hli]
	ld b,a
	call IsCryMove
	jr nc,.NotCryMove
	ld a,[H_WHOSETURN]
	and a
	jr nz,.next\@
	ld a,[$D014] ; get number of current monster
	jr .Continue\@
.next\@
	ld a,[$CFE5]
.Continue\@
	push hl
	call $13D9
	ld b,a
	pop hl
	ld a,[$C0F1]
	add [hl]
	ld [$C0F1],a
	inc hl
	ld a,[$C0F2]
	add [hl]
	ld [$C0F2],a
	jr .done\@
.NotCryMove
	ld a,[hli]
	ld [$C0F1],a
	ld a,[hli]
	ld [$C0F2],a
.done\@
	ld a,b
	ret
IsCryMove:
; set carry if the attack animation involves playing a monster cry
	ld a,[$D07C]
	cp a,GROWL
	jr z,.CryMove
	cp a,ROAR
	jr z,.CryMove
	and a ; clear carry
	ret
.CryMove
	scf
	ret

MoveSoundTable:
	db $a0,$00,$80
	db $a2,$10,$80
	db $b3,$00,$80
	db $a1,$01,$80
	db $a3,$00,$40
	db $e9,$00,$ff
	db $a3,$10,$60
	db $a3,$20,$80
	db $a3,$00,$a0
	db $a6,$00,$80
	db $a5,$20,$40
	db $a5,$00,$80
	db $a4,$00,$a0
	db $a7,$10,$c0
	db $a7,$00,$a0
	db $a8,$00,$c0
	db $a8,$10,$a0
	db $a9,$00,$e0
	db $a7,$20,$c0
	db $aa,$00,$80
	db $b9,$00,$80
	db $ab,$01,$80
	db $b7,$00,$80
	db $ad,$f0,$40
	db $b0,$00,$80
	db $ad,$00,$80
	db $b8,$10,$80
	db $b1,$01,$a0
	db $ae,$00,$80
	db $b4,$00,$60
	db $b4,$01,$40
	db $b6,$00,$a0
	db $b0,$10,$a0
	db $b7,$00,$c0
	db $aa,$10,$60
	db $b0,$00,$a0
	db $b9,$11,$c0
	db $b0,$20,$c0
	db $b8,$00,$80
	db $b1,$00,$80
	db $b1,$20,$c0
	db $af,$00,$80
	db $db,$ff,$40
	db $b4,$00,$80
	db $a1,$00,$c0
	db $a1,$00,$40
	db $e4,$00,$80
	db $bf,$40,$60
	db $bf,$00,$80
	db $bf,$ff,$40
	db $c7,$80,$c0
	db $af,$10,$a0
	db $af,$21,$e0
	db $c5,$00,$80
	db $bb,$20,$60
	db $c7,$00,$80
	db $cc,$00,$80
	db $c2,$40,$80
	db $c5,$f0,$e0
	db $cf,$00,$80
	db $c7,$f0,$60
	db $c2,$00,$80
	db $e6,$00,$80
	db $9d,$01,$a0
	db $a9,$f0,$20
	db $ba,$01,$c0
	db $ba,$00,$80
	db $b0,$00,$e0
	db $be,$01,$60
	db $be,$20,$40
	db $bb,$00,$80
	db $bb,$40,$c0
	db $b1,$03,$60
	db $bd,$11,$e0
	db $a8,$20,$e0
	db $d2,$00,$80
	db $b2,$00,$80
	db $b2,$11,$a0
	db $b2,$01,$c0
	db $a9,$14,$c0
	db $b1,$02,$a0
	db $c5,$f0,$80
	db $c5,$20,$c0
	db $d5,$00,$20
	db $d5,$20,$80
	db $d2,$12,$60
	db $be,$00,$80
	db $aa,$01,$e0
	db $c5,$0f,$e0
	db $c5,$11,$20
	db $a6,$10,$40
	db $a5,$10,$c0
	db $aa,$00,$20
	db $d8,$00,$80
	db $e4,$11,$18
	db $9f,$20,$c0
	db $9e,$20,$c0
	db $bd,$00,$10
	db $be,$f0,$20
	db $df,$f0,$c0
	db $a7,$f0,$e0
	db $9f,$f0,$40
	db $db,$00,$80
	db $df,$80,$40
	db $df,$00,$80
	db $aa,$11,$20
	db $aa,$22,$10
	db $b1,$f1,$ff
	db $a9,$f1,$ff
	db $aa,$33,$30
	db $dd,$40,$c0
	db $a4,$20,$20
	db $a4,$f0,$10
	db $a5,$f8,$10
	db $a7,$f0,$10
	db $bd,$00,$80
	db $ae,$00,$c0
	db $dd,$c0,$ff
	db $9f,$f2,$20
	db $e1,$00,$80
	db $e1,$00,$40
	db $9f,$00,$40
	db $a7,$10,$ff
	db $c7,$20,$20
	db $dd,$00,$80
	db $c5,$1f,$20
	db $bd,$2f,$80
	db $a5,$1f,$ff
	db $ca,$1f,$60
	db $be,$1e,$20
	db $be,$1f,$18
	db $aa,$0f,$80
	db $9f,$f8,$10
	db $9e,$18,$20
	db $dd,$08,$40
	db $ad,$01,$e0
	db $a7,$09,$ff
	db $e4,$42,$01
	db $b2,$00,$ff
	db $dd,$08,$e0
	db $bb,$00,$80
	db $9f,$88,$10
	db $bd,$48,$ff
	db $9e,$ff,$ff
	db $bb,$ff,$10
	db $9e,$ff,$04
	db $b2,$01,$ff
	db $a9,$f8,$ff
	db $a2,$f0,$f0
	db $a5,$08,$10
	db $a3,$f0,$ff
	db $b0,$f0,$ff
	db $e1,$10,$ff
	db $a4,$f0,$20
	db $ca,$f0,$60
	db $b8,$12,$10
	db $e6,$f0,$20
	db $b4,$12,$ff
	db $db,$80,$04
	db $df,$f0,$10
	db $c5,$f8,$ff
	db $be,$f0,$ff
	db $a7,$01,$ff
	db $cc,$d8,$04
	db $a1,$00,$80
	db $a1,$00,$80


INCBIN "baserom.gbc",$79AAE,$79E16 - $79AAE

TossBallAnimation: ; 5E16
	ld a,[W_ISINBATTLE]
	cp a,2
	jr z,.BlockBall\@ ; if in trainer battle, play different animation
	ld a,[$D11E]
	ld b,a

	; upper nybble: how many animations (from PokeBallAnimations) to play
	; this will be 4 for successful capture, 6 for breakout
	and a,$F0
	swap a
	ld c,a

	; lower nybble: number of shakes
	; store these for later
	ld a,b
	and a,$F
	ld [$CD3D],a

	ld hl,.PokeBallAnimations
	; choose which toss animation to use
	ld a,[$CF91]
	cp a,POKE_BALL
	ld b,TOSS_ANIM
	jr z,.done\@
	cp a,GREAT_BALL
	ld b,GREATTOSS_ANIM
	jr z,.done\@
	ld b,ULTRATOSS_ANIM
.done\@
	ld a,b
.PlayNextAnimation\@
	ld [$D07C],a
	push bc
	push hl
	call PlayAnimation
	pop hl
	ld a,[hli]
	pop bc
	dec c
	jr nz,.PlayNextAnimation\@
	ret

.PokeBallAnimations: ; 5E50
; sequence of animations that make up the Poké Ball toss
	db POOF_ANIM,HIDEPIC_ANIM,$C2,POOF_ANIM,SHOWPIC_ANIM

.BlockBall\@ ; 5E55
	ld a,$C1
	ld [$D07C],a
	call PlayAnimation
	ld a,$95
	call $23B1 ; play sound effect
	ld a,BLOCKBALL_ANIM
	ld [$D07C],a
	jp PlayAnimation

INCBIN "baserom.gbc",$79E6A,$7AF74 - $79E6A

PointerTable6F74: ; 6F74
	dw $7de7
	dw $7068
	dw $708d
	dw $70ce
	dw $70df
	dw $70f0
	dw $7101
	dw $7132
	dw $7173
	dw $71b4
	dw $71e5
	dw $7216
	dw $7227
	dw $7238
	dw $7259
	dw $726a
	dw $727b
	dw $729c
	dw $72bd
	dw $72ca
	dw $72db
	dw $72fc
	dw $732d
	dw $734e
	dw $735f
	dw $7364
	dw $736d
	dw $7376
	dw $737f
	dw $7388
	dw $7391
	dw $73ab
	dw $73b4
	dw $73cd
	dw $73fe
	dw $744b
	dw $745c
	dw $7465
	dw $7496
	dw $74a7
	dw $74bc
	dw $74d5
	dw $74e6
	dw $74f7
	dw $7500
	dw $7505
	dw $7526
	dw $7547
	dw $7558
	dw $7569
	dw $756e
	dw $758b
	dw $75a8
	dw $75ad
	dw $75c6
	dw $75d7
	dw $75e8
	dw $75f9
	dw $760a
	dw $761b
	dw $7630
	dw $7649
	dw $7666
	dw $7687
	dw $76a8
	dw $76b5
	dw $76c6
	dw $76f3
	dw $7720
	dw $7731
	dw $7742
	dw $7753
	dw $7764
	dw $7775
	dw $785a
	dw $786b
	dw $787c
	dw $788d
	dw $789e
	dw $78bf
	dw $78f0
	dw $7911
	dw $7932
	dw $7943
	dw $7950
	dw $7961
	dw $796e
	dw $7987
	dw $79ac
	dw $79c9
	dw $79ce
	dw $79ff
	dw $7a10
	dw $7a31
	dw $7a5e
	dw $7a9b
	dw $7aac
	dw $7acd
	dw $7afe
	dw $7b3f
	dw $7b58
	dw $7b71
	dw $7b8a
	dw $7b93
	dw $7b98
	dw $7ba9
	dw $7bae
	dw $7bcf
	dw $7bf0
	dw $7c11
	dw $7c1a
	dw $7c2b
	dw $7c3c
	dw $77b6
	dw $77f7
	dw $7828
	dw $7849
	dw $739a
	dw $7c4d
	dw $7c6a
	dw $7c7b
	dw $7c80

INCBIN "baserom.gbc",$7B068,$7C000 - $7B068

SECTION "bank1F",DATA,BANK[$1F]
INCBIN "baserom.gbc",$7C000,$4000

SECTION "bank20",DATA,BANK[$20]
INCBIN "baserom.gbc",$80000,$4000

SECTION "bank21",DATA,BANK[$21]
INCBIN "baserom.gbc",$84000,$4000

SECTION "bank22",DATA,BANK[$22]
INCBIN "baserom.gbc",$88000,$BE

_AIBattleWithdrawText:
	db 1
	dw $D04A
	db 0," with-",$4F,"drew @",1
	dw $CFDA
	db 0,"!",$58
_AIBattleUseItemText:
	db 1
	dw $D04A
	db 0,$4F,"used @",1
	dw $CD6D
	db 0,$55,"on @",1
	dw $CFDA
	db 0,"!",$58

INCBIN "baserom.gbc",$880EF,$89784 - $880EF

_TrainerAboutToUseText:
	db 1
	dw $D04A
	db 0," is",$4F
	db "about to use",$55,"@",1
	dw $CFDA
	db 0,"!",$51
	db "Will ",$52,$4F
	db "change #MON?",$57

_TrainerSentOutText:
	db 1
	dw $D04A
	db 0," sent",$4F
	db "out @",1
	dw $CFDA
	db 0,"!",$57

INCBIN "baserom.gbc",$897C9,$898AA - $897C9

_MultiHitText:
	db 0,"Hit the enemy",$4F,"@"
	TX_NUM W_NUMHITS,1,1
	db 0," times!",$58

_ScaredText:
	db 1
	dw $D009
	db 0," is too",$4F
	db "scared to move!",$58

_GetOutText:
	db 0,"GHOST: Get out...",$4F
	db "Get out...",$58

_FastAsleepText:
	db 0,$5A,$4F
	db "is fast asleep!",$58

_WokeUpText:
	db 0,$5A,$4F
	db "woke up!",$58

_FrozenText:
	db 0,$5A,$4F
	db "is frozen solid!",$58

_FullyParalyzedText:
	db 0,$5A,"'s",$4F
	db "fully paralyzed!",$58

_FlinchedText:
	db 0,$5A,$4F
	db "flinched!",$58

_MustRechargeText:
	db 0,$5A,$4F
	db "must recharge!",$58

_DisabledNoMoreText:
	db 0,$5A,"'s",$4F
	db "disabled no more!",$58

_IsConfusedText:
	db 0,$5A,$4F
	db "is confused!",$58

_HurtItselfText:
	db 0,"It hurt itself in",$4F
	db "its confusion!",$58

_ConfusedNoMoreText:
	db 0,$5A,"'s",$4F
	db "confused no more!",$58

_SavingEnergyText:
	db 0,$5A,$4F
	db "is saving energy!",$58

_UnleashedEnergyText:
	db 0,$5A,$4F
	db "unleashed energy!",$58

_ThrashingAboutText:
	db 0,$5A,"'s",$4F
	db "thrashing about!",$57

_AttackContinuesText:
	db 0,$5A,"'s",$4F
	db "attack continues!",$57

_CantMoveText:
	db 0,$5A,$4F
	db "can't move!",$58

INCBIN "baserom.gbc",$89A29,$8A425 - $89A29
INCLUDE "text/oakspeech.tx"

INCBIN "baserom.gbc",$8A605,$6696 - $6605

_Char00Text:
	TX_NUM $FF8C,1,2
	db 0," ERROR.",$57

_Char55Text:
	db 0,$4B,"@@"

INCBIN "baserom.gbc",$8A6A7,$8000 - $66A7

SECTION "bank23",DATA,BANK[$23]
INCBIN "baserom.gbc",$8C000,$4000

SECTION "bank24",DATA,BANK[$24]
INCBIN "baserom.gbc",$90000,$4000

SECTION "bank25",DATA,BANK[$25]
INCBIN "baserom.gbc",$94000,$B07

INCLUDE "text/mapRedsHouse1F.tx"
INCLUDE "text/mapBluesHouse.tx"

INCBIN "baserom.gbc",$94D5B,$4000 - $D5B

SECTION "bank26",DATA,BANK[$26]
INCBIN "baserom.gbc",$98000,$4000

SECTION "bank27",DATA,BANK[$27]
INCBIN "baserom.gbc",$9C000,$4000

SECTION "bank28",DATA,BANK[$28]
INCBIN "baserom.gbc",$A0000,$4000

SECTION "bank29",DATA,BANK[$29]
INCBIN "baserom.gbc",$A4000,$245

INCLUDE "text/mapPalletTown.tx"

INCBIN "baserom.gbc",$A43CC,$6729 - $43CC

_ItemUseBallText00:
	db 0,"It dodged the",$4F
	db "thrown BALL!",$51
	db "This #MON",$4F
	db "can't be caught!",$58

_ItemUseBallText01:
	db 0,"You missed the",$4F
	db "#MON!",$58

_ItemUseBallText02:
	db 0,"Darn! The #MON",$4F
	db "broke free!",$58

_ItemUseBallText03:
	db 0,"Aww! It appeared",$4F
	db "to be caught! ",$58

_ItemUseBallText04:
	db 0,"Shoot! It was so",$4F
	db "close too!",$58

_ItemUseBallText05:
	db 0,"All right!",$4F,"@",1
	dw $CFDA
	db 0," was",$55
	db "caught!@@"

_ItemUseBallText07:
	db 1
	dw $DE06
	db 0," was",$4F
	db "transferred to",$55
	db "BILL's PC!",$58

_ItemUseBallText08:
	db 1
	dw $DE06
	db 0," was",$4F
	db "transferred to",$55
	db "someone's PC!",$58

_ItemUseBallText06:
	db 0,"New #DEX data",$4F
	db "will be added for",$55,"@",1
	dw $CFDA
	db 0,"!@@"

INCBIN "baserom.gbc",$A685E,$4000 - $285E

SECTION "bank2A",DATA,BANK[$2A]

_ItemUseText001:
	db 0,$52," used@@"

_ItemUseText002:
	db 1
	dw $CF4B
	db 0,"!",$57

INCBIN "baserom.gbc",$A800F,$4000-$F

SECTION "bank2B",DATA,BANK[$2B]
INCLUDE "text/pokedex.tx"

SECTION "bank2C",DATA,BANK[$2C]

MoveNames: ; 4000
	db "POUND@"
	db "KARATE CHOP@"
	db "DOUBLESLAP@"
	db "COMET PUNCH@"
	db "MEGA PUNCH@"
	db "PAY DAY@"
	db "FIRE PUNCH@"
	db "ICE PUNCH@"
	db "THUNDERPUNCH@"
	db "SCRATCH@"
	db "VICEGRIP@"
	db "GUILLOTINE@"
	db "RAZOR WIND@"
	db "SWORDS DANCE@"
	db "CUT@"
	db "GUST@"
	db "WING ATTACK@"
	db "WHIRLWIND@"
	db "FLY@"
	db "BIND@"
	db "SLAM@"
	db "VINE WHIP@"
	db "STOMP@"
	db "DOUBLE KICK@"
	db "MEGA KICK@"
	db "JUMP KICK@"
	db "ROLLING KICK@"
	db "SAND-ATTACK@"
	db "HEADBUTT@"
	db "HORN ATTACK@"
	db "FURY ATTACK@"
	db "HORN DRILL@"
	db "TACKLE@"
	db "BODY SLAM@"
	db "WRAP@"
	db "TAKE DOWN@"
	db "THRASH@"
	db "DOUBLE-EDGE@"
	db "TAIL WHIP@"
	db "POISON STING@"
	db "TWINEEDLE@"
	db "PIN MISSILE@"
	db "LEER@"
	db "BITE@"
	db "GROWL@"
	db "ROAR@"
	db "SING@"
	db "SUPERSONIC@"
	db "SONICBOOM@"
	db "DISABLE@"
	db "ACID@"
	db "EMBER@"
	db "FLAMETHROWER@"
	db "MIST@"
	db "WATER GUN@"
	db "HYDRO PUMP@"
	db "SURF@"
	db "ICE BEAM@"
	db "BLIZZARD@"
	db "PSYBEAM@"
	db "BUBBLEBEAM@"
	db "AURORA BEAM@"
	db "HYPER BEAM@"
	db "PECK@"
	db "DRILL PECK@"
	db "SUBMISSION@"
	db "LOW KICK@"
	db "COUNTER@"
	db "SEISMIC TOSS@"
	db "STRENGTH@"
	db "ABSORB@"
	db "MEGA DRAIN@"
	db "LEECH SEED@"
	db "GROWTH@"
	db "RAZOR LEAF@"
	db "SOLARBEAM@"
	db "POISONPOWDER@"
	db "STUN SPORE@"
	db "SLEEP POWDER@"
	db "PETAL DANCE@"
	db "STRING SHOT@"
	db "DRAGON RAGE@"
	db "FIRE SPIN@"
	db "THUNDERSHOCK@"
	db "THUNDERBOLT@"
	db "THUNDER WAVE@"
	db "THUNDER@"
	db "ROCK THROW@"
	db "EARTHQUAKE@"
	db "FISSURE@"
	db "DIG@"
	db "TOXIC@"
	db "CONFUSION@"
	db "PSYCHIC@"
	db "HYPNOSIS@"
	db "MEDITATE@"
	db "AGILITY@"
	db "QUICK ATTACK@"
	db "RAGE@"
	db "TELEPORT@"
	db "NIGHT SHADE@"
	db "MIMIC@"
	db "SCREECH@"
	db "DOUBLE TEAM@"
	db "RECOVER@"
	db "HARDEN@"
	db "MINIMIZE@"
	db "SMOKESCREEN@"
	db "CONFUSE RAY@"
	db "WITHDRAW@"
	db "DEFENSE CURL@"
	db "BARRIER@"
	db "LIGHT SCREEN@"
	db "HAZE@"
	db "REFLECT@"
	db "FOCUS ENERGY@"
	db "BIDE@"
	db "METRONOME@"
	db "MIRROR MOVE@"
	db "SELFDESTRUCT@"
	db "EGG BOMB@"
	db "LICK@"
	db "SMOG@"
	db "SLUDGE@"
	db "BONE CLUB@"
	db "FIRE BLAST@"
	db "WATERFALL@"
	db "CLAMP@"
	db "SWIFT@"
	db "SKULL BASH@"
	db "SPIKE CANNON@"
	db "CONSTRICT@"
	db "AMNESIA@"
	db "KINESIS@"
	db "SOFTBOILED@"
	db "HI JUMP KICK@"
	db "GLARE@"
	db "DREAM EATER@"
	db "POISON GAS@"
	db "BARRAGE@"
	db "LEECH LIFE@"
	db "LOVELY KISS@"
	db "SKY ATTACK@"
	db "TRANSFORM@"
	db "BUBBLE@"
	db "DIZZY PUNCH@"
	db "SPORE@"
	db "FLASH@"
	db "PSYWAVE@"
	db "SPLASH@"
	db "ACID ARMOR@"
	db "CRABHAMMER@"
	db "EXPLOSION@"
	db "FURY SWIPES@"
	db "BONEMERANG@"
	db "REST@"
	db "ROCK SLIDE@"
	db "HYPER FANG@"
	db "SHARPEN@"
	db "CONVERSION@"
	db "TRI ATTACK@"
	db "SUPER FANG@"
	db "SLASH@"
	db "SUBSTITUTE@"
	db "STRUGGLE@"
