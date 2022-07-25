LoadFontTilePatterns::
	ldh a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld hl, FontGraphics
	ld de, vFont
	ld bc, FontGraphicsEnd - FontGraphics
	ld a, BANK(FontGraphics)
	jp FarCopyDataDouble ; if LCD is off, transfer all at once
.on
	ld de, FontGraphics
	ld hl, vFont
	lb bc, BANK(FontGraphics), (FontGraphicsEnd - FontGraphics) / $8
	jp CopyVideoDataDouble ; if LCD is on, transfer during V-blank

LoadTextBoxTilePatterns::
	ldh a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld hl, TextBoxGraphics
	ld de, vChars2 tile $60
	ld bc, TextBoxGraphicsEnd - TextBoxGraphics
	ld a, BANK(TextBoxGraphics)
	jp FarCopyData2 ; if LCD is off, transfer all at once
.on
	ld de, TextBoxGraphics
	ld hl, vChars2 tile $60
	lb bc, BANK(TextBoxGraphics), (TextBoxGraphicsEnd - TextBoxGraphics) / $10
	jp CopyVideoData ; if LCD is on, transfer during V-blank

LoadHpBarAndStatusTilePatterns::
	ldh a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld hl, HpBarAndStatusGraphics
	ld de, vChars2 tile $62
	ld bc, HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics
	ld a, BANK(HpBarAndStatusGraphics)
;joenote - load exp bar
	;jp FarCopyData2 ; if LCD is off, transfer all at once
	call FarCopyData2
	ld hl, EXPBarGraphics
	ld de, vChars1 + $400
	ld bc, EXPBarGraphicsEnd - EXPBarGraphics
	ld a, BANK(EXPBarGraphics)
	jp FarCopyData2
.on
	ld de, HpBarAndStatusGraphics
	ld hl, vChars2 + $620
	lb bc, BANK(HpBarAndStatusGraphics), (HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics) / $10
;joenote - load exp bar
	;jp CopyVideoData ; if LCD is on, transfer during V-blank
	call CopyVideoData
	ld de,EXPBarGraphics
	ld hl, vChars1 + $400
	lb bc, BANK(EXPBarGraphics), (EXPBarGraphicsEnd - EXPBarGraphics) / $10
	jp CopyVideoData
