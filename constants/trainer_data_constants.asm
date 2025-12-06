; Trainer party types (see engine/battle/read_trainer_party.asm)
	const_def
	shift_const TRAINERTYPE_MOVES     ; bit 0
	shift_const TRAINERTYPE_DVS       ; bit 1
; legacy value that is not simple flags
DEF TRAINERTYPE_MULTI_LEVELS EQU $FF