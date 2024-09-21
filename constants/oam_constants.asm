; Pseudo-OAM flags used by game logic
	const_def
	const BIT_END_OF_OAM_DATA    ; 0
	const BIT_SPRITE_UNDER_GRASS ; 1

; Used in SpriteFacingAndAnimationTable (see data/sprites/facings.asm)
DEF FACING_END  EQU 1 << BIT_END_OF_OAM_DATA
DEF UNDER_GRASS EQU 1 << BIT_SPRITE_UNDER_GRASS

; OAM attribute flags
DEF OAM_PALETTE EQU %111
	const_def 3
	const OAM_TILE_BANK ; 3
	const OAM_OBP_NUM   ; 4 ; Non CGB Mode Only
	const OAM_X_FLIP    ; 5
	const OAM_Y_FLIP    ; 6
	const OAM_PRIORITY  ; 7 ; 0: OBJ above BG, 1: OBJ behind BG (colors 1-3)

; OAM attribute masks
DEF OAM_OBP1      EQU 1 << OAM_OBP_NUM  ; OBJ palette 1
DEF OAM_HFLIP     EQU 1 << OAM_X_FLIP   ; horizontal flip
DEF OAM_VFLIP     EQU 1 << OAM_Y_FLIP   ; vertical flip
DEF OAM_BEHIND_BG EQU 1 << OAM_PRIORITY ; behind bg (except color 0)
