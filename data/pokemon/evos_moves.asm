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
	dw MissingNo1FEvosMoves
	dw MissingNo20EvosMoves
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
	dw MissingNo32EvosMoves
	dw MagmarEvosMoves
	dw MissingNo34EvosMoves
	dw ElectabuzzEvosMoves
	dw MagnetonEvosMoves
	dw KoffingEvosMoves
	dw MissingNo38EvosMoves
	dw MankeyEvosMoves
	dw SeelEvosMoves
	dw DiglettEvosMoves
	dw TaurosEvosMoves
	dw MissingNo3DEvosMoves
	dw MissingNo3EEvosMoves
	dw MissingNo3FEvosMoves
	dw FarfetchdEvosMoves
	dw VenonatEvosMoves
	dw DragoniteEvosMoves
	dw MissingNo43EvosMoves
	dw MissingNo44EvosMoves
	dw MissingNo45EvosMoves
	dw DoduoEvosMoves
	dw PoliwagEvosMoves
	dw JynxEvosMoves
	dw MoltresEvosMoves
	dw ArticunoEvosMoves
	dw ZapdosEvosMoves
	dw DittoEvosMoves
	dw MeowthEvosMoves
	dw KrabbyEvosMoves
	dw MissingNo4FEvosMoves
	dw MissingNo50EvosMoves
	dw MissingNo51EvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw MissingNo56EvosMoves
	dw MissingNo57EvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw MissingNo5EEvosMoves
	dw MissingNo5FEvosMoves
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
	dw MissingNo73EvosMoves
	dw DodrioEvosMoves
	dw PrimeapeEvosMoves
	dw DugtrioEvosMoves
	dw VenomothEvosMoves
	dw DewgongEvosMoves
	dw MissingNo79EvosMoves
	dw MissingNo7AEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw MachampEvosMoves
	dw MissingNo7FEvosMoves
	dw GolduckEvosMoves
	dw HypnoEvosMoves
	dw GolbatEvosMoves
	dw MewtwoEvosMoves
	dw SnorlaxEvosMoves
	dw MagikarpEvosMoves
	dw MissingNo86EvosMoves
	dw MissingNo87EvosMoves
	dw MukEvosMoves
	dw MissingNo8AEvosMoves
	dw KinglerEvosMoves
	dw CloysterEvosMoves
	dw MissingNo8CEvosMoves
	dw ElectrodeEvosMoves
	dw ClefableEvosMoves
	dw WeezingEvosMoves
	dw PersianEvosMoves
	dw MarowakEvosMoves
	dw MissingNo92EvosMoves
	dw HaunterEvosMoves
	dw AbraEvosMoves
	dw AlakazamEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw StarmieEvosMoves
	dw BulbasaurEvosMoves
	dw VenusaurEvosMoves
	dw TentacruelEvosMoves
	dw MissingNo9CEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw MissingNo9FEvosMoves
	dw MissingNoA0EvosMoves
	dw MissingNoA1EvosMoves
	dw MissingNoA2EvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw NidorinoEvosMoves
	dw NidorinaEvosMoves
	dw GeodudeEvosMoves
	dw PorygonEvosMoves
	dw AerodactylEvosMoves
	dw MissingNoACEvosMoves
	dw MagnemiteEvosMoves
	dw MissingNoAEEvosMoves
	dw MissingNoAFEvosMoves
	dw CharmanderEvosMoves
	dw SquirtleEvosMoves
	dw CharmeleonEvosMoves
	dw WartortleEvosMoves
	dw CharizardEvosMoves
	dw MissingNoB5EvosMoves
	dw FossilKabutopsEvosMoves
	dw FossilAerodactylEvosMoves
	dw MonGhostEvosMoves
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
	db 15, FURY_ATTACK
	db 20, STOMP
	db 30, TAIL_WHIP
	db 35, EARTHQUAKE
	db 40, ROCK_SLIDE
	db 48, TAKE_DOWN
	db 55, HORN_DRILL
	db 0

KangaskhanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, TAIL_WHIP
	db 26, BITE
	db 31, RAGE
	db 41, DIZZY_PUNCH
	db 46, DOUBLE_EDGE
	db 0

NidoranMEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0
; Learnset
	db 8, HORN_ATTACK
	db 14, POISON_STING
	db 16, DOUBLE_KICK
	db 23, FURY_ATTACK
	db 30, FOCUS_ENERGY
	db 41, HORN_DRILL
	db 0

ClefairyEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
	db 0
; Learnset
	db 13, SING
	db 18, DOUBLESLAP
	db 24, MINIMIZE
	db 31, METRONOME
	db 39, BODY_SLAM
	db 48, LIGHT_SCREEN
	db 0

SpearowEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, FEAROW
	db 0
; Learnset
	db 9, LEER
	db 15, FURY_ATTACK
	db 22, MIRROR_MOVE
	db 28, DRILL_PECK
	db 36, AGILITY
	db 0

VoltorbEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0
; Learnset
	db 9, THUNDERSHOCK
	db 17, SONICBOOM
	db 22, SELFDESTRUCT
	db 29, SWIFT
	db 40, THUNDER
	db 50, EXPLOSION
	db 0

NidokingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, EARTHQUAKE
	db 8, HORN_ATTACK
	db 14, POISON_STING
	db 23, THRASH
	db 0

SlowbroEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, DISABLE
	db 18, WATER_GUN
	db 22, HEADBUTT
	db 33, WITHDRAW
	db 37, AMNESIA
	db 44, PSYCHIC_M
	db 55, HYDRO_PUMP
	db 0

IvysaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 13, VINE_WHIP
	db 22, POISONPOWDER
	db 30, RAZOR_LEAF
	db 34, SLEEP_POWDER
	db 38, GROWTH
	db 54, SOLARBEAM
	db 0

ExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 28, STOMP
	db 32, REFLECT
	db 0

LickitungEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, STOMP
	db 10, WRAP
	db 18, DISABLE
	db 23, SLAM
	db 31, DEFENSE_CURL
	db 39, SCREECH
	db 0

ExeggcuteEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
; Learnset
	db 15, REFLECT
	db 28, LEECH_SEED
	db 32, STUN_SPORE
	db 37, SLEEP_POWDER
	db 42, PSYCHIC_M
	db 48, SOLARBEAM
	db 0

GrimerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 38, MUK
	db 0
; Learnset
	db 20, POISON_GAS
	db 33, MINIMIZE
	db 37, SLUDGE
	db 42, ACID_ARMOR
	db 45, SCREECH
	db 0

GengarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 29, HYPNOSIS
	db 36, DREAM_EATER
	db 48, SUBSTITUTE
	db 0

NidoranFEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0
; Learnset
	db 8, TAIL_WHIP
	db 14, POISON_STING
	db 18, DOUBLE_KICK
	db 23, FURY_SWIPES
	db 30, BITE
	db 41, HEADBUTT
	db 0

NidoqueenEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, EARTHQUAKE
	db 14, POISON_STING
	db 23, BODY_SLAM
	db 0

CuboneEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0
; Learnset
	db 15, LEER
	db 21, FOCUS_ENERGY
	db 28, HEADBUTT
	db 38, THRASH
	db 43, BONEMERANG
	db 50, RAGE
	db 0

RhyhornEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 42, RHYDON
	db 0
; Learnset
	db 15, FURY_ATTACK
	db 20, STOMP
	db 30, TAIL_WHIP
	db 35, EARTHQUAKE
	db 40, ROCK_SLIDE
	db 48, TAKE_DOWN
	db 55, HORN_DRILL
	db 0

LaprasEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, SING
	db 20, MIST
	db 25, BODY_SLAM
	db 31, CONFUSE_RAY
	db 38, ICE_BEAM
	db 46, HYDRO_PUMP
	db 0

ArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, BITE
	db 6, FLAMETHROWER
	db 7, LEER
	db 8, TAKE_DOWN
	db 0

MewEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TRANSFORM
	db 20, MEGA_PUNCH
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 50, LIGHT_SCREEN
	db 0

GyaradosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, BITE
	db 25, DRAGON_RAGE
	db 32, LEER
	db 41, HYDRO_PUMP
	db 49, THRASH
	db 55, HYPER_BEAM
	db 0

ShellderEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
	db 0
; Learnset
	db 18, SUPERSONIC
	db 23, CLAMP
	db 30, AURORA_BEAM
	db 39, LEER
	db 50, ICE_BEAM
	db 0

TentacoolEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0
; Learnset
	db 5, WRAP
	db 7, SUPERSONIC
	db 13, WATER_GUN
	db 22, ACID
	db 27, SCREECH
	db 35, BARRIER
	db 43, SLUDGE
	db 50, HYDRO_PUMP
	db 0

GastlyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0
; Learnset
	db 27, HYPNOSIS
	db 35, DREAM_EATER
	db 0

ScytherEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, LEER
	db 17, AGILITY
	db 20, DOUBLE_TEAM
	db 24, SLASH
	db 29, WING_ATTACK
	db 35, SWORDS_DANCE
	db 42, PIN_MISSILE
	db 0

StaryuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, STARMIE
	db 0
; Learnset
	db 12, WATER_GUN
	db 19, HARDEN
	db 23, RECOVER
	db 29, SWIFT
	db 37, MINIMIZE
	db 42, LIGHT_SCREEN
	db 47, HYDRO_PUMP
	db 0

BlastoiseEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, BUBBLE
	db 15, WATER_GUN
	db 21, BITE
	db 28, WITHDRAW
	db 36, WATERFALL
	db 45, SKULL_BASH
	db 55, HYDRO_PUMP
	db 0

PinsirEvosMoves:
; Evolutions
	db 0
; Learnset
	db 17, HARDEN
	db 20, BIND
	db 24, GUILLOTINE
	db 29, SLASH
	db 35, SWORDS_DANCE
	db 42, VICEGRIP
	db 0

TangelaEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, VINE_WHIP
	db 19, STUN_SPORE
	db 24, SLAM
	db 32, GROWTH
	db 37, SLEEP_POWDER
	db 45, SOLARBEAM
	db 0

MissingNo1FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo20EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

GrowlitheEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
	db 0
; Learnset
	db 14, EMBER
	db 25, LEER
	db 30, TAKE_DOWN
	db 35, FLAMETHROWER
	db 42, AGILITY
	db 0

OnixEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, WRAP
	db 19, DIG
	db 25, ROCK_THROW
	db 33, SLAM
	db 43, HARDEN
	db 55, EARTHQUAKE
	db 0

FearowEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LEER
	db 15, FURY_ATTACK
	db 22, MIRROR_MOVE
	db 28, DRILL_PECK
	db 43, AGILITY
	db 0

PidgeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 6, WHIRLWIND
	db 9, QUICK_ATTACK
	db 15, WING_ATTACK
	db 31, RAZOR_WIND
	db 44, AGILITY
	db 54, MIRROR_MOVE
	db 0

SlowpokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, SLOWBRO
	db 0
; Learnset
	db 8, DISABLE
	db 18, WATER_GUN
	db 22, HEADBUTT
	db 33, WITHDRAW
	db 37, AMNESIA
	db 44, PSYCHIC_M
	db 55, HYDRO_PUMP
	db 0

KadabraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, ALAKAZAM
	db 0
; Learnset
	db 16, CONFUSION
	db 20, DISABLE
	db 27, PSYBEAM
	db 31, RECOVER
	db 36, REFLECT
	db 40, PSYCHIC_M
	db 0

GravelerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, GOLEM
	db 0
; Learnset
	db 11, DEFENSE_CURL
	db 16, ROCK_THROW
	db 21, SELFDESTRUCT
	db 29, HARDEN
	db 36, ROCK_SLIDE
	db 43, EARTHQUAKE
	db 52, EXPLOSION
	db 0

ChanseyEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, TAIL_WHIP
	db 24, SING
	db 30, MINIMIZE
	db 44, DEFENSE_CURL
	db 48, LIGHT_SCREEN
	db 54, DOUBLE_EDGE
	db 0

MachokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, MACHAMP
	db 0
; Learnset
	db 13, FOCUS_ENERGY
	db 20, LOW_KICK
	db 36, SEISMIC_TOSS
	db 44, COUNTER
	db 52, SUBMISSION
	db 0

MrMimeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, DOUBLESLAP
	db 23, LIGHT_SCREEN
	db 31, PSYBEAM
	db 39, SUBSTITUTE
	db 47, PSYCHIC_M
	db 0

HitmonleeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 23, ROLLING_KICK
	db 30, JUMP_KICK
	db 38, MEDITATE
	db 41, HI_JUMP_KICK
	db 53, MEGA_KICK
	db 0

HitmonchanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, DIZZY_PUNCH
	db 23, FIRE_PUNCH
	db 30, ICE_PUNCH
	db 38, THUNDERPUNCH
	db 41, KARATE_CHOP
	db 53, COUNTER
	db 0

ArbokEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, ACID
	db 17, BITE
	db 27, GLARE
	db 36, SCREECH
	db 47, SLUDGE
	db 0

ParasectEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, LEECH_LIFE
	db 13, STUN_SPORE
	db 20, GROWTH
	db 30, SPORE
	db 39, PIN_MISSILE
	db 48, SLASH
	db 0

PsyduckEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0
; Learnset
	db 5, TAIL_WHIP
	db 18, WATER_GUN
	db 21, DISABLE
	db 36, CONFUSION
	db 43, PSYCHIC_M
	db 52, HYDRO_PUMP
	db 0

DrowzeeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, HYPNO
	db 0
; Learnset
	db 5, DISABLE
	db 12, HYPNOSIS
	db 17, CONFUSION
	db 24, HEADBUTT
	db 29, MEDITATE
	db 32, PSYCHIC_M
	db 37, DREAM_EATER
	db 0

GolemEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, DEFENSE_CURL
	db 16, ROCK_THROW
	db 21, SELFDESTRUCT
	db 29, HARDEN
	db 36, ROCK_SLIDE
	db 43, EARTHQUAKE
	db 52, EXPLOSION
	db 0

MissingNo32EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MagmarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, LEER
	db 18, CONFUSE_RAY
	db 23, SMOG
	db 31, FIRE_PUNCH
	db 39, SMOKESCREEN
	db 47, FLAMETHROWER
	db 55, FIRE_SPIN
	db 0

MissingNo34EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

ElectabuzzEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, LEER
	db 18, THUNDERSHOCK
	db 23, THUNDER_WAVE
	db 31, THUNDERPUNCH
	db 39, LIGHT_SCREEN
	db 47, SCREECH
	db 55, THUNDER
	db 0

MagnetonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, THUNDERSHOCK
	db 12, SONICBOOM
	db 21, SUPERSONIC
	db 25, THUNDER_WAVE
	db 35, SCREECH
	db 41, THUNDER
	db 0

KoffingEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 35, WEEZING
	db 0
; Learnset
	db 22, SLUDGE
	db 29, SMOKESCREEN
	db 38, SELFDESTRUCT
	db 42, SCREECH
	db 48, DOUBLE_EDGE
	db 53, EXPLOSION
	db 0

MissingNo38EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MankeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0
; Learnset
	db 9, LOW_KICK
	db 15, KARATE_CHOP
	db 21, FURY_SWIPES
	db 27, SEISMIC_TOSS
	db 33, SCREECH
	db 45, THRASH
	db 0

SeelEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0
; Learnset
	db 8, GROWL
	db 13, HEADBUTT
	db 25, AURORA_BEAM
	db 34, REST
	db 50, ICE_BEAM
	db 56, TAKE_DOWN
	db 0

DiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0
; Learnset
	db 5, GROWL
	db 15, DIG
	db 19, SAND_ATTACK
	db 31, SLASH
	db 47, EARTHQUAKE
	db 0

TaurosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, LEER
	db 21, STOMP
	db 28, RAGE
	db 35, HEADBUTT
	db 44, TAKE_DOWN
	db 51, DOUBLE_EDGE
	db 0

MissingNo3DEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FarfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEER
	db 15, AGILITY
	db 23, SWORDS_DANCE
	db 31, RAZOR_LEAF
	db 39, SLASH
	db 45, DRILL_PECK
	db 0

VenonatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0
; Learnset
	db 11, POISONPOWDER
	db 22, LEECH_LIFE
	db 27, STUN_SPORE
	db 30, PSYBEAM
	db 35, SLEEP_POWDER
	db 48, PSYCHIC_M
	db 0

DragoniteEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, AGILITY
	db 20, THUNDER_WAVE
	db 30, BODY_SLAM
	db 45, DRAGON_RAGE
	db 55, HYPER_BEAM
	db 0

MissingNo43EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo44EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo45EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

DoduoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, DODRIO
	db 0
; Learnset
	db 8, GROWL
	db 14, FURY_ATTACK
	db 29, DRILL_PECK
	db 31, TRI_ATTACK
	db 39, DOUBLE_KICK
	db 45, AGILITY
	db 0

PoliwagEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0
; Learnset
	db 16, WATER_GUN
	db 19, HYPNOSIS
	db 25, DOUBLESLAP
	db 31, BODY_SLAM
	db 41, AMNESIA
	db 49, HYDRO_PUMP
	db 0

JynxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, LICK
	db 18, DOUBLESLAP
	db 23, LOVELY_KISS
	db 31, ICE_PUNCH
	db 39, BODY_SLAM
	db 47, PSYCHIC_M
	db 58, BLIZZARD
	db 0

MoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, EMBER
	db 51, FLAMETHROWER
	db 55, LIGHT_SCREEN
	db 60, FIRE_SPIN
	db 65, AGILITY
	db 0

ArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, BLIZZARD
	db 55, LIGHT_SCREEN
	db 60, MIST
	db 65, AGILITY
	db 0

ZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, THUNDER
	db 55, LIGHT_SCREEN
	db 60, THUNDER_WAVE
	db 65, AGILITY
	db 0

DittoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0
; Learnset
	db 12, BITE
	db 17, PAY_DAY
	db 24, FURY_SWIPES
	db 33, SLASH
	db 44, SCREECH
	db 0

KrabbyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, KINGLER
	db 0
; Learnset
	db 15, HARDEN
	db 20, VICEGRIP
	db 25, STOMP
	db 34, CRABHAMMER
	db 42, GUILLOTINE
	db 49, SHARPEN
	db 0

MissingNo4FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo50EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo51EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

VulpixEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
	db 0
; Learnset
	db 14, QUICK_ATTACK
	db 25, CONFUSE_RAY
	db 35, FLAMETHROWER
	db 42, FIRE_SPIN
	db 0

NinetalesEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, FLAMETHROWER
	db 6, TAIL_WHIP
	db 7, CONFUSE_RAY
	db 8, QUICK_ATTACK
	db 0

PikachuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
	db 0
; Learnset
	db 9, THUNDER_WAVE
	db 13, QUICK_ATTACK
	db 26, SWIFT
	db 33, AGILITY
	db 45, THUNDER
	db 50, LIGHT_SCREEN
	db 0

RaichuEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, SLAM
	db 6, GROWL
	db 7, THUNDERSHOCK
	db 8, THUNDER_WAVE
	db 0

MissingNo56EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo57EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

DratiniEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0
; Learnset
	db 10, AGILITY
	db 20, THUNDER_WAVE
	db 30, BODY_SLAM
	db 45, DRAGON_RAGE
	db 50, HYPER_BEAM
	db 0

DragonairEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0
; Learnset
	db 10, AGILITY
	db 20, THUNDER_WAVE
	db 30, BODY_SLAM
	db 45, DRAGON_RAGE
	db 55, HYPER_BEAM
	db 0

KabutoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0
; Learnset
	db 24, WATER_GUN
	db 39, SLASH
	db 46, SWORDS_DANCE
	db 53, HYDRO_PUMP
	db 0

KabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 24, WATER_GUN
	db 39, SLASH
	db 46, SWORDS_DANCE
	db 53, HYDRO_PUMP
	db 0

HorseaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, SEADRA
	db 0
; Learnset
	db 8, LEER
	db 19, SMOKESCREEN
	db 24, WATER_GUN
	db 30, DRAGON_RAGE
	db 41, AGILITY
	db 52, HYDRO_PUMP
	db 0

SeadraEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, LEER
	db 19, SMOKESCREEN
	db 24, WATER_GUN
	db 30, DRAGON_RAGE
	db 41, AGILITY
	db 52, HYDRO_PUMP
	db 0

MissingNo5EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo5FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

SandshrewEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0
; Learnset
	db 10, SAND_ATTACK
	db 17, POISON_STING
	db 21, DEFENSE_CURL
	db 26, SWIFT
	db 36, SLASH
	db 47, DIG
	db 0

SandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SAND_ATTACK
	db 17, POISON_STING
	db 21, DEFENSE_CURL
	db 26, SWIFT
	db 36, SLASH
	db 47, DIG
	db 0

OmanyteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0
; Learnset
	db 24, HORN_ATTACK
	db 39, BITE
	db 46, SPIKE_CANNON
	db 53, HYDRO_PUMP
	db 0

OmastarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 24, HORN_ATTACK
	db 39, BITE
	db 46, SPIKE_CANNON
	db 53, HYDRO_PUMP
	db 0

JigglypuffEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
	db 0
; Learnset
	db 3, POUND
	db 14, DISABLE
	db 19, DEFENSE_CURL
	db 24, DOUBLESLAP
	db 30, REST
	db 34, BODY_SLAM
	db 39, DOUBLE_EDGE
	db 0

WigglytuffEvosMoves:
; Evolutions
	db 0
; Learnset
	db 34, BODY_SLAM
	db 0

EeveeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
	db EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
	db 0
; Learnset
	db 25. SWIFT
	db 27, QUICK_ATTACK
	db 31, TAIL_WHIP
	db 37, BITE
	db 45, TAKE_DOWN
	db 0

FlareonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 25, QUICK_ATTACK
	db 27, EMBER
	db 31, SMOG
	db 37, LEER
	db 42, FLAMETHROWER
	db 47, TAKE_DOWN
	db 55, FIRE_SPIN
	db 0

JolteonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 25, QUICK_ATTACK
	db 27, THUNDERSHOCK
	db 31, DOUBLE_KICK
	db 37, PIN_MISSILE
	db 42, THUNDER_WAVE
	db 47, AGILITY
	db 55, THUNDER
	db 0

VaporeonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 25, QUICK_ATTACK
	db 27, WATER_GUN
	db 31, AURORA_BEAM
	db 37, ACID_ARMOR
	db 42, HAZE
	db 47, MIST
	db 55, HYDRO_PUMP
	db 0

MachopEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0
; Learnset
	db 13, FOCUS_ENERGY
	db 20, LOW_KICK
	db 36, SEISMIC_TOSS
	db 44, COUNTER
	db 52, SUBMISSION
	db 0

ZubatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0
; Learnset
	db 6, SUPERSONIC
	db 13, BITE
	db 21, CONFUSE_RAY
	db 32, WING_ATTACK
	db 41, SCREECH
	db 57, HAZE
	db 0

EkansEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, ARBOK
	db 0
; Learnset
	db 10, ACID
	db 17, BITE
	db 27, GLARE
	db 36, SCREECH
	db 47, SLUDGE
	db 0

ParasEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 24, PARASECT
	db 0
; Learnset
	db 8, LEECH_LIFE
	db 13, STUN_SPORE
	db 20, GROWTH
	db 30, SPORE
	db 39, PIN_MISSILE
	db 48, SLASH
	db 0

PoliwhirlEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
	db 0
; Learnset
	db 16, WATER_GUN
	db 19, HYPNOSIS
	db 25, DOUBLESLAP
	db 31, BODY_SLAM
	db 41, AMNESIA
	db 49, HYDRO_PUMP
	db 0

PoliwrathEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, HYPNOSIS
	db 32, SUBMISSION
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
	db 10, TWINEEDLE
	db 12, FURY_ATTACK
	db 20, SHARPEN
	db 25, RAGE
	db 30, PIN_MISSILE
	db 35, AGILITY
	db 0

MissingNo73EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

DodrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, GROWL
	db 14, FURY_ATTACK
	db 29, DRILL_PECK
	db 31, TRI_ATTACK
	db 39, DOUBLE_KICK
	db 45, AGILITY
	db 0

PrimeapeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LOW_KICK
	db 15, KARATE_CHOP
	db 21, FURY_SWIPES
	db 27, SEISMIC_TOSS
	db 33, SCREECH
	db 45, THRASH
	db 0

DugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, GROWL
	db 15, DIG
	db 19, SAND_ATTACK
	db 31, SLASH
	db 47, EARTHQUAKE
	db 0

VenomothEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, POISONPOWDER
	db 22, LEECH_LIFE
	db 27, STUN_SPORE
	db 30, PSYBEAM
	db 35, SLEEP_POWDER
	db 48, PSYCHIC_M
	db 0

DewgongEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, GROWL
	db 13, HEADBUTT
	db 25, AURORA_BEAM
	db 34, REST
	db 50, ICE_BEAM
	db 56, TAKE_DOWN
	db 0

MissingNo79EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo7AEvosMoves:
; Evolutions
	db 0
; Learnset
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
	db 10, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SUPERSONIC
	db 21, SLEEP_POWDER
	db 26, WING_ATTACK
	db 34, PSYBEAM
	db 0

MachampEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, FOCUS_ENERGY
	db 20, LOW_KICK
	db 36, SEISMIC_TOSS
	db 44, COUNTER
	db 52, SUBMISSION
	db 0

MissingNo7FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

GolduckEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, TAIL_WHIP
	db 18, WATER_GUN
	db 21, DISABLE
	db 36, CONFUSION
	db 43, PSYCHIC_M
	db 52, HYDRO_PUMP
	db 0

HypnoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, DISABLE
	db 12, HYPNOSIS
	db 17, CONFUSION
	db 24, HEADBUTT
	db 29, MEDITATE
	db 32, PSYCHIC_M
	db 37, DREAM_EATER
	db 0

GolbatEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, SUPERSONIC
	db 13, BITE
	db 21, CONFUSE_RAY
	db 32, WING_ATTACK
	db 41, SCREECH
	db 57, HAZE
	db 0

MewtwoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, SWIFT
	db 60, PSYCHIC_M
	db 63, BARRIER
	db 66, AMNESIA
	db 70, RECOVER
	db 75, MIST
	db 0

SnorlaxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, BODY_SLAM
	db 41, AMNESIA
	db 48, DOUBLE_EDGE
	db 56, HYPER_BEAM
	db 0

MagikarpEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0
; Learnset
	db 15, TACKLE
	db 0

MissingNo86EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo87EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MukEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, POISON_GAS
	db 33, MINIMIZE
	db 37, SLUDGE
	db 42, ACID_ARMOR
	db 45, SCREECH
	db 0

MissingNo8AEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

KinglerEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, HARDEN
	db 20, VICEGRIP
	db 25, STOMP
	db 34, CRABHAMMER
	db 42, GUILLOTINE
	db 49, SHARPEN
	db 0

CloysterEvosMoves:
; Evolutions
	db 0
; Learnset
	db 50, ICE_BEAM
	db 0

MissingNo8CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

ElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, THUNDERSHOCK
	db 17, SONICBOOM
	db 22, SELFDESTRUCT
	db 29, SWIFT
	db 40, THUNDER
	db 50, EXPLOSION
	db 0

ClefableEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, BODY_SLAM
	db 0

WeezingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 22, SLUDGE
	db 29, SMOKESCREEN
	db 38, SELFDESTRUCT
	db 42, SCREECH
	db 48, DOUBLE_EDGE
	db 53, EXPLOSION
	db 0

PersianEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, BITE
	db 17, PAY_DAY
	db 24, FURY_SWIPES
	db 33, SLASH
	db 44, SCREECH
	db 0

MarowakEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, LEER
	db 21, FOCUS_ENERGY
	db 28, HEADBUTT
	db 38, THRASH
	db 43, BONEMERANG
	db 50, RAGE
	db 0

MissingNo92EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

HaunterEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, GENGAR
	db 0
; Learnset
	db 29, HYPNOSIS
	db 38, DREAM_EATER
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
	db 36, REFLECT
	db 40, PSYCHIC_M
	db 0

PidgeottoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 6, WHIRLWIND
	db 9, QUICK_ATTACK
	db 15, WING_ATTACK
	db 31, RAZOR_WIND
	db 44, AGILITY
	db 54, MIRROR_MOVE
	db 0

PidgeotEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 6, WHIRLWIND
	db 9, QUICK_ATTACK
	db 15, WING_ATTACK
	db 31, RAZOR_WIND
	db 44, AGILITY
	db 54, MIRROR_MOVE
	db 0

StarmieEvosMoves:
; Evolutions
	db 0
; Learnset
	db 27, PSYBEAM
	db 0

BulbasaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 13, VINE_WHIP
	db 22, POISONPOWDER
	db 30, RAZOR_LEAF
	db 34, SLEEP_POWDER
	db 38, GROWTH
	db 54, SOLARBEAM
	db 0

VenusaurEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEECH_SEED
	db 13, VINE_WHIP
	db 22, POISONPOWDER
	db 30, RAZOR_LEAF
	db 34, SLEEP_POWDER
	db 38, GROWTH
	db 54, SOLARBEAM
	db 0

TentacruelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, WRAP
	db 7, SUPERSONIC
	db 13, WATER_GUN
	db 22, ACID
	db 27, SCREECH
	db 35, BARRIER
	db 43, SLUDGE
	db 50, HYDRO_PUMP
	db 0

MissingNo9CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

GoldeenEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, SEAKING
	db 0
; Learnset
	db 19, SUPERSONIC
	db 24, HORN_ATTACK
	db 30, WATERFALL
	db 41, AGILITY
	db 52, HORN_DRILL
	db 0

SeakingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, SUPERSONIC
	db 24, HORN_ATTACK
	db 30, WATERFALL
	db 41, AGILITY
	db 52, HORN_DRILL
	db 0

MissingNo9FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA0EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA1EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA2EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

PonytaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0
; Learnset
	db 8, TAIL_WHIP
	db 20, STOMP
	db 32, TAKE_DOWN
	db 39, FIRE_SPIN
	db 43, FLAMETHROWER
	db 47, AGILITY
	db 55, DOUBLE_EDGE
	db 0

RapidashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, TAIL_WHIP
	db 20, STOMP
	db 32, TAKE_DOWN
	db 39, FIRE_SPIN
	db 43, FLAMETHROWER
	db 47, AGILITY
	db 55, DOUBLE_EDGE
	db 0

RattataEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, RATICATE
	db 0
; Learnset
	db 9, QUICK_ATTACK
	db 14, FOCUS_ENERGY
	db 27, HYPER_FANG
	db 41, SUPER_FANG
	db 0

RaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, QUICK_ATTACK
	db 14, FOCUS_ENERGY
	db 27, HYPER_FANG
	db 41, SUPER_FANG
	db 0

NidorinoEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
	db 0
; Learnset
	db 8, HORN_ATTACK
	db 14, POISON_STING
	db 16, DOUBLE_KICK
	db 23, FURY_ATTACK
	db 30, FOCUS_ENERGY
	db 41, HORN_DRILL
	db 0

NidorinaEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
; Learnset
	db 8, TAIL_WHIP
	db 14, POISON_STING
	db 18, DOUBLE_KICK
	db 23, FURY_SWIPES
	db 30, BITE
	db 41, HEADBUTT
	db 0

GeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0
; Learnset
	db 11, DEFENSE_CURL
	db 16, ROCK_THROW
	db 21, SELFDESTRUCT
	db 29, HARDEN
	db 36, ROCK_SLIDE
	db 43, EARTHQUAKE
	db 52, EXPLOSION
	db 0

PorygonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 23, PSYBEAM
	db 28, RECOVER
	db 35, AGILITY
	db 42, TRI_ATTACK
	db 0

AerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, SUPERSONIC
	db 23, BITE
	db 28, ROCK_SLIDE
	db 38, TAKE_DOWN
	db 45, DOUBLE_EDGE
	db 54, HYPER_BEAM
	db 0

MissingNoACEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MagnemiteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0
; Learnset
	db 5, THUNDERSHOCK
	db 12, SONICBOOM
	db 21, SUPERSONIC
	db 25, THUNDER_WAVE
	db 35, SCREECH
	db 41, THUNDER
	db 0

MissingNoAEEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoAFEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

CharmanderEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0
; Learnset
	db 9, EMBER
	db 15, SMOKESCREEN
	db 24, FIRE_PUNCH
	db 32, SLASH
	db 38, FLAMETHROWER
	db 46, FIRE_SPIN
	db 0

SquirtleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0
; Learnset
	db 8, BUBBLE
	db 15, WATER_GUN
	db 21, BITE
	db 28, WITHDRAW
	db 36, WATERFALL
	db 45, SKULL_BASH
	db 55, HYDRO_PUMP
	db 0

CharmeleonEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0
; Learnset
	db 9, EMBER
	db 15, SMOKESCREEN
	db 24, FIRE_PUNCH
	db 32, SLASH
	db 38, FLAMETHROWER
	db 46, FIRE_SPIN
	db 0

WartortleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0
; Learnset
	db 8, BUBBLE
	db 15, WATER_GUN
	db 21, BITE
	db 28, WITHDRAW
	db 36, WATERFALL
	db 45, SKULL_BASH
	db 55, HYDRO_PUMP
	db 0

CharizardEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, EMBER
	db 15, SMOKESCREEN
	db 24, FIRE_PUNCH
	db 32, SLASH
	db 36, WING_ATTACK
	db 42, FLAMETHROWER
	db 46, FIRE_SPIN
	db 0

MissingNoB5EvosMoves:
; Evolutions
	db 0
; Learnset
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

MonGhostEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

OddishEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, GLOOM
	db 0
; Learnset
	db 8, POISONPOWDER
	db 12, STUN_SPORE
	db 16, SLEEP_POWDER
	db 25, ACID
	db 33, PETAL_DANCE
	db 46, SOLARBEAM
	db 0

GloomEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
	db 0
; Learnset
	db 8, POISONPOWDER
	db 12, STUN_SPORE
	db 16, SLEEP_POWDER
	db 25, ACID
	db 38, PETAL_DANCE
	db 52, SOLARBEAM
	db 0

VileplumeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, POISONPOWDER
	db 17, STUN_SPORE
	db 0

BellsproutEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0
; Learnset
	db 13, WRAP
	db 18, POISONPOWDER
	db 21, STUN_SPORE
	db 26, ACID
	db 29, SLEEP_POWDER
	db 38, RAZOR_LEAF
	db 0

WeepinbellEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
	db 0
; Learnset
	db 13, WRAP
	db 18, POISONPOWDER
	db 21, STUN_SPORE
	db 26, ACID
	db 29, SLEEP_POWDER
	db 38, RAZOR_LEAF
	db 0

VictreebelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, WRAP
	db 18, SLEEP_POWDER
	db 0
