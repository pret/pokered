MACRO anim_special_effect
	db \1
	dw \2
ENDM

AnimationIdSpecialEffects:
	; animation id, effect routine address
	anim_special_effect MEGA_PUNCH,            AnimationFlashScreen
	anim_special_effect GUILLOTINE,            AnimationFlashScreen
	anim_special_effect MEGA_KICK,             AnimationFlashScreen
	anim_special_effect HEADBUTT,              AnimationFlashScreen
	anim_special_effect TAIL_WHIP,             TailWhipAnimationUnused
	anim_special_effect GROWL,                 DoGrowlSpecialEffects
	anim_special_effect DISABLE,               AnimationFlashScreen
	anim_special_effect BLIZZARD,              DoBlizzardSpecialEffects
	anim_special_effect BUBBLEBEAM,            AnimationFlashScreen
	anim_special_effect HYPER_BEAM,            FlashScreenEveryFourFrameBlocks
	anim_special_effect THUNDERBOLT,           FlashScreenEveryEightFrameBlocks
	anim_special_effect REFLECT,               AnimationFlashScreen
	anim_special_effect SELFDESTRUCT,          DoExplodeSpecialEffects
	anim_special_effect SPORE,                 AnimationFlashScreen
	anim_special_effect EXPLOSION,             DoExplodeSpecialEffects
	anim_special_effect ROCK_SLIDE,            DoRockSlideSpecialEffects
	anim_special_effect TRADE_BALL_DROP_ANIM,  TradeHidePokemon
	anim_special_effect TRADE_BALL_SHAKE_ANIM, TradeShakePokeball
	anim_special_effect TRADE_BALL_TILT_ANIM,  TradeJumpPokeball
	anim_special_effect TOSS_ANIM,             DoBallTossSpecialEffects
	anim_special_effect SHAKE_ANIM,            DoBallShakeSpecialEffects
	anim_special_effect POOF_ANIM,             DoPoofSpecialEffects
	anim_special_effect GREATTOSS_ANIM,        DoBallTossSpecialEffects
	anim_special_effect ULTRATOSS_ANIM,        DoBallTossSpecialEffects
	db -1 ; end
