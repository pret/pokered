MACRO mon_cry
; index, pitch, length
	dw \1, \2, \3
ENDM

PokemonCries::
; entries correspond to constants/pokemon_constants.asm
	mon_cry CRY_BULBASAUR,   128,  129 ; BULBASAUR
	mon_cry CRY_BULBASAUR,    32,  256 ; IVYSAUR
	mon_cry CRY_BULBASAUR,     0,  320 ; VENUSAUR
	mon_cry CRY_CHARMANDER,   96,  192 ; CHARMANDER
	mon_cry CRY_CHARMANDER,   32,  192 ; CHARMELEON
	mon_cry CRY_CHARMANDER,    0,  256 ; CHARIZARD
	mon_cry CRY_SQUIRTLE,     96,  192 ; SQUIRTLE
	mon_cry CRY_SQUIRTLE,     32,  192 ; WARTORTLE
	mon_cry CRY_SQUIRTLE,      0,  256 ; TOTARTLE
	mon_cry CRY_BULBASAUR,   238,  129 ; PIKACHU
	mon_cry CRY_RAICHU,      238,  136 ; RAICHU
	mon_cry CRY_RAICHU,      238,  136 ; RAICHU_A
	mon_cry CRY_GOROCHU,       0,  256 ; GOROCHU
	; mon_cry CRY_EKANS,     193,  356 ; (old Gorochu cry)
	mon_cry CRY_VENONAT,     136,  224 ; EEVEE
	mon_cry CRY_VENONAT,     170,  383 ; VAPOREON
	mon_cry CRY_VENONAT,      61,  256 ; JOLTEON
	mon_cry CRY_VENONAT,      16,  160 ; FLAREON
	mon_cry CRY_AIPOM,       162,  320 ; ESPEON
	mon_cry CRY_VENONAT,    -233,  240 ; UMBREON
	mon_cry CRY_NIDORAN_M,     0,    0 ; LEAFEON	(incomplete)
	mon_cry CRY_NIDORAN_M,     0,    0 ; GLACEON	(incomplete)
	mon_cry CRY_NIDORAN_M,     0,    0 ; SYLVEON	(incomplete)
	mon_cry CRY_RATTATA,       0,  256 ; RATTATA
	mon_cry CRY_RATTATA,      32,  383 ; RATICATE
	mon_cry CRY_RATTATA,      32,  383 ; RATICATE_A
	mon_cry CRY_PIDGEY,      223,  132 ; PIDGEY
	mon_cry CRY_PIDGEOTTO,    40,  320 ; PIDGEOTTO
	mon_cry CRY_PIDGEOTTO,    17,  383 ; PIDGEOT
	mon_cry CRY_CLEFAIRY,    193,  156 ; KONYA
	mon_cry CRY_CLEFAIRY,    119,  144 ; MEOWTH
	mon_cry CRY_CLEFAIRY,    153,  383 ; PERSIAN
	mon_cry CRY_CLEFAIRY,    153,  383 ; PERSIAN_A
	mon_cry CRY_CLEFAIRY,     26,  192 ; PERRSERKER	(may revise)
	mon_cry CRY_CATERPIE,    128,  160 ; CATERPIE
	mon_cry CRY_METAPOD,     204,  129 ; METAPOD
	mon_cry CRY_CATERPIE,    119,  192 ; BUTTERFREE
	mon_cry CRY_WEEDLE,      238,  129 ; WEEDLE
	mon_cry CRY_BLASTOISE,   255,  129 ; KAKUNA
	mon_cry CRY_BLASTOISE,    96,  256 ; BEEDRILL
	; mon_cry CRY_NIDORAN_M,     0,    0 ; KOKANA	(incomplete)
	; mon_cry CRY_NIDORAN_M,     0,    0 ; KASANAGI	(incomplete)
	; mon_cry CRY_NIDORAN_M,     0,    0 ; CARAPTHOR(incomplete)
	mon_cry CRY_SPEAROW,       0,  256 ; SPEAROW
	mon_cry CRY_FEAROW,       64,  288 ; FEAROW
	mon_cry CRY_EKANS,        18,  192 ; EKANS
	mon_cry CRY_EKANS,       224,  144 ; ARBOK
	mon_cry CRY_NIDORAN_M,    32,  192 ; SANDSHREW
	mon_cry CRY_NIDORAN_M,   255,  383 ; SANDSLASH
	mon_cry CRY_NIDORAN_M,   255,  383 ; SANDSLASH_A
	mon_cry CRY_NIDORAN_F,     0,  256 ; NIDORAN_F
	mon_cry CRY_NIDORAN_F,    44,  352 ; NIDORINA
	mon_cry CRY_NIDOQUEEN,     0,  256 ; NIDOQUEEN
	mon_cry CRY_NIDORAN_M,     0,  256 ; NIDORAN_M
	mon_cry CRY_NIDORAN_M,    44,  320 ; NIDORINO
	mon_cry CRY_RAICHU,        0,  256 ; NIDOKING
	mon_cry CRY_NIDOQUEEN,    44,  256 ; NIDOREIGN
	mon_cry CRY_SQUIRTLE,    180,  206 ; BITTYBAT
	mon_cry CRY_SQUIRTLE,    224,  256 ; ZUBAT
	mon_cry CRY_SQUIRTLE,    250,  256 ; GOLBAT
	mon_cry CRY_SQUIRTLE,    -16,  320 ; CROBAT
	mon_cry CRY_VULPIX,      240,  144 ; GEODUDE
	mon_cry CRY_VULPIX,        0,  256 ; GRAVELER
	mon_cry CRY_GOLEM,       224,  192 ; GOLEM
	mon_cry CRY_GOLEM,       224,  192 ; GOLEM_A
	mon_cry CRY_PARAS,        32,  352 ; PARAS
	mon_cry CRY_PARAS,        66,  383 ; PARASECT
	mon_cry CRY_CLEFAIRY,    204,  129 ; CLEFAIRY
	mon_cry CRY_CLEFAIRY,    170,  160 ; CLEFABLE
	mon_cry CRY_PIDGEY,      255,  181 ; JIGGLYPUFF
	mon_cry CRY_PIDGEY,      104,  224 ; WIGGLYTUFF
	mon_cry CRY_PIDGEY,      224,  224 ; MIKON
	mon_cry CRY_VULPIX,       79,  144 ; VULPIX
	mon_cry CRY_VULPIX,      136,  224 ; NINETALES
	mon_cry CRY_VULPIX,      136,  224 ; NINETALES_A
	mon_cry CRY_GROWLITHE,    64,  129 ; PUDI
	mon_cry CRY_GROWLITHE,    32,  192 ; GROWLITHE
	mon_cry CRY_WEEDLE,        0,  256 ; ARCANINE
	mon_cry CRY_WEEDLE,        0,  256 ; ARCANINE_H
	mon_cry CRY_NIDOQUEEN,   221,  224 ; MANKEY
	mon_cry CRY_NIDOQUEEN,   175,  192 ; PRIMEAPE
	mon_cry CRY_NIDOQUEEN, -1280,  512 ; ANNIHILAPE
	mon_cry CRY_ODDISH,      221,  129 ; ODDISH
	mon_cry CRY_ODDISH,      170,  192 ; GLOOM
	mon_cry CRY_VILEPLUME,    34,  383 ; VILEPLUME
	mon_cry CRY_CLEFFA,      132,  336 ; BELLOSSOM
	mon_cry CRY_PSYDUCK,      85,  129 ; BELLSPROUT
	mon_cry CRY_WEEPINBELL,   68,  160 ; WEEPINBELL
	mon_cry CRY_WEEPINBELL,  102,  332 ; VICTREEBEL
	mon_cry CRY_SLOWKING,    573,  320 ; TSUBOMITTO
	mon_cry CRY_EKANS,       128,  128 ; MAGIKARP
	mon_cry CRY_EKANS,         0,  256 ; GYARADOS
	mon_cry CRY_CATERPIE,    137,  142 ; GYOPIN
	mon_cry CRY_CATERPIE,    128,  192 ; GOLDEEN
	mon_cry CRY_CATERPIE,     16,  383 ; SEAKING
	mon_cry CRY_VENONAT,      68,  192 ; VENONAT
	mon_cry CRY_VENONAT,      41,  256 ; VENOMOTH
	mon_cry CRY_RATTATA,     255,  192 ; CHEEP
	mon_cry CRY_RATTATA,      50,  383 ; JABETTA
	mon_cry CRY_PSYDUCK,      32,  224 ; PSYDUCK
	mon_cry CRY_PSYDUCK,     147,  208 ; WEIRDUCK
	mon_cry CRY_PSYDUCK,     255,  192 ; GOLDUCK
	mon_cry CRY_PIDGEY,      255,  383 ; POLIWAG
	mon_cry CRY_PIDGEY,      119,  224 ; POLIWHIRL
	mon_cry CRY_PIDGEY,        0,  383 ; POLIWRATH
	mon_cry CRY_CLEFFA,     -675,  456 ; POLITOED
	mon_cry CRY_METAPOD,     192,  129 ; ABRA
	mon_cry CRY_METAPOD,     168,  320 ; KADABRA
	mon_cry CRY_METAPOD,     152,  383 ; ALAKAZAM
	mon_cry CRY_SEEL,          0,  256 ; LICKITUNG
	mon_cry CRY_NIDORAN_M,     0,    0 ; LICKILICKY	(incomplete)
	mon_cry CRY_DROWZEE,     136,  160 ; DROWZEE
	mon_cry CRY_DROWZEE,     238,  192 ; HYPNO
	mon_cry CRY_DIGLETT,     170,  129 ; DIGLETT
	mon_cry CRY_DIGLETT,      42,  144 ; DUGTRIO
	mon_cry CRY_DIGLETT,      42,  144 ; DUGTRIO_A
	mon_cry CRY_NIDORAN_M,     0,    0 ; WIGLETT	(incomplete)
	mon_cry CRY_NIDORAN_M,     0,    0 ; WUGTRIO	(incomplete)
	mon_cry CRY_EKANS,       255,  320 ; ONIX
	mon_cry CRY_TYPHLOSION,  239,  247 ; STEELIX
	mon_cry CRY_KANGASKHAN,  163,  129 ; KOTORA
	mon_cry CRY_KANGASKHAN,   45,  129 ; GAOTORA
	mon_cry CRY_KANGASKHAN,    5,  129 ; GOROTORA
	mon_cry CRY_VOLTORB,     237,  256 ; VOLTORB
	mon_cry CRY_VOLTORB,     168,  272 ; ELECTRODE
	mon_cry CRY_VOLTORB,     168,  272 ; ELECTRODE_H
	mon_cry CRY_VENONAT,       0,  256 ; TENTACOOL
	mon_cry CRY_VENONAT,     238,  383 ; TENTACRUEL
	mon_cry CRY_NIDORAN_M,     0,    0 ; TOEDSCOOL	(incomplete)
	mon_cry CRY_NIDORAN_M,     0,    0 ; TOEDSCRUEL	(incomplete)
	mon_cry CRY_GOLEM,       147,  224 ; RIBBITO
	mon_cry CRY_GOLEM,        37,  383 ; CROAKOZUNA
	mon_cry CRY_METAPOD,     128,  224 ; MAGNEMITE
	mon_cry CRY_METAPOD,     177,  272 ; MAGNETITE
	mon_cry CRY_METAPOD,      32,  320 ; MAGNETON
	mon_cry CRY_NIDORAN_M,     0,    0 ; MAGNEZONE	(incomplete)
	mon_cry CRY_GROWLITHE,   238,  129 ; MACHOP
	mon_cry CRY_GROWLITHE,    72,  224 ; MACHOKE
	mon_cry CRY_GROWLITHE,     8,  320 ; MACHAMP
	mon_cry CRY_GOROCHU,     246,  192 ; CROCKY
	; mon_cry CRY_METAPOD,   198,  368 ; (old Crocky cry)
	mon_cry CRY_KRABBY,       32,  352 ; KRABBY
	mon_cry CRY_KRABBY,      238,  352 ; KINGLER
	mon_cry CRY_SLOWPOKE,      0,  256 ; SLOWPOKE
	mon_cry CRY_GROWLITHE,     0,  256 ; SLOWBRO
	mon_cry CRY_GROWLITHE,     0,  256 ; SLOWBRO_G
	mon_cry CRY_SLOWKING,    260,  512 ; SLOWKING
	mon_cry CRY_SLOWKING,    260,  512 ; SLOWKING_G
	mon_cry CRY_WEEPINBELL,   55,  144 ; PUCHIKOON
	mon_cry CRY_WEEPINBELL,    0,  256 ; PONYTA
	mon_cry CRY_WEEPINBELL,   32,  320 ; RAPIDASH
	mon_cry CRY_WEEPINBELL,   32,  320 ; RAPIDASH_G
	mon_cry CRY_WEEDLE,       64,  293 ; DEER
	mon_cry CRY_GOLEM,       147,  128 ; MONJA
	mon_cry CRY_GOLEM,         0,  256 ; TANGELA
	mon_cry CRY_NIDORAN_M,     0,    0 ; TANGROWTH
	mon_cry CRY_PIDGEY,        0,  256 ; BARUNDA
	mon_cry CRY_METAPOD,       0,  256 ; GASTLY
	mon_cry CRY_METAPOD,      48,  192 ; HAUNTER
	mon_cry CRY_MUK,           0,  383 ; GENGAR
	mon_cry CRY_CLEFAIRY,      0,  256 ; CUBONE
	mon_cry CRY_ODDISH,       79,  224 ; MAROWAK
	mon_cry CRY_ODDISH,       79,  224 ; MAROWAK_A
	mon_cry CRY_ODDISH,        0,  383 ; GUARDIA
	mon_cry CRY_SPEAROW,     221,  129 ; FARFETCHD
	mon_cry CRY_FEAROW,       25,  383 ; MADAAMU
	mon_cry CRY_SPEAROW,    -112,  192 ; SIRFETCHD
	mon_cry CRY_NIDORAN_M,     0,    0 ; HINAAZU
	mon_cry CRY_DIGLETT,     187,  129 ; DODUO
	mon_cry CRY_DIGLETT,     153,  160 ; DODRIO
	mon_cry CRY_GRIMER,      255,  192 ; BETOBEBII
	mon_cry CRY_GRIMER,        0,  256 ; GRIMER
	mon_cry CRY_MUK,         239,  383 ; MUK
	mon_cry CRY_MUK,         239,  383 ; MUK_A
	mon_cry CRY_GOLEM,       230,  349 ; KOFFING
	mon_cry CRY_GOLEM,       255,  383 ; WEEZING
	mon_cry CRY_GOLEM,       255,  383 ; WEEZING_G
	mon_cry CRY_PIDGEY,      255,  383 ; DITTO
	mon_cry CRY_PIDGEY,       80,  383 ; ANIMON
	mon_cry CRY_KRABBY,        8,  192 ; MR_MIME
	mon_cry CRY_KRABBY,     -256,  232 ; MR_RIME
	mon_cry CRY_NIDORAN_M,   128,  144 ; CACTUS
	mon_cry CRY_GOLEM,       128,  320 ; HITMONLEE
	mon_cry CRY_SEEL,        238,  320 ; HITMONCHAN
	mon_cry CRY_SLUGMA,        0,  256 ; HITMONTOP
	mon_cry CRY_BLASTOISE,   147,  128 ; BLOTTLE
	mon_cry CRY_BLASTOISE,    60,  128 ; PENDRAKEN
	mon_cry CRY_FEAROW,        0,  256 ; SHELLDER
	mon_cry CRY_FEAROW,      111,  352 ; CLOYSTER
	mon_cry CRY_MUK,          32,  383 ; TAABAN		(may revise)
	mon_cry CRY_PARAS,         2,  160 ; STARYU
	mon_cry CRY_PARAS,         0,  256 ; STARMIE
	mon_cry CRY_SEEL,        136,  320 ; SEEL
	mon_cry CRY_SEEL,         35,  383 ; DEWGONG
	mon_cry CRY_BLASTOISE,   247,  128 ; BLASTYKE
	mon_cry CRY_BLASTOISE,     0,  256 ; BLASTOISE
	mon_cry CRY_CLEFAIRY,    153,  144 ; HORSEA
	mon_cry CRY_CLEFAIRY,     60,  129 ; SEADRA
	mon_cry CRY_SLUGMA,      763,  256 ; KINGDRA
	mon_cry CRY_GOROCHU,      16,  272 ; JAGG
	; mon_cry CRY_EKANS,     200,  320 ; (old Jagg cry)
	mon_cry CRY_DIGLETT,       0,  256 ; EXEGGCUTE
	mon_cry CRY_DROWZEE,       0,  256 ; EXEGGUTOR
	mon_cry CRY_DROWZEE,       0,  256 ; EXEGGUTOR_A
	mon_cry CRY_CHARMANDER,    0,  256 ; RHYHORN
	mon_cry CRY_RHYDON,        0,  256 ; RHYDON
	mon_cry CRY_NIDORAN_M,     0,    0 ; RHYPERIOR	(incomplete)
	mon_cry CRY_CATERPIE,      0,  256 ; SCYTHER
	mon_cry CRY_AMPHAROS,      0,  352 ; SCIZOR
	mon_cry CRY_CATERPIE,   -512,  383 ; KLEAVOR
	mon_cry CRY_PIDGEOTTO,     0,  256 ; PINSIR
	mon_cry CRY_RAICHU,      291,  256 ; PURAKKUSU
	mon_cry CRY_KANGASKHAN,    0,  256 ; KANGASKHAN
	mon_cry CRY_KANGASKHAN,  144,  304 ; TRAMPEL
	mon_cry CRY_SQUIRTLE,     17,  192 ; TAUROS
	mon_cry CRY_SQUIRTLE,     17,  192 ; TAUROS_P
	mon_cry CRY_SQUIRTLE,     17,  192 ; TAUROS_PA
	mon_cry CRY_SQUIRTLE,     17,  192 ; TAUROS_PB
	mon_cry CRY_PIDGEOTTO,    10,  320 ; CHANSEY
	mon_cry CRY_SLOWKING,    659,  320 ; BLISSEY
	mon_cry CRY_BULBASAUR,    99,  192 ; SKIMPER
	mon_cry CRY_BULBASAUR,    64,  320 ; BAWLIGUA
	mon_cry CRY_BULBASAUR,    32,  320 ; CRYITHAN
	mon_cry CRY_DROWZEE,     255,  383 ; JYNX
	mon_cry CRY_DROWZEE,      46,  352 ; BUU
	mon_cry CRY_VOLTORB,     143,  383 ; ELECTABUZZ
	mon_cry CRY_TEDDIURSA,   470,  256 ; ELECTIVIRE
	mon_cry CRY_CHARMANDER,  255,  176 ; MAGMAR
	mon_cry CRY_NIDORAN_M,     0,    0 ; MAGMORTAR	(incomplete)
	mon_cry CRY_LAPRAS,        0,  256 ; LAPRAS
	mon_cry CRY_WEEPINBELL,  170,  383 ; PORYGON
	mon_cry CRY_GIRAFARIG,   115,  576 ; PORYGON2
	mon_cry CRY_NIDORAN_M,     0,    0 ; PORYGONZ	(incomplete)
	mon_cry CRY_GROWLITHE,   240,  129 ; OMANYTE
	mon_cry CRY_GROWLITHE,   255,  192 ; OMASTAR
	mon_cry CRY_CATERPIE,    187,  192 ; KABUTO
	mon_cry CRY_FEAROW,      238,  129 ; KABUTOPS
	mon_cry CRY_VILEPLUME,    32,  368 ; AERODACTYL
	mon_cry CRY_BULBASAUR,    64,  256 ; DECILLA
	mon_cry CRY_BULBASAUR,     0,  256 ; GYAOON
	mon_cry CRY_BLASTOISE,     0,  128 ; OMEGA
	mon_cry CRY_GRIMER,       85,  129 ; SNORLAX
	mon_cry CRY_PIDGEY,      250,  256 ; SCREAM_TAIL
	mon_cry CRY_METAPOD,      31,  349 ; SANDY_SHOCKS
	mon_cry CRY_BULBASAUR,    96,  192 ; DRATINI
	mon_cry CRY_BULBASAUR,    64,  256 ; DRAGONAIR
	mon_cry CRY_BULBASAUR,    60,  320 ; DRAGONITE
	mon_cry CRY_RAICHU,      128,  192 ; ARTICUNO
	mon_cry CRY_RAICHU,      128,  192 ; ARTICUNO_G
	mon_cry CRY_FEAROW,      255,  256 ; ZAPDOS
	mon_cry CRY_FEAROW,      255,  256 ; ZAPDOS_G
	mon_cry CRY_RAICHU,      248,  192 ; MOLTRES
	mon_cry CRY_RAICHU,      248,  192 ; MOLTRES_G
	mon_cry CRY_PARAS,       153,  383 ; MEWTWO
	mon_cry CRY_PARAS,       238,  383 ; MEW
	mon_cry CRY_PIDGEY,      255,  156 ; MELTAN		(may revise)
	mon_cry CRY_RHYDON,      240,  224 ; MELMETAL
