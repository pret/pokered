LoadNicknameMonSprite:
    call DisableLCD
    xor a
    ld [hDownArrowBlinkCount1], a
    ld a, [wMonPartySpriteSpecies]
    ld de, vNPCSprites
    call LoadPartyMonSpriteIntoVRAM
    call FillPartyMonOAM
    call EnableLCD
    ld a, [hSpriteIndex]
    push af
    xor a
    ld [hSpriteIndex], a
    call ShowPartyMonSprite
    pop af
    ld [hSpriteIndex], a
    ret
	
LoadTradeMonSprite:
	call LoadNicknameMonSprite
	call AdjustForTradeScreen
	ret
	

LoadPartyMonSprites:
    call DisableLCD
    ld de, vNPCSprites
    ld hl, wPartySpecies
.loop
    ld a, [hli]
    cp $ff
    jr z, .done
    push hl
    call LoadPartyMonSpriteIntoVRAM
    pop hl
    jr .loop
.done
	call FillPartyMonOAM
    jp EnableLCD

LoadPartyMonSpriteIntoVRAM:
	push de
	call GetPartyMonSpriteID
    ld b, a
	xor a
	ld [hMultiplicand], a
	ld [hMultiplicand + 1], a
    ld a, b
	ld [hMultiplicand + 2], a
	ld a, $80
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 2]
	ld h, a
	ld a, [hProduct + 3]
	ld l, a	
	ld a, h
	add $40
	ld h, a
	ld a, BANK(PartyMonSprites1)
	pop de
	ld bc, $0080
	jp FarCopyData

GetPartyMonSpriteID:
    ld [wd11e], a
    predef IndexToPokedex
    ld a, [wd11e]
    dec a
    ld b, a
    ld a, [wSpriteOptions2]
    bit BIT_MENU_ICON_SPRITES, a
    jr z, .loadOldIcons
    jr .loadNewIcons
.loadOldIcons
    ld hl, MonPartyData
    jr .next
.loadNewIcons
    ld hl, MonPartyDataNew
.next
    ld a, b
    ld e, a
    ld d, 0
    add hl, de
    ld a, [hl]
    ret
	  
FillPartyMonOAM:
    push hl
    push de
    push bc
    ld hl, PartyMonOAM
    ld de, wOAMBuffer
    ld bc, $60
    call CopyData
    ld hl, PartyMonOAM
    ld de, wMonPartySpritesSavedOAM
    ld bc, $60
    call CopyData
    pop bc
    pop de
    pop hl
    ret

ShowPartyMonSprite:
    push hl
    push de
    push bc
    ld a, [hSpriteIndex]
    add a
    add a
    add a
    add a ;x16. a is $0 - $50 now.
	ld c, a ; store H_SPRITEINDEX * 8 for later.	
    ld hl, wOAMBuffer
    ld b, 0
    add hl, bc
    add $10 ; for OAM Y replacement
    ld de, $4
    ld [hl], a
    add hl, de
    ld [hl], a
    add hl, de
    add $8
    ld [hl], a
    add hl, de
    ld [hl], a
    add hl, de
    ; also update the saved OAM.
    ld hl, wOAMBuffer ; count back up to where we were
    ld b, 0
	; we haven't touched c yet so it's still H_SPRITEINDEX * 8.
    add hl, bc
	push hl
    ld hl, wMonPartySpritesSavedOAM
	add hl, bc
	push hl
	pop de
	pop hl
    ld bc, $10
    call CopyData
    pop bc
    pop de
    pop hl
    ret
	
AdjustForTradeScreen:
	ld hl, wOAMBuffer + $1 ;the x value of party sprite 1.
	ld de, $4
	ld b, e
.loopOAM
	ld a, [hl]
	inc a
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loopOAM
	ld hl, wMonPartySpritesSavedOAM + $1 ;the x value of party sprite 1.
	ld de, $4
	ld b, e
.loopSaved
	ld a, [hl]
	inc a
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loopSaved
	ret


	; fixme trade screen doesn't like our poke being offset to 15.
PartyMonOAM:
; all the Ys are set to be offscreen.
; placed at the proper y in ShowPartyMonSprite
    db 160,15,$00,$00
    db 160,23,$01,$00
    db 160,15,$04,$00
    db 160,23,$05,$00

    db 160,15,$08,$00
    db 160,23,$09,$00
    db 160,15,$0c,$00
    db 160,23,$0d,$00

    db 160,15,$10,$00
    db 160,23,$11,$00
    db 160,15,$14,$00
    db 160,23,$15,$00

    db 160,15,$18,$00
    db 160,23,$19,$00
    db 160,15,$1c,$00
    db 160,23,$1d,$00

    db 160,15,$20,$00
    db 160,23,$21,$00
    db 160,15,$24,$00
    db 160,23,$25,$00

    db 160,15,$28,$00
    db 160,23,$29,$00
    db 160,15,$2c,$00
    db 160,23,$2d,$00

INCLUDE "data/pokemon/menu_icons_new.asm"
INCLUDE "data/pokemon/menu_icons.asm"
