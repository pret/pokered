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
	dw UnusedJugglerData
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

; if first byte != $FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == $FF, then
	; first byte is $FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
; Route 3
	db 5, RATTATA, EKANS, 0
	db 5, SPEAROW, 0
; Mt. Moon 1F
	db 5, RATTATA, RATTATA, ZUBAT, 0
; Route 24
	db 5, RATTATA, EKANS, ZUBAT, 0
; Route 25
	db 5, RATTATA, SPEAROW, 0
	db 5, SLOWPOKE, 0
	db 5, EKANS, SANDSHREW, 0
; SS Anne 1F Rooms
	db $FF, 5, DODUO, 0
; Route 11
	db 5, EKANS, 0
	db 5, SANDSHREW, ZUBAT, 0
	db 5, RATTATA, RATTATA, RATTATA, 0
	db 5, NIDORAN_M, NIDORAN_M, 0
; Unused
	db 5, SPEAROW, RATTATA, RATTATA, SPEAROW, 0

BugCatcherData:
; Viridian Forest
	db 5, WEEDLE, CATERPIE, 0
	db 5, WEEDLE, WEEDLE, WEEDLE, 0
	db 5, WEEDLE, 0
; Route 3
	db 5, CATERPIE, WEEDLE, CATERPIE, 0
	db 5, WEEDLE, WEEDLE, CATERPIE, CATERPIE, 0
	db 5, CATERPIE, CATERPIE, 0
; Mt. Moon 1F
	db 5, WEEDLE, WEEDLE, 0
	db 5, CATERPIE, CATERPIE, CATERPIE, 0
; Route 24
	db 5, CATERPIE, WEEDLE, 0
; Route 6
	db 5, WEEDLE, CATERPIE, WEEDLE, 0
	db $FF, 5, VENONAT, 0
; Unused
	db 5, CATERPIE, CATERPIE, VENONAT, 0
; Route 9
	db 5, WEEDLE, WEEDLE, 0
	db 5, CATERPIE, WEEDLE, VENONAT, 0

LassData:
; Route 3
	db 5, PIDGEY, PIDGEY, 0
	db 5, RATTATA, NIDORAN_M, 0
	db $FF, 5, JIGGLYPUFF, 0
; Route 4
	db 5, PARAS, PARAS, PARAS, 0
; Mt. Moon 1F
	db 5, ODDISH, BELLSPROUT, 0
	db $FF, 5, CLEFAIRY, 0
; Route 24
	db 5, PIDGEY, NIDORAN_F, 0
	db 5, PIDGEY, NIDORAN_F, 0
; Route 25
	db 5, NIDORAN_M, NIDORAN_F, 0
	db 5, ODDISH, PIDGEY, ODDISH, 0
; SS Anne 1F Rooms
	db 5, PIDGEY, NIDORAN_F, 0
; SS Anne 2F Rooms
	db 5, RATTATA, PIKACHU, 0
; Route 8
	db 5, NIDORAN_F, NIDORAN_F, 0
	db 5, MEOWTH, MEOWTH, MEOWTH, 0
	db 5, PIDGEY, RATTATA, NIDORAN_M, MEOWTH, PIKACHU, 0
	db 5, CLEFAIRY, CLEFAIRY, 0
; Celadon Gym
	db 5, BELLSPROUT, BELLSPROUT, 0
	db 5, ODDISH, ODDISH, 0

SailorData:
; SS Anne Stern
	db 5, MACHOP, SHELLDER, 0
	db 5, MACHOP, TENTACOOL, 0
; SS Anne B1F Rooms
	db 5, SHELLDER, 0
	db 5, HORSEA, SHELLDER, TENTACOOL, 0
	db 5, TENTACOOL, STARYU, 0
	db 5, HORSEA, HORSEA, HORSEA, 0
	db 5, MACHOP, 0
; Vermilion Gym
	db 5, PIKACHU, PIKACHU, 0

JrTrainerMData:
; Pewter Gym
	db 5, DIGLETT, SANDSHREW, 0
; Route 24/Route 25
	db 5, RATTATA, EKANS, 0
; Route 24
	db 5, MANKEY, 0
; Route 6
	db 5, SQUIRTLE, 0
	db 5, SPEAROW, RATTATA, 0
; Unused
	db 5, DIGLETT, DIGLETT, SANDSHREW, 0
; Route 9
	db 5, GROWLITHE, CHARMANDER, 0
	db 5, RATTATA, DIGLETT, EKANS, SANDSHREW, 0
; Route 12
	db 5, NIDORAN_M, CLEFAIRY, 0

JrTrainerFData:
; Cerulean Gym
	db $FF, 5, GOLDEEN, 0
; Route 6
	db 5, RATTATA, PIKACHU, 0
	db 5, PIDGEY, PIDGEY, PIDGEY, 0
; Unused
	db 5, BULBASAUR, 0
; Route 9
	db 5, ODDISH, BELLSPROUT, ODDISH, BELLSPROUT, 0
	db 5, MEOWTH, 0
; Route 10
	db 5, PIKACHU, CLEFAIRY, 0
	db 5, PIDGEY, PIDGEY, 0
; Rock Tunnel B1F
	db 5, JIGGLYPUFF, PIDGEY, MEOWTH, 0
	db 5, ODDISH, BULBASAUR, 0
; Celadon Gym
	db 5, BULBASAUR, BULBASAUR, 0
; Route 13
	db 5, PIDGEY, MEOWTH, RATTATA, PIKACHU, MEOWTH, 0
	db 5, POLIWAG, POLIWAG, 0
	db 5, PIDGEY, MEOWTH, PIDGEY, PIDGEY, 0
	db 5, GOLDEEN, POLIWAG, HORSEA, 0
; Route 20
	db 5, GOLDEEN, GOLDEEN, 0
; Rock Tunnel 1F
	db 5, BELLSPROUT, CLEFAIRY, 0
	db 5, MEOWTH, ODDISH, PIDGEY, 0
	db 5, PIDGEY, RATTATA, RATTATA, BELLSPROUT, 0
; Route 15
	db 5, ODDISH, ODDISH, ODDISH, 0
	db 5, PIKACHU, PIKACHU, 0
	db 5, CLEFAIRY, 0
	db 5, BELLSPROUT, ODDISH, EXEGGCUTE, 0 ; bellsprout, oddish, tangela
; Route 20
	db 5, TENTACOOL, HORSEA, SEEL, 0

PokemaniacData:
; Route 10
	db 5, RHYHORN, KRABBY, 0 ; rhyhorn, lickitung
	db 5, CUBONE, SLOWPOKE, 0
; Rock Tunnel B1F
	db 5, SLOWPOKE, SLOWPOKE, SLOWPOKE, 0
	db 5, CHARMANDER, CUBONE, 0
	db 5, SLOWPOKE, 0
; Victory Road 2F
	db 5, CHARMANDER, SEEL, EKANS, 0 ; CHARMANDER, lapras, lickitung
; Rock Tunnel 1F
	db 5, CUBONE, SLOWPOKE, 0

SuperNerdData:
; Mt. Moon 1F
	db 5, MAGNEMITE, VOLTORB, 0
; Mt. Moon B2F
	db 5, GRIMER, VOLTORB, KOFFING, 0
; Route 8
	db 5, VOLTORB, KOFFING, VOLTORB, MAGNEMITE, 0
	db 5, GRIMER, GRIMER, GRIMER, 0
	db 5, KOFFING, 0
; Unused
	db 5, KOFFING, MAGNEMITE, KOFFING, 0
	db 5, MAGNEMITE, MAGNEMITE, KOFFING, MAGNEMITE, 0
	db 5, MAGNEMITE, VOLTORB, 0
; Cinnabar Gym
	db 5, VULPIX, VULPIX, VULPIX, 0
	db 5, PONYTA, CHARMANDER, VULPIX, GROWLITHE, 0
	db 5, PONYTA, 0
	db 5, GROWLITHE, VULPIX, 0

HikerData:
; Mt. Moon 1F
	db 5, GEODUDE, GEODUDE, GEODUDE, 0 ; geodude, geodude, onix
; Route 25
	db 5, MACHOP, GEODUDE, 0
	db 5, GEODUDE, GEODUDE, MACHOP, GEODUDE, 0
	db 5, RHYHORN, 0 ; onix
; Route 9
	db 5, GEODUDE, ZUBAT, 0 ; geodude, onix
	db 5, GEODUDE, MACHOP, GEODUDE, 0
; Route 10
	db 5, GEODUDE, ZUBAT, 0 ; geodude, onix
	db 5, ZUBAT, GEODUDE, 0 ; onix, graveler
; Rock Tunnel B1F
	db $FF, 5, GEODUDE, 5, GEODUDE, 5, GEODUDE, 0
	db $FF, 5, GEODUDE, 0
; Route 9/Rock Tunnel B1F
	db 5, MACHOP, ZUBAT, 0 ; machop, onix
; Rock Tunnel 1F
	db 5, GEODUDE, MACHOP, GEODUDE, GEODUDE, 0
	db 5, OMANYTE, KABUTO, GEODUDE, 0 ; onix, onix, geodude
	db 5, GEODUDE, GEODUDE, 0

BikerData:
; Route 13
	db 5, KOFFING, KOFFING, KOFFING, 0
; Route 14
	db 5, KOFFING, GRIMER, 0
; Route 15
	db 5, KOFFING, KOFFING, KOFFING, KOFFING, GRIMER, 0
	db 5, KOFFING, GRIMER, KOFFING, 0
; Route 16
	db 5, GRIMER, KOFFING, 0
	db 5, KOFFING, 0
	db 5, GRIMER, GRIMER, GRIMER, GRIMER, 0
; Route 17
	; From https://www.smogon.com/smog/issue27/glitch:
	; 0E:5FC2 is offset of the ending 0 for this first Biker on Route 17.
	; BaseStats + (BASE_DATA_SIZE) * (000 - 1) = $5FC2;
	; that's the formula from GetMonHeader for the base stats of mon #000.
	; (BaseStats = $43DE and BANK(BaseStats) = $0E.)
	; Finally, PokedexOrder lists 0 as the dex ID for every MissingNo.
	; The result is that this data gets interpreted as the base stats
	; for MissingNo: 0, 33, GRIMER, 0, 29, VOLTORB, VOLTORB, 0, ..., 28, GRIMER, GRIMER.
	db 5, KOFFING, KOFFING, KOFFING, 0
	db 5, GRIMER, 0
	db 5, VOLTORB, VOLTORB, 0
	db 5, KOFFING, GRIMER, 0
	db 5, KOFFING, KOFFING, KOFFING, KOFFING, KOFFING, 0
; Route 14
	db 5, KOFFING, KOFFING, GRIMER, KOFFING, 0
	db 5, GRIMER, GRIMER, KOFFING, 0
	db 5, KOFFING, GRIMER, 0

BurglarData:
; Unused
	db 5, GROWLITHE, VULPIX, 0
	db 5, GROWLITHE, 0
	db 5, VULPIX, CHARMANDER, PONYTA, 0
; Cinnabar Gym
	db 5, GROWLITHE, VULPIX, VULPIX, 0
	db 5, PONYTA, 0
	db 5, VULPIX, GROWLITHE, 0
; Mansion 2F
	db 5, CHARMANDER, CHARMANDER, 0
; Mansion 3F
	db 5, VULPIX, 0
; Mansion B1F
	db 5, GROWLITHE, PONYTA, 0

EngineerData:
; Unused
	db 5, VOLTORB, MAGNEMITE, 0
; Route 11
	db 5, MAGNEMITE, 0
	db 5, MAGNEMITE, MAGNEMITE, MAGNEMITE, 0

UnusedJugglerData:
; none

FisherData:
; SS Anne 2F Rooms
	db 5, GOLDEEN, TENTACOOL, GOLDEEN, 0
; SS Anne B1F Rooms
	db 5, TENTACOOL, STARYU, SHELLDER, 0
; Route 12
	db 5, GOLDEEN, POLIWAG, GOLDEEN, 0
	db 5, TENTACOOL, GOLDEEN, 0
	db 5, GOLDEEN, 0
	db 5, POLIWAG, SHELLDER, GOLDEEN, HORSEA, 0
; Route 21
	db 5, GOLDEEN, GOLDEEN, GOLDEEN, GOLDEEN, 0
	db 5, SHELLDER, SHELLDER, 0
	db 5, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, 0
	db 5, GOLDEEN, GOLDEEN, 0
; Route 12
	db 5, MAGIKARP, MAGIKARP, 0

SwimmerData:
; Cerulean Gym
	db 5, HORSEA, SHELLDER, 0
; Route 19
	db 5, TENTACOOL, SHELLDER, 0
	db 5, GOLDEEN, HORSEA, STARYU, 0
	db 5, POLIWAG, POLIWAG, 0
	db 5, HORSEA, TENTACOOL, TENTACOOL, GOLDEEN, 0
	db 5, GOLDEEN, SHELLDER, GOLDEEN, 0
	db 5, HORSEA, HORSEA, 0
	db 5, TENTACOOL, TENTACOOL, STARYU, HORSEA, TENTACOOL, 0
; Route 20
	db 5, SHELLDER, SHELLDER, 0
	db 5, STARYU, 0
	db 5, HORSEA, HORSEA, HORSEA, HORSEA, 0
; Route 21
	db 5, HORSEA, TENTACOOL, 0
	db 5, STARYU, 0
	db 5, STARYU, SQUIRTLE, 0
	db 5, POLIWAG, TENTACOOL, HORSEA, 0

CueBallData:
; Route 16
	db 5, MACHOP, MANKEY, MACHOP, 0
	db 5, MANKEY, MACHOP, 0
	db 5, MACHOP, 0
; Route 17
	db 5, MANKEY, MANKEY, 0
	db 5, MACHOP, MACHOP, 0
	db 5, MACHOP, 0
	db 5, MANKEY, MANKEY, MACHOP, MACHOP, 0
	db 5, MANKEY, MACHOP, 0
; Route 21
	db 5, TENTACOOL, TENTACOOL, TENTACOOL, 0

GamblerData:
; Route 11
	db 5, POLIWAG, HORSEA, 0
	db 5, BELLSPROUT, ODDISH, 0
	db 5, VOLTORB, MAGNEMITE, 0
	db 5, GROWLITHE, VULPIX, 0
; Route 8
	db 5, POLIWAG, POLIWAG, POLIWAG, 0
; Unused
	db 5, ZUBAT, GEODUDE, GEODUDE, 0
; Route 8
	db 5, GROWLITHE, VULPIX, 0

BeautyData:
; Celadon Gym
	db 5, ODDISH, BELLSPROUT, ODDISH, BELLSPROUT, 0
	db 5, BELLSPROUT, BELLSPROUT, 0
	db 5, EXEGGCUTE, 0
; Route 13
	db 5, RATTATA, PIKACHU, RATTATA, 0
	db 5, CLEFAIRY, MEOWTH, 0
; Route 20
	db 5, GOLDEEN, 0
	db 5, SHELLDER, SHELLDER, SHELLDER, 0
	db 5, POLIWAG, GOLDEEN, 0
; Route 15
	db 5, PIDGEY, JIGGLYPUFF, 0
	db 5, BULBASAUR, BULBASAUR, 0
; Unused
	db 5, BELLSPROUT, BELLSPROUT, BELLSPROUT, 0
; Route 19
	db 5, POLIWAG, GOLDEEN, GOLDEEN, GOLDEEN, POLIWAG, 0
	db 5, GOLDEEN, GOLDEEN, 0
	db 5, STARYU, STARYU, STARYU, 0
; Route 20
	db 5, HORSEA, HORSEA, HORSEA, 0

PsychicData:
; Saffron Gym
	db 5, ABRA, SLOWPOKE, DROWZEE, ABRA, 0 ; kadabra, slowpoke, mr. mime, kadabra
	db 5, DROWZEE, ABRA, 0 ; mr. mime, abra
	db 5, SLOWPOKE, SLOWPOKE, SLOWPOKE, 0
	db 5, SLOWPOKE, 0

RockerData:
; Vermilion Gym
	db 5, VOLTORB, MAGNEMITE, VOLTORB, 0
; Route 12
	db 5, VOLTORB, VOLTORB, 0

JugglerData:
; Silph Co. 5F
	db 5, ABRA, DROWZEE, 0 ; kadabra, mr mime
; Victory Road 2F
	db 5, DROWZEE, DROWZEE, ABRA, ABRA, 0
; Fuchsia Gym
	db 5, DROWZEE, DROWZEE, ABRA, DROWZEE, 0
	db 5, DROWZEE, DROWZEE, 0
; Victory Road 2F
	db 5, DROWZEE, 0 ; mr mime
; Unused
	db 5, DROWZEE, 0
; Fuchsia Gym
	db 5, DROWZEE, 0
	db 5, DROWZEE, ABRA, 0

TamerData:
; Fuchsia Gym
	db 5, SANDSHREW, EKANS, 0
	db 5, EKANS, SANDSHREW, EKANS, 0
; Viridian Gym
	db 5, RHYHORN, 0
	db 5, EKANS, DODUO, 0 ; arbok, tauros
; Victory Road 2F
	db 5, MEOWTH, GOLDUCK, 0
; Unused
	db 5, RHYHORN, MANKEY, EKANS, DODUO, 0 ; rhyhorn, primeape, ekans, tauros

BirdKeeperData:
; Route 13
	db 5, PIDGEY, PIDGEY, 0
	db 5, SPEAROW, PIDGEY, PIDGEY, SPEAROW, SPEAROW, 0
	db 5, PIDGEY, PIDGEY, SPEAROW, SPEAROW, 0
; Route 14
	db 5, DODUO, 0
	db 5, SPEAROW, SPEAROW, 0
; Route 15
	db 5, PIDGEY, DODUO, DODUO, PIDGEY, 0
	db 5, DODUO, DODUO, DODUO, 0
; Route 18
	db 5, SPEAROW, SPEAROW, 0
	db 5, DODUO, 0
	db 5, SPEAROW, SPEAROW, SPEAROW, SPEAROW, 0
; Route 20
	db 5, SPEAROW, SPEAROW, PIDGEY, 0
; Unused
	db 5, PIDGEY, PIDGEY, PIDGEY, PIDGEY, 0
	db 5, DODUO, SPEAROW, 0
; Route 14
	db 5, PIDGEY, DODUO, PIDGEY, 0
	db 5, PIDGEY, SPEAROW, PIDGEY, SPEAROW, 0
	db 5, PIDGEY, SPEAROW, 0
	db 5, SPEAROW, DODUO, SPEAROW, 0

BlackbeltData:
; Fighting Dojo
	db 5, MACHOP, MANKEY, 0 ; dojo leader, not sure what to do with him
	db 5, MANKEY, MANKEY, MANKEY, 0
	db 5, MACHOP, MACHOP, 0
	db 5, MANKEY, 0
	db 5, MACHOP, MANKEY, MANKEY, 0
; Viridian Gym
	db 5, MACHOP, MACHOP, 0
	db 5, MACHOP, 0
	db 5, MACHOP, MACHOP, MACHOP, 0
; Victory Road 2F
	db 5, MACHOP, MACHOP, MACHOP, 0

Green1Data:
	db 5, SQUIRTLE, 0
	db 5, BULBASAUR, 0
	db 5, CHARMANDER, 0
; Route 22
	db $FF, 5, PIDGEY, 5, SQUIRTLE, 0
	db $FF, 5, PIDGEY, 5, BULBASAUR, 0
	db $FF, 5, PIDGEY, 5, CHARMANDER, 0
; Cerulean City
	db $FF, 5, PIDGEY, 5, ABRA, 5, RATTATA, 5, SQUIRTLE, 0
	db $FF, 5, PIDGEY, 5, ABRA, 5, RATTATA, 5, BULBASAUR, 0
	db $FF, 5, PIDGEY, 5, ABRA, 5, RATTATA, 5, CHARMANDER, 0

ProfOakData:
; Unused
	db $FF, 66, TAUROS, 67, EXEGGCUTE, 68, GROWLITHE, 69, SQUIRTLE, 70, SHELLDER, 0
	db $FF, 66, TAUROS, 67, EXEGGCUTE, 68, GROWLITHE, 69, BULBASAUR, 70, SHELLDER, 0
	db $FF, 66, TAUROS, 67, EXEGGCUTE, 68, GROWLITHE, 69, CHARMANDER, 70, SHELLDER, 0

ChiefData:
; none

ScientistData:
; Unused
	db 5, KOFFING, VOLTORB, 0
; Silph Co. 2F
	db 5, GRIMER, KOFFING, KOFFING, KOFFING, 0
	db 5, MAGNEMITE, VOLTORB, MAGNEMITE, 0
; Silph Co. 3F/Mansion 1F
	db 5, VOLTORB, KOFFING, 0
; Silph Co. 4F
	db 5, VOLTORB, 0
; Silph Co. 5F
	db 5, MAGNEMITE, KOFFING, KOFFING, MAGNEMITE, 0
; Silph Co. 6F
	db 5, VOLTORB, KOFFING, MAGNEMITE, MAGNEMITE, KOFFING, 0
; Silph Co. 7F
	db 5, VOLTORB, GRIMER, 0
; Silph Co. 8F
	db 5, GRIMER, VOLTORB, 0
; Silph Co. 9F
	db 5, VOLTORB, KOFFING, MAGNEMITE, 0
; Silph Co. 10F
	db 5, MAGNEMITE, KOFFING, 0
; Mansion 3F
	db 5, MAGNEMITE, MAGNEMITE, VOLTORB, 0
; Mansion B1F
	db 5, MAGNEMITE, VOLTORB, 0

GiovanniData:
; Rocket Hideout B4F
	db $FF, 5, KABUTO, 5, RHYHORN, 5, PORYGON, 0
; Silph Co. 11F
	db $FF, 5, NIDORAN_M, 5, MEOWTH, 5, RHYHORN, 5, NIDORAN_F, 5, LICKITUNG, 0
; Viridian Gym
	db $FF, 5, RHYHORN, 5, DIGLETT, 5, NIDORAN_F, 5, NIDORAN_M, 5, RHYHORN, 5, SCYTHER, 0

RocketData:
; Mt. Moon B2F
	db 5, RATTATA, ZUBAT, 0
	db 5, SANDSHREW, RATTATA, ZUBAT, 0
	db 5, ZUBAT, EKANS, 0
	db $FF, 5, RATTATA, 0
; Cerulean City
	db $FF, 5, MACHOP, 5, DROWZEE, 5, DIGLETT, 0
; Route 24
	db 5, EKANS, ZUBAT, 0
; Game Corner
	db 5, RATTATA, ZUBAT, 0
; Rocket Hideout B1F
	db 5, DROWZEE, MACHOP, 0
	db 5, RATTATA, RATTATA, 0
	db 5, GRIMER, KOFFING, KOFFING, 0
	db 5, RATTATA, RATTATA, RATTATA, RATTATA, 0
	db 5, GRIMER, KOFFING, 0
; Rocket Hideout B2F
	db 5, ZUBAT, KOFFING, GRIMER, ZUBAT, RATTATA, 0
; Rocket Hideout B3F
	db 5, RATTATA, RATTATA, DROWZEE, 0
	db 5, MACHOP, MACHOP, 0
; Rocket Hideout B4F
	db $FF, 5, SANDSHREW, 5, EKANS, 5, SANDSHREW, 0
	db $FF, 5, EKANS, 5, SANDSHREW, 5, DRATINI, 0
	db 5, KOFFING, ZUBAT, 0 ; lift key
; Pokémon Tower 7F
	db 5, ZUBAT, ZUBAT, ZUBAT, 0
	db 5, KOFFING, DROWZEE, 0
	db 5, ZUBAT, RATTATA, RATTATA, ZUBAT, 0
; Unused
	db 5, DROWZEE, KOFFING, 0
; Silph Co. 2F
	db 5, CUBONE, ZUBAT, 0
	db 5, ZUBAT, ZUBAT, ZUBAT, RATTATA, ZUBAT, 0
; Silph Co. 3F
	db 5, RATTATA, DROWZEE, RATTATA, 0
; Silph Co. 4F
	db 5, MACHOP, DROWZEE, 0
	db 5, EKANS, ZUBAT, CUBONE, 0
; Silph Co. 5F
	db 5, EKANS, 0
	db 5, DROWZEE, 0
; Silph Co. 6F
	db 5, MACHOP, MACHOP, 0
	db 5, ZUBAT, ZUBAT, ZUBAT, 0
; Silph Co. 7F
	db 5, RATTATA, EKANS, KOFFING, ZUBAT, 0
	db 5, CUBONE, CUBONE, 0
	db 5, SANDSHREW, SANDSHREW, 0
; Silph Co. 8F
	db 5, RATTATA, ZUBAT, ZUBAT, RATTATA, 0
	db 5, KOFFING, ZUBAT, KOFFING, 0
; Silph Co. 9F
	db 5, DROWZEE, GRIMER, MACHOP, 0
	db 5, ZUBAT, DROWZEE, DROWZEE, 0
; Silph Co. 10F
	db 5, MACHOP, 0
; Silph Co. 11F
	db 5, RATTATA, RATTATA, ZUBAT, RATTATA, EKANS, 0
	db 5, CUBONE, DROWZEE, CUBONE, 0

CooltrainerMData:
; Viridian Gym
	db 5, NIDORAN_M, NIDORAN_M, 0
; Victory Road 3F
	db 5, EXEGGCUTE, SHELLDER, GROWLITHE, 0
	db 5, KRABBY, TENTACOOL, SQUIRTLE, 0
; Unused
	db 5, KRABBY, STARYU, 0
; Victory Road 1F
	db 5, BULBASAUR, SQUIRTLE, CHARMANDER, CHARMANDER, 0
; Unused
	db 5, BULBASAUR, SQUIRTLE, CHARMANDER, 0
	db 5, NIDORAN_M, 0
	db 5, KRABBY, SHELLDER, 0
; Viridian Gym
	db 5, SANDSHREW, DIGLETT, 0
	db 5, RHYHORN, 0

CooltrainerFData:
; Celadon Gym
	db 5, BELLSPROUT, ODDISH, BULBASAUR, 0
; Victory Road 3F
	db 5, BELLSPROUT, BELLSPROUT, BELLSPROUT, 0
	db 5, PARAS, SEEL, JIGGLYPUFF, 0
; Unused
	db 5, ODDISH, CATERPIE, 0
; Victory Road 1F
	db 5, MEOWTH, VULPIX, 0
; Unused
	db 5, BULBASAUR, BULBASAUR, 0
	db 5, NIDORAN_F, NIDORAN_F, 0
	db 5, MEOWTH, VULPIX, PIKACHU, 0

BrunoData:
	db $FF, 5, RHYDON, 5, MANKEY, 5, KRABBY, 5, KABUTO, 5, MACHOP, 0

BrockData:
	db $FF, 5, GEODUDE, 5, ONIX, 0

MistyData:
	db $FF, 5, STARYU, 5, STARYU, 0

LtSurgeData:
	db $FF, 5, VOLTORB, 5, VOLTORB, 5, VOLTORB, 5, PIKACHU, 5, PIKACHU, 5, PIKACHU, 0

ErikaData:
	db $FF, 5, EXEGGCUTE, 5, BELLSPROUT, 5, ODDISH, 5, JIGGLYPUFF, 5, DRATINI, 5, TANGELA, 0

KogaData:
	db $FF, 5, KOFFING, 5, GRIMER, 5, KOFFING, 5, EKANS, 0

BlaineData:
	db $FF, 5, GROWLITHE, 5, PONYTA, 5, PONYTA, 5, GROWLITHE, 0

SabrinaData:
	db $FF, 5, ABRA, 5, DROWZEE, 5, GASTLY, 5, ABRA, 0

GentlemanData:
; SS Anne 1F Rooms
	db 5, GROWLITHE, GROWLITHE, 0
	db 5, NIDORAN_M, NIDORAN_F, 0
; SS Anne 2F Rooms/Vermilion Gym
	db 5, PIKACHU, 0
; Unused
	db 5, MANKEY, 0
; SS Anne 2F Rooms
	db 5, GROWLITHE, PONYTA, 0

Green2Data:
; SS Anne 2F
	db $FF, 5, PIDGEY, 5, RATTATA, 5, ABRA, 5, EKANS, 5, BELLSPROUT, 5, SQUIRTLE, 0
	db $FF, 5, PIDGEY, 5, RATTATA, 5, ABRA, 5, EKANS, 5, SANDSHREW, 5, BULBASAUR, 0
	db $FF, 5, PIDGEY, 5, RATTATA, 5, ABRA, 5, EKANS, 5, BELLSPROUT, 5, CHARMANDER, 0
; Pokémon Tower 2F
	db $FF, 5, PIDGEY, 5, GASTLY, 5, ABRA, 5, VULPIX, 5, EXEGGCUTE, 5, SQUIRTLE, 0
	db $FF, 5, PIDGEY, 5, GASTLY, 5, ABRA, 5, SHELLDER, 5, VULPIX, 5, BULBASAUR, 0
	db $FF, 5, PIDGEY, 5, GASTLY, 5, ABRA, 5, EXEGGCUTE, 5, SHELLDER, 5, CHARMANDER, 0
; Silph Co. 7F
	db $FF, 5, PIDGEY, 5, GROWLITHE, 5, EXEGGCUTE, 5, ABRA, 5, SQUIRTLE, 0
	db $FF, 5, PIDGEY, 5, SHELLDER, 5, GROWLITHE, 5, ABRA, 5, BULBASAUR, 0
	db $FF, 5, PIDGEY, 5, EXEGGCUTE, 5, SHELLDER, 5, ABRA, 5, CHARMANDER, 0
; Route 22
	db $FF, 5, PIDGEY, 5, RHYHORN, 5, GROWLITHE, 5, EXEGGCUTE, 5, ABRA, 5, SQUIRTLE, 0
	db $FF, 5, PIDGEY, 5, RHYHORN, 5, SHELLDER, 5, GROWLITHE, 5, ABRA, 5, BULBASAUR, 0
	db $FF, 5, PIDGEY, 5, RHYHORN, 5, EXEGGCUTE, 5, SHELLDER, 5, ABRA, 5, CHARMANDER, 0

Green3Data:
	db $FF, 5, PIDGEY, 5, ABRA, 5, RHYDON, 5, GROWLITHE, 5, EXEGGCUTE, 5, SQUIRTLE, 0
	db $FF, 5, PIDGEY, 5, ABRA, 5, RHYDON, 5, SHELLDER, 5, GROWLITHE, 5, BULBASAUR, 0
	db $FF, 5, PIDGEY, 5, ABRA, 5, RHYDON, 5, EXEGGCUTE, 5, SHELLDER, 5, CHARMANDER, 0

LoreleiData:
	db $FF, 5, SHELLDER, 5, SANDSHREW, 5, SLOWPOKE, 5, VULPIX, 5, SEEL, 0

ChannelerData:
; Unused
	db 5, GASTLY, 0
	db 5, GASTLY, 0
	db 5, GASTLY, GASTLY, 0
	db 5, GASTLY, 0
; Pokémon Tower 3F
	db 5, GASTLY, 0
	db 5, GASTLY, 0
; Unused
	db 5, GASTLY, 0
; Pokémon Tower 3F
	db 5, GASTLY, 0
; Pokémon Tower 4F
	db 5, GASTLY, 0
	db 5, GASTLY, GASTLY, 0
; Unused
	db 5, GASTLY, 0
; Pokémon Tower 4F
	db 5, GASTLY, 0
; Unused
	db 5, GASTLY, 0
; Pokémon Tower 5F
	db 5, GASTLY, 0
; Unused
	db 5, GASTLY, 0
; Pokémon Tower 5F
	db 5, GASTLY, 0
	db 5, GASTLY, 0
	db 5, GASTLY, 0
; Pokémon Tower 6F
	db 5, GASTLY, GASTLY, GASTLY, 0
	db 5, GASTLY, 0
	db 5, GASTLY, 0
; Saffron Gym
	db 5, GASTLY, GASTLY, 0
	db 5, GASTLY, 0
	db 5, GASTLY, GASTLY, GASTLY, 0

AgathaData:
	db $FF, 5, GASTLY, 5, ZUBAT, 5, GASTLY, 5, EKANS, 5, GASTLY, 0

LanceData:
	db $FF, 5, DRATINI, 5, DRATINI, 5, DRATINI, 5, DRATINI, 5, DRATINI, 0
