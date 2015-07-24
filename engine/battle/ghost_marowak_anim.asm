MarowakAnim: ; 708ca (1c:48ca)
; animate the ghost being unveiled as a Marowak
	ld a, $e4
	ld [rOBP1], a
	call CopyMonPicFromBGToSpriteVRAM ; cover the BG ghost pic with a sprite ghost pic that looks the same
; now that the ghost pic is being displayed using sprites, clear the ghost pic from the BG tilemap
	coord hl, 12, 0
	ld bc, $707
	call ClearScreenArea
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; disable BG transfer so we don't see the Marowak too soon
; replace ghost pic with Marowak in BG
	ld a, MAROWAK
	ld [wChangeMonPicEnemyTurnSpecies], a
	ld a, $1
	ld [H_WHOSETURN], a
	callab ChangeMonPic
 ; alternate between black and light grey 8 times.
 ; this makes the ghost's body appear to flash
	ld d, $80
	call FlashSprite8Times
.fadeOutGhostLoop
	ld c, 10
	call DelayFrames
	ld a, [rOBP1]
	sla a
	sla a
	ld [rOBP1], a
	jr nz, .fadeOutGhostLoop
	call ClearSprites
	call CopyMonPicFromBGToSpriteVRAM ; copy Marowak pic from BG to sprite VRAM
	ld b, $e4
.fadeInMarowakLoop
	ld c, 10
	call DelayFrames
	ld a, [rOBP1]
	srl b
	rra
	srl b
	rra
	ld [rOBP1], a
	ld a, b
	and a
	jr nz, .fadeInMarowakLoop
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; enable BG transfer so the BG Marowak pic will be visible after the sprite one is cleared
	call Delay3
	jp ClearSprites

; copies a mon pic's  from background VRAM to sprite VRAM and sets up OAM
CopyMonPicFromBGToSpriteVRAM: ; 7092a (1c:492a)
	ld de, vFrontPic
	ld hl, vSprites
	ld bc, 7 * 7
	call CopyVideoData
	ld a, $10
	ld [W_BASECOORDY], a
	ld a, $70
	ld [W_BASECOORDX], a
	ld hl, wOAMBuffer
	ld bc, $606
	ld d, $8
.oamLoop
	push bc
	ld a, [W_BASECOORDY]
	ld e, a
.oamInnerLoop
	ld a, e
	add $8
	ld e, a
	ld [hli], a
	ld a, [W_BASECOORDX]
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $10 ; use OBP1
	ld [hli], a
	inc d
	dec c
	jr nz, .oamInnerLoop
	inc d
	ld a, [W_BASECOORDX]
	add $8
	ld [W_BASECOORDX], a
	pop bc
	dec b
	jr nz, .oamLoop
	ret
