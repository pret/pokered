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

	const_def
	const BIT_BACK_SPRITES     ; 0
	const BIT_BULBASAUR_SPRITE ; 1
	const BIT_BLASTOISE_SPRITE ; 2
	