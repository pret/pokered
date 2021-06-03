TrainerAIPointers:
	table_width 3, TrainerAIPointers
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, JugglerAI ; unused_juggler
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 3, JugglerAI ; juggler
	dbw 3, GenericAI
	dbw 3, GenericAI
	dbw 2, GenericAI ; blackbelt
	dbw 3, GenericAI ; rival1
	dbw 3, GenericAI
	dbw 1, GenericAI ; chief
	dbw 3, GenericAI
	dbw 1, GenericAI ; giovanni
	dbw 3, GenericAI
	dbw 2, GenericAI ; cooltrainerm
	dbw 1, CooltrainerFAI ; cooltrainerf
	dbw 2, GenericAI ; bruno
	dbw 5, GenericAI ; brock
	dbw 1, GenericAI ; misty
	dbw 1, GenericAI ; surge
	dbw 1, GenericAI ; erika
	dbw 2, GenericAI ; koga
	dbw 2, GenericAI ; blaine
	dbw 1, GenericAI ; sabrina
	dbw 3, GenericAI
	dbw 1, GenericAI ; rival2
	dbw 1, GenericAI ; rival3
	dbw 2, GenericAI ; lorelei
	dbw 3, GenericAI
	dbw 2, AgathaAI ; agatha
	dbw 1, GenericAI ; lance
	assert_table_length NUM_TRAINERS
