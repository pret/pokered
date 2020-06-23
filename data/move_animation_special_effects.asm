; Format: Animation ID (1 byte), Address (2 bytes)
AnimationIdSpecialEffects:
	db MEGA_PUNCH
	dw AnimationFlashScreen

	db GUILLOTINE
	dw AnimationFlashScreen

	db MEGA_KICK
	dw AnimationFlashScreen

	db HEADBUTT
	dw AnimationFlashScreen

	db TAIL_WHIP
	dw TailWhipAnimationUnused

	db GROWL
	dw DoGrowlSpecialEffects

	db DISABLE
	dw AnimationFlashScreen

	db BLIZZARD
	dw DoBlizzardSpecialEffects

	db BUBBLEBEAM
	dw AnimationFlashScreen

	db HYPER_BEAM
	dw FlashScreenEveryFourFrameBlocks

	db THUNDERBOLT
	dw FlashScreenEveryEightFrameBlocks

	db REFLECT
	dw AnimationFlashScreen

	db SELFDESTRUCT
	dw DoExplodeSpecialEffects

	db SPORE
	dw AnimationFlashScreen

	db EXPLOSION
	dw DoExplodeSpecialEffects

	db ROCK_SLIDE
	dw DoRockSlideSpecialEffects

	db TRADE_BALL_DROP_ANIM
	dw TradeHidePokemon

	db TRADE_BALL_SHAKE_ANIM
	dw TradeShakePokeball

	db TRADE_BALL_TILT_ANIM
	dw TradeJumpPokeball

	db TOSS_ANIM
	dw DoBallTossSpecialEffects

	db SHAKE_ANIM
	dw DoBallShakeSpecialEffects

	db POOF_ANIM
	dw DoPoofSpecialEffects

	db GREATTOSS_ANIM
	dw DoBallTossSpecialEffects

	db ULTRATOSS_ANIM
	dw DoBallTossSpecialEffects

	db $FF ; terminator
