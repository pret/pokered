; PureRGBnote: ADDED: code for smooth fades on the gbc (optional)
;get the RGB values out of color in de into a spot pointed to by hRGB
GetRGB:
;GetRed:	
	;red bits in e are %00011111
	ld a, e
	and %00011111	;mask to get just the color value
	ldh [hRGB + 0], a
;GetGreen:
	;green bits in de are %00000011 11100000
	ld a, e
	and %11100000
	;a is now xxx00000
	swap a
	rrca
	ld b, a
	;b is now 00000xxx
	ld a, d
	and %00000011
	add a
	add a
	add a
	;a is now 000xx000
	or b
	;a is now 000xxxxx
	ldh [hRGB + 1], a
;GetBlue:
	;blue bits in d are %01111100
	ld a, d
	rra
	rra
	and %00011111	;mask to get just the color value
	ldh [hRGB + 2], a
	ret

;write a colors at hRGB into their proper bit placement in de
WriteRGB:
;writeRed:
	ldh a, [hRGB + 0]
	ld b, a
	ld a, e
	and %11100000
	or b
	ld e, a
;writeGreen:
	ldh a, [hRGB + 1]
	;					d		e
	;green bits are 00000011 11100000
	;bits in a are 00011111
	rrca
	rrca
	rrca
	ld b, a
	;bits in b are 11100011	
	;now load into d
	xor d
	and %00000011
	xor d
	ld d, a
	;bits in b are still 11100011	
	;now load into e
	ld a, b
	xor e
	and %11100000
	xor e
	ld e, a
;writeBlue:
	ldh a, [hRGB + 2]	;blue bits are 00011111
	add a			;blue bits are 00111110
	add a			;blue bits are 01111100
	ld b, a
	ld a, d
	and %10000011
	or b
	ld d, a
	ret

;This is does gamma conversions of hRGB color values via lookup list.
GammaConv:
	ld hl, hRGB
	lb bc, 0, 3
.loop
	ld a, [hl]
	push hl
	ld hl, GammaList
	push bc
	ld c, a
	add hl, bc
	pop bc
	ld a, [hl]
	pop hl
	ld [hli], a
	dec c
	jr nz, .loop
	ret	
GammaList:	;gamma=2 conversion
	db 0	; color value 0
	db 6	; color value 1
	db 8	; color value 2
	db 10	; color value 3
	db 11	; color value 4
	db 12	; color value 5
	db 14	; color value 6
	db 15	; color value 7
	db 16	; color value 8
	db 17	; color value 9
	db 18	; color value 10
	db 18	; color value 11
	db 19	; color value 12
	db 20	; color value 13
	db 21	; color value 14
	db 22	; color value 15
	db 22	; color value 16
	db 23	; color value 17
	db 24	; color value 18
	db 24	; color value 19
	db 25	; color value 20
	db 26	; color value 21
	db 26	; color value 22
	db 27	; color value 23
	db 27	; color value 24
	db 28	; color value 25
	db 28	; color value 26
	db 29	; color value 27
	db 29	; color value 28
	db 30	; color value 29
	db 30	; color value 30
	db 31	; color value 31
	
;Applies the color-mixing matrix to colors at hRGB
;Doing as few calculations as possible to increase speed because a matrix multiply causes lag
MixColorMatrix:
;calculate red row and store it
	xor a
	ld b, a	; b remains 0 for the entirety of this function
	ld h, a
	; multiply red value by 13 and add to hl
	; uses shift and add
	ldh a, [hRGB + 0]
	ld c, a		; bc = r * 1
	add a		;  a = r * 2
	add a		;  a = r * 4
	ld l, a		; hl = a * 4
	add c		;  a = r * 4 + r * 1 = r * 5
	ld c, a		; bc = r * 5
	add hl, hl	; hl = (r * 4) * 2 = r * 8
	add hl, bc	; hl = r * 8 + r * 5 = r * 13
	;multiply green value by 2, add to blue and hl
	ldh a, [hRGB + 1]
	add a
	ld c, a
	;multiply blue value by 1 and add to hl
	ldh a, [hRGB + 2]
	add c
	ld c, a
	add hl, bc
	;shift 4 bits to the right, discarding upper bits
	;actually does a nibble swap, mask, then bitwise or
	swap h
	swap l
	ld a, l
	xor h
	and $0F
	xor h
	;store now because red isn't used after this
	ldh [hRGB + 0], a
	
;calculate green row and store it
;this only needs 8-bit math: 31 * 3 + 31 * 1 == 124 < 255
	;multiply red value by 0 and add to c
	;no actions for this
	;multiply green value by 3 and add to c
	ldh a, [hRGB + 1]
	ld c, a
	add a
	add c
	ld c, a
	;multiply blue value by 1 and add to c
	ldh a, [hRGB + 2]
	add c
	;shift 2 bits to the right
	srl a
	srl a
	;save for later
	push af
	
;calculate blue row and store it
;while the formula is (r * 0 + g * 2 + b * 14) / 16, this instead does (r * 0 + g * 1 + b * 7) / 8
;which will not require a 16-bit register and will have the same result
	;while the math is for 8 bit 
	;multiply blue value by 7 and add to c
	ldh a, [hRGB + 2]
	ld c, a	; c = b * 1
	add a	; a = b * 2
	add a	; a = b * 4
	add a	; a = b * 8
	sub c	; a = (b * 8) - (b * 1) = b * 7
	ld c, a
	;multiply red value by 0 and add to c
	;no actions for this
	;multiply green value by 1 and add to c
	ldh a, [hRGB + 1]
	add c
	;shift 3 bits to the right
	rrca
	rrca
	rrca
	and $1F
;now store the color-mixed values
	ldh [hRGB + 2], a	; blue
	pop af
	ldh [hRGB + 1], a	; green
	; red was stored earlier
	ret

;This sets the GBC palette index for read/writes directly from the hardware
;Uses A, HL, and B
;Accepts settings which determine the color to work with using the value in wGBCColorControl	
	;bits 0 & 1 --> a value from 0 to 3 to select color 0 through 3
	;bits 2, 3, & 4 --> a value from 0 to 7 to select BGP/OBP 0 through 7
	;bit 5 --> 0 = BGP | 1 = OBP
	;bits 6 & 7 are unused
;When it returns with the z flag cleared, HL points to the BGP or OBP data address and B holds the final color offset
;Returns with the z flag set if not successful
SetGBCPalIndex:	
	;Check if playing on a GBC and return if not so
	ldh a, [hGBC]
	and a
	ret z
	
	ld a, [wGBCColorControl]	;copy the settings into A

	ld hl, rBGPI	;point HL to the BGP index-setting address $ff68
	bit 5, a	;check to see if BGP or OBP is desired
	jr z, .next
	ld hl, rOBPI	;point HL to the BGP index-setting address $ff6a
.next

	and %00011100	;mask the bits to leave A with just the index value
	;rotate A two bits to the right so we can do math on it properly
	rrca	
	rrca
	;each index step has four colors of two bytes each, so we need to multiply A by 8 to get the correct index offset
	add a
	add a
	add a
	ld b, a	;store the index into B for now
	
	ld a, [wGBCColorControl]	;copy the settings into A
	and %00000011	;mask the bits to leave A with just the color number offset
	add a	;each color is two bytes, so double the value to get the correct offset
	
	add b	;add the index offset in B to the color number offset
	ld b, a		;save the final offset in B for later functions
; Now load in order to point at the correct overall offset (for example, color 2 of BGP 3)
	ld [hli], a		;we do a ld [hli] so that HL increments to the proper data address afterwards
	;HL now points to either rBGPD or rOBPD
	
	;return with z flag cleared to signal success
	ld a, 1
	and a
	ret
	
;Based on the settings used for SetGBCPalIndex, this function will read the desired color into DE
;Like VRAM, the color data of the GBC can only be read/written during VBLANK, HBLANK, or OAM Scan
ReadColorGBC:
	call SetGBCPalIndex	;set the color index to read
	ret z	;return if there was a problem
	;HL should now point to either rBGPD or rOBPD
	;The final offset should be in B
	
	call .read		;read the color's low byte from the data address then decrement back to the indexing address
	
	push af			;push the low byte on the stack for later
	inc b			;increment the offset so that we can read the color's high byte
	ld a, b
	ld [hli], a		;update the indexing address with the high byte's offset and increment to the data address
	
	call .read		;read the color's high byte from the data address then decrement back to the indexing address
	
	ld d, a	;store the high byte in D
	pop af
	ld e, a	;store the low byte in E
	ret

.read
	ldh a, [rIE]
	rrca	;see if vblank interrupt is already disabled (bit 0 of rIE)
	jr c, .read_DI		;if enabled right now, jump to disable it while doing the read
.waitVRAM
	ldh a, [rSTAT]		
	and %10		; mask for non-V-blank/non-H-blank STAT mode
	jr nz, .waitVRAM
	;we are now in a viable mode
	ld a, [hld]	
	ret	

.read_DI
	di	;disable interrupts so that the VBLANK functions don't mess up the timing
	;wait for mode 0 or 1 (HBLANK or VBLANK)
.waitVRAM2
	ldh a, [rSTAT]		
	and %10		; mask for non-V-blank/non-H-blank STAT mode
	jr nz, .waitVRAM2
	;we are now in a viable mode
	ld a, [hld]		
	reti	;re-enable interrupts
	
;Based on the settings used for SetGBCPalIndex, this function will write the desired color from DE
;Like VRAM, the color data of the GBC can only be read/written during VBLANK, HBLANK, or OAM Scan
WriteColorGBC:
	call SetGBCPalIndex	;set the color index to read
	ret z	;return if there was a problem
	;HL should now point to either rBGPD or rOBPD
	;The final offset should be in B
	
	push de	;save the value in DE
	
	call .write		;write the color's low byte to the data address then decrement back to the indexing address
	
	inc b			;increment the offset so that we can write the color's high byte
	ld a, b
	ld [hli], a		;update the indexing address with the high byte's offset and increment to the data address
	
	ld e, d			
	call .write		;write the color's high byte to the data address then decrement back to the indexing address
	
	pop de	;get the saved DE value back for preservation's sake
	
	ret

.write
	ldh a, [rIE]
	rrca	;see if vblank interrupt is already disabled (bit 0 of rIE)
	jr c, .write_DI		;if enabled right now, jump to disable it while doing the read
.waitVRAM
	ldh a, [rSTAT]		
	and %10		; mask for non-V-blank/non-H-blank STAT mode
	jr nz, .waitVRAM
	;we are now in a viable mode
	ld a, e
	ld [hld], a		
	ret
	
.write_DI
	di	;disable interrupts so that the VBLANK functions don't mess up the timing
	;wait for mode 0 or 1 (HBLANK or VBLANK)
.waitVRAM2
	ldh a, [rSTAT]		
	and %10		; mask for non-V-blank/non-H-blank STAT mode
	jr nz, .waitVRAM2
	;we are now in a viable mode
	ld a, e
	ld [hld], a		
	reti	;re-enable interrupts
	
	
	
	
	
;This function does a few decrements to all the colors of the GBC in BGP 0-3 and OBP 0-7.
;It's used for fading to black or other things that need darkening.
;Returns the z-flag state: set = invalid | cleared = successful
;Reads all the relevant colors from wGBCFullPalBuffer, then decrements them C times, and writes to hardware.
DecrementAllColorsGBC:
	;Check if playing on a GBC and return if not so
	ldh a, [hGBC]
	and a
	ret z

	ldh a, [rIE]		;manually disable interrupts and wait until the first scanline of vblank is reached
	push af
	xor a
	ldh [rIE], a
.wait
	ldh a, [rLY]		
	cp $90
	jr nz, .wait
	
	xor a	;load zero to start with the very first color of BGP 0 so we can loop through everything
.mainLoop
	ld [wGBCColorControl], a
	and %00100011
	cp 32
	jr z, .skipTransparent	;color 0 of OBP 0 to 7 are always transparent, so skip these ones

	push bc	;save the value in C, which is the number of times to iterate

	call ReadBufferColorGBC	;get the color into DE
	call GetRGB			;Split color in DE to RGB values in hRGB
	
	ld hl, hRGB
	pop bc	;get the number of times to iterate
	push bc	;then save it again
	call .getMinValueRed
	call .decrement		;reduce red
	ld [hli], a
	pop bc	;get the number of times to iterate
	push bc	;then save it again
	call .getMinValueGreen
	call .decrement		;reduce green
	ld [hli], a
	pop bc	;get the number of times to iterate
	push bc	;then save it again
	call .getMinValueBlue
	call .decrement		;reduce blue
	ld [hl], a
	
	call WriteRGB		;combine RGB values back into DE
	call WriteColorGBC	;write the color in DE back to the hardware address
	
	pop bc	;get the number of times to iterate

.skipTransparent
	ld a, [wGBCColorControl]
	inc a
	cp 64
	jr nc, .return	;return if finished with OBP 7
	cp 16
	jr nz, .next
.unusedBGP ;increment past unused color locations and loop if at BGP 4
	add a	;add 16 to the location so we skip to color 32 which is OBP 0
	inc a	; color 0 of OBP 0 to 7 are always transparent, so increment to color 33
.next
	ld [wGBCColorControl], a
	jr .mainLoop

.decrement
	ld a, [hl]	;get either R, G, or B value into A
;c = max number of times to decrement per function call
.loopC
	cp b
	ret c	;return if value is below threshold
	dec a	;if not, decrement the value
	dec c	;and also decrement the counter
	ret z	;return if the counter hit zero
	jr .loopC

.return
	pop af		;re-enable interrupts
	ldh [rIE], a

;If not in 2x CPU mode, everything updates in less than 144 scanlines
;Therefore, normal mode needs an audio update but 60 fps mode does not
	ldh a, [rKEY1]
	bit 7, a
	push af
	call nz, DelayFrame	;Delay a frame in 60 fps mode to get the timing down right for any fades
	pop af
	jr nz, .return_next
	farcall Audio1_UpdateMusic
	
.return_next
	ld a, 1
	and a
	ret
.getMinValueRed
	ld a, [wOptions2]
	and %11
	ld b, 1
	ret z
	ld b, 4
	ret
.getMinValueGreen
.getMinValueBlue
	; b = [minimum number + 1] to stop at
	ld a, [wOptions2]
	and %11
	ld b, 1
	ret z
	cp PALETTES_YELLOW
	ld b, 4
	ret z
	dec b ; sgb modes have lower green and blue values by 1 for black
	ret

;This function does a few increments to all the colors of the GBC in BGP 0-3 and OBP 0-7.
;It's used for fading to white or other things that need lightening.
;Returns the z-flag state: set = invalid | cleared = successful
;Uses the value in C to increment that number of times
IncrementAllColorsGBC:	
	;Check if playing on a GBC and return if not so
	ldh a, [hGBC]
	and a
	ret z

	ldh a, [rIE]		;manually disable interrupts and wait until the first scanline of vblank is reached
	push af
	xor a
	ldh [rIE], a

.wait
	ldh a, [rLY]		
	cp $90
	jr nz, .wait
	
	xor a	;load zero to start with the very first color of BGP 0 so we can loop through everything
.mainLoop
	ld [wGBCColorControl], a
	and %00100011
	cp 32
	jr z, .skipTransparent	;color 0 of OBP 0 to 7 are always transparent, so skip these ones

	push bc	;save the value in C, which is the number of times to iterate
	
	call ReadBufferColorGBC	;get the color into DE
	call GetRGB			;Split color in DE to RGB values in hRGB
	
	ld hl, hRGB
	pop bc	;get the number of times to iterate
	push bc	;then save it again
	call .getMaxValueRed
	call .increment		;increase red
	ld [hli], a
	pop bc	;get the number of times to iterate
	push bc	;then save it again
	call .getMaxValueGreen
	call .increment		;increase green
	ld [hli], a
	pop bc	;get the number of times to iterate
	push bc	;then save it again
	call .getMaxValueBlue
	call .increment		;increase blue
	ld [hl], a
	
	call WriteRGB		;combine RGB values back into DE
	call WriteColorGBC	;write the color in DE back to the hardware address
	
	pop bc	;get the number of times to iterate
	
.skipTransparent
	ld a, [wGBCColorControl]
	inc a
	cp 64
	jr nc, .return	;return if finished with OBP 7
	cp 16
	jr nz, .next
.unusedBGP ;increment past unused color locations and loop if at BGP 4
	add a	;add 16 to the location so we skip to color 32 which is OBP 0
	inc a	; color 0 of OBP 0 to 7 are always transparent, so increment to color 33
.next
	ld [wGBCColorControl], a
	jr .mainLoop

.increment
	ld a, [hl]	;get either R, G, or B value into A
;c = max number of times to increment per function call
.loopC
	cp b
	ret nc	;return if value is at or above threshold
	inc a	;if not, increment the value
	dec c	;and also decrement the counter
	ret z	;return if the counter hit zero
	jr .loopC

.return
	pop af		;re-enable interrupts
	ldh [rIE], a

;If not in 2x CPU mode, everything updates in less than 144 scanlines
;Therefore, normal mode needs an audio update but 60 fps mode does not
	ldh a, [rKEY1]
	bit 7, a
	push af
	call nz, DelayFrame	;Delay a frame in 60 fps mode to get the timing down right for any fades
	pop af
	jr nz, .return_next
	farcall Audio1_UpdateMusic
	
.return_next
	ld a, 1
	and a
	ret
.getMaxValueRed
	;b = [maximum number] threshold to stop decrementing
	ld a, [wOptions2]
	and %11
	ld b, 29
	cp PALETTES_SGB2
	ret z
	ld b, 31
	ret
.getMaxValueGreen
	;b = [maximum number] threshold to stop decrementing
	ld a, [wOptions2]
	and %11
	ld b, 29
	cp PALETTES_SGB
	ret z
	ld b, 31
	ret
.getMaxValueBlue
	;b = [maximum number] threshold to stop decrementing
	ld a, [wOptions2]
	and %11
	ld b, 30
	cp PALETTES_SGB2
	ret z
	ld b, 31
	ret
	
	
	
	
	
	
;Functions for smooth fades utilizing the GBC's palette hardware
;Returns the z-flag state: set = success | cleared = invalid
GBCFadeOutToBlack::
	;Check if playing on a GBC and return if not so
	call CanDoGBCFade
	ret nz

;	if fade enabled but in 1x cpu mode, then enable 2x cpu mode just for this fade
	call SetFadeDoubleCPUSpeedIfNecessary
	push af
	
	push de
	rst _DelayFrame ; allow player sprite to refresh before doing the fadeout
	ld de, FadePal4
	farcall BufferAllPokeyellowColorsGBC		;back up all colors to a buffer space in wram
	
	ldh a, [hFlagsFFFA]	;need to set a flag that skips the $FF80 OAM call in VBLANK
	push af
	set 0, a
	ldh [hFlagsFFFA], a

	ld c, 3
.loop
	push bc
	call DecrementAllColorsGBC	;read buffered colors, decrement them C times, and write them to hardware
	pop bc
	ld a, c
	add 3	;step size of C
	ld c, a
	cp 32
	jr c, .loop

	pop af
	ldh [hFlagsFFFA], a
	
	pop de

	pop af
	inc a
	ret z	;return now if 2x cpu mode was already active at the start of this function
	;otherwise return to single cpu mode and return
	callfar GBCSetCPU1xSpeed
	xor a
	ret
	
.notGBC
	ld a, 1
	and a
	ret
	
;Functions for smooth fades utilizing the GBC's palette hardware
;Returns the z-flag state: set = success | cleared = invalid
GBCFadeOutToWhite::
	;Check if playing on a GBC and return if not so
	call CanDoGBCFade
	ret nz

;	if 60fps option enabled but in 1x cpu mode, then enable 2x cpu mode just for this fade
	call SetFadeDoubleCPUSpeedIfNecessary
	push af
	
	push de
	call DelayFrame ; allow player sprite to refresh before doing the fadeout
	ld de, FadePal4
	farcall BufferAllPokeyellowColorsGBC		;back up all colors to a buffer space in wram
	
	ldh a, [hFlagsFFFA]	;need to set a flag that skips the $FF80 OAM call in VBLANK
	push af
	set 0, a
	ldh [hFlagsFFFA], a

	ld c, 3
.loop
	push bc
	call IncrementAllColorsGBC	;read buffered colors, increment them C times, and write them to hardware
	pop bc
	ld a, c
	add 3	;step size of C
	ld c, a
	cp 32
	jr c, .loop

	pop af
	ldh [hFlagsFFFA], a

	pop de

	pop af
	inc a
	ret z	;return now if 2x cpu mode was already active at the start of this function
	;otherwise return to single cpu mode and return
	callfar GBCSetCPU1xSpeed
	xor a
	ret
	
.notGBC
	ld a, 1
	and a
	ret
	
	
	
GBCFadeInFromWhite::
	;Check if playing on a GBC and return if not so
	call CanDoGBCFade
	ret nz

;	if 60fps option enabled but in 1x cpu mode, then enable 2x cpu mode just for this fade
	call SetFadeDoubleCPUSpeedIfNecessary
	push af
	
	push de
	call DelayFrame ; allow player sprite to refresh before doing the fadeout
	ld de, FadePal4
	farcall BufferAllPokeyellowColorsGBC		;back up all colors to a buffer space in wram
	
	ldh a, [hFlagsFFFA]	;need to set a flag that skips the $FF80 OAM call in VBLANK
	push af
	set 0, a
	ldh [hFlagsFFFA], a

	ld c, 28
.loop
	push bc
	call IncrementAllColorsGBC	;read buffered colors, increment them C times, and write them to hardware
	pop bc
	ld a, c
	sub 3	;step size of C
	ld c, a
	jr nc, .loop

	pop af
	ldh [hFlagsFFFA], a

	pop de

	pop af
	inc a
	ret z	;return now if 2x cpu mode was already active at the start of this function
	;otherwise return to single cpu mode and return
	callfar GBCSetCPU1xSpeed
	xor a
	ret
	
	
	
GBCFadeInFromBlack::
	;Check if playing on a GBC and return if not so
	call CanDoGBCFade
	ret nz

;	if 60fps option enabled but in 1x cpu mode, then enable 2x cpu mode just for this fade
	call SetFadeDoubleCPUSpeedIfNecessary
	push af
	
	push de
	call DelayFrame ; allow player sprite to refresh before doing the fadeout
	ld de, FadePal4
	farcall BufferAllPokeyellowColorsGBC		;back up all colors to a buffer space in wram
	
	ldh a, [hFlagsFFFA]	;need to set a flag that skips the $FF80 OAM call in VBLANK
	push af
	set 0, a
	ldh [hFlagsFFFA], a

	ld c, 28
.loop
	push bc
	call DecrementAllColorsGBC	;read buffered colors, increment them C times, and write them to hardware
	pop bc
	ld a, c
	sub 3	;step size of C
	ld c, a
	jr nc, .loop

	pop af
	ldh [hFlagsFFFA], a

	pop de

	pop af
	inc a
	ret z	;return now if 2x cpu mode was already active at the start of this function
	;otherwise return to single cpu mode and return
	callfar GBCSetCPU1xSpeed
	xor a
	ret
	
CanDoGBCFade:
	ldh a, [hGBC]
	and a
	jr z, .notGBC

	ld a, [wOptions2]
	bit BIT_GBC_FADE, a
	jr z, .notGBC ; if gbc fade is turned off, don't do it
	xor a
	ret
.notGBC
	ld a, 1
	and a
	ret

SetFadeDoubleCPUSpeedIfNecessary:
	ldh a, [rKEY1]
	bit 7, a
	ld a, $ff
	ret nz
	call GBCSetCPU2xSpeed
	xor a
	ret
	
	
	
;This function uses DE as a passthrough to buffer all the BGP 0-7 and OBP 0-7 colors at wGBCFullPalBuffer	
; BufferAllColorsGBC:
	; ld hl, wGBCFullPalBuffer
	; xor a	;load zero to start with the very first color of BGP 0 so we can loop through everything
; .mainLoop
	; ld [wGBCColorControl], a
	; push hl
	; call ReadColorGBC	;get the color into DE
	; pop hl
	; ld a, d
	; ld [hli], a		;buffer high byte
	; ld a, e
	; ld [hli], a		;buffer low byte
	
	; ld a, [wGBCColorControl]
	; inc a
	; cp 64
	; jr c, .mainLoop
	; ret

;Read a specific color from the buffer into DE, similar to ReadColorGBC
ReadBufferColorGBC:
	ld de, $0000
	ld a, [wGBCColorControl]
	add a	;double A since each color is 2 bytes
	ld e, a
	ld hl, wGBCFullPalBuffer
	add hl, de
	ld a, 2
	ldh [rSVBK], a ; switch to gbc wram bank 2 (where wGBCFullPalBuffer is stored)
	ld a, [hli]		;read high byte
	ld d, a
	ld a, [hl]		;read low byte
	ld e, a
	xor a
	ldh [rSVBK], a ; switch bank to default wram bank
	ret
	
	
	
;Alternate version of this function that is more specific	
; BufferAllColorsGBC:
	; push de
	
	; call .BGP0to3Loop

	; call .OBP0to3Loop
	
	; call .OBP4to7Loop

	; pop de
	; ret	
	
; .BGP0to3Loop
	; ld hl, wGBCFullPalBuffer
	; xor a
; .BGP0to3Loop_back
	; call .readwriteinc
	; cp 16
	; jr c, .BGP0to3Loop_back
	; ret

; .OBP0to3Loop
	; ld hl, wGBCFullPalBuffer+64
	; ld a, 32
; .OBP0to3Loop_back
	; call .readwriteinc
	; cp 48
	; jr c, .OBP0to3Loop_back
	; ret

; .OBP4to7Loop
	; ld hl, wGBCFullPalBuffer+96
	; ld a, 48
; .OBP4to7Loop_back
	; call .readwriteinc
	; cp 64
	; jr c, .OBP4to7Loop_back
	; ret

; .readwriteinc
	; ld [wGBCColorControl], a
	; push hl
	; call ReadColorGBC	;get the color into DE
	; pop hl
	; ld a, d
	; ld [hli], a		;buffer high byte
	; ld a, e
	; ld [hli], a		;buffer low byte	
	; ld a, [wGBCColorControl]
	; inc a
	; ret	
	
	

	
	
	
	
	
	
	
	
	
	
	