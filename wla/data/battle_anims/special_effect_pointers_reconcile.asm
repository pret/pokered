; Reconciled from master RGBDS source: data/battle_anims/special_effect_pointers.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

SpecialEffectPointers:
.DB SE_DARK_SCREEN_FLASH ; $FE
.DW AnimationFlashScreen
.DB SE_DARK_SCREEN_PALETTE ; $FD
.DW AnimationDarkScreenPalette
.DB SE_RESET_SCREEN_PALETTE ; $FC
.DW AnimationResetScreenPalette
.DB SE_SHAKE_SCREEN ; $FB
.DW AnimationShakeScreen
.DB SE_WATER_DROPLETS_EVERYWHERE ; $FA
.DW AnimationWaterDropletsEverywhere
.DB SE_DARKEN_MON_PALETTE ; $F9
.DW AnimationDarkenMonPalette
.DB SE_FLASH_SCREEN_LONG ; $F8
.DW AnimationFlashScreenLong
.DB SE_SLIDE_MON_UP ; $F7
.DW AnimationSlideMonUp
.DB SE_SLIDE_MON_DOWN ; $F6
.DW AnimationSlideMonDown
.DB SE_FLASH_MON_PIC ; $F5
.DW AnimationFlashMonPic
.DB SE_SLIDE_MON_OFF ; $F4
.DW AnimationSlideMonOff
.DB SE_BLINK_MON ; $F3
.DW AnimationBlinkMon
.DB SE_MOVE_MON_HORIZONTALLY ; $F2
.DW AnimationMoveMonHorizontally
.DB SE_RESET_MON_POSITION ; $F1
.DW AnimationResetMonPosition
.DB SE_LIGHT_SCREEN_PALETTE ; $F0
.DW AnimationLightScreenPalette
.DB SE_HIDE_MON_PIC ; $EF
.DW AnimationHideMonPic
.DB SE_SQUISH_MON_PIC ; $EE
.DW AnimationSquishMonPic
.DB SE_SHOOT_BALLS_UPWARD ; $ED
.DW AnimationShootBallsUpward
.DB SE_SHOOT_MANY_BALLS_UPWARD ; $EC
.DW AnimationShootManyBallsUpward
.DB SE_BOUNCE_UP_AND_DOWN ; $EB
.DW AnimationBoundUpAndDown
.DB SE_MINIMIZE_MON ; $EA
.DW AnimationMinimizeMon
.DB SE_SLIDE_MON_DOWN_AND_HIDE ; $E9
.DW AnimationSlideMonDownAndHide
.DB SE_TRANSFORM_MON ; $E8
.DW AnimationTransformMon
.DB SE_LEAVES_FALLING ; $E7
.DW AnimationLeavesFalling
.DB SE_PETALS_FALLING ; $E6
.DW AnimationPetalsFalling
.DB SE_SLIDE_MON_HALF_OFF ; $E5
.DW AnimationSlideMonHalfOff
.DB SE_SHAKE_ENEMY_HUD ; $E4
.DW AnimationShakeEnemyHUD
.DB SE_SHAKE_ENEMY_HUD_2 ; $E3 unused
.DW AnimationShakeEnemyHUD
.DB SE_SPIRAL_BALLS_INWARD ; $E2
.DW AnimationSpiralBallsInward
.DB SE_DELAY_ANIMATION_10 ; $E1
.DW AnimationDelay10
.DB SE_FLASH_ENEMY_MON_PIC ; $E0 unused
.DW AnimationFlashEnemyMonPic
.DB SE_HIDE_ENEMY_MON_PIC ; $DF
.DW AnimationHideEnemyMonPic
.DB SE_BLINK_ENEMY_MON ; $DE
.DW AnimationBlinkEnemyMon
.DB SE_SHOW_MON_PIC ; $DD
.DW AnimationShowMonPic
.DB SE_SHOW_ENEMY_MON_PIC ; $DC
.DW AnimationShowEnemyMonPic
.DB SE_SLIDE_ENEMY_MON_OFF ; $DB
.DW AnimationSlideEnemyMonOff
.DB SE_SHAKE_BACK_AND_FORTH ; $DA
.DW AnimationShakeBackAndForth
.DB SE_SUBSTITUTE_MON ; $D9
.DW AnimationSubstitute
.DB SE_WAVY_SCREEN ; $D8
.DW AnimationWavyScreen
.DB -1 ; end
