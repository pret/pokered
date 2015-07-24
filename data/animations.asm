AttackAnimationPointers: ; 7a07d (1e:607d)
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
ZigZagScreenAnim: ; 7a213 (1e:6213)
	db SE_WAVY_SCREEN, $FF
	db $FF

PoundAnim: ; 7a216 (1e:6216)
StruggleAnim: ; 7a216 (1e:6216)
	db $08,$00,$01
	db $FF

KarateChopAnim: ; 7a21a (1e:621a)
	db $08,$01,$03
	db $FF

DoubleSlapAnim: ; 7a21e (1e:621e)
	db $05,$02,$01
	db $05,$02,$01
	db $FF

CometPunchAnim: ; 7a225 (1e:6225)
	db $04,$03,$02
	db $04,$03,$02
	db $FF

MegaPunchAnim: ; 7a22c (1e:622c)
	db $46,$04,$04
	db $FF

PayDayAnim: ; 7a230 (1e:6230)
	db $08,$00,$01
	db $04,$05,$52
	db $FF

FirePunchAnim: ; 7a237 (1e:6237)
	db $06,$06,$02
	db $46,$FF,$11
	db $FF

IcePunchAnim: ; 7a23e (1e:623e)
	db $06,$07,$02
	db $10,$FF,$2F
	db $FF

ThunderPunchAnim: ; 7a245 (1e:6245)
	db $06,$08,$02
	db SE_DARK_SCREEN_PALETTE, $FF
	db $46,$FF,$2B
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ScratchAnim: ; 7a250 (1e:6250)
	db $06,$09,$0F
	db $FF

VicegripAnim: ; 7a254 (1e:6254)
	db $08,$0A,$2A
	db $FF

GuillotineAnim: ; 7a258 (1e:6258)
	db $06,$0B,$2A
	db $FF

RazorWindAnim: ; 7a25c (1e:625c)
	db $04,$0C,$16
	db $FF

SwordsDanceAnim: ; 7a260 (1e:6260)
	db $46,$0D,$18
	db $46,$0D,$18
	db $46,$0D,$18
	db $FF

CutAnim: ; 7a26a (1e:626a)
	db SE_DARK_SCREEN_FLASH, $0E
	db $04,$FF,$16
	db $FF

GustAnim: ; 7a270 (1e:6270)
	db $46,$0F,$10
	db $06,$FF,$02
	db $FF

WingAttackAnim: ; 7a277 (1e:6277)
	db $46,$10,$04
	db $FF

WhirlwindAnim: ; 7a27b (1e:627b)
	db $46,$11,$10
	db SE_SLIDE_ENEMY_MON_OFF, $FF
	db $FF

FlyAnim: ; 7a281 (1e:6281)
	db $46,$12,$04
	db SE_SHOW_MON_PIC, $FF
	db $FF

BindAnim: ; 7a287 (1e:6287)
	db $04,$13,$23
	db $04,$13,$23
	db $FF

SlamAnim: ; 7a28e (1e:628e)
	db $06,$14,$02
	db $FF

VineWhipAnim: ; 7a292 (1e:6292)
	db $01,$15,$16
	db $08,$FF,$01
	db $FF

StompAnim: ; 7a299 (1e:6299)
	db $48,$16,$05
	db $FF

DoubleKickAnim: ; 7a29d (1e:629d)
	db $08,$17,$01
	db $08,$17,$01
	db $FF

MegaKickAnim: ; 7a2a4 (1e:62a4)
	db $46,$18,$04
	db $FF

JumpKickAnim: ; 7a2a8 (1e:62a8)
	db $46,$19,$04
	db $FF

RollingKickAnim: ; 7a2ac (1e:62ac)
	db SE_DARK_SCREEN_FLASH, $1A
	db $46,$FF,$04
	db $FF

SandAttackAnim: ; 7a2b2 (1e:62b2)
	db $46,$1B,$28
	db $FF

HeatButtAnim: ; 7a2b6 (1e:62b6)
	db $46,$1C,$05
	db $FF

HornAttackAnim: ; 7a2ba (1e:62ba)
	db $06,$1D,$45
	db $46,$FF,$05
	db $FF

FuryAttackAnim: ; 7a2c1 (1e:62c1)
	db $02,$1E,$46
	db $02,$FF,$46
	db $FF

HornDrillAnim: ; 7a2c8 (1e:62c8)
	db $42,$1F,$05
	db $42,$FF,$05
	db $42,$FF,$05
	db $42,$FF,$05
	db $42,$FF,$05
	db $FF

TackleAnim: ; 7a2d8 (1e:62d8)
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_RESET_MON_POSITION, $FF
	db $FF

BodySlamAnim: ; 7a2dd (1e:62dd)
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_MON_POSITION, $FF
	db $FF

WrapAnim: ; 7a2e6 (1e:62e6)
	db $04,$22,$23
	db $04,$22,$23
	db $04,$22,$23
	db $FF

TakeDownAnim: ; 7a2f0 (1e:62f0)
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_DARK_SCREEN_FLASH, $23
	db SE_RESET_MON_POSITION, $FF
	db $FF

ThrashAnim: ; 7a2f7 (1e:62f7)
	db $46,$24,$04
	db $FF

DoubleEdgeAnim: ; 7a2fb (1e:62fb)
	db SE_LIGHT_SCREEN_PALETTE, $48
	db $06,$FF,$2D
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_MOVE_MON_HORIZONTALLY, $FF
	db SE_DARK_SCREEN_FLASH, $25
	db SE_RESET_MON_POSITION, $FF
	db $FF

TailWhipAnim: ; 7a309 (1e:6309)
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db $FF

PoisonStingAnim: ; 7a318 (1e:6318)
	db $06,$27,$00
	db $FF

TwineedleAnim: ; 7a31c (1e:631c)
	db $05,$28,$01
	db $05,$28,$01
	db $FF

PinMissileAnim: ; 7a323 (1e:6323)
	db $03,$29,$01
	db $FF

LeerAnim: ; 7a327 (1e:6327)
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

BiteAnim: ; 7a330 (1e:6330)
	db $08,$2B,$02
	db $FF

GrowlAnim: ; 7a334 (1e:6334)
	db $46,$2C,$12
	db $FF

RoarAnim: ; 7a338 (1e:6338)
	db $46,$2D,$15
	db $46,$2D,$15
	db $46,$2D,$15
	db $FF

SingAnim: ; 7a342 (1e:6342)
	db $46,$2E,$12
	db $50,$FF,$40
	db $50,$FF,$40
	db $FF

SupersonicAnim: ; 7a34c (1e:634c)
	db $06,$2F,$31
	db $FF

SonicBoomAnim: ; 7a350 (1e:6350)
	db $46,$2D,$15
	db $46,$2D,$15
	db $46,$0F,$10
	db $46,$FF,$05
	db $FF

DisableAnim: ; 7a35d (1e:635d)
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_DARK_SCREEN_FLASH, $2A
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

AcidAnim: ; 7a366 (1e:6366)
	db $46,$32,$13
	db $46,$32,$14
	db $FF

EmberAnim: ; 7a36d (1e:636d)
	db $46,$33,$11
	db $FF

FlamethrowerAnim: ; 7a371 (1e:6371)
	db $46,$34,$1F
	db $46,$34,$0C
	db $46,$34,$0D
	db $FF

MistAnim: ; 7a37b (1e:637b)
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

WaterGunAnim: ; 7a382 (1e:6382)
	db $06,$36,$2C
	db $FF

HydroPumpAnim: ; 7a386 (1e:6386)
	db $06,$37,$1A
	db $06,$37,$1A
	db $FF

SurfAnim: ; 7a38d (1e:638d)
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db $06,$37,$1A
	db $FF

IceBeamAnim: ; 7a393 (1e:6393)
	db $03,$39,$2E
	db $10,$FF,$2F
	db $FF

BlizzardAnim: ; 7a39a (1e:639a)
	db $04,$3A,$38
	db $04,$37,$38
	db $FF

PsyBeamAnim: ; 7a3a1 (1e:63a1)
	db $03,$3B,$2E
	db SE_FLASH_SCREEN_LONG, $FF
	db $FF

BubbleBeamAnim: ; 7a3a7 (1e:63a7)
	db $12,$3C,$35
	db $FF

AuroraBeamAnim: ; 7a3ab (1e:63ab)
	db $03,$3D,$2E
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db $FF

HyperBeamAnim: ; 7a3b3 (1e:63b3)
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_SPIRAL_BALLS_INWARD, $FF
	db $02,$3E,$2E
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db $46,$04,$04
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

PeckAnim: ; 7a3c4 (1e:63c4)
	db $08,$3F,$01
	db $FF

DrillPeckAnim: ; 7a3c8 (1e:63c8)
	db $46,$40,$04
	db $FF

SubmissionAnim: ; 7a3cc (1e:63cc)
	db SE_SLIDE_MON_OFF, $41
	db $06,$FF,$01
	db SE_SHOW_MON_PIC, $FF
	db $FF

LowKickAnim: ; 7a3d4 (1e:63d4)
	db SE_SLIDE_MON_OFF, $42
	db $46,$FF,$04
	db SE_SHOW_MON_PIC, $FF
	db $FF

CounterAnim: ; 7a3dc (1e:63dc)
	db SE_SLIDE_MON_OFF, $43
	db $46,$FF,$04
	db SE_SHOW_MON_PIC, $FF
	db $FF

SeismicTossAnim: ; 7a3e4 (1e:63e4)
	db SE_BLINK_ENEMY_MON, $FF
	db $41,$8B,$4E
	db SE_HIDE_ENEMY_MON_PIC, $FF
	db SE_SLIDE_MON_OFF, $FF
	db $42,$44,$4F
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_SHOW_MON_PIC, $FF
	db $41,$44,$50
	db SE_SHOW_ENEMY_MON_PIC, $FF
	db SE_SHAKE_SCREEN, $FF
	db $FF

StrengthAnim: ; 7a3fe (1e:63fe)
	db SE_MOVE_MON_HORIZONTALLY, $48
	db SE_RESET_MON_POSITION, $FF
	db $46,$06,$04
	db $FF

AbsorbAnim: ; 7a406 (1e:6406)
	db SE_LIGHT_SCREEN_PALETTE, $46
	db $06,$FF,$21
	db $06,$FF,$22
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

MegaDrainAnim: ; 7a411 (1e:6411)
	db SE_LIGHT_SCREEN_PALETTE, $47
	db SE_DARK_SCREEN_FLASH, $FF
	db $06,$FF,$21
	db $06,$FF,$22
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

LeechSeedAnim: ; 7a420 (1e:6420)
	db $46,$48,$1B
	db $55,$4D,$1C
	db $FF

GrowthAnim: ; 7a427 (1e:6427)
	db SE_LIGHT_SCREEN_PALETTE, $49
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

RazorLeafAnim: ; 7a42e (1e:642e)
	db SE_LEAVES_FALLING, $4A
	db $41,$80,$44
	db $01,$0C,$16
	db $FF

SolarBeamAnim: ; 7a437 (1e:6437)
	db $06,$4B,$2E
	db $06,$FF,$01
	db $FF

PoisonPowderAnim: ; 7a43e (1e:643e)
	db $06,$4C,$36
	db $FF

StunSporeAnim: ; 7a442 (1e:6442)
	db $06,$4D,$36
	db $FF

SleepPowderAnim: ; 7a446 (1e:6446)
	db $06,$4E,$36
	db $FF

PedalDanceAnim: ; 7a44a (1e:644a)
	db SE_LIGHT_SCREEN_PALETTE, $4F
	db SE_PETALS_FALLING, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

StringShotAnim: ; 7a451 (1e:6451)
	db $08,$50,$37
	db $FF

DragonRageAnim: ; 7a455 (1e:6455)
	db $46,$51,$1F
	db $46,$FF,$0C
	db $46,$FF,$0D
	db $46,$FF,$0E
	db $FF

FireSpinAnim: ; 7a462 (1e:6462)
	db $46,$52,$0C
	db $46,$FF,$0D
	db $46,$FF,$0E
	db $FF

ThunderShockAnim: ; 7a46c (1e:646c)
	db $42,$53,$29
	db $FF

ThunderBoltAnim: ; 7a470 (1e:6470)
	db $41,$54,$29
	db $41,$54,$29
	db $FF

ThunderWaveAnim: ; 7a477 (1e:6477)
	db $42,$55,$29
	db $02,$FF,$23
	db $04,$FF,$23
	db $FF

ThunderAnim: ; 7a481 (1e:6481)
	db SE_DARK_SCREEN_PALETTE, $56
	db SE_DARK_SCREEN_FLASH, $FF
	db $46,$FF,$2B
	db SE_DARK_SCREEN_FLASH, $FF
	db $42,$54,$29
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

RockThrowAnim: ; 7a490 (1e:6490)
	db $04,$57,$30
	db $FF

EarthquakeAnim: ; 7a494 (1e:6494)
	db SE_SHAKE_SCREEN, $58
	db SE_SHAKE_SCREEN, $58
	db $FF

FissureAnim: ; 7a499 (1e:6499)
	db SE_DARK_SCREEN_FLASH, $59
	db SE_SHAKE_SCREEN, $FF
	db SE_DARK_SCREEN_FLASH, $59
	db SE_SHAKE_SCREEN, $FF
	db $FF

DigAnim: ; 7a4a2 (1e:64a2)
	db $46,$5A,$04
	db SE_SLIDE_MON_UP, $FF
	db $FF

ToxicAnim: ; 7a4a8 (1e:64a8)
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db $46,$5B,$14
	db $FF

ConfusionAnim: ; 7a4ae (1e:64ae)
	db SE_FLASH_SCREEN_LONG, $5C
	db $FF

PsychicAnim: ; 7a4b1 (1e:64b1)
	db SE_FLASH_SCREEN_LONG, $5D
	db SE_WAVY_SCREEN, $FF
	db $FF

HypnosisAnim: ; 7a4b6 (1e:64b6)
	db SE_FLASH_SCREEN_LONG, $5E
	db $FF

MeditateAnim: ; 7a4b9 (1e:64b9)
	db SE_LIGHT_SCREEN_PALETTE, $5F
	db $46,$FF,$43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

AgilityAnim: ; 7a4c3 (1e:64c3)
	db SE_LIGHT_SCREEN_PALETTE, $60
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

QuickAttackAnim: ; 7a4c8 (1e:64c8)
	db SE_SLIDE_MON_OFF, $61
	db $46,$FF,$04
	db SE_SHOW_MON_PIC, $FF
	db $FF

RageAnim: ; 7a4d0 (1e:64d0)
	db $06,$62,$01
	db $FF

TeleportAnim: ; 7a4d4 (1e:64d4)
	db SE_SQUISH_MON_PIC, $63
	db SE_SHOOT_BALLS_UPWARD, $FF
	db $FF

NightShadeAnim: ; 7a4d9 (1e:64d9)
	db SE_FLASH_SCREEN_LONG, $5C
	db SE_WAVY_SCREEN, $FF
	db $FF

MimicAnim: ; 7a4de (1e:64de)
	db $46,$65,$21
	db $46,$65,$22
	db $FF

ScreechAnim: ; 7a4e5 (1e:64e5)
	db $46,$66,$12
	db $FF

DoubleTeamAnim: ; 7a4e9 (1e:64e9)
	db SE_DARK_SCREEN_PALETTE, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DELAY_ANIMATION_10, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_SHAKE_BACK_AND_FORTH, $67
	db SE_SHOW_MON_PIC, $FF
	db $46,$6F,$33
	db $FF

RecoverAnim: ; 7a4fd (1e:64fd)
	db SE_BLINK_MON, $68
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

HardenAnim: ; 7a506 (1e:6506)
	db SE_LIGHT_SCREEN_PALETTE, $69
	db $46,$FF,$43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

MinimizeAnim: ; 7a510 (1e:6510)
	db SE_LIGHT_SCREEN_PALETTE, $6A
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_MINIMIZE_MON, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

SmokeScreenAnim: ; 7a519 (1e:6519)
	db $46,$6B,$28
	db $04,$FF,$0A
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

ConfuseRayAnim: ; 7a53a (1e:653a)
	db SE_DARK_SCREEN_PALETTE, $6C
	db $46,$FF,$3E
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

WithdrawAnim: ; 7a542 (1e:6542)
	db SE_LIGHT_SCREEN_PALETTE, $6E
	db SE_SLIDE_MON_DOWN, $FF
	db $06,$FF,$51
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_SHOW_MON_PIC, $FF
	db $FF

DefenseCurlAnim: ; 7a54e (1e:654e)
	db SE_LIGHT_SCREEN_PALETTE, $6E
	db $06,$FF,$43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

BarrierAnim: ; 7a558 (1e:6558)
	db $46,$6F,$33
	db $46,$6F,$33
	db $FF

LightScreenAnim: ; 7a55f (1e:655f)
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db $46,$70,$33
	db $46,$70,$33
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

HazeAnim: ; 7a56a (1e:656a)
	db SE_DARKEN_MON_PALETTE, $FF
	db SE_WATER_DROPLETS_EVERYWHERE, $38
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ReflectAnim: ; 7a571 (1e:6571)
	db SE_DARK_SCREEN_PALETTE, $FF
	db $46,$72,$33
	db $46,$72,$33
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

FocusEnergyAnim: ; 7a57c (1e:657c)
	db SE_SPIRAL_BALLS_INWARD, $73
	db $FF

BideAnim: ; 7a57f (1e:657f)
	db $46,$74,$04
	db $FF

MetronomeAnim: ; 7a583 (1e:6583)
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_MOVE_MON_HORIZONTALLY, $84
	db SE_DELAY_ANIMATION_10, $FF
	db SE_RESET_MON_POSITION, $84
	db $FF

MirrorMoveAnim: ; 7a592 (1e:6592)
	db $08,$76,$01
	db $FF

SelfdestructAnim: ; 7a596 (1e:6596)
	db $43,$77,$34
	db $FF

EggBombAnim: ; 7a59a (1e:659a)
	db $44,$78,$41
	db $44,$78,$42
	db $FF

LickAnim: ; 7a5a1 (1e:65a1)
	db $46,$7B,$14
	db $FF

SmogAnim: ; 7a5a5 (1e:65a5)
	db SE_DARKEN_MON_PALETTE, $48
	db $46,$7A,$19
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

SludgeAnim: ; 7a5ad (1e:65ad)
	db $46,$7B,$13
	db $46,$7B,$14
	db $FF

BoneClubAnim: ; 7a5b4 (1e:65b4)
	db $08,$7C,$02
	db $FF

FireBlastAnim: ; 7a5b8 (1e:65b8)
	db $46,$7D,$1F
	db $46,$FF,$20
	db $46,$FF,$20
	db $46,$FF,$0C
	db $46,$FF,$0D
	db $FF

WaterfallAnim: ; 7a5c8 (1e:65c8)
	db SE_SLIDE_MON_DOWN, $48
	db $06,$37,$1A
	db $08,$FF,$02
	db SE_SLIDE_MON_UP, $FF
	db $FF

ClampAnim: ; 7a5d3 (1e:65d3)
	db $08,$7F,$2A
	db $06,$83,$23
	db $06,$83,$23
	db $FF

SwiftAnim: ; 7a5dd (1e:65dd)
	db $43,$80,$3F
	db $FF

SkullBashAnim: ; 7a5e1 (1e:65e1)
	db $46,$81,$05
	db $FF

SpikeCannonAnim: ; 7a5e5 (1e:65e5)
	db $44,$82,$04
	db $FF

ConstrictAnim: ; 7a5e9 (1e:65e9)
	db $06,$83,$23
	db $06,$83,$23
	db $06,$83,$23
	db $FF

AmnesiaAnim: ; 7a5f3 (1e:65f3)
	db $08,$84,$25
	db $08,$84,$25
	db $FF

KinesisAnim: ; 7a5fa (1e:65fa)
	db $08,$85,$01
	db $FF

SoftboiledAnim: ; 7a5fe (1e:65fe)
	db SE_SLIDE_MON_HALF_OFF, $48
	db $08,$86,$4C
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db SE_SHOW_MON_PIC, $FF
	db $FF

HiJumpKickAnim: ; 7a6 (1e:660c)
	db $46,$87,$04
	db $FF

GlareAnim: ; 7a610 (1e:6610)
	db SE_DARK_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $88
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

DreamEaterAnim: ; 7a619 (1e:6619)
	db SE_FLASH_SCREEN_LONG, $89
	db SE_DARK_SCREEN_PALETTE, $89
	db $08,$89,$02
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

PoisonGasAnim: ; 7a623 (1e:6623)
	db $46,$8A,$19
	db $FF

BarrageAnim: ; 7a627 (1e:6627)
	db $43,$8B,$41
	db $05,$FF,$55
	db $FF

LeechLifeAnim: ; 7a62e (1e:662e)
	db $08,$8C,$02
	db SE_DARK_SCREEN_FLASH, $FF
	db $06,$FF,$21
	db $06,$FF,$22
	db SE_DARK_SCREEN_FLASH, $FF
	db $FF

LovelyKissAnim: ; 7a63c (1e:663c)
	db $06,$8D,$12
	db $FF

SkyAttackAnim: ; 7a640 (1e:6640)
	db SE_SQUISH_MON_PIC, $8E
	db SE_SHOOT_BALLS_UPWARD, $FF
	db $46,$87,$04
	db SE_SHOW_MON_PIC, $FF
	db $FF

TransformAnim: ; 7a64a (1e:664a)
	db $46,$8F,$21
	db $44,$8F,$22
	db $08,$FF,$47
	db SE_TRANSFORM_MON, $FF
	db $FF

BubbleAnim: ; 7a656 (1e:6656)
	db $16,$90,$35
	db $FF

DizzyPunchAnim: ; 7a65a (1e:665a)
	db $06,$91,$17
	db $06,$91,$17
	db $06,$91,$17
	db $06,$02,$02
	db $FF

SporeAnim: ; 7a667 (1e:6667)
	db $06,$92,$36
	db $FF

FlashAnim: ; 7a66b (1e:666b)
	db SE_LIGHT_SCREEN_PALETTE, $48
	db SE_DARK_SCREEN_FLASH, $88
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

PsywaveAnim: ; 7a674 (1e:6674)
	db $06,$2F,$31
	db SE_WAVY_SCREEN, $5C
	db $FF

SplashAnim: ; 7a67a (1e:667a)
	db SE_BOUNCE_UP_AND_DOWN, $95
	db $FF

AcidArmorAnim: ; 7a67d (1e:667d)
	db SE_SLIDE_MON_DOWN_AND_HIDE, $96
	db $FF

CrabHammerAnim: ; 7a680 (1e:6680)
	db $46,$97,$05
	db $06,$FF,$2A
	db $FF

ExplosionAnim: ; 7a687 (1e:6687)
	db $43,$98,$34
	db $FF

FurySwipesAnim: ; 7a68b (1e:668b)
	db $04,$99,$0F
	db $FF

BonemerangAnim: ; 7a68f (1e:668f)
	db $06,$9A,$02
	db $FF

RestAnim: ; 7a693 (1e:6693)
	db $10,$9B,$3A
	db $10,$9B,$3A
	db $FF

RockSlideAnim: ; 7a69a (1e:669a)
	db $04,$9C,$1D
	db $03,$9C,$1E
	db $46,$9D,$04
	db $FF

HyperFangAnim: ; 7a6a4 (1e:66a4)
	db $06,$9D,$02
	db $FF

SharpenAnim: ; 7a6a8 (1e:66a8)
	db SE_LIGHT_SCREEN_PALETTE, $9E
	db $46,$FF,$43
	db SE_DARK_SCREEN_FLASH, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ConversionAnim: ; 7a6b2 (1e:66b2)
	db SE_DARK_SCREEN_FLASH, $9F
	db $46,$FF,$21
	db $46,$FF,$22
	db SE_DARK_SCREEN_FLASH, $FF
	db $FF

TriAttackAnim: ; 7a6bd (1e:66bd)
	db SE_DARK_SCREEN_FLASH, $A0
	db $46,$FF,$4D
	db SE_DARK_SCREEN_FLASH, $FF
	db $FF

SuperFangAnim: ; 7a6c5 (1e:66c5)
	db SE_DARK_SCREEN_PALETTE, $48
	db $46,$A1,$04
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

SlashAnim: ; 7a6cd (1e:66cd)
	db $06,$A2,$0F
	db $FF

SubstituteAnim: ; 7a6d1 (1e:66d1)
	db SE_SLIDE_MON_OFF, $A3
	db $08,$FF,$47
	db SE_SUBSTITUTE_MON, $FF
	db $FF

BallTossAnim: ; 7a6d9 (1e:66d9)
	db $03,$FF,$06
	db $FF

GreatTossAnim: ; 7a6dd (1e:66dd)
	db $03,$FF,$07
	db $FF

UltraTossAnim: ; 7a6e1 (1e:66e1)
	db $02,$FF,$08
	db $FF

BallShakeAnim: ; 7a6e5 (1e:66e5)
	db $04,$FF,$09
	db $FF

BallPoofAnim: ; 7a6e9 (1e:66e9)
	db $04,$FF,$0A
	db $FF

ShowPicAnim: ; 7a6ed (1e:66ed)
	db SE_SHOW_ENEMY_MON_PIC, $FF
	db $FF

HidePicAnim: ; 7a6f0 (1e:66f0)
	db SE_HIDE_ENEMY_MON_PIC, $FF
	db $FF

EnemyFlashAnim: ; 7a6f3 (1e:66f3)
	db SE_SHOW_MON_PIC, $FF
	db $FF

PlayerFlashAnim: ; 7a6f6 (1e:66f6)
	db SE_FLASH_MON_PIC, $FF
	db $FF

EnemyHUDShakeAnim: ; 7a6f9 (1e:66f9)
	db SE_SHAKE_ENEMY_HUD, $FF
	db $FF

TradeBallDropAnim: ; 7a6fc (1e:66fc)
	db $86,$FF,$48
	db $FF

TradeBallAppear1Anim: ; 7a700 (1e:6700)
	db $84,$FF,$49
	db $FF

TradeBallAppear2Anim: ; 7a704 (1e:6704)
	db $86,$FF,$4A
	db $FF

TradeBallPoofAnim: ; 7a708 (1e:6708)
	db $86,$FF,$4B
	db $FF

XStatItemAnim: ; 7a7c0 (1e:670c)
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ShrinkingSquareAnim: ; 7a713 (1e:6713)
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db $46,$FF,$43
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

XStatItemBlackAnim: ; 7a71b (1e:671b)
	db SE_DARKEN_MON_PALETTE, $FF
	db SE_SPIRAL_BALLS_INWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ShrinkingSquareBlackAnim: ; 7a722 (1e:6722)
	db SE_DARKEN_MON_PALETTE, $FF
	db $46,$FF,$43
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

UnusedAnim: ; 7a72a (1e:672a)
	db SE_LIGHT_SCREEN_PALETTE, $FF
	db SE_SHOOT_MANY_BALLS_UPWARD, $FF
	db SE_RESET_SCREEN_PALETTE, $FF
	db $FF

ParalyzeAnim: ; 7a731 (1e:6731)
	db $04,$13,$24
	db $04,$13,$24
	db $FF

PoisonAnim: ; 7a738 (1e:6738)
	db $08,$13,$27
	db $08,$13,$27
	db $FF

SleepPlayerAnim: ; 7a73f (1e:673f)
	db $10,$9B,$3A
	db $10,$9B,$3A
	db $FF

SleepEnemyAnim: ; 7a746 (1e:6746)
	db $10,$9B,$3B
	db $10,$9B,$3B
	db $FF

ConfusedPlayerAnim: ; 7a74d (1e:674d)
	db $08,$84,$25
	db $08,$84,$25
	db $FF

ConfusedEnemyAnim: ; 7a754 (1e:6754)
	db $08,$84,$26
	db $08,$84,$26
	db $FF

BallBlockAnim: ; 7a75b (1e:675b)
	db $03,$FF,$0B
	db $FF

FaintAnim: ; 7a75f (1e:675f)
	db SE_SLIDE_MON_DOWN, $5A
	db $FF

ShakeScreenAnim: ; 7a762 (1e:6762)
	db SE_SHAKE_SCREEN, $FF
	db $FF

ThrowRockAnim: ; 7a765 (1e:6765)
	db $03,$8B,$53
	db $FF

ThrowBaitAnim: ; 7a769 (1e:6769)
	db $03,$8B,$54
	db $FF

SubanimationPointers: ; 7a76d (1e:676d)
	dw Subanimation00
	dw Subanimation01
	dw Subanimation02
	dw Subanimation03
	dw Subanimation04
	dw Subanimation05
	dw Subanimation06
	dw Subanimation07
	dw Subanimation08
	dw Subanimation09
	dw Subanimation0a
	dw Subanimation0b
	dw Subanimation0c
	dw Subanimation0d
	dw Subanimation0e
	dw Subanimation0f
	dw Subanimation10
	dw Subanimation11
	dw Subanimation12
	dw Subanimation13
	dw Subanimation14
	dw Subanimation15
	dw Subanimation16
	dw Subanimation17
	dw Subanimation18
	dw Subanimation19
	dw Subanimation1a
	dw Subanimation1b
	dw Subanimation1c
	dw Subanimation1d
	dw Subanimation1e
	dw Subanimation1f
	dw Subanimation20
	dw Subanimation21
	dw Subanimation22
	dw Subanimation23
	dw Subanimation24
	dw Subanimation25
	dw Subanimation26
	dw Subanimation27
	dw Subanimation28
	dw Subanimation29
	dw Subanimation2a
	dw Subanimation2b
	dw Subanimation2c
	dw Subanimation2d
	dw Subanimation2e
	dw Subanimation2f
	dw Subanimation30
	dw Subanimation31
	dw Subanimation32
	dw Subanimation33
	dw Subanimation34
	dw Subanimation35
	dw Subanimation36
	dw Subanimation37
	dw Subanimation38
	dw Subanimation39
	dw Subanimation3a
	dw Subanimation3b
	dw Subanimation3c
	dw Subanimation3d
	dw Subanimation3e
	dw Subanimation3f
	dw Subanimation40
	dw Subanimation41
	dw Subanimation42
	dw Subanimation43
	dw Subanimation44
	dw Subanimation45
	dw Subanimation46
	dw Subanimation47
	dw Subanimation48
	dw Subanimation49
	dw Subanimation4a
	dw Subanimation4b
	dw Subanimation4c
	dw Subanimation4d
	dw Subanimation4e
	dw Subanimation4f
	dw Subanimation50
	dw Subanimation51
	dw Subanimation52
	dw Subanimation53
	dw Subanimation54
	dw Subanimation55

Subanimation04: ; 7a819 (1e:6819)
	db $43
	db $02,$1a,$00
	db $02,$10,$00
	db $02,$03,$00

Subanimation05: ; 7a823 (1e:6823)
	db $41
	db $02,$10,$00

Subanimation08: ; 7a827 (1e:6827)
	db $0b
	db $03,$30,$00
	db $03,$44,$00
	db $03,$94,$00
	db $03,$60,$00
	db $03,$76,$00
	db $03,$9f,$00
	db $03,$8d,$00
	db $03,$a0,$00
	db $03,$1a,$00
	db $03,$a1,$00
	db $03,$34,$00

Subanimation07: ; 7a849 (1e:6849)
	db $0b
	db $03,$30,$00
	db $03,$a2,$00
	db $03,$31,$00
	db $03,$a3,$00
	db $03,$32,$00
	db $03,$a4,$00
	db $03,$92,$00
	db $03,$a5,$00
	db $03,$15,$00
	db $03,$a6,$00
	db $03,$34,$00

Subanimation06: ; 7a86b (1e:686b)
	db $0b
	db $03,$30,$00
	db $03,$a2,$00
	db $03,$93,$00
	db $03,$61,$00
	db $03,$73,$00
	db $03,$a7,$00
	db $03,$33,$00
	db $03,$a8,$00
	db $03,$0e,$00
	db $03,$a9,$00
	db $03,$34,$00

Subanimation09: ; 7a88d (1e:688d)
	db $04
	db $03,$21,$04
	db $04,$21,$04
	db $03,$21,$04
	db $05,$21,$04

Subanimation0a: ; 7a89a (1e:689a)
	db $46
	db $06,$1b,$00
	db $07,$1b,$00
	db $08,$36,$00
	db $09,$36,$00
	db $0a,$15,$00
	db $0a,$15,$00

Subanimation0b: ; 7a8ad (1e:68ad)
	db $04
	db $01,$2d,$00
	db $03,$2f,$00
	db $03,$35,$00
	db $03,$4d,$00

Subanimation55: ; 7a8ba (1e:68ba)
	db $41
	db $01,$9d,$00

Subanimation11: ; 7a8be (1e:68be)
	db $4c
	db $0b,$26,$00
	db $0c,$26,$00
	db $0b,$26,$00
	db $0c,$26,$00
	db $0b,$28,$00
	db $0c,$28,$00
	db $0b,$28,$00
	db $0c,$28,$00
	db $0b,$27,$00
	db $0c,$27,$00
	db $0b,$27,$00
	db $0c,$27,$00

Subanimation2b: ; 7a8e3 (1e:68e3)
	db $4b
	db $0d,$03,$03
	db $0e,$03,$03
	db $0f,$03,$00
	db $0d,$11,$00
	db $0d,$11,$00
	db $0d,$37,$00
	db $0d,$37,$00
	db $10,$21,$00
	db $10,$21,$00
	db $11,$1b,$00
	db $11,$1b,$00

Subanimation2c: ; 7a905 (1e:6905)
	db $4c
	db $12,$01,$00
	db $12,$0f,$00
	db $12,$1b,$00
	db $12,$25,$00
	db $13,$38,$00
	db $13,$38,$02
	db $14,$38,$00
	db $14,$38,$02
	db $15,$38,$00
	db $15,$38,$00
	db $16,$38,$00
	db $16,$38,$00

Subanimation12: ; 7a92a (1e:692a)
	db $69
	db $17,$30,$00
	db $17,$39,$00
	db $17,$3a,$00
	db $17,$3b,$00
	db $17,$3c,$00
	db $17,$3d,$00
	db $17,$3e,$00
	db $17,$3f,$00
	db $17,$1f,$00

Subanimation00: ; 7a946 (1e:6946)
	db $41
	db $01,$17,$00

Subanimation01: ; 7a94a (1e:694a)
	db $42
	db $01,$0f,$00
	db $01,$1d,$00

Subanimation02: ; 7a951 (1e:6951)
	db $43
	db $01,$12,$00
	db $01,$15,$00
	db $01,$1c,$00

Subanimation03: ; 7a95b (1e:695b)
	db $44
	db $01,$0b,$00
	db $01,$11,$00
	db $01,$18,$00
	db $01,$1d,$00

Subanimation0c: ; 7a968 (1e:6968)
	db $43
	db $0c,$20,$00
	db $0c,$21,$00
	db $0c,$23,$00

Subanimation0d: ; 7a972 (1e:6972)
	db $46
	db $0c,$20,$02
	db $0c,$15,$00
	db $0c,$21,$02
	db $0c,$17,$00
	db $0c,$23,$02
	db $0c,$19,$00

Subanimation0e: ; 7a985 (1e:6985)
	db $49
	db $0c,$20,$02
	db $0c,$15,$02
	db $0c,$07,$00
	db $0c,$21,$02
	db $0c,$17,$02
	db $0c,$09,$00
	db $0c,$23,$02
	db $0c,$19,$02
	db $0c,$0c,$00

Subanimation1f: ; 7a9a1 (1e:69a1)
	db $85
	db $0c,$30,$03
	db $0c,$40,$03
	db $0c,$41,$03
	db $0c,$42,$03
	db $0c,$21,$00

Subanimation2e: ; 7a9b1 (1e:69b1)
	db $2e
	db $18,$43,$02
	db $75,$52,$04
	db $19,$43,$02
	db $75,$63,$04
	db $1a,$43,$02
	db $75,$4d,$04
	db $1b,$43,$02
	db $75,$97,$04
	db $1c,$43,$02
	db $75,$98,$04
	db $1d,$43,$02
	db $75,$58,$04
	db $1e,$43,$02
	db $75,$1b,$00

Subanimation2f: ; 7a9dc (1e:69dc)
	db $44
	db $1f,$24,$00
	db $20,$20,$00
	db $21,$1a,$00
	db $22,$15,$00

Subanimation30: ; 7a9e9 (1e:69e9)
	db $52
	db $23,$00,$02
	db $23,$02,$02
	db $23,$04,$00
	db $23,$07,$02
	db $23,$02,$02
	db $23,$04,$00
	db $23,$0e,$02
	db $23,$02,$02
	db $23,$0c,$00
	db $25,$07,$00
	db $25,$0e,$00
	db $25,$15,$00
	db $24,$24,$02
	db $23,$1c,$02
	db $23,$23,$00
	db $23,$21,$02
	db $24,$28,$00
	db $24,$28,$00

Subanimation0f: ; 7aa20 (1e:6a20)
	db $4c
	db $26,$0e,$02
	db $26,$16,$02
	db $26,$1c,$00
	db $27,$0e,$02
	db $27,$16,$02
	db $27,$1c,$00
	db $28,$0e,$02
	db $28,$16,$02
	db $28,$1c,$00
	db $29,$0e,$02
	db $29,$16,$02
	db $29,$1c,$00

Subanimation16: ; 7aa45 (1e:6a45)
	db $4c
	db $2a,$05,$00
	db $2b,$05,$02
	db $2b,$0c,$02
	db $2a,$11,$04
	db $2b,$11,$02
	db $2b,$17,$02
	db $2a,$1b,$04
	db $2b,$1b,$02
	db $2b,$20,$02
	db $2a,$2f,$04
	db $2c,$00,$02
	db $2c,$00,$00

Subanimation10: ; 7aa6a (1e:6a6a)
	db $88
	db $2d,$44,$00
	db $2e,$45,$00
	db $2d,$46,$00
	db $2e,$47,$00
	db $2d,$48,$00
	db $2e,$49,$00
	db $2d,$2f,$00
	db $2e,$1a,$00

Subanimation31: ; 7aa83 (1e:6a83)
	db $2a
	db $2f,$46,$00
	db $2f,$4a,$00
	db $2f,$4b,$00
	db $2f,$4c,$00
	db $2f,$4d,$00
	db $2f,$4e,$00
	db $2f,$4f,$00
	db $2f,$50,$00
	db $2f,$2e,$00
	db $2f,$51,$00

Subanimation13: ; 7aaa2 (1e:6aa2)
	db $86
	db $30,$31,$00
	db $30,$32,$00
	db $30,$92,$00
	db $30,$0e,$00
	db $30,$0f,$00
	db $30,$10,$00

Subanimation14: ; 7aab5 (1e:6ab5)
	db $49
	db $30,$10,$00
	db $30,$10,$03
	db $31,$1c,$04
	db $31,$21,$04
	db $31,$26,$00
	db $30,$10,$02
	db $31,$1d,$04
	db $31,$22,$04
	db $31,$27,$00

Subanimation41: ; 7aad1 (1e:6ad1)
	db $85
	db $03,$31,$00
	db $03,$32,$00
	db $03,$92,$00
	db $03,$0e,$00
	db $03,$10,$00

Subanimation42: ; 7aae1 (1e:6ae1)
	db $43
	db $48,$08,$00
	db $49,$08,$00
	db $5a,$08,$00

Subanimation15: ; 7aaeb (1e:6aeb)
	db $22
	db $35,$52,$00
	db $35,$53,$00

Subanimation17: ; 7aaf2 (1e:6af2)
	db $44
	db $36,$54,$00
	db $36,$55,$00
	db $37,$56,$00
	db $37,$57,$00

Subanimation18: ; 7aaff (1e:6aff)
	db $a4
	db $36,$54,$00
	db $36,$55,$00
	db $37,$56,$00
	db $37,$57,$00

Subanimation40: ; 7ab0c (1e:6b0c)
	db $46
	db $17,$54,$00
	db $17,$55,$00
	db $17,$0e,$00
	db $17,$56,$00
	db $17,$57,$00
	db $17,$13,$00

Subanimation19: ; 7ab1f (1e:6b1f)
	db $8c
	db $38,$31,$00
	db $39,$31,$00
	db $38,$32,$00
	db $39,$32,$00
	db $38,$92,$00
	db $39,$92,$00
	db $38,$0e,$00
	db $39,$0e,$00
	db $38,$0f,$00
	db $39,$0f,$00
	db $38,$10,$00
	db $39,$10,$00

Subanimation1a: ; 7ab44 (1e:6b44)
	db $50
	db $3a,$08,$00
	db $3b,$08,$00
	db $3c,$08,$00
	db $3d,$08,$00
	db $3e,$08,$00
	db $3f,$08,$00
	db $3e,$08,$00
	db $3f,$08,$00
	db $3a,$0b,$00
	db $3b,$0b,$00
	db $3c,$0b,$00
	db $3d,$0b,$00
	db $3e,$0b,$00
	db $3f,$0b,$00
	db $3e,$0b,$00
	db $3f,$0b,$00

Subanimation1b: ; 7ab75 (1e:6b75)
	db $84
	db $40,$31,$00
	db $40,$32,$00
	db $40,$92,$00
	db $40,$15,$00

Subanimation1c: ; 7ab82 (1e:6b82)
	db $43
	db $41,$58,$00
	db $41,$59,$00
	db $41,$21,$00

Subanimation1d: ; 7ab8c (1e:6b8c)
	db $af
	db $24,$9a,$00
	db $23,$1b,$02
	db $24,$22,$00
	db $23,$16,$02
	db $23,$1d,$02
	db $24,$98,$00
	db $25,$2c,$04
	db $25,$2a,$04
	db $25,$99,$04
	db $25,$62,$04
	db $25,$99,$04
	db $25,$62,$04
	db $25,$99,$04
	db $25,$62,$04
	db $25,$99,$03

Subanimation1e: ; 7abba (1e:6bba)
	db $01
	db $25,$75,$00

Subanimation20: ; 7abbe (1e:6bbe)
	db $42
	db $42,$07,$00
	db $43,$07,$00

Subanimation21: ; 7abc5 (1e:6bc5)
	db $43
	db $44,$00,$00
	db $45,$08,$00
	db $46,$10,$02

Subanimation22: ; 7abcf (1e:6bcf)
	db $8b
	db $47,$10,$00
	db $47,$56,$00
	db $47,$07,$00
	db $47,$aa,$00
	db $47,$ab,$00
	db $47,$ac,$00
	db $47,$ad,$00
	db $47,$ae,$00
	db $47,$af,$00
	db $47,$89,$00
	db $47,$b0,$00

Subanimation2d: ; 7abf1 (1e:6bf1)
	db $66
	db $44,$64,$00
	db $45,$65,$00
	db $46,$66,$00
	db $47,$66,$00
	db $47,$66,$00
	db $47,$66,$00

Subanimation39: ; 7ac04 (1e:6c04)
	db $61
	db $47,$67,$00

Subanimation4e: ; 7ac08 (1e:6c08)
	db $41
	db $71,$0f,$03

Subanimation4f: ; 7ac0c (1e:6c0c)
	db $47
	db $71,$0f,$00
	db $71,$08,$00
	db $71,$01,$00
	db $71,$95,$00
	db $72,$95,$00
	db $73,$95,$00
	db $74,$95,$00

Subanimation50: ; 7ac22 (1e:6c22)
	db $48
	db $74,$95,$00
	db $73,$95,$00
	db $72,$95,$00
	db $71,$95,$00
	db $71,$01,$00
	db $71,$08,$00
	db $71,$0f,$00
	db $71,$16,$00

Subanimation29: ; 7ac3b (1e:6c3b)
	db $5d
	db $48,$0f,$00
	db $4a,$68,$03
	db $4b,$2a,$03
	db $49,$0f,$00
	db $4a,$68,$03
	db $4b,$2a,$00
	db $4c,$6a,$03
	db $4d,$69,$03
	db $49,$6b,$00
	db $4c,$6a,$03
	db $4d,$69,$00
	db $4a,$68,$03
	db $4b,$2a,$03
	db $49,$6c,$00
	db $4a,$68,$03
	db $4b,$2a,$00
	db $4c,$6a,$03
	db $4d,$69,$03
	db $49,$6d,$00
	db $4c,$6a,$03
	db $4d,$2a,$00
	db $4a,$68,$03
	db $4b,$2a,$03
	db $49,$0f,$00
	db $4a,$68,$03
	db $4b,$2a,$00
	db $4c,$6a,$03
	db $4d,$2a,$03
	db $49,$6b,$00

Subanimation2a: ; 7ac93 (1e:6c93)
	db $44
	db $4e,$2b,$00
	db $4f,$2b,$00
	db $50,$2b,$00
	db $50,$2b,$00

Subanimation23: ; 7aca0 (1e:6ca0)
	db $42
	db $51,$2d,$00
	db $51,$6e,$00

Subanimation24: ; 7aca7 (1e:6ca7)
	db $a2
	db $51,$2d,$00
	db $51,$6e,$00

Subanimation25: ; 7acae (1e:6cae)
	db $62
	db $52,$71,$00
	db $52,$72,$00

Subanimation26: ; 7acb5 (1e:6cb5)
	db $02
	db $52,$01,$00
	db $52,$2c,$00

Subanimation3a: ; 7acbc (1e:6cbc)
	db $63
	db $53,$71,$00
	db $53,$7f,$00
	db $53,$81,$00

Subanimation3b: ; 7acc6 (1e:6cc6)
	db $03
	db $53,$01,$00
	db $53,$15,$00
	db $53,$2c,$00

Subanimation27: ; 7acd0 (1e:6cd0)
	db $a2
	db $54,$01,$00
	db $54,$2c,$00

Subanimation28: ; 7acd7 (1e:6cd7)
	db $23
	db $55,$73,$03
	db $56,$73,$03
	db $57,$73,$00

Subanimation32: ; 7ace1 (1e:6ce1)
	db $63
	db $47,$74,$00
	db $47,$43,$00
	db $47,$75,$00

Subanimation33: ; 7aceb (1e:6ceb)
	db $26
	db $58,$76,$00
	db $34,$76,$00
	db $58,$76,$00
	db $34,$76,$00
	db $58,$76,$00
	db $34,$76,$00

Subanimation3c: ; 7acfe (1e:6cfe)
	db $67
	db $59,$79,$03
	db $59,$7b,$03
	db $59,$77,$03
	db $59,$7a,$03
	db $59,$78,$03
	db $59,$7c,$03
	db $59,$76,$00

Subanimation3d: ; 7ad14 (1e:6d14)
	db $08
	db $3a,$4d,$00
	db $3b,$4d,$00
	db $3c,$4d,$00
	db $3d,$4d,$00
	db $3e,$4d,$00
	db $3f,$4d,$00
	db $3e,$4d,$00
	db $3f,$4d,$00

Subanimation34: ; 7ad2d (1e:6d2d)
	db $35
	db $48,$7d,$00
	db $49,$7d,$00
	db $5a,$7d,$00
	db $48,$30,$00
	db $49,$30,$00
	db $5a,$30,$00
	db $48,$7e,$00
	db $49,$7e,$00
	db $5a,$7e,$00
	db $48,$7f,$00
	db $49,$7f,$00
	db $5a,$7f,$00
	db $48,$80,$00
	db $49,$80,$00
	db $5a,$80,$00
	db $48,$81,$00
	db $49,$81,$00
	db $5a,$81,$00
	db $48,$82,$00
	db $49,$82,$00
	db $5a,$82,$00

Subanimation35: ; 7ad6d (1e:6d6d)
	db $24
	db $5b,$83,$03
	db $5c,$84,$03
	db $5d,$85,$03
	db $5e,$09,$00

Subanimation36: ; 7ad7a (1e:6d7a)
	db $48
	db $5f,$2a,$00
	db $5f,$00,$00
	db $60,$2a,$00
	db $60,$00,$00
	db $61,$2a,$00
	db $61,$00,$00
	db $62,$2a,$00
	db $62,$00,$00

Subanimation37: ; 7ad93 (1e:6d93)
	db $2a
	db $63,$89,$00
	db $64,$75,$00
	db $63,$76,$00
	db $65,$0d,$00
	db $65,$86,$00
	db $65,$12,$00
	db $65,$87,$00
	db $65,$17,$00
	db $65,$88,$00
	db $65,$1a,$00

Subanimation38: ; 7adb2 (1e:6db2)
	db $50
	db $66,$8a,$00
	db $66,$33,$00
	db $66,$2e,$00
	db $67,$24,$03
	db $66,$01,$04
	db $66,$10,$04
	db $66,$1d,$04
	db $67,$28,$03
	db $66,$2a,$04
	db $66,$0e,$04
	db $66,$1b,$04
	db $67,$26,$03
	db $66,$03,$04
	db $66,$12,$04
	db $66,$1e,$04
	db $67,$29,$00

Subanimation3e: ; 7ade3 (1e:6de3)
	db $92
	db $02,$31,$00
	db $34,$31,$00
	db $02,$31,$00
	db $02,$32,$00
	db $34,$32,$00
	db $02,$32,$00
	db $02,$92,$00
	db $34,$92,$00
	db $02,$92,$00
	db $02,$0e,$00
	db $34,$0e,$00
	db $02,$0e,$00
	db $02,$0f,$00
	db $34,$0f,$00
	db $02,$0f,$00
	db $02,$10,$00
	db $34,$10,$00
	db $02,$10,$00

Subanimation3f: ; 7ae1a (1e:6e1a)
	db $72
	db $68,$4b,$00
	db $68,$8c,$00
	db $68,$20,$00
	db $68,$1c,$00
	db $68,$19,$00
	db $68,$14,$00
	db $68,$76,$00
	db $68,$8d,$00
	db $68,$15,$00
	db $68,$10,$00
	db $68,$0c,$00
	db $68,$06,$00
	db $68,$8e,$00
	db $68,$8f,$00
	db $68,$90,$00
	db $68,$26,$00
	db $68,$23,$00
	db $68,$1f,$00

Subanimation44: ; 7ae51 (1e:6e51)
	db $2c
	db $69,$4b,$00
	db $69,$8c,$00
	db $69,$20,$00
	db $69,$1c,$00
	db $69,$19,$00
	db $69,$14,$00
	db $69,$76,$00
	db $69,$8d,$00
	db $69,$15,$00
	db $69,$10,$00
	db $69,$0c,$00
	db $69,$06,$00

Subanimation43: ; 7ae76 (1e:6e76)
	db $a3
	db $6a,$07,$00
	db $6b,$0f,$00
	db $6c,$17,$00

Subanimation45: ; 7ae80 (1e:6e80)
	db $24
	db $6d,$8b,$00
	db $6d,$84,$00
	db $6d,$63,$00
	db $6d,$8c,$00

Subanimation46: ; 7ae8d (1e:6e8d)
	db $26
	db $6d,$8b,$00
	db $6d,$84,$00
	db $6d,$63,$00
	db $6d,$8c,$00
	db $6d,$0a,$00
	db $6d,$89,$00

Subanimation47: ; 7aea0 (1e:6ea0)
	db $23
	db $06,$82,$00
	db $07,$82,$00
	db $08,$96,$00

Subanimation48: ; 7aeaa (1e:6eaa)
	db $06
	db $03,$41,$04
	db $03,$48,$04
	db $04,$48,$04
	db $03,$48,$04
	db $05,$48,$04
	db $03,$48,$03

Subanimation49: ; 7aebd (1e:6ebd)
	db $04
	db $04,$48,$04
	db $03,$48,$04
	db $05,$48,$04
	db $03,$48,$03

Subanimation4a: ; 7aeca (1e:6eca)
	db $01
	db $04,$84,$03

Subanimation4b: ; 7aece (1e:6ece)
	db $03
	db $06,$72,$00
	db $07,$72,$00
	db $08,$72,$00

Subanimation4c: ; 7aed8 (1e:6ed8)
	db $68
	db $6f,$30,$00
	db $6e,$30,$00
	db $70,$30,$00
	db $6e,$30,$00
	db $6f,$30,$00
	db $6e,$30,$00
	db $70,$30,$00
	db $6e,$30,$00

Subanimation4d: ; 7aef1 (1e:6ef1)
	db $26
	db $32,$4b,$00
	db $33,$4f,$00
	db $32,$20,$00
	db $33,$16,$00
	db $32,$19,$00
	db $33,$0d,$00

Subanimation51: ; 7af04 (1e:6f04)
	db $a6
	db $76,$1b,$00
	db $34,$1b,$00
	db $76,$1b,$00
	db $34,$1b,$00
	db $76,$1b,$00
	db $34,$1b,$00

Subanimation52: ; 7af17 (1e:6f17)
	db $47
	db $77,$25,$00
	db $77,$9b,$00
	db $77,$1a,$00
	db $77,$9c,$00
	db $77,$2f,$00
	db $77,$50,$00
	db $77,$8c,$00

Subanimation53: ; 7af2d (1e:6f2d)
	db $0c
	db $78,$30,$00
	db $78,$a2,$00
	db $78,$93,$00
	db $78,$61,$00
	db $78,$73,$00
	db $78,$a7,$00
	db $78,$33,$00
	db $78,$a8,$00
	db $78,$0e,$00
	db $78,$a9,$00
	db $78,$34,$00
	db $01,$9e,$00

Subanimation54: ; 7af52 (1e:6f52)
	db $0b
	db $79,$30,$00
	db $79,$a2,$00
	db $79,$93,$00
	db $79,$61,$00
	db $79,$73,$00
	db $79,$a7,$00
	db $79,$33,$00
	db $79,$a8,$00
	db $79,$0e,$00
	db $79,$a9,$00
	db $79,$34,$00

FrameBlockPointers: ; 7af74 (1e:6f74)
	dw FrameBlock00
	dw FrameBlock01
	dw FrameBlock02
	dw FrameBlock03
	dw FrameBlock04
	dw FrameBlock05
	dw FrameBlock06
	dw FrameBlock07
	dw FrameBlock08
	dw FrameBlock09
	dw FrameBlock0a
	dw FrameBlock0b
	dw FrameBlock0c
	dw FrameBlock0d
	dw FrameBlock0e
	dw FrameBlock0f
	dw FrameBlock10
	dw FrameBlock11
	dw FrameBlock12
	dw FrameBlock13
	dw FrameBlock14
	dw FrameBlock15
	dw FrameBlock16
	dw FrameBlock17
	dw FrameBlock18
	dw FrameBlock19
	dw FrameBlock1a
	dw FrameBlock1b
	dw FrameBlock1c
	dw FrameBlock1d
	dw FrameBlock1e
	dw FrameBlock1f
	dw FrameBlock20
	dw FrameBlock21
	dw FrameBlock22
	dw FrameBlock23
	dw FrameBlock24
	dw FrameBlock25
	dw FrameBlock26
	dw FrameBlock27
	dw FrameBlock28
	dw FrameBlock29
	dw FrameBlock2a
	dw FrameBlock2b
	dw FrameBlock2c
	dw FrameBlock2d
	dw FrameBlock2e
	dw FrameBlock2f
	dw FrameBlock30
	dw FrameBlock31
	dw FrameBlock32
	dw FrameBlock33
	dw FrameBlock34
	dw FrameBlock35
	dw FrameBlock36
	dw FrameBlock37
	dw FrameBlock38
	dw FrameBlock39
	dw FrameBlock3a
	dw FrameBlock3b
	dw FrameBlock3c
	dw FrameBlock3d
	dw FrameBlock3e
	dw FrameBlock3f
	dw FrameBlock40
	dw FrameBlock41
	dw FrameBlock42
	dw FrameBlock43
	dw FrameBlock44
	dw FrameBlock45
	dw FrameBlock46
	dw FrameBlock47
	dw SmallBlackCircleFrameBlock
	dw LargeBlockCircleFrameBlock
	dw FrameBlock4a
	dw FrameBlock4b
	dw FrameBlock4c
	dw FrameBlock4d
	dw FrameBlock4e
	dw FrameBlock4f
	dw FrameBlock50
	dw FrameBlock51
	dw FrameBlock52
	dw FrameBlock53
	dw FrameBlock54
	dw FrameBlock55
	dw FrameBlock56
	dw FrameBlock57
	dw FrameBlock58
	dw FrameBlock59
	dw FrameBlock5a
	dw FrameBlock5b
	dw FrameBlock5c
	dw FrameBlock5d
	dw FrameBlock5e
	dw FrameBlock5f
	dw FrameBlock60
	dw FrameBlock61
	dw FrameBlock62
	dw FrameBlock63
	dw FrameBlock64
	dw FrameBlock65
	dw FrameBlock66
	dw FrameBlock67
	dw FrameBlock68
	dw FrameBlock69
	dw FrameBlock6a
	dw FrameBlock6b
	dw FrameBlock6c
	dw FrameBlock6d
	dw FrameBlock6e
	dw FrameBlock6f
	dw FrameBlock70
	dw FrameBlock71
	dw FrameBlock72
	dw FrameBlock73
	dw FrameBlock74
	dw FrameBlock75
	dw FrameBlock76
	dw FrameBlock77
	dw FrameBlock78
	dw FrameBlock79

; FrameBlock format is as follows:
; first byte = number of tiles in FrameBlock
;
; Next, each group of 4 bytes describes a tile in the FrameBlock
; first byte = y offset
; second byte = x offset
; third byte = tile id (it's actually tile id - $31)
; fourth byte = tile properties (xflip/yflip/etc.)
FrameBlock01: ; 7b068 (1e:7068)
	db $09
	db $00,$00,$2c,$00
	db $00,$08,$2d,$00
	db $00,$10,$2c,$20
	db $08,$00,$3c,$00
	db $08,$08,$3d,$00
	db $08,$10,$3c,$20
	db $10,$00,$2c,$40
	db $10,$08,$2d,$40
	db $10,$10,$2c,$60

FrameBlock02: ; 7b08d (1e:708d)
	db $10
	db $00,$00,$20,$00
	db $00,$08,$21,$00
	db $00,$10,$21,$20
	db $00,$18,$20,$20
	db $08,$00,$30,$00
	db $08,$08,$31,$00
	db $08,$10,$31,$20
	db $08,$18,$30,$20
	db $10,$00,$30,$40
	db $10,$08,$31,$40
	db $10,$10,$31,$60
	db $10,$18,$30,$60
	db $18,$00,$20,$40
	db $18,$08,$21,$40
	db $18,$10,$21,$60
	db $18,$18,$20,$60

FrameBlock03: ; 7b0ce (1e:70ce)
	db $04
	db $00,$00,$02,$00
	db $00,$08,$02,$20
	db $08,$00,$12,$00
	db $08,$08,$12,$20

FrameBlock04: ; 7b0df (1e:70df)
	db $04
	db $00,$00,$06,$00
	db $00,$08,$07,$00
	db $08,$00,$16,$00
	db $08,$08,$17,$00

FrameBlock05: ; 7b0f0 (1e:70f0)
	db $04
	db $00,$00,$07,$20
	db $00,$08,$06,$20
	db $08,$00,$17,$20
	db $08,$08,$16,$20

FrameBlock06: ; 7b101 (1e:7101)
	db $0c
	db $00,$08,$23,$00
	db $08,$00,$32,$00
	db $08,$08,$33,$00
	db $00,$10,$23,$20
	db $08,$10,$33,$20
	db $08,$18,$32,$20
	db $10,$00,$32,$40
	db $10,$08,$33,$40
	db $18,$08,$23,$40
	db $10,$10,$33,$60
	db $10,$18,$32,$60
	db $18,$10,$23,$60

FrameBlock07: ; 7b132 (1e:7132)
	db $10
	db $00,$00,$20,$00
	db $00,$08,$21,$00
	db $08,$00,$30,$00
	db $08,$08,$31,$00
	db $00,$10,$21,$20
	db $00,$18,$20,$20
	db $08,$10,$31,$20
	db $08,$18,$30,$20
	db $10,$00,$30,$40
	db $10,$08,$31,$40
	db $18,$00,$20,$40
	db $18,$08,$21,$40
	db $10,$10,$31,$60
	db $10,$18,$30,$60
	db $18,$10,$21,$60
	db $18,$18,$20,$60

FrameBlock08: ; 7b173 (1e:7173)
	db $10
	db $00,$00,$20,$00
	db $00,$08,$21,$00
	db $08,$00,$30,$00
	db $08,$08,$31,$00
	db $00,$18,$21,$20
	db $00,$20,$20,$20
	db $08,$18,$31,$20
	db $08,$20,$30,$20
	db $18,$00,$30,$40
	db $18,$08,$31,$40
	db $20,$00,$20,$40
	db $20,$08,$21,$40
	db $18,$18,$31,$60
	db $18,$20,$30,$60
	db $20,$18,$21,$60
	db $20,$20,$20,$60

FrameBlock09: ; 7b1b4 (1e:71b4)
	db $0c
	db $00,$00,$24,$00
	db $00,$08,$25,$00
	db $08,$00,$34,$00
	db $00,$18,$25,$20
	db $00,$20,$24,$20
	db $08,$20,$34,$20
	db $18,$00,$34,$40
	db $20,$00,$24,$40
	db $20,$08,$25,$40
	db $18,$20,$34,$60
	db $20,$18,$25,$60
	db $20,$20,$24,$60

FrameBlock0a: ; 7b1e5 (1e:71e5)
	db $0c
	db $00,$00,$24,$00
	db $00,$08,$25,$00
	db $08,$00,$34,$00
	db $00,$20,$25,$20
	db $00,$28,$24,$20
	db $08,$28,$34,$20
	db $20,$00,$34,$40
	db $28,$00,$24,$40
	db $28,$08,$25,$40
	db $20,$28,$34,$60
	db $28,$20,$25,$60
	db $28,$28,$24,$60

FrameBlock0b: ; 7b216 (1e:7216)
	db $04
	db $00,$00,$05,$00
	db $00,$08,$05,$20
	db $08,$00,$15,$00
	db $08,$08,$15,$20

FrameBlock0c: ; 7b227 (1e:7227)
	db $04
	db $00,$00,$04,$00
	db $00,$08,$04,$20
	db $08,$00,$14,$00
	db $08,$08,$14,$20

FrameBlock0d: ; 7b238 (1e:7238)
	db $08
	db $00,$00,$0c,$00
	db $00,$08,$0d,$00
	db $08,$00,$1c,$00
	db $08,$08,$1d,$00
	db $10,$00,$1d,$60
	db $10,$08,$1c,$60
	db $18,$00,$0d,$60
	db $18,$08,$0c,$60

FrameBlock0e: ; 7b259 (1e:7259)
	db $04
	db $20,$00,$0c,$00
	db $20,$08,$0d,$00
	db $28,$00,$1c,$00
	db $28,$08,$1d,$00

FrameBlock0f: ; 7b26a (1e:726a)
	db $04
	db $30,$00,$1d,$60
	db $30,$08,$1c,$60
	db $38,$00,$0d,$60
	db $38,$08,$0c,$60

FrameBlock10: ; 7b27b (1e:727b)
	db $08
	db $00,$00,$0e,$00
	db $00,$08,$0f,$00
	db $08,$00,$1e,$00
	db $08,$08,$1f,$00
	db $00,$10,$0f,$20
	db $00,$18,$0e,$20
	db $08,$10,$1f,$20
	db $08,$18,$1e,$20

FrameBlock11: ; 7b29c (1e:729c)
	db $08
	db $00,$00,$0e,$00
	db $00,$08,$0f,$00
	db $08,$00,$1e,$00
	db $08,$08,$1f,$00
	db $00,$20,$0f,$20
	db $00,$28,$0e,$20
	db $08,$20,$1f,$20
	db $08,$28,$1e,$20

FrameBlock12: ; 7b2bd (1e:72bd)
	db $03
	db $00,$00,$37,$00
	db $08,$10,$37,$00
	db $00,$20,$37,$00

FrameBlock13: ; 7b2ca (1e:72ca)
	db $04
	db $00,$00,$36,$00
	db $00,$08,$36,$20
	db $08,$00,$36,$40
	db $08,$08,$36,$60

FrameBlock14: ; 7b2db (1e:72db)
	db $08
	db $00,$10,$28,$00
	db $00,$18,$28,$20
	db $08,$10,$38,$00
	db $08,$18,$38,$20
	db $00,$20,$36,$00
	db $00,$28,$36,$20
	db $08,$20,$36,$40
	db $08,$28,$36,$60

FrameBlock15: ; 7b2fc (1e:72fc)
	db $0c
	db $00,$00,$28,$00
	db $00,$08,$28,$20
	db $08,$00,$38,$00
	db $08,$08,$38,$20
	db $00,$10,$29,$00
	db $00,$18,$29,$20
	db $08,$10,$39,$00
	db $08,$18,$39,$20
	db $00,$20,$28,$00
	db $00,$28,$28,$20
	db $08,$20,$38,$00
	db $08,$28,$38,$20

FrameBlock16: ; 7b32d (1e:732d)
	db $08
	db $00,$00,$29,$00
	db $00,$08,$29,$20
	db $08,$00,$39,$00
	db $08,$08,$39,$20
	db $00,$20,$29,$00
	db $00,$28,$29,$20
	db $08,$20,$39,$00
	db $08,$28,$39,$20

FrameBlock17: ; 7b34e (1e:734e)
	db $04
	db $00,$00,$08,$00
	db $00,$08,$09,$00
	db $08,$00,$18,$00
	db $08,$08,$19,$00

FrameBlock18: ; 7b35f (1e:735f)
	db $01
	db $18,$00,$45,$60

FrameBlock19: ; 7b364 (1e:7364)
	db $02
	db $18,$08,$45,$00
	db $10,$08,$46,$60

FrameBlock1a: ; 7b36d (1e:736d)
	db $02
	db $10,$10,$45,$60
	db $18,$10,$46,$00

FrameBlock1b: ; 7b376 (1e:7376)
	db $02
	db $10,$18,$45,$00
	db $08,$18,$46,$60

FrameBlock1c: ; 7b37f (1e:737f)
	db $02
	db $08,$20,$45,$60
	db $10,$20,$46,$00

FrameBlock1d: ; 7b388 (1e:7388)
	db $02
	db $08,$28,$45,$00
	db $00,$28,$46,$60

FrameBlock1e: ; 7b391 (1e:7391)
	db $02
	db $00,$30,$45,$60
	db $08,$30,$46,$00

FrameBlock75: ; 7b39a (1e:739a)
	db $04
	db $00,$00,$43,$00
	db $00,$08,$43,$20
	db $08,$00,$22,$00
	db $08,$08,$43,$60

FrameBlock1f: ; 7b3ab (1e:73ab)
	db $02
	db $00,$00,$03,$00
	db $00,$30,$03,$20

FrameBlock20: ; 7b3b4 (1e:73b4)
	db $06
	db $00,$00,$03,$00
	db $00,$30,$03,$20
	db $08,$08,$03,$00
	db $08,$28,$03,$20
	db $08,$00,$13,$00
	db $08,$30,$13,$20

FrameBlock21: ; 7b3cd (1e:73cd)
	db $0c
	db $00,$00,$03,$00
	db $00,$30,$03,$20
	db $08,$08,$03,$00
	db $08,$28,$03,$20
	db $08,$00,$13,$00
	db $08,$30,$13,$20
	db $10,$10,$03,$00
	db $10,$20,$03,$20
	db $10,$08,$13,$00
	db $10,$28,$13,$20
	db $10,$00,$03,$00
	db $10,$30,$03,$20

FrameBlock22: ; 7b3fe (1e:73fe)
	db $13
	db $00,$00,$03,$00
	db $08,$00,$13,$00
	db $10,$00,$03,$00
	db $18,$00,$13,$00
	db $08,$08,$03,$00
	db $10,$08,$13,$00
	db $18,$08,$03,$00
	db $10,$10,$03,$00
	db $18,$10,$13,$00
	db $18,$18,$03,$00
	db $10,$20,$03,$20
	db $18,$20,$13,$20
	db $08,$28,$03,$20
	db $10,$28,$13,$20
	db $18,$28,$03,$20
	db $00,$30,$03,$20
	db $08,$30,$13,$20
	db $10,$30,$03,$20
	db $18,$30,$13,$20

FrameBlock23: ; 7b44b (1e:744b)
	db $04
	db $00,$00,$0a,$00
	db $00,$08,$0b,$00
	db $08,$00,$1a,$00
	db $08,$08,$1b,$00

FrameBlock24: ; 7b45c (1e:745c)
	db $02
	db $08,$00,$0a,$00
	db $08,$08,$0b,$00

FrameBlock25: ; 7b465 (1e:7465)
	db $0c
	db $10,$00,$0a,$00
	db $10,$08,$0b,$00
	db $18,$00,$1a,$00
	db $18,$08,$1b,$00
	db $00,$10,$0a,$00
	db $00,$18,$0b,$00
	db $08,$10,$1a,$00
	db $08,$18,$1b,$00
	db $08,$20,$0a,$00
	db $08,$28,$0b,$00
	db $10,$20,$1a,$00
	db $10,$28,$1b,$00

FrameBlock26: ; 7b496 (1e:7496)
	db $04
	db $00,$10,$44,$00
	db $00,$18,$44,$20
	db $08,$10,$44,$40
	db $08,$18,$44,$60

FrameBlock27: ; 7b4a7 (1e:74a7)
	db $05
	db $08,$08,$44,$00
	db $08,$10,$44,$20
	db $10,$08,$44,$40
	db $10,$10,$44,$60
	db $00,$18,$47,$00

FrameBlock28: ; 7b4bc (1e:74bc)
	db $06
	db $10,$00,$44,$00
	db $10,$08,$44,$20
	db $18,$00,$44,$40
	db $18,$08,$44,$60
	db $08,$10,$47,$00
	db $02,$16,$47,$00

FrameBlock29: ; 7b4d5 (1e:74d5)
	db $04
	db $18,$00,$47,$00
	db $12,$06,$47,$00
	db $0c,$0c,$47,$00
	db $06,$12,$47,$00

FrameBlock2a: ; 7b4e6 (1e:74e6)
	db $04
	db $00,$00,$44,$00
	db $00,$08,$44,$20
	db $08,$00,$44,$40
	db $08,$08,$44,$60

FrameBlock2b: ; 7b4f7 (1e:74f7)
	db $02
	db $06,$02,$47,$00
	db $00,$08,$47,$00

FrameBlock2c: ; 7b500 (1e:7500)
	db $01
	db $a0,$00,$4d,$00

FrameBlock2d: ; 7b505 (1e:7505)
	db $08
	db $00,$00,$26,$00
	db $00,$08,$27,$00
	db $08,$00,$36,$00
	db $08,$08,$37,$00
	db $10,$00,$28,$00
	db $10,$08,$29,$00
	db $18,$00,$38,$00
	db $18,$08,$39,$00

FrameBlock2e: ; 7b526 (1e:7526)
	db $08
	db $00,$00,$27,$20
	db $00,$08,$26,$20
	db $08,$00,$37,$20
	db $08,$08,$36,$20
	db $10,$00,$29,$20
	db $10,$08,$28,$20
	db $18,$00,$39,$20
	db $18,$08,$38,$20

FrameBlock2f: ; 7b547 (1e:7547)
	db $04
	db $00,$00,$0c,$00
	db $00,$08,$0d,$00
	db $08,$00,$0c,$40
	db $08,$08,$0d,$40

FrameBlock30: ; 7b558 (1e:7558)
	db $04
	db $00,$00,$44,$00
	db $00,$08,$44,$20
	db $08,$00,$44,$40
	db $08,$08,$44,$60

FrameBlock31: ; 7b569 (1e:7569)
	db $01
	db $00,$00,$45,$00

FrameBlock32: ; 7b56e (1e:756e)
	db $07
	db $00,$00,$4d,$00
	db $00,$08,$2f,$00
	db $00,$10,$4d,$20
	db $08,$00,$4e,$00
	db $08,$08,$07,$00
	db $08,$10,$4e,$20
	db $10,$08,$3f,$00

FrameBlock33: ; 7b58b (1e:758b)
	db $07
	db $00,$08,$3f,$40
	db $08,$00,$4e,$40
	db $08,$08,$07,$40
	db $08,$10,$4e,$60
	db $10,$00,$4d,$40
	db $10,$08,$2f,$40
	db $10,$10,$4d,$60

FrameBlock34: ; 7b5a8 (1e:75a8)
	db $01
	db $a0,$00,$00,$10

FrameBlock35: ; 7b5ad (1e:75ad)
	db $06
	db $00,$00,$2a,$00
	db $00,$08,$2b,$00
	db $08,$00,$3a,$00
	db $10,$00,$3a,$40
	db $18,$00,$2a,$40
	db $18,$08,$2b,$40

FrameBlock36: ; 7b5c6 (1e:75c6)
	db $04
	db $00,$00,$00,$00
	db $00,$08,$01,$00
	db $08,$00,$10,$00
	db $08,$08,$11,$00

FrameBlock37: ; 7b5d7 (1e:75d7)
	db $04
	db $00,$00,$01,$a0
	db $00,$08,$00,$a0
	db $08,$00,$11,$a0
	db $08,$08,$10,$a0

FrameBlock38: ; 7b5e8 (1e:75e8)
	db $04
	db $00,$00,$0a,$00
	db $00,$08,$0b,$00
	db $08,$00,$1a,$00
	db $08,$08,$1b,$00

FrameBlock39: ; 7b5f9 (1e:75f9)
	db $04
	db $00,$00,$0b,$20
	db $00,$08,$0a,$20
	db $08,$00,$1b,$20
	db $08,$08,$1a,$20

FrameBlock3a: ; 7b60a (1e:760a)
	db $04
	db $20,$00,$05,$00
	db $20,$08,$05,$20
	db $28,$00,$15,$00
	db $28,$08,$15,$20

FrameBlock3b: ; 7b61b (1e:761b)
	db $05
	db $18,$00,$04,$00
	db $18,$08,$04,$20
	db $20,$00,$14,$00
	db $20,$08,$14,$20
	db $28,$04,$41,$00

FrameBlock3c: ; 7b630 (1e:7630)
	db $06
	db $10,$00,$05,$00
	db $10,$08,$05,$20
	db $18,$00,$15,$00
	db $18,$08,$15,$20
	db $20,$04,$42,$00
	db $28,$04,$42,$00

FrameBlock3d: ; 7b649 (1e:7649)
	db $07
	db $08,$00,$04,$00
	db $08,$08,$04,$20
	db $10,$00,$14,$00
	db $10,$08,$14,$20
	db $18,$04,$41,$00
	db $20,$04,$41,$00
	db $28,$04,$41,$00

FrameBlock3e: ; 7b666 (1e:7666)
	db $08
	db $00,$00,$05,$00
	db $00,$08,$05,$20
	db $08,$00,$15,$00
	db $08,$08,$15,$20
	db $10,$04,$42,$00
	db $18,$04,$42,$00
	db $20,$04,$42,$00
	db $28,$04,$42,$00

FrameBlock3f: ; 7b687 (1e:7687)
	db $08
	db $00,$00,$04,$00
	db $00,$08,$04,$20
	db $08,$00,$14,$00
	db $08,$08,$14,$20
	db $10,$04,$41,$00
	db $18,$04,$41,$00
	db $20,$04,$41,$00
	db $28,$04,$41,$00

FrameBlock40: ; 7b6a8 (1e:76a8)
	db $03
	db $00,$00,$3d,$00
	db $00,$08,$3d,$00
	db $08,$08,$3d,$00

FrameBlock41: ; 7b6b5 (1e:76b5)
	db $04
	db $00,$00,$06,$00
	db $00,$08,$06,$20
	db $08,$00,$16,$00
	db $08,$08,$17,$00

FrameBlock42: ; 7b6c6 (1e:76c6)
	db $0b
	db $00,$10,$42,$00
	db $08,$00,$42,$00
	db $08,$08,$42,$00
	db $08,$10,$42,$00
	db $08,$18,$42,$00
	db $08,$20,$42,$00
	db $10,$10,$42,$00
	db $18,$08,$42,$00
	db $18,$18,$42,$00
	db $20,$00,$42,$00
	db $20,$20,$42,$00

FrameBlock43: ; 7b6f3 (1e:76f3)
	db $0b
	db $00,$10,$41,$00
	db $08,$00,$41,$00
	db $08,$08,$41,$00
	db $08,$10,$41,$00
	db $08,$18,$41,$00
	db $08,$20,$41,$00
	db $10,$10,$41,$00
	db $18,$08,$41,$00
	db $18,$18,$41,$00
	db $20,$00,$41,$00
	db $20,$20,$41,$00

FrameBlock44: ; 7b720 (1e:7720)
	db $04
	db $00,$00,$49,$00
	db $00,$28,$49,$00
	db $28,$00,$49,$00
	db $28,$28,$49,$00

FrameBlock45: ; 7b731 (1e:7731)
	db $04
	db $00,$00,$49,$00
	db $00,$18,$49,$00
	db $18,$00,$49,$00
	db $18,$18,$49,$00

FrameBlock46: ; 7b742 (1e:7742)
	db $04
	db $00,$00,$49,$00
	db $00,$08,$49,$00
	db $08,$00,$49,$00
	db $08,$08,$49,$00

FrameBlock47: ; 7b753 (1e:7753)
	db $04
	db $00,$00,$43,$00
	db $00,$08,$43,$20
	db $08,$00,$43,$40
	db $08,$08,$43,$60

SmallBlackCircleFrameBlock: ; 7b764 (1e:7764)
	db $04
	db $08,$08,$33,$00
	db $08,$10,$33,$20
	db $10,$08,$33,$40
	db $10,$10,$33,$60

LargeBlockCircleFrameBlock: ; 7b775 (1e:7775)
	db $10
	db $00,$00,$22,$00
	db $00,$08,$23,$00
	db $00,$10,$23,$20
	db $00,$18,$22,$20
	db $08,$00,$32,$00
	db $08,$08,$43,$00
	db $08,$10,$43,$20
	db $08,$18,$32,$20
	db $10,$00,$32,$40
	db $10,$08,$43,$40
	db $10,$10,$43,$60
	db $10,$18,$32,$60
	db $18,$00,$22,$40
	db $18,$08,$23,$40
	db $18,$10,$23,$60
	db $18,$18,$22,$60

FrameBlock71: ; 7b7b6 (1e:77b6)
	db $10
	db $00,$00,$22,$00
	db $00,$08,$3b,$00
	db $00,$10,$23,$20
	db $00,$18,$22,$20
	db $08,$00,$32,$00
	db $08,$08,$43,$00
	db $08,$10,$43,$20
	db $08,$18,$32,$20
	db $10,$00,$32,$40
	db $10,$08,$43,$40
	db $10,$10,$43,$60
	db $10,$18,$32,$60
	db $18,$00,$22,$40
	db $18,$08,$23,$40
	db $18,$10,$23,$60
	db $18,$18,$22,$60

FrameBlock72: ; 7b7f7 (1e:77f7)
	db $0c
	db $00,$00,$32,$00
	db $00,$08,$43,$00
	db $00,$10,$43,$20
	db $00,$18,$32,$20
	db $08,$00,$32,$40
	db $08,$08,$43,$40
	db $08,$10,$43,$60
	db $08,$18,$32,$60
	db $10,$00,$22,$40
	db $10,$08,$23,$40
	db $10,$10,$23,$60
	db $10,$18,$22,$60

FrameBlock73: ; 7b828 (1e:7828)
	db $08
	db $00,$00,$32,$40
	db $00,$08,$43,$40
	db $00,$10,$43,$60
	db $00,$18,$32,$60
	db $08,$00,$22,$40
	db $08,$08,$23,$40
	db $08,$10,$23,$60
	db $08,$18,$22,$60

FrameBlock74: ; 7b849 (1e:7849)
	db $04
	db $00,$00,$22,$40
	db $00,$08,$23,$40
	db $00,$10,$23,$60
	db $00,$18,$22,$60

FrameBlock4a: ; 7b85a (1e:785a)
	db $04
	db $08,$18,$4c,$20
	db $20,$08,$4b,$00
	db $30,$20,$4c,$00
	db $18,$30,$4b,$40

FrameBlock4b: ; 7b86b (1e:786b)
	db $04
	db $00,$18,$4c,$00
	db $20,$00,$4b,$40
	db $38,$20,$4c,$20
	db $18,$38,$4b,$00

FrameBlock4c: ; 7b87c (1e:787c)
	db $04
	db $10,$08,$4a,$40
	db $30,$10,$4a,$00
	db $28,$30,$4a,$20
	db $08,$28,$4a,$60

FrameBlock4d: ; 7b88d (1e:788d)
	db $04
	db $08,$00,$4a,$20
	db $38,$08,$4a,$60
	db $30,$38,$4a,$40
	db $00,$30,$4a,$00

FrameBlock4e: ; 7b89e (1e:789e)
	db $08
	db $00,$30,$44,$00
	db $00,$38,$44,$20
	db $08,$30,$44,$40
	db $08,$38,$44,$60
	db $26,$0a,$44,$00
	db $26,$12,$44,$20
	db $2e,$0a,$44,$40
	db $2e,$12,$44,$60

FrameBlock4f: ; 7b8bf (1e:78bf)
	db $0c
	db $0e,$22,$44,$00
	db $0e,$2a,$44,$20
	db $16,$22,$44,$40
	db $16,$2a,$44,$60
	db $06,$32,$47,$00
	db $00,$38,$47,$00
	db $1a,$16,$44,$00
	db $1a,$1e,$44,$20
	db $22,$16,$44,$40
	db $22,$1e,$44,$60
	db $30,$08,$47,$00
	db $2a,$0e,$47,$00

FrameBlock50: ; 7b8f0 (1e:78f0)
	db $08
	db $06,$32,$47,$00
	db $00,$38,$47,$00
	db $12,$26,$47,$00
	db $0c,$2c,$47,$00
	db $1e,$1a,$47,$00
	db $18,$20,$47,$00
	db $2a,$0e,$47,$00
	db $24,$14,$47,$00

FrameBlock51: ; 7b911 (1e:7911)
	db $08
	db $00,$00,$35,$20
	db $08,$00,$35,$40
	db $10,$00,$35,$00
	db $18,$00,$35,$60
	db $00,$40,$35,$00
	db $08,$40,$35,$60
	db $10,$40,$35,$20
	db $18,$40,$35,$40

FrameBlock52: ; 7b932 (1e:7932)
	db $04
	db $00,$00,$2a,$00
	db $00,$08,$2b,$00
	db $08,$00,$3a,$00
	db $08,$08,$3b,$00

FrameBlock53: ; 7b943 (1e:7943)
	db $03
	db $00,$00,$3f,$00
	db $00,$08,$3f,$00
	db $08,$06,$3f,$00

FrameBlock54: ; 7b950 (1e:7950)
	db $04
	db $00,$00,$0e,$00
	db $00,$08,$0e,$20
	db $08,$00,$0f,$00
	db $08,$08,$0f,$20

FrameBlock55: ; 7b961 (1e:7961)
	db $03
	db $10,$00,$2c,$00
	db $10,$08,$3c,$00
	db $10,$10,$2d,$00

FrameBlock56: ; 7b96e (1e:796e)
	db $06
	db $10,$10,$31,$00
	db $10,$18,$31,$00
	db $08,$10,$2c,$00
	db $08,$18,$3c,$00
	db $08,$20,$2d,$00
	db $10,$20,$2d,$00

FrameBlock57: ; 7b987 (1e:7987)
	db $09
	db $08,$20,$31,$00
	db $10,$20,$31,$00
	db $08,$28,$31,$00
	db $10,$28,$31,$00
	db $00,$20,$2c,$00
	db $00,$28,$3c,$00
	db $00,$30,$2d,$00
	db $08,$30,$2d,$00
	db $10,$30,$2d,$00

FrameBlock58: ; 7b9ac (1e:79ac)
	db $07
	db $00,$00,$46,$00
	db $08,$02,$47,$00
	db $10,$03,$48,$00
	db $18,$04,$48,$00
	db $20,$05,$48,$00
	db $28,$05,$48,$00
	db $30,$05,$48,$00

FrameBlock59: ; 7b9c9 (1e:79c9)
	db $01
	db $00,$00,$42,$00

FrameBlock5a: ; 7b9ce (1e:79ce)
	db $0c
	db $00,$00,$24,$00
	db $00,$08,$25,$00
	db $08,$00,$34,$00
	db $00,$10,$25,$20
	db $00,$18,$24,$20
	db $08,$18,$34,$20
	db $10,$00,$34,$40
	db $18,$00,$24,$40
	db $18,$08,$25,$40
	db $10,$18,$34,$60
	db $18,$10,$25,$60
	db $18,$18,$24,$60

FrameBlock5b: ; 7b9ff (1e:79ff)
	db $04
	db $00,$00,$43,$00
	db $00,$08,$43,$20
	db $08,$00,$43,$40
	db $08,$08,$43,$60

FrameBlock5c: ; 7ba10 (1e:7a10)
	db $08
	db $00,$00,$49,$00
	db $02,$08,$49,$00
	db $18,$00,$49,$00
	db $10,$10,$49,$00
	db $08,$00,$43,$00
	db $08,$08,$43,$20
	db $10,$00,$43,$40
	db $10,$08,$43,$60

FrameBlock5d: ; 7ba31 (1e:7a31)
	db $0b
	db $00,$00,$49,$00
	db $18,$02,$49,$00
	db $14,$10,$49,$00
	db $08,$00,$43,$00
	db $00,$08,$43,$20
	db $10,$00,$43,$40
	db $10,$08,$43,$60
	db $04,$08,$43,$00
	db $04,$10,$43,$20
	db $0c,$08,$43,$40
	db $0c,$10,$43,$60

FrameBlock5e: ; 7ba5e (1e:7a5e)
	db $0f
	db $00,$08,$49,$00
	db $08,$10,$49,$00
	db $20,$00,$49,$00
	db $08,$00,$43,$00
	db $08,$08,$43,$20
	db $10,$00,$43,$40
	db $10,$08,$43,$60
	db $10,$10,$43,$00
	db $10,$18,$43,$20
	db $18,$10,$43,$40
	db $18,$18,$43,$60
	db $20,$08,$43,$00
	db $20,$10,$43,$20
	db $28,$08,$43,$40
	db $28,$10,$43,$60

FrameBlock5f: ; 7ba9b (1e:7a9b)
	db $04
	db $00,$00,$49,$00
	db $00,$10,$49,$00
	db $00,$20,$49,$00
	db $00,$30,$49,$00

FrameBlock60: ; 7baac (1e:7aac)
	db $08
	db $00,$00,$49,$00
	db $00,$10,$49,$00
	db $00,$20,$49,$00
	db $00,$30,$49,$00
	db $08,$08,$49,$00
	db $08,$18,$49,$00
	db $08,$28,$49,$00
	db $08,$38,$49,$00

FrameBlock61: ; 7bacd (1e:7acd)
	db $0c
	db $00,$00,$49,$00
	db $00,$10,$49,$00
	db $00,$20,$49,$00
	db $00,$30,$49,$00
	db $08,$08,$49,$00
	db $08,$18,$49,$00
	db $08,$28,$49,$00
	db $08,$38,$49,$00
	db $10,$00,$49,$00
	db $10,$10,$49,$00
	db $10,$20,$49,$00
	db $10,$30,$49,$00

FrameBlock62: ; 7bafe (1e:7afe)
	db $0f
	db $00,$00,$49,$00
	db $00,$10,$49,$00
	db $00,$20,$49,$00
	db $00,$30,$49,$00
	db $08,$08,$49,$00
	db $08,$18,$49,$00
	db $08,$28,$49,$00
	db $08,$38,$49,$00
	db $10,$00,$49,$00
	db $10,$10,$49,$00
	db $10,$20,$49,$00
	db $10,$30,$49,$00
	db $18,$08,$49,$00
	db $18,$18,$49,$00
	db $18,$28,$49,$00
	db $18,$38,$49,$00 ; unused

FrameBlock63: ; 7bb3f (1e:7b3f)
	db $06
	db $10,$00,$26,$00
	db $10,$08,$27,$00
	db $08,$10,$26,$00
	db $08,$18,$27,$00
	db $00,$20,$26,$00
	db $00,$28,$27,$00

FrameBlock64: ; 7bb58 (1e:7b58)
	db $06
	db $18,$00,$27,$00
	db $10,$08,$26,$00
	db $10,$10,$27,$00
	db $08,$18,$26,$00
	db $08,$20,$27,$00
	db $00,$28,$26,$00

FrameBlock65: ; 7bb71 (1e:7b71)
	db $06
	db $00,$00,$1c,$00
	db $00,$08,$1d,$00
	db $10,$00,$1c,$00
	db $10,$08,$1d,$00
	db $20,$00,$1c,$00
	db $20,$08,$1d,$00

FrameBlock66: ; 7bb8a (1e:7b8a)
	db $02
	db $00,$00,$03,$00
	db $08,$00,$13,$00

FrameBlock67: ; 7bb93 (1e:7b93)
	db $01
	db $00,$00,$03,$00

FrameBlock68: ; 7bb98 (1e:7b98)
	db $04
	db $00,$00,$03,$00
	db $00,$08,$03,$20
	db $08,$00,$13,$00
	db $08,$08,$13,$20

FrameBlock69: ; 7bba9 (1e:7ba9)
	db $01
	db $00,$00,$06,$00

FrameBlock6a: ; 7bbae (1e:7bae)
	db $08
	db $00,$00,$2e,$00
	db $00,$30,$2e,$20
	db $30,$00,$2e,$40
	db $30,$30,$2e,$60
	db $00,$18,$2f,$00
	db $30,$18,$2f,$40
	db $18,$00,$3e,$00
	db $18,$30,$3e,$20

FrameBlock6b: ; 7bbcf (1e:7bcf)
	db $08
	db $00,$00,$2e,$00
	db $00,$20,$2e,$20
	db $20,$00,$2e,$40
	db $20,$20,$2e,$60
	db $00,$10,$2f,$00
	db $20,$10,$2f,$40
	db $10,$00,$3e,$00
	db $10,$20,$3e,$20

FrameBlock6c: ; 7bbf0 (1e:7bf0)
	db $08
	db $00,$00,$2e,$00
	db $00,$10,$2e,$20
	db $10,$00,$2e,$40
	db $10,$10,$2e,$60
	db $00,$08,$2f,$00
	db $10,$08,$2f,$40
	db $08,$00,$3e,$00
	db $08,$10,$3e,$20

FrameBlock6d: ; 7bc11 (1e:7c11)
	db $02
	db $00,$00,$1e,$00
	db $00,$08,$1f,$00

FrameBlock6e: ; 7bc1a (1e:7c1a)
	db $04
	db $00,$00,$48,$00
	db $00,$08,$48,$20
	db $08,$00,$12,$00
	db $08,$08,$12,$20

FrameBlock6f: ; 7bc2b (1e:7c2b)
	db $04
	db $00,$00,$4a,$00
	db $00,$08,$07,$00
	db $08,$00,$16,$00
	db $08,$08,$17,$00

FrameBlock70: ; 7bc3c (1e:7c3c)
	db $04
	db $00,$00,$07,$20
	db $00,$08,$4a,$20
	db $08,$00,$17,$20
	db $08,$08,$16,$20

FrameBlock76: ; 7bc4d (1e:7c4d)
	db $07
	db $00,$10,$2f,$00
	db $01,$08,$2f,$00
	db $01,$18,$2f,$00
	db $02,$00,$2e,$00
	db $02,$20,$2e,$20
	db $0a,$00,$3e,$00
	db $0a,$20,$3e,$20

FrameBlock77: ; 7bc6a (1e:7c6a)
	db $04
	db $00,$02,$4b,$00
	db $00,$0a,$4c,$00
	db $08,$00,$4c,$60
	db $08,$08,$4b,$60

FrameBlock78: ; 7bc7b (1e:7c7b)
	db $01
	db $00,$00,$4d,$00

FrameBlock79: ; 7bc80 (1e:7c80)
	db $01
	db $00,$00,$4e,$00

FrameBlockBaseCoords: ; 7bc85 (1e:7c85)
	db $10,$68
	db $10,$70
	db $10,$78
	db $10,$80
	db $10,$88
	db $10,$90
	db $10,$98
	db $18,$68
	db $18,$70
	db $18,$78
	db $34,$28
	db $18,$80
	db $18,$88
	db $18,$98
	db $20,$68
	db $20,$70
	db $20,$78
	db $20,$80
	db $20,$88
	db $20,$90
	db $20,$98
	db $28,$68
	db $28,$70
	db $28,$78
	db $28,$80
	db $28,$88
	db $30,$68
	db $30,$70
	db $30,$78
	db $30,$80
	db $30,$90
	db $30,$98
	db $38,$68
	db $38,$78
	db $38,$80
	db $38,$88
	db $40,$68
	db $40,$70
	db $40,$78
	db $40,$80
	db $40,$88
	db $40,$98
	db $10,$60
	db $18,$60
	db $20,$60
	db $28,$60
	db $30,$60
	db $40,$60
	db $58,$28
	db $43,$38
	db $33,$48
	db $20,$58
	db $32,$78
	db $58,$58
	db $2C,$6C
	db $34,$80
	db $48,$70
	db $42,$36
	db $38,$44
	db $40,$52
	db $48,$60
	db $3E,$6E
	db $28,$7C
	db $28,$8A
	db $50,$3C
	db $48,$50
	db $40,$64
	db $38,$38
	db $50,$30
	db $50,$38
	db $50,$40
	db $50,$48
	db $50,$50
	db $48,$58
	db $50,$44
	db $48,$48
	db $48,$4C
	db $40,$50
	db $40,$54
	db $38,$58
	db $38,$5C
	db $30,$64
	db $48,$40
	db $48,$39
	db $24,$88
	db $24,$70
	db $1C,$70
	db $1C,$88
	db $34,$68
	db $34,$88
	db $68,$50
	db $60,$50
	db $68,$60
	db $58,$50
	db $60,$60
	db $68,$40
	db $40,$40
	db $38,$40
	db $0B,$60
	db $44,$48
	db $40,$14
	db $48,$1C
	db $50,$24
	db $4C,$24
	db $10,$62
	db $12,$62
	db $12,$60
	db $20,$72
	db $22,$72
	db $22,$70
	db $28,$62
	db $50,$0A
	db $52,$0A
	db $38,$30
	db $40,$48
	db $30,$48
	db $40,$30
	db $30,$40
	db $38,$48
	db $40,$4A
	db $48,$4B
	db $50,$4C
	db $58,$4D
	db $60,$4D
	db $68,$4D
	db $38,$10
	db $50,$10
	db $38,$28
	db $48,$18
	db $40,$20
	db $48,$20
	db $40,$3C
	db $38,$50
	db $28,$64
	db $1C,$90
	db $24,$80
	db $2C,$70
	db $30,$38
	db $10,$50
	db $3C,$40
	db $40,$58
	db $30,$58
	db $58,$48
	db $50,$58
	db $48,$68
	db $40,$18
	db $28,$58
	db $40,$38
	db $48,$38
	db $08,$70
	db $44,$1C
	db $3C,$58
	db $38,$60
	db $08,$60
	db $38,$70
	db $38,$6C
	db $38,$64
	db $1C,$74
	db $2E,$74
	db $34,$50
	db $2F,$60
	db $31,$70
	db $4C,$30
	db $3B,$40
	db $2D,$50
	db $26,$60
	db $2D,$70
	db $28,$50
	db $1E,$60
	db $29,$70
	db $16,$60
	db $14,$58
	db $12,$54
	db $14,$50
	db $18,$4C
	db $1C,$48
	db $48,$28

FrameBlock00: ; 7bde7 (1e:7de7)
	db $00,$00
