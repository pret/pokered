LoadFontTilePatterns::
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr nz, .on
; off
	ld hl, FontGraphics
	ld de, vFont
	ld bc, FontGraphicsEnd - FontGraphics
	ld a, BANK(FontGraphics)
	jp FarCopyDataDouble ; if LCD is off, transfer all at once
.on
	ld de, FontGraphics
	ld hl, vFont
	lb bc, BANK(FontGraphics), (FontGraphicsEnd - FontGraphics) / TILE_1BPP_SIZE
	jp CopyVideoDataDouble ; if LCD is on, transfer during V-blank

LoadTextBoxTilePatterns::
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr nz, .on
; off
	ld hl, TextBoxGraphics
	ld de, vChars2 tile $60
	ld bc, TextBoxGraphicsEnd - TextBoxGraphics
	ld a, BANK(TextBoxGraphics)
	jp FarCopyData2 ; if LCD is off, transfer all at once
.on
	ld de, TextBoxGraphics
	ld hl, vChars2 tile $60
	lb bc, BANK(TextBoxGraphics), (TextBoxGraphicsEnd - TextBoxGraphics) / TILE_SIZE
	jp CopyVideoData ; if LCD is on, transfer during V-blank

LoadHpBarAndStatusTilePatterns::
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr nz, .on
; off
	ld hl, HpBarAndStatusGraphics
	ld de, vChars2 tile $62
	ld bc, HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics
	ld a, BANK(HpBarAndStatusGraphics)
	jp FarCopyData2 ; if LCD is off, transfer all at once
.on
	ld de, HpBarAndStatusGraphics
	ld hl, vChars2 tile $62
	lb bc, BANK(HpBarAndStatusGraphics), (HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics) / TILE_SIZE
	jp CopyVideoData ; if LCD is on, transfer during V-blank
