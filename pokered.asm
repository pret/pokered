INCLUDE "constants.asm"

SECTION "bank0",HOME[0]
INCBIN "baserom.gbc",$0,$9D

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
	dw $42a1 ; PALLET_TOWN
	dw $4357 ; VIRIDIAN_CITY
	dw $4554 ; PEWTER_CITY
	dw $474e ; CERULEAN_CITY
	dw $4000 ; LAVENDER_TOWN
	dw $4998 ; VERMILION_CITY
	dw $4000 ; CELADON_CITY
	dw $4ba7 ; FUCHSIA_CITY
	dw $4000 ; CINNABAR_ISLAND
	dw $491e ; INDIGO_PLATEAU
	dw $49a4 ; SAFFRON_CITY
	dw $49a4 ; unused
	dw $40c3 ; ROUTE_1
	dw $4000 ; ROUTE_2
	dw $41e6 ; ROUTE_3
	dw $4390 ; ROUTE_4
	dw $4581 ; ROUTE_5
	dw $4000 ; ROUTE_6
	dw $4000 ; ROUTE_7
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
	dw $415c ; REDS_HOUSE_1F
	dw $40a4
	dw $5b2f
	dw $4b02
	dw $4251
	dw $5462
	dw $5540
	dw $557d
	dw $4897
	dw $5ea4
	dw $557b
	dw $5ee1
	dw $55c8
	dw $5650
	dw $5101
	dw $40eb
	dw $430b
	dw $437b
	dw $55e7
	dw $4ca1
	dw $563c
	dw $457b
	dw $59bc
	dw $5a36
	dw $5cff
	dw $5679
	dw $56ea
	dw $4639
	dw $46a7
	dw $5730
	dw $4889
	dw $52c3
	dw $5679
	dw $5f27
	dw $569d
	dw $6243
	dw $6031
	dw $56e3
	dw $56e3
	dw $60f4
	dw $5720
	dw $575d
	dw $61bb
	dw $627d
	dw $53ae
	dw $44d0
	dw $62ba
	dw $5400
	dw $65ae
	dw $5448
	dw $54f8
	dw $675e
	dw $4983
	dw $5b64
	dw $49d5
	dw $4a1a
	dw $5af0
	dw $5b46
	dw $5259
	dw $5393
	dw $4926
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
	dw $4219
	dw $434a
	dw $43c9
	dw $45f4
	dw $4688
	dw $472e
	dw $4784
	dw $485f
	dw $5d2e
	dw $48ac
	dw $48fe
	dw $4bb1
	dw $505d
	dw $50e4
	dw $5145
	dw $5202
	dw $525d
	dw $48ce
	dw $4420
	dw $44e6
	dw $46c0
	dw $47ea
	dw $4926
	dw $4ae3
	dw $4cf9
	dw $589c
	dw $4920
	dw $59a2
	dw $5d7c
	dw $500c
	dw $5057
	dw $50a9
	dw $51c1
	dw $5431
	dw $56d7
	dw $6309
	dw $6445
	dw $6581
	dw $678d
	dw $6064
	dw $6170
	dw $42a3
	dw $573e
	dw $5b80
	dw $5c15
	dw $5c7b
	dw $5d25
	dw $5e20
	dw $5e72
	dw $5e72
	dw $5c4f
	dw $5eb7
	dw $4c65
	dw $4d51
	dw $5001
	dw $5dd1
	dw $53fd
	dw $5442
	dw $5529
	dw $5e30
	dw $55f6
	dw $563e
	dw $56b2
	dw $57ff
	dw $65ec
	dw $6473
	dw $586a
	dw $5969
	dw $47dd
	dw $6677
	dw $5791
	dw $5554
	dw $5c06
	dw $5f62
	dw $4974
	dw $4bbe
	dw $4e1b
	dw $5219
	dw $5451
	dw $5704
	dw $5704
	dw $5704
	dw $5704
	dw $5ce5
	dw $5f4f
	dw $5cff
	dw $5f2b
	dw $619d
	dw $5b55
	dw $64f8
	dw $5fcc
	dw $61e2
	dw $63ad
	dw $585f
	dw $599f
	dw $61a9
	dw $5ba6
	dw $5ce1
	dw $630b
	dw $5d1e
	dw $5d69
	dw $5db4
	dw $5dff
	dw $5ee4
	dw $4d00
	dw $5a06
	dw $4dfd
	dw $56b2
	dw $5fdf
	dw $57af
	dw $612d
	dw $60ee
	dw $57b4
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

incbin "baserom.gbc",$39E,$1627 - $39E


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
; index == Mew, bank 1
; index == Kabutops fossil, bank $B
;	index < $1F, bank 9
; $1F <= index < $4A, bank $A
; $4A <= index < $74, bank $B
; $74 <= index < $99, bank $C
; $99 <= index,       bank $D
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

INCBIN "baserom.gbc",$1665,$190F - $1665

ClearScreen: ; 190F
; clears all tiles in the tilemap,
; then (writes 1 to $FFD3, waits for it to become 0) three times (XXX why?)
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

INCBIN "baserom.gbc",$1922,$20AF - $1922

ConserveBattery: ; 20AF
; loads 1 into $FFD6 and returns when $FFD6 == 0
; delays by halting to conserve battery power
; XXX what zeroes $FFD6?
	ld a,1
	ld [$FFD6],a
.halt\@
	db $76 ; XXX this is a hack--rgbasm adds a nop after this instr
	       ; even when ints are enabled
	ld a,[$FFD6]
	and a
	jr nz,.halt\@
	ret

INCBIN "baserom.gbc",$20BA,$2442 - $20BA

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
	ld a,4
	ld [$D0B6],a
	ld a,1
	ld [$D0B7],a
	call $376B
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
	ld a,$50 ; text null
	ld [de],a

	pop af
	ld [$D11E],a
	pop bc
	pop de
	pop hl
	ret

TechnicalPrefix:
	db $93,$8C ; "TM"
HiddenPrefix:
	db $87,$8C ; "HM"

INCBIN "baserom.gbc",$3040,$35BC - $3040
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

INCBIN "baserom.gbc",$35EC,$3739 - $35EC

Delay: ; 3739
; wait n times, where n is the value in c
	call ConserveBattery
	dec c
	jr nz,Delay
	ret

INCBIN "baserom.gbc",$3740,$3A87 - $3740

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
	call $3DD7
	pop hl
	ld bc,$C4B9
	jp $1B40

INCBIN "baserom.gbc",$3C5F,$3DD7 - $3C5F
Delay3: ; 3DD7
; call Delay with a parameter of 3
	ld c,3
	jp Delay

INCBIN "baserom.gbc",$3DDC,$3E6D - $3DDC

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
INCBIN "baserom.gbc",$4000,$2115

OakSpeech: ; 6115
	ld a,$FF
	call $23B1
	ld a,2
	ld c,a
	ld a,$EF    ; song #
	call $23A1  ; plays music?
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
	call $62CE
	xor a
	ld [$FFD7],a
	ld a,[$D732]
	bit 1,a
	jp nz,$61BC
	ld de,$615F
	ld bc,$1300
	call $62A4   ; displays Oak sprite?
	call $6271   ; fades in the sprite?
	ld hl,HelloWelcomeText
	call PrintText      ; prints text box
	call $20D8
	call ClearScreen
	ld a,NIDORINO
	ld [$D0B5],a    ; sprite displayed is stored at this location
	ld [$CF91],a
	call $1537      ; this is also related to the sprite
	ld hl,$C3F6     ; position on tilemap the sprite is displayed
	call $1384      ; displays sprite?
	call $6288
	ld hl,WorldFilledWithText
	call PrintText      ; Prints text box
	call $20D8
	call ClearScreen
	ld de,$6EDE
	ld bc,$0400     ; affects the position of the player sprite
	call $62A4      ; displays player sprite?
	call $6288
	ld hl,FirstWhatIsYourNameText
	call PrintText
	call $695D ; brings up NewName/Red/etc menu
	call $20D8
	call ClearScreen
	ld de,$6049
	ld bc,$1300
	call $62A4 ; displays rival sprite
	call $6271
	ld hl,ThisIsMyGrandsonText
	call PrintText
	call $69A4
	call $20D8
	call ClearScreen
	ld de,$6EDE
	ld bc,$0400
	call $62A4
	call $20F6
	ld a,[$D72D]
	and a
	jr nz,.next\@
	ld hl,YourOwnLegendText
	call PrintText
.next\@	ld a,[$FFB8]
	push af
	ld a,$9C
	call $23B1
	pop af
	ld [$FFB8],a
	ld [$2000],a
	ld c,4
	call Delay
	ld de,$4180
	ld hl,$8000
	ld bc,$050C
	call $1848
	ld de,$6FE8
	ld bc,$0400
	call $62A4
	ld c,4
	call Delay
	ld de,$7042
	ld bc,$0400
	call $62A4
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
	call $23B1
	pop af
	ld [$FFB8],a
	ld [$2000],a
	ld c,$14
	call Delay
	ld hl,$C40A
	ld b,7
	ld c,7
	call $18C4
	call $36A0
	ld a,1
	ld [$CFCB],a
	ld c,$32
	call Delay
	call $20D8
	jp ClearScreen
HelloWelcomeText:
	db $17,$25,$64,$22,$50 ; "Hello welcome to the world of pokemon ..."
WorldFilledWithText:
	db $17,$7F,$64,$22,$14,$17,$B3,$64,$22,$50 ; "This world is filled with creatures ..."
FirstWhatIsYourNameText:
	db $17,$19,$65,$22,$50 ; "First, what is your name?"
ThisIsMyGrandsonText:
	db $17,$34,$65,$22,$50 ; "This is my grandson ..."
YourOwnLegendText:
	db $17,$97,$65,$22,$50 ; "Ninten! Your very own legend ..."
INCBIN "baserom.gbc",$6271,$1D8F


SECTION "bank2",DATA,BANK[$2]
INCBIN "baserom.gbc",$8000,$4000

SECTION "bank3",DATA,BANK[$3]
INCBIN "baserom.gbc",$C000,$C23D - $C000

; see also MapHeaderPointers
MapHeaderBanks: ; 423D
	db $06 ; PALLET_TOWN
	db $06 ; VIRIDIAN_CITY
	db $06 ; PEWTER_CITY
	db $06 ; CERULEAN_CITY
	db $11 ; LAVENDER_TOWN
	db $06 ; VERMILION_CITY
	db $06 ; CELADON_CITY
	db $06 ; FUCHSIA_CITY
	db $07 ; CINNABAR_ISLAND
	db $14 ; INDIGO_PLATEAU
	db $14 ; SAFFRON_CITY
	db $01 ; unused
	db $07 ; ROUTE_1
	db $15 ; ROUTE_2
	db $15 ; ROUTE_3
	db $15 ; ROUTE_4
	db $15 ; ROUTE_5
	db $16 ; ROUTE_6
	db $12 ; ROUTE_7
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
	db $12 ; REDS_HOUSE_1F
	db $17
	db $06
	db $07
	db $11
	db $07
	db $07
	db $07
	db $1D
	db $07
	db $17
	db $07
	db $17
	db $17
	db $18
	db $17
	db $17
	db $17
	db $07
	db $1D
	db $07
	db $17
	db $12
	db $14
	db $12
	db $07
	db $07
	db $17
	db $17
	db $07
	db $17
	db $12
	db $07
	db $07
	db $17
	db $15
	db $07
	db $17
	db $17
	db $07
	db $17
	db $17
	db $07
	db $07
	db $12
	db $11
	db $07
	db $12
	db $07
	db $12
	db $12
	db $07
	db $17
	db $16
	db $17
	db $17
	db $07
	db $07
	db $18
	db $18
	db $11
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
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $07
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $17
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $07
	db $17
	db $07
	db $07
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $11
	db $11
	db $11
	db $11
	db $15
	db $15
	db $11
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
	db $07
	db $17
	db $17
	db $17
	db $07
	db $12
	db $12
	db $12
	db $12
	db $07
	db $15
	db $12
	db $12
	db $11
	db $07
	db $14
	db $12
	db $06
	db $18
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $01
	db $01
	db $01
	db $16
	db $16
	db $06
	db $06
	db $06
	db $14
	db $15
	db $14
	db $14
	db $14
	db $11
	db $11
	db $12
	db $11
	db $11
	db $12
	db $11
	db $11
	db $11
	db $11
	db $11
	db $1D
	db $07
	db $1D
	db $01
	db $11
	db $17
	db $16
	db $18
	db $11
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

INCBIN "baserom.gbc",$C335,$CEB8 - $C335

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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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
	db $0F
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



INCBIN "baserom.gbc",$D5C7,$10000 - $D5C7

SECTION "bank4",DATA,BANK[$4]
INCBIN "baserom.gbc",$10000,$4000

SECTION "bank5",DATA,BANK[$5]
INCBIN "baserom.gbc",$14000,$4000

SECTION "bank6",DATA,BANK[$6]
INCBIN "baserom.gbc",$18000,$4000

SECTION "bank7",DATA,BANK[$7]
INCBIN "baserom.gbc",$1C000,$4000

SECTION "bank8",DATA,BANK[$8]
INCBIN "baserom.gbc",$20000,$4000

SECTION "bank9",DATA,BANK[$9]
INCBIN "baserom.gbc",$24000,$4000

SECTION "bankA",DATA,BANK[$A]
INCBIN "baserom.gbc",$28000,$4000

SECTION "bankB",DATA,BANK[$B]
INCBIN "baserom.gbc",$2C000,$4000

SECTION "bankC",DATA,BANK[$C]
INCBIN "baserom.gbc",$30000,$4000

SECTION "bankD",DATA,BANK[$D]
INCBIN "baserom.gbc",$34000,$4000

SECTION "bankE",DATA,BANK[$E]
INCBIN "baserom.gbc",$38000,$1C53

; trainer data: from 5C53 to 652E

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
	ld a,[W_ISTRAINERBATTLE]
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
	ld a,[$CCDF] ; XXX 340b0,3a548,3a553,3a696,3c943,3ef74
	and a
	ret z ; if XXX, we're done here
	inc hl
	inc a
	jr nz,.getpointer\@
	dec hl
	ld a,[hli]
	ld [$CCDF],a
.getpointer\@
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call $3E5C
	jp [hl]

TrainerAIPointers: ; 655C
; one entry per trainer class
; XXX first byte, ???
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
	and a
	ret

; end of individual trainer AI routines

Function6695: ; 6695
; XXX what does this do
	ld hl,$CCDF
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
	jp $6695

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
	TX_NULL

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
	jp $6695

AIPrintItemUse:
	ld [$CF05],a
	call AIPrintItemUse_
	jp $6695

AIPrintItemUse_:
; print "x used [$CF05] on z!"
	ld a,[$CF05]
	ld [$D11E],a
	call GetItemName
	ld hl,AIBattleUseItemText
	jp PrintText

AIBattleUseItemText:
	TX_FAR _AIBattleUseItemText
	TX_NULL


INCBIN "baserom.gbc",$3A849,$3C000 - $3A849

SECTION "bankF",DATA,BANK[$F]
INCBIN "baserom.gbc",$3C000,$90E

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
	ld [$CCDF],a
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
	ld a,[$D163]
	dec a
	jr z,.next4\@
	ld a,[$D12B]
	cp 4
	jr z,.next4\@
	ld a,[$D355]
	bit 6,a
	jr nz,.next4\@
	ld hl,$4A79
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
	ld hl,$4A7E
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

	db $17
	dw $5784
	db $22
	db $50
	db $17
	dw $57B4
	db $22
	db $50

INCBIN "baserom.gbc",$3CA83,$40000 - $3CA83

SECTION "bank10",DATA,BANK[$10]
INCBIN "baserom.gbc",$40000,$1024
PokedexOrder: ; 5024
	db DEX_RHYDON     ; RHYDON
	db DEX_KANGASKHAN ; KANGASKHAN
	db DEX_NIDORAN_M  ; NIDORAN_M
	db DEX_CLEFAIRY   ; CLEFAIRY
	db DEX_SPEAROW    ; SPEAROW
	db DEX_VOLTORB    ; VOLTORB
	db DEX_NIDOKING   ; NIDOKING
	db DEX_SLOWBRO    ; SLOWBRO
	db DEX_IVYSAUR    ; IVYSAUR
	db DEX_EXEGGUTOR  ; EXEGGUTOR
	db DEX_LICKITUNG  ; LICKITUNG
	db DEX_EXEGGCUTE  ; EXEGGCUTE
	db DEX_GRIMER     ; GRIMER
	db DEX_GENGAR     ; GENGAR
	db DEX_NIDORAN_F  ; NIDORAN_F
	db DEX_NIDOQUEEN  ; NIDOQUEEN
	db DEX_CUBONE     ; CUBONE
	db DEX_RHYHORN    ; RHYHORN
	db DEX_LAPRAS     ; LAPRAS
	db DEX_ARCANINE   ; ARCANINE
	db DEX_MEW	; MEW
	db DEX_GYARADOS   ; GYARADOS
	db DEX_SHELLDER   ; SHELLDER
	db DEX_TENTACOOL  ; TENTACOOL
	db DEX_GASTLY     ; GASTLY
	db DEX_SCYTHER    ; SCYTHER
	db DEX_STARYU     ; STARYU
	db DEX_BLASTOISE  ; BLASTOISE
	db DEX_PINSIR     ; PINSIR
	db DEX_TANGELA    ; TANGELA
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_GROWLITHE  ; GROWLITHE
	db DEX_ONIX       ; ONIX
	db DEX_FEAROW     ; FEAROW
	db DEX_PIDGEY     ; PIDGEY
	db DEX_SLOWPOKE   ; SLOWPOKE
	db DEX_KADABRA    ; KADABRA
	db DEX_GRAVELER   ; GRAVELER
	db DEX_CHANSEY    ; CHANSEY
	db DEX_MACHOKE    ; MACHOKE
	db DEX_MR__MIME   ; MR__MIME
	db DEX_HITMONLEE  ; HITMONLEE
	db DEX_HITMONCHAN ; HITMONCHAN
	db DEX_ARBOK      ; ARBOK
	db DEX_PARASECT   ; PARASECT
	db DEX_PSYDUCK    ; PSYDUCK
	db DEX_DROWZEE    ; DROWZEE
	db DEX_GOLEM      ; GOLEM
	db 0	      ; MISSINGNO.
	db DEX_MAGMAR     ; MAGMAR
	db 0	      ; MISSINGNO.
	db DEX_ELECTABUZZ ; ELECTABUZZ
	db DEX_MAGNETON   ; MAGNETON
	db DEX_KOFFING    ; KOFFING
	db 0	      ; MISSINGNO.
	db DEX_MANKEY     ; MANKEY
	db DEX_SEEL       ; SEEL
	db DEX_DIGLETT    ; DIGLETT
	db DEX_TAUROS     ; TAUROS
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_FARFETCH_D ; FARFETCH_D
	db DEX_VENONAT    ; VENONAT
	db DEX_DRAGONITE  ; DRAGONITE
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_DODUO      ; DODUO
	db DEX_POLIWAG    ; POLIWAG
	db DEX_JYNX       ; JYNX
	db DEX_MOLTRES    ; MOLTRES
	db DEX_ARTICUNO   ; ARTICUNO
	db DEX_ZAPDOS     ; ZAPDOS
	db DEX_DITTO      ; DITTO
	db DEX_MEOWTH     ; MEOWTH
	db DEX_KRABBY     ; KRABBY
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_VULPIX     ; VULPIX
	db DEX_NINETALES  ; NINETALES
	db DEX_PIKACHU    ; PIKACHU
	db DEX_RAICHU     ; RAICHU
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_DRATINI    ; DRATINI
	db DEX_DRAGONAIR  ; DRAGONAIR
	db DEX_KABUTO     ; KABUTO
	db DEX_KABUTOPS   ; KABUTOPS
	db DEX_HORSEA     ; HORSEA
	db DEX_SEADRA     ; SEADRA
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_SANDSHREW  ; SANDSHREW
	db DEX_SANDSLASH  ; SANDSLASH
	db DEX_OMANYTE    ; OMANYTE
	db DEX_OMASTAR    ; OMASTAR
	db DEX_JIGGLYPUFF ; JIGGLYPUFF
	db DEX_WIGGLYTUFF ; WIGGLYTUFF
	db DEX_EEVEE      ; EEVEE
	db DEX_FLAREON    ; FLAREON
	db DEX_JOLTEON    ; JOLTEON
	db DEX_VAPOREON   ; VAPOREON
	db DEX_MACHOP     ; MACHOP
	db DEX_ZUBAT      ; ZUBAT
	db DEX_EKANS      ; EKANS
	db DEX_PARAS      ; PARAS
	db DEX_POLIWHIRL  ; POLIWHIRL
	db DEX_POLIWRATH  ; POLIWRATH
	db DEX_WEEDLE     ; WEEDLE
	db DEX_KAKUNA     ; KAKUNA
	db DEX_BEEDRILL   ; BEEDRILL
	db 0	      ; MISSINGNO.
	db DEX_DODRIO     ; DODRIO
	db DEX_PRIMEAPE   ; PRIMEAPE
	db DEX_DUGTRIO    ; DUGTRIO
	db DEX_VENOMOTH   ; VENOMOTH
	db DEX_DEWGONG    ; DEWGONG
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_CATERPIE   ; CATERPIE
	db DEX_METAPOD    ; METAPOD
	db DEX_BUTTERFREE ; BUTTERFREE
	db DEX_MACHAMP    ; MACHAMP
	db 0	      ; MISSINGNO.
	db DEX_GOLDUCK    ; GOLDUCK
	db DEX_HYPNO      ; HYPNO
	db DEX_GOLBAT     ; GOLBAT
	db DEX_MEWTWO     ; MEWTWO
	db DEX_SNORLAX    ; SNORLAX
	db DEX_MAGIKARP   ; MAGIKARP
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_MUK	; MUK
	db 0	      ; MISSINGNO.
	db DEX_KINGLER    ; KINGLER
	db DEX_CLOYSTER   ; CLOYSTER
	db 0	      ; MISSINGNO.
	db DEX_ELECTRODE  ; ELECTRODE
	db DEX_CLEFABLE   ; CLEFABLE
	db DEX_WEEZING    ; WEEZING
	db DEX_PERSIAN    ; PERSIAN
	db DEX_MAROWAK    ; MAROWAK
	db 0	      ; MISSINGNO.
	db DEX_HAUNTER    ; HAUNTER
	db DEX_ABRA       ; ABRA
	db DEX_ALAKAZAM   ; ALAKAZAM
	db DEX_PIDGEOTTO  ; PIDGEOTTO
	db DEX_PIDGEOT    ; PIDGEOT
	db DEX_STARMIE    ; STARMIE
	db DEX_BULBASAUR  ; BULBASAUR
	db DEX_VENUSAUR   ; VENUSAUR
	db DEX_TENTACRUEL ; TENTACRUEL
	db 0	      ; MISSINGNO.
	db DEX_GOLDEEN    ; GOLDEEN
	db DEX_SEAKING    ; SEAKING
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_PONYTA     ; PONYTA
	db DEX_RAPIDASH   ; RAPIDASH
	db DEX_RATTATA    ; RATTATA
	db DEX_RATICATE   ; RATICATE
	db DEX_NIDORINO   ; NIDORINO
	db DEX_NIDORINA   ; NIDORINA
	db DEX_GEODUDE    ; GEODUDE
	db DEX_PORYGON    ; PORYGON
	db DEX_AERODACTYL ; AERODACTYL
	db 0	      ; MISSINGNO.
	db DEX_MAGNEMITE  ; MAGNEMITE
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_CHARMANDER ; CHARMANDER
	db DEX_SQUIRTLE   ; SQUIRTLE
	db DEX_CHARMELEON ; CHARMELEON
	db DEX_WARTORTLE  ; WARTORTLE
	db DEX_CHARIZARD  ; CHARIZARD
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db 0	      ; MISSINGNO.
	db DEX_ODDISH     ; ODDISH
	db DEX_GLOOM      ; GLOOM
	db DEX_VILEPLUME  ; VILEPLUME
	db DEX_BELLSPROUT ; BELLSPROUT
	db DEX_WEEPINBELL ; WEEPINBELL
	db DEX_VICTREEBEL ; VICTREEBEL
INCBIN "baserom.gbc",$410E2,$4000 - $10E2

SECTION "bank11",DATA,BANK[$11]
INCBIN "baserom.gbc",$44000,$4000

SECTION "bank12",DATA,BANK[$12]
INCBIN "baserom.gbc",$48000,$4000

SECTION "bank13",DATA,BANK[$13]
INCBIN "baserom.gbc",$4C000,$3E49

GetPredefPointer:
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
        dbw $1E,$4D5E
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
        dbw $03,$78A5
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
        dbw $01,$62A1
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
INCBIN "baserom.gbc",$50000,$4000

SECTION "bank15",DATA,BANK[$15]
INCBIN "baserom.gbc",$54000,$4000

SECTION "bank16",DATA,BANK[$16]
INCBIN "baserom.gbc",$58000,$4000

SECTION "bank17",DATA,BANK[$17]
INCBIN "baserom.gbc",$5C000,$4000

SECTION "bank18",DATA,BANK[$18]
INCBIN "baserom.gbc",$60000,$4000

SECTION "bank19",DATA,BANK[$19]
INCBIN "baserom.gbc",$64000,$4000

SECTION "bank1A",DATA,BANK[$1A]
INCBIN "baserom.gbc",$68000,$4000

SECTION "bank1B",DATA,BANK[$1B]
INCBIN "baserom.gbc",$6C000,$4000

SECTION "bank1C",DATA,BANK[$1C]
INCBIN "baserom.gbc",$70000,$25C8

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
INCBIN "baserom.gbc",$74000,$4000

SECTION "bank1E",DATA,BANK[$1E]
INCBIN "baserom.gbc",$78000,$4000

SECTION "bank1F",DATA,BANK[$1F]
INCBIN "baserom.gbc",$7C000,$4000

SECTION "bank20",DATA,BANK[$20]
INCBIN "baserom.gbc",$80000,$4000

SECTION "bank21",DATA,BANK[$21]
INCBIN "baserom.gbc",$84000,$4000

SECTION "bank22",DATA,BANK[$22]
INCBIN "baserom.gbc",$88000,$BE

_AIBattleWithdrawText:
	INCBIN "baserom.gbc",$880BE,$17
_AIBattleUseItemText:
	INCBIN "baserom.gbc",$880D5,$1A

INCBIN "baserom.gbc",$880EF,$2C0A

SECTION "bank23",DATA,BANK[$23]
INCBIN "baserom.gbc",$8C000,$4000

SECTION "bank24",DATA,BANK[$24]
INCBIN "baserom.gbc",$90000,$4000

SECTION "bank25",DATA,BANK[$25]
INCBIN "baserom.gbc",$94000,$4000

SECTION "bank26",DATA,BANK[$26]
INCBIN "baserom.gbc",$98000,$4000

SECTION "bank27",DATA,BANK[$27]
INCBIN "baserom.gbc",$9C000,$4000

SECTION "bank28",DATA,BANK[$28]
INCBIN "baserom.gbc",$A0000,$4000

SECTION "bank29",DATA,BANK[$29]
INCBIN "baserom.gbc",$A4000,$4000

SECTION "bank2A",DATA,BANK[$2A]
INCBIN "baserom.gbc",$A8000,$4000

SECTION "bank2B",DATA,BANK[$2B]
INCBIN "baserom.gbc",$AC000,$4000

SECTION "bank2C",DATA,BANK[$2C]
INCBIN "baserom.gbc",$B0000,$4000
