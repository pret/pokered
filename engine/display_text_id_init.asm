; function that performs initialization for DisplayTextID
DisplayTextIDInit:
	xor a
	ld [wListMenuID], a
	ld a, [wAutoTextBoxDrawingControl]
	bit 0, a
	jr nz, .skipDrawingTextBoxBorder
	ld a, [hSpriteIndexOrTextID] ; text ID (or sprite ID)
	and a
	jr nz, .notStartMenu
; if text ID is 0 (i.e. the start menu)
; Note that the start menu text border is also drawn in the function directly
; below this, so this seems unnecessary.
	CheckEvent EVENT_GOT_POKEDEX
; start menu with pokedex
	coord hl, 10, 0
	ld b, $0e
	ld c, $08
	jr nz, .drawTextBoxBorder
; start menu without pokedex
	coord hl, 10, 0
	ld b, $0c
	ld c, $08
	jr .drawTextBoxBorder
; if text ID is not 0 (i.e. not the start menu) then do a standard dialogue text box
.notStartMenu
	coord hl, 0, 12
	ld b, $04
	ld c, $12
.drawTextBoxBorder
	call TextBoxBorder
.skipDrawingTextBoxBorder
	ld hl, wFontLoaded
	set 0, [hl]
	ld hl, wFlags_0xcd60
	bit 4, [hl]
	res 4, [hl]
	jr nz, .skipMovingSprites
	call UpdateSprites
.skipMovingSprites
; loop to copy C1X9 (direction the sprite is facing) to C2X9 for each sprite
; this is done because when you talk to an NPC, they turn to look your way
; the original direction they were facing must be restored after the dialogue is over
	ld hl, wSpriteStateData1 + $19
	ld c, $0f
	ld de, $0010
.spriteFacingDirectionCopyLoop
	ld a, [hl]
	inc h
	ld [hl], a
	dec h
	add hl, de
	dec c
	jr nz, .spriteFacingDirectionCopyLoop
; loop to force all the sprites in the middle of animation to stand still
; (so that they don't like they're frozen mid-step during the dialogue)
	ld hl, wSpriteStateData1 + 2
	ld de, $0010
	ld c, e
.spriteStandStillLoop
	ld a, [hl]
	cp $ff ; is the sprite visible?
	jr z, .nextSprite
; if it is visible
	and $fc
	ld [hl], a
.nextSprite
	add hl, de
	dec c
	jr nz, .spriteStandStillLoop
	ld b, $9c ; window background address
	call CopyScreenTileBufferToVRAM ; transfer background in WRAM to VRAM
	xor a
	ld [hWY], a ; put the window on the screen
	call LoadFontTilePatterns
	ld a, $01
	ld [H_AUTOBGTRANSFERENABLED], a ; enable continuous WRAM to VRAM transfer each V-blank
	ret
