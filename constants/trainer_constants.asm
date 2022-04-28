DEF OPP_ID_OFFSET EQU 200

MACRO trainer_const
	const \1
	DEF OPP_\1 EQU OPP_ID_OFFSET + \1
ENDM

; trainer class ids
; indexes for:
; - TrainerNames (see data/trainers/names.asm)
; - TrainerNamePointers (see data/trainers/name_pointers.asm)
; - TrainerDataPointers (see data/trainers/parties.asm)
; - TrainerPicAndMoneyPointers (see data/trainers/pic_pointers_money.asm)
; - TrainerAIPointers (see data/trainers/ai_pointers.asm)
; - TrainerClassMoveChoiceModifications (see data/trainers/move_choices.asm)
	const_def
	trainer_const NOBODY         ; $00
	trainer_const YOUNGSTER      ; $01
	trainer_const BUG_CATCHER    ; $02
	trainer_const LASS           ; $03
	trainer_const SAILOR         ; $04
	trainer_const JR_TRAINER_M   ; $05
	trainer_const JR_TRAINER_F   ; $06
	trainer_const POKEMANIAC     ; $07
	trainer_const SUPER_NERD     ; $08
	trainer_const HIKER          ; $09
	trainer_const BIKER          ; $0A
	trainer_const BURGLAR        ; $0B
	trainer_const ENGINEER       ; $0C
	trainer_const UNUSED_JUGGLER ; $0D
	trainer_const FISHER         ; $0E
	trainer_const SWIMMER        ; $0F
	trainer_const CUE_BALL       ; $10
	trainer_const GAMBLER        ; $11
	trainer_const BEAUTY         ; $12
	trainer_const PSYCHIC_TR     ; $13
	trainer_const ROCKER         ; $14
	trainer_const JUGGLER        ; $15
	trainer_const TAMER          ; $16
	trainer_const BIRD_KEEPER    ; $17
	trainer_const BLACKBELT      ; $18
	trainer_const RIVAL1         ; $19
	trainer_const PROF_OAK       ; $1A
	trainer_const CHIEF          ; $1B
	trainer_const SCIENTIST      ; $1C
	trainer_const GIOVANNI       ; $1D
	trainer_const ROCKET         ; $1E
	trainer_const COOLTRAINER_M  ; $1F
	trainer_const COOLTRAINER_F  ; $20
	trainer_const BRUNO          ; $21
	trainer_const BROCK          ; $22
	trainer_const MISTY          ; $23
	trainer_const LT_SURGE       ; $24
	trainer_const ERIKA          ; $25
	trainer_const KOGA           ; $26
	trainer_const BLAINE         ; $27
	trainer_const SABRINA        ; $28
	trainer_const GENTLEMAN      ; $29
	trainer_const RIVAL2         ; $2A
	trainer_const RIVAL3         ; $2B
	trainer_const LORELEI        ; $2C
	trainer_const CHANNELER      ; $2D
	trainer_const AGATHA         ; $2E
	trainer_const LANCE          ; $2F
DEF NUM_TRAINERS EQU const_value - 1
