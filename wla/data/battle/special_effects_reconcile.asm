; Reconciled from master RGBDS source: data/battle/special_effects.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; Effects from arrays 2, 4, and 5B, minus Twineedle and Rage.
; Includes all effects that do not need to be called at the end of
; ExecutePlayerMove (or ExecuteEnemyMove), because they have already been handled
SpecialEffects:
.DB DRAIN_HP_EFFECT
.DB EXPLODE_EFFECT
.DB DREAM_EATER_EFFECT
.DB PAY_DAY_EFFECT
.DB SWIFT_EFFECT
.DB TWO_TO_FIVE_ATTACKS_EFFECT
.DB EFFECT_1E
.DB CHARGE_EFFECT
.DB SUPER_FANG_EFFECT
.DB SPECIAL_DAMAGE_EFFECT
.DB FLY_EFFECT
.DB ATTACK_TWICE_EFFECT
.DB JUMP_KICK_EFFECT
.DB RECOIL_EFFECT
; fallthrough
SpecialEffectsCont:
; damaging moves whose effect is executed prior to damage calculation
.DB THRASH_PETAL_DANCE_EFFECT
.DB TRAPPING_EFFECT
.DB -1
