; party menu icons
; used in MonPartySpritePointers (see data/icon_pointers.asm)
	const_def
	const ICON_MON       ; $0
	const ICON_BALL      ; $1
	const ICON_HELIX     ; $2
	const ICON_FAIRY     ; $3
	const ICON_BIRD      ; $4
	const ICON_WATER     ; $5
	const ICON_BUG       ; $6
	const ICON_GRASS     ; $7
	const ICON_SNAKE     ; $8
	const ICON_QUADRUPED ; $9

DEF ICON_TRADEBUBBLE EQU $e

DEF ICONOFFSET EQU $40 ; difference between alternating icon frames' tile IDs
