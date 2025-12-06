DEF _tr_class = 0

; Usage: def_trainer_class <CLASS_CONSTANT>
; CLASS_CONSTANT is defined in trainer_constants.asm
MACRO def_trainer_class
	assert \1 == _tr_class, "Trainer class ID mismatch"
	def _tr_class += 1
	def _tr_party = 1
ENDM

; Usage: def_trainer <TRAINER_INDEX>, [PARTY_LEVEL]
; TRAINER_INDEX is 1-based
; PARTY_LEVEL is the level for the whole party, defaults to TRAINERTYPE_MULTI_LEVELS to set mon levels individually
MACRO def_trainer
	; Reset trainer macro state.
	def _tr_flags = 0
	def _tr_mons = 0
	def _tr_nick_lengths = 0
	assert \1 == _tr_party, "Trainer party ID mismatch"
	if _NARG == 2
		def _tr_lv = \2
	else
		def _tr_lv = TRAINERTYPE_MULTI_LEVELS
	endc
	def _tr_size = 0
	def _tr_party += 1
ENDM

; Usage: tr_mon [LEVEL,] <SPECIES>
; LEVEL determines the level of the mon, it is required if trainer level was set to TRAINERTYPE_MULTI_LEVELS.
; SPECIES is the species.
MACRO tr_mon
	; First, reset all stale data from the previous Trainer's mons.
	def p = _tr_mons

	for i, 1, NUM_MOVES + 1
		def _tr_pk{d:p}_move{d:i} = NO_MOVE
	endr
    redef _tr_pk{d:p}_dvs EQUS "ATKDEFDV_TRAINER, SPDSPCDV_TRAINER"

	if _tr_lv == TRAINERTYPE_MULTI_LEVELS
		assert _NARG == 2, "Trainer party requires a level for each mon"
		; Then actually define the data. Level is required for multi.
		def _tr_pk{d:p}_level = \1
		SHIFT
	else
		; defining the value anyway for easier refactoring
		def _tr_pk{d:p}_level = _tr_lv
	endc

	redef _tr_pk{d:p}_species EQUS "\1"
	def _tr_mons += 1
ENDM

; Usage: tr_moves <MOVE1>, [MOVE2], [MOVE3], [MOVE4]
; MOVE* defines a mon's moves. You can specify between 1-4 moves.
MACRO tr_moves
	def _tr_flags |= TRAINERTYPE_MOVES
	if _NARG > NUM_MOVES
		fail "A mon may only have {d:NUM_MOVES} moves."
	endc
	for i, 1, _NARG + 1
		def _tr_pk{d:p}_move{d:i} = \<i>
	endr
ENDM

; Usage: tr_dvs <ATK_DEF>, <SPD_SPC>
MACRO tr_dvs
	def _tr_flags |= TRAINERTYPE_DVS
	; check if a constant was used
	if STRFIND("\#", "_") != -1
		redef _tr_pk{d:p}_dvs EQUS "{\#}"
	else
		redef _tr_pk{d:p}_dvs EQUS "\#"
	endc
	def _tr_pk{d:p}_dvs_explicit = TRUE
ENDM

; Write out the party data from stored trainer buffer.
MACRO end_trainer
	; First, write the byte length of the party.
	; Pokémon data
	def _tr_size += 2 ; level, species

	if _tr_flags & TRAINERTYPE_MOVES
		def _tr_size += NUM_MOVES
	endc

	if _tr_flags & TRAINERTYPE_DVS
    def _tr_size += 2
	endc


	def _tr_size *= _tr_mons

	; Trainer flags
	def _tr_size += 1

	; Party size should never exceed 255, but just in case...
	if _tr_size > 255
		fail "Party size too large"
	endc

	; replace terminator byte with size byte
	db _tr_size ; new way to skip trainers
	; party flags
	db _tr_flags

	; Now for all the mon data.
	for p, _tr_mons
		; We can't have implicit moves, for now.
		if (_tr_flags & TRAINERTYPE_MOVES) && _tr_pk{d:p}_move1 == NO_MOVE
			fail "Unspecified move list for _tr_pk{d:p}_species"
		endc
		
		db _tr_pk{d:p}_level, _tr_pk{d:p}_species

		if _tr_flags & TRAINERTYPE_MOVES
			for i, 1, NUM_MOVES + 1
				db _tr_pk{d:p}_move{d:i}
			endr
		endc
		
		if _tr_flags & TRAINERTYPE_DVS
			db _tr_pk{d:p}_dvs
		endc
	endr
ENDM