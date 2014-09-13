; b = new colour for BG colour 0 (usually white) for 4 frames
ChangeBGPalColor0_4Frames: ; 480eb (12:40eb)
	call GetPredefRegisters
	ld a, [rBGP]
	or b
	ld [rBGP], a
	ld c, $4
	call DelayFrames
	ld a, [rBGP]
	and %11111100
	ld [rBGP], a
	ret

Func_480ff: ; 480ff (12:40ff)
	call GetPredefRegisters
	ld a, $1
	ld [wd0a0], a
	xor a
.asm_48108
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	call Func_48119
	call Func_48119
	dec b
	ld a, b
	jr nz, .asm_48108
	xor a
	ld [wd0a0], a
	ret

Func_48119: ; 48119 (12:4119)
	ld a, [H_NUMTOPRINT] ; $ff96 (aliases: H_MULTIPLICAND)
	xor b
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	ld [rWY], a ; $ff4a
	ld c, $3
	jp DelayFrames

Func_48125: ; 48125 (12:4125)
	call GetPredefRegisters
	xor a
.asm_48129
	ld [$ff97], a
	call Func_4813f
	ld c, $1
	call DelayFrames
	call Func_4813f
	dec b
	ld a, b
	jr nz, .asm_48129
	ld a, $7
	ld [rWX], a ; $ff4b
	ret

Func_4813f: ; 4813f (12:413f)
	ld a, [$ff97]
	xor b
	ld [$ff97], a
	bit 7, a
	jr z, .asm_48149
	xor a
.asm_48149
	add $7
	ld [rWX], a ; $ff4b
	ld c, $4
	jp DelayFrames
