; Evos+moves data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, min level (1), species
;    * db EVOLVE_TRADE, min level (1), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

EvosMovesPointerTable:
	table_width 2
	dw BulbasaurEvosMoves
	dw IvysaurEvosMoves
	dw VenusaurEvosMoves
	dw MVenusaurEvosMoves
	dw CharmanderEvosMoves
	dw CharmeleonEvosMoves
	dw CharizardEvosMoves
	dw MCharizardXEvosMoves
	dw MCharizardYEvosMoves
	dw SquirtleEvosMoves
	dw WartortleEvosMoves
	dw BlastoiseEvosMoves
	dw MBlastoiseEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw WeedleEvosMoves
	dw KakunaEvosMoves
	dw BeedrillEvosMoves
	dw MBeedrillEvosMoves
	dw PidgeyEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw MPidgeotEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw ARattataEvosMoves
	dw ARaticateEvosMoves
	dw SpearowEvosMoves
	dw FearowEvosMoves
	dw EkansEvosMoves
	dw ArbokEvosMoves
	dw PichuEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw ARaichuEvosMoves
	dw SandshrewEvosMoves
	dw SandslashEvosMoves
	dw ASandshrewEvosMoves
	dw ASandslashEvosMoves
	dw NidoranFEvosMoves
	dw NidorinaEvosMoves
	dw NidoqueenEvosMoves
	dw NidoranMEvosMoves
	dw NidorinoEvosMoves
	dw NidokingEvosMoves
	dw CleffaEvosMoves
	dw ClefairyEvosMoves
	dw ClefableEvosMoves
	dw MClefableEvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw AVulpixEvosMoves
	dw ANinetalesEvosMoves
	dw IgglybuffEvosMoves
	dw JigglypuffEvosMoves
	dw WigglytuffEvosMoves
	dw ZubatEvosMoves
	dw GolbatEvosMoves
	dw CrobatEvosMoves
	dw OddishEvosMoves
	dw GloomEvosMoves
	dw VileplumeEvosMoves
	dw BellossomEvosMoves
	dw ParasEvosMoves
	dw ParasectEvosMoves
	dw VenonatEvosMoves
	dw VenomothEvosMoves
	dw DiglettEvosMoves
	dw DugtrioEvosMoves
	dw ADiglettEvosMoves
	dw ADugtrioEvosMoves
	dw WiglettEvosMoves
	dw WugtrioEvosMoves
	dw MeowthEvosMoves
	dw PersianEvosMoves
	dw AMeowthEvosMoves
	dw APersianEvosMoves
	dw GMeowthEvosMoves
	dw PerrserkerEvosMoves
	dw PsyduckEvosMoves
	dw GolduckEvosMoves
	dw MankeyEvosMoves
	dw PrimeapeEvosMoves
	dw AnnihilapeEvosMoves
	dw GrowlitheEvosMoves
	dw ArcanineEvosMoves
	dw HGrowlitheEvosMoves
	dw HArcanineEvosMoves
	dw PoliwagEvosMoves
	dw PoliwhirlEvosMoves
	dw PoliwrathEvosMoves
	dw PolitoedEvosMoves
	dw AbraEvosMoves
	dw KadabraEvosMoves
	dw AlakazamEvosMoves
	dw MAlakazamEvosMoves
	dw MachopEvosMoves
	dw MachokeEvosMoves
	dw MachampEvosMoves
	dw BellsproutEvosMoves
	dw WeepinbellEvosMoves
	dw VictreebelEvosMoves
	dw MVictreebelEvosMoves
	dw TentacoolEvosMoves
	dw TentacruelEvosMoves
	dw ToedscoolEvosMoves
	dw ToedscruelEvosMoves
	dw GeodudeEvosMoves
	dw GravelerEvosMoves
	dw GolemEvosMoves
	dw AGeodudeEvosMoves
	dw AGravelerEvosMoves
	dw AGolemEvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw GPonytaEvosMoves
	dw GRapidashEvosMoves
	dw SlowpokeEvosMoves
	dw SlowbroEvosMoves
	dw SlowkingEvosMoves
	dw GSlowpokeEvosMoves
	dw GSlowbroEvosMoves
	dw GSlowkingEvosMoves
	dw MSlowbroEvosMoves
	dw MagnemiteEvosMoves
	dw MagnetonEvosMoves
	dw MagnezoneEvosMoves
	dw FarfetchdEvosMoves
	dw GFarfetchdEvosMoves
	dw SirfetchdEvosMoves
	dw DoduoEvosMoves
	dw DodrioEvosMoves
	dw SeelEvosMoves
	dw DewgongEvosMoves
	dw GrimerEvosMoves
	dw MukEvosMoves
	dw AGrimerEvosMoves
	dw AMukEvosMoves
	dw ShellderEvosMoves
	dw CloysterEvosMoves
	dw GastlyEvosMoves
	dw HaunterEvosMoves
	dw GengarEvosMoves
	dw MGengarEvosMoves
	dw OnixEvosMoves
	dw SteelixEvosMoves
	dw MSteelixEvosMoves
	dw DrowzeeEvosMoves
	dw HypnoEvosMoves
	dw KrabbyEvosMoves
	dw KinglerEvosMoves
	dw VoltorbEvosMoves
	dw ElectrodeEvosMoves
	dw HVoltorbEvosMoves
	dw HElectrodeEvosMoves
	dw ExeggcuteEvosMoves
	dw ExeggutorEvosMoves
	dw AExeggutorEvosMoves
	dw CuboneEvosMoves
	dw MarowakEvosMoves
	dw AMarowakEvosMoves
	dw HitmonleeEvosMoves
	dw HitmonchanEvosMoves
	dw HitmontopEvosMoves
	dw LickitungEvosMoves
	dw LickilickyEvosMoves
	dw KoffingEvosMoves
	dw WeezingEvosMoves
	dw GWeezingEvosMoves
	dw RhyhornEvosMoves
	dw RhydonEvosMoves
	dw RhyperiorEvosMoves
	dw HappinyEvosMoves
	dw ChanseyEvosMoves
	dw BlisseyEvosMoves
	dw TangelaEvosMoves
	dw TangrowthEvosMoves
	dw KangaskhanEvosMoves
	dw MKangaskhanEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw KingdraEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw StaryuEvosMoves
	dw StarmieEvosMoves
	dw MStarmieEvosMoves
	dw MimeJrEvosMoves
	dw MrMimeEvosMoves
	dw GMrMimeEvosMoves
	dw MrRimeEvosMoves
	dw ScytherEvosMoves
	dw ScizorEvosMoves
	dw MScizorEvosMoves
	dw KleavorEvosMoves
	dw SmoochumEvosMoves
	dw JynxEvosMoves
	dw ElekidEvosMoves
	dw ElectabuzzEvosMoves
	dw ElectivireEvosMoves
	dw MagbyEvosMoves
	dw MagmarEvosMoves
	dw MagmortarEvosMoves
	dw PinsirEvosMoves
	dw MPinsirEvosMoves
	dw TaurosEvosMoves
	dw PTaurosCEvosMoves
	dw PTaurosAEvosMoves
	dw PTaurosBEvosMoves
	dw MagikarpEvosMoves
	dw GyaradosEvosMoves
	dw MGyaradosEvosMoves
	dw LaprasEvosMoves
	dw DittoEvosMoves
	dw EeveeEvosMoves
	dw VaporeonEvosMoves
	dw JolteonEvosMoves
	dw FlareonEvosMoves
	dw EspeonEvosMoves
	dw UmbreonEvosMoves
	dw LeafeonEvosMoves
	dw GlaceonEvosMoves
	dw SylveonEvosMoves
	dw PorygonEvosMoves
	dw Porygon2EvosMoves
	dw PorygonZEvosMoves
	dw OmanyteEvosMoves
	dw OmastarEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw AerodactylEvosMoves
	dw MAerodactylEvosMoves
	dw MunchlaxEvosMoves
	dw SnorlaxEvosMoves
	dw ArticunoEvosMoves
	dw GArticunoEvosMoves
	dw ZapdosEvosMoves
	dw GZapdosEvosMoves
	dw MoltresEvosMoves
	dw GMoltresEvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw DragoniteEvosMoves
	dw MDragoniteEvosMoves
	dw MeltanEvosMoves
	dw MelmetalEvosMoves
	dw ScreamTailEvosMoves
	dw SandyShocksEvosMoves
	dw MewtwoEvosMoves
	dw MMewtwoXEvosMoves
	dw MMewtwoYEvosMoves
	dw MewEvosMoves
	dw FossilKabutopsEvosMoves
	dw FossilAerodactylEvosMoves
;	dw MonGhostEvosMoves
	assert_table_length NUM_POKEMON_INDEXES

BulbasaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0
; Learnset
    db 1, TACKLE
	db 1, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 17, POISONPOWDER
	db 20, BULLET_SEED
	db 23, HEADBUTT
	db 27, MAGICAL_LEAF
	db 31, GROWTH
	db 36, RAZOR_LEAF
	db 40, BODY_SLAM
	db 48, SOLARBEAM
	db 55, SLEEP_POWDER
	db 0

IvysaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 10, VINE_WHIP
	db 16, SLUDGE
	db 19, POISONPOWDER
	db 22, BULLET_SEED
	db 25, HEADBUTT
	db 29, MAGICAL_LEAF
	db 33, GROWTH
	db 38, RAZOR_LEAF
	db 42, BODY_SLAM
	db 50, SOLARBEAM
	db 57, SLEEP_POWDER
	db 0

VenusaurEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MVENUSAUR
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 16, SLUDGE
	db 19, POISONPOWDER
	db 22, BULLET_SEED
	db 25, HEADBUTT
	db 29, MAGICAL_LEAF
	db 33, GROWTH
	db 36, SLUDGE_BOMB
	db 41, RAZOR_LEAF
	db 45, BODY_SLAM
	db 53, SOLARBEAM
	db 60, SLEEP_POWDER
	db 65, FRENZY_PLANT
	db 0

MVenusaurEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 16, SLUDGE
	db 19, POISONPOWDER
	db 22, BULLET_SEED
	db 25, HEADBUTT
	db 29, MAGICAL_LEAF
	db 33, GROWTH
	db 36, SLUDGE_BOMB
	db 41, RAZOR_LEAF
	db 45, BODY_SLAM
	db 53, SOLARBEAM
	db 60, SLEEP_POWDER
	db 65, EARTHQUAKE
	db 70, FRENZY_PLANT
	db 0

CharmanderEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0
; Learnset
    db 1, SCRATCH
	db 1, GROWL
	db 7, SMOKESCREEN
	db 10, EMBER
	db 12, LEER
	db 15, DRAGONBREATH
	db 19, RAGE
	db 22, HEADBUTT
	db 25, FIRE_PUNCH
	db 28, SLASH
	db 31, DRAGON_RAGE
	db 37, FLAMETHROWER
	db 42, FIRE_SPIN
	db 45, DRAGON_CLAW
	db 48, FLARE_BLITZ
	db 0

CharmeleonEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 1, SMOKESCREEN
	db 10, EMBER
	db 12, LEER
	db 15, DRAGONBREATH
	db 22, RAGE
	db 25, HEADBUTT
	db 28, FIRE_PUNCH
	db 31, SLASH
	db 34, DRAGON_RAGE
	db 40, FLAMETHROWER
	db 45, FIRE_SPIN
	db 48, DRAGON_CLAW
	db 51, FLARE_BLITZ
	db 0

CharizardEvosMoves:
; Evolutions
IF DEF (_RED)
    db EVOLVE_ITEM, MEGA_STONE, 1, MCHARIZARDX
ENDC
IF DEF (_BLUE)
    db EVOLVE_ITEM, MEGA_STONE, 1, MCHARIZARDY
ENDC
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 1, SMOKESCREEN
	db 1, EMBER
	db 12, LEER
	db 15, DRAGONBREATH
	db 22, RAGE
	db 25, HEADBUTT
	db 28, FIRE_PUNCH
	db 31, SLASH
	db 34, DRAGON_RAGE
	db 36, WING_ATTACK
	db 42, ROOST
	db 45, FLAMETHROWER
	db 50, AIR_SLASH
	db 50, FIRE_SPIN
	db 53, DRAGON_CLAW
	db 56, FLARE_BLITZ
	db 60, BLAST_BURN
	db 0

MCharizardXEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 1, SMOKESCREEN
	db 1, EMBER
	db 12, LEER
	db 15, DRAGONBREATH
	db 22, RAGE
	db 25, HEADBUTT
	db 28, FIRE_PUNCH
	db 31, SLASH
	db 34, DRAGON_RAGE
	db 36, WING_ATTACK
	db 42, ROOST
	db 45, FLAMETHROWER
	db 50, AIR_SLASH
	db 50, FIRE_SPIN
	db 53, DRAGON_CLAW
	db 56, FLARE_BLITZ
	db 65, DRACO_METEOR
	db 70, BLAST_BURN
	db 0

MCharizardYEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 1, SMOKESCREEN
	db 1, EMBER
	db 12, LEER
	db 15, DRAGONBREATH
	db 22, RAGE
	db 25, HEADBUTT
	db 28, FIRE_PUNCH
	db 31, SLASH
	db 34, DRAGON_RAGE
	db 36, WING_ATTACK
	db 42, ROOST
	db 45, FLAMETHROWER
	db 50, AIR_SLASH
	db 50, FIRE_SPIN
	db 53, DRAGON_CLAW
	db 56, FLARE_BLITZ
	db 65, HURRICANE
	db 70, BLAST_BURN
	db 0

SquirtleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0
; Learnset
    db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 12, BITE
	db 15, WATER_GUN
	db 20, HEADBUTT
	db 23, BUBBLEBEAM
	db 27, BODY_SLAM
	db 31, WATER_PULSE
    db 35, WATERFALL
	db 40, SKULL_BASH
	db 48, HYDRO_PUMP
	db 0

WartortleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 12, BITE
	db 15, WATER_GUN
	db 22, HEADBUTT
	db 25, BUBBLEBEAM
	db 29, BODY_SLAM
	db 33, WATER_PULSE
    db 37, WATERFALL
	db 42, SKULL_BASH
	db 50, HYDRO_PUMP
	db 0

BlastoiseEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MBLASTOISE
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 12, BITE
	db 15, WATER_GUN
	db 22, HEADBUTT
	db 25, BUBBLEBEAM
	db 29, BODY_SLAM
	db 33, WATER_PULSE
	db 36, ICE_BEAM
    db 42, WATERFALL
	db 47, SKULL_BASH
	db 55, HYDRO_PUMP
	db 60, HYDRO_CANNON
	db 0

MBlastoiseEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 12, BITE
	db 15, WATER_GUN
	db 22, HEADBUTT
	db 25, BUBBLEBEAM
	db 29, BODY_SLAM
	db 33, WATER_PULSE
	db 36, ICE_BEAM
    db 42, WATERFALL
	db 47, SKULL_BASH
	db 55, HYDRO_PUMP
	db 65, DARK_PULSE
	db 70, HYDRO_CANNON
	db 0

CaterpieEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, METAPOD
	db 0
; Learnset
    db 1, TACKLE
	db 1, STRING_SHOT
	db 9, BUG_BITE
	db 0

MetapodEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0
; Learnset
    db 1, HARDEN
	db 1, TACKLE
	db 7, HARDEN
	db 0

ButterfreeEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, TACKLE
	db 1, STRING_SHOT
	db 1, HARDEN
	db 1, CONFUSION
	db 10, CONFUSION
	db 11, WHIRLWIND
	db 13, GUST
	db 15, SUPERSONIC
	db 17, POISONPOWDER
	db 17, STUN_SPORE
	db 20, SLEEP_POWDER
	db 24, PSYBEAM
	db 28, INFESTATION
	db 32, AIR_SLASH
	db 36, PSYCHIC_M
	db 0

WeedleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0
; Learnset
    db 1, POISON_STING
	db 1, STRING_SHOT
	db 9, BUG_BITE
	db 0

KakunaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0
; Learnset
    db 1, POISON_STING
	db 1, HARDEN
	db 7, HARDEN
	db 0

BeedrillEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MBEEDRILL
	db 0
; Learnset
    db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, HARDEN
	db 1, FURY_ATTACK
	db 10, FURY_ATTACK
	db 13, FOCUS_ENERGY
	db 15, RAGE
	db 20, TWINEEDLE
	db 25, HEADBUTT
	db 30, PIN_MISSILE
	db 35, AGILITY
	db 40, X_SCISSOR
	db 42, POISON_JAB
	db 44, DRILL_RUN
	db 0

MBeedrillEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, HARDEN
	db 1, FURY_ATTACK
	db 10, FURY_ATTACK
	db 13, FOCUS_ENERGY
	db 15, RAGE
	db 20, TWINEEDLE
	db 25, HEADBUTT
	db 30, PIN_MISSILE
	db 35, AGILITY
	db 40, X_SCISSOR
	db 42, POISON_JAB
	db 44, DRILL_RUN
	db 50, SWORDS_DANCE
	db 0

PidgeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0
; Learnset
    db 1, TACKLE
	db 5, SAND_ATTACK
	db 8, GUST
	db 12, QUICK_ATTACK
	db 14, WHIRLWIND
	db 22, ROOST
	db 24, TWISTER
	db 28, AIR_CUTTER
	db 28, MIRROR_MOVE
	db 32, TAKE_DOWN
	db 38, AGILITY
	db 40, AERIAL_ACE
	db 44, AIR_SLASH
	db 54, BRAVE_BIRD
	db 60, EXTREMESPEED
	db 0

PidgeottoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0
; Learnset
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 8, GUST
	db 12, QUICK_ATTACK
	db 14, WHIRLWIND
	db 18, WING_ATTACK
	db 24, ROOST
	db 26, TWISTER
	db 30, AIR_CUTTER
	db 30, MIRROR_MOVE
	db 34, TAKE_DOWN
	db 40, AGILITY
	db 42, AERIAL_ACE
	db 46, AIR_SLASH
	db 56, BRAVE_BIRD
	db 62, EXTREMESPEED
	db 0

PidgeotEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MPIDGEOT
	db 0
; Learnset
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 12, QUICK_ATTACK
	db 14, WHIRLWIND
	db 18, WING_ATTACK
	db 24, ROOST
	db 26, TWISTER
	db 30, AIR_CUTTER
	db 30, MIRROR_MOVE
	db 34, TAKE_DOWN
	db 40, AGILITY
	db 44, AERIAL_ACE
	db 52, AIR_SLASH
	db 58, BRAVE_BIRD
	db 64, EXTREMESPEED
	db 0

MPidgeotEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 12, QUICK_ATTACK
	db 14, WHIRLWIND
	db 18, WING_ATTACK
	db 24, ROOST
	db 26, TWISTER
	db 30, AIR_CUTTER
	db 30, MIRROR_MOVE
	db 34, TAKE_DOWN
	db 40, AGILITY
	db 44, AERIAL_ACE
	db 52, AIR_SLASH
	db 58, BRAVE_BIRD
	db 64, EXTREMESPEED
	db 70, HURRICANE
	db 0

RattataEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, RATICATE
	db 0
; Learnset
    db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 15, HYPER_FANG
	db 18, HEADBUTT
	db 23, FOCUS_ENERGY
	db 28, SUPER_FANG
	db 31, DOUBLE_EDGE
	db 33, CRUNCH
	db 0

RaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 15, HYPER_FANG
	db 18, HEADBUTT
	db 28, FOCUS_ENERGY
	db 33, SUPER_FANG
	db 36, DOUBLE_EDGE
	db 38, CRUNCH
	db 0

ARattataEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, A_RATICATE
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 15, HYPER_FANG
	db 18, HEADBUTT
	db 23, FOCUS_ENERGY
	db 28, SUPER_FANG
	db 31, DOUBLE_EDGE
	db 33, CRUNCH
	db 0

ARaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 15, HYPER_FANG
	db 18, HEADBUTT
	db 28, FOCUS_ENERGY
	db 33, SUPER_FANG
	db 36, DOUBLE_EDGE
	db 38, CRUNCH
	db 0

SpearowEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, FEAROW
	db 0
; Learnset
    db 1, PECK
	db 1, GROWL
	db 7, LEER
	db 11, FURY_ATTACK
	db 15, WING_ATTACK
	db 18, MIRROR_MOVE
	db 23, AERIAL_ACE
	db 26, TAKE_DOWN
	db 29, DRILL_PECK
	db 35, AGILITY
	db 40, ROOST
	db 0

FearowEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, PECK
	db 1, GROWL
	db 1, LEER
	db 11, FURY_ATTACK
	db 15, WING_ATTACK
	db 18, MIRROR_MOVE
	db 20, DRILL_RUN
	db 28, AERIAL_ACE
	db 33, TAKE_DOWN
	db 35, DRILL_PECK
	db 40, AGILITY
	db 45, ROOST
	db 0

EkansEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, ARBOK
	db 0
; Learnset
    db 1, WRAP
	db 1, LEER
	db 4, POISON_STING
	db 9, BITE
	db 12, GLARE
	db 15, HEADBUTT
	db 18, ACID
	db 25, TOXIC
	db 33, LEECH_LIFE
	db 36, POISON_JAB
	db 40, SCREECH
	db 45, HAZE
	db 0

ArbokEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, WRAP
	db 1, LEER
	db 4, POISON_STING
	db 9, BITE
	db 12, GLARE
	db 15, HEADBUTT
	db 18, ACID
	db 22, SUBSTITUTE
	db 28, TOXIC
	db 36, LEECH_LIFE
	db 39, POISON_JAB
	db 43, SCREECH
	db 48, HAZE
	db 0

PichuEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 15, PIKACHU
	db 0
; Learnset
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 5, CHARM
	db 9, THUNDER_WAVE
	db 0

PikachuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
	db 0
; Learnset
    db 1, THUNDERSHOCK
	db 1, GROWL
	db 3, TAIL_WHIP
	db 5, CHARM
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
    db 16, HEADBUTT
	db 20, THUNDERPUNCH
	db 26, SWIFT
	db 30, THUNDERBOLT	
	db 33, AGILITY
	db 40, THUNDER
	db 42, LIGHT_SCREEN
	db 46, WILD_CHARGE
	db 50, VOLT_TACKLE
	db 0

RaichuEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 1, THUNDERBOLT
	db 3, TAIL_WHIP
	db 5, CHARM
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
    db 16, HEADBUTT
	db 20, THUNDERPUNCH
	db 26, SWIFT
	db 30, THUNDERBOLT	
	db 33, AGILITY
	db 40, THUNDER
	db 42, LIGHT_SCREEN
	db 46, WILD_CHARGE
	db 70, VOLT_TACKLE
	db 0

ARaichuEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

SandshrewEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0
; Learnset
    db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 3, POISON_STING
	db 6, SAND_ATTACK
	db 9, MUD_SLAP
	db 12, HEADBUTT
	db 15, FURY_SWIPES
	db 21, SWIFT
	db 24, MUD_SHOT
	db 30, SLASH
	db 33, DIG
	db 37, SWORDS_DANCE
	db 40, EARTHQUAKE
	db 0

SandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 1, POISON_STING
	db 6, SAND_ATTACK
	db 9, MUD_SLAP
	db 12, HEADBUTT
	db 15, FURY_SWIPES
	db 21, SWIFT
	db 26, MUD_SHOT
	db 32, SLASH
	db 35, DIG
	db 39, SWORDS_DANCE
	db 42, EARTHQUAKE
	db 0

ASandshrewEvosMoves:
; Evolutions
	db EVOLVE_ITEM, ICE_STONE, 1, A_SANDSLASH
	db 0
; Learnset
	db 1, DEFENSE_CURL
	db 1, SCRATCH
	db 6, POWDER_SNOW
	db 9, MIST
	db 12, HEADBUTT
	db 15, FURY_SWIPES
	db 21, SWIFT
	db 26, AURORA_BEAM
	db 32, SLASH
	db 35, IRON_HEAD
	db 39, SWORDS_DANCE
	db 42, BLIZZARD
	db 0

ASandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, DEFENSE_CURL
	db 1, SCRATCH
	db 6, POWDER_SNOW
	db 9, MIST
	db 12, HEADBUTT
	db 15, FURY_SWIPES
	db 21, SWIFT
	db 28, ICICLE_SPEAR
	db 34, SLASH
	db 37, IRON_HEAD
	db 41, SWORDS_DANCE
	db 44, BLIZZARD
	db 48, ICICLE_CRASH
	db 0

NidoranFEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0
; Learnset
    db 1, GROWL
	db 1, TACKLE
	db 5, SCRATCH
	db 10, POISON_STING
	db 12, DOUBLE_KICK
	db 17, TAIL_WHIP
	db 22, BITE
	db 24, FURY_SWIPES
	db 36, TOXIC
	db 40, CRUNCH
	db 45, EARTH_POWER
	db 0

NidorinaEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
; Learnset
	db 1, GROWL
	db 1, TACKLE
	db 1, SCRATCH
	db 10, POISON_STING
	db 12, DOUBLE_KICK
	db 20, TAIL_WHIP
	db 25, BITE
	db 27, FURY_SWIPES
	db 39, TOXIC
	db 43, CRUNCH
	db 48, EARTH_POWER
	db 0

NidoqueenEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, GROWL
	db 1, TACKLE
	db 1, SCRATCH
	db 1, POISON_STING
	db 12, DOUBLE_KICK
	db 20, TAIL_WHIP
	db 23, BODY_SLAM
	db 25, BITE
	db 27, FURY_SWIPES
	db 39, TOXIC
	db 43, CRUNCH
	db 48, EARTH_POWER
	db 50, SLUDGE_BOMB
	db 0

NidoranMEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0
; Learnset
    db 1, LEER
	db 1, TACKLE
	db 5, HORN_ATTACK
	db 10, POISON_STING
	db 12, DOUBLE_KICK
	db 17, FURY_ATTACK
	db 23, FOCUS_ENERGY
	db 27, TOXIC
	db 35, HORN_DRILL
	db 40, POISON_JAB
	db 45, EARTH_POWER
	db 0

NidorinoEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
	db 0
; Learnset
	db 1, LEER
	db 1, TACKLE
	db 5, HORN_ATTACK
	db 10, POISON_STING
	db 12, DOUBLE_KICK
	db 19, FURY_ATTACK
	db 25, FOCUS_ENERGY
	db 29, TOXIC
	db 37, HORN_DRILL
	db 42, POISON_JAB
	db 47, EARTH_POWER
	db 0

NidokingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, LEER
	db 1, TACKLE
	db 5, HORN_ATTACK
	db 10, POISON_STING
	db 12, DOUBLE_KICK
	db 19, FURY_ATTACK
	db 23, THRASH
	db 25, FOCUS_ENERGY
	db 29, TOXIC
	db 37, HORN_DRILL
	db 42, POISON_JAB
	db 47, EARTH_POWER
	db 0

CleffaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 15, CLEFAIRY
	db 0
; Learnset
	db 1, POUND
	db 1, SPLASH
	db 7, CHARM
	db 36, SING
	db 0

ClefairyEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
	db 0
; Learnset
    db 1, POUND
	db 1, GROWL
	db 1, CHARM
	db 15, METRONOME
	db 15, DOUBLESLAP
	db 21, MINIMIZE
	db 24, DEFENSE_CURL
	db 28, DRAININGKISS
	db 33, BODY_SLAM
	db 38, LIGHT_SCREEN
	db 42, DAZZLE_GLEAM 
	db 48, SING
	db 50, MOONBLAST
	db 52, DOUBLE_EDGE
	db 55, AMNESIA
	db 0

ClefableEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MCLEFABLE
	db 0
; Learnset
	db 1, POUND
	db 1, GROWL
	db 1, CHARM
	db 1, METRONOME
	db 15, DOUBLESLAP
	db 21, MINIMIZE
	db 24, DEFENSE_CURL
	db 28, DRAININGKISS
	db 33, BODY_SLAM
	db 38, LIGHT_SCREEN
	db 42, DAZZLE_GLEAM 
	db 48, SING
	db 50, MOONBLAST
	db 52, DOUBLE_EDGE
	db 55, AMNESIA
	db 0

MClefableEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POUND
	db 1, GROWL
	db 1, CHARM
	db 1, METRONOME
	db 15, DOUBLESLAP
	db 21, MINIMIZE
	db 24, DEFENSE_CURL
	db 28, DRAININGKISS
	db 33, BODY_SLAM
	db 38, LIGHT_SCREEN
	db 42, DAZZLE_GLEAM 
	db 48, SING
	db 50, MOONBLAST
	db 52, DOUBLE_EDGE
	db 55, AMNESIA
	db 60, AIR_SLASH
	db 0

VulpixEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
	db 0
; Learnset
    db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, ROAR
	db 7, EMBER
	db 10, QUICK_ATTACK
	db 13, DISABLE
	db 15, WILL_O_WISP
	db 20, CONFUSE_RAY
	db 26, HEADBUTT
	db 32, FLAMETHROWER
	db 38, FIRE_SPIN
	db 42, HYPNOSIS
	db 48, FIRE_BLAST
	db 0

NinetalesEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, ROAR
	db 1, EMBER
	db 10, QUICK_ATTACK
	db 13, DISABLE
	db 15, WILL_O_WISP
	db 20, CONFUSE_RAY
	db 26, HEADBUTT
	db 32, FLAMETHROWER
	db 38, FIRE_SPIN
	db 42, HYPNOSIS
	db 48, FIRE_BLAST
	db 0

AVulpixEvosMoves:
; Evolutions
	db EVOLVE_ITEM, ICE_STONE, 1, NINETALES
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, ROAR
	db 7, POWDER_SNOW
	db 10, QUICK_ATTACK
	db 13, DISABLE
	db 15, ICICLE_SPEAR
	db 20, CONFUSE_RAY
	db 26, HEADBUTT
	db 32, ICE_BEAM
	db 38, DAZZLE_GLEAM
	db 42, HYPNOSIS
	db 48, BLIZZARD
	db 54, MOONBLAST
	db 0

ANinetalesEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, ROAR
	db 7, POWDER_SNOW
	db 10, QUICK_ATTACK
	db 13, DISABLE
	db 15, ICICLE_SPEAR
	db 20, CONFUSE_RAY
	db 26, HEADBUTT
	db 32, ICE_BEAM
	db 38, DAZZLE_GLEAM
	db 42, HYPNOSIS
	db 48, BLIZZARD
	db 54, MOONBLAST
	db 0

IgglybuffEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 15, JIGGLYPUFF
	db 0
; Learnset
    db 1, CHARM
	db 1, SING
	db 4, DEFENSE_CURL
	db 9, POUND
	db 0

JigglypuffEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
	db 0
; Learnset
    db 1, SING
	db 1, POUND
	db 7, DEFENSE_CURL
	db 12, DISABLE
	db 18, DOUBLESLAP
	db 21, BIDE
	db 24, REST
	db 28, MIMIC
	db 30, BODY_SLAM
	db 32, DAZZLE_GLEAM
	db 39, DOUBLE_EDGE
	db 46, MOONBLAST
	db 0

WigglytuffEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SING
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, DISABLE
	db 18, DOUBLESLAP
	db 21, BIDE
	db 24, REST
	db 28, MIMIC
	db 30, BODY_SLAM
	db 32, DAZZLE_GLEAM
	db 39, DOUBLE_EDGE
	db 46, MOONBLAST
	db 0

ZubatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0
; Learnset
    db 1, ABSORB
	db 7, SUPERSONIC
	db 12, GUST
	db 15, BITE
	db 18, CONFUSE_RAY
	db 24, HYPNOSIS
	db 28, WING_ATTACK
	db 32, TAKE_DOWN
	db 34, AIR_CUTTER
	db 36, HAZE
	db 40, AERIAL_ACE
	db 45, SLUDGE_BOMB
	db 48, LEECH_LIFE
	db 0

GolbatEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 40, CROBAT
	db 0
; Learnset
	db 1, ABSORB
	db 7, SUPERSONIC
	db 12, GUST
	db 15, BITE
	db 18, CONFUSE_RAY
	db 22, SCREECH
	db 26, HYPNOSIS
	db 30, WING_ATTACK
	db 34, TAKE_DOWN
	db 36, AIR_CUTTER
	db 38, HAZE
	db 42, AERIAL_ACE
	db 47, SLUDGE_BOMB
	db 50, LEECH_LIFE
	db 0

CrobatEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ABSORB
	db 7, SUPERSONIC
	db 12, GUST
	db 15, BITE
	db 18, CONFUSE_RAY
	db 22, SCREECH
	db 26, HYPNOSIS
	db 30, WING_ATTACK
	db 34, TAKE_DOWN
	db 36, AIR_CUTTER
	db 38, HAZE
	db 47, AERIAL_ACE
	db 52, SLUDGE_BOMB
	db 58, LEECH_LIFE
	db 0

OddishEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, GLOOM
	db 0
; Learnset
    db 1, ABSORB
	db 4, GROWTH
	db 8, ACID
	db 12, POISONPOWDER
	db 12, STUN_SPORE
	db 17, MEGA_DRAIN
	db 20, BIDE
	db 25, MAGICAL_LEAF
	db 30, TOXIC
	db 35, GIGA_DRAIN
	db 37, PETAL_DANCE
	db 40, SLUDGE_BOMB
	db 45, MOONBLAST
	db 47, SOLARBEAM
	db 50, LEAF_STORM
	db 0

GloomEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE,  1, BELLOSSOM
	db 0
; Learnset
	db 1, ABSORB
	db 1, GROWTH
	db 8, ACID
	db 12, POISONPOWDER
	db 12, STUN_SPORE
	db 17, MEGA_DRAIN
	db 20, BIDE
	db 27, MAGICAL_LEAF
	db 32, TOXIC
	db 37, GIGA_DRAIN
	db 39, PETAL_DANCE
	db 42, SLUDGE_BOMB
	db 47, MOONBLAST
	db 49, SOLARBEAM
	db 52, LEAF_STORM
	db 0

VileplumeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ABSORB
	db 1, GROWTH
	db 1, ACID
	db 1, POISONPOWDER
	db 12, STUN_SPORE
	db 17, MEGA_DRAIN
	db 20, BIDE
	db 27, MAGICAL_LEAF
	db 32, TOXIC
	db 37, GIGA_DRAIN
	db 39, PETAL_DANCE
	db 42, SLUDGE_BOMB
	db 47, MOONBLAST
	db 49, SOLARBEAM
	db 52, LEAF_STORM
	db 0

BellossomEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ABSORB
	db 4, GROWTH
	db 8, MAGICAL_LEAF
	db 12, POISONPOWDER
	db 12, STUN_SPORE
	db 17, MEGA_DRAIN
	db 20, BIDE
	db 27, MAGICAL_LEAF
    db 32, LEECH_SEED
	db 37, GIGA_DRAIN
	db 39, PETAL_DANCE
	db 42, LEAF_STORM
	db 47, MOONBLAST
	db 49, SOLARBEAM
	db 0

ParasEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 24, PARASECT
	db 0
; Learnset
    db 1, SCRATCH
	db 6, POISONPOWDER
	db 10, ABSORB
	db 13, BUG_BITE
	db 16, STUN_SPORE
	db 20, HEADBUTT
	db 28, SLEEP_POWDER
	db 33, SLASH
	db 37, GIGA_DRAIN
	db 41, GROWTH
	db 45, X_SCISSOR
	db 48, SPORE
	db 0

ParasectEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 6, POISONPOWDER
	db 10, ABSORB
	db 13, BUG_BITE
	db 16, STUN_SPORE
	db 20, HEADBUTT
	db 24, LEECH_LIFE
	db 30, SLEEP_POWDER
	db 35, SLASH
	db 39, GIGA_DRAIN
	db 43, GROWTH
	db 47, X_SCISSOR
	db 50, SPORE
	db 0

VenonatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0
; Learnset
    db 1, TACKLE
	db 3, DISABLE
	db 7, SUPERSONIC
	db 9, BUG_BITE
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 17, STUN_SPORE
	db 22, PSYBEAM
	db 25, HEADBUTT
	db 28, SLEEP_POWDER
	db 33, ZEN_HEADBUTT
	db 38, PSYCHIC_M
	db 43, LEECH_LIFE
	db 0

VenomothEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 3, DISABLE
	db 7, SUPERSONIC
	db 9, BUG_BITE
	db 11, CONFUSION
	db 13, POISONPOWDER
	db 17, STUN_SPORE
	db 22, PSYBEAM
	db 25, HEADBUTT
	db 28, SLEEP_POWDER
	db 35, ZEN_HEADBUTT
	db 40, PSYCHIC_M
	db 45, LEECH_LIFE
	db 0

DiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0
; Learnset
    db 1, SCRATCH
	db 4, GROWL
	db 8, SAND_ATTACK
	db 12, MUD_SLAP
	db 17, HEADBUTT
	db 22, SLASH
	db 28, DIG
	db 34, EARTH_POWER
	db 39, EARTHQUAKE
	db 44, FISSURE
	db 0

DugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 8, SAND_ATTACK
	db 12, MUD_SLAP
	db 17, HEADBUTT
	db 22, SLASH
	db 26, DIG
	db 36, EARTH_POWER
	db 41, EARTHQUAKE
	db 46, FISSURE
	db 0

ADiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, A_DUGTRIO
	db 0
; Learnset
	db 1, SCRATCH
	db 4, GROWL
	db 8, SAND_ATTACK
	db 12, MUD_SLAP
	db 17, HEADBUTT
	db 22, IRON_HEAD
	db 28, DIG
	db 34, EARTH_POWER
	db 39, EARTHQUAKE
	db 44, FISSURE
	db 0

ADugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 8, SAND_ATTACK
	db 12, MUD_SLAP
	db 17, HEADBUTT
	db 22, IRON_HEAD
	db 26, DIG
	db 36, EARTH_POWER
	db 41, EARTHQUAKE
	db 46, FISSURE
	db 0

WiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, WUGTRIO
	db 0
; Learnset
	db 1, SAND_ATTACK
	db 1, WATER_GUN
	db 6, MUD_SLAP
	db 12, WRAP
	db 16, AQUA_JET
	db 20, SLAM
	db 24, WATER_PULSE
	db 28, DIG
	db 35, WATERFALL
	db 0

WugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SAND_ATTACK
	db 1, WATER_GUN
	db 6, MUD_SLAP
	db 12, WRAP
	db 16, AQUA_JET
	db 20, SLAM
	db 24, WATER_PULSE
	db 26, DIG
	db 30, ROCK_TOMB
	db 35, WATERFALL
	db 40, ROCK_SLIDE
	db 45, HEAD_SMASH
	db 50, EARTHQUAKE
	db 0

MeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0
; Learnset
    db 1, SCRATCH
	db 1, GROWL
	db 8, LEER
	db 10, FURY_SWIPES
	db 12, BITE
	db 17, PAY_DAY
	db 22, SWIFT
	db 22, FEINT_ATTACK
	db 26, HEADBUTT
	db 30, SCREECH
	db 33, CRUNCH
	db 36, SLASH
	db 40, AMNESIA
	db 45, PLAY_ROUGH
	db 0

PersianEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 8, LEER
	db 10, FURY_SWIPES
	db 12, BITE
	db 17, PAY_DAY
	db 22, SWIFT
	db 22, FEINT_ATTACK
	db 26, HEADBUTT
	db 33, SCREECH
	db 36, CRUNCH
	db 39, SLASH
	db 42, AMNESIA
	db 47, PLAY_ROUGH
	db 0

AMeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, A_PERSIAN
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 8, LEER
	db 10, FURY_SWIPES
	db 12, BITE
	db 17, PAY_DAY
	db 22, SWIFT
	db 22, FEINT_ATTACK
	db 26, HEADBUTT
	db 30, SCREECH
	db 33, CRUNCH
	db 36, NIGHT_SLASH
	db 40, AMNESIA
	db 45, PLAY_ROUGH
	db 0

APersianEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 8, LEER
	db 10, FURY_SWIPES
	db 12, BITE
	db 17, PAY_DAY
	db 22, SWIFT
	db 22, FEINT_ATTACK
	db 26, HEADBUTT
	db 33, SCREECH
	db 36, CRUNCH
	db 39, NIGHT_SLASH
	db 42, AMNESIA
	db 47, PLAY_ROUGH
	db 0

GMeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PERRSERKER
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 8, LEER
	db 10, FURY_SWIPES
	db 12, BULLET_PUNCH
	db 17, PAY_DAY
	db 22, SWIFT
	db 22, FEINT_ATTACK
	db 26, HEADBUTT
	db 30, SCREECH
	db 33, CRUNCH
	db 36, SLASH
	db 40, IRON_HEAD
	db 45, THRASH
	db 0

PerrserkerEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, GROWL
	db 8, LEER
	db 10, FURY_SWIPES
	db 12, BULLET_PUNCH
	db 17, PAY_DAY
	db 22, SWIFT
	db 22, FEINT_ATTACK
	db 26, HEADBUTT
	db 33, SCREECH
	db 36, CRUNCH
	db 39, SLASH
	db 43, IRON_HEAD
	db 48, THRASH
	db 0

PsyduckEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0
; Learnset
    db 1, SCRATCH
	db 5, TAIL_WHIP
	db 10, WATER_GUN
	db 10, CONFUSION
	db 10, FURY_SWIPES
	db 15, DISABLE
	db 21, ZEN_HEADBUTT
	db 25, WATER_PULSE
	db 28, WATERFALL
	db 38, AMNESIA
	db 45, PSYCHIC_M
	db 52, HYDRO_PUMP
	db 0

GolduckEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 5, TAIL_WHIP
	db 10, WATER_GUN
	db 10, CONFUSION
	db 10, FURY_SWIPES
	db 15, DISABLE
	db 21, ZEN_HEADBUTT
	db 25, WATER_PULSE
	db 28, WATERFALL
	db 33, PSYBEAM
	db 40, AMNESIA
	db 47, PSYCHIC_M
	db 54, HYDRO_PUMP
	db 0

MankeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0
; Learnset
    db 1, SCRATCH
	db 1, LEER
	db 5, FOCUS_ENERGY
	db 7, LOW_KICK
	db 12, FURY_SWIPES
	db 15, SEISMIC_TOSS
	db 21, KARATE_CHOP
	db 24, HEADBUTT
	db 27, MEGA_PUNCH
	db 33, DRAIN_PUNCH
	db 37, THRASH
	db 40, SCREECH
	db 43, OUTRAGE
	db 47, SUPERPOWER
	db 53, CLOSE_COMBAT
	db 0

PrimeapeEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 45, ANNIHILAPE
	db 0
; Learnset
	db 1, SCRATCH
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 7, LOW_KICK
	db 12, FURY_SWIPES
	db 15, SEISMIC_TOSS
	db 21, KARATE_CHOP
	db 24, HEADBUTT
	db 27, MEGA_PUNCH
	db 28, RAGE
	db 35, DRAIN_PUNCH
	db 39, THRASH
	db 42, SCREECH
	db 46, OUTRAGE
	db 49, SUPERPOWER
	db 55, CLOSE_COMBAT
	db 0

AnnihilapeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SCRATCH
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 1, LOW_KICK
	db 12, FURY_SWIPES
	db 15, SEISMIC_TOSS
	db 21, KARATE_CHOP
	db 24, HEADBUTT
	db 27, MEGA_PUNCH
	db 28, RAGE
	db 35, DRAIN_PUNCH
	db 39, THRASH
	db 42, SCREECH
	db 45, SHADOW_PUNCH
	db 46, OUTRAGE
	db 49, SUPERPOWER
	db 52, SHADOW_CLAW
	db 55, CLOSE_COMBAT
	db 0

GrowlitheEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
	db 0
; Learnset
	db 1, BITE
	db 1, ROAR
	db 12, EMBER
	db 18, AGILITY
	db 22, LEER
	db 25, HEADBUTT
	db 30, CRUNCH
	db 35, TAKE_DOWN
	db 40, FLAMETHROWER
	db 46, PLAY_ROUGH
	db 52, FLARE_BLITZ
	db 0

ArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BITE
	db 1, ROAR
	db 1, EMBER
	db 1, AGILITY
	db 22, LEER
	db 25, HEADBUTT
	db 30, CRUNCH
	db 35, TAKE_DOWN
	db 40, FLAMETHROWER
	db 46, PLAY_ROUGH
	db 52, FLARE_BLITZ
	db 0

HGrowlitheEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, H_ARCANINE
	db 0
; Learnset
    db 1, BITE
	db 1, ROAR
	db 12, EMBER
	db 18, AGILITY
	db 22, ROCK_THROW
	db 25, HEADBUTT
	db 30, CRUNCH
	db 33, ROCK_SLIDE
	db 35, TAKE_DOWN
	db 40, FLAMETHROWER
	db 46, STONE_EDGE
	db 52, FLARE_BLITZ
	db 58, HEAD_SMASH
	db 0

HArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BITE
	db 1, ROAR
	db 12, EMBER
	db 18, AGILITY
	db 22, ROCK_THROW
	db 25, HEADBUTT
	db 30, CRUNCH
	db 33, ROCK_SLIDE
	db 35, TAKE_DOWN
	db 40, FLAMETHROWER
	db 46, STONE_EDGE
	db 52, FLARE_BLITZ
	db 58, HEAD_SMASH
	db 0

PoliwagEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0
; Learnset
    db 1, BUBBLE
	db 6, POUND
	db 10, WATER_GUN
	db 13, MUD_SHOT
	db 16, BUBBLEBEAM
	db 25, DOUBLESLAP
	db 31, BODY_SLAM
	db 36, EARTH_POWER
	db 38, AMNESIA
	db 45, HYDRO_PUMP
	db 50, DOUBLE_EDGE
	db 52, HYPNOSIS
	db 0

PoliwhirlEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
	db EVOLVE_ITEM, KINGS_ROCK, 1, POLITOED
	db 0
; Learnset
	db 1, BUBBLE
	db 1, POUND
	db 1, WATER_GUN
	db 13, MUD_SHOT
	db 16, BUBBLEBEAM
	db 25, DOUBLESLAP
	db 33, BODY_SLAM
	db 38, EARTH_POWER
	db 40, AMNESIA
	db 47, HYDRO_PUMP
	db 52, DOUBLE_EDGE
	db 54, HYPNOSIS
	db 0

PoliwrathEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BUBBLE
	db 1, POUND
	db 1, WATER_GUN
	db 1, MUD_SHOT
	db 16, BUBBLEBEAM
	db 25, DOUBLESLAP
	db 33, BODY_SLAM
	db 38, EARTH_POWER
	db 40, DRAIN_PUNCH
	db 47, HYDRO_PUMP
	db 50, SUPERPOWER
	db 52, DOUBLE_EDGE
	db 54, HYPNOSIS
	db 60, CLOSE_COMBAT
	db 0

PolitoedEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BUBBLE
	db 1, POUND
	db 1, WATER_GUN
	db 1, MUD_SHOT
	db 16, BUBBLEBEAM
	db 25, DOUBLESLAP
	db 33, BODY_SLAM
	db 38, EARTH_POWER
	db 40, AMNESIA
	db 47, HYDRO_PUMP
	db 52, DOUBLE_EDGE
	db 54, HYPNOSIS
	db 0

AbraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, KADABRA
	db 0
; Learnset
    db 1, TELEPORT
	db 1, KINESIS
	db 0

KadabraEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LINK_CABLE, 1, ALAKAZAM
	db 0
; Learnset
	db 1, TELEPORT
	db 1, KINESIS
	db 16, CONFUSION
	db 20, DISABLE
	db 24, PSYBEAM
	db 30, PSYCHO_CUT
	db 31, RECOVER
	db 34, ZEN_HEADBUTT
	db 38, PSYCHIC_M
	db 40, SHADOW_BALL
	db 42, REFLECT
	db 45, SUBSTITUTE
	db 0

AlakazamEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MALAKAZAM
	db 0
; Learnset
	db 1, TELEPORT
	db 1, KINESIS
	db 1, CONFUSION
	db 20, DISABLE
	db 24, PSYBEAM
	db 30, PSYCHO_CUT
	db 31, RECOVER
	db 34, ZEN_HEADBUTT
	db 38, PSYCHIC_M
	db 40, SHADOW_BALL
	db 42, REFLECT
	db 45, SUBSTITUTE
	db 0

MAlakazamEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TELEPORT
	db 1, KINESIS
	db 1, CONFUSION
	db 20, DISABLE
	db 24, PSYBEAM
	db 30, PSYCHO_CUT
	db 31, RECOVER
	db 34, ZEN_HEADBUTT
	db 38, PSYCHIC_M
	db 40, SHADOW_BALL
	db 42, REFLECT
	db 45, SUBSTITUTE
	db 60, DARK_PULSE
	db 0

MachopEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0
; Learnset
    db 1, LEER
    db 1, KARATE_CHOP
	db 7, FOCUS_ENERGY
	db 12, LOW_KICK
	db 17, MEGA_PUNCH
	db 22, HEADBUTT
	db 25, SEISMIC_TOSS
	db 31, BULLET_PUNCH
	db 36, SUBMISSION
	db 40, SUPERPOWER
	db 46, CLOSE_COMBAT
	db 50, DOUBLE_EDGE
	db 0

MachokeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LINK_CABLE, 1, MACHAMP
	db 0
; Learnset
	db 1, LEER
    db 1, KARATE_CHOP
	db 1, FOCUS_ENERGY
	db 12, LOW_KICK
	db 17, MEGA_PUNCH
	db 22, HEADBUTT
	db 25, SEISMIC_TOSS
	db 34, BULLET_PUNCH
	db 39, SUBMISSION
	db 43, SUPERPOWER
	db 49, CLOSE_COMBAT
	db 53, DOUBLE_EDGE
	db 0

MachampEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, LEER
    db 1, KARATE_CHOP
	db 1, FOCUS_ENERGY
	db 1, LOW_KICK
	db 17, MEGA_PUNCH
	db 22, HEADBUTT
	db 25, SEISMIC_TOSS
	db 34, BULLET_PUNCH
	db 39, SUBMISSION
	db 43, SUPERPOWER
	db 49, CLOSE_COMBAT
	db 53, DOUBLE_EDGE
	db 0

BellsproutEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0
; Learnset
    db 1, VINE_WHIP
	db 7, GROWTH
	db 13, WRAP
	db 15, POISONPOWDER
	db 18, STUN_SPORE
	db 20, HEADBUTT
	db 22, ACID
	db 27, RAZOR_LEAF
	db 31, SLAM
	db 35, POISON_JAB
	db 42, SLEEP_POWDER
	db 49, LEAF_STORM
	db 0

WeepinbellEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
	db 0
; Learnset
	db 1, VINE_WHIP
	db 7, GROWTH
	db 13, WRAP
	db 15, POISONPOWDER
	db 18, STUN_SPORE
	db 20, HEADBUTT
	db 21, ACID
	db 29, RAZOR_LEAF
	db 33, SLAM
	db 37, POISON_JAB
	db 44, SLEEP_POWDER
	db 51, LEAF_STORM
	db 0

VictreebelEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MVICTREEBEL
	db 0
; Learnset
	db 1, VINE_WHIP
	db 7, GROWTH
	db 13, WRAP
	db 15, POISONPOWDER
	db 18, STUN_SPORE
	db 20, HEADBUTT
	db 21, ACID
	db 29, RAZOR_LEAF
	db 33, SLAM
	db 37, POISON_JAB
	db 44, SLEEP_POWDER
	db 51, LEAF_STORM
	db 0

MVictreebelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, VINE_WHIP
	db 7, GROWTH
	db 13, WRAP
	db 15, POISONPOWDER
	db 18, STUN_SPORE
	db 20, HEADBUTT
	db 21, ACID
	db 29, RAZOR_LEAF
	db 33, SLAM
	db 37, POISON_JAB
	db 44, SLEEP_POWDER
	db 51, LEAF_STORM
	db 60, SLUDGE_BOMB
	db 0

TentacoolEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0
; Learnset
    db 1, POISON_STING
	db 1, CONSTRICT
	db 5, WATER_GUN
	db 8, SUPERSONIC
	db 12, WRAP
	db 16, ACID
	db 22, WATER_PULSE
	db 25, SCREECH
	db 28, BUBBLEBEAM
	db 33, BARRIER
	db 35, ACID_ARMOR
	db 39, POISON_JAB
	db 45, HYDRO_PUMP
	db 0

TentacruelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POISON_STING
	db 1, CONSTRICT
	db 1, WATER_GUN
	db 8, SUPERSONIC
	db 12, WRAP
	db 16, ACID
	db 22, WATER_PULSE
	db 25, SCREECH
	db 28, BUBBLEBEAM
	db 35, BARRIER
	db 37, ACID_ARMOR
	db 41, POISON_JAB
	db 47, HYDRO_PUMP
	db 0

ToedscoolEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, TOEDSCRUEL
	db 0
; Learnset
	db 1, MUD_SLAP
	db 6, ABSORB
	db 9, POISONPOWDER
	db 9, STUN_SPORE
	db 12, TACKLE
	db 15, SUPERSONIC
	db 18, MEGA_DRAIN
	db 23, SCREECH
	db 26, MUD_SHOT
	db 35, SPORE
	db 40, GROWTH
	db 45, GIGA_DRAIN
	db 50, EARTH_POWER
	db 0

ToedscruelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, MUD_SLAP
	db 1, ABSORB
	db 9, POISONPOWDER
	db 9, STUN_SPORE
	db 12, TACKLE
	db 15, SUPERSONIC
	db 18, MEGA_DRAIN
	db 23, SCREECH
	db 26, MUD_SHOT
	db 30, LEECH_SEED
	db 37, SPORE
	db 42, GROWTH
	db 47, GIGA_DRAIN
	db 52, EARTH_POWER
	db 0

GeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0
; Learnset
    db 1, TACKLE
	db 6, BIDE
	db 10, MUD_SLAP
	db 13, DEFENSE_CURL
	db 15, ROCK_THROW
	db 20, SELFDESTRUCT
	db 28, MUD_SHOT
	db 31, ROCK_TOMB
	db 37, EARTHQUAKE
	db 43, HEAD_SMASH
	db 49, STONE_EDGE
	db 55, EXPLOSION
	db 0

GravelerEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LINK_CABLE, 1, GOLEM
	db 0
; Learnset
	db 1, TACKLE
	db 1, BIDE
	db 10, MUD_SLAP
	db 13, DEFENSE_CURL
	db 15, ROCK_THROW
	db 20, SELFDESTRUCT
	db 25, HARDEN
	db 30, MUD_SHOT
	db 33, ROCK_TOMB
	db 39, EARTHQUAKE
	db 45, HEAD_SMASH
	db 51, STONE_EDGE
	db 57, EXPLOSION
	db 0

GolemEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, BIDE
	db 1, MUD_SLAP
	db 1, DEFENSE_CURL
	db 15, ROCK_THROW
	db 20, SELFDESTRUCT
	db 25, HARDEN
	db 30, MUD_SHOT
	db 33, ROCK_TOMB
	db 39, EARTHQUAKE
	db 45, HEAD_SMASH
	db 51, STONE_EDGE
	db 57, EXPLOSION
	db 0

AGeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, A_GRAVELER
	db 0
; Learnset
    db 1, TACKLE
	db 6, BIDE
	db 10, THUNDERSHOCK
	db 13, DEFENSE_CURL
	db 15, ROCK_THROW
	db 20, SELFDESTRUCT
	db 28, THUNDERPUNCH
	db 31, ROCK_TOMB
	db 37, WILD_CHARGE
	db 43, HEAD_SMASH
	db 49, STONE_EDGE
	db 55, EXPLOSION
	db 0

AGravelerEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LINK_CABLE, 1, A_GOLEM
	db 0
; Learnset
	db 1, TACKLE
	db 1, BIDE
	db 10, THUNDERSHOCK
	db 13, DEFENSE_CURL
	db 15, ROCK_THROW
	db 20, SELFDESTRUCT
	db 25, HARDEN
	db 30, THUNDERPUNCH
	db 33, ROCK_TOMB
	db 39, WILD_CHARGE
	db 45, HEAD_SMASH
	db 51, STONE_EDGE
	db 57, EXPLOSION
	db 0

AGolemEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, BIDE
	db 1, THUNDERSHOCK
	db 1, DEFENSE_CURL
	db 15, ROCK_THROW
	db 20, SELFDESTRUCT
	db 25, HARDEN
	db 30, THUNDERPUNCH
	db 33, ROCK_TOMB
	db 39, WILD_CHARGE
	db 45, HEAD_SMASH
	db 51, STONE_EDGE
	db 57, EXPLOSION
	db 0

PonytaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0
; Learnset
    db 1, TACKLE
	db 8, TAIL_WHIP
	db 12, GROWL
	db 14, EMBER
	db 20, STOMP
	db 25, FIRE_SPIN
	db 30, TAKE_DOWN
	db 35, AGILITY
	db 40, DOUBLE_EDGE
	db 45, HYPNOSIS
	db 50, FIRE_BLAST
	db 55, FLARE_BLITZ
	db 0

RapidashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 12, GROWL
	db 14, EMBER
	db 20, STOMP
	db 25, FIRE_SPIN
	db 30, TAKE_DOWN
	db 35, AGILITY
	db 40, SMART_STRIKE
	db 42, DOUBLE_EDGE
	db 45, HYPNOSIS
	db 50, FIRE_BLAST
	db 55, FLARE_BLITZ
	db 0

GPonytaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, G_RAPIDASH
	db 0
; Learnset
	db 1, TACKLE
	db 8, TAIL_WHIP
	db 12, GROWL
	db 14, CONFUSION
	db 20, STOMP
	db 25, PSYBEAM
	db 30, TAKE_DOWN
	db 35, AGILITY
	db 40, DOUBLE_EDGE
	db 45, HYPNOSIS
	db 50, PSYCHIC_M
	db 55, DAZZLE_GLEAM
	db 0

GRapidashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 8, TAIL_WHIP
	db 12, GROWL
	db 14, CONFUSION
	db 20, STOMP
	db 25, PSYBEAM
	db 30, TAKE_DOWN
	db 35, AGILITY
	db 40, PSYCHO_CUT
	db 47, HYPNOSIS
	db 52, PSYCHIC_M
	db 57, DAZZLE_GLEAM
	db 0

SlowpokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_ITEM, KINGS_ROCK, 1, SLOWKING
	db 0
; Learnset
    db 1, TACKLE
	db 1, GROWL
	db 6, WATER_GUN
	db 12, CONFUSION
	db 14, WITHDRAW
	db 16, DISABLE
	db 19, WATER_PULSE
	db 22, HEADBUTT
	db 25, ZEN_HEADBUTT
	db 33, AMNESIA
	db 38, WATERFALL
	db 43, SCALD
	db 48, PSYCHIC_M
	db 0

SlowbroEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MSLOWBRO
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 1, CONFUSION
	db 14, WITHDRAW
	db 16, DISABLE
	db 19, WATER_PULSE
	db 22, HEADBUTT
	db 25, ZEN_HEADBUTT
	db 33, AMNESIA
	db 40, WATERFALL
	db 45, SCALD
	db 50, PSYCHIC_M
	db 0

SlowkingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 1, CONFUSION
	db 14, WITHDRAW
	db 16, DISABLE
	db 19, WATER_PULSE
	db 22, HEADBUTT
	db 25, ZEN_HEADBUTT
	db 33, AMNESIA
	db 40, WATERFALL
	db 45, SCALD
	db 50, PSYCHIC_M
	db 0

GSlowpokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, G_SLOWBRO
	db EVOLVE_ITEM, KINGS_ROCK, 1, G_SLOWKING
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 6, ACID
	db 12, CONFUSION
	db 14, WITHDRAW
	db 16, DISABLE
	db 19, WATER_PULSE
	db 22, HEADBUTT
	db 25, ZEN_HEADBUTT
	db 33, AMNESIA
	db 38, WATERFALL
	db 43, SCALD
	db 48, PSYCHIC_M
	db 0

GSlowbroEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MSLOWBRO
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, ACID
	db 1, CONFUSION
	db 14, WITHDRAW
	db 16, DISABLE
	db 19, WATER_PULSE
	db 22, HEADBUTT
	db 25, ZEN_HEADBUTT
	db 33, AMNESIA
	db 38, POISON_JAB
	db 40, WATERFALL
	db 45, SCALD
	db 50, PSYCHIC_M
	db 0

GSlowkingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, ACID
	db 1, CONFUSION
	db 14, WITHDRAW
	db 16, DISABLE
	db 19, WATER_PULSE
	db 22, HEADBUTT
	db 25, ZEN_HEADBUTT
	db 33, AMNESIA
	db 38, SLUDGE_BOMB
	db 40, WATERFALL
	db 45, SCALD
	db 50, PSYCHIC_M
	db 0

MSlowbroEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 1, CONFUSION
	db 14, WITHDRAW
	db 16, DISABLE
	db 19, WATER_PULSE
	db 22, HEADBUTT
	db 25, ZEN_HEADBUTT
	db 33, AMNESIA
	db 40, WATERFALL
	db 45, SCALD
	db 50, PSYCHIC_M
	db 55, IRON_HEAD
	db 0

MagnemiteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0
; Learnset
    db 1, TACKLE
	db 7, SUPERSONIC
	db 12, THUNDER_WAVE
	db 17, THUNDERSHOCK
	db 21, SONICBOOM
	db 25, SWIFT
	db 27, SHOCK_WAVE
	db 33, SCREECH
	db 39, THUNDERBOLT
	db 45, FLASH_CANNON
	db 0

MagnetonEvosMoves:
; Evolutions
    db EVOLVE_ITEM, THUNDER_STONE, 1, MAGNEZONE
	db 0
; Learnset
	db 1, TACKLE
	db 1, SUPERSONIC
	db 12, THUNDER_WAVE
	db 17, THUNDERSHOCK
	db 21, SONICBOOM
	db 25, SWIFT
	db 27, SHOCK_WAVE
	db 30, TRI_ATTACK
	db 36, SCREECH
	db 42, THUNDERBOLT
	db 48, FLASH_CANNON
	db 0

MagnezoneEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, SUPERSONIC
	db 1, THUNDER_WAVE
	db 1, THUNDERSHOCK
	db 21, SONICBOOM
	db 25, SWIFT
	db 27, SHOCK_WAVE
	db 30, TRI_ATTACK
	db 36, SCREECH
	db 42, THUNDERBOLT
	db 48, FLASH_CANNON
	db 55, EXPLOSION
	db 0

FarfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, PECK
	db 1, SAND_ATTACK
	db 7, LEER
	db 10, FURY_ATTACK
	db 14, QUICK_ATTACK
	db 18, AERIAL_ACE
	db 22, AIR_CUTTER
	db 25, TAKE_DOWN
	db 28, SWORDS_DANCE
	db 35, AGILITY
	db 40, SLASH
	db 45, AIR_SLASH
	db 50, BRAVE_BIRD
	db 0

GFarfetchdEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 35, SIRFETCHD
	db 0
; Learnset
	db 1, PECK
	db 1, SAND_ATTACK
	db 7, LEER
	db 10, FURY_ATTACK
	db 14, QUICK_ATTACK
	db 18, KARATE_CHOP
	db 22, COUNTER
	db 25, TAKE_DOWN
	db 28, SWORDS_DANCE
	db 35, NIGHT_SLASH
	db 40, SLASH
	db 45, CLOSE_COMBAT
	db 50, BRAVE_BIRD
	db 0

SirfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, PECK
	db 1, SAND_ATTACK
	db 1, LEER
	db 1, FURY_ATTACK
	db 14, QUICK_ATTACK
	db 18, KARATE_CHOP
	db 22, COUNTER
	db 25, TAKE_DOWN
	db 28, SWORDS_DANCE
	db 35, NIGHT_SLASH
	db 43, SLASH
	db 47, CLOSE_COMBAT
	db 53, BRAVE_BIRD
	db 0

DoduoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, DODRIO
	db 0
; Learnset
    db 1, PECK
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 13, RAGE
    db 16, FURY_ATTACK
	db 23, AGILITY
	db 27, ROOST
	db 30, DRILL_PECK
	db 36, SWORDS_DANCE
	db 40, JUMP_KICK
	db 46, THRASH
	db 50, EXTREMESPEED
	db 53, BRAVE_BIRD
	db 0

DodrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, PECK
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 13, RAGE
    db 16, FURY_ATTACK
	db 23, AGILITY
	db 27, ROOST
	db 30, DRILL_PECK
	db 31, TRI_ATTACK
	db 38, SWORDS_DANCE
	db 42, JUMP_KICK
	db 48, THRASH
	db 52, EXTREMESPEED
	db 55, BRAVE_BIRD
	db 0

SeelEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0
; Learnset
    db 1, HEADBUTT
	db 5, GROWL
	db 12, AQUA_JET
	db 20, REST
	db 25, AURORA_BEAM
	db 30, TAKE_DOWN
	db 35, WATERFALL
	db 40, ICE_BEAM
	db 45, DOUBLE_EDGE
	db 50, ICICLE_CRASH
	db 0

DewgongEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, HEADBUTT
	db 5, GROWL
	db 12, AQUA_JET
	db 20, REST
	db 25, AURORA_BEAM
	db 30, TAKE_DOWN
	db 34, HORN_DRILL
	db 38, WATERFALL
	db 43, ICE_BEAM
	db 48, DOUBLE_EDGE
	db 53, ICICLE_CRASH
	db 0

GrimerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 38, MUK
	db 0
; Learnset
    db 1, POUND
	db 1, POISON_GAS
	db 12, DISABLE
	db 17, HARDEN
	db 22, SLUDGE
	db 26, MUD_SLAP
	db 30, SCREECH
	db 32, SHADOW_SNEAK
	db 35, MINIMIZE
	db 39, TOXIC
	db 42, ACID_ARMOR
	db 48, SLUDGE_BOMB
	db 0

MukEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POUND
	db 1, POISON_GAS
	db 1, DISABLE
	db 17, HARDEN
	db 22, SLUDGE
	db 26, MUD_SLAP
	db 30, SCREECH
	db 32, SHADOW_SNEAK
	db 35, MINIMIZE
	db 38, POISON_JAB
	db 39, TOXIC
	db 42, ACID_ARMOR
	db 48, SLUDGE_BOMB
	db 0

AGrimerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 38, A_MUK
	db 0
; Learnset
	db 1, POUND
	db 1, POISON_GAS
	db 12, DISABLE
	db 17, HARDEN
	db 22, BITE
	db 26, MUD_SLAP
	db 30, SCREECH
	db 32, SHADOW_SNEAK
	db 35, MINIMIZE
	db 39, CRUNCH
	db 42, ACID_ARMOR
	db 48, SLUDGE_BOMB
	db 0

AMukEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POUND
	db 1, POISON_GAS
	db 1, DISABLE
	db 17, HARDEN
	db 22, BITE
	db 26, MUD_SLAP
	db 30, SCREECH
	db 32, SHADOW_SNEAK
	db 35, MINIMIZE
	db 38, POISON_JAB
	db 39, CRUNCH
	db 42, ACID_ARMOR
	db 48, SLUDGE_BOMB
	db 0

ShellderEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
	db 0
; Learnset
    db 1, TACKLE
	db 1, WITHDRAW
	db 5, WATER_GUN
	db 12, LEER
	db 18, SUPERSONIC
	db 23, CLAMP
	db 27, AURORA_BEAM
	db 30, SWIFT
	db 33, SELFDESTRUCT
	db 36, WATER_PULSE
	db 40, ICE_BEAM
	db 45, HYDRO_PUMP
	db 50, EXPLOSION
	db 0

CloysterEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, WITHDRAW
	db 1, WATER_GUN
	db 1, LEER
	db 18, SUPERSONIC
	db 23, CLAMP
	db 27, AURORA_BEAM
	db 30, SWIFT
	db 33, SELFDESTRUCT
	db 35, SPIKE_CANNON
	db 36, WATER_PULSE
	db 40, ICE_BEAM
	db 45, HYDRO_PUMP
	db 50, EXPLOSION
	db 0

GastlyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0
; Learnset
    db 1, LICK
	db 1, SMOG
	db 8, CONFUSE_RAY
	db 14, POISON_GAS
	db 18, NIGHT_SHADE
	db 22, WILL_O_WISP
	db 27, TOXIC
	db 32, SHADOW_BALL
	db 38, DARK_PULSE
	db 46, HYPNOSIS
	db 46, DREAM_EATER
	db 0

HaunterEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LINK_CABLE, 1, GENGAR
	db 0
; Learnset
	db 1, LICK
	db 1, SMOG
	db 1, CONFUSE_RAY
	db 14, POISON_GAS
	db 18, NIGHT_SHADE
	db 22, WILL_O_WISP
	db 25, SHADOW_PUNCH
	db 29, TOXIC
	db 34, SHADOW_BALL
	db 40, DARK_PULSE
	db 48, HYPNOSIS
	db 48, DREAM_EATER
	db 0

GengarEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MGENGAR
	db 0
; Learnset
	db 1, LICK
	db 1, SMOG
	db 1, CONFUSE_RAY
	db 1, POISON_GAS
	db 18, NIGHT_SHADE
	db 22, WILL_O_WISP
	db 25, SHADOW_PUNCH
	db 29, TOXIC
	db 34, SHADOW_BALL
	db 40, DARK_PULSE
	db 48, HYPNOSIS
	db 48, DREAM_EATER
	db 0

MGengarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, LICK
	db 1, SMOG
	db 1, CONFUSE_RAY
	db 1, POISON_GAS
	db 18, NIGHT_SHADE
	db 22, WILL_O_WISP
	db 29, TOXIC
	db 34, SHADOW_BALL
	db 40, DARK_PULSE
	db 48, HYPNOSIS
	db 48, DREAM_EATER
	db 54, SLUDGE_BOMB
	db 56, SHADOW_CLAW
	db 0

OnixEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 33, STEELIX
	db 0
; Learnset
    db 1, TACKLE
	db 1, SCREECH
	db 9, BIND
	db 13, ROCK_THROW
	db 17, RAGE
	db 20, DRAGONBREATH
	db 23, HARDEN
	db 25, SLAM
	db 30, ROCK_SLIDE
	db 35, DIG
	db 40, IRON_TAIL
	db 45, STONE_EDGE
	db 50, DOUBLE_EDGE
	db 55, HEAD_SMASH
	db 57, EARTHQUAKE
	db 0

SteelixEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MSTEELIX
	db 0
; Learnset
	db 1, TACKLE
	db 1, SCREECH
	db 1, BIND
	db 1, ROCK_THROW
	db 17, RAGE
	db 20, DRAGONBREATH
	db 23, HARDEN
	db 25, SLAM
	db 30, ROCK_SLIDE
	db 33, IRON_TAIL
	db 37, DIG
	db 42, IRON_TAIL
	db 47, STONE_EDGE
	db 52, DOUBLE_EDGE
	db 57, IRON_HEAD
	db 59, EARTHQUAKE
	db 0

MSteelixEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, SCREECH
	db 1, BIND
	db 1, ROCK_THROW
	db 17, RAGE
	db 20, DRAGONBREATH
	db 23, HARDEN
	db 25, SLAM
	db 30, ROCK_SLIDE
	db 33, IRON_TAIL
	db 37, DIG
	db 42, IRON_TAIL
	db 47, STONE_EDGE
	db 52, DOUBLE_EDGE
	db 57, IRON_HEAD
	db 59, EARTHQUAKE
	db 65, DRILL_RUN
	db 65, BARRIER
	db 0

DrowzeeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, HYPNO
	db 0
; Learnset
    db 1, POUND
	db 7, DISABLE
	db 12, CONFUSION
	db 17, POISON_GAS
	db 22, PSYBEAM
	db 24, HEADBUTT
	db 29, ZEN_HEADBUTT
	db 34, PSYCHIC_M
	db 37, MEDITATE
	db 42, HYPNOSIS
	db 42, DREAM_EATER
	db 0

HypnoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POUND
	db 1, DISABLE
	db 1, CONFUSION
	db 17, POISON_GAS
	db 22, PSYBEAM
	db 24, HEADBUTT
	db 31, ZEN_HEADBUTT
	db 36, PSYCHIC_M
	db 39, MEDITATE
	db 44, HYPNOSIS
	db 44, DREAM_EATER
	db 0

KrabbyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, KINGLER
	db 0
; Learnset
    db 1, BUBBLE
	db 1, LEER
	db 4, HARDEN
	db 10, MUD_SHOT
	db 16, BUBBLEBEAM
    db 20, VICEGRIP
	db 24, STOMP
	db 30, SLAM
	db 36, CRABHAMMER
	db 42, SWORDS_DANCE
	db 48, GUILLOTINE
	db 0

KinglerEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, BUBBLE
	db 1, LEER
	db 1, HARDEN
	db 10, MUD_SHOT
	db 16, BUBBLEBEAM
    db 20, VICEGRIP
	db 24, STOMP
	db 33, SLAM
	db 39, CRABHAMMER
	db 45, SWORDS_DANCE
	db 51, GUILLOTINE
	db 0

VoltorbEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0
; Learnset
    db 1, TACKLE
	db 7, SCREECH
	db 13, THUNDERSHOCK
	db 17, SONICBOOM
	db 20, SWIFT
	db 25, SELFDESTRUCT
	db 29, LIGHT_SCREEN
	db 35, THUNDERBOLT
	db 43, EXPLOSION
	db 48, WILD_CHARGE
	db 50, THUNDER
	db 0

ElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, SCREECH
	db 1, THUNDERSHOCK
	db 17, SONICBOOM
	db 20, SWIFT
	db 25, SELFDESTRUCT
	db 29, LIGHT_SCREEN
	db 37, THUNDERBOLT
	db 45, EXPLOSION
	db 50, WILD_CHARGE
	db 52, THUNDER
	db 0

HVoltorbEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, H_ELECTRODE
	db 0
; Learnset
	db 1, TACKLE
	db 7, STUN_SPORE
	db 13, THUNDERSHOCK
	db 17, BULLET_SEED
	db 20, SWIFT
	db 25, SELFDESTRUCT
	db 29, ENERGY_BALL
	db 35, THUNDERBOLT
	db 43, EXPLOSION
	db 48, WILD_CHARGE
	db 50, LEAF_STORM
	db 0

HElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, STUN_SPORE
	db 1, THUNDERSHOCK
	db 1, BULLET_SEED
	db 20, SWIFT
	db 25, SELFDESTRUCT
	db 29, ENERGY_BALL
	db 35, THUNDERBOLT
	db 43, EXPLOSION
	db 48, WILD_CHARGE
	db 50, LEAF_STORM
	db 0

ExeggcuteEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
; Learnset
    db 1, BARRAGE
	db 7, CONFUSION
	db 14, HYPNOSIS
	db 20, STUN_SPORE
	db 26, POISONPOWDER
	db 32, PSYBEAM
	db 37, REFLECT
	db 41, LEECH_SEED
	db 45, SOLARBEAM
	db 50, SLEEP_POWDER
	db 53, EGG_BOMB
	db 55, PSYCHIC_M
	db 0

ExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BARRAGE
	db 1, CONFUSION
	db 1, HYPNOSIS
	db 1, STUN_SPORE
	db 26, POISONPOWDER
	db 28, STOMP
	db 32, PSYBEAM
	db 37, REFLECT
	db 41, LEECH_SEED
	db 45, SOLARBEAM
	db 50, SLEEP_POWDER
	db 53, EGG_BOMB
	db 55, PSYCHIC_M
	db 0

AExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BARRAGE
	db 1, CONFUSION
	db 1, HYPNOSIS
	db 1, STUN_SPORE
	db 26, POISONPOWDER
	db 28, STOMP
	db 32, DRAGON_RAGE
	db 37, LEECH_SEED
	db 42, SOLARBEAM
	db 45, DRAGONHAMMER
	db 47, SLEEP_POWDER
	db 50, EGG_BOMB
	db 60, DRACO_METEOR
	db 0

CuboneEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0
; Learnset¨
    db 1, GROWL
	db 5, TACKLE
	db 8, TAIL_WHIP
	db 10, BONE_CLUB
	db 13, HEADBUTT
	db 16, RAGE
	db 18, MUD_SLAP
	db 20, LEER
	db 23, FOCUS_ENERGY
	db 27, BONEMERANG
	db 33, DOUBLE_EDGE
	db 38, SWORDS_DANCE
	db 42, EARTHQUAKE
	db 0

MarowakEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, GROWL
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, BONE_CLUB
	db 13, HEADBUTT
	db 16, RAGE
	db 18, MUD_SLAP
	db 20, LEER
	db 23, FOCUS_ENERGY
	db 27, BONEMERANG
	db 35, DOUBLE_EDGE
	db 40, SWORDS_DANCE
	db 44, EARTHQUAKE
	db 0

AMarowakEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, GROWL
	db 1, TACKLE
	db 1, FIRE_SPIN
	db 1, BONE_CLUB
	db 13, HEADBUTT
	db 16, EMBER
	db 18, NIGHT_SHADE
	db 20, LEER
	db 23, FOCUS_ENERGY
	db 27, WILL_O_WISP
	db 32, SHADOW_BALL
	db 35, DOUBLE_EDGE
	db 40, SWORDS_DANCE
	db 44, FLARE_BLITZ
	db 48, SHADOW_CLAW
	db 50, SHADOW_SNEAK
	db 0

HitmonleeEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, DOUBLE_KICK
	db 1, MEDITATE
	db 10, FOCUS_ENERGY
	db 20, ROLLING_KICK
	db 25, JUMP_KICK
	db 30, BULLET_PUNCH
	db 35, MACH_PUNCH
	db 40, HI_JUMP_KICK
	db 44, CLOSE_COMBAT
	db 47, MEGA_KICK
	db 0

HitmonchanEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, COMET_PUNCH
	db 1, AGILITY
	db 9, MACH_PUNCH
	db 16, BULLET_PUNCH
	db 21, FIRE_PUNCH
	db 24, ICE_PUNCH
	db 27, THUNDERPUNCH
	db 30, AGILITY
	db 33, MEGA_PUNCH
	db 36, DRAIN_PUNCH
	db 39, COUNTER
	db 42, CLOSE_COMBAT
	db 0

HitmontopEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, QUICK_ATTACK
	db 1, TACKLE
	db 10, FOCUS_ENERGY
	db 17, COUNTER
	db 20, ROLLING_KICK
	db 22, AGILITY
	db 25, MUD_SLAP
	db 30, HEADBUTT
	db 35, MACH_PUNCH
	db 40, HI_JUMP_KICK
	db 45, CLOSE_COMBAT
	db 0

LickitungEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 35, LICKILICKY
	db 0
; Learnset
    db 1, LICK
    db 1, SUPERSONIC
	db 5, WRAP
	db 8, ACID
	db 12, STOMP
	db 15, DISABLE
	db 18, DEFENSE_CURL
	db 24, SLAM
	db 30, SCREECH
	db 36, BODY_SLAM
	db 40, ZEN_HEADBUTT
	db 45, AMNESIA
	db 50, DOUBLE_EDGE
	db 0

LickilickyEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, LICK
    db 1, SUPERSONIC
	db 1, WRAP
	db 1, ACID
	db 12, STOMP
	db 15, DISABLE
	db 18, DEFENSE_CURL
	db 24, SLAM
	db 30, SCREECH
	db 38, BODY_SLAM
	db 42, ZEN_HEADBUTT
	db 47, AMNESIA
	db 52, DOUBLE_EDGE
	db 0

KoffingEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 35, WEEZING
	db 0
; Learnset
    db 1, TACKLE
	db 1, POISON_GAS
	db 8, SMOG
	db 12, SMOKESCREEN
	db 17, SLUDGE
	db 24, SELFDESTRUCT
	db 26, HAZE
	db 30, TOXIC
	db 35, SLUDGE_BOMB
	db 40, EXPLOSION
	db 0

WeezingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, POISON_GAS
	db 1, SMOG
	db 12, SMOKESCREEN
	db 17, SLUDGE
	db 24, SELFDESTRUCT
	db 26, HAZE
	db 30, TOXIC
	db 35, SLUDGE_BOMB
	db 42, EXPLOSION
	db 0

GWeezingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, POISON_GAS
	db 1, SMOG
	db 12, SMOKESCREEN
	db 17, SLUDGE
	db 24, SELFDESTRUCT
	db 26, HAZE
	db 30, TOXIC
	db 35, SLUDGE_BOMB
	db 42, EXPLOSION
	db 45, DAZZLE_GLEAM
	db 0

RhyhornEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 42, RHYDON
	db 0
; Learnset
    db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, FURY_ATTACK
	db 10, MUD_SLAP
	db 15, HORN_ATTACK
	db 20, STOMP
	db 25, ROCK_THROW
	db 30, DRILL_RUN
	db 35, TAKE_DOWN
	db 40, EARTHQUAKE
	db 45, STONE_EDGE
	db 50, HORN_DRILL
	db 0

RhydonEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 55, RHYPERIOR
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, FURY_ATTACK
	db 10, MUD_SLAP
	db 15, HORN_ATTACK
	db 20, STOMP
	db 25, ROCK_THROW
	db 30, DRILL_RUN
	db 35, TAKE_DOWN
	db 40, EARTHQUAKE
	db 47, STONE_EDGE
	db 52, HORN_DRILL
	db 0

RhyperiorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, FURY_ATTACK
	db 1, MUD_SLAP
	db 15, HORN_ATTACK
	db 20, STOMP
	db 25, ROCK_THROW
	db 30, DRILL_RUN
	db 35, TAKE_DOWN
	db 40, EARTHQUAKE
	db 47, STONE_EDGE
	db 52, HORN_DRILL
	db 0

HappinyEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 20, CHANSEY
	db 0
; Learnset
    db 1, POUND
	db 1, DEFENSE_CURL
	db 7, DOUBLESLAP
	db 12, CHARM
	db 30, SOFTBOILED
	db 0

ChanseyEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 45, BLISSEY
	db 0
; Learnset
    db 1, POUND
	db 1, TAIL_WHIP
	db 12, DOUBLESLAP
	db 20, SING
	db 22, GROWL
	db 25, EGG_BOMB
	db 30, MINIMIZE
	db 32, DEFENSE_CURL
	db 36, LIGHT_SCREEN
	db 40, DOUBLE_EDGE
	db 45, SEISMIC_TOSS
	db 50, SOFTBOILED
	db 0

BlisseyEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POUND
	db 1, TAIL_WHIP
	db 1, DOUBLESLAP
	db 1, SING
	db 22, GROWL
	db 25, EGG_BOMB
	db 30, MINIMIZE
	db 32, DEFENSE_CURL
	db 36, LIGHT_SCREEN
	db 40, DOUBLE_EDGE
	db 45, SEISMIC_TOSS
	db 55, SOFTBOILED
	db 0

TangelaEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 41, TANGROWTH
	db 0
; Learnset
    db 1, CONSTRICT
	db 1, BIND
	db 6, ABSORB
	db 9, GROWTH
	db 14, MEGA_DRAIN
	db 17, VINE_WHIP
	db 20, POISONPOWDER
	db 24, STUN_SPORE
	db 32, GIGA_DRAIN
	db 36, SLEEP_POWDER
	db 40, SLAM
	db 45, ENERGY_BALL
	db 50, LEAF_STORM
	db 0

TangrowthEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, CONSTRICT
	db 1, BIND
	db 6, ABSORB
	db 9, GROWTH
	db 14, MEGA_DRAIN
	db 17, VINE_WHIP
	db 20, POISONPOWDER
	db 24, STUN_SPORE
	db 32, GIGA_DRAIN
	db 36, SLEEP_POWDER
	db 40, SLAM
	db 47, ENERGY_BALL
	db 52, LEAF_STORM
	db 0

KangaskhanEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MKANGASKHAN
	db 0
; Learnset
    db 1, COMET_PUNCH
	db 1, RAGE
	db 12, BITE
	db 17, FOCUS_ENERGY
	db 22, LEER
	db 28, MEGA_PUNCH
	db 33, DIZZY_PUNCH
	db 37, CRUNCH
	db 42, OUTRAGE
	db 47, DOUBLE_EDGE
	db 0

MKangaskhanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, COMET_PUNCH
	db 1, RAGE
	db 1, BITE
	db 17, FOCUS_ENERGY
	db 22, LEER
	db 28, MEGA_PUNCH
	db 33, DIZZY_PUNCH
	db 37, CRUNCH
	db 42, OUTRAGE
	db 47, DOUBLE_EDGE
	db 60, HYPER_BEAM
	db 0

HorseaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, SEADRA
	db 0
; Learnset
    db 1, BUBBLE
	db 1, LEER
	db 7, SMOKESCREEN
	db 10, TWISTER
	db 12, WATER_GUN
	db 15, FOCUS_ENERGY
	db 20, DRAGONBREATH
	db 25, BUBBLEBEAM
	db 30, AGILITY
	db 35, WATER_PULSE
	db 40, HYDRO_PUMP
	db 0

SeadraEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 50, KINGDRA
	db 0
; Learnset
	db 1, BUBBLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 10, TWISTER
	db 12, WATER_GUN
	db 15, FOCUS_ENERGY
	db 20, DRAGONBREATH
	db 25, BUBBLEBEAM
	db 30, AGILITY
	db 35, AURORA_BEAM
	db 40, WATER_PULSE
	db 45, HYDRO_PUMP
	db 50, HYPER_BEAM
	db 0

KingdraEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BUBBLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 1, TWISTER
	db 12, WATER_GUN
	db 15, FOCUS_ENERGY
	db 20, DRAGONBREATH
	db 25, BUBBLEBEAM
	db 30, AGILITY
	db 35, AURORA_BEAM
	db 40, WATER_PULSE
	db 45, HYDRO_PUMP
	db 50, HYPER_BEAM
	db 55, DRACO_METEOR
	db 0

GoldeenEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, SEAKING
	db 0
; Learnset
    db 1, PECK
	db 1, TAIL_WHIP
	db 5, SUPERSONIC
	db 12, WATER_PULSE
	db 16, HORN_ATTACK
	db 20, AGILITY
	db 24, FURY_ATTACK
	db 28, HAZE
	db 32, WATERFALL
	db 36, AQUA_JET
	db 40, HORN_DRILL
	db 45, HYDRO_PUMP
	db 0

SeakingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, PECK
	db 1, TAIL_WHIP
	db 5, SUPERSONIC
	db 12, WATER_PULSE
	db 16, HORN_ATTACK
	db 20, AGILITY
	db 24, FURY_ATTACK
	db 28, HAZE
	db 32, WATERFALL
	db 40, AQUA_JET
	db 44, HORN_DRILL
	db 49, HYDRO_PUMP
	db 0

StaryuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, STARMIE
	db 0
; Learnset
    db 1, TACKLE
	db 1, HARDEN
	db 9, WATER_GUN
	db 12, AQUA_JET
	db 16, SWIFT
	db 20, BUBBLEBEAM
	db 25, RECOVER
	db 27, PSYBEAM
	db 30, MINIMIZE
	db 35, LIGHT_SCREEN
	db 38, PSYCHIC_M
	db 42, WATERFALL
	db 46, RECOVER
	db 52, HYDRO_PUMP
	db 0

StarmieEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MSTARMIE
	db 0
; Learnset
	db 1, TACKLE
	db 1, HARDEN
	db 1, WATER_GUN
	db 1, AQUA_JET
	db 16, SWIFT
	db 20, BUBBLEBEAM
	db 25, RECOVER
	db 27, PSYBEAM
	db 30, MINIMIZE
	db 35, LIGHT_SCREEN
	db 38, PSYCHIC_M
	db 42, WATERFALL
	db 46, RECOVER
	db 52, HYDRO_PUMP
	db 0

MStarmieEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, HARDEN
	db 1, WATER_GUN
	db 1, AQUA_JET
	db 16, SWIFT
	db 20, BUBBLEBEAM
	db 25, RECOVER
	db 27, PSYBEAM
	db 30, MINIMIZE
	db 35, LIGHT_SCREEN
	db 38, PSYCHIC_M
	db 42, WATERFALL
	db 46, RECOVER
	db 52, HYDRO_PUMP
	db 55, SWORDS_DANCE
	db 60, ZEN_HEADBUTT
	db 60, CLOSE_COMBAT
	db 0

MimeJrEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 23, MR_MIME
	db 0
; Learnset
    db 1, BARRIER
	db 1, POUND
	db 12, CONFUSION
	db 15, MIMIC
	db 0

MrMimeEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, BARRIER
	db 1, POUND
	db 12, CONFUSION
	db 15, MIMIC
	db 23, PSYBEAM
	db 27, SUBSTITUTE
	db 30, LIGHT_SCREEN
	db 30, REFLECT
	db 35, DOUBLESLAP
	db 40, MEDITATE
	db 45, PSYCHIC_M
	db 45, DAZZLE_GLEAM
	db 0

GMrMimeEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 41, MR_RIME
	db 0
; Learnset
	db 1, BARRIER
	db 1, POUND
	db 12, CONFUSION
	db 15, MIMIC
	db 23, AURORA_BEAM
	db 27, SUBSTITUTE
	db 30, LIGHT_SCREEN
	db 30, REFLECT
	db 35, DOUBLESLAP
	db 40, MEDITATE
	db 45, PSYCHIC_M
	db 45, BLIZZARD
	db 0

MrRimeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BARRIER
	db 1, POUND
	db 1, CONFUSION
	db 1, MIMIC
	db 23, AURORA_BEAM
	db 27, SUBSTITUTE
	db 30, LIGHT_SCREEN
	db 30, REFLECT
	db 35, DOUBLESLAP
	db 40, MEDITATE
	db 48, PSYCHIC_M
	db 48, BLIZZARD
	db 0

ScytherEvosMoves:
; Evolutions
    db EVOLVE_ITEM, LINK_CABLE, 1, SCIZOR
	db EVOLVE_ITEM, KINGS_ROCK, 1, KLEAVOR
	db 0
; Learnset
    db 1, QUICK_ATTACK
	db 1, LEER
	db 10, FOCUS_ENERGY
	db 14, WING_ATTACK
	db 17, BUG_BITE
	db 21, SLASH
	db 24, DOUBLE_TEAM
	db 29, X_SCISSOR
	db 35, AIR_SLASH
	db 42, SWORDS_DANCE
	db 42, AGILITY
	db 0

ScizorEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MSCIZOR
	db 0
; Learnset
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 14, WING_ATTACK
	db 17, BUG_BITE
	db 21, SLASH
	db 24, DOUBLE_TEAM
	db 29, X_SCISSOR
	db 35, BULLET_PUNCH
	db 42, SWORDS_DANCE
	db 42, AGILITY
	db 0

MScizorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 14, WING_ATTACK
	db 17, BUG_BITE
	db 21, SLASH
	db 24, DOUBLE_TEAM
	db 29, X_SCISSOR
	db 35, BULLET_PUNCH
	db 42, SWORDS_DANCE
	db 42, AGILITY
	db 48, IRON_HEAD
	db 0

KleavorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, QUICK_ATTACK
	db 1, LEER
	db 10, FOCUS_ENERGY
	db 14, WING_ATTACK
	db 17, BUG_BITE
	db 21, SLASH
	db 24, DOUBLE_TEAM
	db 29, X_SCISSOR
	db 35, ROCK_SLIDE
	db 42, SWORDS_DANCE
	db 42, AGILITY
	db 0

SmoochumEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 30, JYNX
	db 0
; Learnset
    db 1, POUND
	db 1, LICK
	db 7, POWDER_SNOW
	db 12, CONFUSION
	db 17, SING
	db 25, PSYBEAM
	db 28, ICE_PUNCH
	db 31, DOUBLESLAP
	db 38, BODY_SLAM
	db 43, THRASH
	db 50, BLIZZARD
	db 50, PSYCHIC_M
	db 52, LOVELY_KISS
	db 0

JynxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, POUND
	db 1, LICK
	db 1, POWDER_SNOW
	db 1, CONFUSION
	db 17, SING
	db 25, PSYBEAM
	db 28, ICE_PUNCH
	db 33, DOUBLESLAP
	db 40, BODY_SLAM
	db 45, THRASH
	db 52, BLIZZARD
	db 52, PSYCHIC_M
	db 54, LOVELY_KISS
	db 0

ElekidEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0
; Learnset
    db 1, LEER
	db 1, QUICK_ATTACK
	db 7, THUNDERSHOCK
	db 12, SWIFT
	db 17, SHOCK_WAVE
	db 22, THUNDER_WAVE
	db 26, SCREECH
	db 28, THUNDERPUNCH
	db 34, LOW_KICK
	db 40, THUNDERBOLT
	db 44, LIGHT_SCREEN
	db 49, THUNDER
	db 0

ElectabuzzEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 50, ELECTIVIRE
	db 0
; Learnset
	db 1, LEER
	db 1, QUICK_ATTACK
	db 1, THUNDERSHOCK
	db 12, SWIFT
	db 17, SHOCK_WAVE
	db 22, THUNDER_WAVE
	db 26, SCREECH
	db 28, THUNDERPUNCH
	db 36, LOW_KICK
	db 42, THUNDERBOLT
	db 46, LIGHT_SCREEN
	db 51, THUNDER
	db 0

ElectivireEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, LEER
	db 1, QUICK_ATTACK
	db 1, THUNDERSHOCK
	db 12, SWIFT
	db 17, SHOCK_WAVE
	db 22, THUNDER_WAVE
	db 26, SCREECH
	db 28, THUNDERPUNCH
	db 36, LOW_KICK
	db 42, THUNDERBOLT
	db 46, LIGHT_SCREEN
	db 50, DRAIN_PUNCH
	db 56, THUNDER
	db 60, HYPER_BEAM
	db 0

MagbyEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 30, MAGMAR
	db 0
; Learnset
    db 1, SMOG
	db 1, LEER
	db 7, EMBER
	db 14, HEADBUTT
	db 20, CONFUSE_RAY
	db 24, MACH_PUNCH
	db 28, FIRE_PUNCH
	db 33, SMOKESCREEN
	db 37, LOW_KICK
	db 41, FLAMETHROWER
	db 48, FIRE_BLAST
	db 50, CLOSE_COMBAT
	db 0

MagmarEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 50, MAGMORTAR
	db 0
; Learnset
	db 1, SMOG
	db 1, LEER
	db 1, EMBER
	db 14, HEADBUTT
	db 20, CONFUSE_RAY
	db 24, MACH_PUNCH
	db 28, FIRE_PUNCH
	db 35, SMOKESCREEN
	db 39, LOW_KICK
	db 43, FLAMETHROWER
	db 48, FIRE_BLAST
	db 52, CLOSE_COMBAT
	db 0

MagmortarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, SMOG
	db 1, LEER
	db 1, EMBER
	db 14, HEADBUTT
	db 20, CONFUSE_RAY
	db 24, MACH_PUNCH
	db 28, FIRE_PUNCH
	db 35, SMOKESCREEN
	db 39, LOW_KICK
	db 43, FLAMETHROWER
	db 48, FIRE_BLAST
	db 50, FLARE_BLITZ
	db 57, CLOSE_COMBAT
	db 0

PinsirEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MPINSIR
	db 0
; Learnset
    db 1, HARDEN
	db 1, TACKLE
	db 10, VICEGRIP
	db 15, SEISMIC_TOSS
	db 18, FOCUS_ENERGY
	db 23, BUG_BITE
	db 27, SUBMISSION
	db 33, SLASH
	db 39, X_SCISSOR
	db 44, SWORDS_DANCE
	db 48, GUILLOTINE
	db 52, SUPERPOWER
	db 56, CLOSE_COMBAT
	db 0

MPinsirEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, HARDEN
	db 1, TACKLE
	db 10, VICEGRIP
	db 15, SEISMIC_TOSS
	db 18, FOCUS_ENERGY
	db 23, BUG_BITE
	db 27, SUBMISSION
	db 33, SLASH
	db 39, X_SCISSOR
	db 44, SWORDS_DANCE
	db 48, GUILLOTINE
	db 52, SUPERPOWER
	db 56, CLOSE_COMBAT
	db 60, AIR_SLASH
	db 60, AIR_CUTTER
	db 0

TaurosEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, TACKLE
	db 1, TAIL_WHIP
	db 10, RAGE
	db 20, HORN_ATTACK
	db 25, STOMP
	db 30, ZEN_HEADBUTT
	db 35, TAKE_DOWN
	db 40, REST
	db 45, THRASH
	db 50, DOUBLE_EDGE
	db 55, HYPER_BEAM
	db 0

PTaurosCEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 10, RAGE
	db 20, HORN_ATTACK
	db 25, STOMP
	db 30, ZEN_HEADBUTT
	db 35, TAKE_DOWN
	db 40, REST
	db 45, CLOSE_COMBAT
	db 50, DOUBLE_EDGE
	db 55, HYPER_BEAM
	db 0

PTaurosAEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 10, RAGE
	db 20, HORN_ATTACK
	db 25, STOMP
	db 30, ZEN_HEADBUTT
	db 35, TAKE_DOWN
	db 40, REST
	db 45, CLOSE_COMBAT
	db 50, DOUBLE_EDGE
	db 55, HYPER_BEAM
	db 60, SCALD
	db 0

PTaurosBEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 10, RAGE
	db 20, HORN_ATTACK
	db 25, STOMP
	db 30, ZEN_HEADBUTT
	db 35, TAKE_DOWN
	db 40, REST
	db 45, CLOSE_COMBAT
	db 50, DOUBLE_EDGE
	db 55, HYPER_BEAM
	db 60, FLARE_BLITZ
	db 0

MagikarpEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0
; Learnset
    db 1, SPLASH
	db 5, TACKLE
	db 30, HYDRO_PUMP
	db 0

GyaradosEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MGYARADOS
	db 0
; Learnset
    db 1, THRASH
	db 20, BITE
	db 21, WATER_PULSE
	db 23, DRAGON_RAGE
	db 26, LEER
	db 29, TWISTER
	db 32, AQUA_JET
	db 37, SCALD
	db 42, WATERFALL
	db 45, CRUNCH
	db 47, HYDRO_PUMP
	db 50, HURRICANE
	db 52, THRASH
	db 57, HYPER_BEAM
	db 0

MGyaradosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, THRASH
	db 20, BITE
	db 21, WATER_PULSE
	db 23, DRAGON_RAGE
	db 26, LEER
	db 29, TWISTER
	db 32, AQUA_JET
	db 37, SCALD
	db 42, WATERFALL
	db 45, CRUNCH
	db 47, HYDRO_PUMP
	db 50, HURRICANE
	db 52, THRASH
	db 57, HYPER_BEAM
	db 70, NIGHT_SLASH
	db 0

LaprasEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, GROWL
	db 1, WATER_GUN
	db 8, SING
	db 16, MIST
	db 22, CONFUSE_RAY
	db 28, WATER_PULSE
	db 34, BODY_SLAM
	db 37, ICICLE_SPEAR
	db 41, ICE_BEAM
	db 46, ICICLE_CRASH
	db 50, HYDRO_PUMP
	db 55, HORN_DRILL
	db 0

DittoEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, TRANSFORM
	db 0

EeveeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
	db EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
	db EVOLVE_ITEM, SUN_STONE, 1, ESPEON
	db EVOLVE_ITEM, MOON_STONE, 1, UMBREON
	db EVOLVE_ITEM, LEAF_STONE, 1, LEAFEON
	db EVOLVE_ITEM, ICE_STONE, 1, GLACEON
	db EVOLVE_ITEM, KINGS_ROCK, 1, SYLVEON
	db 0
; Learnset
    db 1, TACKLE
	db 1, GROWL
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 20, SWIFT
	db 25, BITE
	db 30, DOUBLE_KICK
	db 35, DOUBLE_TEAM
	db 40, TAKE_DOWN
	db 45, DOUBLE_EDGE
	db 0

VaporeonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, WATER_GUN
	db 20, HAZE
	db 20, MIST
	db 25, WATER_PULSE
	db 30, AURORA_BEAM
	db 35, DOUBLE_TEAM
	db 40, ACID_ARMOR
	db 45, HYDRO_PUMP
	db 0

JolteonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, THUNDERSHOCK
	db 20, DOUBLE_KICK
	db 22, THUNDER_WAVE
	db 25, SHOCK_WAVE
	db 30, THUNDER_WAVE
	db 35, DOUBLE_TEAM
	db 40, AGILITY
	db 45, THUNDER
	db 0

FlareonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, EMBER
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, EMBER
	db 20, SMOG
	db 20, RAGE
	db 25, FIRE_SPIN
	db 30, LEER
	db 35, DOUBLE_TEAM
	db 40, FLAMETHROWER
	db 45, FLARE_BLITZ
	db 0

EspeonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, CONFUSION
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, CONFUSION
	db 20, SWIFT
	db 25, PSYBEAM
	db 30, ZEN_HEADBUTT
	db 35, DOUBLE_TEAM
	db 40, ACID_ARMOR
	db 45, PSYCHIC_M
	db 0

UmbreonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, FEINT_ATTACK
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, FEINT_ATTACK
	db 20, SWIFT
	db 25, BITE
	db 30, DARK_PULSE
	db 35, DOUBLE_TEAM
	db 40, CONFUSE_RAY
	db 45, NIGHT_SLASH
	db 0

LeafeonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, ABSORB
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, ABSORB
	db 20, SWIFT
	db 25, MEGA_DRAIN
	db 30, RAZOR_LEAF
	db 35, DOUBLE_TEAM
	db 40, LEECH_SEED
	db 45, LEAF_STORM
	db 0

GlaceonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, POWDER_SNOW
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, POWDER_SNOW
	db 20, SWIFT
	db 25, ICICLE_SPEAR
	db 30, AURORA_BEAM
	db 35, DOUBLE_TEAM
	db 40, BARRIER
	db 45, BLIZZARD
	db 0

SylveonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, GROWL
	db 1, DOUBLESLAP
	db 6, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 15, CHARM
	db 17, DOUBLESLAP
	db 20, SWIFT
	db 25, DRAININGKISS
	db 30, DAZZLE_GLEAM
	db 35, DOUBLE_TEAM
	db 40, LIGHT_SCREEN
	db 45, MOONBLAST
	db 0

PorygonEvosMoves:
; Evolutions
    db EVOLVE_ITEM, UPGRADE, 1, PORYGON2
	db 0
; Learnset
    db 1, TACKLE
	db 1, SHARPEN
	db 8, THUNDERSHOCK
	db 12, CONFUSION
	db 20, PSYBEAM
	db 25, RECOVER
	db 30, AGILITY
	db 35, THUNDERBOLT
	db 40, TRI_ATTACK
	db 45, CONVERSION
	db 50, THUNDER
	db 0

Porygon2EvosMoves:
; Evolutions
    db EVOLVE_ITEM, DUBIOUSDISC, 1, PORYGONZ
	db 0
; Learnset
	db 1, TACKLE
	db 1, SHARPEN
	db 1, THUNDERSHOCK
	db 12, CONFUSION
	db 20, PSYBEAM
	db 25, RECOVER
	db 30, AGILITY
	db 35, THUNDERBOLT
	db 40, TRI_ATTACK
	db 45, CONVERSION
	db 50, THUNDER
	db 0

PorygonZEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, TACKLE
	db 1, SHARPEN
	db 1, THUNDERSHOCK
	db 1, CONFUSION
	db 20, PSYBEAM
	db 25, RECOVER
	db 30, AGILITY
	db 35, THUNDERBOLT
	db 40, TRI_ATTACK
	db 45, CONVERSION
	db 50, THUNDER
	db 0

OmanyteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0
; Learnset
    db 1, CONSTRICT
	db 1, WITHDRAW
	db 7, SPIKE_CANNON
	db 12, BITE
	db 16, WATER_GUN
	db 18, ROCK_TOMB
	db 20, MUD_SHOT
	db 25, HORN_ATTACK
	db 31, LEER
	db 37, SLAM
	db 40, ROCK_SLIDE
	db 45, WATERFALL
	db 50, STONE_EDGE
	db 53, HYDRO_PUMP
	db 0

OmastarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 1, SPIKE_CANNON
	db 12, BITE
	db 16, WATER_GUN
	db 18, ROCK_TOMB
	db 20, MUD_SHOT
	db 25, HORN_ATTACK
	db 31, LEER
	db 37, SLAM
	db 40, ROCK_SLIDE
	db 48, WATERFALL
	db 53, STONE_EDGE
	db 56, HYDRO_PUMP
	db 0

KabutoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0
; Learnset
    db 1, ABSORB
	db 1, HARDEN
	db 5, SCRATCH
	db 10, SAND_ATTACK
	db 15, AQUA_JET
	db 20, LEER
	db 25, MUD_SHOT
	db 30, ROCK_TOMB
	db 35, BUBBLEBEAM
	db 47, HYDRO_PUMP
	db 54, STONE_EDGE
	db 0

KabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ABSORB
	db 1, HARDEN
	db 1, SCRATCH
	db 10, SAND_ATTACK
	db 15, AQUA_JET
	db 20, LEER
	db 25, MUD_SHOT
	db 30, ROCK_TOMB
	db 35, BUBBLEBEAM
	db 42, SLASH
	db 49, HYDRO_PUMP
	db 56, STONE_EDGE
	db 0

AerodactylEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MAERODACTYL
	db 0
; Learnset
	db 1, BITE
	db 1, WING_ATTACK
	db 7, ROAR
	db 14, SUPERSONIC
	db 21, ROCK_THROW
	db 25, AIR_CUTTER
	db 28, AGILITY
	db 35, CRUNCH
	db 42, ROCK_SLIDE
	db 49, AIR_SLASH
	db 56, TAKE_DOWN
	db 60, ROOST
	db 63, HYPER_BEAM
	db 0

MAerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, BITE
	db 1, WING_ATTACK
	db 7, ROAR
	db 14, SUPERSONIC
	db 21, ROCK_THROW
	db 25, AIR_CUTTER
	db 28, AGILITY
	db 35, CRUNCH
	db 42, ROCK_SLIDE
	db 49, AIR_SLASH
	db 56, TAKE_DOWN
	db 60, ROOST
	db 63, HYPER_BEAM
	db 70, HEAD_SMASH
	db 70, BRAVE_BIRD
	db 0

MunchlaxEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 35, SNORLAX
	db 0
; Learnset
    db 1, LICK
	db 1, TACKLE
	db 4, DEFENSE_CURL
	db 10, HEADBUTT
	db 12, BITE
	db 20, SCREECH
	db 26, BODY_SLAM
	db 30, AMNESIA
	db 35, METRONOME
	db 42, DOUBLE_EDGE
	db 0

SnorlaxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, LICK
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 10, HEADBUTT
	db 12, BITE
	db 20, SCREECH
	db 26, BODY_SLAM
	db 30, AMNESIA
	db 35, REST
	db 38, METRONOME
	db 45, DOUBLE_EDGE
	db 52, HYPER_BEAM
	db 0

ArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, GUST
	db 1, POWDER_SNOW
	db 13, MIST
	db 16, LEER
	db 24, AIR_CUTTER
	db 32, ICE_BEAM
	db 40, AGILITY
	db 48, REFLECT
	db 56, ROOST
	db 64, BLIZZARD
	db 72, SKY_ATTACK
	db 0

GArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, GUST
	db 1, CONFUSION
	db 13, CONFUSE_RAY
	db 16, LEER
	db 24, AIR_CUTTER
	db 32, PSYBEAM
	db 40, AGILITY
	db 48, REFLECT
	db 56, ROOST
	db 64, BLIZZARD
	db 72, SKY_ATTACK
	db 0

ZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, THUNDER
	db 55, AGILITY
	db 60, LIGHT_SCREEN
	db 0

GZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, THUNDER
	db 55, AGILITY
	db 60, LIGHT_SCREEN
	db 0

MoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, LEER
	db 55, AGILITY
	db 60, SKY_ATTACK
	db 0
	
GMoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, LEER
	db 55, AGILITY
	db 60, SKY_ATTACK
	db 0

DratiniEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 20, AGILITY
	db 30, SLAM
	db 40, DRAGON_RAGE
	db 50, HYPER_BEAM
	db 0

DragonairEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 20, AGILITY
	db 35, SLAM
	db 45, DRAGON_RAGE
	db 55, HYPER_BEAM
	db 0

DragoniteEvosMoves:
; Evolutions
    db EVOLVE_ITEM, MEGA_STONE, 1, MDRAGONITE
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 20, AGILITY
	db 35, SLAM
	db 45, DRAGON_RAGE
	db 60, HYPER_BEAM
	db 0

MDragoniteEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 20, AGILITY
	db 35, SLAM
	db 45, DRAGON_RAGE
	db 60, HYPER_BEAM
	db 0

MeltanEvosMoves:
; Evolutions
    db EVOLVE_LEVEL, 60, MELMETAL
	db 0
; Learnset
    db 9, TAIL_WHIP
	db 18, THUNDER_WAVE
	db 27, THUNDERSHOCK
	db 36, ACID_ARMOR
	db 45, FLASH_CANNON
	db 0

MelmetalEvosMoves:
; Evolutions
	db 0
; Learnset
    db 9, TAIL_WHIP
	db 18, THUNDER_WAVE
	db 27, THUNDERSHOCK
	db 36, ACID_ARMOR
	db 45, FLASH_CANNON
	db 60, THUNDERPUNCH
	db 63, SMART_STRIKE
	db 66, MEGA_PUNCH
	db 78, SUPERPOWER
	db 80, DBLIRONBASH
	db 83, HYPER_BEAM
	db 0

ScreamTailEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, SING
	db 1, DISABLE
	db 1, POUND
    db 12, CHARM
	db 16, DOUBLESLAP
	db 21, BITE
	db 28, BODY_SLAM
	db 35, REST
	db 42, PLAY_ROUGH
	db 50, CRUNCH
	db 55, ZEN_HEADBUTT
	db 62, DAZZLE_GLEAM
	db 65, PSYCHIC_M
	db 0

SandyShocksEvosMoves:
; Evolutions
	db 0
; Learnset
    db 1, TRI_ATTACK
	db 1, SUPERSONIC
	db 7, MUD_SLAP
	db 14, THUNDERSHOCK
	db 20, SWIFT
	db 26, SCREECH
	db 33, SHOCK_WAVE
	db 34, MUD_SHOT
	db 41, THUNDERBOLT
	db 48, EARTH_POWER
	db 54, WILD_CHARGE
	db 60, EARTHQUAKE
	db 0

MewtwoEvosMoves:
; Evolutions
IF DEF (_RED)
    db EVOLVE_ITEM, MEGA_STONE, 1, MMEWTWOX
ENDC
IF DEF (_BLUE)
    db EVOLVE_ITEM, MEGA_STONE, 1, MMEWTWOY
ENDC
	db 0
; Learnset
	db 63, BARRIER
	db 66, PSYCHIC_M
	db 70, RECOVER
	db 75, MIST
	db 81, AMNESIA
	db 0

MMewtwoXEvosMoves:
; Evolutions
	db 0
; Learnset
	db 63, BARRIER
	db 66, PSYCHIC_M
	db 70, RECOVER
	db 75, MIST
	db 81, AMNESIA
	db 0

MMewtwoYEvosMoves:
; Evolutions
	db 0
; Learnset
	db 63, BARRIER
	db 66, PSYCHIC_M
	db 70, RECOVER
	db 75, MIST
	db 81, AMNESIA
	db 0

MewEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TRANSFORM
	db 20, MEGA_PUNCH
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 0

FossilKabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FossilAerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

; MonGhostEvosMoves:
; ; Evolutions
; 	db 0
; ; Learnset
; 	db 0