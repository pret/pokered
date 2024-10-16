MACRO mon_icon_header
	dw \1 tile \2
	db \3
	db BANK(\1)
	dw vSprites tile (\4)
ENDM
; PureRGBnote: CHANGED: removed a lot of the pointers since they aren't used in the party menu anymore.
MonPartySpritePointers:
	; gfx pointer, gfx tile offset, # tiles, vSprites tile offset
	mon_icon_header TradeBubbleIconGFX,   0, 4, ICON_TRADEBUBBLE << 2
	mon_icon_header TradeBubbleIconGFX,   4, 4, ICONOFFSET + ICON_TRADEBUBBLE << 2
