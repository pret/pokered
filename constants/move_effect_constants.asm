; tentative move effect constants
; {stat}_(UP|DOWN)(1|2) means that the move raises the user's (or lowers the target's) corresponding stat modifier by 1 (or 2) stages
; {status condition}_side_effect means that the move has a side chance of causing that condition
; {status condition}_effect means that the move causes the status condition every time it hits the target
const_value = 0

	const NO_ADDITIONAL_EFFECT       ; $00
	const UNUSED_EFFECT_01           ; $01
	const POISON_SIDE_EFFECT1        ; $02
	const DRAIN_HP_EFFECT            ; $03
	const BURN_SIDE_EFFECT1          ; $04
	const FREEZE_SIDE_EFFECT         ; $05
	const PARALYZE_SIDE_EFFECT1      ; $06
	const EXPLODE_EFFECT             ; $07 Explosion, Self Destruct
	const DREAM_EATER_EFFECT         ; $08
	const MIRROR_MOVE_EFFECT         ; $09
	const ATTACK_UP1_EFFECT          ; $0A
	const DEFENSE_UP1_EFFECT         ; $0B
	const SPEED_UP1_EFFECT           ; $0C
	const SPECIAL_UP1_EFFECT         ; $0D
	const ACCURACY_UP1_EFFECT        ; $0E
	const EVASION_UP1_EFFECT         ; $0F
	const PAY_DAY_EFFECT             ; $10
	const SWIFT_EFFECT               ; $11
	const ATTACK_DOWN1_EFFECT        ; $12
	const DEFENSE_DOWN1_EFFECT       ; $13
	const SPEED_DOWN1_EFFECT         ; $14
	const SPECIAL_DOWN1_EFFECT       ; $15
	const ACCURACY_DOWN1_EFFECT      ; $16
	const EVASION_DOWN1_EFFECT       ; $17
	const CONVERSION_EFFECT          ; $18
	const HAZE_EFFECT                ; $19
	const BIDE_EFFECT                ; $1A
	const THRASH_PETAL_DANCE_EFFECT  ; $1B
	const SWITCH_AND_TELEPORT_EFFECT ; $1C
	const TWO_TO_FIVE_ATTACKS_EFFECT ; $1D
	const UNUSED_EFFECT_1E           ; $1E
	const FLINCH_SIDE_EFFECT1        ; $1F
	const SLEEP_EFFECT               ; $20
	const POISON_SIDE_EFFECT2        ; $21
	const BURN_SIDE_EFFECT2          ; $22
	const UNUSED_EFFECT_23           ; $23
	const PARALYZE_SIDE_EFFECT2      ; $24
	const FLINCH_SIDE_EFFECT2        ; $25
	const OHKO_EFFECT                ; $26 moves like Horn Drill
	const CHARGE_EFFECT              ; $27 moves like Solar Beam
	const SUPER_FANG_EFFECT          ; $28
	const SPECIAL_DAMAGE_EFFECT      ; $29 Seismic Toss, Night Shade, Sonic Boom, Dragon Rage, Psywave
	const TRAPPING_EFFECT            ; $2A moves like Wrap
	const FLY_EFFECT                 ; $2B
	const ATTACK_TWICE_EFFECT        ; $2C
	const JUMP_KICK_EFFECT           ; $2D Jump Kick and Hi Jump Kick effect
	const MIST_EFFECT                ; $2E
	const FOCUS_ENERGY_EFFECT        ; $2F
	const RECOIL_EFFECT              ; $30 moves like Double Edge
	const CONFUSION_EFFECT           ; $31 Confuse Ray, Supersonic (not the move Confusion)
	const ATTACK_UP2_EFFECT          ; $32
	const DEFENSE_UP2_EFFECT         ; $33
	const SPEED_UP2_EFFECT           ; $34
	const SPECIAL_UP2_EFFECT         ; $35
	const ACCURACY_UP2_EFFECT        ; $36
	const EVASION_UP2_EFFECT         ; $37
	const HEAL_EFFECT                ; $38 Recover, Softboiled, Rest
	const TRANSFORM_EFFECT           ; $39
	const ATTACK_DOWN2_EFFECT        ; $3A
	const DEFENSE_DOWN2_EFFECT       ; $3B
	const SPEED_DOWN2_EFFECT         ; $3C
	const SPECIAL_DOWN2_EFFECT       ; $3D
	const ACCURACY_DOWN2_EFFECT      ; $3E
	const EVASION_DOWN2_EFFECT       ; $3F
	const LIGHT_SCREEN_EFFECT        ; $40
	const REFLECT_EFFECT             ; $41
	const POISON_EFFECT              ; $42
	const PARALYZE_EFFECT            ; $43
	const ATTACK_DOWN_SIDE_EFFECT    ; $44
	const DEFENSE_DOWN_SIDE_EFFECT   ; $45
	const SPEED_DOWN_SIDE_EFFECT     ; $46
	const SPECIAL_DOWN_SIDE_EFFECT   ; $47
	const UNUSED_EFFECT_48           ; $48
	const UNUSED_EFFECT_49           ; $49
	const UNUSED_EFFECT_4A           ; $4A
	const UNUSED_EFFECT_4B           ; $4B
	const CONFUSION_SIDE_EFFECT      ; $4C
	const TWINEEDLE_EFFECT           ; $4D
	const UNUSED_EFFECT_4E           ; $4E
	const SUBSTITUTE_EFFECT          ; $4F
	const HYPER_BEAM_EFFECT          ; $50
	const RAGE_EFFECT                ; $51
	const MIMIC_EFFECT               ; $52
	const METRONOME_EFFECT           ; $53
	const LEECH_SEED_EFFECT          ; $54
	const SPLASH_EFFECT              ; $55
	const DISABLE_EFFECT             ; $56

; fixed damage constants
SONICBOOM_DAMAGE   EQU 20
DRAGON_RAGE_DAMAGE EQU 40
