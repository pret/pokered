DEF OPP_ID_OFFSET EQU 200

MACRO trainer_const
	const \1
	DEF OPP_\1 EQU OPP_ID_OFFSET + \1
ENDM

; trainer class ids
; indexes for:
; - TrainerNames (see data/trainers/names.asm)
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
	trainer_const FISHER         ; $0D
	trainer_const SWIMMER        ; $0E
	trainer_const CUE_BALL       ; $0F
	trainer_const GAMBLER        ; $10
	trainer_const BEAUTY         ; $11
	trainer_const PSYCHIC_TR     ; $12
	trainer_const ROCKER         ; $13
	trainer_const JUGGLER        ; $14
	trainer_const TAMER          ; $15
	trainer_const BIRD_KEEPER    ; $16
	trainer_const BLACKBELT      ; $17
	trainer_const RIVAL1         ; $18
	trainer_const PROF_OAK       ; $19
	trainer_const SCIENTIST      ; $1A
	trainer_const GIOVANNI       ; $1B
	trainer_const ROCKET         ; $1C
	trainer_const COOLTRAINER_M  ; $1D
	trainer_const COOLTRAINER_F  ; $1E
	trainer_const BRUNO          ; $1F
	trainer_const BROCK          ; $20
	trainer_const MISTY          ; $21
	trainer_const LT_SURGE       ; $22
	trainer_const ERIKA          ; $23
	trainer_const KOGA           ; $24
	trainer_const BLAINE         ; $25
	trainer_const SABRINA        ; $26
	trainer_const GENTLEMAN      ; $27
	trainer_const RIVAL2         ; $28
	trainer_const RIVAL3         ; $29
	trainer_const LORELEI        ; $2A
	trainer_const CHANNELER      ; $2B
	trainer_const AGATHA         ; $2C
	trainer_const LANCE          ; $2D
;;;;;;;;;; PureRGBnote: ADDED: new trainer types
	trainer_const COOL_KID       ; $2E
	trainer_const FIREFIGHTER    ; $2F
	trainer_const RANGER         ; $30
	trainer_const RANGER_F       ; $31
	trainer_const ROOKIE         ; $32
	trainer_const SOLDIER        ; $33
	trainer_const CHIEF          ; $34 ; used to be an earlier ID
	trainer_const GYM_GUIDE      ; $35 ; replaced unused juggler
;;;;;;;;;;
	; two trainer slots left
DEF NUM_TRAINERS EQU const_value - 1
