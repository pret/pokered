INCLUDE "data/trainers/macros.asm"

	def_trainer_class NOBODY

; if first byte != TRAINERTYPE_MULTI_LEVELS, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == TRAINERTYPE_MULTI_LEVELS, then
	; first byte is TRAINERTYPE_MULTI_LEVELS (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
	def_trainer_class YOUNGSTER
; Route 3
	def_trainer 1, 11
	tr_mon RATTATA
	tr_mon EKANS
	end_trainer

	def_trainer 2, 14
	tr_mon SPEAROW
	end_trainer

; Mt. Moon 1F
	def_trainer 3, 10
	tr_mon RATTATA
	tr_mon RATTATA
	tr_mon ZUBAT
	end_trainer

; Route 24
	def_trainer 4, 14
	tr_mon RATTATA
	tr_mon EKANS
	tr_mon ZUBAT
	end_trainer

; Route 25
	def_trainer 5, 15
	tr_mon RATTATA
	tr_mon SPEAROW
	end_trainer

	def_trainer 6, 17
	tr_mon SLOWPOKE
	end_trainer

	def_trainer 7, 14
	tr_mon EKANS
	tr_mon SANDSHREW
	end_trainer

; SS Anne 1F Rooms
	def_trainer 8, 21
	tr_mon NIDORAN_M
	end_trainer

; Route 11
	def_trainer 9, 21
	tr_mon EKANS
	end_trainer

	def_trainer 10, 19
	tr_mon SANDSHREW
	tr_mon ZUBAT
	end_trainer

	def_trainer 11, 17
	tr_mon RATTATA
	tr_mon RATTATA
	tr_mon RATICATE
	end_trainer

	def_trainer 12, 18
	tr_mon NIDORAN_M
	tr_mon NIDORINO
	end_trainer

; Unused
	def_trainer 13, 17
	tr_mon SPEAROW
	tr_mon RATTATA
	tr_mon RATTATA
	tr_mon SPEAROW
	end_trainer


BugCatcherData:
	def_trainer_class BUG_CATCHER
; Viridian Forest
	def_trainer 1, 6
	tr_mon WEEDLE
	tr_mon CATERPIE
	end_trainer

	def_trainer 2, 7
	tr_mon WEEDLE
	tr_mon KAKUNA
	tr_mon WEEDLE
	end_trainer

	def_trainer 3, 9
	tr_mon WEEDLE
	end_trainer

; Route 3
	def_trainer 4, 10
	tr_mon CATERPIE
	tr_mon WEEDLE
	tr_mon CATERPIE
	end_trainer

	def_trainer 5, 9
	tr_mon WEEDLE
	tr_mon KAKUNA
	tr_mon CATERPIE
	tr_mon METAPOD
	end_trainer

	def_trainer 6, 11
	tr_mon CATERPIE
	tr_mon METAPOD
	end_trainer

; Mt. Moon 1F
	def_trainer 7, 11
	tr_mon WEEDLE
	tr_mon KAKUNA
	end_trainer

	def_trainer 8, 10
	tr_mon CATERPIE
	tr_mon METAPOD
	tr_mon CATERPIE
	end_trainer

; Route 24
	def_trainer 9, 14
	tr_mon CATERPIE
	tr_mon WEEDLE
	end_trainer

; Route 6
	def_trainer 10, 16
	tr_mon WEEDLE
	tr_mon CATERPIE
	tr_mon WEEDLE
	end_trainer

	def_trainer 11, 20
	tr_mon BUTTERFREE
	end_trainer

; Unused
	def_trainer 12, 18
	tr_mon METAPOD
	tr_mon CATERPIE
	tr_mon VENONAT
	end_trainer

; Route 9
	def_trainer 13, 19
	tr_mon BEEDRILL
	tr_mon BEEDRILL
	end_trainer

	def_trainer 14, 20
	tr_mon CATERPIE
	tr_mon WEEDLE
	tr_mon VENONAT
	end_trainer


LassData:
	def_trainer_class LASS
; Route 3
	def_trainer 1, 9
	tr_mon PIDGEY
	tr_mon PIDGEY
	end_trainer

	def_trainer 2, 10
	tr_mon RATTATA
	tr_mon NIDORAN_M
	end_trainer

	def_trainer 3, 14
	tr_mon JIGGLYPUFF
	end_trainer

; Route 4
	def_trainer 4, 31
	tr_mon PARAS
	tr_mon PARAS
	tr_mon PARASECT
	end_trainer

; Mt. Moon 1F
	def_trainer 5, 11
	tr_mon ODDISH
	tr_mon BELLSPROUT
	end_trainer

	def_trainer 6, 14
	tr_mon CLEFAIRY
	end_trainer

; Route 24
	def_trainer 7, 16
	tr_mon PIDGEY
	tr_mon NIDORAN_F
	end_trainer

	def_trainer 8, 14
	tr_mon PIDGEY
	tr_mon NIDORAN_F
	end_trainer

; Route 25
	def_trainer 9, 15
	tr_mon NIDORAN_M
	tr_mon NIDORAN_F
	end_trainer

	def_trainer 10, 13
	tr_mon ODDISH
	tr_mon PIDGEY
	tr_mon ODDISH
	end_trainer

; SS Anne 1F Rooms
	def_trainer 11, 18
	tr_mon PIDGEY
	tr_mon NIDORAN_F
	end_trainer

; SS Anne 2F Rooms
	def_trainer 12, 18
	tr_mon RATTATA
	tr_mon PIKACHU
	end_trainer

; Route 8
	def_trainer 13, 23
	tr_mon NIDORAN_F
	tr_mon NIDORINA
	end_trainer

	def_trainer 14, 24
	tr_mon MEOWTH
	tr_mon MEOWTH
	tr_mon MEOWTH
	end_trainer

	def_trainer 15, 19
	tr_mon PIDGEY
	tr_mon RATTATA
	tr_mon NIDORAN_M
	tr_mon MEOWTH
	tr_mon PIKACHU
	end_trainer

	def_trainer 16, 22
	tr_mon CLEFAIRY
	tr_mon CLEFAIRY
	end_trainer

; Celadon Gym
	def_trainer 17, 23
	tr_mon BELLSPROUT
	tr_mon WEEPINBELL
	end_trainer

	def_trainer 18, 23
	tr_mon ODDISH
	tr_mon GLOOM
	end_trainer


SailorData:
	def_trainer_class SAILOR
; SS Anne Stern
	def_trainer 1, 18
	tr_mon MACHOP
	tr_mon SHELLDER
	end_trainer

	def_trainer 2, 17
	tr_mon MACHOP
	tr_mon TENTACOOL
	end_trainer

; SS Anne B1F Rooms
	def_trainer 3, 21
	tr_mon SHELLDER
	end_trainer

	def_trainer 4, 17
	tr_mon HORSEA
	tr_mon SHELLDER
	tr_mon TENTACOOL
	end_trainer

	def_trainer 5, 18
	tr_mon TENTACOOL
	tr_mon STARYU
	end_trainer

	def_trainer 6, 17
	tr_mon HORSEA
	tr_mon HORSEA
	tr_mon HORSEA
	end_trainer

	def_trainer 7, 20
	tr_mon MACHOP
	end_trainer

; Vermilion Gym
	def_trainer 8, 21
	tr_mon PIKACHU
	tr_mon PIKACHU
	end_trainer


JrTrainerMData:
	def_trainer_class JR_TRAINER_M
; Pewter Gym
	def_trainer 1, 11
	tr_mon DIGLETT
	tr_mon SANDSHREW
	end_trainer

; Route 24/Route 25
	def_trainer 2, 14
	tr_mon RATTATA
	tr_mon EKANS
	end_trainer

; Route 24
	def_trainer 3, 18
	tr_mon MANKEY
	end_trainer

; Route 6
	def_trainer 4, 20
	tr_mon SQUIRTLE
	end_trainer

	def_trainer 5, 16
	tr_mon SPEAROW
	tr_mon RATICATE
	end_trainer

; Unused
	def_trainer 6, 18
	tr_mon DIGLETT
	tr_mon DIGLETT
	tr_mon SANDSHREW
	end_trainer

; Route 9
	def_trainer 7, 21
	tr_mon GROWLITHE
	tr_mon CHARMANDER
	end_trainer

	def_trainer 8, 19
	tr_mon RATTATA
	tr_mon DIGLETT
	tr_mon EKANS
	tr_mon SANDSHREW
	end_trainer

; Route 12
	def_trainer 9, 29
	tr_mon NIDORAN_M
	tr_mon NIDORINO
	end_trainer


JrTrainerFData:
	def_trainer_class JR_TRAINER_F
; Cerulean Gym
	def_trainer 1, 19
	tr_mon GOLDEEN
	end_trainer

; Route 6
	def_trainer 2, 16
	tr_mon RATTATA
	tr_mon PIKACHU
	end_trainer

	def_trainer 3, 16
	tr_mon PIDGEY
	tr_mon PIDGEY
	tr_mon PIDGEY
	end_trainer

; Unused
	def_trainer 4, 22
	tr_mon BULBASAUR
	end_trainer

; Route 9
	def_trainer 5, 18
	tr_mon ODDISH
	tr_mon BELLSPROUT
	tr_mon ODDISH
	tr_mon BELLSPROUT
	end_trainer

	def_trainer 6, 23
	tr_mon MEOWTH
	end_trainer

; Route 10
	def_trainer 7, 20
	tr_mon PIKACHU
	tr_mon CLEFAIRY
	end_trainer

	def_trainer 8, 21
	tr_mon PIDGEY
	tr_mon PIDGEOTTO
	end_trainer

; Rock Tunnel B1F
	def_trainer 9, 21
	tr_mon JIGGLYPUFF
	tr_mon PIDGEY
	tr_mon MEOWTH
	end_trainer

	def_trainer 10, 22
	tr_mon ODDISH
	tr_mon BULBASAUR
	end_trainer

; Celadon Gym
	def_trainer 11, 24
	tr_mon BULBASAUR
	tr_mon IVYSAUR
	end_trainer

; Route 13
	def_trainer 12, 24
	tr_mon PIDGEY
	tr_mon MEOWTH
	tr_mon RATTATA
	tr_mon PIKACHU
	tr_mon MEOWTH
	end_trainer

	def_trainer 13, 30
	tr_mon POLIWAG
	tr_mon POLIWAG
	end_trainer

	def_trainer 14, 27
	tr_mon PIDGEY
	tr_mon MEOWTH
	tr_mon PIDGEY
	tr_mon PIDGEOTTO
	end_trainer

	def_trainer 15, 28
	tr_mon GOLDEEN
	tr_mon POLIWAG
	tr_mon HORSEA
	end_trainer

; Route 20
	def_trainer 16, 31
	tr_mon GOLDEEN
	tr_mon SEAKING
	end_trainer

; Rock Tunnel 1F
	def_trainer 17, 22
	tr_mon BELLSPROUT
	tr_mon CLEFAIRY
	end_trainer

	def_trainer 18, 20
	tr_mon MEOWTH
	tr_mon ODDISH
	tr_mon PIDGEY
	end_trainer

	def_trainer 19, 19
	tr_mon PIDGEY
	tr_mon RATTATA
	tr_mon RATTATA
	tr_mon BELLSPROUT
	end_trainer

; Route 15
	def_trainer 20, 28
	tr_mon GLOOM
	tr_mon ODDISH
	tr_mon ODDISH
	end_trainer

	def_trainer 21, 29
	tr_mon PIKACHU
	tr_mon RAICHU
	end_trainer

	def_trainer 22, 33
	tr_mon CLEFAIRY
	end_trainer

	def_trainer 23, 29
	tr_mon BELLSPROUT
	tr_mon ODDISH
	tr_mon TANGELA
	end_trainer

; Route 20
	def_trainer 24, 30
	tr_mon TENTACOOL
	tr_mon HORSEA
	tr_mon SEEL
	end_trainer


PokemaniacData:
	def_trainer_class POKEMANIAC
; Route 10
	def_trainer 1, 30
	tr_mon RHYHORN
	tr_mon LICKITUNG
	end_trainer

	def_trainer 2, 20
	tr_mon CUBONE
	tr_mon SLOWPOKE
	end_trainer

; Rock Tunnel B1F
	def_trainer 3, 20
	tr_mon SLOWPOKE
	tr_mon SLOWPOKE
	tr_mon SLOWPOKE
	end_trainer

	def_trainer 4, 22
	tr_mon CHARMANDER
	tr_mon CUBONE
	end_trainer

	def_trainer 5, 25
	tr_mon SLOWPOKE
	end_trainer

; Victory Road 2F
	def_trainer 6, 40
	tr_mon CHARMELEON
	tr_mon LAPRAS
	tr_mon LICKITUNG
	end_trainer

; Rock Tunnel 1F
	def_trainer 7, 23
	tr_mon CUBONE
	tr_mon SLOWPOKE
	end_trainer


SuperNerdData:
	def_trainer_class SUPER_NERD
; Mt. Moon 1F
	def_trainer 1, 11
	tr_mon MAGNEMITE
	tr_mon VOLTORB
	end_trainer

; Mt. Moon B2F
	def_trainer 2, 12
	tr_mon GRIMER
	tr_mon VOLTORB
	tr_mon KOFFING
	end_trainer

; Route 8
	def_trainer 3, 20
	tr_mon VOLTORB
	tr_mon KOFFING
	tr_mon VOLTORB
	tr_mon MAGNEMITE
	end_trainer

	def_trainer 4, 22
	tr_mon GRIMER
	tr_mon MUK
	tr_mon GRIMER
	end_trainer

	def_trainer 5, 26
	tr_mon KOFFING
	end_trainer

; Unused
	def_trainer 6, 22
	tr_mon KOFFING
	tr_mon MAGNEMITE
	tr_mon WEEZING
	end_trainer

	def_trainer 7, 20
	tr_mon MAGNEMITE
	tr_mon MAGNEMITE
	tr_mon KOFFING
	tr_mon MAGNEMITE
	end_trainer

	def_trainer 8, 24
	tr_mon MAGNEMITE
	tr_mon VOLTORB
	end_trainer

; Cinnabar Gym
	def_trainer 9, 36
	tr_mon VULPIX
	tr_mon VULPIX
	tr_mon NINETALES
	end_trainer

	def_trainer 10, 34
	tr_mon PONYTA
	tr_mon CHARMANDER
	tr_mon VULPIX
	tr_mon GROWLITHE
	end_trainer

	def_trainer 11, 41
	tr_mon RAPIDASH
	end_trainer

	def_trainer 12, 37
	tr_mon GROWLITHE
	tr_mon VULPIX
	end_trainer


HikerData:
	def_trainer_class HIKER
; Mt. Moon 1F
	def_trainer 1, 10
	tr_mon GEODUDE
	tr_mon GEODUDE
	tr_mon ONIX
	end_trainer

; Route 25
	def_trainer 2, 15
	tr_mon MACHOP
	tr_mon GEODUDE
	end_trainer

	def_trainer 3, 13
	tr_mon GEODUDE
	tr_mon GEODUDE
	tr_mon MACHOP
	tr_mon GEODUDE
	end_trainer

	def_trainer 4, 17
	tr_mon ONIX
	end_trainer

; Route 9
	def_trainer 5, 21
	tr_mon GEODUDE
	tr_mon ONIX
	end_trainer

	def_trainer 6, 20
	tr_mon GEODUDE
	tr_mon MACHOP
	tr_mon GEODUDE
	end_trainer

; Route 10
	def_trainer 7, 21
	tr_mon GEODUDE
	tr_mon ONIX
	end_trainer

	def_trainer 8, 19
	tr_mon ONIX
	tr_mon GRAVELER
	end_trainer

; Rock Tunnel B1F
	def_trainer 9, 21
	tr_mon GEODUDE
	tr_mon GEODUDE
	tr_mon GRAVELER
	end_trainer

	def_trainer 10, 25
	tr_mon GEODUDE
	end_trainer

; Route 9/Rock Tunnel B1F
	def_trainer 11, 20
	tr_mon MACHOP
	tr_mon ONIX
	end_trainer

; Rock Tunnel 1F
	def_trainer 12, 19
	tr_mon GEODUDE
	tr_mon MACHOP
	tr_mon GEODUDE
	tr_mon GEODUDE
	end_trainer

	def_trainer 13, 20
	tr_mon ONIX
	tr_mon ONIX
	tr_mon GEODUDE
	end_trainer

	def_trainer 14, 21
	tr_mon GEODUDE
	tr_mon GRAVELER
	end_trainer


BikerData:
	def_trainer_class BIKER
; Route 13
	def_trainer 1, 28
	tr_mon KOFFING
	tr_mon KOFFING
	tr_mon KOFFING
	end_trainer

; Route 14
	def_trainer 2, 29
	tr_mon KOFFING
	tr_mon GRIMER
	end_trainer

; Route 15
	def_trainer 3, 25
	tr_mon KOFFING
	tr_mon KOFFING
	tr_mon WEEZING
	tr_mon KOFFING
	tr_mon GRIMER
	end_trainer

	def_trainer 4, 28
	tr_mon KOFFING
	tr_mon GRIMER
	tr_mon WEEZING
	end_trainer

; Route 16
	def_trainer 5, 29
	tr_mon GRIMER
	tr_mon KOFFING
	end_trainer

	def_trainer 6, 33
	tr_mon WEEZING
	end_trainer

	def_trainer 7, 26
	tr_mon GRIMER
	tr_mon GRIMER
	tr_mon GRIMER
	tr_mon GRIMER
	end_trainer

; Route 17
	; From https://www.smogon.com/smog/issue27/glitch:
	; 0E:5FC2 is offset of the ending 0 for this first Biker on Route 17.
	; BaseStats + (BASE_DATA_SIZE) * (000 - 1) = $5FC2;
	; that's the formula from GetMonHeader for the base stats of mon #000.
	; (BaseStats = $43DE and BANK(BaseStats) = $0E.)
	; Finally, PokedexOrder lists 0 as the dex ID for every MissingNo.
	; The result is that this data gets interpreted as the base stats
	; for MissingNo: 0, 33, MUK, 0, 29, VOLTORB, VOLTORB, 0, ..., 28, GRIMER, GRIMER.
	def_trainer 8, 28
	tr_mon WEEZING
	tr_mon KOFFING
	tr_mon WEEZING
	end_trainer

	def_trainer 9, 33
	tr_mon MUK
	end_trainer

	def_trainer 10, 29
	tr_mon VOLTORB
	tr_mon VOLTORB
	end_trainer

	def_trainer 11, 29
	tr_mon WEEZING
	tr_mon MUK
	end_trainer

	def_trainer 12, 25
	tr_mon KOFFING
	tr_mon WEEZING
	tr_mon KOFFING
	tr_mon KOFFING
	tr_mon WEEZING
	end_trainer

; Route 14
	def_trainer 13, 26
	tr_mon KOFFING
	tr_mon KOFFING
	tr_mon GRIMER
	tr_mon KOFFING
	end_trainer

	def_trainer 14, 28
	tr_mon GRIMER
	tr_mon GRIMER
	tr_mon KOFFING
	end_trainer

	def_trainer 15, 29
	tr_mon KOFFING
	tr_mon MUK
	end_trainer


BurglarData:
	def_trainer_class BURGLAR
; Unused
	def_trainer 1, 29
	tr_mon GROWLITHE
	tr_mon VULPIX
	end_trainer

	def_trainer 2, 33
	tr_mon GROWLITHE
	end_trainer

	def_trainer 3, 28
	tr_mon VULPIX
	tr_mon CHARMANDER
	tr_mon PONYTA
	end_trainer

; Cinnabar Gym
	def_trainer 4, 36
	tr_mon GROWLITHE
	tr_mon VULPIX
	tr_mon NINETALES
	end_trainer

	def_trainer 5, 41
	tr_mon PONYTA
	end_trainer

	def_trainer 6, 37
	tr_mon VULPIX
	tr_mon GROWLITHE
	end_trainer

; Mansion 2F
	def_trainer 7, 34
	tr_mon CHARMANDER
	tr_mon CHARMELEON
	end_trainer

; Mansion 3F
	def_trainer 8, 38
	tr_mon NINETALES
	end_trainer

; Mansion B1F
	def_trainer 9, 34
	tr_mon GROWLITHE
	tr_mon PONYTA
	end_trainer


EngineerData:
	def_trainer_class ENGINEER
; Unused
	def_trainer 1, 21
	tr_mon VOLTORB
	tr_mon MAGNEMITE
	end_trainer

; Route 11
	def_trainer 2, 21
	tr_mon MAGNEMITE
	end_trainer

	def_trainer 3, 18
	tr_mon MAGNEMITE
	tr_mon MAGNEMITE
	tr_mon MAGNETON
	end_trainer


UnusedJugglerData:
	def_trainer_class UNUSED_JUGGLER
; none

FisherData:
	def_trainer_class FISHER
; SS Anne 2F Rooms
	def_trainer 1, 17
	tr_mon GOLDEEN
	tr_mon TENTACOOL
	tr_mon GOLDEEN
	end_trainer

; SS Anne B1F Rooms
	def_trainer 2, 17
	tr_mon TENTACOOL
	tr_mon STARYU
	tr_mon SHELLDER
	end_trainer

; Route 12
	def_trainer 3, 22
	tr_mon GOLDEEN
	tr_mon POLIWAG
	tr_mon GOLDEEN
	end_trainer

	def_trainer 4, 24
	tr_mon TENTACOOL
	tr_mon GOLDEEN
	end_trainer

	def_trainer 5, 27
	tr_mon GOLDEEN
	end_trainer

	def_trainer 6, 21
	tr_mon POLIWAG
	tr_mon SHELLDER
	tr_mon GOLDEEN
	tr_mon HORSEA
	end_trainer

; Route 21
	def_trainer 7, 28
	tr_mon SEAKING
	tr_mon GOLDEEN
	tr_mon SEAKING
	tr_mon SEAKING
	end_trainer

	def_trainer 8, 31
	tr_mon SHELLDER
	tr_mon CLOYSTER
	end_trainer

	def_trainer 9, 27
	tr_mon MAGIKARP
	tr_mon MAGIKARP
	tr_mon MAGIKARP
	tr_mon MAGIKARP
	tr_mon MAGIKARP
	tr_mon MAGIKARP
	end_trainer

	def_trainer 10, 33
	tr_mon SEAKING
	tr_mon GOLDEEN
	end_trainer

; Route 12
	def_trainer 11, 24
	tr_mon MAGIKARP
	tr_mon MAGIKARP
	end_trainer


SwimmerData:
	def_trainer_class SWIMMER
; Cerulean Gym
	def_trainer 1, 16
	tr_mon HORSEA
	tr_mon SHELLDER
	end_trainer

; Route 19
	def_trainer 2, 30
	tr_mon TENTACOOL
	tr_mon SHELLDER
	end_trainer

	def_trainer 3, 29
	tr_mon GOLDEEN
	tr_mon HORSEA
	tr_mon STARYU
	end_trainer

	def_trainer 4, 30
	tr_mon POLIWAG
	tr_mon POLIWHIRL
	end_trainer

	def_trainer 5, 27
	tr_mon HORSEA
	tr_mon TENTACOOL
	tr_mon TENTACOOL
	tr_mon GOLDEEN
	end_trainer

	def_trainer 6, 29
	tr_mon GOLDEEN
	tr_mon SHELLDER
	tr_mon SEAKING
	end_trainer

	def_trainer 7, 30
	tr_mon HORSEA
	tr_mon HORSEA
	end_trainer

	def_trainer 8, 27
	tr_mon TENTACOOL
	tr_mon TENTACOOL
	tr_mon STARYU
	tr_mon HORSEA
	tr_mon TENTACRUEL
	end_trainer

; Route 20
	def_trainer 9, 31
	tr_mon SHELLDER
	tr_mon CLOYSTER
	end_trainer

	def_trainer 10, 35
	tr_mon STARYU
	end_trainer

	def_trainer 11, 28
	tr_mon HORSEA
	tr_mon HORSEA
	tr_mon SEADRA
	tr_mon HORSEA
	end_trainer

; Route 21
	def_trainer 12, 33
	tr_mon SEADRA
	tr_mon TENTACRUEL
	end_trainer

	def_trainer 13, 37
	tr_mon STARMIE
	end_trainer

	def_trainer 14, 33
	tr_mon STARYU
	tr_mon WARTORTLE
	end_trainer

	def_trainer 15, 32
	tr_mon POLIWHIRL
	tr_mon TENTACOOL
	tr_mon SEADRA
	end_trainer


CueBallData:
	def_trainer_class CUE_BALL
; Route 16
	def_trainer 1, 28
	tr_mon MACHOP
	tr_mon MANKEY
	tr_mon MACHOP
	end_trainer

	def_trainer 2, 29
	tr_mon MANKEY
	tr_mon MACHOP
	end_trainer

	def_trainer 3, 33
	tr_mon MACHOP
	end_trainer

; Route 17
	def_trainer 4, 29
	tr_mon MANKEY
	tr_mon PRIMEAPE
	end_trainer

	def_trainer 5, 29
	tr_mon MACHOP
	tr_mon MACHOKE
	end_trainer

	def_trainer 6, 33
	tr_mon MACHOKE
	end_trainer

	def_trainer 7, 26
	tr_mon MANKEY
	tr_mon MANKEY
	tr_mon MACHOKE
	tr_mon MACHOP
	end_trainer

	def_trainer 8, 29
	tr_mon PRIMEAPE
	tr_mon MACHOKE
	end_trainer

; Route 21
	def_trainer 9, 31
	tr_mon TENTACOOL
	tr_mon TENTACOOL
	tr_mon TENTACRUEL
	end_trainer


GamblerData:
	def_trainer_class GAMBLER
; Route 11
	def_trainer 1, 18
	tr_mon POLIWAG
	tr_mon HORSEA
	end_trainer

	def_trainer 2, 18
	tr_mon BELLSPROUT
	tr_mon ODDISH
	end_trainer

	def_trainer 3, 18
	tr_mon VOLTORB
	tr_mon MAGNEMITE
	end_trainer

	def_trainer 4, 18
	tr_mon GROWLITHE
	tr_mon VULPIX
	end_trainer

; Route 8
	def_trainer 5, 22
	tr_mon POLIWAG
	tr_mon POLIWAG
	tr_mon POLIWHIRL
	end_trainer

; Unused
	def_trainer 6, 22
	tr_mon ONIX
	tr_mon GEODUDE
	tr_mon GRAVELER
	end_trainer

; Route 8
	def_trainer 7, 24
	tr_mon GROWLITHE
	tr_mon VULPIX
	end_trainer


BeautyData:
	def_trainer_class BEAUTY
; Celadon Gym
	def_trainer 1, 21
	tr_mon ODDISH
	tr_mon BELLSPROUT
	tr_mon ODDISH
	tr_mon BELLSPROUT
	end_trainer

	def_trainer 2, 24
	tr_mon BELLSPROUT
	tr_mon BELLSPROUT
	end_trainer

	def_trainer 3, 26
	tr_mon EXEGGCUTE
	end_trainer

; Route 13
	def_trainer 4, 27
	tr_mon RATTATA
	tr_mon PIKACHU
	tr_mon RATTATA
	end_trainer

	def_trainer 5, 29
	tr_mon CLEFAIRY
	tr_mon MEOWTH
	end_trainer

; Route 20
	def_trainer 6, 35
	tr_mon SEAKING
	end_trainer

	def_trainer 7, 30
	tr_mon SHELLDER
	tr_mon SHELLDER
	tr_mon CLOYSTER
	end_trainer

	def_trainer 8, 31
	tr_mon POLIWAG
	tr_mon SEAKING
	end_trainer

; Route 15
	def_trainer 9, 29
	tr_mon PIDGEOTTO
	tr_mon WIGGLYTUFF
	end_trainer

	def_trainer 10, 29
	tr_mon BULBASAUR
	tr_mon IVYSAUR
	end_trainer

; Unused
	def_trainer 11, 33
	tr_mon WEEPINBELL
	tr_mon BELLSPROUT
	tr_mon WEEPINBELL
	end_trainer

; Route 19
	def_trainer 12, 27
	tr_mon POLIWAG
	tr_mon GOLDEEN
	tr_mon SEAKING
	tr_mon GOLDEEN
	tr_mon POLIWAG
	end_trainer

	def_trainer 13, 30
	tr_mon GOLDEEN
	tr_mon SEAKING
	end_trainer

	def_trainer 14, 29
	tr_mon STARYU
	tr_mon STARYU
	tr_mon STARYU
	end_trainer

; Route 20
	def_trainer 15, 30
	tr_mon SEADRA
	tr_mon HORSEA
	tr_mon SEADRA
	end_trainer


PsychicData:
	def_trainer_class PSYCHIC_TR
; Saffron Gym
	def_trainer 1, 31
	tr_mon KADABRA
	tr_mon SLOWPOKE
	tr_mon MR_MIME
	tr_mon KADABRA
	end_trainer

	def_trainer 2, 34
	tr_mon MR_MIME
	tr_mon KADABRA
	end_trainer

	def_trainer 3, 33
	tr_mon SLOWPOKE
	tr_mon SLOWPOKE
	tr_mon SLOWBRO
	end_trainer

	def_trainer 4, 38
	tr_mon SLOWBRO
	end_trainer


RockerData:
	def_trainer_class ROCKER
; Vermilion Gym
	def_trainer 1, 20
	tr_mon VOLTORB
	tr_mon MAGNEMITE
	tr_mon VOLTORB
	end_trainer

; Route 12
	def_trainer 2, 29
	tr_mon VOLTORB
	tr_mon ELECTRODE
	end_trainer


JugglerData:
	def_trainer_class JUGGLER
; Silph Co. 5F
	def_trainer 1, 29
	tr_mon KADABRA
	tr_mon MR_MIME
	end_trainer

; Victory Road 2F
	def_trainer 2, 41
	tr_mon DROWZEE
	tr_mon HYPNO
	tr_mon KADABRA
	tr_mon KADABRA
	end_trainer

; Fuchsia Gym
	def_trainer 3, 31
	tr_mon DROWZEE
	tr_mon DROWZEE
	tr_mon KADABRA
	tr_mon DROWZEE
	end_trainer

	def_trainer 4, 34
	tr_mon DROWZEE
	tr_mon HYPNO
	end_trainer

; Victory Road 2F
	def_trainer 5, 48
	tr_mon MR_MIME
	end_trainer

; Unused
	def_trainer 6, 33
	tr_mon HYPNO
	end_trainer

; Fuchsia Gym
	def_trainer 7, 38
	tr_mon HYPNO
	end_trainer

	def_trainer 8, 34
	tr_mon DROWZEE
	tr_mon KADABRA
	end_trainer


TamerData:
	def_trainer_class TAMER
; Fuchsia Gym
	def_trainer 1, 34
	tr_mon SANDSLASH
	tr_mon ARBOK
	end_trainer

	def_trainer 2, 33
	tr_mon ARBOK
	tr_mon SANDSLASH
	tr_mon ARBOK
	end_trainer

; Viridian Gym
	def_trainer 3, 43
	tr_mon RHYHORN
	end_trainer

	def_trainer 4, 39
	tr_mon ARBOK
	tr_mon TAUROS
	end_trainer

; Victory Road 2F
	def_trainer 5, 44
	tr_mon PERSIAN
	tr_mon GOLDUCK
	end_trainer

; Unused
	def_trainer 6, 42
	tr_mon RHYHORN
	tr_mon PRIMEAPE
	tr_mon ARBOK
	tr_mon TAUROS
	end_trainer


BirdKeeperData:
	def_trainer_class BIRD_KEEPER
; Route 13
	def_trainer 1, 29
	tr_mon PIDGEY
	tr_mon PIDGEOTTO
	end_trainer

	def_trainer 2, 25
	tr_mon SPEAROW
	tr_mon PIDGEY
	tr_mon PIDGEY
	tr_mon SPEAROW
	tr_mon SPEAROW
	end_trainer

	def_trainer 3, 26
	tr_mon PIDGEY
	tr_mon PIDGEOTTO
	tr_mon SPEAROW
	tr_mon FEAROW
	end_trainer

; Route 14
	def_trainer 4, 33
	tr_mon FARFETCHD
	end_trainer

	def_trainer 5, 29
	tr_mon SPEAROW
	tr_mon FEAROW
	end_trainer

; Route 15
	def_trainer 6, 26
	tr_mon PIDGEOTTO
	tr_mon FARFETCHD
	tr_mon DODUO
	tr_mon PIDGEY
	end_trainer

	def_trainer 7, 28
	tr_mon DODRIO
	tr_mon DODUO
	tr_mon DODUO
	end_trainer

; Route 18
	def_trainer 8, 29
	tr_mon SPEAROW
	tr_mon FEAROW
	end_trainer

	def_trainer 9, 34
	tr_mon DODRIO
	end_trainer

	def_trainer 10, 26
	tr_mon SPEAROW
	tr_mon SPEAROW
	tr_mon FEAROW
	tr_mon SPEAROW
	end_trainer

; Route 20
	def_trainer 11, 30
	tr_mon FEAROW
	tr_mon FEAROW
	tr_mon PIDGEOTTO
	end_trainer

; Unused
	def_trainer 12, 39
	tr_mon PIDGEOTTO
	tr_mon PIDGEOTTO
	tr_mon PIDGEY
	tr_mon PIDGEOTTO
	end_trainer

	def_trainer 13, 42
	tr_mon FARFETCHD
	tr_mon FEAROW
	end_trainer

; Route 14
	def_trainer 14, 28
	tr_mon PIDGEY
	tr_mon DODUO
	tr_mon PIDGEOTTO
	end_trainer

	def_trainer 15, 26
	tr_mon PIDGEY
	tr_mon SPEAROW
	tr_mon PIDGEY
	tr_mon FEAROW
	end_trainer

	def_trainer 16, 29
	tr_mon PIDGEOTTO
	tr_mon FEAROW
	end_trainer

	def_trainer 17, 28
	tr_mon SPEAROW
	tr_mon DODUO
	tr_mon FEAROW
	end_trainer


BlackbeltData:
	def_trainer_class BLACKBELT
; Fighting Dojo
	def_trainer 1, 37
	tr_mon HITMONLEE
	tr_mon HITMONCHAN
	end_trainer

	def_trainer 2, 31
	tr_mon MANKEY
	tr_mon MANKEY
	tr_mon PRIMEAPE
	end_trainer

	def_trainer 3, 32
	tr_mon MACHOP
	tr_mon MACHOKE
	end_trainer

	def_trainer 4, 36
	tr_mon PRIMEAPE
	end_trainer

	def_trainer 5, 31
	tr_mon MACHOP
	tr_mon MANKEY
	tr_mon PRIMEAPE
	end_trainer

; Viridian Gym
	def_trainer 6, 40
	tr_mon MACHOP
	tr_mon MACHOKE
	end_trainer

	def_trainer 7, 43
	tr_mon MACHOKE
	end_trainer

	def_trainer 8, 38
	tr_mon MACHOKE
	tr_mon MACHOP
	tr_mon MACHOKE
	end_trainer

; Victory Road 2F
	def_trainer 9, 43
	tr_mon MACHOKE
	tr_mon MACHOP
	tr_mon MACHOKE
	end_trainer


Rival1Data:
	def_trainer_class RIVAL1
	def_trainer 1, 5
	tr_mon SQUIRTLE
	end_trainer

	def_trainer 2, 5
	tr_mon BULBASAUR
	end_trainer

	def_trainer 3, 5
	tr_mon CHARMANDER
	end_trainer

; Route 22
	def_trainer 4, TRAINERTYPE_MULTI_LEVELS
	tr_mon 9, PIDGEY
	tr_mon 8, SQUIRTLE
	end_trainer

	def_trainer 5, TRAINERTYPE_MULTI_LEVELS
	tr_mon 9, PIDGEY
	tr_mon 8, BULBASAUR
	end_trainer

	def_trainer 6, TRAINERTYPE_MULTI_LEVELS
	tr_mon 9, PIDGEY
	tr_mon 8, CHARMANDER
	end_trainer

; Cerulean City
	def_trainer 7, TRAINERTYPE_MULTI_LEVELS
	tr_mon 18, PIDGEOTTO
	tr_mon 15, ABRA
	tr_mon 15, RATTATA
	tr_mon 17, SQUIRTLE
	end_trainer

	def_trainer 8, TRAINERTYPE_MULTI_LEVELS
	tr_mon 18, PIDGEOTTO
	tr_mon 15, ABRA
	tr_mon 15, RATTATA
	tr_mon 17, BULBASAUR
	end_trainer

	def_trainer 9, TRAINERTYPE_MULTI_LEVELS
	tr_mon 18, PIDGEOTTO
	tr_mon 15, ABRA
	tr_mon 15, RATTATA
	tr_mon 17, CHARMANDER
	end_trainer


ProfOakData:
	def_trainer_class PROF_OAK
; Unused
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 66, TAUROS
	tr_mon 67, EXEGGUTOR
	tr_mon 68, ARCANINE
	tr_mon 69, BLASTOISE
	tr_mon 70, GYARADOS
	end_trainer

	def_trainer 2, TRAINERTYPE_MULTI_LEVELS
	tr_mon 66, TAUROS
	tr_mon 67, EXEGGUTOR
	tr_mon 68, ARCANINE
	tr_mon 69, VENUSAUR
	tr_mon 70, GYARADOS
	end_trainer

	def_trainer 3, TRAINERTYPE_MULTI_LEVELS
	tr_mon 66, TAUROS
	tr_mon 67, EXEGGUTOR
	tr_mon 68, ARCANINE
	tr_mon 69, CHARIZARD
	tr_mon 70, GYARADOS
	end_trainer


ChiefData:
	def_trainer_class CHIEF
; none

ScientistData:
	def_trainer_class SCIENTIST
; Unused
	def_trainer 1, 34
	tr_mon KOFFING
	tr_mon VOLTORB
	end_trainer

; Silph Co. 2F
	def_trainer 2, 26
	tr_mon GRIMER
	tr_mon WEEZING
	tr_mon KOFFING
	tr_mon WEEZING
	end_trainer

	def_trainer 3, 28
	tr_mon MAGNEMITE
	tr_mon VOLTORB
	tr_mon MAGNETON
	end_trainer

; Silph Co. 3F/Mansion 1F
	def_trainer 4, 29
	tr_mon ELECTRODE
	tr_mon WEEZING
	end_trainer

; Silph Co. 4F
	def_trainer 5, 33
	tr_mon ELECTRODE
	end_trainer

; Silph Co. 5F
	def_trainer 6, 26
	tr_mon MAGNETON
	tr_mon KOFFING
	tr_mon WEEZING
	tr_mon MAGNEMITE
	end_trainer

; Silph Co. 6F
	def_trainer 7, 25
	tr_mon VOLTORB
	    tr_moves TACKLE, SCREECH, SONICBOOM, SELFDESTRUCT
	    tr_dvs $78, $BC
	tr_mon KOFFING
		tr_moves TACKLE, SMOG, SLUDGE, SELFDESTRUCT
		tr_dvs $4F, $63
	tr_mon MAGNETON
	    tr_moves THUNDERBOLT, SONICBOOM, SWIFT, THUNDER_WAVE
		tr_dvs $FE, $9F
	tr_mon MAGNEMITE
	    tr_moves TACKLE, SONICBOOM, THUNDER_WAVE, THUNDERSHOCK
	    tr_dvs $FE, $9F
	tr_mon KOFFING
	    tr_moves SELFDESTRUCT, NO_MOVE, NO_MOVE, NO_MOVE
		tr_dvs $FE, $9F
	end_trainer

; Silph Co. 7F
	def_trainer 8, 29
	tr_mon ELECTRODE
	tr_mon MUK
	end_trainer

; Silph Co. 8F
	def_trainer 9, 29
	tr_mon GRIMER
	tr_mon ELECTRODE
	end_trainer

; Silph Co. 9F
	def_trainer 10, 28
	tr_mon VOLTORB
	tr_mon KOFFING
	tr_mon MAGNETON
	end_trainer

; Silph Co. 10F
	def_trainer 11, 29
	tr_mon MAGNEMITE
	tr_mon KOFFING
	end_trainer

; Mansion 3F
	def_trainer 12, 33
	tr_mon MAGNEMITE
	tr_mon MAGNETON
	tr_mon VOLTORB
	end_trainer

; Mansion B1F
	def_trainer 13, 34
	tr_mon MAGNEMITE
	tr_mon ELECTRODE
	end_trainer


GiovanniData:
	def_trainer_class GIOVANNI
; Rocket Hideout B4F
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 25, ONIX
	tr_mon 24, RHYHORN
	tr_mon 29, KANGASKHAN
	end_trainer

; Silph Co. 11F
	def_trainer 2, TRAINERTYPE_MULTI_LEVELS
	tr_mon 37, NIDORINO
	tr_mon 35, KANGASKHAN
	tr_mon 37, RHYHORN
	tr_mon 41, NIDOQUEEN
	end_trainer

; Viridian Gym
	def_trainer 3, TRAINERTYPE_MULTI_LEVELS
	tr_mon 45, RHYHORN
	    tr_moves STOMP, TAIL_WHIP, FURY_ATTACK, HORN_DRILL
	tr_mon 42, DUGTRIO
	    tr_moves GROWL, DIG, SAND_ATTACK, SLASH
	tr_mon 44, NIDOQUEEN
		tr_moves SCRATCH, TAIL_WHIP, BODY_SLAM, POISON_STING
	tr_mon 45, NIDOKING
		tr_moves TACKLE, HORN_ATTACK, POISON_STING, THRASH
	tr_mon 50, RHYDON
		tr_moves STOMP, TAIL_WHIP, FISSURE, HORN_DRILL
	end_trainer


RocketData:
	def_trainer_class ROCKET
; Mt. Moon B2F
	def_trainer 1, 13
	tr_mon RATTATA
	tr_mon ZUBAT
	end_trainer

	def_trainer 2, 11
	tr_mon SANDSHREW
	tr_mon RATTATA
	tr_mon ZUBAT
	end_trainer

	def_trainer 3, 12
	tr_mon ZUBAT
	tr_mon EKANS
	end_trainer

	def_trainer 4, 16
	tr_mon RATICATE
	end_trainer

; Cerulean City
	def_trainer 5, 17
	tr_mon MACHOP
	tr_mon DROWZEE
	end_trainer

; Route 24
	def_trainer 6, 15
	tr_mon EKANS
	tr_mon ZUBAT
	end_trainer

; Game Corner
	def_trainer 7, 20
	tr_mon RATICATE
	tr_mon ZUBAT
	end_trainer

; Rocket Hideout B1F
	def_trainer 8, 21
	tr_mon DROWZEE
	tr_mon MACHOP
	end_trainer

	def_trainer 9, 21
	tr_mon RATICATE
	tr_mon RATICATE
	end_trainer

	def_trainer 10, 20
	tr_mon GRIMER
	tr_mon KOFFING
	tr_mon KOFFING
	end_trainer

	def_trainer 11, 19
	tr_mon RATTATA
	tr_mon RATICATE
	tr_mon RATICATE
	tr_mon RATTATA
	end_trainer

	def_trainer 12, 22
	tr_mon GRIMER
	tr_mon KOFFING
	end_trainer

; Rocket Hideout B2F
	def_trainer 13, 17
	tr_mon ZUBAT
	tr_mon KOFFING
	tr_mon GRIMER
	tr_mon ZUBAT
	tr_mon RATICATE
	end_trainer

; Rocket Hideout B3F
	def_trainer 14, 20
	tr_mon RATTATA
	tr_mon RATICATE
	tr_mon DROWZEE
	end_trainer

	def_trainer 15, 21
	tr_mon MACHOP
	tr_mon MACHOP
	end_trainer

; Rocket Hideout B4F
	def_trainer 16, 23
	tr_mon SANDSHREW
	tr_mon EKANS
	tr_mon SANDSLASH
	end_trainer

	def_trainer 17, 23
	tr_mon EKANS
	tr_mon SANDSHREW
	tr_mon ARBOK
	end_trainer

	def_trainer 18, 21
	tr_mon KOFFING
	tr_mon ZUBAT
	end_trainer

; Pokémon Tower 7F
	def_trainer 19, 25
	tr_mon ZUBAT
	tr_mon ZUBAT
	tr_mon GOLBAT
	end_trainer

	def_trainer 20, 26
	tr_mon KOFFING
	tr_mon DROWZEE
	end_trainer

	def_trainer 21, 23
	tr_mon ZUBAT
	tr_mon RATTATA
	tr_mon RATICATE
	tr_mon ZUBAT
	end_trainer

; Unused
	def_trainer 22, 26
	tr_mon DROWZEE
	tr_mon KOFFING
	end_trainer

; Silph Co. 2F
	def_trainer 23, 29
	tr_mon CUBONE
	tr_mon ZUBAT
	end_trainer

	def_trainer 24, 25
	tr_mon GOLBAT
	tr_mon ZUBAT
	tr_mon ZUBAT
	tr_mon RATICATE
	tr_mon ZUBAT
	end_trainer

; Silph Co. 3F
	def_trainer 25, 28
	tr_mon RATICATE
	tr_mon HYPNO
	tr_mon RATICATE
	end_trainer

; Silph Co. 4F
	def_trainer 26, 29
	tr_mon MACHOP
	tr_mon DROWZEE
	end_trainer

	def_trainer 27, 28
	tr_mon EKANS
	tr_mon ZUBAT
	tr_mon CUBONE
	end_trainer

; Silph Co. 5F
	def_trainer 28, 33
	tr_mon ARBOK
	end_trainer

	def_trainer 29, 33
	tr_mon HYPNO
	end_trainer

; Silph Co. 6F
	def_trainer 30, 29
	tr_mon MACHOP
	tr_mon MACHOKE
	end_trainer

	def_trainer 31, 28
	tr_mon ZUBAT
	tr_mon ZUBAT
	tr_mon GOLBAT
	end_trainer

; Silph Co. 7F
	def_trainer 32, 26
	tr_mon RATICATE
	tr_mon ARBOK
	tr_mon KOFFING
	tr_mon GOLBAT
	end_trainer

	def_trainer 33, 29
	tr_mon CUBONE
	tr_mon CUBONE
	end_trainer

	def_trainer 34, 29
	tr_mon SANDSHREW
	tr_mon SANDSLASH
	end_trainer

; Silph Co. 8F
	def_trainer 35, 26
	tr_mon RATICATE
	tr_mon ZUBAT
	tr_mon GOLBAT
	tr_mon RATTATA
	end_trainer

	def_trainer 36, 28
	tr_mon WEEZING
	tr_mon GOLBAT
	tr_mon KOFFING
	end_trainer

; Silph Co. 9F
	def_trainer 37, 28
	tr_mon DROWZEE
	tr_mon GRIMER
	tr_mon MACHOP
	end_trainer

	def_trainer 38, 28
	tr_mon GOLBAT
	tr_mon DROWZEE
	tr_mon HYPNO
	end_trainer

; Silph Co. 10F
	def_trainer 39, 33
	tr_mon MACHOKE
	end_trainer

; Silph Co. 11F
	def_trainer 40, 25
	tr_mon RATTATA
	tr_mon RATTATA
	tr_mon ZUBAT
	tr_mon RATTATA
	tr_mon EKANS
	end_trainer

	def_trainer 41, 32
	tr_mon CUBONE
	tr_mon DROWZEE
	tr_mon MAROWAK
	end_trainer


CooltrainerMData:
	def_trainer_class COOLTRAINER_M
; Viridian Gym
	def_trainer 1, 39
	tr_mon NIDORINO
	tr_mon NIDOKING
	end_trainer

; Victory Road 3F
	def_trainer 2, 43
	tr_mon EXEGGUTOR
	tr_mon CLOYSTER
	tr_mon ARCANINE
	end_trainer

	def_trainer 3, 43
	tr_mon KINGLER
	tr_mon TENTACRUEL
	tr_mon BLASTOISE
	end_trainer

; Unused
	def_trainer 4, 45
	tr_mon KINGLER
	tr_mon STARMIE
	end_trainer

; Victory Road 1F
	def_trainer 5, 42
	tr_mon IVYSAUR
	tr_mon WARTORTLE
	tr_mon CHARMELEON
	tr_mon CHARIZARD
	end_trainer

; Unused
	def_trainer 6, 44
	tr_mon IVYSAUR
	tr_mon WARTORTLE
	tr_mon CHARMELEON
	end_trainer

	def_trainer 7, 49
	tr_mon NIDOKING
	end_trainer

	def_trainer 8, 44
	tr_mon KINGLER
	tr_mon CLOYSTER
	end_trainer

; Viridian Gym
	def_trainer 9, 39
	tr_mon SANDSLASH
	tr_mon DUGTRIO
	end_trainer

	def_trainer 10, 43
	tr_mon RHYHORN
	end_trainer


CooltrainerFData:
	def_trainer_class COOLTRAINER_F
; Celadon Gym
	def_trainer 1, 24
	tr_mon WEEPINBELL
	tr_mon GLOOM
	tr_mon IVYSAUR
	end_trainer

; Victory Road 3F
	def_trainer 2, 43
	tr_mon BELLSPROUT
	tr_mon WEEPINBELL
	tr_mon VICTREEBEL
	end_trainer

	def_trainer 3, 43
	tr_mon PARASECT
	tr_mon DEWGONG
	tr_mon CHANSEY
	end_trainer

; Unused
	def_trainer 4, 46
	tr_mon VILEPLUME
	tr_mon BUTTERFREE
	end_trainer

; Victory Road 1F
	def_trainer 5, 44
	tr_mon PERSIAN
	tr_mon NINETALES
	end_trainer

; Unused
	def_trainer 6, 45
	tr_mon IVYSAUR
	tr_mon VENUSAUR
	end_trainer

	def_trainer 7, 45
	tr_mon NIDORINA
	tr_mon NIDOQUEEN
	end_trainer

	def_trainer 8, 43
	tr_mon PERSIAN
	tr_mon NINETALES
	tr_mon RAICHU
	end_trainer


BrunoData:
	def_trainer_class BRUNO
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 53, ONIX
		tr_moves ROCK_THROW, RAGE, SLAM, HARDEN
	tr_mon 55, HITMONCHAN
		tr_moves ICE_PUNCH, THUNDERPUNCH, MEGA_PUNCH, COUNTER
	tr_mon 55, HITMONLEE
		tr_moves JUMP_KICK, FOCUS_ENERGY, HI_JUMP_KICK, MEGA_KICK
	tr_mon 56, ONIX
		tr_moves ROCK_THROW, RAGE, SLAM, HARDEN
	tr_mon 58, MACHAMP
		tr_moves LEER, FOCUS_ENERGY, FISSURE, SUBMISSION
	end_trainer


 BrockData:
 	def_trainer_class BROCK
 	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
 	tr_mon 12, GEODUDE
		tr_moves TACKLE, DEFENSE_CURL
	tr_mon 14, ONIX
		tr_moves TACKLE, SCREECH, BIDE
	end_trainer

MistyData:
	def_trainer_class MISTY
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 18, STARYU
		tr_moves TACKLE, WATER_GUN
	tr_mon 21, STARMIE
		tr_moves TACKLE, WATER_GUN, BUBBLEBEAM
	end_trainer

LtSurgeData:
	def_trainer_class LT_SURGE
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 21, VOLTORB
		tr_moves TACKLE, SCREECH, SONICBOOM
	tr_mon 18, PIKACHU
		tr_moves THUNDERSHOCK, GROWL, THUNDER_WAVE, QUICK_ATTACK
	tr_mon 24, RAICHU
		tr_moves THUNDERSHOCK, GROWL, THUNDERBOLT
	end_trainer


ErikaData:
	def_trainer_class ERIKA
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 29, VICTREEBEL
		tr_moves RAZOR_LEAF, WRAP, POISONPOWDER, SLEEP_POWDER
	tr_mon 24, TANGELA
		tr_moves ABSORB, BIND
	tr_mon 29, VILEPLUME
		tr_moves PETAL_DANCE, POISONPOWDER, MEGA_DRAIN, SLEEP_POWDER
	end_trainer


KogaData:
	def_trainer_class KOGA
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 37, KOFFING
		tr_moves TACKLE, SMOG, SLUDGE, SMOKESCREEN
	tr_mon 39, MUK
		tr_moves DISABLE, POISON_GAS, MINIMIZE, SLUDGE
	tr_mon 37, KOFFING
		tr_moves TACKLE, SMOG, SLUDGE, SMOKESCREEN
	tr_mon 43, WEEZING
		tr_moves SMOG, SLUDGE, TOXIC, SELFDESTRUCT
	end_trainer


BlaineData:
	def_trainer_class BLAINE
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 42, GROWLITHE
		tr_moves EMBER, LEER, TAKE_DOWN, AGILITY
	tr_mon 40, PONYTA
		tr_moves TAIL_WHIP, STOMP, GROWL, FIRE_SPIN
	tr_mon 42, RAPIDASH
		tr_moves TAIL_WHIP, STOMP, GROWL, FIRE_SPIN
	tr_mon 47, ARCANINE
		tr_moves ROAR, EMBER, FIRE_BLAST, TAKE_DOWN
	end_trainer


SabrinaData:
	def_trainer_class SABRINA
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 38, KADABRA
		tr_moves DISABLE, PSYBEAM, RECOVER, PSYCHIC_M
	tr_mon 37, MR_MIME
		tr_moves CONFUSION, BARRIER, LIGHT_SCREEN, PSYCHIC_M
	tr_mon 38, VENOMOTH
		tr_moves POISONPOWDER, LEECH_LIFE, STUN_SPORE, PSYBEAM
	tr_mon 43, ALAKAZAM
		tr_moves PSYBEAM, RECOVER, PSYWAVE, REFLECT
 	end_trainer


GentlemanData:
	def_trainer_class GENTLEMAN
; SS Anne 1F Rooms
	def_trainer 1, 18
	tr_mon GROWLITHE
	tr_mon GROWLITHE
	end_trainer

	def_trainer 2, 19
	tr_mon NIDORAN_M
	tr_mon NIDORAN_F
	end_trainer

; SS Anne 2F Rooms/Vermilion Gym
	def_trainer 3, 23
	tr_mon PIKACHU
	end_trainer

; Unused
	def_trainer 4, 48
	tr_mon PRIMEAPE
	end_trainer

; SS Anne 2F Rooms
	def_trainer 5, 17
	tr_mon GROWLITHE
	tr_mon PONYTA
	end_trainer


Rival2Data:
	def_trainer_class RIVAL2
; SS Anne 2F
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 19, PIDGEOTTO
	tr_mon 16, RATICATE
	tr_mon 18, KADABRA
	tr_mon 20, WARTORTLE
	end_trainer

	def_trainer 2, TRAINERTYPE_MULTI_LEVELS
	tr_mon 19, PIDGEOTTO
	tr_mon 16, RATICATE
	tr_mon 18, KADABRA
	tr_mon 20, IVYSAUR
	end_trainer

	def_trainer 3, TRAINERTYPE_MULTI_LEVELS
	tr_mon 19, PIDGEOTTO
	tr_mon 16, RATICATE
	tr_mon 18, KADABRA
	tr_mon 20, CHARMELEON
	end_trainer

; Pokémon Tower 2F
	def_trainer 4, TRAINERTYPE_MULTI_LEVELS
	tr_mon 25, PIDGEOTTO
	tr_mon 23, GROWLITHE
	tr_mon 22, EXEGGCUTE
	tr_mon 20, KADABRA
	tr_mon 25, WARTORTLE
	end_trainer

	def_trainer 5, TRAINERTYPE_MULTI_LEVELS
	tr_mon 25, PIDGEOTTO
	tr_mon 23, GYARADOS
	tr_mon 22, GROWLITHE
	tr_mon 20, KADABRA
	tr_mon 25, IVYSAUR
	end_trainer

	def_trainer 6, TRAINERTYPE_MULTI_LEVELS
	tr_mon 25, PIDGEOTTO
	tr_mon 23, EXEGGCUTE
	tr_mon 22, GYARADOS
	tr_mon 20, KADABRA
	tr_mon 25, CHARMELEON
	end_trainer

; Silph Co. 7F
	def_trainer 7, TRAINERTYPE_MULTI_LEVELS
	tr_mon 37, PIDGEOT
	tr_mon 38, GROWLITHE
	tr_mon 35, EXEGGCUTE
	tr_mon 35, ALAKAZAM
	tr_mon 40, BLASTOISE
	end_trainer

	def_trainer 8, TRAINERTYPE_MULTI_LEVELS
	tr_mon 37, PIDGEOT
	tr_mon 38, GYARADOS
	tr_mon 35, GROWLITHE
	tr_mon 35, ALAKAZAM
	tr_mon 40, VENUSAUR
	end_trainer

	def_trainer 9, TRAINERTYPE_MULTI_LEVELS
	tr_mon 37, PIDGEOT
	tr_mon 38, EXEGGCUTE
	tr_mon 35, GYARADOS
	tr_mon 35, ALAKAZAM
	tr_mon 40, CHARIZARD
	end_trainer

; Route 22
	def_trainer 10, TRAINERTYPE_MULTI_LEVELS
	tr_mon 47, PIDGEOT
	tr_mon 45, RHYHORN
	tr_mon 45, GROWLITHE
	tr_mon 47, EXEGGCUTE
	tr_mon 50, ALAKAZAM
	tr_mon 53, BLASTOISE
	end_trainer

	def_trainer 11, TRAINERTYPE_MULTI_LEVELS
	tr_mon 47, PIDGEOT
	tr_mon 45, RHYHORN
	tr_mon 45, GYARADOS
	tr_mon 47, GROWLITHE
	tr_mon 50, ALAKAZAM
	tr_mon 53, VENUSAUR
	end_trainer

	def_trainer 12, TRAINERTYPE_MULTI_LEVELS
	tr_mon 47, PIDGEOT
	tr_mon 45, RHYHORN
	tr_mon 45, EXEGGCUTE
	tr_mon 47, GYARADOS
	tr_mon 50, ALAKAZAM
	tr_mon 53, CHARIZARD
	end_trainer


Rival3Data:
 	def_trainer_class RIVAL3
 	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
 	tr_mon 61, PIDGEOT
		tr_moves DOUBLE_EDGE, WING_ATTACK, SKY_ATTACK, MIRROR_MOVE
	tr_mon 59, ALAKAZAM
		tr_moves PSYBEAM, RECOVER, PSYCHIC_M, REFLECT
	tr_mon 61, RHYDON
		tr_moves TAIL_WHIP, FURY_ATTACK, HORN_DRILL, LEER
	tr_mon 61, ARCANINE
		tr_moves ROAR, EMBER, LEER, TAKE_DOWN
	tr_mon 63, EXEGGUTOR
		tr_moves BARRAGE, HYPNOSIS, STOMP
	tr_mon 65, BLASTOISE
		tr_moves BITE, EARTHQUAKE, BLIZZARD, HYDRO_PUMP
	end_trainer

	def_trainer 2, TRAINERTYPE_MULTI_LEVELS
	tr_mon 61, PIDGEOT
		tr_moves DOUBLE_EDGE, WING_ATTACK, SKY_ATTACK, MIRROR_MOVE
	tr_mon 59, ALAKAZAM
		tr_moves PSYBEAM, RECOVER, PSYCHIC_M, REFLECT
	tr_mon 61, RHYDON
		tr_moves TAIL_WHIP, FURY_ATTACK, HORN_DRILL, LEER
	tr_mon 61, GYARADOS
		tr_moves DRAGON_RAGE, LEER, HYDRO_PUMP, HYPER_BEAM
	tr_mon 63, ARCANINE
		tr_moves ROAR, EMBER, LEER, TAKE_DOWN
	tr_mon 65, VENUSAUR
		tr_moves RAZOR_LEAF, GROWTH, MEGA_DRAIN, SOLARBEAM
	end_trainer

	def_trainer 3, TRAINERTYPE_MULTI_LEVELS
	tr_mon 61, PIDGEOT
		tr_moves DOUBLE_EDGE, WING_ATTACK, SKY_ATTACK, MIRROR_MOVE
	tr_mon 59, ALAKAZAM
		tr_moves PSYBEAM, RECOVER, PSYCHIC_M, REFLECT
	tr_mon 61, RHYDON
		tr_moves TAIL_WHIP, FURY_ATTACK, HORN_DRILL, LEER
	tr_mon 61, EXEGGUTOR
		tr_moves BARRAGE, HYPNOSIS, STOMP
	tr_mon 63, GYARADOS
		tr_moves DRAGON_RAGE, LEER, HYDRO_PUMP, HYPER_BEAM
	tr_mon 65, CHARIZARD
		tr_moves RAGE, SLASH, FIRE_BLAST, FIRE_SPIN
	end_trainer


LoreleiData:
	def_trainer_class LORELEI
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 54, DEWGONG
		tr_moves GROWL, AURORA_BEAM, REST, TAKE_DOWN
	tr_mon 53, CLOYSTER
		tr_moves SUPERSONIC, CLAMP, AURORA_BEAM, SPIKE_CANNON
	tr_mon 54, SLOWBRO
		tr_moves GROWL, WATER_GUN, PSYCHIC_M, AMNESIA
	tr_mon 56, JYNX
		tr_moves PSYCHIC_M, ICE_PUNCH, BODY_SLAM, THRASH
	tr_mon 56, LAPRAS
		tr_moves BODY_SLAM, CONFUSE_RAY, BLIZZARD, HYDRO_PUMP
 	end_trainer


ChannelerData:
	def_trainer_class CHANNELER
; Unused
	def_trainer 1, 22
	tr_mon GASTLY
	end_trainer

	def_trainer 2, 24
	tr_mon GASTLY
	end_trainer

	def_trainer 3, 23
	tr_mon GASTLY
	tr_mon GASTLY
	end_trainer

	def_trainer 4, 24
	tr_mon GASTLY
	end_trainer

; Pokémon Tower 3F
	def_trainer 5, 23
	tr_mon GASTLY
	end_trainer

	def_trainer 6, 24
	tr_mon GASTLY
	end_trainer

; Unused
	def_trainer 7, 24
	tr_mon HAUNTER
	end_trainer

; Pokémon Tower 3F
	def_trainer 8, 22
	tr_mon GASTLY
	end_trainer

; Pokémon Tower 4F
	def_trainer 9, 24
	tr_mon GASTLY
	end_trainer

	def_trainer 10, 23
	tr_mon GASTLY
	tr_mon GASTLY
	end_trainer

; Unused
	def_trainer 11, 24
	tr_mon GASTLY
	end_trainer

; Pokémon Tower 4F
	def_trainer 12, 22
	tr_mon GASTLY
	end_trainer

; Unused
	def_trainer 13, 24
	tr_mon GASTLY
	end_trainer

; Pokémon Tower 5F
	def_trainer 14, 23
	tr_mon HAUNTER
	end_trainer

; Unused
	def_trainer 15, 24
	tr_mon GASTLY
	end_trainer

; Pokémon Tower 5F
	def_trainer 16, 22
	tr_mon GASTLY
	end_trainer

	def_trainer 17, 24
	tr_mon GASTLY
	end_trainer

	def_trainer 18, 22
	tr_mon HAUNTER
	end_trainer

; Pokémon Tower 6F
	def_trainer 19, 22
	tr_mon GASTLY
	tr_mon GASTLY
	tr_mon GASTLY
	end_trainer

	def_trainer 20, 24
	tr_mon GASTLY
	end_trainer

	def_trainer 21, 24
	tr_mon GASTLY
	end_trainer

; Saffron Gym
	def_trainer 22, 34
	tr_mon GASTLY
	tr_mon HAUNTER
	end_trainer

	def_trainer 23, 38
	tr_mon HAUNTER
	end_trainer

	def_trainer 24, 33
	tr_mon GASTLY
	tr_mon GASTLY
	tr_mon HAUNTER
	end_trainer


AgathaData:
	def_trainer_class AGATHA
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 56, GENGAR
		tr_moves CONFUSE_RAY, NIGHT_SHADE, HYPNOSIS, DREAM_EATER	
	tr_mon 56, GOLBAT
		tr_moves SUPERSONIC, CONFUSE_RAY, WING_ATTACK, HAZE	
	tr_mon 55, HAUNTER
		tr_moves CONFUSE_RAY, NIGHT_SHADE, HYPNOSIS, DREAM_EATER	
	tr_mon 58, ARBOK
		tr_moves BITE, GLARE, SCREECH, ACID	
	tr_mon 60, GENGAR
		tr_moves CONFUSE_RAY, NIGHT_SHADE, TOXIC, DREAM_EATER
	end_trainer


LanceData:
	def_trainer_class LANCE
	def_trainer 1, TRAINERTYPE_MULTI_LEVELS
	tr_mon 58, GYARADOS
		tr_moves DRAGON_RAGE, LEER, HYDRO_PUMP, HYPER_BEAM	
	tr_mon 56, DRAGONAIR
		tr_moves AGILITY, SLAM, DRAGON_RAGE, HYPER_BEAM	
	tr_mon 56, DRAGONAIR
		tr_moves AGILITY, SLAM, DRAGON_RAGE, HYPER_BEAM	
	tr_mon 60, AERODACTYL
		tr_moves SUPERSONIC, BITE, TAKE_DOWN, HYPER_BEAM	
	tr_mon 62, DRAGONITE
		tr_moves AGILITY, SLAM, BARRIER, HYPER_BEAM
	end_trainer