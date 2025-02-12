; PureRGBnote: CHANGED: some trainers have added AI types. Mainly AI type 3 is more widely used.

MACRO move_choices
	IF _NARG
		db \# ; all args
	ENDC
	db 0 ; end
	DEF list_index += 1
ENDM

; move choice modification methods that are applied for each trainer class
TrainerClassMoveChoiceModifications:
	list_start
	move_choices         ; YOUNGSTER
	move_choices 1       ; BUG CATCHER
	move_choices 1       ; LASS
	move_choices 1, 3    ; SAILOR
	move_choices 1       ; JR_TRAINER_M
	move_choices 1       ; JR_TRAINER_F
	move_choices 1, 2, 3 ; POKEMANIAC
	move_choices 1, 2    ; SUPER_NERD
	move_choices 1       ; HIKER
	move_choices 1       ; BIKER
	move_choices 1, 3    ; BURGLAR
	move_choices 1, 3    ; ENGINEER
	move_choices 1, 3    ; FISHER
	move_choices 1, 3    ; SWIMMER
	move_choices         ; CUE_BALL
	move_choices 1       ; GAMBLER
	move_choices 1, 3    ; BEAUTY
	move_choices 1, 2    ; PSYCHIC_TR
	move_choices 1, 3    ; ROCKER
	move_choices 1       ; JUGGLER
	move_choices 1, 3    ; TAMER
	move_choices 1       ; BIRD_KEEPER
	move_choices 1, 3    ; BLACKBELT
	move_choices 1       ; RIVAL1
	move_choices 1, 3, 4 ; PROF_OAK
	move_choices 1, 2, 4 ; SCIENTIST
	move_choices 1, 3    ; GIOVANNI
	move_choices 1       ; ROCKET
	move_choices 1, 3    ; COOLTRAINER_M
	move_choices 1, 3    ; COOLTRAINER_F
	move_choices 1, 3    ; BRUNO
	move_choices 1       ; BROCK
	move_choices 1, 3    ; MISTY
	move_choices 1, 3    ; LT_SURGE
	move_choices 1, 3, 4 ; ERIKA
	move_choices 1, 2, 3, 4 ; KOGA
	move_choices 1, 3    ; BLAINE
	move_choices 1, 3, 4 ; SABRINA
	move_choices 1, 2    ; GENTLEMAN
	move_choices 1, 3    ; RIVAL2
	move_choices 1, 3, 4 ; RIVAL3
	move_choices 1, 2, 3, 4 ; LORELEI
	move_choices 1       ; CHANNELER
	move_choices 1, 2, 3, 4 ; AGATHA
	move_choices 1, 3, 4 ; LANCE
	move_choices 1		 ; COOL_KID
	move_choices 1, 2    ; FIREFIGHTER
	move_choices 1, 3    ; RANGER
	move_choices 1, 3    ; RANGER_F
	move_choices 1, 2    ; ROOKIE
	move_choices 1, 3    ; SOLDIER
	move_choices 1, 3, 4 ; CHIEF
	move_choices 1, 3, 4 ; GYM_GUIDE
	assert_list_length NUM_TRAINERS

ChampArenaGenericMoveChoices:
	move_choices 1, 2, 3, 4 ; PureRGBnote: ADDED: used to make all the champ arena challengers have strong AI without changing their initial encounter ones.