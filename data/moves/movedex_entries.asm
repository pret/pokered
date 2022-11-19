; PureRGBnote: ADDED: text pointers for the descriptions that show up in the movedex.

MovedexEntryPointers:
	table_width 2, MovedexEntryPointers
	dw PoundDexEntry
	dw KarateChopDexEntry
	dw DoubleslapDexEntry
	dw CometPunchDexEntry
	dw MegaPunchDexEntry
	dw PayDayDexEntry
	dw FirePunchDexEntry
	dw IcePunchDexEntry
	dw ThunderPunchDexEntry
	dw ScratchDexEntry
	dw VicegripDexEntry
	dw GuillotineDexEntry
	dw RazorWindDexEntry
	dw SwordsDanceDexEntry
	dw CutDexEntry
	dw GustDexEntry
	dw WingAttackDexEntry
	dw WhirlwindDexEntry
	dw FlyDexEntry
	dw BindDexEntry
	dw SlamDexEntry
	dw VineWhipDexEntry
	dw StompDexEntry
	dw DoubleKickDexEntry
	dw MegaKickDexEntry
	dw JumpKickDexEntry
	dw RollingKickDexEntry
	dw SandAttackDexEntry
	dw HeadbuttDexEntry
	dw HornAttackDexEntry
	dw FuryAttackDexEntry
	dw HornDrillDexEntry
	dw TackleDexEntry
	dw BodySlamDexEntry
	dw WrapDexEntry
	dw TakeDownDexEntry
	dw ThrashDexEntry
	dw DoubleEdgeDexEntry
	dw TailWhipDexEntry
	dw PoisonStingDexEntry
	dw TwineedleDexEntry
	dw PinMissileDexEntry
	dw LeerDexEntry
	dw BiteDexEntry
	dw GrowlDexEntry
	dw RoarDexEntry
	dw SingDexEntry
	dw SupersonicDexEntry
	dw SonicboomDexEntry
	dw DisableDexEntry
	dw AcidDexEntry
	dw EmberDexEntry
	dw FlamethrowerDexEntry
	dw MistDexEntry
	dw WaterGunDexEntry
	dw HydroPumpDexEntry
	dw SurfDexEntry
	dw IceBeamDexEntry
	dw BlizzardDexEntry
	dw PsybeamDexEntry
	dw BubblebeamDexEntry
	dw AuroraBeamDexEntry
	dw HyperBeamDexEntry
	dw PeckDexEntry
	dw DrillPeckDexEntry
	dw SubmissionDexEntry
	dw LowKickDexEntry
	dw CounterDexEntry
	dw SeismicTossDexEntry
	dw StrengthDexEntry
	dw AbsorbDexEntry
	dw MegaDrainDexEntry
	dw LeechSeedDexEntry
	dw GrowthDexEntry
	dw RazorLeafDexEntry
	dw SolarbeamDexEntry
	dw PoisonPowderDexEntry
	dw StunSporeDexEntry
	dw SleepPowderDexEntry
	dw PetalDanceDexEntry
	dw StringShotDexEntry
	dw DragonRageDexEntry
	dw FireSpinDexEntry
	dw ThundershockDexEntry
	dw ThunderboltDexEntry
	dw ThunderWaveDexEntry
	dw ThunderDexEntry
	dw RockThrowDexEntry
	dw EarthquakeDexEntry
	dw FissureDexEntry
	dw DigDexEntry
	dw ToxicDexEntry
	dw ConfusionDexEntry
	dw PsychicDexEntry
	dw HypnosisDexEntry
	dw MeditateDexEntry
	dw AgilityDexEntry
	dw QuickAttackDexEntry
	dw RageDexEntry
	dw TeleportDexEntry
	dw NightShadeDexEntry
	dw MimicDexEntry
	dw ScreechDexEntry
	dw DoubleTeamDexEntry
	dw RecoverDexEntry
	dw HardenDexEntry
	dw MinimizeDexEntry
	dw SmokescreenDexEntry
	dw ConfuseRayDexEntry
	dw WithdrawDexEntry
	dw DefenseCurlDexEntry
	dw BarrierDexEntry
	dw LightScreenDexEntry
	dw HazeDexEntry
	dw ReflectDexEntry
	dw FocusEnergyDexEntry
	dw BideDexEntry
	dw MetronomeDexEntry
	dw MirrorMoveDexEntry
	dw SelfdestructDexEntry
	dw EggBombDexEntry
	dw LickDexEntry
	dw SmogDexEntry
	dw SludgeDexEntry
	dw BoneClubDexEntry
	dw FireBlastDexEntry
	dw WaterfallDexEntry
	dw ClampDexEntry
	dw SwiftDexEntry
	dw SkullBashDexEntry
	dw SpikeCannonDexEntry
	dw ConstrictDexEntry
	dw AmnesiaDexEntry
	dw KinesisDexEntry
	dw SoftboiledDexEntry
	dw HiJumpKickDexEntry
	dw GlareDexEntry
	dw DreamEaterDexEntry
	dw PoisonGasDexEntry
	dw BarrageDexEntry
	dw LeechLifeDexEntry
	dw LovelyKissDexEntry
	dw SkyAttackDexEntry
	dw TransformDexEntry
	dw BubbleDexEntry
	dw DizzyPunchDexEntry
	dw SporeDexEntry
	dw FlashDexEntry
	dw PsywaveDexEntry
	dw SplashDexEntry
	dw AcidArmorDexEntry
	dw CrabhammerDexEntry
	dw ExplosionDexEntry
	dw FurySwipesDexEntry
	dw BonemerangDexEntry
	dw RestDexEntry
	dw RockSlideDexEntry
	dw HyperFangDexEntry
	dw SharpenDexEntry
	dw ConversionDexEntry
	dw TriAttackDexEntry
	dw SuperFangDexEntry
	dw SlashDexEntry
	dw SubstituteDexEntry
	dw StruggleDexEntry
	assert_table_length NUM_ATTACKS

PoundDexEntry:
	text_far _PoundDexEntry
	text_end

KarateChopDexEntry:
	text_far _KarateChopDexEntry
	text_end

DoubleslapDexEntry:
	text_far _DoubleslapDexEntry
	text_end

CometPunchDexEntry:
	text_far _CometPunchDexEntry
	text_end

MegaPunchDexEntry:
	text_far _MegaPunchDexEntry
	text_end

PayDayDexEntry:
	text_far _PayDayDexEntry
	text_end

FirePunchDexEntry:
	text_far _FirePunchDexEntry
	text_end

IcePunchDexEntry:
	text_far _IcePunchDexEntry
	text_end

ThunderPunchDexEntry:
	text_far _ThunderPunchDexEntry
	text_end

ScratchDexEntry:
	text_far _ScratchDexEntry
	text_end

VicegripDexEntry:
	text_far _VicegripDexEntry
	text_end

GuillotineDexEntry:
	text_far _GuillotineDexEntry
	text_end

RazorWindDexEntry:
	text_far _RazorWindDexEntry
	text_end

SwordsDanceDexEntry:
	text_far _SwordsDanceDexEntry
	text_end

CutDexEntry:
	text_far _CutDexEntry
	text_end

GustDexEntry:
	text_far _GustDexEntry
	text_end

WingAttackDexEntry:
	text_far _WingAttackDexEntry
	text_end

WhirlwindDexEntry:
	text_far _WhirlwindDexEntry
	text_end

FlyDexEntry:
	text_far _FlyDexEntry
	text_end

BindDexEntry:
	text_far _BindDexEntry
	text_end

SlamDexEntry:
	text_far _SlamDexEntry
	text_end

VineWhipDexEntry:
	text_far _VineWhipDexEntry
	text_end

StompDexEntry:
	text_far _StompDexEntry
	text_end

DoubleKickDexEntry:
	text_far _DoubleKickDexEntry
	text_end

MegaKickDexEntry:
	text_far _MegaKickDexEntry
	text_end

JumpKickDexEntry:
	text_far _JumpKickDexEntry
	text_end

RollingKickDexEntry:
	text_far _RollingKickDexEntry
	text_end

SandAttackDexEntry:
	text_far _SandAttackDexEntry
	text_end

HeadbuttDexEntry:
	text_far _HeadbuttDexEntry
	text_end

HornAttackDexEntry:
	text_far _HornAttackDexEntry
	text_end

FuryAttackDexEntry:
	text_far _FuryAttackDexEntry
	text_end

HornDrillDexEntry:
	text_far _HornDrillDexEntry
	text_end

TackleDexEntry:
	text_far _TackleDexEntry
	text_end

BodySlamDexEntry:
	text_far _BodySlamDexEntry
	text_end

WrapDexEntry:
	text_far _WrapDexEntry
	text_end

TakeDownDexEntry:
	text_far _TakeDownDexEntry
	text_end

ThrashDexEntry:
	text_far _ThrashDexEntry
	text_end

DoubleEdgeDexEntry:
	text_far _DoubleEdgeDexEntry
	text_end

TailWhipDexEntry:
	text_far _TailWhipDexEntry
	text_end

PoisonStingDexEntry:
	text_far _PoisonStingDexEntry
	text_end

TwineedleDexEntry:
	text_far _TwineedleDexEntry
	text_end

PinMissileDexEntry:
	text_far _PinMissileDexEntry
	text_end

LeerDexEntry:
	text_far _LeerDexEntry
	text_end

BiteDexEntry:
	text_far _BiteDexEntry
	text_end

GrowlDexEntry:
	text_far _GrowlDexEntry
	text_end

RoarDexEntry:
	text_far _RoarDexEntry
	text_end

SingDexEntry:
	text_far _SingDexEntry
	text_end

SupersonicDexEntry:
	text_far _SupersonicDexEntry
	text_end

SonicboomDexEntry:
	text_far _SonicboomDexEntry
	text_end

DisableDexEntry:
	text_far _DisableDexEntry
	text_end

AcidDexEntry:
	text_far _AcidDexEntry
	text_end

EmberDexEntry:
	text_far _EmberDexEntry
	text_end

FlamethrowerDexEntry:
	text_far _FlamethrowerDexEntry
	text_end

MistDexEntry:
	text_far _MistDexEntry
	text_end

WaterGunDexEntry:
	text_far _WaterGunDexEntry
	text_end

HydroPumpDexEntry:
	text_far _HydroPumpDexEntry
	text_end

SurfDexEntry:
	text_far _SurfDexEntry
	text_end

IceBeamDexEntry:
	text_far _IceBeamDexEntry
	text_end

BlizzardDexEntry:
	text_far _BlizzardDexEntry
	text_end

PsybeamDexEntry:
	text_far _PsybeamDexEntry
	text_end

BubblebeamDexEntry:
	text_far _BubblebeamDexEntry
	text_end

AuroraBeamDexEntry:
	text_far _AuroraBeamDexEntry
	text_end

HyperBeamDexEntry:
	text_far _HyperBeamDexEntry
	text_end

PeckDexEntry:
	text_far _PeckDexEntry
	text_end

DrillPeckDexEntry:
	text_far _DrillPeckDexEntry
	text_end

SubmissionDexEntry:
	text_far _SubmissionDexEntry
	text_end

LowKickDexEntry:
	text_far _LowKickDexEntry
	text_end

CounterDexEntry:
	text_far _CounterDexEntry
	text_end

SeismicTossDexEntry:
	text_far _SeismicTossDexEntry
	text_end

StrengthDexEntry:
	text_far _StrengthDexEntry
	text_end

AbsorbDexEntry:
	text_far _AbsorbDexEntry
	text_end

MegaDrainDexEntry:
	text_far _MegaDrainDexEntry
	text_end

LeechSeedDexEntry:
	text_far _LeechSeedDexEntry
	text_end

GrowthDexEntry:
	text_far _GrowthDexEntry
	text_end

RazorLeafDexEntry:
	text_far _RazorLeafDexEntry
	text_end

SolarbeamDexEntry:
	text_far _SolarbeamDexEntry
	text_end

PoisonPowderDexEntry:
	text_far _PoisonPowderDexEntry
	text_end

StunSporeDexEntry:
	text_far _StunSporeDexEntry
	text_end

SleepPowderDexEntry:
	text_far _SleepPowderDexEntry
	text_end

PetalDanceDexEntry:
	text_far _PetalDanceDexEntry
	text_end

StringShotDexEntry:
	text_far _StringShotDexEntry
	text_end

DragonRageDexEntry:
	text_far _DragonRageDexEntry
	text_end

FireSpinDexEntry:
	text_far _FireSpinDexEntry
	text_end

ThundershockDexEntry:
	text_far _ThundershockDexEntry
	text_end

ThunderboltDexEntry:
	text_far _ThunderboltDexEntry
	text_end

ThunderWaveDexEntry:
	text_far _ThunderWaveDexEntry
	text_end

ThunderDexEntry:
	text_far _ThunderDexEntry
	text_end

RockThrowDexEntry:
	text_far _RockThrowDexEntry
	text_end

EarthquakeDexEntry:
	text_far _EarthquakeDexEntry
	text_end

FissureDexEntry:
	text_far _FissureDexEntry
	text_end

DigDexEntry:
	text_far _DigDexEntry
	text_end

ToxicDexEntry:
	text_far _ToxicDexEntry
	text_end

ConfusionDexEntry:
	text_far _ConfusionDexEntry
	text_end

PsychicDexEntry:
	text_far _PsychicDexEntry
	text_end

HypnosisDexEntry:
	text_far _HypnosisDexEntry
	text_end

MeditateDexEntry:
	text_far _MeditateDexEntry
	text_end

AgilityDexEntry:
	text_far _AgilityDexEntry
	text_end

QuickAttackDexEntry:
	text_far _QuickAttackDexEntry
	text_end

RageDexEntry:
	text_far _RageDexEntry
	text_end

TeleportDexEntry:
	text_far _TeleportDexEntry
	text_end

NightShadeDexEntry:
	text_far _NightShadeDexEntry
	text_end

MimicDexEntry:
	text_far _MimicDexEntry
	text_end

ScreechDexEntry:
	text_far _ScreechDexEntry
	text_end

DoubleTeamDexEntry:
	text_far _DoubleTeamDexEntry
	text_end

RecoverDexEntry:
	text_far _RecoverDexEntry
	text_end

HardenDexEntry:
	text_far _HardenDexEntry
	text_end

MinimizeDexEntry:
	text_far _MinimizeDexEntry
	text_end

SmokescreenDexEntry:
	text_far _SmokescreenDexEntry
	text_end

ConfuseRayDexEntry:
	text_far _ConfuseRayDexEntry
	text_end

WithdrawDexEntry:
	text_far _WithdrawDexEntry
	text_end

DefenseCurlDexEntry:
	text_far _DefenseCurlDexEntry
	text_end

BarrierDexEntry:
	text_far _BarrierDexEntry
	text_end

LightScreenDexEntry:
	text_far _LightScreenDexEntry
	text_end

HazeDexEntry:
	text_far _HazeDexEntry
	text_end

ReflectDexEntry:
	text_far _ReflectDexEntry
	text_end

FocusEnergyDexEntry:
	text_far _FocusEnergyDexEntry
	text_end

BideDexEntry:
	text_far _BideDexEntry
	text_end

MetronomeDexEntry:
	text_far _MetronomeDexEntry
	text_end

MirrorMoveDexEntry:
	text_far _MirrorMoveDexEntry
	text_end

SelfdestructDexEntry:
	text_far _SelfdestructDexEntry
	text_end

EggBombDexEntry:
	text_far _EggBombDexEntry
	text_end

LickDexEntry:
	text_far _LickDexEntry
	text_end

SmogDexEntry:
	text_far _SmogDexEntry
	text_end

SludgeDexEntry:
	text_far _SludgeDexEntry
	text_end

BoneClubDexEntry:
	text_far _BoneClubDexEntry
	text_end

FireBlastDexEntry:
	text_far _FireBlastDexEntry
	text_end

WaterfallDexEntry:
	text_far _WaterfallDexEntry
	text_end

ClampDexEntry:
	text_far _ClampDexEntry
	text_end

SwiftDexEntry:
	text_far _SwiftDexEntry
	text_end

SkullBashDexEntry:
	text_far _SkullBashDexEntry
	text_end

SpikeCannonDexEntry:
	text_far _SpikeCannonDexEntry
	text_end

ConstrictDexEntry:
	text_far _ConstrictDexEntry
	text_end

AmnesiaDexEntry:
	text_far _AmnesiaDexEntry
	text_end

KinesisDexEntry:
	text_far _KinesisDexEntry
	text_end

SoftboiledDexEntry:
	text_far _SoftboiledDexEntry
	text_end

HiJumpKickDexEntry:
	text_far _HiJumpKickDexEntry
	text_end

GlareDexEntry:
	text_far _GlareDexEntry
	text_end

DreamEaterDexEntry:
	text_far _DreamEaterDexEntry
	text_end

PoisonGasDexEntry:
	text_far _PoisonGasDexEntry
	text_end

BarrageDexEntry:
	text_far _BarrageDexEntry
	text_end

LeechLifeDexEntry:
	text_far _LeechLifeDexEntry
	text_end

LovelyKissDexEntry:
	text_far _LovelyKissDexEntry
	text_end

SkyAttackDexEntry:
	text_far _SkyAttackDexEntry
	text_end

TransformDexEntry:
	text_far _TransformDexEntry
	text_end

BubbleDexEntry:
	text_far _BubbleDexEntry
	text_end

DizzyPunchDexEntry:
	text_far _DizzyPunchDexEntry
	text_end

SporeDexEntry:
	text_far _SporeDexEntry
	text_end

FlashDexEntry:
	text_far _FlashDexEntry
	text_end

PsywaveDexEntry:
	text_far _PsywaveDexEntry
	text_end

SplashDexEntry:
	text_far _SplashDexEntry
	text_end

AcidArmorDexEntry:
	text_far _AcidArmorDexEntry
	text_end

CrabhammerDexEntry:
	text_far _CrabhammerDexEntry
	text_end

ExplosionDexEntry:
	text_far _ExplosionDexEntry
	text_end

FurySwipesDexEntry:
	text_far _FurySwipesDexEntry
	text_end

BonemerangDexEntry:
	text_far _BonemerangDexEntry
	text_end

RestDexEntry:
	text_far _RestDexEntry
	text_end

RockSlideDexEntry:
	text_far _RockSlideDexEntry
	text_end

HyperFangDexEntry:
	text_far _HyperFangDexEntry
	text_end

SharpenDexEntry:
	text_far _SharpenDexEntry
	text_end

ConversionDexEntry:
	text_far _ConversionDexEntry
	text_end

TriAttackDexEntry:
	text_far _TriAttackDexEntry
	text_end

SuperFangDexEntry:
	text_far _SuperFangDexEntry
	text_end

SlashDexEntry:
	text_far _SlashDexEntry
	text_end

SubstituteDexEntry:
	text_far _SubstituteDexEntry
	text_end

StruggleDexEntry:
	text_far _StruggleDexEntry
	text_end
