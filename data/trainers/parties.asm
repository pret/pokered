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
	dw YujirouData ; was unused juggler
	dw StudentData
	dw FirefighterData
	dw JuniorData
	dw JackData

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
	db 11, RATTATA, EKANS, 0
	db 14, SPEAROW, 0
; Mt. Moon 1F
	db 10, RATTATA, SPEAROW, BITTYBAT, 0
; Route 24
	db 14, RATTATA, EKANS, ZUBAT, 0
; Route 25
	db 15, RATTATA, SPEAROW, 0
	db 17, SLOWPOKE, 0
	db 14, EKANS, SANDSHREW, 0
; SS Anne 1F Rooms
	db 21, NIDORAN_M, 0
; Route 11
	db 21, EKANS, 0
	db 19, SANDSHREW, ZUBAT, 0
	db 17, RATTATA, RATTATA, RATICATE, 0
	db 18, NIDORAN_M, NIDORINO, 0
; Unused - this will be used in the Silph Gauntlet
	db 62, RATICATE, ARBOK, SANDSLASH, FEAROW, NIDOKING, VENUSAUR, 0

BugCatcherData:
; Viridian Forest
	db 6, WEEDLE, CATERPIE, 0
	db 7, CATERPIE, KAKUNA, PARA, 0
	db 9, VENONAT, 0
; Route 3
	db 10, CATERPIE, WEEDLE, PARA, 0
	db 9, WEEDLE, KAKUNA, CATERPIE, METAPOD, 0
	db 11, CATERPIE, METAPOD, 0
; Mt. Moon 1F
	db 12, PARA, PARAS, 0
	db 10, CATERPIE, METAPOD, PARA, 0
; Route 24
	db 14, CATERPIE, WEEDLE, 0
; Route 6
	db 16, WEEDLE, CATERPIE, WEEDLE, 0
	db 17, BUTTERFREE, 0 ; this is that one boss fight-like one, levelled down for learnset reasons
; Unused - this will be used in the Silph Gauntlet
	db 62, SCIZOR, BEEDRILL, PARASECT, VENOMOTH, PURAKKUSU, KLEAVOR, 0
; Route 9
	db 19, BUTTERFREE, BEEDRILL, 0
	db 20, WEEDLE, VENONAT, BEEDRILL, 0 ; holy shit why did they have an L20 Caterpie you psycho, weedle is barely acceptable...

LassData:
; Route 3
	db 9, PIDGEY, PIDGEY, 0
	db 10, RATTATA, NIDORAN_M, 0
	db 14, JIGGLYPUFF, 0
; Route 4
	db 31, PARAS, PARAS, PARASECT, 0
; Mt. Moon 1F
	db 11, ODDISH, BELLSPROUT, 0
	db 14, CLEFAIRY, 0
; Route 24
	db 16, PIDGEY, NIDORAN_F, 0
	db 14, PIDGEY, NIDORAN_F, 0
; Route 25
	db 15, NIDORAN_M, NIDORAN_F, 0
	db 13, ODDISH, PIDGEY, ODDISH, 0
; SS Anne 1F Rooms
	db 18, PIDGEY, NIDORAN_F, 0
; SS Anne 2F Rooms
	db 18, RATTATA, PIKACHU, 0
; Route 8
	db 23, NIDORAN_F, NIDORINA, 0
	db 24, MEOWTH, MEOWTH, MEOWTH, 0
	db 19, PIDGEY, RATTATA, NIDORAN_M, MEOWTH, PIKACHU, 0
	db 22, CLEFAIRY, CLEFAIRY, 0
; Celadon Gym
	db 23, LEAFEON, 0
	db 23, ODDISH, GLOOM, 0
; New - this will be used in the Silph Gauntlet
	; db 62, PERSIAN, CLEFABLE, VILEPLUME, WIGGLYTUFF, POLITOED, NIDOQUEEN, 0

SailorData:
; SS Anne Stern
	db 18, MACHOP, SHELLDER, 0
	db 17, MACHOP, TENTACOOL, 0
; SS Anne B1F Rooms
	db 21, SHELLDER, 0
	db 17, HORSEA, SHELLDER, TENTACOOL, 0
	db 18, TENTACOOL, STARYU, 0
	db 17, HORSEA, HORSEA, HORSEA, 0
	db 20, MACHOP, 0
; Vermilion Gym
	db 21, KOTORA, GAOTORA, 0
; New - this will be used in the Silph Gauntlet
	; db 64, KINGDRA, MACHAMP, CLOYSTER, STARMIE, GOROCHU, TENTACRUEL, 0

JrTrainerMData:
; Pewter Gym
	db 11, GEODUDE, SANDSHREW, 0
; Route 24/Route 25
	db 14, RATTATA, EKANS, 0
; Route 24
	db 18, MANKEY, 0
; Route 6
	db 20, SQUIRTLE, 0
	db 16, SPEAROW, RATICATE, 0
; Unused - this will be used in the Silph Gauntlet
	db 63, DUGTRIO, PRIMEAPE, SANDSLASH, BLASTOISE, NIDOKING, ARCANINE, 0
; Route 9
	db 21, GROWLITHE, CHARMANDER, 0
	db 19, RATTATA, DIGLETT, EKANS, SANDSHREW, 0
; Route 12
	db 29, NIDORAN_M, NIDORINO, 0

JrTrainerFData:
; Cerulean Gym
	db 19, GYOPIN, GOLDEEN, 0
; Route 6
	db 16, RATTATA, PIKACHU, 0
	db 16, PIDGEY, PIDGEY, PIDGEY, 0
; Unused - used in celadon university
	db 22, BULBASAUR, CHARMANDER, SQUIRTLE, 0
; Route 9
	db 18, ODDISH, BELLSPROUT, ODDISH, BELLSPROUT, 0
	db 23, MEOWTH, 0
; Route 10
	db 20, PIKACHU, CLEFAIRY, 0
	db 21, PIDGEY, PIDGEOTTO, 0
; Rock Tunnel B1F
	db 21, JIGGLYPUFF, PIDGEY, MEOWTH, 0
	db 22, ODDISH, BULBASAUR, 0
; Celadon Gym
	db 24, BULBASAUR, IVYSAUR, 0
; Route 13
	db 24, PIDGEY, MEOWTH, RATTATA, PIKACHU, MEOWTH, 0
	db 30, POLIWAG, POLIWAG, 0
	db 27, PIDGEY, MEOWTH, PIDGEY, PIDGEOTTO, 0
	db 28, GOLDEEN, POLIWAG, HORSEA, 0
; Route 20
	db 31, GOLDEEN, SEAKING, 0
; Rock Tunnel 1F
	db 22, BELLSPROUT, CLEFAIRY, 0
	db 20, MEOWTH, ODDISH, PIDGEY, 0
	db 19, PIDGEY, RATTATA, RATTATA, BELLSPROUT, 0
; Route 15
	db 28, GLOOM, ODDISH, ODDISH, 0
	db 29, PIKACHU, RAICHU, 0
	db 33, CLEFAIRY, 0
	db 29, BELLSPROUT, ODDISH, TANGELA, 0
; Route 20
	db 30, TENTACOOL, HORSEA, SEEL, 0
; New - this will be used in the Silph Gauntlet
	; db 63, TSUBOMITTO, SEAKING, MADAAMU, BELLOSSOM, GOROCHU, VENUSAUR, 0

PokemaniacData:
; Route 10
	db 30, RHYHORN, LICKITUNG, 0
	db 20, CUBONE, SLOWPOKE, 0
; Rock Tunnel B1F
	db 20, SLOWPOKE, SLOWPOKE, SLOWPOKE, 0
	db 22, CHARMANDER, CUBONE, 0
	db 25, SLOWPOKE, 0
; Victory Road 2F
	db 40, CHARMELEON, LAPRAS, LICKITUNG, 0
; Rock Tunnel 1F
	db 23, CUBONE, SLOWPOKE, 0
; New - this will be used in the Silph Gauntlet
	db 66, GUARDIA, SLOWBRO, CHARIZARD, STEELIX, LICKILICKY, RHYPERIOR, 0

SuperNerdData:
; Mt. Moon 1F
	db 11, MAGNEMITE, VOLTORB, 0
; Mt. Moon B2F - the fossil guy fight
	db 12, GRIMER, VOLTORB, KOFFING, 0
; Route 8
	db 20, VOLTORB, KOFFING, VOLTORB, MAGNEMITE, 0
	db 22, GRIMER, MUK, GRIMER, 0
	db 26, KOFFING, 0
; Unused
	db 30, PORYGON, 0 ; - used in celadon university
	db 25, MAGNETITE, ELECTRODE, KABUTO, OMANYTE, 0 ; - used in celadon university
	db 63, MAGNEZONE, MUK, KABUTOPS, OMASTAR, PORYGONZ, MAGMORTAR, 0 ; - used in Silph Gauntlet
; Cinnabar Gym
	db 36, VULPIX, NINETALES, CHARIZARD, 0
	db 34, PONYTA, CHARMANDER, RAPIDASH, ARCANINE, 0
	db 41, FLAREON, 0
	db 37, MAGMAR, MAGMORTAR, 0

HikerData:
; Mt. Moon 1F
	db 10, GEODUDE, GEODUDE, ONIX, 0
; Route 25
	db 15, MACHOP, GEODUDE, 0
	db 13, GEODUDE, GEODUDE, MACHOP, GEODUDE, 0
	db 17, ONIX, 0
; Route 9
	db 21, GEODUDE, ONIX, 0
	db 20, GEODUDE, MACHOP, GEODUDE, 0
; Route 10
	db 21, GEODUDE, ONIX, 0
	db 19, ONIX, GRAVELER, 0
; Rock Tunnel B1F
	db 21, GEODUDE, GEODUDE, GRAVELER, 0
	db 25, GEODUDE, 0
; Route 9/Rock Tunnel B1F
	db 20, MACHOP, ONIX, 0
; Rock Tunnel 1F
	db 19, GEODUDE, MACHOP, GEODUDE, GEODUDE, 0
	db 20, ONIX, ONIX, GEODUDE, 0
	db 21, GEODUDE, GRAVELER, 0
; New - this will be used in the Silph Gauntlet
	db 63, STEELIX, GOLEM, MACHAMP, CROBAT, CROAKOZUNA, GUARDIA, 0

BikerData:
; Route 13
	db 28, KOFFING, KOFFING, KOFFING, 0
; Route 14
	db 29, KOFFING, GRIMER, 0
; Route 15
	db 25, KOFFING, KOFFING, WEEZING, KOFFING, GRIMER, 0
	db 28, KOFFING, GRIMER, WEEZING, 0
; Route 16
	db 29, GRIMER, KOFFING, 0
	db 33, WEEZING, 0
	db 26, GRIMER, GRIMER, GRIMER, GRIMER, 0
; Route 17
	; From https://www.smogon.com/smog/issue27/glitch:
	; 0E:5FC2 is offset of the ending 0 for this first Biker on Route 17.
	; BaseStats + (BASE_DATA_SIZE) * (000 - 1) = $5FC2;
	; that's the formula from GetMonHeader for the base stats of mon #000.
	; (BaseStats = $43DE and BANK(BaseStats) = $0E.)
	; Finally, PokedexOrder lists 0 as the dex ID for every MissingNo.
	; The result is that this data gets interpreted as the base stats
	; for MissingNo: 0, 33, MUK, 0, 29, VOLTORB, VOLTORB, 0, ..., 28, GRIMER, GRIMER.
	db 28, WEEZING, KOFFING, WEEZING, 0
	db 33, MUK, 0
	db 29, VOLTORB, VOLTORB, 0
	db 29, WEEZING, MUK, 0
	db 25, KOFFING, WEEZING, KOFFING, KOFFING, WEEZING, 0
; Route 14
	db 26, KOFFING, KOFFING, GRIMER, KOFFING, 0
	db 28, GRIMER, GRIMER, KOFFING, 0
	db 29, KOFFING, MUK, 0
; New - this will be used in the Silph Gauntlet
	db 65, ELECTRODE, MUK, WEEZING, TENTACRUEL, HYPNO, HITMONTOP, 0

BurglarData:
; Unused
	db 66, NINETALES, RAPIDASH, ARCANINE, WEEZING, MAGMORTAR, MUK, 0 ; - used in Silph Gauntlet
	db 33, GROWLITHE, 0
	db 28, VULPIX, CHARMANDER, PONYTA, 0
; Cinnabar Gym
	db 36, GROWLITHE, VULPIX, ARCANINE, 0
	db 41, RAPIDASH, 0
	db 37, VULPIX, NINETALES, 0
; Mansion 2F
	db 34, CHARMANDER, CHARMELEON, 0
; Mansion 3F
	db 38, NINETALES, 0
; Mansion B1F
	db 34, GROWLITHE, PONYTA, 0
; Victory Road - BIG SHOT
;	db $FF, 47, ANIMON, 47, MADAAMU, 50, CRYITHAN, 50, GUARDIA, 50, TANGROWTH, 53, GYARADOS, 0

EngineerData:
; Unused - used in celadon university
	db 36, GOLEM, 0
; Route 11
	db 21, MAGNEMITE, 0
	db 18, MAGNEMITE, MAGNEMITE, MAGNETITE, 0

FisherData:
; SS Anne 2F Rooms
	db 17, GOLDEEN, TENTACOOL, GOLDEEN, 0
; SS Anne B1F Rooms
	db 17, TENTACOOL, STARYU, SHELLDER, 0
; Route 12
	db 22, GOLDEEN, POLIWAG, GOLDEEN, 0
	db 24, TENTACOOL, GOLDEEN, 0
	db 27, GOLDEEN, 0
	db 21, POLIWAG, SHELLDER, GOLDEEN, HORSEA, 0
; Route 21
	db 28, SEAKING, GOLDEEN, SEAKING, SEAKING, 0
	db 31, SHELLDER, CLOYSTER, 0
	db 27, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, 0
	db 33, SEAKING, GOLDEEN, 0
; Route 12
	db 24, MAGIKARP, MAGIKARP, 0

SwimmerData:
; Cerulean Gym
	db 16, HORSEA, SHELLDER, 0
; Route 19
	db 30, TENTACOOL, SHELLDER, 0
	db 29, GOLDEEN, HORSEA, STARYU, 0
	db 30, POLIWAG, POLIWHIRL, 0
	db 27, HORSEA, TENTACOOL, TENTACOOL, GOLDEEN, 0
	db 29, GOLDEEN, SHELLDER, SEAKING, 0
	db 30, HORSEA, HORSEA, 0
	db 27, TENTACOOL, TENTACOOL, STARYU, HORSEA, TENTACRUEL, 0 ;- removed to free space for oak teams
; Route 20
	db 31, SHELLDER, CLOYSTER, 0
	db 35, STARYU, 0
	db 28, HORSEA, HORSEA, SEADRA, HORSEA, 0
; Route 21
	db 33, SEADRA, TENTACRUEL, 0
	db 37, STARMIE, 0
	db 33, STARYU, WARTORTLE, 0
	db 32, POLIWHIRL, TENTACOOL, SEADRA, 0

CueBallData:
; Route 16
	db 28, MACHOP, MANKEY, MACHOP, 0
	db 29, MANKEY, MACHOP, 0
	db 33, MACHOP, 0
; Route 17
	db 29, MANKEY, PRIMEAPE, 0
	db 29, MACHOP, MACHOKE, 0
	db 33, MACHOKE, 0
	db 26, MANKEY, MANKEY, MACHOKE, MACHOP, 0
	db 29, PRIMEAPE, MACHOKE, 0
; Route 21
	db 31, TENTACOOL, TENTACOOL, TENTACRUEL, 0

GamblerData:
; Route 11
	db 18, POLIWAG, HORSEA, 0
	db 18, BELLSPROUT, ODDISH, 0
	db 18, VOLTORB, MAGNEMITE, 0
	db 18, GROWLITHE, VULPIX, 0
; Route 8
	db 22, POLIWAG, POLIWAG, POLIWHIRL, 0
; Unused
;	db 22, ONIX, GEODUDE, GRAVELER, 0
; Route 8
	db 24, GROWLITHE, VULPIX, 0

BeautyData:
; Celadon Gym
	db 21, ODDISH, BELLSPROUT, WEEPINBELL, 0
	db 24, TOEDSCOOL, MONJA, 0
	db 26, DEER, 0
; Route 13
	db 27, RATTATA, PIKACHU, RATTATA, 0
	db 29, CLEFAIRY, MEOWTH, 0
; Route 20
	db 35, SEAKING, 0
	db 30, SHELLDER, SHELLDER, CLOYSTER, 0
	db 31, POLIWAG, SEAKING, 0
; Route 15
	db 29, PIDGEOTTO, WIGGLYTUFF, 0
	db 29, BULBASAUR, IVYSAUR, 0
; Unused
;	db 33, WEEPINBELL, BELLSPROUT, WEEPINBELL, 0
; Route 19
	db 27, POLIWAG, GOLDEEN, SEAKING, GOLDEEN, POLIWAG, 0
	db 30, GOLDEEN, SEAKING, 0
	db 29, STARYU, STARYU, STARYU, 0
; Route 20
	db 30, SEADRA, HORSEA, SEADRA, 0

PsychicData:
; Saffron Gym
	db 31, KADABRA, SLOWPOKE, MR_MIME, KADABRA, 0
	db 34, MR_MIME, KADABRA, 0
	db 33, SLOWPOKE, SLOWPOKE, SLOWBRO, 0
	db 38, SLOWBRO, 0

RockerData:
; Vermilion Gym
	db 20, VOLTORB, MAGNEMITE, MAGNETITE, 0
; Route 12
	db 29, VOLTORB, ELECTRODE, 0

JugglerData:
; Silph Co. 5F
	db 29, KADABRA, MR_MIME, 0
; Victory Road 2F
	db 41, DROWZEE, HYPNO, KADABRA, KADABRA, 0
; Fuchsia Gym
	db 31, BEEDRILL, HAUNTER, VILEPLUME, 0
	db 34, TENTACOOL, TENTACRUEL, 0
; Victory Road 2F
	db 48, MR_MIME, 0
; Unused - this will be used in the Silph Gauntlet
	db 65, HYPNO, MR_MIME, ALAKAZAM, ELECTRODE, GENGAR, SLOWKING, 0
; Fuchsia Gym
	db 38, UMBREON, 0
; Fuchsia Gym
	db 34, WEEPINBELL, TSUBOMITTO, 0

TamerData:
; Fuchsia Gym
	db 34, NIDOQUEEN, ARBOK, 0
	db 33, ARBOK, NIDOKING, ARBOK, 0
; Viridian Gym
	db 43, RHYDON, 0
	db 39, SANDSLASH, TRAMPEL, 0
; Victory Road 2F
	db 44, TAUROS, GOLDUCK, 0
; Unused - this will be used in the Silph Gauntlet
	db 66, RHYPERIOR, ARBOK, SANDSLASH, PRIMEAPE, TRAMPEL, TAUROS, 0

BirdKeeperData:
; Route 13
	db 29, PIDGEY, PIDGEOTTO, 0
	db 25, SPEAROW, PIDGEY, PIDGEY, SPEAROW, SPEAROW, 0
	db 26, PIDGEY, PIDGEOTTO, SPEAROW, FEAROW, 0
; Route 14
	db 33, FARFETCHD, 0
	db 29, SPEAROW, FEAROW, 0
; Route 15
	db 26, PIDGEOTTO, FARFETCHD, DODUO, PIDGEY, 0
	db 28, DODRIO, DODUO, DODUO, 0
; Route 18
	db 29, SPEAROW, FEAROW, 0
	db 34, DODRIO, 0
	db 26, SPEAROW, SPEAROW, FEAROW, SPEAROW, 0
; Route 20
	db 30, FEAROW, FEAROW, PIDGEOTTO, 0
; Unused
	db 39, PIDGEOTTO, PIDGEOTTO, PIDGEY, PIDGEOTTO, 0
	db 42, FARFETCHD, FEAROW, 0
; Route 14
	db 28, PIDGEY, DODUO, PIDGEOTTO, 0
	db 26, PIDGEY, SPEAROW, PIDGEY, FEAROW, 0
	db 29, PIDGEOTTO, FEAROW, 0
	db 28, SPEAROW, DODUO, FEAROW, 0

ChiefData:
; New - this will be used in the Silph Gauntlet
	db $FF, 73, MAGNEZONE, 72, LAPRAS, 73, SCIZOR, 73, EXEGGUTOR, 75, PORYGON2, 77, OMEGA, 0

ScientistData:
; Unused - this will be used in the Silph Gauntlet
	db 64, MAGNEZONE, ELECTRODE, PORYGONZ, MUK, WEEZING, ALAKAZAM, 0
; Silph Co. 2F
	db 26, GRIMER, WEEZING, KOFFING, WEEZING, 0
	db 28, MAGNEMITE, VOLTORB, MAGNETON, 0
; Silph Co. 3F/Mansion 1F
	db 29, ELECTRODE, WEEZING, 0
; Silph Co. 4F
	db 33, ELECTRODE, 0
; Silph Co. 5F
	db 26, MAGNETON, KOFFING, WEEZING, MAGNEMITE, 0
; Silph Co. 6F
	db 25, VOLTORB, KOFFING, MAGNETON, MAGNEMITE, KOFFING, 0
; Silph Co. 7F
	db 29, ELECTRODE, MUK, 0
; Silph Co. 8F
	db 29, GRIMER, ELECTRODE, 0
; Silph Co. 9F
	db 28, VOLTORB, KOFFING, MAGNETON, 0
; Silph Co. 10F
	db 29, MAGNEMITE, KOFFING, 0
; Mansion 3F
	db 33, MAGNEMITE, MAGNETON, VOLTORB, 0
; Mansion B1F
	db 34, MAGNEMITE, ELECTRODE, 0

RocketData: ; restoring these so undefined stuff isn't pulled RIGHT NOW
; Mt. Moon B2F
	db 13, RATTATA, BITTYBAT, 0
	db 11, SANDSHREW, RATTATA, BITTYBAT, 0
	db 12, BITTYBAT, EKANS, 0
	db 16, RATICATE, 0
; Cerulean City
	db 17, MACHOP, DROWZEE, 0
; Route 24
	db 15, EKANS, ZUBAT, 0
; Game Corner
	db 20, RATICATE, ZUBAT, 0
; Rocket Hideout B1F
	db 42, HYPNO, WEEZING, ARBOK, 0
; Rocket Hideout B1F - all now unused
	db 21, RATICATE, RATICATE, 0
	db 20, GRIMER, KOFFING, KOFFING, 0
	db 19, RATTATA, RATICATE, RATICATE, RATTATA, 0
	db 22, GRIMER, KOFFING, 0
; Rocket Hideout B2F
	db 17, ZUBAT, KOFFING, GRIMER, ZUBAT, RATICATE, 0
; Rocket Hideout B3F
	db 20, RATTATA, RATICATE, DROWZEE, 0
	db 21, MACHOP, MACHOP, 0
; Rocket Hideout B4F
	db 23, SANDSHREW, EKANS, SANDSLASH, 0
	db 23, EKANS, SANDSHREW, ARBOK, 0
	db 21, KOFFING, ZUBAT, 0
; Pokémon Tower 7F
	db 25, ZUBAT, ZUBAT, GOLBAT, 0
	db 26, KOFFING, DROWZEE, 0
	db 23, ZUBAT, RATTATA, RATICATE, ZUBAT, 0
; Unused - this will be used in the Silph Gauntlet
	db 65, PERSIAN, ARBOK, WEEZING, CROBAT, HYPNO, GUARDIA, 0
; Silph Co. 2F - cut
	db 29, CUBONE, ZUBAT, 0
	db 25, GOLBAT, ZUBAT, ZUBAT, RATICATE, ZUBAT, 0
; Silph Co. 3F
	db 28, RATICATE, HYPNO, RATICATE, 0
; Silph Co. 4F - cut
	db 29, MACHOP, DROWZEE, 0
	db 28, EKANS, ZUBAT, CUBONE, 0
; Silph Co. 5F - cut
	db 33, ARBOK, 0
	db 33, HYPNO, 0
; Silph Co. 6F - cut
	db 29, MACHOP, MACHOKE, 0
	db 28, ZUBAT, ZUBAT, GOLBAT, 0
; Silph Co. 7F
	db 26, RATICATE, ARBOK, KOFFING, GOLBAT, 0
	db 29, CUBONE, CUBONE, 0
	db 29, SANDSHREW, SANDSLASH, 0
; Silph Co. 8F - cut
	db 26, RATICATE, ZUBAT, GOLBAT, RATTATA, 0
	db 28, WEEZING, GOLBAT, KOFFING, 0
; Silph Co. 9F - cut
	db 28, DROWZEE, GRIMER, MACHOP, 0
	db 28, GOLBAT, DROWZEE, HYPNO, 0
; Silph Co. 10F - cut
	db 33, MACHOKE, 0
; Silph Co. 11F
	db 25, RATTATA, RATTATA, ZUBAT, RATTATA, EKANS, 0
	db 32, CUBONE, DROWZEE, MAROWAK, 0

CooltrainerMData:
; Viridian Gym
	db 39, MAROWAK, NIDOKING, 0
; Victory Road 3F
	db 43, EXEGGUTOR, CLOYSTER, ARCANINE, 0
	db 43, KINGLER, TENTACRUEL, BLASTOISE, 0
; Unused - this will be used in the Silph Gauntlet
	db 66, GOROCHU, VENUSAUR, ESPEON, CHARIZARD, SNORLAX, TOTARTLE, 0
; Victory Road 1F
	db 42, IVYSAUR, WARTORTLE, CHARMELEON, CHARIZARD, 0
; Unused
	db 44, IVYSAUR, WARTORTLE, CHARMELEON, 0
	db 49, NIDOKING, 0
	db 44, KINGLER, CLOYSTER, 0
; Viridian Gym
	db 39, SANDSLASH, DUGTRIO, 0
	db 43, NIDOKING, 0

CooltrainerFData:
; Celadon Gym
	db 24, CACTUS, GLOOM, 0
; Victory Road 3F
	db 43, BELLSPROUT, WEEPINBELL, VICTREEBEL, 0
	db 43, PARASECT, DEWGONG, CHANSEY, 0
; Unused - this will be used in the Silph Gauntlet
	db 66, CLEFABLE, GENGAR, VICTREEBEL, NINETALES, KANGASKHAN, BLASTOISE, 0
; Victory Road 1F
	db 44, PERSIAN, NINETALES, 0
; Unused
;	db 45, IVYSAUR, VENUSAUR, 0
;	db 45, NIDORINA, NIDOQUEEN, 0
;	db 43, PERSIAN, NINETALES, RAICHU, 0

GentlemanData:
; SS Anne 1F Rooms
	db 18, GROWLITHE, GROWLITHE, 0
	db 19, NIDORAN_M, NIDORAN_F, 0
; SS Anne 2F Rooms/Vermilion Gym
	db 23, PIKACHU, 0
; Unused - this will be used in the Silph Gauntlet
	db 64, ARCANINE, NIDOQUEEN, PRIMEAPE, FEAROW, JAGG, RAPIDASH, 0
; SS Anne 2F Rooms
	db 17, GROWLITHE, PONYTA, 0

ChannelerData:
; Unused
	db 22, GASTLY, 0
	db 24, GASTLY, 0
	db 23, GASTLY, GASTLY, 0
	db 24, GASTLY, 0
; Pokémon Tower 3F
	db 23, MIKON, GASTLY, 0
	db 24, VULPIX, 0
; Unused - this will be used in the Silph Gauntlet
	db 65, GUARDIA, NINETALES, ANNIHILAPE, HYPNO, MUK, GENGAR, 0
; Pokémon Tower 3F
	db 25, GASTLY, HAUNTER, 0
; Pokémon Tower 4F, now unused 
	db 24, GASTLY, 0
	db 23, GASTLY, GASTLY, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 4F, now unused 
	db 22, GASTLY, 0
; Unused
;	db 24, GASTLY, 0
; Pokémon Tower 5F, now unused 
	db 23, HAUNTER, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 5F, now unused 
	db 22, GASTLY, 0
	db 24, GASTLY, 0
	db 22, HAUNTER, 0
; Pokémon Tower 6F
	db 22, GASTLY, CUBONE, HAUNTER, 0
	db 24, GASTLY, VULPIX, 0
	db 30, HAUNTER, 0
; Saffron Gym
	db 34, DROWZEE, HYPNO, 0
	db 38, ESPEON, 0
	db 33, JYNX, EXEGGCUTE, KADABRA, 0

StudentData:
	db 6, PIDGEY, HINAAZU, 0
	db 4, CLEFAIRY, 0

FirefighterData:
; For Cerulean Gym
	db 15, POLIWAG, SQUIRTLE, CHEEP, 0

JuniorData:

JackData:

INCLUDE "data/trainers/scaled_parties.asm"
INCLUDE "data/trainers/rival_parties.asm"