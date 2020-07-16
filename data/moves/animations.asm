AttackAnimationPointers:
	dw PoundAnim
	dw KarateChopAnim
	dw DoubleSlapAnim
	dw CometPunchAnim
	dw MegaPunchAnim
	dw PayDayAnim
	dw FirePunchAnim
	dw IcePunchAnim
	dw ThunderPunchAnim
	dw ScratchAnim
	dw VicegripAnim
	dw GuillotineAnim
	dw RazorWindAnim
	dw SwordsDanceAnim
	dw CutAnim
	dw GustAnim
	dw WingAttackAnim
	dw WhirlwindAnim
	dw FlyAnim
	dw BindAnim
	dw SlamAnim
	dw VineWhipAnim
	dw StompAnim
	dw DoubleKickAnim
	dw MegaKickAnim
	dw JumpKickAnim
	dw RollingKickAnim
	dw SandAttackAnim
	dw HeatButtAnim
	dw HornAttackAnim
	dw FuryAttackAnim
	dw HornDrillAnim
	dw TackleAnim
	dw BodySlamAnim
	dw WrapAnim
	dw TakeDownAnim
	dw ThrashAnim
	dw DoubleEdgeAnim
	dw TailWhipAnim
	dw PoisonStingAnim
	dw TwineedleAnim
	dw PinMissileAnim
	dw LeerAnim
	dw BiteAnim
	dw GrowlAnim
	dw RoarAnim
	dw SingAnim
	dw SupersonicAnim
	dw SonicBoomAnim
	dw DisableAnim
	dw AcidAnim
	dw EmberAnim
	dw FlamethrowerAnim
	dw MistAnim
	dw WaterGunAnim
	dw HydroPumpAnim
	dw SurfAnim
	dw IceBeamAnim
	dw BlizzardAnim
	dw PsyBeamAnim
	dw BubbleBeamAnim
	dw AuroraBeamAnim
	dw HyperBeamAnim
	dw PeckAnim
	dw DrillPeckAnim
	dw SubmissionAnim
	dw LowKickAnim
	dw CounterAnim
	dw SeismicTossAnim
	dw StrengthAnim
	dw AbsorbAnim
	dw MegaDrainAnim
	dw LeechSeedAnim
	dw GrowthAnim
	dw RazorLeafAnim
	dw SolarBeamAnim
	dw PoisonPowderAnim
	dw StunSporeAnim
	dw SleepPowderAnim
	dw PedalDanceAnim
	dw StringShotAnim
	dw DragonRageAnim
	dw FireSpinAnim
	dw ThunderShockAnim
	dw ThunderBoltAnim
	dw ThunderWaveAnim
	dw ThunderAnim
	dw RockThrowAnim
	dw EarthquakeAnim
	dw FissureAnim
	dw DigAnim
	dw ToxicAnim
	dw ConfusionAnim
	dw PsychicAnim
	dw HypnosisAnim
	dw MeditateAnim
	dw AgilityAnim
	dw QuickAttackAnim
	dw RageAnim
	dw TeleportAnim
	dw NightShadeAnim
	dw MimicAnim
	dw ScreechAnim
	dw DoubleTeamAnim
	dw RecoverAnim
	dw HardenAnim
	dw MinimizeAnim
	dw SmokeScreenAnim
	dw ConfuseRayAnim
	dw WithdrawAnim
	dw DefenseCurlAnim
	dw BarrierAnim
	dw LightScreenAnim
	dw HazeAnim
	dw ReflectAnim
	dw FocusEnergyAnim
	dw BideAnim
	dw MetronomeAnim
	dw MirrorMoveAnim
	dw SelfdestructAnim
	dw EggBombAnim
	dw LickAnim
	dw SmogAnim
	dw SludgeAnim
	dw BoneClubAnim
	dw FireBlastAnim
	dw WaterfallAnim
	dw ClampAnim
	dw SwiftAnim
	dw SkullBashAnim
	dw SpikeCannonAnim
	dw ConstrictAnim
	dw AmnesiaAnim
	dw KinesisAnim
	dw SoftboiledAnim
	dw HiJumpKickAnim
	dw GlareAnim
	dw DreamEaterAnim
	dw PoisonGasAnim
	dw BarrageAnim
	dw LeechLifeAnim
	dw LovelyKissAnim
	dw SkyAttackAnim
	dw TransformAnim
	dw BubbleAnim
	dw DizzyPunchAnim
	dw SporeAnim
	dw FlashAnim
	dw PsywaveAnim
	dw SplashAnim
	dw AcidArmorAnim
	dw CrabHammerAnim
	dw ExplosionAnim
	dw FurySwipesAnim
	dw BonemerangAnim
	dw RestAnim
	dw RockSlideAnim
	dw HyperFangAnim
	dw SharpenAnim
	dw ConversionAnim
	dw TriAttackAnim
	dw SuperFangAnim
	dw SlashAnim
	dw SubstituteAnim
	dw StruggleAnim
	dw ShowPicAnim
	dw EnemyFlashAnim
	dw PlayerFlashAnim
	dw EnemyHUDShakeAnim
	dw TradeBallDropAnim
	dw TradeBallAppear1Anim
	dw TradeBallAppear2Anim
	dw TradeBallPoofAnim
	dw XStatItemAnim
	dw XStatItemAnim
	dw ShrinkingSquareAnim
	dw ShrinkingSquareAnim
	dw XStatItemBlackAnim
	dw XStatItemBlackAnim
	dw ShrinkingSquareBlackAnim
	dw ShrinkingSquareBlackAnim
	dw UnusedAnim
	dw UnusedAnim
	dw ParalyzeAnim
	dw ParalyzeAnim
	dw PoisonAnim
	dw PoisonAnim
	dw SleepPlayerAnim
	dw SleepEnemyAnim
	dw ConfusedPlayerAnim
	dw ConfusedEnemyAnim
	dw FaintAnim
	dw BallTossAnim
	dw BallShakeAnim
	dw BallPoofAnim
	dw BallBlockAnim
	dw GreatTossAnim
	dw UltraTossAnim
	dw ShakeScreenAnim
	dw HidePicAnim
	dw ThrowRockAnim
	dw ThrowBaitAnim
	dw ZigZagScreenAnim

; each animation is a list of subanimations and special effects
; if first byte < $56
;	db tileset_and_delay, sound_id, subanimation_id
; if first byte >= $D8
;	db special_effect_id, sound_id
; $FF terminated
ZigZagScreenAnim:
	db SE_WAVY_SCREEN, $FF
	db $FF

PoundAnim:
StruggleAnim:
	db $08, $00, $01
	db $FF

KarateChopAnim:
	db $08, $01, $03
	db $FF

DoubleSlapAnim:
	db $05, $02, $01
	db $05, $02, $01
	db $FF

CometPunchAnim:
	db $04, $03, $02
	db $04, $03, $02
	db $FF

MegaPunchAnim:
	db $46, $04, $04
	db $FF

PayDayAnim:
	db $08, $00, $01
	db $04, $05, $52
	db $FF

FirePunchAnim:
	db $06, $06, $02
	db $46, $FF, $11
	db $FF

IcePunchAnim:
	db $06, $07, $02
	db $10, $FF, $2F
	db $FF

ThunderPunchAnim:
	db $06, $08, $02
	db SE_DARK_SCREEN_PALETTE, $FF
	db $46, $FF, $2B
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ScratchAnim:
	db $06, $09, $0F
	db $FF

VicegripAnim:
	db $08, $0A, $2A
	db $FF

GuillotineAnim:
	db $06, $0B, $2A
	db $FF

RazorWindAnim:
	db $04, $0C, $16
	db $FF

SwordsDanceAnim:
	db $46, $0D, $18
	db $46, $0D, $18
	db $46, $0D, $18
	db $FF

CutAnim:
	db SE_DARK_SCREEN_FLASH, $0E
	db $04, $FF, $16
	db $FF

GustAnim:
	db $46, $0F, $10
	db $06, $FF, $02
	db $FF

WingAttackAnim:
	db $46, $10, $04
	db $FF

WhirlwindAnim:
	db $46, $11, $10
	db SE_SLIDE_ENEMY_MON_OFF, $FF
	db $FF

FlyAnim:
	db $46, $12, $04
	db SE_SHOW_MON_PIC, $FF
	db $FF

BindAnim:
	db $04, $13, $23
	db $04, $13, $23
	db $FF

SlamAnim:
	db $06, $14, $02
	db $FF

VineWhipAnim:
	db $01, $15, $16
	db $08, $FF, $01
	db $FF

StompAnim:
	db $48, $16, $05
	db $FF

DoubleKickAnim:
	db $08, $17, $01
	db $08, $17, $01
	db $FF

MegaKickAnim:
	db $46, $18, $04
	db $FF

JumpKickAnim:
	db $46, $19, $04
	db $FF

RollingKickAnim:
	db SE_DARK_SCREEN_FLASH, $1A
	db $46, $FF, $04
	db $FF

SandAttackAnim:
	db $46, $1B, $28
	db $FF

HeatButtAnim:
	db $46, $1C, $05
	db $FF

HornAttackAnim:
	db $06, $1D, $45
	db $46, $FF, $05
	db $FF

FuryAttackAnim:
	db $02, $1E, $46
	db $02, $FF, $46
	db $FF

HornDrillAnim:
	db $42, $1F, $05
	db $42, $FF, $05
	db $42, $FF, $05
	db $42, $FF, $05
	db $42, $FF, $05
	db $FF

TackleAnim:
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_RESET_MON_POSITION, $FF
	db $FF

BodySlamAnim:
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_MON_POSITION, $FF
	db $FF

WrapAnim:
	db $04, $22, $23
	db $04, $22, $23
	db $04, $22, $23
	db $FF

TakeDownAnim:
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_DARK_SCREEN_FLASH, $23
	db SE_RESET_MON_POSITION, $FF
	db $FF

ThrashAnim:
	db $46, $24, $04
	db $FF

DoubleEdgeAnim:
	db SE_LIGHT_SCREEN_PALETTE, $48
	db $06, $FF, $2D
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_MOVE_MON_HORIZONTALLY, $FF
	db SE_DARK_SCREEN_FLASH, $25
	db SE_RESET_MON_POSITION, $FF
	db $FF

TailWhipAnim:
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db $FF

PoisonStingAnim:
	db $06, $27, $00
	db $FF

TwineedleAnim:
	db $05, $28, $01
	db $05, $28, $01
	db $FF

PinMissileAnim:
	db $03, $29, $01
	db $FF

LeerAnim:
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

BiteAnim:
	db $08, $2B, $02
	db $FF

GrowlAnim:
	db $46, $2C, $12
	db $FF

RoarAnim:
	db $46, $2D, $15
	db $46, $2D, $15
	db $46, $2D, $15
	db $FF

SingAnim:
	db $46, $2E, $12
	db $50, $FF, $40
	db $50, $FF, $40
	db $FF

SupersonicAnim:
	db $06, $2F, $31
	db $FF

SonicBoomAnim:
	db $46, $2D, $15
	db $46, $2D, $15
	db $46, $0F, $10
	db $46, $FF, $05
	db $FF

DisableAnim:
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

AcidAnim:
	db $46, $32, $13
	db $46, $32, $14
	db $FF

EmberAnim:
	db $46, $33, $11
	db $FF

FlamethrowerAnim:
	db $46, $34, $1F
	db $46, $34, $0C
	db $46, $34, $0D
	db $FF

MistAnim:
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

WaterGunAnim:
	db $06, $36, $2C
	db $FF

HydroPumpAnim:
	db $06, $37, $1A
	db $06, $37, $1A
	db $FF

SurfAnim:
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db $06, $37, $1A
	db $FF

IceBeamAnim:
	db $03, $39, $2E
	db $10, $FF, $2F
	db $FF

BlizzardAnim:
	db $04, $3A, $38
	db $04, $37, $38
	db $FF

PsyBeamAnim:
	db $03, $3B, $2E
	db SE_FLASH_SCREEN_LONG, $FF
	db $FF

BubbleBeamAnim:
	db $12, $3C, $35
	db $FF

AuroraBeamAnim:
	db $03, $3D, $2E
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db $FF

HyperBeamAnim:
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_SPIRAL_BALLS_INWARD, $FF
	db $02, $3E, $2E
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db $46, $04, $04
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

PeckAnim:
	db $08, $3F, $01
	db $FF

DrillPeckAnim:
	db $46, $40, $04
	db $FF

SubmissionAnim:
	db SE_SLIDE_MON_OFF, $41
	db $06, $FF, $01
	db SE_SHOW_MON_PIC, $FF
	db $FF

LowKickAnim:
	db SE_SLIDE_MON_OFF, $42
	db $46, $FF, $04
	db SE_SHOW_MON_PIC, $FF
	db $FF

CounterAnim:
	db SE_SLIDE_MON_OFF, $43
	db $46, $FF, $04
	db SE_SHOW_MON_PIC, $FF
	db $FF

SeismicTossAnim:
	db SE_BLINK_ENEMY_MON, $FF
	db $41, $8B, $4E
	db SE_HIDE_ENEMY_MON_PIC, $FF
	db SE_SLIDE_MON_OFF, $FF
	db $42, $44, $4F
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_SHOW_MON_PIC, $FF
	db $41, $44, $50
	db SE_SHOW_ENEMY_MON_PIC, $FF
	db SE_SHAKE_SCREEN, $FF
	db $FF

StrengthAnim:
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_RESET_MON_POSITION, $FF
	db $46, $06, $04
	db $FF

AbsorbAnim:
	db SE_LIGHT_SCREEN_PALETTE, $46
	db $06, $FF, $21
	db $06, $FF, $22
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

MegaDrainAnim:
	db SE_LIGHT_SCREEN_PALETTE, $47
	db SE_DARK_SCREEN_FLASH, $FF
	db $06, $FF, $21
	db $06, $FF, $22
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

LeechSeedAnim:
	db $46, $48, $1B
	db $55, $4D, $1C
	db $FF

GrowthAnim:
	db SE_LIGHT_SCREEN_PALETTE, $49
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

RazorLeafAnim:
	db SE_LEAVES_FALLING, $4A
	db $41, $80, $44
	db $01, $0C, $16
	db $FF

SolarBeamAnim:
	db $06, $4B, $2E
	db $06, $FF, $01
	db $FF

PoisonPowderAnim:
	db $06, $4C, $36
	db $FF

StunSporeAnim:
	db $06, $4D, $36
	db $FF

SleepPowderAnim:
	db $06, $4E, $36
	db $FF

PedalDanceAnim:
	db SE_LIGHT_SCREEN_PALETTE, $4F
	db SE_PETALS_FALLING, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

StringShotAnim:
	db $08, $50, $37
	db $FF

DragonRageAnim:
	db $46, $51, $1F
	db $46, $FF, $0C
	db $46, $FF, $0D
	db $46, $FF, $0E
	db $FF

FireSpinAnim:
	db $46, $52, $0C
	db $46, $FF, $0D
	db $46, $FF, $0E
	db $FF

ThunderShockAnim:
	db $42, $53, $29
	db $FF

ThunderBoltAnim:
	db $41, $54, $29
	db $41, $54, $29
	db $FF

ThunderWaveAnim:
	db $42, $55, $29
	db $02, $FF, $23
	db $04, $FF, $23
	db $FF

ThunderAnim:
	db SE_DARK_SCREEN_PALETTE, $56
	db SE_DARK_SCREEN_FLASH, $FF
	db $46, $FF, $2B
	db SE_DARK_SCREEN_FLASH, $FF
	db $42, $54, $29
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

RockThrowAnim:
	db $04, $57, $30
	db $FF

EarthquakeAnim:
	db SE_SHAKE_SCREEN, $58
	db SE_SHAKE_SCREEN, $58
	db $FF

FissureAnim:
	db SE_DARK_SCREEN_FLASH, $59
	db SE_SHAKE_SCREEN, $FF
	db SE_DARK_SCREEN_FLASH, $59
	db SE_SHAKE_SCREEN, $FF
	db $FF

DigAnim:
	db $46, $5A, $04
	db SE_SLIDE_MON_UP, $FF
	db $FF

ToxicAnim:
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db $46, $5B, $14
	db $FF

ConfusionAnim:
	db SE_FLASH_SCREEN_LONG, $5C
	db $FF

PsychicAnim:
	db SE_FLASH_SCREEN_LONG, $5D
	db SE_WAVY_SCREEN, $FF
	db $FF

HypnosisAnim:
	db SE_FLASH_SCREEN_LONG, $5E
	db $FF

MeditateAnim:
	db SE_LIGHT_SCREEN_PALETTE, $5F
	db $46, $FF, $43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

AgilityAnim:
	db SE_LIGHT_SCREEN_PALETTE, $60
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

QuickAttackAnim:
	db SE_SLIDE_MON_OFF, $61
	db $46, $FF, $04
	db SE_SHOW_MON_PIC, $FF
	db $FF

RageAnim:
	db $06, $62, $01
	db $FF

TeleportAnim:
	db SE_SQUISH_MON_PIC, $63
	db SE_SHOOT_BALLS_UPWARD, $FF
	db $FF

NightShadeAnim:
	db SE_FLASH_SCREEN_LONG, $5C
	db SE_WAVY_SCREEN, $FF
	db $FF

MimicAnim:
	db $46, $65, $21
	db $46, $65, $22
	db $FF

ScreechAnim:
	db $46, $66, $12
	db $FF

DoubleTeamAnim:
	db SE_DARK_SCREEN_PALETTE, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_SHAKE_BACK_AND_FORTH, $67
	db SE_SHOW_MON_PIC, $FF
	db $46, $6F, $33
	db $FF

RecoverAnim:
	db SE_BLINK_MON, $68
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

HardenAnim:
	db SE_LIGHT_SCREEN_PALETTE, $69
	db $46, $FF, $43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

MinimizeAnim:
	db SE_LIGHT_SCREEN_PALETTE, $6A
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_MINIMIZE_MON, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

SmokeScreenAnim:
	db $46, $6B, $28
	db $04, $FF, $0A
	db SE_DARKEN_MON_PALETTE, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DARK_SCREEN_PALETTE, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DARKEN_MON_PALETTE, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ConfuseRayAnim:
	db SE_DARK_SCREEN_PALETTE, $6C
	db $46, $FF, $3E
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

WithdrawAnim:
	db SE_LIGHT_SCREEN_PALETTE, $6E
	db SE_SLIDE_MON_DOWN, $FF
	db $06, $FF, $51
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_SHOW_MON_PIC, $FF
	db $FF

DefenseCurlAnim:
	db SE_LIGHT_SCREEN_PALETTE, $6E
	db $06, $FF, $43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

BarrierAnim:
	db $46, $6F, $33
	db $46, $6F, $33
	db $FF

LightScreenAnim:
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db $46, $70, $33
	db $46, $70, $33
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

HazeAnim:
	db SE_DARKEN_MON_PALETTE, $FF
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ReflectAnim:
	db SE_DARK_SCREEN_PALETTE, $FF
	db $46, $72, $33
	db $46, $72, $33
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

FocusEnergyAnim:
	db SE_SPIRAL_BALLS_INWARD, $73
	db $FF

BideAnim:
	db $46, $74, $04
	db $FF

MetronomeAnim:
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db $FF

MirrorMoveAnim:
	db $08, $76, $01
	db $FF

SelfdestructAnim:
	db $43, $77, $34
	db $FF

EggBombAnim:
	db $44, $78, $41
	db $44, $78, $42
	db $FF

LickAnim:
	db $46, $7B, $14
	db $FF

SmogAnim:
	db SE_DARKEN_MON_PALETTE, $48
	db $46, $7A, $19
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

SludgeAnim:
	db $46, $7B, $13
	db $46, $7B, $14
	db $FF

BoneClubAnim:
	db $08, $7C, $02
	db $FF

FireBlastAnim:
	db $46, $7D, $1F
	db $46, $FF, $20
	db $46, $FF, $20
	db $46, $FF, $0C
	db $46, $FF, $0D
	db $FF

WaterfallAnim:
	db SE_SLIDE_MON_DOWN, $48
	db $06, $37, $1A
	db $08, $FF, $02
	db SE_SLIDE_MON_UP, $FF
	db $FF

ClampAnim:
	db $08, $7F, $2A
	db $06, $83, $23
	db $06, $83, $23
	db $FF

SwiftAnim:
	db $43, $80, $3F
	db $FF

SkullBashAnim:
	db $46, $81, $05
	db $FF

SpikeCannonAnim:
	db $44, $82, $04
	db $FF

ConstrictAnim:
	db $06, $83, $23
	db $06, $83, $23
	db $06, $83, $23
	db $FF

AmnesiaAnim:
	db $08, $84, $25
	db $08, $84, $25
	db $FF

KinesisAnim:
	db $08, $85, $01
	db $FF

SoftboiledAnim:
	db SE_SLIDE_MON_HALF_OFF, $48
	db $08, $86, $4C
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_SHOW_MON_PIC, $FF
	db $FF

HiJumpKickAnim:
	db $46, $87, $04
	db $FF

GlareAnim:
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $88
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

DreamEaterAnim:
	db SE_FLASH_SCREEN_LONG, $89
	db SE_DARK_SCREEN_PALETTE, $89
	db $08, $89, $02
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

PoisonGasAnim:
	db $46, $8A, $19
	db $FF

BarrageAnim:
	db $43, $8B, $41
	db $05, $FF, $55
	db $FF

LeechLifeAnim:
	db $08, $8C, $02
	db SE_DARK_SCREEN_FLASH, $FF
	db $06, $FF, $21
	db $06, $FF, $22
	db SE_DARK_SCREEN_FLASH, $FF
	db $FF

LovelyKissAnim:
	db $06, $8D, $12
	db $FF

SkyAttackAnim:
	db SE_SQUISH_MON_PIC, $8E
	db SE_SHOOT_BALLS_UPWARD, $FF
	db $46, $87, $04
	db SE_SHOW_MON_PIC, $FF
	db $FF

TransformAnim:
	db $46, $8F, $21
	db $44, $8F, $22
	db $08, $FF, $47
	db SE_TRANSFORM_MON, $FF
	db $FF

BubbleAnim:
	db $16, $90, $35
	db $FF

DizzyPunchAnim:
	db $06, $91, $17
	db $06, $91, $17
	db $06, $91, $17
	db $06, $02, $02
	db $FF

SporeAnim:
	db $06, $92, $36
	db $FF

FlashAnim:
	db SE_LIGHT_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $88
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

PsywaveAnim:
	db $06, $2F, $31
	db SE_WAVY_SCREEN, $5C
	db $FF

SplashAnim:
	db SE_BOUNCE_UP_AND_DOWN, $95
	db $FF

AcidArmorAnim:
	db SE_SLIDE_MON_DOWN_AND_HIDE, $96
	db $FF

CrabHammerAnim:
	db $46, $97, $05
	db $06, $FF, $2A
	db $FF

ExplosionAnim:
	db $43, $98, $34
	db $FF

FurySwipesAnim:
	db $04, $99, $0F
	db $FF

BonemerangAnim:
	db $06, $9A, $02
	db $FF

RestAnim:
	db $10, $9B, $3A
	db $10, $9B, $3A
	db $FF

RockSlideAnim:
	db $04, $9C, $1D
	db $03, $9C, $1E
	db $46, $9D, $04
	db $FF

HyperFangAnim:
	db $06, $9D, $02
	db $FF

SharpenAnim:
	db SE_LIGHT_SCREEN_PALETTE, $9E
	db $46, $FF, $43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ConversionAnim:
	db SE_DARK_SCREEN_FLASH, $9F
	db $46, $FF, $21
	db $46, $FF, $22
	db SE_DARK_SCREEN_FLASH, $FF
	db $FF

TriAttackAnim:
	db SE_DARK_SCREEN_FLASH, $A0
	db $46, $FF, $4D
	db SE_DARK_SCREEN_FLASH, $FF
	db $FF

SuperFangAnim:
	db SE_DARK_SCREEN_PALETTE, $48
	db $46, $A1, $04
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

SlashAnim:
	db $06, $A2, $0F
	db $FF

SubstituteAnim:
	db SE_SLIDE_MON_OFF, $A3
	db $08, $FF, $47
	db SE_SUBSTITUTE_MON, $FF
	db $FF

BallTossAnim:
	db $03, $FF, $06
	db $FF

GreatTossAnim:
	db $03, $FF, $07
	db $FF

UltraTossAnim:
	db $02, $FF, $08
	db $FF

BallShakeAnim:
	db $04, $FF, $09
	db $FF

BallPoofAnim:
	db $04, $FF, $0A
	db $FF

ShowPicAnim:
	db SE_SHOW_ENEMY_MON_PIC, $FF
	db $FF

HidePicAnim:
	db SE_HIDE_ENEMY_MON_PIC, $FF
	db $FF

EnemyFlashAnim:
	db SE_SHOW_MON_PIC, $FF
	db $FF

PlayerFlashAnim:
	db SE_FLASH_MON_PIC, $FF
	db $FF

EnemyHUDShakeAnim:
	db SE_SHAKE_ENEMY_HUD, $FF
	db $FF

TradeBallDropAnim:
	db $86, $FF, $48
	db $FF

TradeBallAppear1Anim:
	db $84, $FF, $49
	db $FF

TradeBallAppear2Anim:
	db $86, $FF, $4A
	db $FF

TradeBallPoofAnim:
	db $86, $FF, $4B
	db $FF

XStatItemAnim:
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ShrinkingSquareAnim:
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db $46, $FF, $43
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

XStatItemBlackAnim:
	db SE_DARKEN_MON_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ShrinkingSquareBlackAnim:
	db SE_DARKEN_MON_PALETTE, $FF
	db $46, $FF, $43
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

UnusedAnim:
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SHOOT_MANY_BALLS_UPWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ParalyzeAnim:
	db $04, $13, $24
	db $04, $13, $24
	db $FF

PoisonAnim:
	db $08, $13, $27
	db $08, $13, $27
	db $FF

SleepPlayerAnim:
	db $10, $9B, $3A
	db $10, $9B, $3A
	db $FF

SleepEnemyAnim:
	db $10, $9B, $3B
	db $10, $9B, $3B
	db $FF

ConfusedPlayerAnim:
	db $08, $84, $25
	db $08, $84, $25
	db $FF

ConfusedEnemyAnim:
	db $08, $84, $26
	db $08, $84, $26
	db $FF

BallBlockAnim:
	db $03, $FF, $0B
	db $FF

FaintAnim:
	db SE_SLIDE_MON_DOWN, $5A
	db $FF

ShakeScreenAnim:
	db SE_SHAKE_SCREEN, $FF
	db $FF

ThrowRockAnim:
	db $03, $8B, $53
	db $FF

ThrowBaitAnim:
	db $03, $8B, $54
	db $FF
