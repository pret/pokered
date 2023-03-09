; These are move effects (second value from the Moves table in bank $E).
ResidualEffects1:
; most non-side effects
	db HAZE_EFFECT
	db TELEPORT_EFFECT
	db MIST_EFFECT
	db FOCUS_ENERGY_EFFECT
	db CONFUSION_EFFECT
	db HEAL_EFFECT
	db TRANSFORM_EFFECT
	db LIGHT_SCREEN_EFFECT
	db REFLECT_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db BURN_EFFECT ; PureRGBnote: ADDED:
	db SUBSTITUTE_EFFECT
	db LEECH_SEED_EFFECT
	db SPLASH_EFFECT
	db -1 ; end
