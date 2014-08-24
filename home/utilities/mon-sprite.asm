LoadFlippedFrontSpriteByMonIndex:: ; 1384 (0:1384)
	ld a, $1
	ld [W_SPRITEFLIPPED], a

LoadFrontSpriteByMonIndex:: ; 1389 (0:1389)
	push hl
	ld a, [wd11e]
	push af
	ld a, [wcf91]
	ld [wd11e], a
	predef IndexToPokedex
	ld hl, wd11e
	ld a, [hl]
	pop bc
	ld [hl], b
	and a
	pop hl
	jr z, .invalidDexNumber  ; dex #0 invalid
	cp NUM_POKEMON + 1
	jr c, .validDexNumber    ; dex >#151 invalid
.invalidDexNumber
	ld a, RHYDON ; $1
	ld [wcf91], a
	ret
.validDexNumber
	push hl
	ld de, vFrontPic
	call LoadMonFrontSprite
	pop hl
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, Bank(asm_3f0d0)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	xor a
	ld [$ffe1], a
	call asm_3f0d0
	xor a
	ld [W_SPRITEFLIPPED], a
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret