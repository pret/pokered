; PureRGBnote: CHANGED: many learnsets and evolution levels were adjusted versus the original game
; Also many pointless empty movesets were removed and pointed to a single empty moveset.
; See constants/pokemon_data_constants.asm
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
	table_width 2, EvosMovesPointerTable
	dw RhydonEvosMoves
	dw KangaskhanEvosMoves
	dw NidoranMEvosMoves
	dw ClefairyEvosMoves
	dw SpearowEvosMoves
	dw VoltorbEvosMoves
	dw NidokingEvosMoves
	dw SlowbroEvosMoves
	dw IvysaurEvosMoves
	dw ExeggutorEvosMoves
	dw LickitungEvosMoves
	dw ExeggcuteEvosMoves
	dw GrimerEvosMoves
	dw GengarEvosMoves
	dw NidoranFEvosMoves
	dw NidoqueenEvosMoves
	dw CuboneEvosMoves
	dw RhyhornEvosMoves
	dw LaprasEvosMoves
	dw ArcanineEvosMoves
	dw MewEvosMoves
	dw GyaradosEvosMoves
	dw ShellderEvosMoves
	dw TentacoolEvosMoves
	dw GastlyEvosMoves
	dw ScytherEvosMoves
	dw StaryuEvosMoves
	dw BlastoiseEvosMoves
	dw PinsirEvosMoves
	dw TangelaEvosMoves
	dw NothingEvosMoves ; torched
	dw NothingEvosMoves
	dw GrowlitheEvosMoves
	dw OnixEvosMoves
	dw FearowEvosMoves
	dw PidgeyEvosMoves
	dw SlowpokeEvosMoves
	dw KadabraEvosMoves
	dw GravelerEvosMoves
	dw ChanseyEvosMoves
	dw MachokeEvosMoves
	dw MrMimeEvosMoves
	dw HitmonleeEvosMoves
	dw HitmonchanEvosMoves
	dw ArbokEvosMoves
	dw ParasectEvosMoves
	dw PsyduckEvosMoves
	dw DrowzeeEvosMoves
	dw GolemEvosMoves
	dw NothingEvosMoves ; irradiated
	dw MagmarEvosMoves
	dw MagmarEvosMoves ; volcanic magmar
	dw ElectabuzzEvosMoves
	dw MagnetonEvosMoves
	dw KoffingEvosMoves
	dw MagnetonEvosMoves ; floating magneton
	dw MankeyEvosMoves
	dw SeelEvosMoves
	dw DiglettEvosMoves
	dw TaurosEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw FarfetchdEvosMoves
	dw VenonatEvosMoves
	dw DragoniteEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw DoduoEvosMoves
	dw PoliwagEvosMoves
	dw JynxEvosMoves
	dw MoltresEvosMoves
	dw ArticunoEvosMoves
	dw ZapdosEvosMoves
	dw DittoEvosMoves
	dw MeowthEvosMoves
	dw KrabbyEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw NothingEvosMoves ; chunky
	dw NothingEvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw WinterDragonairEvosMoves
	dw NothingEvosMoves
	dw SandshrewEvosMoves
	dw SandslashEvosMoves
	dw OmanyteEvosMoves
	dw OmastarEvosMoves
	dw JigglypuffEvosMoves
	dw WigglytuffEvosMoves
	dw EeveeEvosMoves
	dw FlareonEvosMoves
	dw JolteonEvosMoves
	dw VaporeonEvosMoves
	dw MachopEvosMoves
	dw ZubatEvosMoves
	dw EkansEvosMoves
	dw ParasEvosMoves
	dw PoliwhirlEvosMoves
	dw PoliwrathEvosMoves
	dw WeedleEvosMoves
	dw KakunaEvosMoves
	dw BeedrillEvosMoves
	dw NothingEvosMoves ; painless
	dw DodrioEvosMoves
	dw PrimeapeEvosMoves
	dw DugtrioEvosMoves
	dw VenomothEvosMoves
	dw DewgongEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw MachampEvosMoves
	dw NothingEvosMoves
	dw GolduckEvosMoves
	dw HypnoEvosMoves
	dw GolbatEvosMoves
	dw MewtwoEvosMoves
	dw SnorlaxEvosMoves
	dw MagikarpEvosMoves
	dw NothingEvosMoves ; the maw
	dw NothingEvosMoves
	dw MukEvosMoves
	dw NothingEvosMoves
	dw KinglerEvosMoves
	dw CloysterEvosMoves
	dw NothingEvosMoves
	dw ElectrodeEvosMoves
	dw ClefableEvosMoves
	dw WeezingEvosMoves
	dw PersianEvosMoves
	dw MarowakEvosMoves
	dw WeezingEvosMoves ; floating weezing
	dw HaunterEvosMoves
	dw AbraEvosMoves
	dw AlakazamEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw StarmieEvosMoves
	dw BulbasaurEvosMoves
	dw VenusaurEvosMoves
	dw TentacruelEvosMoves
	dw NothingEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw NothingEvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw NidorinoEvosMoves
	dw NidorinaEvosMoves
	dw GeodudeEvosMoves
	dw PorygonEvosMoves
	dw AerodactylEvosMoves
	dw HardenedOnixEvosMoves
	dw MagnemiteEvosMoves
	dw MewtwoEvosMoves
	dw GengarEvosMoves ; powered haunter
	dw CharmanderEvosMoves
	dw SquirtleEvosMoves
	dw CharmeleonEvosMoves
	dw WartortleEvosMoves
	dw CharizardEvosMoves
	dw NothingEvosMoves ; real missingno
	dw NothingEvosMoves ; Fossil Kabutops
	dw NothingEvosMoves ; Fossil aerodactyl
	dw NothingEvosMoves ; GHOST
	dw OddishEvosMoves
	dw GloomEvosMoves
	dw VileplumeEvosMoves
	dw BellsproutEvosMoves
	dw WeepinbellEvosMoves
	dw VictreebelEvosMoves
	assert_table_length NUM_POKEMON_INDEXES

RhydonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, BITE
	db 15, LOW_KICK
	db 19, HORN_ATTACK
	db 23, HEADBUTT
	db 27, FURY_ATTACK
	db 36, SLAM ; FILTHY SLAM
	db 39, EARTHQUAKE
	db 42, SKULL_BASH
	db 47, DEFENSE_CURL
	db 52, MEGA_KICK
	db 56, HYPER_BEAM
	db 0

KangaskhanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, BITE
	db 23, STOMP
	db 27, HEADBUTT
	db 30, MIMIC
	db 36, REST
	db 39, DOUBLE_EDGE
	db 41, FOCUS_ENERGY
	db 44, DIZZY_PUNCH
	db 52, HYPER_BEAM
	db 56, SUBMISSION
	db 0

NidoranMEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 14, POISON_STING
	db 18, FOCUS_ENERGY
	db 21, SLAM ; FILTHY SLAM
	db 26, GLARE
	db 31, FURY_ATTACK
	db 37, COUNTER ;DRAIN PUNCH
	db 43, EARTHQUAKE
	db 46, HORN_DRILL
	db 54, POISON_GAS
	db 0

ClefairyEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
	db 0
; Learnset
	db 13, SING
	db 15, DOUBLESLAP
	db 17, METRONOME
	db 21, HEADBUTT
	db 25, LIGHT_SCREEN
	db 28, MIMIC
	db 33, LOVELY_KISS
	db 38, PETAL_DANCE
	db 45, SKY_ATTACK
	db 54, DREAM_EATER
	db 54, LOVELY_KISS
	db 59, MIST
	db 65, MINIMIZE
	db 0

SpearowEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, FEAROW
	db 0
; Learnset
	db 9, LEER
	db 13, FURY_SWIPES ; DUST CLAW
	db 18, WING_ATTACK
	db 22, SUBMISSION
	db 26, MIRROR_MOVE
	db 30, FURY_ATTACK
	db 33, AGILITY
	db 37, DRILL_PECK
	db 45, SONICBOOM
	db 50, SPIKE_CANNON
	db 0

VoltorbEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 27, ELECTRODE
	db 0
; Learnset
	db 15, SONICBOOM
	db 18, BARRAGE
	db 22, EXPLOSION
	db 24, THUNDER_WAVE
	db 28, SCREECH
	db 31, THUNDERBOLT
	db 35, SELFDESTRUCT
	db 39, REFLECT
	db 42, SWIFT
	db 48, EGG_BOMB
	db 0

NidokingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 14, POISON_STING
	db 18, FOCUS_ENERGY
	db 23, THRASH
	db 25, SLAM ; FILTHY SLAM
	db 27, GLARE
	db 31, FURY_ATTACK
	db 37, COUNTER ;DRAIN PUNCH
	db 43, EARTHQUAKE
	db 46, HORN_DRILL
	db 57, POISON_GAS
	db 0

SlowbroEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, CONFUSION
	db 17, DISABLE
	db 20, HEADBUTT
	db 24, BUBBLEBEAM
	db 28, PSYBEAM
	db 32, WITHDRAW
	db 36, SLAM ; FILTHY SLAM
	db 41, AMNESIA
	db 45, PSYCHIC_M
	db 0

IvysaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 13, VINE_WHIP
	db 16, POISONPOWDER
	db 19, STUN_SPORE
	db 24, CONSTRICT ; STATIC SNAG
	db 29, RAZOR_LEAF
	db 35, SLEEP_POWDER
	db 38, GROWTH
	db 46, SOLARBEAM
	db 0

ExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, LEECH_SEED
	db 18, MEGA_DRAIN
	db 20, STUN_SPORE
	db 23, REFLECT
	db 27, PSYBEAM
	db 32, BARRAGE
	db 36, SLEEP_POWDER
	db 48, SOLARBEAM
	db 53, EGG_BOMB
	db 0

LickitungEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, DISABLE
	db 13, WRAP
	db 17, STOMP
	db 20, DEFENSE_CURL
	db 23, HEADBUTT
	db 28, DIZZY_PUNCH
	db 31, SLAM ; FILTHY SLAM
	db 37, MEDITATE
	db 42, MEGA_PUNCH
	db 50, HYPER_BEAM
	db 0

ExeggcuteEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
; Learnset
	db 14, LEECH_SEED
	db 18, MEGA_DRAIN
	db 20, STUN_SPORE
	db 23, REFLECT
	db 27, PSYBEAM
	db 32, BARRAGE
	db 34, SOFTBOILED
	db 36, SLEEP_POWDER
	db 48, SOLARBEAM
	db 53, EGG_BOMB
	db 0

GrimerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, MUK
	db 0
; Learnset
	db 14, ACID
	db 23, MINIMIZE
	db 26, SLAM ; FILTHY SLAM
	db 29, BODY_SLAM
	db 33, ACID_ARMOR
	db 37, SLUDGE
	db 41, COUNTER ; DRAIN PUNCH
	db 46, POISON_GAS
	db 50, EXPLOSION
	db 55, RECOVER
	db 0

GengarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 21, HYPNOSIS
	db 24, MEGA_DRAIN
	db 29, BARRAGE
	db 33, DREAM_EATER
	db 41, SLAM ; FILTHY SLAM
	db 46, ICE_PUNCH
	db 57, LOVELY_KISS
	db 0

NidoranFEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 14, FURY_SWIPES ; DUST CLAW
	db 18, BITE
	db 21, SLAM ; FILTHY SLAM
	db 25, ACID_ARMOR
	db 31, SLASH
	db 37, DIZZY_PUNCH
	db 43, EARTHQUAKE
	db 54, SUBMISSION
	db 0

NidoqueenEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, FURY_SWIPES ; DUST CLAW
	db 14, POISON_STING
	db 18, BITE
	db 23, BODY_SLAM
	db 25, SLAM ; FILTHY SLAM
	db 27, ACID_ARMOR
	db 31, SLASH
	db 37, DIZZY_PUNCH
	db 43, EARTHQUAKE
	db 49, DRILL_PECK
	db 54, SUBMISSION
	db 0

CuboneEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0
; Learnset
	db 14, FOCUS_ENERGY
	db 18, SCREECH
	db 22, LIGHT_SCREEN
	db 25, COMET_PUNCH
	db 27, HEADBUTT
	db 30, DIG
	db 33, BARRAGE
	db 36, COUNTER ; DRAIN PUNCH
	db 40, BONEMERANG
	db 45, SKULL_BASH
	db 50, GLARE
	db 56, SUBMISSION
	db 0

RhyhornEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, RHYDON
	db 0
; Learnset
	db 12, BITE
	db 15, LOW_KICK
	db 19, HORN_ATTACK
	db 23, HEADBUTT
	db 27, FURY_ATTACK
	db 36, SLAM ; FILTHY SLAM
	db 39, EARTHQUAKE
	db 42, SKULL_BASH
	db 47, DEFENSE_CURL
	db 52, MEGA_KICK
	db 56, HYPER_BEAM
	db 0

LaprasEvosMoves:
; Evolutions
	db 0
; Learnset
	db 30, BODY_SLAM
	db 33, CONFUSE_RAY
	db 36, MIST
	db 38, ICE_BEAM
	db 46, HYDRO_PUMP
	db 53, BLIZZARD
	db 0

ArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, QUICK_ATTACK
	db 10, LICK
	db 15, EMBER
	db 19, KINESIS ; FIREWALL
	db 23, HYPER_FANG
	db 28, TAKE_DOWN ; HEAT_RUSH
	db 31, AGILITY
	db 36, FLAMETHROWER
	db 45, SKULL_BASH
	db 52, BONEMERANG
	db 0

MewEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, TRANSFORM
	db 55, MEGA_PUNCH
	db 59, METRONOME
	db 63, SUBSTITUTE
	db 0

GyaradosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, BITE
	db 25, DRAGON_RAGE
	db 32, BODY_SLAM
	db 41, HYDRO_PUMP
	db 52, HYPER_BEAM
	db 0

ShellderEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
	db 0
; Learnset
	db 18, CLAMP
	db 23, WITHDRAW
	db 28, AURORA_BEAM
	db 32, WATERFALL
	db 36, VICEGRIP
	db 45, ICE_BEAM
	db 52, AMNESIA
	db 56, SPIKE_CANNON
	db 0

TentacoolEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0
; Learnset
	db 7, POISON_STING
	db 13, WATER_GUN
	db 15, SUPERSONIC
	db 18, CONSTRICT ; STATIC SNAG
	db 21, WRAP
	db 23, CONFUSE_RAY
	db 26, MEGA_DRAIN
	db 32, SLUDGE
	db 36, BARRIER
	db 43, PSYBEAM
	db 48, HYDRO_PUMP
	db 0

GastlyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0
; Learnset
	db 21, HYPNOSIS
	db 24, MEGA_DRAIN
	db 29, BARRAGE
	db 33, DREAM_EATER
	db 41, SLAM ; FILTHY SLAM
	db 57, LOVELY_KISS
	db 0

ScytherEvosMoves:
; Evolutions
	db 0
; Learnset
	db 17, WING_ATTACK
	db 19, FOCUS_ENERGY
	db 23, PIN_MISSILE
	db 25, DOUBLE_TEAM
	db 27, FURY_ATTACK
	db 32, SWORDS_DANCE
	db 38, TWINEEDLE
	db 41, SLASH
	db 48, HI_JUMP_KICK
	db 0

StaryuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, STARMIE
	db 0
; Learnset
	db 14, HARDEN
	db 18, DISABLE
	db 21, BUBBLEBEAM
	db 27, MEGA_DRAIN
	db 31, RECOVER
	db 34, SWIFT
	db 39, ACID_ARMOR
	db 43, PSYCHIC_M
	db 48, HYDRO_PUMP
	db 0

BlastoiseEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, BUBBLE
	db 11, LIGHT_SCREEN
	db 14, WATER_GUN
	db 19, BITE
	db 24, GLARE
	db 30, WITHDRAW
	db 34, COUNTER ; DRAIN PUNCH
	db 39, SKULL_BASH
	db 45, HYDRO_PUMP
	db 0

PinsirEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, SEISMIC_TOSS
	db 21, KARATE_CHOP
	db 24, VICEGRIP
	db 27, FOCUS_ENERGY
	db 30, GUILLOTINE
	db 33, SPIKE_CANNON
	db 38, EARTHQUAKE
	db 45, TWINEEDLE
	db 49, SUBMISSION
	db 54, SWORDS_DANCE
	db 0

TangelaEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, POISONPOWDER
	db 18, CONSTRICT ; STATIC_SNAG
	db 23, STUN_SPORE
	db 26, MEGA_DRAIN
	db 30, AMNESIA
	db 34, RAZOR_LEAF
	db 44, SPORE
	db 49, DREAM_EATER
	db 54, SELFDESTRUCT
	db 0

NothingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

GrowlitheEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
	db 0
; Learnset
	db 7, QUICK_ATTACK
	db 10, LICK
	db 15, EMBER
	db 19, KINESIS ; FIREWALL
	db 23, HYPER_FANG
	db 28, TAKE_DOWN ; HEAT RUSH
	db 31, AGILITY
	db 36, FLAMETHROWER
	db 45, SKULL_BASH
	db 52, BONEMERANG
	db 0

OnixEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, BIND
	db 17, ROAR
	db 22, LIGHT_SCREEN
	db 25, RAGE
	db 29, CLAMP
	db 31, MIRROR_MOVE
	db 33, AMNESIA
	db 39, TAKE_DOWN ; HEAT RUSH
	db 45, WITHDRAW
	db 52, SELFDESTRUCT
	db 0

FearowEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, FURY_SWIPES ; DUST CLAW
	db 18, WING_ATTACK
	db 22, SUBMISSION
	db 26, MIRROR_MOVE
	db 30, FURY_ATTACK
	db 33, AGILITY
	db 37, DRILL_PECK
	db 45, SONICBOOM
	db 50, SPIKE_CANNON
	db 0

PidgeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0
; Learnset
	db 5, GUST
	db 6, SAND_ATTACK
	db 12, QUICK_ATTACK
	db 19, WING_ATTACK
	db 26, RAZOR_WIND ; ROOST
	db 28, SHARPEN
	db 32, FURY_ATTACK
	db 35, GLARE
	db 41, TAKE_DOWN ; HEAT RUSH
	db 48, SKULL_BASH
	db 54, WHIRLWIND
	db 60, HYPER_BEAM
	db 0

SlowpokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, SLOWBRO
	db 0
; Learnset
	db 12, CONFUSION
	db 17, DISABLE
	db 20, HEADBUTT
	db 24, BUBBLEBEAM
	db 29, PSYBEAM
	db 32, WITHDRAW
	db 36, SLAM ; FILTHY SLAM
	db 41, AMNESIA
	db 45, PSYCHIC_M
	db 0

KadabraEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, ALAKAZAM
	db EVOLVE_LEVEL, 37, ALAKAZAM
	db 0
; Learnset
	db 16, CONFUSION
	db 20, DISABLE
	db 27, PSYBEAM
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 42, REFLECT
	db 54, MEDITATE
	db 0

GravelerEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, GOLEM
	db EVOLVE_LEVEL, 37, GOLEM
	db 0
; Learnset
	db 11, HARDEN
	db 13, FURY_SWIPES ; DUST CLAW
	db 16, ROCK_THROW
	db 19, DEFENSE_CURL
	db 21, SELFDESTRUCT
	db 28, ROCK_SLIDE
	db 31, BARRAGE
	db 34, GLARE
	db 39, EARTHQUAKE
	db 46, EXPLOSION
	db 52, MEGA_KICK
	db 60, FISSURE
	db 65, MIRROR_MOVE
	db 0

ChanseyEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, SEISMIC_TOSS
	db 23, SING
	db 28, MINIMIZE
	db 34, BARRAGE
	db 41, SOFTBOILED
	db 47, EGG_BOMB
	db 54, DOUBLE_EDGE
	db 0

MachokeEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, MACHAMP
	db EVOLVE_LEVEL, 37, MACHAMP
	db 0
; Learnset
	db 15, LOW_KICK
	db 18, SEISMIC_TOSS
	db 20, DEFENSE_CURL
	db 23, JUMP_KICK
	db 26, FOCUS_ENERGY
	db 30, BIND
	db 35, SUBMISSION
	db 41, ROCK_SLIDE
	db 44, COMET_PUNCH
	db 47, MEGA_PUNCH
	db 52, SKULL_BASH
	db 56, COUNTER ; DRAIN PUNCH
	db 0

MrMimeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 17, DOUBLESLAP
	db 19, LIGHT_SCREEN
	db 23, PSYBEAM
	db 25, TELEPORT
	db 28, MIRROR_MOVE
	db 31, SEISMIC_TOSS
	db 35, MEDITATE
	db 39, PSYCHIC_M
	db 44, SONICBOOM
	db 48, SUBSTITUTE
	db 53, MIMIC
	db 0

HitmonleeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, JUMP_KICK
	db 24, STOMP
	db 27, ROLLING_KICK
	db 31, FOCUS_ENERGY
	db 36, SUBMISSION
	db 41, MIRROR_MOVE
	db 46, COUNTER ; DRAIN PUNCH
	db 53, HI_JUMP_KICK
	db 0

HitmonchanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, DOUBLE_TEAM
	db 22, COMET_PUNCH
	db 24, FIRE_PUNCH
	db 25, ICE_PUNCH
	db 26, THUNDERPUNCH
	db 32, DIZZY_PUNCH
	db 37, COUNTER ; DRAIN PUNCH
	db 43, MIRROR_MOVE
	db 49, MEGA_PUNCH
	db 0

ArbokEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BITE
	db 13, SMOG
	db 17, GLARE
	db 19, CONSTRICT ; STATIC SNAG
	db 22, MEGA_DRAIN
	db 26, SLAM ; FILTHY SLAM
	db 30, WITHDRAW
	db 33, ACID
	db 36, LEECH_LIFE
	db 38, ACID_ARMOR
	db 43, SUPER_FANG
	db 50, SKULL_BASH
	db 54, HAZE
	db 0

ParasectEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, STUN_SPORE
	db 15, MEGA_DRAIN
	db 18, CONSTRICT ; STATIC SNAG
	db 21, LEECH_LIFE
	db 25, BARRAGE
	db 28, SPORE
	db 33, GROWTH
	db 39, SOLARBEAM
	db 44, EARTHQUAKE
	db 49, TWINEEDLE
	db 0

PsyduckEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, GOLDUCK
	db 0
; Learnset
	db 10, PSYWAVE
	db 13, WATER_GUN
	db 17, CONFUSION
	db 20, DISABLE
	db 23, LOW_KICK
	db 27, REFLECT
	db 32, WATERFALL
	db 34, TELEPORT
	db 38, AMNESIA
	db 44, PSYCHIC_M
	db 50, SWIFT
	db 56, HYDRO_PUMP
	db 60, MEDITATE
	db 0

DrowzeeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, HYPNO
	db 0
; Learnset
	db 12, DISABLE
	db 17, CONFUSION
	db 24, HEADBUTT
	db 29, POISON_GAS
	db 33, NIGHT_SHADE
	db 37, PSYCHIC_M
	db 43, MEDITATE
	db 48, DREAM_EATER
	db 48, HYPNOSIS
	db 0

GolemEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, HARDEN
	db 13, FURY_SWIPES ; DUST CLAW
	db 16, ROCK_THROW
	db 19, DEFENSE_CURL
	db 21, SELFDESTRUCT
	db 28, ROCK_SLIDE
	db 31, BARRAGE
	db 34, GLARE
	db 39, EARTHQUAKE
	db 46, EXPLOSION
	db 52, MEGA_KICK
	db 60, FISSURE
	db 65, MIRROR_MOVE
	db 0

MagmarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, SMOG
	db 17, SMOKESCREEN
	db 20, ROLLING_KICK
	db 22, CONFUSE_RAY
	db 24, TELEPORT
	db 27, FIRE_PUNCH
	db 30, BARRAGE
	db 37, EGG_BOMB
	db 43, EARTHQUAKE
	db 49, POISON_GAS
	db 54, FIRE_BLAST
	db 0

ElectabuzzEvosMoves:
; Evolutions
	db 0
; Learnset
	db 26, COMET_PUNCH
	db 28, LIGHT_SCREEN
	db 30, THUNDERPUNCH
	db 33, COUNTER ; DRAIN PUNCH
	db 37, TAKE_DOWN ; HEAT RUSH
	db 42, MEGA_PUNCH
	db 47, THUNDER
	db 54, HYPER_BEAM
	db 0

MagnetonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, THUNDERSHOCK
	db 16, SONICBOOM
	db 19, TELEPORT
	db 22, THUNDER_WAVE
	db 26, PSYBEAM
	db 31, TRI_ATTACK
	db 34, THUNDERBOLT
	db 38, CLAMP
	db 43, CONVERSION
	db 47, THUNDER
	db 52, SELFDESTRUCT
	db 0

KoffingEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 27, WEEZING
	db 0
; Learnset
	db 13, BARRAGE
	db 17, ROAR
	db 21, SMOKESCREEN
	db 24, ACID
	db 26, HEADBUTT
	db 30, SLUDGE
	db 33, HAZE
	db 36, SELFDESTRUCT
	db 42, GROWTH
	db 46, POISON_GAS
	db 50, EGG_BOMB
	db 55, EXPLOSION
	db 0

MankeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 27, PRIMEAPE
	db 0
; Learnset
	db 9, LOW_KICK
	db 12, FURY_SWIPES ; DUST CLAW
	db 15, GLARE
	db 18, FOCUS_ENERGY
	db 20, DEFENSE_CURL
	db 23, SEISMIC_TOSS
	db 25, RAGE
	db 28, THRASH
	db 35, VICEGRIP
	db 39, COMET_PUNCH
	db 45, COUNTER ; DRAIN PUNCH
	db 51, EXPLOSION
	db 54, SONICBOOM
	db 0

SeelEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 27, DEWGONG
	db 0
; Learnset
	db 16, HEADBUTT
	db 21, AURORA_BEAM
	db 24, BUBBLEBEAM
	db 26, CONSTRICT ;STATIC SNAG
	db 30, REST
	db 32, BODY_SLAM
	db 35, ICE_BEAM
	db 39, SKULL_BASH
	db 41, MIST
	db 43, AMNESIA
	db 50, BLIZZARD
	db 55, SWIFT
	db 59, WITHDRAW
	db 0

DiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0
; Learnset
	db 13, GROWL
	db 15, FURY_SWIPES ; DUST CLAW
	db 19, DIG
	db 24, SAND_ATTACK
	db 30, SLAM ; FILTHY SLAM
	db 35, SLASH
	db 39, EARTHQUAKE
	db 43, FURY_ATTACK
	db 49, DISABLE
	db 54, FISSURE
	db 59, SUBMISSION
	db 0

TaurosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, STOMP
	db 24, RAGE
	db 29, FURY_ATTACK
	db 33, BODY_SLAM
	db 37, GLARE
	db 42, SKULL_BASH
	db 48, MEGA_KICK
	db 53, HYPER_BEAM
	db 0

FarfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, WING_ATTACK
	db 17, FURY_ATTACK
	db 19, KARATE_CHOP
	db 22, SWORDS_DANCE
	db 24, SWIFT
	db 27, SLASH
	db 31, RAZOR_LEAF
	db 35, SONICBOOM
	db 40, POISON_GAS
	db 45, WHIRLWIND
	db 0

VenonatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 23, VENOMOTH
	db 0
; Learnset
	db 7, ABSORB
	db 10, POISONPOWDER
	db 13, PIN_MISSILE
	db 15, STUN_SPORE
	db 16, SLEEP_POWDER
	db 18, LEECH_LIFE
	db 22, PSYBEAM
	db 30, MIRROR_MOVE
	db 33, SLUDGE
	db 37, DREAM_EATER
	db 37, SLEEP_POWDER
	db 42, TAKE_DOWN ; HEAT RUSH
	db 0

DragoniteEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, THUNDER_WAVE
	db 25, AGILITY
	db 29, BODY_SLAM
	db 33, MIST
	db 38, DRAGON_RAGE
	db 46, WHIRLWIND
	db 47, SHARPEN
	db 52, HYPER_BEAM
	db 0

DoduoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, DODRIO
	db 0
; Learnset
	db 10, FURY_SWIPES ; DUST CLAW
	db 14, DOUBLE_TEAM
	db 17, STOMP
	db 20, FURY_ATTACK
	db 23, RAGE
	db 26, ROLLING_KICK
	db 30, DRILL_PECK
	db 35, TRI_ATTACK
	db 41, EARTHQUAKE
	db 49, TWINEEDLE
	db 0

PoliwagEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 23, POLIWHIRL
	db 0
; Learnset
	db 12, WATER_GUN
	db 15, HYPNOSIS
	db 19, CONFUSION
	db 22, BUBBLEBEAM
	db 27, BODY_SLAM
	db 30, WATERFALL
	db 36, DIZZY_PUNCH
	db 41, AMNESIA
	db 45, HYDRO_PUMP
	db 52, COUNTER ; DRAIN PUNCH
	db 0

JynxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 21, AURORA_BEAM
	db 23, CONFUSION
	db 27, BODY_SLAM
	db 30, ICE_PUNCH
	db 34, PSYBEAM
	db 39, AMNESIA
	db 42, DREAM_EATER
	db 42, LOVELY_KISS
	db 47, BLIZZARD
	db 54, EGG_BOMB
	db 63, MIST
	db 0

MoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, FIRE_BLAST
	db 55, AGILITY
	db 60, DRAGON_RAGE
	db 0

ArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, BLIZZARD
	db 55, AGILITY
	db 60, WHIRLWIND
	db 0

ZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, THUNDER
	db 55, AGILITY
	db 60, SPIKE_CANNON
	db 0

DittoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, PERSIAN
	db 0
; Learnset
	db 8, LICK
	db 10, FURY_SWIPES ; DUST CLAW
	db 12, BITE
	db 15, DOUBLE_KICK
	db 17, SCREECH
	db 21, HEADBUTT
	db 25, FURY_ATTACK
	db 33, MIRROR_MOVE
	db 45, SKULL_BASH
	db 53, SLASH
	db 0

KrabbyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 29, KINGLER
	db 0
; Learnset
	db 14, FURY_SWIPES ; DUST CLAW
	db 17, KARATE_CHOP
	db 19, VICEGRIP
	db 22, GUILLOTINE
	db 26, AGILITY
	db 30, SLASH
	db 35, SLAM ; FILTHY SLAM
	db 39, FURY_ATTACK
	db 44, EARTHQUAKE
	db 50, SPIKE_CANNON
	db 0

VulpixEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
	db 0
; Learnset
	db 9, LICK
	db 12, DISABLE
	db 16, QUICK_ATTACK
	db 21, NIGHT_SHADE
	db 23, CONFUSE_RAY
	db 28, BARRAGE
	db 35, FLAMETHROWER
	db 44, AMNESIA
	db 50, PSYCHIC_M
	db 56, SONICBOOM
	db 60, FIRE_SPIN
	db 0

NinetalesEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LICK
	db 12, DISABLE
	db 16, QUICK_ATTACK
	db 21, NIGHT_SHADE
	db 23, CONFUSE_RAY
	db 28, BARRAGE
	db 35, FLAMETHROWER
	db 44, AMNESIA
	db 50, PSYCHIC_M
	db 56, SONICBOOM
	db 60, FIRE_SPIN
	db 0

PikachuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
	db 0
; Learnset
	db 9, THUNDER_WAVE
	db 12, QUICK_ATTACK
	db 16, FURY_SWIPES ; DUST CLAW
	db 22, LIGHT_SCREEN
	db 26, THUNDERBOLT
	db 36, WITHDRAW
	db 45, THUNDER
	db 52, SWIFT
	db 0

RaichuEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, QUICK_ATTACK
	db 16, FURY_SWIPES ; DUST CLAW
	db 22, LIGHT_SCREEN
	db 26, THUNDERBOLT
	db 36, WITHDRAW
	db 45, THUNDER
	db 52, SWIFT
	db 0

DratiniEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0
; Learnset
	db 20, THUNDER_WAVE
	db 25, AGILITY
	db 29, BODY_SLAM
	db 33, MIST
	db 38, DRAGON_RAGE
	db 47, HYPER_BEAM
	db 0

DragonairEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 46, DRAGONITE
WinterDragonairEvosMoves:
	db 0
; Learnset
	db 20, THUNDER_WAVE
	db 25, AGILITY
	db 29, BODY_SLAM
	db 33, MIST
	db 38, DRAGON_RAGE
	db 47, HYPER_BEAM
	db 0

KabutoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, KABUTOPS
	db 0
; Learnset
	db 24, LEECH_LIFE
	db 28, BIND
	db 35, FURY_ATTACK
	db 39, SKULL_BASH
	db 44, TWINEEDLE
	db 49, EARTHQUAKE
	db 53, SWORDS_DANCE
	db 0

KabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 24, LEECH_LIFE
	db 28, BIND
	db 33, SHARPEN
	db 35, FURY_ATTACK
	db 39, SKULL_BASH
	db 44, TWINEEDLE
	db 49, EARTHQUAKE
	db 53, SWORDS_DANCE
	db 0

HorseaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 27, SEADRA
	db 0
; Learnset
	db 14, WATER_GUN
	db 17, SMOKESCREEN
	db 21, BUBBLEBEAM
	db 24, MEGA_DRAIN
	db 26, LOVELY_KISS
	db 31, PIN_MISSILE
	db 35, WATERFALL
	db 39, DOUBLE_TEAM
	db 44, DRAGON_RAGE
	db 49, HYDRO_PUMP
	db 0

SeadraEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, WATER_GUN
	db 17, SMOKESCREEN
	db 21, BUBBLEBEAM
	db 24, MEGA_DRAIN
	db 26, LOVELY_KISS
	db 31, PIN_MISSILE
	db 35, WATERFALL
	db 39, DOUBLE_TEAM
	db 44, DRAGON_RAGE
	db 49, HYDRO_PUMP
	db 0

SandshrewEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 23, SANDSLASH
	db 0
; Learnset
	db 10, SAND_ATTACK
	db 12, POISON_STING
	db 14, SHARPEN
	db 17, PIN_MISSILE
	db 20, DIG
	db 24, SLASH
	db 29, FURY_ATTACK
	db 35, EARTHQUAKE
	db 43, SWORDS_DANCE
	db 48, TWINEEDLE
	db 0

SandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SAND_ATTACK
	db 12, POISON_STING
	db 14, SHARPEN
	db 17, PIN_MISSILE
	db 20, DIG
	db 23, SLASH
	db 29, FURY_ATTACK
	db 35, EARTHQUAKE
	db 43, SWORDS_DANCE
	db 48, TWINEEDLE
	db 0

OmanyteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, OMASTAR
	db 0
; Learnset
	db 24, MEGA_DRAIN
	db 28, WITHDRAW
	db 30, WATERFALL
	db 35, SPIKE_CANNON
	db 39, BODY_SLAM
	db 43, DEFENSE_CURL
	db 48, HYDRO_PUMP
	db 0

OmastarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 24, MEGA_DRAIN
	db 28, WITHDRAW
	db 30, WATERFALL
	db 35, SPIKE_CANNON
	db 39, BODY_SLAM
	db 43, DEFENSE_CURL
	db 48, HYDRO_PUMP
	db 0

JigglypuffEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
	db 0
; Learnset
	db 9, DISABLE
	db 13, DEFENSE_CURL
	db 16, DOUBLESLAP
	db 24, BODY_SLAM
	db 32, RECOVER
	db 37, DIZZY_PUNCH
	db 42, DOUBLE_EDGE
	db 50, EXPLOSION
	db 60, MINIMIZE
	db 0

WigglytuffEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, DISABLE
	db 13, DEFENSE_CURL
	db 16, DOUBLESLAP
	db 24, BODY_SLAM
	db 32, RECOVER
	db 37, DIZZY_PUNCH
	db 42, DOUBLE_EDGE
	db 50, EXPLOSION
	db 60, MINIMIZE
	db 0

EeveeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
	db EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
	db 0
; Learnset
	db 6, SHARPEN
	db 10, QUICK_ATTACK
	db 14, ROAR
	db 18, STOMP
	db 25, HEADBUTT
	db 30, TRI_ATTACK
	db 0

FlareonEvosMoves: ; Automatically tries to learn EMBER on evolution
; Evolutions
	db 0
; Learnset
	db 6, SHARPEN
	db 10, QUICK_ATTACK
	db 14, ROAR
	db 18, STOMP
	db 21, KINESIS ; FIREWALL
	db 25, RAGE
	db 28, AGILITY
	db 32, FLAMETHROWER
	db 38, GLARE
	db 44, SKULL_BASH
	db 49, MEGA_KICK
	db 0

JolteonEvosMoves: ; Automatically tries to learn THUNDERSHOCK on evolution
; Evolutions
	db 0
; Learnset
	db 6, SHARPEN
	db 10, QUICK_ATTACK
	db 14, ROAR
	db 18, STOMP
	db 21, THUNDER_WAVE
	db 25, DOUBLE_TEAM
	db 28, THUNDERBOLT
	db 32, BARRIER
	db 38, PIN_MISSILE
	db 44, TAKE_DOWN ; HEAT RUSH
	db 49, THUNDER
	db 0

VaporeonEvosMoves: ; Automatically tries to learn WATER_GUN on evolution
; Evolutions
	db 0
; Learnset
	db 6, SHARPEN
	db 10, QUICK_ATTACK
	db 14, ROAR
	db 18, STOMP
	db 21, BUBBLEBEAM
	db 25, ACID_ARMOR
	db 28, AURORA_BEAM
	db 32, WATERFALL
	db 35, GLARE
	db 44, SWIFT
	db 49, HYDRO_PUMP
	db 65, MIST
	db 65, HAZE
	db 0

MachopEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0
; Learnset
	db 15, LOW_KICK
	db 18, SEISMIC_TOSS
	db 20, DEFENSE_CURL
	db 23, JUMP_KICK
	db 26, FOCUS_ENERGY
	db 30, BIND
	db 35, SUBMISSION
	db 41, ROCK_SLIDE
	db 44, COMET_PUNCH
	db 47, MEGA_PUNCH
	db 52, SKULL_BASH
	db 56, COUNTER ; DRAIN PUNCH
	db 0

ZubatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0
; Learnset
	db 10, BITE
	db 15, WING_ATTACK
	db 18, SUPERSONIC
	db 21, LEECH_LIFE
	db 25, CONFUSE_RAY
	db 28, SWORDS_DANCE
	db 30, SLUDGE
	db 37, SKULL_BASH
	db 44, SUPER_FANG
	db 50, POISON_GAS
	db 55, HAZE
	db 59, SONICBOOM
	db 0

EkansEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, ARBOK
	db 0
; Learnset
	db 7, ABSORB
	db 10, BITE
	db 13, SMOG
	db 17, GLARE
	db 19, CONSTRICT ; STATIC SNAG
	db 23, MEGA_DRAIN
	db 26, SLAM ; FILTHY SLAM
	db 30, WITHDRAW
	db 33, ACID
	db 36, LEECH_LIFE
	db 38, ACID_ARMOR
	db 43, SUPER_FANG
	db 50, SKULL_BASH
	db 54, HAZE
	db 0

ParasEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 24, PARASECT
	db 0
; Learnset
	db 13, STUN_SPORE
	db 15, MEGA_DRAIN
	db 18, CONSTRICT ; STATIC SNAG
	db 21, LEECH_LIFE
	db 25, BARRAGE
	db 28, SPORE
	db 33, GROWTH
	db 39, SOLARBEAM
	db 44, EARTHQUAKE
	db 49, TWINEEDLE
	db 0

PoliwhirlEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
	db 0
; Learnset
	db 12, WATER_GUN
	db 15, HYPNOSIS
	db 19, CONFUSION
	db 22, BUBBLEBEAM
	db 27, BODY_SLAM
	db 30, WATERFALL
	db 36, DIZZY_PUNCH
	db 41, AMNESIA
	db 45, HYDRO_PUMP
	db 52, COUNTER ; DRAIN PUNCH
	db 0

PoliwrathEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, WATER_GUN
	db 15, HYPNOSIS
	db 19, CONFUSION
	db 22, BUBBLEBEAM
	db 27, BODY_SLAM
	db 30, WATERFALL
	db 36, DIZZY_PUNCH
	db 41, AMNESIA
	db 45, HYDRO_PUMP
	db 52, COUNTER ; DRAIN PUNCH
	db 0

WeedleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0
; Learnset
	db 0

KakunaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0
; Learnset
	db 7, HARDEN
	db 0

BeedrillEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, FOCUS_ENERGY
	db 14, LIGHT_SCREEN
	db 17, WING_ATTACK
	db 22, TWINEEDLE
	db 25, FURY_ATTACK
	db 30, PIN_MISSILE
	db 35, AGILITY
	db 40, DRILL_PECK
	db 47, SPIKE_CANNON
	db 54, HAZE
	db 0

DodrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, FURY_SWIPES ; DUST CLAW
	db 14, DOUBLE_TEAM
	db 17, STOMP
	db 20, FURY_ATTACK
	db 23, RAGE
	db 26, ROLLING_KICK
	db 30, DRILL_PECK
	db 35, TRI_ATTACK
	db 41, EARTHQUAKE
	db 49, TWINEEDLE
	db 0

PrimeapeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LOW_KICK
	db 12, FURY_SWIPES ; DUST CLAW
	db 15, GLARE
	db 18, FOCUS_ENERGY
	db 20, DEFENSE_CURL
	db 23, SEISMIC_TOSS
	db 25, RAGE
	db 27, THRASH
	db 35, VICEGRIP
	db 39, COMET_PUNCH
	db 45, COUNTER ; DRAIN PUNCH
	db 51, EXPLOSION
	db 54, SONICBOOM
	db 0

DugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, GROWL
	db 15, FURY_SWIPES ; DUST CLAW
	db 19, DIG
	db 24, SAND_ATTACK
	db 30, SLAM ; FILTHY SLAM
	db 35, SLASH
	db 39, EARTHQUAKE
	db 43, FURY_ATTACK
	db 49, DISABLE
	db 54, FISSURE
	db 59, SUBMISSION
	db 0

VenomothEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, ABSORB
	db 10, POISONPOWDER
	db 13, PIN_MISSILE
	db 15, STUN_SPORE
	db 16, SLEEP_POWDER
	db 18, LEECH_LIFE
	db 22, PSYBEAM
	db 27, WING_ATTACK
	db 30, MIRROR_MOVE
	db 33, SLUDGE
	db 37, DREAM_EATER
	db 37, SLEEP_POWDER
	db 42, TAKE_DOWN ; HEAT RUSH
	db 53, SKY_ATTACK
	db 0

DewgongEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, HEADBUTT
	db 21, AURORA_BEAM
	db 24, BUBBLEBEAM
	db 26, CONSTRICT ;STATIC SNAG
	db 30, REST
	db 32, BODY_SLAM
	db 35, ICE_BEAM
	db 39, SKULL_BASH
	db 41, MIST
	db 43, AMNESIA
	db 50, BLIZZARD
	db 55, SWIFT
	db 59, WITHDRAW
	db 0

CaterpieEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, METAPOD
	db 0
; Learnset
	db 0

MetapodEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0
; Learnset
	db 7, HARDEN
	db 0

ButterfreeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, PSYWAVE
	db 12, LEECH_LIFE
	db 15, POISONPOWDER
	db 16, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, CONFUSION
	db 24, CONFUSE_RAY
	db 27, PSYBEAM
	db 33, WHIRLWIND
	db 35, PSYCHIC_M
	db 45, DREAM_EATER
	db 45, SLEEP_POWDER
	db 50, MIST
	db 0

MachampEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, LOW_KICK
	db 18, SEISMIC_TOSS
	db 20, DEFENSE_CURL
	db 23, JUMP_KICK
	db 26, FOCUS_ENERGY
	db 30, BIND
	db 35, SUBMISSION
	db 41, ROCK_SLIDE
	db 44, COMET_PUNCH
	db 47, MEGA_PUNCH
	db 52, SKULL_BASH
	db 56, COUNTER ; DRAIN PUNCH
	db 0

GolduckEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, PSYWAVE
	db 13, WATER_GUN
	db 17, CONFUSION
	db 20, DISABLE
	db 23, LOW_KICK
	db 27, REFLECT
	db 32, WATERFALL
	db 34, TELEPORT
	db 38, AMNESIA
	db 44, PSYCHIC_M
	db 50, SWIFT
	db 56, HYDRO_PUMP
	db 60, MEDITATE
	db 0

HypnoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, DISABLE
	db 17, CONFUSION
	db 24, HEADBUTT
	db 29, POISON_GAS
	db 33, NIGHT_SHADE
	db 37, PSYCHIC_M
	db 43, MEDITATE
	db 48, DREAM_EATER
	db 48, HYPNOSIS
	db 0

GolbatEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BITE
	db 15, WING_ATTACK
	db 18, SUPERSONIC
	db 21, LEECH_LIFE
	db 25, CONFUSE_RAY
	db 28, SWORDS_DANCE
	db 30, SLUDGE
	db 37, SKULL_BASH
	db 44, SUPER_FANG
	db 50, POISON_GAS
	db 55, HAZE
	db 59, SONICBOOM
	db 0

MewtwoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 66, PSYCHIC_M
	db 70, RECOVER
	db 72, BARRIER
	db 75, MIST
	db 81, AMNESIA
	db 0

SnorlaxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, BODY_SLAM
	db 41, POISON_GAS
	db 46, DOUBLE_EDGE
	db 51, HYPER_BEAM
	db 55, MEGA_KICK
	db 59, EXPLOSION
	db 0

MagikarpEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0
; Learnset
	db 0

MukEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, ACID
	db 23, MINIMIZE
	db 26, SLAM ; FILTHY SLAM
	db 29, BODY_SLAM
	db 33, ACID_ARMOR
	db 37, SLUDGE
	db 41, COUNTER ; DRAIN PUNCH
	db 46, POISON_GAS
	db 50, EXPLOSION
	db 55, RECOVER
	db 0

KinglerEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, FURY_SWIPES ; DUST CLAW
	db 17, VICEGRIP
	db 19, KARATE_CHOP
	db 22, GUILLOTINE
	db 26, AGILITY
	db 30, SLASH
	db 35, SLAM ; FILTHY SLAM
	db 39, FURY_ATTACK
	db 44, EARTHQUAKE
	db 51, SPIKE_CANNON
	db 0

CloysterEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, CLAMP
	db 23, WITHDRAW
	db 28, AURORA_BEAM
	db 32, WATERFALL
	db 36, VICEGRIP
	db 45, ICE_BEAM
	db 52, AMNESIA
	db 56, SPIKE_CANNON
	db 0

ElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, SONICBOOM
	db 18, BARRAGE
	db 22, EXPLOSION
	db 24, THUNDER_WAVE
	db 28, SCREECH
	db 31, THUNDERBOLT
	db 35, SELFDESTRUCT
	db 39, REFLECT
	db 42, SWIFT
	db 48, EGG_BOMB
	db 0

ClefableEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, SING
	db 15, DOUBLESLAP
	db 17, METRONOME
	db 21, HEADBUTT
	db 25, LIGHT_SCREEN
	db 28, MIMIC
	db 33, LOVELY_KISS
	db 38, PETAL_DANCE
	db 45, SKY_ATTACK
	db 54, DREAM_EATER
	db 54, LOVELY_KISS
	db 59, MIST
	db 65, MINIMIZE
	db 0

WeezingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, BARRAGE
	db 17, ROAR
	db 21, SMOKESCREEN
	db 24, ACID
	db 26, HEADBUTT
	db 30, SLUDGE
	db 33, HAZE
	db 36, SELFDESTRUCT
	db 42, GROWTH
	db 46, POISON_GAS
	db 50, EGG_BOMB
	db 55, EXPLOSION
	db 0

PersianEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, LICK
	db 10, FURY_SWIPES ; DUST CLAW
	db 12, BITE
	db 15, DOUBLE_KICK
	db 17, SCREECH
	db 21, HEADBUTT
	db 25, FURY_ATTACK
	db 33, MIRROR_MOVE
	db 45, SKULL_BASH
	db 53, SLASH
	db 0

MarowakEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, FOCUS_ENERGY
	db 18, SCREECH
	db 22, LIGHT_SCREEN
	db 25, COMET_PUNCH
	db 27, HEADBUTT
	db 30, DIG
	db 33, BARRAGE
	db 36, COUNTER ; DRAIN PUNCH
	db 40, BONEMERANG
	db 45, SKULL_BASH
	db 50, GLARE
	db 56, SUBMISSION
	db 0

HaunterEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, GENGAR
	db EVOLVE_LEVEL, 37, GENGAR
	db 0
; Learnset
	db 21, HYPNOSIS
	db 24, MEGA_DRAIN
	db 29, BARRAGE
	db 33, DREAM_EATER
	db 41, SLAM ; FILTHY SLAM
	db 46, ICE_PUNCH
	db 57, LOVELY_KISS
	db 0

AbraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, KADABRA
	db 0
; Learnset
	db 0

AlakazamEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, CONFUSION
	db 20, DISABLE
	db 27, PSYBEAM
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 42, REFLECT
	db 54, MEDITATE
	db 0

PidgeottoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0
; Learnset
	db 5, GUST
	db 6, SAND_ATTACK
	db 12, QUICK_ATTACK
	db 19, WING_ATTACK
	db 26, RAZOR_WIND ; ROOST
	db 29, SHARPEN
	db 32, FURY_ATTACK
	db 35, GLARE
	db 43, SLASH
	db 48, SKULL_BASH
	db 54, WHIRLWIND
	db 60, HYPER_BEAM
	db 0

PidgeotEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, GUST
	db 6, SAND_ATTACK
	db 12, QUICK_ATTACK
	db 19, WING_ATTACK
	db 26, RAZOR_WIND ; ROOST
	db 29, SHARPEN
	db 32, FURY_ATTACK
	db 35, GLARE
	db 43, SLASH
	db 48, SKULL_BASH
	db 54, WHIRLWIND
	db 60, HYPER_BEAM
	db 0

StarmieEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, HARDEN
	db 18, DISABLE
	db 21, BUBBLEBEAM
	db 27, MEGA_DRAIN
	db 31, RECOVER
	db 34, SWIFT
	db 39, ACID_ARMOR
	db 43, PSYCHIC_M
	db 48, HYDRO_PUMP
	db 0

BulbasaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 11, VINE_WHIP
	db 14, POISONPOWDER
	db 18, STUN_SPORE
	db 21, CONSTRICT ; STATIC SNAG
	db 25, RAZOR_LEAF
	db 33, SLEEP_POWDER
	db 38, GROWTH
	db 45, SOLARBEAM
	db 0

VenusaurEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEECH_SEED
	db 13, VINE_WHIP
	db 17, POISONPOWDER
	db 20, STUN_SPORE
	db 24, CONSTRICT ; STATIC SNAG
	db 30, RAZOR_LEAF
	db 36, SLEEP_POWDER
	db 40, GROWTH
	db 50, SOLARBEAM
	db 0

TentacruelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, POISON_STING
	db 12, SUPERSONIC
	db 15, WATER_GUN
	db 18, CONSTRICT ; STATIC SNAG
	db 21, WRAP
	db 23, CONFUSE_RAY
	db 26, MEGA_DRAIN
	db 32, SLUDGE
	db 36, BARRIER
	db 43, PSYBEAM
	db 48, HYDRO_PUMP
	db 0

GoldeenEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, SEAKING
	db 0
; Learnset
	db 15, HORN_ATTACK
	db 18, BUBBLEBEAM
	db 21, CONFUSE_RAY
	db 24, AGILITY
	db 27, FURY_ATTACK
	db 31, WATERFALL
	db 35, DOUBLE_EDGE
	db 38, SKULL_BASH
	db 43, WITHDRAW
	db 45, MIST
	db 52, TWINEEDLE
	db 57, HYPER_BEAM
	db 0

SeakingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, HORN_ATTACK
	db 18, BUBBLEBEAM
	db 21, CONFUSE_RAY
	db 24, AGILITY
	db 27, FURY_ATTACK
	db 31, WATERFALL
	db 35, DOUBLE_EDGE
	db 38, SKULL_BASH
	db 43, WITHDRAW
	db 45, MIST
	db 52, TWINEEDLE
	db 57, HYPER_BEAM
	db 0

PonytaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, RAPIDASH
	db 0
; Learnset
	db 9, TAIL_WHIP
	db 18, KINESIS ; FIREWALL
	db 21, STOMP
	db 25, FOCUS_ENERGY
	db 28, HEADBUTT
	db 33, TAKE_DOWN ; HEAT RUSH
	db 36, SWIFT
	db 40, FURY_ATTACK
	db 45, SKULL_BASH
	db 49, MEGA_KICK
	db 54, SOLARBEAM
	db 0

RapidashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, TAIL_WHIP
	db 18, KINESIS ; FIREWALL
	db 21, STOMP
	db 25, FOCUS_ENERGY
	db 28, HEADBUTT
	db 33, TAKE_DOWN ; HEAT RUSH
	db 36, SWIFT
	db 40, FURY_ATTACK
	db 45, SKULL_BASH
	db 49, MEGA_KICK
	db 54, SOLARBEAM
	db 0

RattataEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, RATICATE
	db 0
; Learnset
	db 7, QUICK_ATTACK
	db 12, SHARPEN
	db 14, BITE
	db 17, HYPER_FANG
	db 21, DOUBLE_KICK
	db 23, FOCUS_ENERGY
	db 26, RAGE
	db 31, SKULL_BASH
	db 34, SUPER_FANG
	db 40, MEGA_PUNCH
	db 0

RaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, SHARPEN
	db 14, BITE
	db 17, HYPER_FANG
	db 20, DOUBLE_KICK
	db 24, FOCUS_ENERGY
	db 27, RAGE
	db 31, SKULL_BASH
	db 37, SUPER_FANG
	db 44, MEGA_PUNCH
	db 0

NidorinoEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 14, POISON_STING
	db 18, FOCUS_ENERGY
	db 21, SLAM ; FILTHY SLAM
	db 26, GLARE
	db 31, FURY_ATTACK
	db 37, COUNTER ;DRAIN PUNCH
	db 43, EARTHQUAKE
	db 46, HORN_DRILL
	db 54, POISON_GAS
	db 0

NidorinaEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 14, FURY_SWIPES ; DUST CLAW
	db 18, BITE
	db 21, SLAM ; FILTHY SLAM
	db 25, ACID_ARMOR
	db 31, SLASH
	db 37, DIZZY_PUNCH
	db 43, EARTHQUAKE
	db 54, SUBMISSION
	db 0

GeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 24, GRAVELER
	db 0
; Learnset
	db 11, HARDEN
	db 13, FURY_SWIPES ; DUST CLAW
	db 16, ROCK_THROW
	db 19, DEFENSE_CURL
	db 21, SELFDESTRUCT
	db 28, ROCK_SLIDE
	db 31, BARRAGE
	db 34, GLARE
	db 39, EARTHQUAKE
	db 46, EXPLOSION
	db 52, MEGA_KICK
	db 60, FISSURE
	db 65, MIRROR_MOVE
	db 0

PorygonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 23, PSYBEAM
	db 25, TRI_ATTACK
	db 28, RECOVER
	db 35, CONVERSION
	db 42, PSYCHIC_M
	db 54, SELFDESTRUCT
	db 0

AerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 26, ROCK_THROW
	db 32, SWORDS_DANCE
	db 38, SKULL_BASH
	db 44, EARTHQUAKE
	db 49, WHIRLWIND
	db 0

MagnemiteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0
; Learnset
	db 13, THUNDERSHOCK
	db 16, SONICBOOM
	db 19, TELEPORT
	db 22, THUNDER_WAVE
	db 26, PSYBEAM
	db 31, TRI_ATTACK
	db 34, THUNDERBOLT
	db 38, CLAMP
	db 43, CONVERSION
	db 47, THUNDER
	db 52, SELFDESTRUCT
	db 0

CharmanderEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0
; Learnset
	db 7, LEER
	db 9, EMBER
	db 12, FURY_SWIPES ; DUST CLAW
	db 15, SMOKESCREEN
	db 18, KINESIS ; FIREWALL
	db 23, RAGE
	db 26, TAKE_DOWN ; HEAT RUSH
	db 30, SLASH
	db 38, FLAMETHROWER
	db 46, FIRE_SPIN
	db 0

SquirtleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0
; Learnset
	db 8, BUBBLE
	db 11, LIGHT_SCREEN
	db 14, WATER_GUN
	db 18, BITE
	db 23, GLARE
	db 28, WITHDRAW
	db 33, COUNTER ; DRAIN PUNCH
	db 35, SKULL_BASH
	db 42, HYDRO_PUMP
	db 0

CharmeleonEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0
; Learnset
	db 7, LEER
	db 9, EMBER
	db 13, FURY_SWIPES ; DUST CLAW
	db 15, SMOKESCREEN
	db 19, KINESIS ; FIREWALL
	db 24, RAGE
	db 28, TAKE_DOWN ; HEAT RUSH
	db 31, SLASH
	db 39, FLAMETHROWER
	db 46, FIRE_SPIN
	db 0

WartortleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0
; Learnset
	db 8, BUBBLE
	db 11, LIGHT_SCREEN
	db 14, WATER_GUN
	db 18, BITE
	db 23, GLARE
	db 28, WITHDRAW
	db 33, COUNTER ; DRAIN PUNCH
	db 35, SKULL_BASH
	db 42, HYDRO_PUMP
	db 0

CharizardEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEER
	db 9, EMBER
	db 13, FURY_SWIPES ; DUST CLAW
	db 15, SMOKESCREEN
	db 19, KINESIS ; FIREWALL
	db 24, RAGE
	db 28, TAKE_DOWN ; HEAT_RUSH
	db 31, SLASH
	db 41, FLAMETHROWER
	db 48, FIRE_SPIN
	db 0

OddishEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, GLOOM
	db 0
; Learnset
	db 13, POISONPOWDER
	db 15, MEGA_DRAIN
	db 17, STUN_SPORE
	db 19, SLEEP_POWDER
	db 23, NIGHT_SHADE
	db 28, SLUDGE
	db 36, PETAL_DANCE
	db 45, PSYCHIC_M
	db 50, GROWTH
	db 57, POISON_GAS
	db 0

GloomEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
	db 0
; Learnset
	db 13, POISONPOWDER
	db 15, MEGA_DRAIN
	db 17, STUN_SPORE
	db 19, SLEEP_POWDER
	db 23, NIGHT_SHADE
	db 28, SLUDGE
	db 36, PETAL_DANCE
	db 45, PSYCHIC_M
	db 50, GROWTH
	db 57, POISON_GAS
	db 0

VileplumeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, POISONPOWDER
	db 15, MEGA_DRAIN
	db 17, STUN_SPORE
	db 19, SLEEP_POWDER
	db 23, NIGHT_SHADE
	db 28, SLUDGE
	db 36, PETAL_DANCE
	db 45, PSYCHIC_M
	db 50, GROWTH
	db 57, POISON_GAS
	db 0

BellsproutEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0
; Learnset
	db 13, WRAP
	db 15, POISONPOWDER
	db 17, ACID
	db 19, STUN_SPORE
	db 22, SLEEP_POWDER
	db 29, SLAM ; FILTHY SLAM
	db 35, RAZOR_LEAF
	db 42, VICEGRIP
	db 48, EGG_BOMB
	db 54, SELFDESTRUCT
	db 58, GROWTH
	db 0

WeepinbellEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
	db 0
; Learnset
	db 13, WRAP
	db 15, POISONPOWDER
	db 17, ACID
	db 19, STUN_SPORE
	db 21, SLEEP_POWDER
	db 29, SLAM ; FILTHY SLAM
	db 35, RAZOR_LEAF
	db 42, VICEGRIP
	db 48, EGG_BOMB
	db 54, SELFDESTRUCT
	db 58, GROWTH
	db 0

VictreebelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, WRAP
	db 15, POISONPOWDER
	db 17, ACID
	db 19, STUN_SPORE
	db 21, SLEEP_POWDER
	db 29, SLAM ; FILTHY SLAM
	db 35, RAZOR_LEAF
	db 42, VICEGRIP
	db 48, EGG_BOMB
	db 54, SELFDESTRUCT
	db 58, GROWTH
	db 0

HardenedOnixEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, BIND
	db 17, ROAR
	db 19, SCREECH
	db 22, LIGHT_SCREEN
	db 25, RAGE
	db 27, ROCK_SLIDE
	db 29, CLAMP
	db 33, AMNESIA
	db 37, TAKE_DOWN ; HEAT RUSH
	db 39, EARTHQUAKE
	db 42, SPIKE_CANNON
	db 45, WITHDRAW
	db 52, SELFDESTRUCT
	db 0
