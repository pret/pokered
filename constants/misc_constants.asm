; Boolean checks
FALSE EQU 0
TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

; wOptions
TEXT_DELAY_FAST    EQU %000 ; 0
TEXT_DELAY_MEDIUM  EQU %001 ; 1
TEXT_DELAY_SLOW    EQU %011 ; 3

	const_def 6
	const BIT_BATTLE_SHIFT     ; 6
	const BIT_BATTLE_ANIMATION ; 7

; wOptions2

PALETTES_DEFAULT    EQU %00 ; 0 
PALETTES_SGB        EQU %01 ; 1
PALETTES_YELLOW     EQU %11 ; 3

	const_def 2 ; first two bytes are the palette options above
	const BIT_ALT_PKMN_PALETTES ; 2
	const BIT_AUDIO_PAN         ; 3
	const BIT_BIKE_MUSIC        ; 4
	const BIT_EXP_BAR           ; 5

; wSpriteOptions2
	const_def  
	const BIT_BACK_SPRITES     ; 0
	const BIT_NIDORINO_SPRITE  ; 1
	const BIT_EXEGGUTOR_SPRITE ; 2
	const BIT_MENU_ICON_SPRITES ; 3
	const BIT_GHOST_PSYCHIC    ; 4
	const BIT_ICE_FIRE         ; 5
	const BIT_BUG_PSN          ; 6
	const BIT_PSN_BUG          ; 7

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


SAFARI_TYPE_CLASSIC EQU 0
SAFARI_TYPE_RANGER_HUNT EQU 1
SAFARI_TYPE_FREE_ROAM EQU 2

; DMGPalToGBCPal
CONVERT_BGP  EQU 0
CONVERT_OBP0 EQU 1
CONVERT_OBP1 EQU 2

NUM_COLORS EQU 4
PAL_SIZE EQU NUM_COLORS * 2
NUM_ACTIVE_PALS EQU 4