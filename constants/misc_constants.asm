; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

;;;;;;;;;; PureRGBnote: CHANGED: increased the speed of each text speed option
; wOptions
DEF TEXT_DELAY_FAST    EQU %00 ; 0
DEF TEXT_DELAY_MEDIUM  EQU %01 ; 1
DEF TEXT_DELAY_SLOW    EQU %11 ; 3
DEF TEXT_DELAY_BITS    EQU %11 ; which bits in wOptions are assigned to text speed value (first two currently)

	const_def 2 ; first two bits are the text delay options above
	; unused bit 2
	; unused bit 3
	; unused bit 4
	; unused bit 5
	const_skip 4
	const BIT_BATTLE_SHIFT     ; 6
	const BIT_BATTLE_ANIMATION ; 7

;;;;;;;;;; PureRGBnote: ADDED: New constants for all the new options that appear in the new options menus. 
;;;;;;;;;;                     Controls which bits they use in the options wram variables.

; wOptions2

DEF PALETTES_DEFAULT    EQU %00 ; 0 
DEF PALETTES_SGB        EQU %01 ; 1
DEF PALETTES_SGB2       EQU %10 ; 2
DEF PALETTES_YELLOW     EQU %11 ; 3

	const_def 2 ; first two bits are the palette options above
	const BIT_ALT_PKMN_PALETTES ; 2
	const BIT_AUDIO_PAN         ; 3
	const BIT_BIKE_MUSIC        ; 4
	const BIT_GBC_FADE          ; 5
	const_skip		            ; 6 (unused)
	const BIT_MUSIC             ; 7

; wOptions3
	const_def
	const BIT_GHOST_PSYCHIC    ; 0
	const BIT_ICE_FIRE         ; 1
	const BIT_BUG_PSN          ; 2
	const BIT_PSN_BUG          ; 3
	const BIT_EXP_BAR          ; 4
	const BIT_NPC_STAT_EXP     ; 5
	; unused bit 6
	; unused bit 7

; wSpriteOptions
	const_def
	const BIT_SQUIRTLE_SPRITE  ; 0
	const BIT_BLASTOISE_SPRITE ; 1
	const BIT_PIDGEOT_SPRITE   ; 2
	const BIT_BULBASAUR_SPRITE ; 3
	const BIT_GOLBAT_SPRITE    ; 4
	const BIT_MANKEY_SPRITE    ; 5
	const BIT_ARCANINE_SPRITE  ; 6
	const BIT_MEWTWO_SPRITE    ; 7

; wSpriteOptions2
	const_def  
	const BIT_BACK_SPRITES     ; 0
	const BIT_NIDORINO_SPRITE  ; 1
	const BIT_EXEGGUTOR_SPRITE ; 2
	const BIT_MENU_ICON_SPRITES ; 3
	const BIT_ELECTABUZZ_SPRITE ; 4
	const BIT_RATICATE_SPRITE   ; 5
	; unused bit 6
	; unused bit 7

; wSpriteOptions3
	const_def
	const BIT_PIDGEOTTO_SPRITE  ; 0
	const BIT_BUTTERFREE_SPRITE ; 1
	const BIT_GENGAR_SPRITE     ; 2
	const BIT_ONIX_SPRITE       ; 3
	const BIT_VOLTORB_SPRITE    ; 4
	const BIT_KOFFING_SPRITE    ; 5
	const BIT_ABRA_SPRITE       ; 6
	const BIT_EXEGGCUTE_SPRITE  ; 7

; wSpriteOptions4
	const_def
	const BIT_KADABRA_SPRITE    ; 0
	const BIT_TENTACRUEL_SPRITE ; 1
	const BIT_GRAVELER_SPRITE   ; 2
	const BIT_MACHOP_SPRITE     ; 3
	const BIT_PINSIR_SPRITE     ; 4
	const BIT_ZAPDOS_SPRITE     ; 5
	const BIT_CLOYSTER_SPRITE   ; 6
	const BIT_STARMIE_SPRITE    ; 7

;;;;;;;;;;

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

; wd732 flags
DEF BIT_DEBUG_MODE EQU 1

	const_def
	const WALKING ; 0
	const BIKING ; 1
	const SURFING ; 2
	
DEF LEARN_BY_ITEM EQU 1

; wNewInGameFlags
	
	const_def
	const IN_GAME
	const IN_POKEMART_MENU