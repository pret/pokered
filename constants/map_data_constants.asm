; width of east/west connections
; height of north/south connections
DEF MAP_BORDER EQU 3

; wCurMapConnections    : \1
; connection directions : BIT_\1
	bit_const_def
	shift_const EAST   ; $01 (BIT_EAST  ; 0)
	shift_const WEST   ; $02 (BIT_WEST  ; 1)
	shift_const SOUTH  ; $04 (BIT_SOUTH ; 2)
	shift_const NORTH  ; $08 (BIT_NORTH ; 4)


; wWarpEntries
DEF MAX_WARP_EVENTS EQU 32

; wNumSigns
DEF MAX_BG_EVENTS EQU 16

; wMapSpriteData
DEF MAX_OBJECT_EVENTS EQU 16

; flower and water tile animations
	const_def
	const TILEANIM_NONE          ; 0
	const TILEANIM_WATER         ; 1
	const TILEANIM_WATER_FLOWER  ; 2
