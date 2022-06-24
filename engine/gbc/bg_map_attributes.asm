LoadBGMapAttributes::
	ld hl, BGMapAttributesPointers
	ld c, d
	ld a, c ; c = which packet
	push af ; save for later (to determine if we're handling the trainer card or party menu)
	dec a         ; read this code as:
	add a         ;	dec a
	ld e, a       ; add a
	xor a         ; ld e, a
	ld d, a       ; ld d, 0
	add hl, de    ; add hl, de
	ld a, [hli]   ; ld a, [hli]
	ld e, a       ; ld h, [hl]
	ld a, [hl]    ; ld l, a
	ld h, a
	ld a, e
	ld l, a

	di
	ld a, $1
	ld [rVBK], a
	push hl
	ld a, [hl]
	ld c, a ; save attribute count for later
	ld de, $10
	add hl, de
	ld a, h
	ld [rHDMA1], a
	ld a, l
	ld [rHDMA2], a
	ld de, vBGMap0
	ld a, d
	ld [rHDMA3], a
	ld a, e
	ld [rHDMA4], a

	ld a, [rLCDC]
	and rLCDC_ENABLE_MASK ; is LCD off?
	jr z, .lcdOff ; if off, transfer immediately
; wait for VBlank if LCD is on
.waitForVBlankLoop1
	ld a, [rLY]
	cp $90
	jr nz, .waitForVBlankLoop1
.waitForAccessibleVRAMLoop1
	ld a, [rSTAT]
	and %10 ; are we in HBlank or VBlank?
	jr nz, .waitForAccessibleVRAMLoop1 ; loop until we're in a safe period to transfer to VRAM
.lcdOff
	ld a, c ; number of BG attributes to transfer, plus 1 times 16
	ld [rHDMA5], a ; initiate transfer
	call Func_3082 ; update audio so it doesn't "lag"
	pop hl
	ld a, [hli]
	ld c, a     ; number of BG attributes to transfer, plus 1 times 16
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a    ; offset of the attributes
	add hl, de ; hl = new pointer
	ld a, h
	ld [rHDMA1], a
	ld a, l
	ld [rHDMA2], a
	ld de, vBGMap1 ; copy to vBGMap1
	ld a, d
	ld [rHDMA3], a
	ld a, e
	ld [rHDMA4], a
; LCD check again
	ld a, [rLCDC]
	and rLCDC_ENABLE_MASK ; is LCD off?
	jr z, .lcdOff2 ; if off, transfer immediately
; wait for VBlank if LCD is on
.waitForVBlankLoop2
	ld a, [rLY]
	cp $90
	jr nz, .waitForVBlankLoop2
.waitForAccessibleVRAMLoop2
	ld a, [rSTAT]
	and %10 ; are we in HBlank or VBlank?
	jr nz, .waitForAccessibleVRAMLoop2 ; loop until we're in a safe period to transfer to VRAM
.lcdOff2
	ld a, c
	ld [rHDMA5], a
	pop af
	dec a
	dec a
	dec a
	dec a
	jr nz, .checkIfHandlingPartyMenu
	call HandleBadgeFaceAttributes
	jr .done
.checkIfHandlingPartyMenu
	dec a
	call z, HandlePartyHPBarAttributes
.done
	call Func_3082
	ld a, [rIF]
	res VBLANK, a
	ld [rIF], a
	xor a
	ld [rVBK], a
	ei
	ret

BGMapAttributesPointers:
	dw BGMapAttributes_Unknown1
	dw BGMapAttributes_Unknown2
	dw BGMapAttributes_GameFreakIntro
	dw BGMapAttributes_TrainerCard
	dw BGMapAttributes_PartyMenu
	dw BGMapAttributes_NidorinoIntro
	dw BGMapAttributes_TitleScreen
	dw BGMapAttributes_Slots
	dw BGMapAttributes_Pokedex
	dw BGMapAttributes_StatusScreen
	dw BGMapAttributes_Battle
	dw BGMapAttributes_WholeScreen
	dw BGMapAttributes_Unknown13

HandleBadgeFaceAttributes:
; zero out the attributes if the player doesn't have the respective badge
; BOULDERBADGE
	ld hl, vBGMap1 + $183
	ld de, wTrainerCardBadgeAttributes + 6 * 0
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
; CASCADEBADGE
	ld hl, vBGMap1 + $187
	ld de, wTrainerCardBadgeAttributes + 6 * 1
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
; THUNDERBADGE
	ld hl, vBGMap1 + $18b
	ld de, wTrainerCardBadgeAttributes + 6 * 2
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
; RAINBOWBADGE
	ld hl, vBGMap1 + $18f
	ld de, wTrainerCardBadgeAttributes + 6 * 3
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
; SOULBADGE
	ld hl, vBGMap1 + $1e3
	ld de, wTrainerCardBadgeAttributes + 6 * 6
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
; MARSHBADGE
	ld hl, vBGMap1 + $1e7
	ld de, wTrainerCardBadgeAttributes + 6 * 7
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
; VOLCANOBADGE
	ld hl, vBGMap1 + $1eb
	ld de, wTrainerCardBadgeAttributes + 6 * 8
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
; EARTHBADGE
	ld hl, vBGMap1 + $1ef
	ld de, wTrainerCardBadgeAttributes + 6 * 9
	ld a, [de]
	and a
	call z, ZeroOutCurrentBadgeAttributes
	ret

ZeroOutCurrentBadgeAttributes:
	push hl
	xor a
	ld [hli], a
	ld [hl], a
	ld bc, $1f
	add hl, bc
	ld [hli], a
	ld [hl], a
	pop hl
	ret

HandlePartyHPBarAttributes:
; hp bars require 3 (green, orange, red) colours, when there are only 2 "free" colours per palette
; therefore, we must transfer individual bg attributes where the locations of the hp bars are in vram
	ld hl, vBGMap1 + $25 ; location of start of the HP bar in vram
	ld de, wPartyHPBarAttributes
	ld c, PARTY_LENGTH
.loop
	push bc
	push hl
	ld a, [de]
	and $3 ; 4 possible palettes
	rept 7 ; hp bar length in tiles
	ld [hli], a
	endr
	pop hl
	ld bc, $40 ; get 2nd party location
	add hl, bc
	push hl

	;push de ; (inefficiently) copy de to hl
	;pop hl
	ld h, d
	ld l, e

	ld bc, $6
	add hl, bc ; get the next palette

	push hl
	pop de ; copy back to de

	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret
