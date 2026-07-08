; Reconciled from master RGBDS source: data/battle_anims/special_effects.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; AnimationIdSpecialEffects:
.DB MEGA_PUNCH, AnimationFlashScreen
.DB GUILLOTINE, AnimationFlashScreen
.DB MEGA_KICK, AnimationFlashScreen
.DB HEADBUTT, AnimationFlashScreen
.DB TAIL_WHIP, TailWhipAnimationUnused
.DB GROWL, DoGrowlSpecialEffects
.DB DISABLE, AnimationFlashScreen
.DB BLIZZARD, DoBlizzardSpecialEffects
.DB BUBBLEBEAM, AnimationFlashScreen
.DB HYPER_BEAM, FlashScreenEveryFourFrameBlocks
.DB THUNDERBOLT, FlashScreenEveryEightFrameBlocks
.DB REFLECT, AnimationFlashScreen
.DB SELFDESTRUCT, DoExplodeSpecialEffects
.DB SPORE, AnimationFlashScreen
.DB EXPLOSION, DoExplodeSpecialEffects
.DB ROCK_SLIDE, DoRockSlideSpecialEffects
.DB TRADE_BALL_DROP_ANIM, TradeHidePokemon
.DB TRADE_BALL_SHAKE_ANIM, TradeShakePokeball
.DB TRADE_BALL_TILT_ANIM, TradeJumpPokeball
.DB TOSS_ANIM, DoBallTossSpecialEffects
.DB SHAKE_ANIM, DoBallShakeSpecialEffects
.DB POOF_ANIM, DoPoofSpecialEffects
.DB GREATTOSS_ANIM, DoBallTossSpecialEffects
.DB ULTRATOSS_ANIM, DoBallTossSpecialEffects
.DB -1 ; end
