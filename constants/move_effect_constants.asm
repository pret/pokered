; {stat}_(UP|DOWN)(1|2) means that the move raises the user's (or lowers the target's) corresponding stat modifier by 1 (or 2) stages
; {status condition}_SIDE_EFFECT means that the move has a side chance of causing that condition
; {status condition}_EFFECT means that the move causes the status condition every time it hits the target

; MoveEffectPointerTable indexes (see data/moves/effects_pointers.asm)
	const_def
	const NO_ADDITIONAL_EFFECT       ; $00
	const BIG_RECOIL_EFFECT          ; $01 ; PureRGBnote: ADDED: new effect, 50% recoil
	const POISON_SIDE_EFFECT1        ; $02
	const DRAIN_HP_EFFECT            ; $03
	const BURN_SIDE_EFFECT1          ; $04
	const FREEZE_SIDE_EFFECT1        ; $05
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
	const TRI_ATTACK_EFFECT          ; $18 ; PureRGBnote: ADDED: new effect, 10% chance of burn / freeze / paralyze
	const HAZE_EFFECT                ; $19
	const TWO_OR_THREE_ATTACKS_EFFECT; $1A ; PureRGBnote: ADDED: new effect, 50% chance of 2 hits, 50% chance of 3
	const THRASH_PETAL_DANCE_EFFECT  ; $1B
	const TELEPORT_EFFECT            ; $1C
	const TWO_TO_FIVE_ATTACKS_EFFECT ; $1D
	const FIREWALL_EFFECT            ; $1E ; PureRGBnote: ADDED: new effect, burns the opponent, used in FIREWALL (kinesis)
	const FLINCH_SIDE_EFFECT1        ; $1F
	const SLEEP_EFFECT               ; $20
	const POISON_SIDE_EFFECT2        ; $21
	const BURN_SIDE_EFFECT2          ; $22
	const SPEED_UP_SIDE_EFFECT       ; $23 ; PureRGBnote: ADDED: new effect, used in meditate
	const PARALYZE_SIDE_EFFECT2      ; $24
	const FLINCH_SIDE_EFFECT2        ; $25
	const OHKO_EFFECT                ; $26 moves like Horn Drill
	const CHARGE_EFFECT              ; $27 moves like Solar Beam
	const SUPER_FANG_EFFECT          ; $28
	const SPECIAL_DAMAGE_EFFECT      ; $29 Seismic Toss, Sonic Boom
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
;;;;;;;;;; PureRGB: ADDED: new move effects
	const ATTACK_UP_SIDE_EFFECT      ; $48 ; used in bide, sharpen, submission and meditate
	const ATTACK_ACCURACY_UP1_EFFECT ; $49 ; used in sharpen
	const ATTACK_DEFENSE_UP1_EFFECT  ; $4A ; used in bide
	const CONFUSION_BIG_SIDE_EFFECT  ; $4B ; used in Whirlwind and Dizzy punch
;;;;;;;;;;
	const CONFUSION_SIDE_EFFECT      ; $4C
	const TWINEEDLE_EFFECT           ; $4D
	const ATTACK_SPECIAL_SPEED_UP1   ; $4E ; PureRGBnote: ADDED: new effect, used in meditate
	const SUBSTITUTE_EFFECT          ; $4F
	const HYPER_BEAM_EFFECT          ; $50
	const BONEMERANG_EFFECT          ; $51
	const MIMIC_EFFECT               ; $52
	const METRONOME_EFFECT           ; $53
	const LEECH_SEED_EFFECT          ; $54
	const SPLASH_EFFECT              ; $55
	const DISABLE_EFFECT             ; $56
	const WITHDRAW_EFFECT            ; $57
	const GROWTH_EFFECT              ; $58
	const DEFENSE_CURL_EFFECT        ; $59 ; PureRGBnote: ADDED: new effect, makes super effective moves do neutral damage
	const ACID_ARMOR_EFFECT          ; $5A ; PureRGBnote: ADDED: new effect, does light screen and reflect in one move
	const EXPLODE_RECOIL_EFFECT      ; $5B ; PureRGBnote: ADDED: new effect, selfdestruct/explosion base effect, changes at lower health to EXPLODE_EFFECT
	const CONVERSION_EFFECT          ; $5C ; PureRGBnote: ADDED: new effect, used with conversion
DEF NUM_MOVE_EFFECTS EQU const_value - 1
