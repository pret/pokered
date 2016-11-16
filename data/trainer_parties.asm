TrainerDataPointers:
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw JrTrainerMData
	dw JrTrainerFData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw Juggler1Data
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Green1Data
	dw ProfOakData
	dw ChiefData
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw CooltrainerMData
	dw CooltrainerFData
	dw BrunoData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Green2Data
	dw Green3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData

; if first byte != FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == FF, then
	; first byte is FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
; Route 3
	db 11
	dw RATTATA,EKANS
	db 0, 0

	db 14
	dw SPEAROW
	db 0, 0
; Mt. Moon 1F
	db 10
	dw RATTATA,RATTATA,ZUBAT
	db 0, 0
; Route 24
	db 14
	dw RATTATA,EKANS,ZUBAT
	db 0, 0
; Route 25
	db 15
	dw RATTATA,SPEAROW
	db 0, 0

	db 17
	dw SLOWPOKE
	db 0, 0

	db 14
	dw EKANS,SANDSHREW
	db 0, 0
; SS Anne 1F Rooms
	db 21
	dw NIDORAN_M
	db 0, 0
; Route 11
	db 21
	dw EKANS
	db 0, 0

	db 19
	dw SANDSHREW,ZUBAT
	db 0, 0

	db 17
	dw RATTATA,RATTATA,RATICATE
	db 0, 0

	db 18
	dw NIDORAN_M,NIDORINO
	db 0, 0
; Unused
	db 17
	dw SPEAROW,RATTATA,RATTATA,SPEAROW
	db 0, 0

BugCatcherData:
; Viridian Forest
	db 6
	dw WEEDLE,CATERPIE
	db 0, 0

	db 7
	dw WEEDLE,KAKUNA,WEEDLE
	db 0, 0

	db 9
	dw WEEDLE
	db 0, 0

; Route 3
	db 10
	dw CATERPIE,WEEDLE,CATERPIE
	db 0, 0

	db 9
	dw WEEDLE,KAKUNA,CATERPIE,METAPOD
	db 0, 0

	db 11
	dw CATERPIE,METAPOD
	db 0, 0

	db 11
	dw WEEDLE,KAKUNA
	db 0, 0

	db 10
	dw CATERPIE,METAPOD,CATERPIE
	db 0, 0

	db 14
	dw CATERPIE,WEEDLE
	db 0, 0

	db 16
	dw WEEDLE,CATERPIE,WEEDLE
	db 0, 0

	db 20
	dw BUTTERFREE
	db 0, 0

	db 18
	dw METAPOD,CATERPIE,VENONAT
	db 0, 0

	db 19
	dw BEEDRILL,BEEDRILL
	db 0, 0

	db 20
	dw CATERPIE,WEEDLE,VENONAT
	db 0, 0

LassData:
; Route 3
	db 9
	dw PIDGEY,PIDGEY
	db 0, 0

	db 10
	dw RATTATA,NIDORAN_M
	db 0, 0

	db 14
	dw JIGGLYPUFF
	db 0, 0

	db 31
	dw PARAS,PARAS,PARASECT
	db 0, 0

	db 11
	dw ODDISH,BELLSPROUT
	db 0, 0

	db 14
	dw CLEFAIRY
	db 0, 0

	db 16
	dw PIDGEY,NIDORAN_F
	db 0, 0

	db 14
	dw PIDGEY,NIDORAN_F
	db 0, 0

	db 15
	dw NIDORAN_M,NIDORAN_F
	db 0, 0

	db 13
	dw ODDISH,PIDGEY,ODDISH
	db 0, 0

	db 18
	dw PIDGEY,NIDORAN_F
	db 0, 0

	db 18
	dw RATTATA,PIKACHU
	db 0, 0

	db 23
	dw NIDORAN_F,NIDORINA
	db 0, 0

	db 24
	dw MEOWTH,MEOWTH,MEOWTH
	db 0, 0

	db 19
	dw PIDGEY,RATTATA,NIDORAN_M,MEOWTH,PIKACHU
	db 0, 0

	db 22
	dw CLEFAIRY,CLEFAIRY
	db 0, 0

	db 23
	dw BELLSPROUT,WEEPINBELL
	db 0, 0

	db 23
	dw ODDISH,GLOOM
	db 0, 0

SailorData:
	db 18
	dw MACHOP,SHELLDER
	db 0, 0

	db 17
	dw MACHOP,TENTACOOL
	db 0, 0

	db 21
	dw SHELLDER
	db 0, 0

	db 17
	dw HORSEA,SHELLDER,TENTACOOL
	db 0, 0

	db 18
	dw TENTACOOL,STARYU
	db 0, 0

	db 17
	dw HORSEA,HORSEA,HORSEA
	db 0, 0

	db 20
	dw MACHOP
	db 0, 0

	db 21
	dw PIKACHU,PIKACHU
	db 0, 0

JrTrainerMData:
	db 11
	dw DIGLETT,SANDSHREW
	db 0, 0

	db 14
	dw RATTATA,EKANS
	db 0, 0

	db 18
	dw MANKEY
	db 0, 0

	db 20
	dw SQUIRTLE
	db 0, 0

	db 16
	dw SPEAROW,RATICATE
	db 0, 0

	db 18
	dw DIGLETT,DIGLETT,SANDSHREW
	db 0, 0

	db 21
	dw GROWLITHE,CHARMANDER
	db 0, 0

	db 19
	dw RATTATA,DIGLETT,EKANS,SANDSHREW
	db 0, 0

	db 29
	dw NIDORAN_M,NIDORINO
	db 0, 0

JrTrainerFData:
	db 19
	dw GOLDEEN
	db 0, 0

	db 16
	dw RATTATA,PIKACHU
	db 0, 0

	db 16
	dw PIDGEY,PIDGEY,PIDGEY
	db 0, 0

	db 22
	dw BULBASAUR
	db 0, 0

	db 18
	dw ODDISH,BELLSPROUT,ODDISH,BELLSPROUT
	db 0, 0

	db 23
	dw MEOWTH
	db 0, 0

	db 20
	dw PIKACHU,CLEFAIRY
	db 0, 0

	db 21
	dw PIDGEY,PIDGEOTTO
	db 0, 0

	db 21
	dw JIGGLYPUFF,PIDGEY,MEOWTH
	db 0, 0

	db 22
	dw ODDISH,BULBASAUR
	db 0, 0

	db 24
	dw BULBASAUR,IVYSAUR
	db 0, 0

	db 24
	dw PIDGEY,MEOWTH,RATTATA,PIKACHU,MEOWTH
	db 0, 0

	db 30
	dw POLIWAG,POLIWAG
	db 0, 0

	db 27
	dw PIDGEY,MEOWTH,PIDGEY,PIDGEOTTO
	db 0, 0

	db 28
	dw GOLDEEN,POLIWAG,HORSEA
	db 0, 0

	db 31
	dw GOLDEEN,SEAKING
	db 0, 0

	db 22
	dw BELLSPROUT,CLEFAIRY
	db 0, 0

	db 20
	dw MEOWTH,ODDISH,PIDGEY
	db 0, 0

	db 19
	dw PIDGEY,RATTATA,RATTATA,BELLSPROUT
	db 0, 0

	db 28
	dw GLOOM,ODDISH,ODDISH
	db 0, 0

	db 29
	dw PIKACHU,RAICHU
	db 0, 0

	db 33
	dw CLEFAIRY
	db 0, 0

	db 29
	dw BELLSPROUT,ODDISH,TANGELA
	db 0, 0

	db 30
	dw TENTACOOL,HORSEA,SEEL
	db 0, 0

PokemaniacData:
	db 30
	dw RHYHORN,LICKITUNG
	db 0, 0

	db 20
	dw CUBONE,SLOWPOKE
	db 0, 0

	db 20
	dw SLOWPOKE,SLOWPOKE,SLOWPOKE
	db 0, 0

	db 22
	dw CHARMANDER,CUBONE
	db 0, 0

	db 25
	dw SLOWPOKE
	db 0, 0

	db 40
	dw CHARMELEON,LAPRAS,LICKITUNG
	db 0, 0

	db 23
	dw CUBONE,SLOWPOKE
	db 0, 0

SuperNerdData:
	db 11
	dw MAGNEMITE,VOLTORB
	db 0, 0

	db 12
	dw GRIMER,VOLTORB,KOFFING
	db 0, 0

	db 20
	dw VOLTORB,KOFFING,VOLTORB,MAGNEMITE
	db 0, 0

	db 22
	dw GRIMER,MUK,GRIMER
	db 0, 0

	db 26
	dw KOFFING
	db 0, 0

	db 22
	dw KOFFING,MAGNEMITE,WEEZING
	db 0, 0

	db 20
	dw MAGNEMITE,MAGNEMITE,KOFFING,MAGNEMITE
	db 0, 0

	db 24
	dw MAGNEMITE,VOLTORB
	db 0, 0

	db 36
	dw VULPIX,VULPIX,NINETALES
	db 0, 0

	db 34
	dw PONYTA,CHARMANDER,VULPIX,GROWLITHE
	db 0, 0

	db 41
	dw RAPIDASH
	db 0, 0

	db 37
	dw GROWLITHE,VULPIX
	db 0, 0

HikerData:
	db 10
	dw GEODUDE,GEODUDE,ONIX
	db 0, 0

	db 15
	dw MACHOP,GEODUDE
	db 0, 0

	db 13
	dw GEODUDE,GEODUDE,MACHOP,GEODUDE
	db 0, 0

	db 17
	dw ONIX
	db 0, 0

	db 21
	dw GEODUDE,ONIX
	db 0, 0

	db 20
	dw GEODUDE,MACHOP,GEODUDE
	db 0, 0

	db 21
	dw GEODUDE,ONIX
	db 0, 0

	db 19
	dw ONIX,GRAVELER
	db 0, 0

	db 21
	dw GEODUDE,GEODUDE,GRAVELER
	db 0, 0

	db 25
	dw GEODUDE
	db 0, 0

	db 20
	dw MACHOP,ONIX
	db 0, 0

	db 19
	dw GEODUDE,MACHOP,GEODUDE,GEODUDE
	db 0, 0

	db 20
	dw ONIX,ONIX,GEODUDE
	db 0, 0

	db 21
	dw GEODUDE,GRAVELER
	db 0, 0

BikerData:
	db 28
	dw KOFFING,KOFFING,KOFFING
	db 0, 0

	db 29
	dw KOFFING,GRIMER
	db 0, 0

	db 25
	dw KOFFING,KOFFING,WEEZING,KOFFING,GRIMER
	db 0, 0

	db 28
	dw KOFFING,GRIMER,WEEZING
	db 0, 0

	db 29
	dw GRIMER,KOFFING
	db 0, 0

	db 33
	dw WEEZING
	db 0, 0

	db 26
	dw GRIMER,GRIMER,GRIMER,GRIMER
	db 0, 0

	db 28
	dw WEEZING,KOFFING,WEEZING
	db 0, 0

	db 33
	dw MUK
	db 0, 0

	db 29
	dw VOLTORB,VOLTORB
	db 0, 0

	db 29
	dw WEEZING,MUK
	db 0, 0

	db 25
	dw KOFFING,WEEZING,KOFFING,KOFFING,WEEZING
	db 0, 0

	db 26
	dw KOFFING,KOFFING,GRIMER,KOFFING
	db 0, 0

	db 28
	dw GRIMER,GRIMER,KOFFING
	db 0, 0

	db 29
	dw KOFFING,MUK
	db 0, 0

BurglarData:
	db 29
	dw GROWLITHE,VULPIX
	db 0, 0

	db 33
	dw GROWLITHE
	db 0, 0

	db 28
	dw VULPIX,CHARMANDER,PONYTA
	db 0, 0

	db 36
	dw GROWLITHE,VULPIX,NINETALES
	db 0, 0

	db 41
	dw PONYTA
	db 0, 0

	db 37
	dw VULPIX,GROWLITHE
	db 0, 0

	db 34
	dw CHARMANDER,CHARMELEON
	db 0, 0

	db 38
	dw NINETALES
	db 0, 0

	db 34
	dw GROWLITHE,PONYTA
	db 0, 0

EngineerData:
	db 21
	dw VOLTORB,MAGNEMITE
	db 0, 0

	db 21
	dw MAGNEMITE
	db 0, 0

	db 18
	dw MAGNEMITE,MAGNEMITE,MAGNETON
	db 0, 0

Juggler1Data:
; none
FisherData:
	db 17
	dw GOLDEEN,TENTACOOL,GOLDEEN
	db 0, 0

	db 17
	dw TENTACOOL,STARYU,SHELLDER
	db 0, 0

	db 22
	dw GOLDEEN,POLIWAG,GOLDEEN
	db 0, 0

	db 24
	dw TENTACOOL,GOLDEEN
	db 0, 0

	db 27
	dw GOLDEEN
	db 0, 0

	db 21
	dw POLIWAG,SHELLDER,GOLDEEN,HORSEA
	db 0, 0

	db 28
	dw SEAKING,GOLDEEN,SEAKING,SEAKING
	db 0, 0

	db 31
	dw SHELLDER,CLOYSTER
	db 0, 0

	db 27
	dw MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP
	db 0, 0

	db 33
	dw SEAKING,GOLDEEN
	db 0, 0

	db 24
	dw MAGIKARP,MAGIKARP
	db 0, 0

SwimmerData:
	db 16
	dw HORSEA,SHELLDER
	db 0, 0

	db 30
	dw TENTACOOL,SHELLDER
	db 0, 0

	db 29
	dw GOLDEEN,HORSEA,STARYU
	db 0, 0

	db 30
	dw POLIWAG,POLIWHIRL
	db 0, 0

	db 27
	dw HORSEA,TENTACOOL,TENTACOOL,GOLDEEN
	db 0, 0

	db 29
	dw GOLDEEN,SHELLDER,SEAKING
	db 0, 0

	db 30
	dw HORSEA,HORSEA
	db 0, 0

	db 27
	dw TENTACOOL,TENTACOOL,STARYU,HORSEA,TENTACRUEL
	db 0, 0

	db 31
	dw SHELLDER,CLOYSTER
	db 0, 0

	db 35
	dw STARYU
	db 0, 0

	db 28
	dw HORSEA,HORSEA,SEADRA,HORSEA
	db 0, 0

	db 33
	dw SEADRA,TENTACRUEL
	db 0, 0

	db 37
	dw STARMIE
	db 0, 0

	db 33
	dw STARYU,WARTORTLE
	db 0, 0

	db 32
	dw POLIWHIRL,TENTACOOL,SEADRA
	db 0, 0

CueBallData:
	db 28
	dw MACHOP,MANKEY,MACHOP
	db 0, 0

	db 29
	dw MANKEY,MACHOP
	db 0, 0

	db 33
	dw MACHOP
	db 0, 0

	db 29
	dw MANKEY,PRIMEAPE
	db 0, 0

	db 29
	dw MACHOP,MACHOKE
	db 0, 0

	db 33
	dw MACHOKE
	db 0, 0

	db 26
	dw MANKEY,MANKEY,MACHOKE,MACHOP
	db 0, 0

	db 29
	dw PRIMEAPE,MACHOKE
	db 0, 0

	db 31
	dw TENTACOOL,TENTACOOL,TENTACRUEL
	db 0, 0

GamblerData:
	db 18
	dw POLIWAG,HORSEA
	db 0, 0

	db 18
	dw BELLSPROUT,ODDISH
	db 0, 0

	db 18
	dw VOLTORB,MAGNEMITE
	db 0, 0

	db 18
	dw GROWLITHE,VULPIX
	db 0, 0

	db 22
	dw POLIWAG,POLIWAG,POLIWHIRL
	db 0, 0

	db 22
	dw ONIX,GEODUDE,GRAVELER
	db 0, 0

	db 24
	dw GROWLITHE,VULPIX
	db 0, 0

BeautyData:
	db 21
	dw ODDISH,BELLSPROUT,ODDISH,BELLSPROUT
	db 0, 0

	db 24
	dw BELLSPROUT,BELLSPROUT
	db 0, 0

	db 26
	dw EXEGGCUTE
	db 0, 0

	db 27
	dw RATTATA,PIKACHU,RATTATA
	db 0, 0

	db 29
	dw CLEFAIRY,MEOWTH
	db 0, 0

	db 35
	dw SEAKING
	db 0, 0

	db 30
	dw SHELLDER,SHELLDER,CLOYSTER
	db 0, 0

	db 31
	dw POLIWAG,SEAKING
	db 0, 0

	db 29
	dw PIDGEOTTO,WIGGLYTUFF
	db 0, 0

	db 29
	dw BULBASAUR,IVYSAUR
	db 0, 0

	db 33
	dw WEEPINBELL,BELLSPROUT,WEEPINBELL
	db 0, 0

	db 27
	dw POLIWAG,GOLDEEN,SEAKING,GOLDEEN,POLIWAG
	db 0, 0

	db 30
	dw GOLDEEN,SEAKING
	db 0, 0

	db 29
	dw STARYU,STARYU,STARYU
	db 0, 0

	db 30
	dw SEADRA,HORSEA,SEADRA
	db 0, 0

PsychicData:
	db 31
	dw KADABRA,SLOWPOKE,MR_MIME,KADABRA
	db 0, 0

	db 34
	dw MR_MIME,KADABRA
	db 0, 0

	db 33
	dw SLOWPOKE,SLOWPOKE,SLOWBRO
	db 0, 0

	db 38
	dw SLOWBRO
	db 0, 0

RockerData:
	db 20
	dw VOLTORB,MAGNEMITE,VOLTORB
	db 0, 0

	db 29
	dw VOLTORB,ELECTRODE
	db 0, 0

JugglerData:
	db 29
	dw KADABRA,MR_MIME
	db 0, 0

	db 41
	dw DROWZEE,HYPNO,KADABRA,KADABRA
	db 0, 0

	db 31
	dw DROWZEE,DROWZEE,KADABRA,DROWZEE
	db 0, 0

	db 34
	dw DROWZEE,HYPNO
	db 0, 0

	db 48
	dw MR_MIME
	db 0, 0

	db 33
	dw HYPNO
	db 0, 0

	db 38
	dw HYPNO
	db 0, 0

	db 34
	dw DROWZEE,KADABRA
	db 0, 0

TamerData:
	db 34
	dw SANDSLASH,ARBOK
	db 0, 0

	db 33
	dw ARBOK,SANDSLASH,ARBOK
	db 0, 0

	db 43
	dw RHYHORN
	db 0, 0

	db 39
	dw ARBOK,TAUROS
	db 0, 0

	db 44
	dw PERSIAN,GOLDUCK
	db 0, 0

	db 42
	dw RHYHORN,PRIMEAPE,ARBOK,TAUROS
	db 0, 0

BirdKeeperData:
	db 29
	dw PIDGEY,PIDGEOTTO
	db 0, 0

	db 25
	dw SPEAROW,PIDGEY,PIDGEY,SPEAROW,SPEAROW
	db 0, 0

	db 26
	dw PIDGEY,PIDGEOTTO,SPEAROW,FEAROW
	db 0, 0

	db 33
	dw FARFETCHD
	db 0, 0

	db 29
	dw SPEAROW,FEAROW
	db 0, 0

	db 26
	dw PIDGEOTTO,FARFETCHD,DODUO,PIDGEY
	db 0, 0

	db 28
	dw DODRIO,DODUO,DODUO
	db 0, 0

	db 29
	dw SPEAROW,FEAROW
	db 0, 0

	db 34
	dw DODRIO
	db 0, 0

	db 26
	dw SPEAROW,SPEAROW,FEAROW,SPEAROW
	db 0, 0

	db 30
	dw FEAROW,FEAROW,PIDGEOTTO
	db 0, 0

	db 39
	dw PIDGEOTTO,PIDGEOTTO,PIDGEY,PIDGEOTTO
	db 0, 0

	db 42
	dw FARFETCHD,FEAROW
	db 0, 0

	db 28
	dw PIDGEY,DODUO,PIDGEOTTO
	db 0, 0

	db 26
	dw PIDGEY,SPEAROW,PIDGEY,FEAROW
	db 0, 0

	db 29
	dw PIDGEOTTO,FEAROW
	db 0, 0

	db 28
	dw SPEAROW,DODUO,FEAROW
	db 0, 0

BlackbeltData:
	db 37
	dw HITMONLEE,HITMONCHAN
	db 0, 0

	db 31
	dw MANKEY,MANKEY,PRIMEAPE
	db 0, 0

	db 32
	dw MACHOP,MACHOKE
	db 0, 0

	db 36
	dw PRIMEAPE
	db 0, 0

	db 31
	dw MACHOP,MANKEY,PRIMEAPE
	db 0, 0

	db 40
	dw MACHOP,MACHOKE
	db 0, 0

	db 43
	dw MACHOKE
	db 0, 0

	db 38
	dw MACHOKE,MACHOP,MACHOKE
	db 0, 0

	db 43
	dw MACHOKE,MACHOP,MACHOKE
	db 0, 0

Green1Data:
	db 5
	dw SQUIRTLE
	db 0, 0

	db 5
	dw BULBASAUR
	db 0, 0

	db 5
	dw CHARMANDER
	db 0, 0

	db $FF
	dbw 9,PIDGEY
	dbw 8,SQUIRTLE
	db 0

	db $FF
	dbw 9,PIDGEY
	dbw 8,BULBASAUR
	db 0

	db $FF
	dbw 9,PIDGEY
	dbw 8,CHARMANDER
	db 0

	db $FF
	dbw 18,PIDGEOTTO
	dbw 15,ABRA
	dbw 15,RATTATA
	dbw 17,SQUIRTLE
	db 0

	db $FF
	dbw 18,PIDGEOTTO
	dbw 15,ABRA
	dbw 15,RATTATA
	dbw 17,BULBASAUR
	db 0

	db $FF
	dbw 18,PIDGEOTTO
	dbw 15,ABRA
	dbw 15,RATTATA
	dbw 17,CHARMANDER
	db 0

ProfOakData:
	db $FF
	dbw 66,TAUROS
	dbw 67,EXEGGUTOR
	dbw 68,ARCANINE
	dbw 69,BLASTOISE
	dbw 70,GYARADOS
	db 0

	db $FF
	dbw 66,TAUROS
	dbw 67,EXEGGUTOR
	dbw 68,ARCANINE
	dbw 69,VENUSAUR
	dbw 70,GYARADOS
	db 0

	db $FF
	dbw 66,TAUROS
	dbw 67,EXEGGUTOR
	dbw 68,ARCANINE
	dbw 69,CHARIZARD
	dbw 70,GYARADOS
	db 0

ChiefData:
; none
ScientistData:
	db 34
	dw KOFFING,VOLTORB
	db 0, 0

	db 26
	dw GRIMER,WEEZING,KOFFING,WEEZING
	db 0, 0

	db 28
	dw MAGNEMITE,VOLTORB,MAGNETON
	db 0, 0

	db 29
	dw ELECTRODE,WEEZING
	db 0, 0

	db 33
	dw ELECTRODE
	db 0, 0

	db 26
	dw MAGNETON,KOFFING,WEEZING,MAGNEMITE
	db 0, 0

	db 25
	dw VOLTORB,KOFFING,MAGNETON,MAGNEMITE,KOFFING
	db 0, 0

	db 29
	dw ELECTRODE,MUK
	db 0, 0

	db 29
	dw GRIMER,ELECTRODE
	db 0, 0

	db 28
	dw VOLTORB,KOFFING,MAGNETON
	db 0, 0

	db 29
	dw MAGNEMITE,KOFFING
	db 0, 0

	db 33
	dw MAGNEMITE,MAGNETON,VOLTORB
	db 0, 0

	db 34
	dw MAGNEMITE,ELECTRODE
	db 0, 0

GiovanniData:
	db $FF
	dbw 25,ONIX
	dbw 24,RHYHORN
	dbw 29,KANGASKHAN
	db 0

	db $FF
	dbw 37,NIDORINO
	dbw 35,KANGASKHAN
	dbw 37,RHYHORN
	dbw 41,NIDOQUEEN
	db 0

	db $FF
	dbw 45,RHYHORN
	dbw 42,DUGTRIO
	dbw 44,NIDOQUEEN
	dbw 45,NIDOKING
	dbw 50,RHYDON
	db 0

RocketData:
	db 13
	dw RATTATA,ZUBAT
	db 0, 0

	db 11
	dw SANDSHREW,RATTATA,ZUBAT
	db 0, 0

	db 12
	dw ZUBAT,EKANS
	db 0, 0

	db 16
	dw RATICATE
	db 0, 0

	db 17
	dw MACHOP,DROWZEE
	db 0, 0

	db 15
	dw EKANS,ZUBAT
	db 0, 0

	db 20
	dw RATICATE,ZUBAT
	db 0, 0

	db 21
	dw DROWZEE,MACHOP
	db 0, 0

	db 21
	dw RATICATE,RATICATE
	db 0, 0

	db 20
	dw GRIMER,KOFFING,KOFFING
	db 0, 0

	db 19
	dw RATTATA,RATICATE,RATICATE,RATTATA
	db 0, 0

	db 22
	dw GRIMER,KOFFING
	db 0, 0

	db 17
	dw ZUBAT,KOFFING,GRIMER,ZUBAT,RATICATE
	db 0, 0

	db 20
	dw RATTATA,RATICATE,DROWZEE
	db 0, 0

	db 21
	dw MACHOP,MACHOP
	db 0, 0

	db 23
	dw SANDSHREW,EKANS,SANDSLASH
	db 0, 0

	db 23
	dw EKANS,SANDSHREW,ARBOK
	db 0, 0

	db 21
	dw KOFFING,ZUBAT
	db 0, 0

	db 25
	dw ZUBAT,ZUBAT,GOLBAT
	db 0, 0

	db 26
	dw KOFFING,DROWZEE
	db 0, 0

	db 23
	dw ZUBAT,RATTATA,RATICATE,ZUBAT
	db 0, 0

	db 26
	dw DROWZEE,KOFFING
	db 0, 0

	db 29
	dw CUBONE,ZUBAT
	db 0, 0

	db 25
	dw GOLBAT,ZUBAT,ZUBAT,RATICATE,ZUBAT
	db 0, 0

	db 28
	dw RATICATE,HYPNO,RATICATE
	db 0, 0

	db 29
	dw MACHOP,DROWZEE
	db 0, 0

	db 28
	dw EKANS,ZUBAT,CUBONE
	db 0, 0

	db 33
	dw ARBOK
	db 0, 0

	db 33
	dw HYPNO
	db 0, 0

	db 29
	dw MACHOP,MACHOKE
	db 0, 0

	db 28
	dw ZUBAT,ZUBAT,GOLBAT
	db 0, 0

	db 26
	dw RATICATE,ARBOK,KOFFING,GOLBAT
	db 0, 0

	db 29
	dw CUBONE,CUBONE
	db 0, 0

	db 29
	dw SANDSHREW,SANDSLASH
	db 0, 0

	db 26
	dw RATICATE,ZUBAT,GOLBAT,RATTATA
	db 0, 0

	db 28
	dw WEEZING,GOLBAT,KOFFING
	db 0, 0

	db 28
	dw DROWZEE,GRIMER,MACHOP
	db 0, 0

	db 28
	dw GOLBAT,DROWZEE,HYPNO
	db 0, 0

	db 33
	dw MACHOKE
	db 0, 0

	db 25
	dw RATTATA,RATTATA,ZUBAT,RATTATA,EKANS
	db 0, 0

	db 32
	dw CUBONE,DROWZEE,MAROWAK
	db 0, 0

CooltrainerMData:
	db 39
	dw NIDORINO,NIDOKING
	db 0, 0

	db 43
	dw EXEGGUTOR,CLOYSTER,ARCANINE
	db 0, 0

	db 43
	dw KINGLER,TENTACRUEL,BLASTOISE
	db 0, 0

	db 45
	dw KINGLER,STARMIE
	db 0, 0

	db 42
	dw IVYSAUR,WARTORTLE,CHARMELEON,CHARIZARD
	db 0, 0

	db 44
	dw IVYSAUR,WARTORTLE,CHARMELEON
	db 0, 0

	db 49
	dw NIDOKING
	db 0, 0

	db 44
	dw KINGLER,CLOYSTER
	db 0, 0

	db 39
	dw SANDSLASH,DUGTRIO
	db 0, 0

	db 43
	dw RHYHORN
	db 0, 0

CooltrainerFData:
	db 24
	dw WEEPINBELL,GLOOM,IVYSAUR
	db 0, 0

	db 43
	dw BELLSPROUT,WEEPINBELL,VICTREEBEL
	db 0, 0

	db 43
	dw PARASECT,DEWGONG,CHANSEY
	db 0, 0

	db 46
	dw VILEPLUME,BUTTERFREE
	db 0, 0

	db 44
	dw PERSIAN,NINETALES
	db 0, 0

	db 45
	dw IVYSAUR,VENUSAUR
	db 0, 0

	db 45
	dw NIDORINA,NIDOQUEEN
	db 0, 0

	db 43
	dw PERSIAN,NINETALES,RAICHU
	db 0, 0

BrunoData:
	db $FF
	dbw 53,ONIX
	dbw 55,HITMONCHAN
	dbw 55,HITMONLEE
	dbw 56,ONIX
	dbw 58,MACHAMP
	db 0

BrockData:
	db $FF
	dbw 12,GEODUDE
	dbw 14,ONIX
	db 0

MistyData:
	db $FF
	dbw 18,STARYU
	dbw 21,STARMIE
	db 0

LtSurgeData:
	db $FF
	dbw 21,VOLTORB
	dbw 18,PIKACHU
	dbw 24,RAICHU
	db 0

ErikaData:
	db $FF
	dbw 29,VICTREEBEL
	dbw 24,TANGELA
	dbw 29,VILEPLUME
	db 0

KogaData:
	db $FF
	dbw 37,KOFFING
	dbw 39,MUK
	dbw 37,KOFFING
	dbw 43,WEEZING
	db 0

BlaineData:
	db $FF
	dbw 42,GROWLITHE
	dbw 40,PONYTA
	dbw 42,RAPIDASH
	dbw 47,ARCANINE
	db 0

SabrinaData:
	db $FF
	dbw 38,KADABRA
	dbw 37,MR_MIME
	dbw 38,VENOMOTH
	dbw 43,ALAKAZAM
	db 0

GentlemanData:
	db 18
	dw GROWLITHE,GROWLITHE
	db 0, 0

	db 19
	dw NIDORAN_M,NIDORAN_F
	db 0, 0

	db 23
	dw PIKACHU
	db 0, 0

	db 48
	dw PRIMEAPE
	db 0, 0

	db 17
	dw GROWLITHE,PONYTA
	db 0, 0

Green2Data:
	db $FF
	dbw 19,PIDGEOTTO
	dbw 16,RATICATE
	dbw 18,KADABRA
	dbw 20,WARTORTLE
	db 0

	db $FF
	dbw 19,PIDGEOTTO
	dbw 16,RATICATE
	dbw 18,KADABRA
	dbw 20,IVYSAUR
	db 0

	db $FF
	dbw 19,PIDGEOTTO
	dbw 16,RATICATE
	dbw 18,KADABRA
	dbw 20,CHARMELEON
	db 0

	db $FF
	dbw 25,PIDGEOTTO
	dbw 23,GROWLITHE
	dbw 22,EXEGGCUTE
	dbw 20,KADABRA
	dbw 25,WARTORTLE
	db 0

	db $FF
	dbw 25,PIDGEOTTO
	dbw 23,GYARADOS
	dbw 22,GROWLITHE
	dbw 20,KADABRA
	dbw 25,IVYSAUR
	db 0

	db $FF
	dbw 25,PIDGEOTTO
	dbw 23,EXEGGCUTE
	dbw 22,GYARADOS
	dbw 20,KADABRA
	dbw 25,CHARMELEON
	db 0

	db $FF
	dbw 37,PIDGEOT
	dbw 38,GROWLITHE
	dbw 35,EXEGGCUTE
	dbw 35,ALAKAZAM
	dbw 40,BLASTOISE
	db 0

	db $FF
	dbw 37,PIDGEOT
	dbw 38,GYARADOS
	dbw 35,GROWLITHE
	dbw 35,ALAKAZAM
	dbw 40,VENUSAUR
	db 0

	db $FF
	dbw 37,PIDGEOT
	dbw 38,EXEGGCUTE
	dbw 35,GYARADOS
	dbw 35,ALAKAZAM
	dbw 40,CHARIZARD
	db 0

	db $FF
	dbw 47,PIDGEOT
	dbw 45,RHYHORN
	dbw 45,GROWLITHE
	dbw 47,EXEGGCUTE
	dbw 50,ALAKAZAM
	dbw 53,BLASTOISE
	db 0

	db $FF
	dbw 47,PIDGEOT
	dbw 45,RHYHORN
	dbw 45,GYARADOS
	dbw 47,GROWLITHE
	dbw 50,ALAKAZAM
	dbw 53,VENUSAUR
	db 0

	db $FF
	dbw 47,PIDGEOT
	dbw 45,RHYHORN
	dbw 45,EXEGGCUTE
	dbw 47,GYARADOS
	dbw 50,ALAKAZAM
	dbw 53,CHARIZARD
	db 0

Green3Data:
	db $FF
	dbw 61,PIDGEOT
	dbw 59,ALAKAZAM
	dbw 61,RHYDON
	dbw 61,ARCANINE
	dbw 63,EXEGGUTOR
	dbw 65,BLASTOISE
	db 0

	db $FF
	dbw 61,PIDGEOT
	dbw 59,ALAKAZAM
	dbw 61,RHYDON
	dbw 61,GYARADOS
	dbw 63,ARCANINE
	dbw 65,VENUSAUR
	db 0

	db $FF
	dbw 61,PIDGEOT
	dbw 59,ALAKAZAM
	dbw 61,RHYDON
	dbw 61,EXEGGUTOR
	dbw 63,GYARADOS
	dbw 65,CHARIZARD
	db 0

LoreleiData:
	db $FF
	dbw 54,DEWGONG
	dbw 53,CLOYSTER
	dbw 54,SLOWBRO
	dbw 56,JYNX
	dbw 56,LAPRAS
	db 0

ChannelerData:
	db 22
	dw GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 23
	dw GASTLY,GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 23
	dw GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 24
	dw HAUNTER
	db 0, 0

	db 22
	dw GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 23
	dw GASTLY,GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 22
	dw GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 23
	dw HAUNTER
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 22
	dw GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 22
	dw HAUNTER
	db 0, 0

	db 22
	dw GASTLY,GASTLY,GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 24
	dw GASTLY
	db 0, 0

	db 34
	dw GASTLY,HAUNTER
	db 0, 0

	db 38
	dw HAUNTER
	db 0, 0

	db 33
	dw GASTLY,GASTLY,HAUNTER
	db 0, 0

AgathaData:
	db $FF
	dbw 56,GENGAR
	dbw 56,GOLBAT
	dbw 55,HAUNTER
	dbw 58,ARBOK
	dbw 60,GENGAR
	db 0

LanceData:
	db $FF
	dbw 58,GYARADOS
	dbw 56,DRAGONAIR
	dbw 56,DRAGONAIR
	dbw 60,AERODACTYL
	dbw 62,DRAGONITE
	db 0
