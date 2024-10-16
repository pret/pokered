; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

;;;;;;;;;; PureRGBnote: constants for indicating which type of safari game the player is currently playing
DEF SAFARI_TYPE_CLASSIC EQU 0
DEF SAFARI_TYPE_RANGER_HUNT EQU 1
DEF SAFARI_TYPE_FREE_ROAM EQU 2
;;;;;;;;;;

;;;;;;;;;; shinpokerednote: gbcnote: new constants for managing GBC color palettes functionality
; DMGPalToGBCPal
DEF CONVERT_BGP  EQU 0
DEF CONVERT_OBP0 EQU 1
DEF CONVERT_OBP1 EQU 2

DEF NUM_COLORS EQU 4
DEF PAL_SIZE EQU NUM_COLORS * 2
DEF NUM_ACTIVE_PALS EQU 4
;;;;;;;;;;

;;;;;;;;;; PureRGBnote: ADDED: pokedex flags

	const_def
	const BIT_POKEDEX_DATA_DISPLAY_TYPE    ; 0
	const BIT_POKEDEX_WHICH_SPRITE_SHOWING ; 1 
	const BIT_VIEWING_POKEDEX              ; 2
;;;;;;;;;;

;;;;;;;;;; PureRGBnote: ADDED: town map area flags

	const_def
	const BIT_HAS_OLD_ROD_LOCATIONS    ; 0
	const BIT_HAS_GOOD_ROD_FRESH ; 1
	const BIT_HAS_GOOD_ROD_SALT ; 2
	const BIT_HAS_SUPER_ROD_LOCATIONS ; 3
	const BIT_HAS_GRASS_CAVE_LOCATIONS ; 4
	const BIT_HAS_WATER_LOCATIONS ; 5 
;;;;;;;;;;

	const_def
	const WALKING ; 0
	const BIKING ; 1
	const SURFING ; 2
	const WEARING_LAVA_SUIT ; 3 ; PureRGBnote: ADDED: used in the volcano to show the lava suit sprite
	
DEF LEARN_BY_ITEM EQU 1

DEF BIT_ALT_PALETTE_TRAINER_MON EQU 7