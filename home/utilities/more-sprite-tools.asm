; uncompresses the front or back sprite of the specified mon
; assumes the corresponding mon header is already loaded
; hl contains offset to sprite pointer ($b for front or $d for back)
UncompressMonSprite:: ; 1627 (0:1627)
	ld bc,W_MONHEADER
	add hl,bc
	ld a,[hli]
	ld [W_SPRITEINPUTPTR],a    ; fetch sprite input pointer
	ld a,[hl]
	ld [W_SPRITEINPUTPTR+1],a
; define (by index number) the bank that a pokemon's image is in
; index = Mew, bank 1
; index = Kabutops fossil, bank $B
;	index < $1F, bank 9
; $1F ≤ index < $4A, bank $A
; $4A ≤ index < $74, bank $B
; $74 ≤ index < $99, bank $C
; $99 ≤ index,       bank $D
	ld a,[wcf91] ; XXX name for this ram location
	ld b,a
	cp MEW
	ld a,BANK(MewPicFront)
	jr z,.GotBank
	ld a,b
	cp FOSSIL_KABUTOPS
	ld a,BANK(FossilKabutopsPic)
	jr z,.GotBank
	ld a,b
	cp TANGELA + 1
	ld a,BANK(TangelaPicFront)
	jr c,.GotBank
	ld a,b
	cp MOLTRES + 1
	ld a,BANK(MoltresPicFront)
	jr c,.GotBank
	ld a,b
	cp BEEDRILL + 2
	ld a,BANK(BeedrillPicFront)
	jr c,.GotBank
	ld a,b
	cp STARMIE + 1
	ld a,BANK(StarmiePicFront)
	jr c,.GotBank
	ld a,BANK(VictreebelPicFront)
.GotBank
	jp UncompressSpriteData

; de: destination location
LoadMonFrontSprite:: ; 1665 (0:1665)
	push de
	ld hl, W_MONHFRONTSPRITE - W_MONHEADER
	call UncompressMonSprite
	ld hl, W_MONHSPRITEDIM
	ld a, [hli]
	ld c, a
	pop de
	; fall through

; postprocesses uncompressed sprite chunks to a 2bpp sprite and loads it into video ram
; calculates alignment parameters to place both sprite chunks in the center of the 7*7 tile sprite buffers
; de: destination location
; a,c:  sprite dimensions (in tiles of 8x8 each)
LoadUncompressedSpriteData:: ; 1672 (0:1672)
	push de
	and $f
	ld [H_SPRITEWIDTH], a ; each byte contains 8 pixels (in 1bpp), so tiles=bytes for width
	ld b, a
	ld a, $7
	sub b      ; 7-w
	inc a      ; 8-w
	srl a      ; (8-w)/2     ; horizontal center (in tiles, rounded up)
	ld b, a
	add a
	add a
	add a
	sub b      ; 7*((8-w)/2) ; skip for horizontal center (in tiles)
	ld [H_SPRITEOFFSET], a
	ld a, c
	swap a
	and $f
	ld b, a
	add a
	add a
	add a     ; 8*tiles is height in bytes
	ld [H_SPRITEHEIGHT], a ; $ff8c
	ld a, $7
	sub b      ; 7-h         ; skip for vertical center (in tiles, relative to current column)
	ld b, a
	ld a, [H_SPRITEOFFSET]
	add b     ; 7*((8-w)/2) + 7-h ; combined overall offset (in tiles)
	add a
	add a
	add a     ; 8*(7*((8-w)/2) + 7-h) ; combined overall offset (in bytes)
	ld [H_SPRITEOFFSET], a
	xor a
	ld [$4000], a
	ld hl, S_SPRITEBUFFER0
	call ZeroSpriteBuffer   ; zero buffer 0
	ld de, S_SPRITEBUFFER1
	ld hl, S_SPRITEBUFFER0
	call AlignSpriteDataCentered    ; copy and align buffer 1 to 0 (containing the MSB of the 2bpp sprite)
	ld hl, S_SPRITEBUFFER1
	call ZeroSpriteBuffer   ; zero buffer 1
	ld de, S_SPRITEBUFFER2
	ld hl, S_SPRITEBUFFER1
	call AlignSpriteDataCentered    ; copy and align buffer 2 to 1 (containing the LSB of the 2bpp sprite)
	pop de
	jp InterlaceMergeSpriteBuffers

; copies and aligns the sprite data properly inside the sprite buffer
; sprite buffers are 7*7 tiles in size, the loaded sprite is centered within this area
AlignSpriteDataCentered:: ; 16c2 (0:16c2)
	ld a, [H_SPRITEOFFSET]
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [H_SPRITEWIDTH] ; $ff8b
.columnLoop
	push af
	push hl
	ld a, [H_SPRITEHEIGHT] ; $ff8c
	ld c, a
.columnInnerLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .columnInnerLoop
	pop hl
	ld bc, 7*8    ; 7 tiles
	add hl, bc    ; advance one full column
	pop af
	dec a
	jr nz, .columnLoop
	ret

; fills the sprite buffer (pointed to in hl) with zeros
ZeroSpriteBuffer:: ; 16df (0:16df)
	ld bc, SPRITEBUFFERSIZE
.nextByteLoop
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .nextByteLoop
	ret

; combines the (7*7 tiles, 1bpp) sprite chunks in buffer 0 and 1 into a 2bpp sprite located in buffer 1 through 2
; in the resulting sprite, the rows of the two source sprites are interlaced
; de: output address
InterlaceMergeSpriteBuffers:: ; 16ea (0:16ea)
	xor a
	ld [$4000], a
	push de
	ld hl, S_SPRITEBUFFER2 + (SPRITEBUFFERSIZE - 1) ; destination: end of buffer 2
	ld de, S_SPRITEBUFFER1 + (SPRITEBUFFERSIZE - 1) ; source 2: end of buffer 1
	ld bc, S_SPRITEBUFFER0 + (SPRITEBUFFERSIZE - 1) ; source 1: end of buffer 0
	ld a, SPRITEBUFFERSIZE/2 ; $c4
	ld [H_SPRITEINTERLACECOUNTER], a ; $ff8b
.interlaceLoop
	ld a, [de]
	dec de
	ld [hld], a   ; write byte of source 2
	ld a, [bc]
	dec bc
	ld [hld], a   ; write byte of source 1
	ld a, [de]
	dec de
	ld [hld], a   ; write byte of source 2
	ld a, [bc]
	dec bc
	ld [hld], a   ; write byte of source 1
	ld a, [H_SPRITEINTERLACECOUNTER] ; $ff8b
	dec a
	ld [H_SPRITEINTERLACECOUNTER], a ; $ff8b
	jr nz, .interlaceLoop
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped
	ld bc, 2*SPRITEBUFFERSIZE
	ld hl, S_SPRITEBUFFER1
.swapLoop
	swap [hl]    ; if flipped swap nybbles in all bytes
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .swapLoop
.notFlipped
	pop hl
	ld de, S_SPRITEBUFFER1
	ld c, (2*SPRITEBUFFERSIZE)/16 ; $31, number of 16 byte chunks to be copied
	ld a, [H_LOADEDROMBANK]
	ld b, a
	jp CopyVideoData