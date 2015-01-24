TrainerDataPointers: ; 39d3b (e:5d3b)
	dw YoungsterData     ; YOUNGSTER
	dw BugCatcherData    ; BUG_CATCHER
	dw LassData          ; LASS
	dw SailorData        ; SAILOR
	dw JrTrainerMData    ; JR__TRAINER_M
	dw JrTrainerFData    ; JR__TRAINER_F
	dw PokemaniacData    ; POKEMANIAC
	dw SuperNerdData     ; SUPER_NERD
	dw HikerData         ; HIKER
	dw BikerData         ; BIKER
	dw BurglarData       ; BURGLAR
	dw EngineerData      ; ENGINEER
	dw Juggler1Data      ; JUGGLER_X
	dw FisherData        ; FISHER
	dw SwimmerData       ; SWIMMER
	dw CueBallData       ; CUE_BALL
	dw GamblerData       ; GAMBLER
	dw BeautyData        ; BEAUTY
	dw PsychicData       ; PSYCHIC_TR
	dw RockerData        ; ROCKER
	dw JugglerData       ; JUGGLER
	dw TamerData         ; TAMER
	dw BirdKeeperData    ; BIRD_KEEPER
	dw BlackbeltData     ; BLACKBELT
	dw Green1Data        ; SONY1
	dw ProfOakData       ; PROF_OAK
	dw ChiefData         ; CHIEF
	dw ScientistData     ; SCIENTIST
	dw GiovanniData      ; GIOVANNI
	dw RocketData        ; ROCKET
	dw CooltrainerMData  ; COOLTRAINER_M
	dw CooltrainerFData  ; COOLTRAINER_F
	dw BrunoData         ; BRUNO
	dw BrockData         ; BROCK
	dw MistyData         ; MISTY
	dw LtSurgeData       ; LT__SURGE
	dw ErikaData         ; ERIKA
	dw KogaData          ; KOGA
	dw BlaineData        ; BLAINE
	dw SabrinaData       ; SABRINA
	dw GentlemanData     ; GENTLEMAN
	dw Green2Data        ; SONY2
	dw Green3Data        ; SONY3
	dw LoreleiData       ; LORELEI
	dw ChannelerData     ; CHANNELER
	dw AgathaData        ; AGATHA
	dw LanceData         ; LANCE

; if first byte != FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == FF, then
	; first byte is FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData: ; 39d99 (e:5d99)
	db 11,RATTATA,EKANS,0                    ; $1
	db 14,SPEAROW,0                          ; $2
	db 10,RATTATA,RATTATA,ZUBAT,0            ; $3
	db 14,RATTATA,EKANS,ZUBAT,0              ; $4
	db 15,RATTATA,SPEAROW,0                  ; $5
	db 17,SLOWPOKE,0                         ; $6
	db 14,EKANS,SANDSHREW,0                  ; $7
	db 21,NIDORAN_M,0                        ; $8
	db 21,EKANS,0                            ; $9
	db 19,SANDSHREW,ZUBAT,0                  ; $a
	db 17,RATTATA,RATTATA,RATICATE,0         ; $b
	db 18,NIDORAN_M,NIDORINO,0               ; $c
	db 17,SPEAROW,RATTATA,RATTATA,SPEAROW,0  ; $d
if DEF(_YELLOW)
	db 24,SANDSHREW,0                        ; $e
endc

BugCatcherData: ; 39dce (e:5dce)
if DEF(_YELLOW)
	db 7,CATERPIE,CATERPIE,0                ; $1
	db 6,METAPOD,CATERPIE,METAPOD,0         ; $2
	db 10,CATERPIE,0                        ; $3
else
	db 6,WEEDLE,CATERPIE,0                  ; $1
	db 7,WEEDLE,KAKUNA,WEEDLE,0             ; $2
	db 9,WEEDLE,0                           ; $3
endc
	db 10,CATERPIE,WEEDLE,CATERPIE,0        ; $4
	db 9,WEEDLE,KAKUNA,CATERPIE,METAPOD,0   ; $5
	db 11,CATERPIE,METAPOD,0                ; $6
	db 11,WEEDLE,KAKUNA,0                   ; $7
	db 10,CATERPIE,METAPOD,CATERPIE,0       ; $8
	db 14,CATERPIE,WEEDLE,0                 ; $9
	db 16,WEEDLE,CATERPIE,WEEDLE,0          ; $a
	db 20,BUTTERFREE,0                      ; $b
	db 18,METAPOD,CATERPIE,VENONAT,0        ; $c
	db 19,BEEDRILL,BEEDRILL,0               ; $d
	db 20,CATERPIE,WEEDLE,VENONAT,0         ; $e
if DEF(_YELLOW)
	db 8,CATERPIE,METAPOD,0                 ; $f
endc

LassData: ; 39e0c (e:5e0c)
	db 9,PIDGEY,PIDGEY,0           ; $1
	db 10,RATTATA,NIDORAN_M,0      ; $2
	db 14,JIGGLYPUFF,0             ; $3
	db 31,PARAS,PARAS,PARASECT,0   ; $4
	db 11,ODDISH,BELLSPROUT,0      ; $5
	db 14,CLEFAIRY,0               ; $6
	db 16,PIDGEY,NIDORAN_F,0       ; $7
	db 14,PIDGEY,NIDORAN_F,0       ; $8
	db 15,NIDORAN_M,NIDORAN_F,0    ; $9
	db 13,ODDISH,PIDGEY,ODDISH,0   ; $a
	db 18,PIDGEY,NIDORAN_F,0       ; $b
if DEF(_YELLOW)
	db 20,JIGGLYPUFF,0             ; $c
else
	db 18,RATTATA,PIKACHU,0        ; $c
endc
	db 23,NIDORAN_F,NIDORINA,0     ; $d
	db 24,MEOWTH,MEOWTH,MEOWTH,0   ; $e
if DEF(_YELLOW)
	db 19,PIDGEY,RATTATA,NIDORAN_F,MEOWTH,NIDORAN_M,0 ; $f
else
	db 19,PIDGEY,RATTATA,NIDORAN_M,MEOWTH,PIKACHU,0   ; $f
endc
	db 22,CLEFAIRY,CLEFAIRY,0      ; $10
	db 23,BELLSPROUT,WEEPINBELL,0  ; $11
	db 23,ODDISH,GLOOM,0           ; $12
if DEF(_YELLOW)
	db 6,NIDORAN_F,NIDORAN_M,0     ; $13
endc

SailorData: ; 39e58 (e:5e58)
	db 18,MACHOP,SHELLDER,0            ; $1
	db 17,MACHOP,TENTACOOL,0           ; $2
	db 21,SHELLDER,0                   ; $3
	db 17,HORSEA,SHELLDER,TENTACOOL,0  ; $4
	db 18,TENTACOOL,STARYU,0           ; $5
	db 17,HORSEA,HORSEA,HORSEA,0       ; $6
	db 20,MACHOP,0                     ; $7
if DEF(_YELLOW)
	db 24,MAGNEMITE,0                  ; $8
else
	db 21,PIKACHU,PIKACHU,0            ; $8
endc

JrTrainerMData: ; 39e78 (e:5e78)
if DEF(_YELLOW)
	db 9,DIGLETT,SANDSHREW,0                 ; $1
else
	db 11,DIGLETT,SANDSHREW,0                ; $1
endc
	db 14,RATTATA,EKANS,0                    ; $2
	db 18,MANKEY,0                           ; $3
	db 20,SQUIRTLE,0                         ; $4
	db 16,SPEAROW,RATICATE,0                 ; $5
	db 18,DIGLETT,DIGLETT,SANDSHREW,0        ; $6
	db 21,GROWLITHE,CHARMANDER,0             ; $7
	db 19,RATTATA,DIGLETT,EKANS,SANDSHREW,0  ; $8
	db 29,NIDORAN_M,NIDORINO,0               ; $9
if DEF(_YELLOW)
	db 16,WEEPINBELL,0                       ; $a
endc

JrTrainerFData: ; 39e9d (e:5e9d)
	db 19,GOLDEEN,0                   ; $1
if DEF(_YELLOW)
	db 16,ODDISH,BELLSPROUT,0         ; $2
else
	db 16,RATTATA,PIKACHU,0           ; $2
endc
	db 16,PIDGEY,PIDGEY,PIDGEY,0      ; $3
	db 22,BULBASAUR,0                 ; $4
	db 18,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0 ; $5
	db 23,MEOWTH,0                    ; $6
if DEF(_YELLOW)
	db 20,JIGGLYPUFF,CLEFAIRY,0       ; $7
else
	db 20,PIKACHU,CLEFAIRY,0          ; $7
endc
	db 21,PIDGEY,PIDGEOTTO,0          ; $8
	db 21,JIGGLYPUFF,PIDGEY,MEOWTH,0  ; $9
	db 22,ODDISH,BULBASAUR,0          ; $a
	db 24,BULBASAUR,IVYSAUR,0         ; $b
if DEF(_YELLOW)
	db 24,PIDGEY,MEOWTH,RATTATA,PIDGEY,MEOWTH,0   ; $c
else
	db 24,PIDGEY,MEOWTH,RATTATA,PIKACHU,MEOWTH,0  ; $c
endc
	db 30,POLIWAG,POLIWAG,0                       ; $d
	db 27,PIDGEY,MEOWTH,PIDGEY,PIDGEOTTO,0        ; $e
	db 28,GOLDEEN,POLIWAG,HORSEA,0                ; $f
	db 31,GOLDEEN,SEAKING,0                       ; $10
	db 22,BELLSPROUT,CLEFAIRY,0                   ; $11
	db 20,MEOWTH,ODDISH,PIDGEY,0                  ; $12
	db 19,PIDGEY,RATTATA,RATTATA,BELLSPROUT,0     ; $13
	db 28,GLOOM,ODDISH,ODDISH,0                   ; $14
if DEF(_YELLOW)
	db 29,PIDGEY,PIDGEOTTO,0                      ; $15
else
	db 29,PIKACHU,RAICHU,0                        ; $15
endc
	db 33,CLEFAIRY,0                              ; $16
	db 29,BELLSPROUT,ODDISH,TANGELA,0             ; $17
	db 30,TENTACOOL,HORSEA,SEEL,0                 ; $18
if DEF(_YELLOW)
	db 20,CUBONE,0                                ; $19
endc

PokemaniacData: ; 39f09 (e:5f09)
	db 30,RHYHORN,LICKITUNG,0            ; $1
	db 20,CUBONE,SLOWPOKE,0              ; $2
	db 20,SLOWPOKE,SLOWPOKE,SLOWPOKE,0   ; $3
	db 22,CHARMANDER,CUBONE,0            ; $4
	db 25,SLOWPOKE,0                     ; $5
	db 40,CHARMELEON,LAPRAS,LICKITUNG,0  ; $6
	db 23,CUBONE,SLOWPOKE,0              ; $7

SuperNerdData: ; 39f26 (e:5f26)
	db 11,MAGNEMITE,VOLTORB,0                      ; $1
	db 12,GRIMER,VOLTORB,KOFFING,0                 ; $2
	db 20,VOLTORB,KOFFING,VOLTORB,MAGNEMITE,0      ; $3
	db 22,GRIMER,MUK,GRIMER,0                      ; $4
	db 26,KOFFING,0                                ; $5
	db 22,KOFFING,MAGNEMITE,WEEZING,0              ; $6
	db 20,MAGNEMITE,MAGNEMITE,KOFFING,MAGNEMITE,0  ; $7
	db 24,MAGNEMITE,VOLTORB,0                      ; $8
	db 36,VULPIX,VULPIX,NINETALES,0                ; $9
	db 34,PONYTA,CHARMANDER,VULPIX,GROWLITHE,0     ; $a
	db 41,RAPIDASH,0                               ; $b
	db 37,GROWLITHE,VULPIX,0                       ; $c

HikerData: ; 39f5e (e:5f5e)
	db 10,GEODUDE,GEODUDE,ONIX,0            ; $1
	db 15,MACHOP,GEODUDE,0                  ; $2
	db 13,GEODUDE,GEODUDE,MACHOP,GEODUDE,0  ; $3
	db 17,ONIX,0                            ; $4
	db 21,GEODUDE,ONIX,0                    ; $5
	db 20,GEODUDE,MACHOP,GEODUDE,0          ; $6
	db 21,GEODUDE,ONIX,0                    ; $7
	db 19,ONIX,GRAVELER,0                   ; $8
	db 21,GEODUDE,GEODUDE,GRAVELER,0        ; $9
	db 25,GEODUDE,0                         ; $a
	db 20,MACHOP,ONIX,0                     ; $b
	db 19,GEODUDE,MACHOP,GEODUDE,GEODUDE,0  ; $c
	db 20,ONIX,ONIX,GEODUDE,0               ; $d
	db 21,GEODUDE,GRAVELER,0                ; $e

BikerData: ; 39f9c (e:5f9c)
	db 28,KOFFING,KOFFING,KOFFING,0                  ; $1
	db 29,KOFFING,GRIMER,0                           ; $2
	db 25,KOFFING,KOFFING,WEEZING,KOFFING,GRIMER,0   ; $3
	db 28,KOFFING,GRIMER,WEEZING,0                   ; $4
	db 29,GRIMER,KOFFING,0                           ; $5
	db 33,WEEZING,0                                  ; $6
	db 26,GRIMER,GRIMER,GRIMER,GRIMER,0              ; $7
	db 28,WEEZING,KOFFING,WEEZING,0                  ; $8
	db 33,MUK,0                                      ; $9
	db 29,VOLTORB,VOLTORB,0                          ; $a
	db 29,WEEZING,MUK,0                              ; $b
	db 25,KOFFING,WEEZING,KOFFING,KOFFING,WEEZING,0  ; $c
	db 26,KOFFING,KOFFING,GRIMER,KOFFING,0           ; $d
	db 28,GRIMER,GRIMER,KOFFING,0                    ; $e
	db 29,KOFFING,MUK,0                              ; $f

BurglarData: ; 39fe4 (e:5fe4)
	db 29,GROWLITHE,VULPIX,0            ; $1
	db 33,GROWLITHE,0                   ; $2
	db 28,VULPIX,CHARMANDER,PONYTA,0    ; $3
	db 36,GROWLITHE,VULPIX,NINETALES,0  ; $4
	db 41,PONYTA,0                      ; $5
	db 37,VULPIX,GROWLITHE,0            ; $6
	db 34,CHARMANDER,CHARMELEON,0       ; $7
	db 38,NINETALES,0                   ; $8
	db 34,GROWLITHE,PONYTA,0            ; $9

EngineerData: ; 3a007 (e:6007)
	db 21,VOLTORB,MAGNEMITE,0             ; $1
	db 21,MAGNEMITE,0                     ; $2
	db 18,MAGNEMITE,MAGNEMITE,MAGNETON,0  ; $3

Juggler1Data: ; 3a013 (e:6013)
; none

FisherData: ; 3a013 (e:6013)
	db 17,GOLDEEN,TENTACOOL,GOLDEEN,0        ; $1
	db 17,TENTACOOL,STARYU,SHELLDER,0        ; $2
	db 22,GOLDEEN,POLIWAG,GOLDEEN,0          ; $3
	db 24,TENTACOOL,GOLDEEN,0                ; $4
	db 27,GOLDEEN,0                          ; $5
	db 21,POLIWAG,SHELLDER,GOLDEEN,HORSEA,0  ; $6
	db 28,SEAKING,GOLDEEN,SEAKING,SEAKING,0  ; $7
	db 31,SHELLDER,CLOYSTER,0                ; $8
	db 27,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,0  ; $9
	db 33,SEAKING,GOLDEEN,0                  ; $a
	db 24,MAGIKARP,MAGIKARP,0                ; $b

SwimmerData: ; 3a049 (e:6049)
	db 16,HORSEA,SHELLDER,0                               ; $1
	db 30,TENTACOOL,SHELLDER,0                            ; $2
	db 29,GOLDEEN,HORSEA,STARYU,0                         ; $3
	db 30,POLIWAG,POLIWHIRL,0                             ; $4
	db 27,HORSEA,TENTACOOL,TENTACOOL,GOLDEEN,0            ; $5
	db 29,GOLDEEN,SHELLDER,SEAKING,0                      ; $6
	db 30,HORSEA,HORSEA,0                                 ; $7
	db 27,TENTACOOL,TENTACOOL,STARYU,HORSEA,TENTACRUEL,0  ; $8
	db 31,SHELLDER,CLOYSTER,0                             ; $9
	db 35,STARYU,0                                        ; $a
	db 28,HORSEA,HORSEA,SEADRA,HORSEA,0                   ; $b
	db 33,SEADRA,TENTACRUEL,0                             ; $c
	db 37,STARMIE,0                                       ; $d
	db 33,STARYU,WARTORTLE,0                              ; $e
	db 32,POLIWHIRL,TENTACOOL,SEADRA,0                    ; $f

CueBallData: ; 3a08d (e:608d)
	db 28,MACHOP,MANKEY,MACHOP,0            ; $1
	db 29,MANKEY,MACHOP,0                   ; $2
	db 33,MACHOP,0                          ; $3
	db 29,MANKEY,PRIMEAPE,0                 ; $4
	db 29,MACHOP,MACHOKE,0                  ; $5
	db 33,MACHOKE,0                         ; $6
	db 26,MANKEY,MANKEY,MACHOKE,MACHOP,0    ; $7
	db 29,PRIMEAPE,MACHOKE,0                ; $8
	db 31,TENTACOOL,TENTACOOL,TENTACRUEL,0  ; $9

GamblerData: ; 3a0b3 (e:60b3)
	db 18,POLIWAG,HORSEA,0             ; $1
	db 18,BELLSPROUT,ODDISH,0          ; $2
	db 18,VOLTORB,MAGNEMITE,0          ; $3
	db 18,GROWLITHE,VULPIX,0           ; $4
	db 22,POLIWAG,POLIWAG,POLIWHIRL,0  ; $5
	db 22,ONIX,GEODUDE,GRAVELER,0      ; $6
	db 24,GROWLITHE,VULPIX,0           ; $7

BeautyData: ; 3a0d1 (e:60d1)
	db 21,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0      ; $1
	db 24,BELLSPROUT,BELLSPROUT,0                    ; $2
	db 26,EXEGGCUTE,0                                ; $3
if DEF(_YELLOW)
	db 27,RATTATA,VULPIX,RATTATA,0                   ; $4
else
	db 27,RATTATA,PIKACHU,RATTATA,0                  ; $4
endc
	db 29,CLEFAIRY,MEOWTH,0                          ; $5
	db 35,SEAKING,0                                  ; $6
	db 30,SHELLDER,SHELLDER,CLOYSTER,0               ; $7
	db 31,POLIWAG,SEAKING,0                          ; $8
	db 29,PIDGEOTTO,WIGGLYTUFF,0                     ; $9
	db 29,BULBASAUR,IVYSAUR,0                        ; $a
	db 33,WEEPINBELL,BELLSPROUT,WEEPINBELL,0         ; $b
	db 27,POLIWAG,GOLDEEN,SEAKING,GOLDEEN,POLIWAG,0  ; $c
	db 30,GOLDEEN,SEAKING,0                          ; $d
	db 29,STARYU,STARYU,STARYU,0                     ; $e
	db 30,SEADRA,HORSEA,SEADRA,0                     ; $f

PsychicData: ; 3a115 (e:6115)
	db 31,KADABRA,SLOWPOKE,MR_MIME,KADABRA,0  ; $1
	db 34,MR_MIME,KADABRA,0                   ; $2
	db 33,SLOWPOKE,SLOWPOKE,SLOWBRO,0         ; $3
	db 38,SLOWBRO,0                           ; $4

RockerData: ; 3a127 (e:6127)
if DEF(_YELLOW)
	db 20,VOLTORB,VOLTORB,VOLTORB,0    ; $1
else
	db 20,VOLTORB,MAGNEMITE,VOLTORB,0  ; $1
endc
	db 29,VOLTORB,ELECTRODE,0          ; $2

JugglerData: ; 3a130 (e:6130)
	db 29,KADABRA,MR_MIME,0                  ; $1
	db 41,DROWZEE,HYPNO,KADABRA,KADABRA,0    ; $2
	db 31,DROWZEE,DROWZEE,KADABRA,DROWZEE,0  ; $3
	db 34,DROWZEE,HYPNO,0                    ; $4
	db 48,MR_MIME,0                          ; $5
	db 33,HYPNO,0                            ; $6
	db 38,HYPNO,0                            ; $7
	db 34,DROWZEE,KADABRA,0                  ; $8

TamerData: ; 3a151 (e:6151)
	db 34,SANDSLASH,ARBOK,0                ; $1
	db 33,ARBOK,SANDSLASH,ARBOK,0          ; $2
	db 43,RHYHORN,0                        ; $3
	db 39,ARBOK,TAUROS,0                   ; $4
	db 44,PERSIAN,GOLDUCK,0                ; $5
	db 42,RHYHORN,PRIMEAPE,ARBOK,TAUROS,0  ; $6

BirdKeeperData: ; 3a16b (e:616b)
	db 29,PIDGEY,PIDGEOTTO,0                       ; $1
	db 25,SPEAROW,PIDGEY,PIDGEY,SPEAROW,SPEAROW,0  ; $2
	db 26,PIDGEY,PIDGEOTTO,SPEAROW,FEAROW,0        ; $3
	db 33,FARFETCH_D,0                             ; $4
	db 29,SPEAROW,FEAROW,0                         ; $5
	db 26,PIDGEOTTO,FARFETCH_D,DODUO,PIDGEY,0      ; $6
	db 28,DODRIO,DODUO,DODUO,0                     ; $7
	db 29,SPEAROW,FEAROW,0                         ; $8
	db 34,DODRIO,0                                 ; $9
	db 26,SPEAROW,SPEAROW,FEAROW,SPEAROW,0         ; $a
	db 30,FEAROW,FEAROW,PIDGEOTTO,0                ; $b
	db 39,PIDGEOTTO,PIDGEOTTO,PIDGEY,PIDGEOTTO,0   ; $c
	db 42,FARFETCH_D,FEAROW,0                      ; $d
	db 28,PIDGEY,DODUO,PIDGEOTTO,0                 ; $e
	db 26,PIDGEY,SPEAROW,PIDGEY,FEAROW,0           ; $f
	db 29,PIDGEOTTO,FEAROW,0                       ; $10
	db 28,SPEAROW,DODUO,FEAROW,0                   ; $11

BlackbeltData: ; 3a1be (e:61be)
	db 37,HITMONLEE,HITMONCHAN,0    ; $1
	db 31,MANKEY,MANKEY,PRIMEAPE,0  ; $2
	db 32,MACHOP,MACHOKE,0          ; $3
	db 36,PRIMEAPE,0                ; $4
	db 31,MACHOP,MANKEY,PRIMEAPE,0  ; $5
	db 40,MACHOP,MACHOKE,0          ; $6
	db 43,MACHOKE,0                 ; $7
	db 38,MACHOKE,MACHOP,MACHOKE,0  ; $8
	db 43,MACHOKE,MACHOP,MACHOKE,0  ; $9

Green1Data: ; 3a1e4 (e:61e4)
if DEF(_YELLOW)
	db 5,EEVEE,0                ; $1
	db $FF,9,SPEAROW,8,EEVEE,0  ; $2
	db $FF,18,SPEAROW,15,SANDSHREW,15,RATTATA,17,EEVEE,0  ; $3
else
	db 5,SQUIRTLE,0                                         ; $1
	db 5,BULBASAUR,0                                        ; $2
	db 5,CHARMANDER,0                                       ; $3
	db $FF,9,PIDGEY,8,SQUIRTLE,0                            ; $4
	db $FF,9,PIDGEY,8,BULBASAUR,0                           ; $5
	db $FF,9,PIDGEY,8,CHARMANDER,0                          ; $6
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,SQUIRTLE,0    ; $7
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,BULBASAUR,0   ; $8
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,CHARMANDER,0  ; $9
endc

ProfOakData: ; 3a21d (e:621d)
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,BLASTOISE,70,GYARADOS,0  ; $1
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,VENUSAUR,70,GYARADOS,0   ; $2
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,CHARIZARD,70,GYARADOS,0  ; $3

ChiefData: ; 3a241 (e:6241)
; none

ScientistData: ; 3a241 (e:6241)
	db 34,KOFFING,VOLTORB,0                             ; $1
	db 26,GRIMER,WEEZING,KOFFING,WEEZING,0              ; $2
	db 28,MAGNEMITE,VOLTORB,MAGNETON,0                  ; $3
	db 29,ELECTRODE,WEEZING,0                           ; $4
	db 33,ELECTRODE,0                                   ; $5
	db 26,MAGNETON,KOFFING,WEEZING,MAGNEMITE,0          ; $6
	db 25,VOLTORB,KOFFING,MAGNETON,MAGNEMITE,KOFFING,0  ; $7
	db 29,ELECTRODE,MUK,0                               ; $8
	db 29,GRIMER,ELECTRODE,0                            ; $9
	db 28,VOLTORB,KOFFING,MAGNETON,0                    ; $a
	db 29,MAGNEMITE,KOFFING,0                           ; $b
	db 33,MAGNEMITE,MAGNETON,VOLTORB,0                  ; $c
	db 34,MAGNEMITE,ELECTRODE,0                         ; $d

GiovanniData: ; 3a27e (e:627e)
if DEF(_YELLOW)
	db $FF,25,ONIX,24,RHYHORN,29,PERSIAN,0                             ; $1
	db $FF,37,NIDORINO,35,PERSIAN,37,RHYHORN,41,NIDOQUEEN,0            ; $2
	db $FF,50,DUGTRIO,53,PERSIAN,53,NIDOQUEEN,55,NIDOKING,55,RHYDON,0  ; $3
else
	db $FF,25,ONIX,24,RHYHORN,29,KANGASKHAN,0                          ; $1
	db $FF,37,NIDORINO,35,KANGASKHAN,37,RHYHORN,41,NIDOQUEEN,0         ; $2
	db $FF,45,RHYHORN,42,DUGTRIO,44,NIDOQUEEN,45,NIDOKING,50,RHYDON,0  ; $3
endc

RocketData: ; 3a29c (e:629c)
	db 13,RATTATA,ZUBAT,0                        ; $1
	db 11,SANDSHREW,RATTATA,ZUBAT,0              ; $2
	db 12,ZUBAT,EKANS,0                          ; $3
	db 16,RATICATE,0                             ; $4
	db 17,MACHOP,DROWZEE,0                       ; $5
	db 15,EKANS,ZUBAT,0                          ; $6
	db 20,RATICATE,ZUBAT,0                       ; $7
	db 21,DROWZEE,MACHOP,0                       ; $8
	db 21,RATICATE,RATICATE,0                    ; $9
	db 20,GRIMER,KOFFING,KOFFING,0               ; $a
	db 19,RATTATA,RATICATE,RATICATE,RATTATA,0    ; $b
	db 22,GRIMER,KOFFING,0                       ; $c
	db 17,ZUBAT,KOFFING,GRIMER,ZUBAT,RATICATE,0  ; $d
	db 20,RATTATA,RATICATE,DROWZEE,0             ; $e
	db 21,MACHOP,MACHOP,0                        ; $f
	db 23,SANDSHREW,EKANS,SANDSLASH,0            ; $10
	db 23,EKANS,SANDSHREW,ARBOK,0                ; $11
	db 21,KOFFING,ZUBAT,0                        ; $12
	db 25,ZUBAT,ZUBAT,GOLBAT,0                   ; $13
	db 26,KOFFING,DROWZEE,0                      ; $14
	db 23,ZUBAT,RATTATA,RATICATE,ZUBAT,0         ; $15
	db 26,DROWZEE,KOFFING,0                      ; $16
	db 29,CUBONE,ZUBAT,0                         ; $17
	db 25,GOLBAT,ZUBAT,ZUBAT,RATICATE,ZUBAT,0    ; $18
	db 28,RATICATE,HYPNO,RATICATE,0              ; $19
	db 29,MACHOP,DROWZEE,0                       ; $1a
	db 28,EKANS,ZUBAT,CUBONE,0                   ; $1b
	db 33,ARBOK,0                                ; $1c
	db 33,HYPNO,0                                ; $1d
	db 29,MACHOP,MACHOKE,0                       ; $1e
	db 28,ZUBAT,ZUBAT,GOLBAT,0                   ; $1f
	db 26,RATICATE,ARBOK,KOFFING,GOLBAT,0        ; $20
	db 29,CUBONE,CUBONE,0                        ; $21
	db 29,SANDSHREW,SANDSLASH,0                  ; $22
	db 26,RATICATE,ZUBAT,GOLBAT,RATTATA,0        ; $23
	db 28,WEEZING,GOLBAT,KOFFING,0               ; $24
	db 28,DROWZEE,GRIMER,MACHOP,0                ; $25
	db 28,GOLBAT,DROWZEE,HYPNO,0                 ; $26
	db 33,MACHOKE,0                              ; $27
	db 25,RATTATA,RATTATA,ZUBAT,RATTATA,EKANS,0  ; $28
	db 32,CUBONE,DROWZEE,MAROWAK,0               ; $29

if DEF(_YELLOW)
JessieJamesData:
	db 14,EKANS,MEOWTH,KOFFING,0  ; $1
	db 25,KOFFING,MEOWTH,EKANS,0  ; $2
	db 27,MEOWTH,ARBOK,WEEZING,0  ; $3
	db 31,WEEZING,ARBOK,MEOWTH,0  ; $4
	db 16,KOFFING,0               ; $5
	db 27,KOFFING,0               ; $6
	db 29,WEEZING,0               ; $7
	db 33,WEEZING,0               ; $8
endc

CooltrainerMData: ; 3a35a (e:635a)
	db 39,NIDORINO,NIDOKING,0                       ; $1
	db 43,EXEGGUTOR,CLOYSTER,ARCANINE,0             ; $2
	db 43,KINGLER,TENTACRUEL,BLASTOISE,0            ; $3
	db 45,KINGLER,STARMIE,0                         ; $4
	db 42,IVYSAUR,WARTORTLE,CHARMELEON,CHARIZARD,0  ; $5
	db 44,IVYSAUR,WARTORTLE,CHARMELEON,0            ; $6
	db 49,NIDOKING,0                                ; $7
	db 44,KINGLER,CLOYSTER,0                        ; $8
	db 39,SANDSLASH,DUGTRIO,0                       ; $9
	db 43,RHYHORN,0                                 ; $a

CooltrainerFData: ; 3a385 (e:6385)
	db 24,WEEPINBELL,GLOOM,IVYSAUR,0          ; $1
	db 43,BELLSPROUT,WEEPINBELL,VICTREEBEL,0  ; $2
	db 43,PARASECT,DEWGONG,CHANSEY,0          ; $3
	db 46,VILEPLUME,BUTTERFREE,0              ; $4
	db 44,PERSIAN,NINETALES,0                 ; $5
	db 45,IVYSAUR,VENUSAUR,0                  ; $6
	db 45,NIDORINA,NIDOQUEEN,0                ; $7
	db 43,PERSIAN,NINETALES,RAICHU,0          ; $8

BrunoData: ; 3a3a9 (e:63a9)
	db $FF,53,ONIX,55,HITMONCHAN,55,HITMONLEE,56,ONIX,58,MACHAMP,0

BrockData: ; 3a3b5 (e:63b5)
if DEF(_YELLOW)
	db $FF,10,GEODUDE,12,ONIX,0
else
	db $FF,12,GEODUDE,14,ONIX,0
endc

MistyData: ; 3a3bb (e:63bb)
	db $FF,18,STARYU,21,STARMIE,0
LtSurgeData: ; 3a3c1 (e:63c1)
if DEF(_YELLOW)
	db $FF,28,RAICHU,0
else
	db $FF,21,VOLTORB,18,PIKACHU,24,RAICHU,0
endc

ErikaData: ; 3a3c9 (e:63c9)
if DEF(_YELLOW)
	db $FF,30,TANGELA,32,WEEPINBELL,32,GLOOM,0
else
	db $FF,29,VICTREEBEL,24,TANGELA,29,VILEPLUME,0
endc

KogaData: ; 3a3d1 (e:63d1)
if DEF(_YELLOW)
	db $FF,44,VENONAT,46,VENONAT,48,VENONAT,50,VENOMOTH,0
else
	db $FF,37,KOFFING,39,MUK,37,KOFFING,43,WEEZING,0
endc

BlaineData: ; 3a3db (e:63db)
if DEF(_YELLOW)
	db $FF,48,NINETALES,50,RAPIDASH,54,ARCANINE,0
else
	db $FF,42,GROWLITHE,40,PONYTA,42,RAPIDASH,47,ARCANINE,0
endc

SabrinaData: ; 3a3e5 (e:63e5)
if DEF(_YELLOW)
	db $FF,50,ABRA,50,KADABRA,50,ALAKAZAM,0
else
	db $FF,38,KADABRA,37,MR_MIME,38,VENOMOTH,43,ALAKAZAM,0
endc

GentlemanData: ; 3a3ef (e:63ef)
	db 18,GROWLITHE,GROWLITHE,0  ; $1
	db 19,NIDORAN_M,NIDORAN_F,0  ; $2
if DEF(_YELLOW)
	db 22,VOLTORB,MAGNEMITE,0    ; $3
else
	db 23,PIKACHU,0              ; $3
endc
	db 48,PRIMEAPE,0             ; $4
	db 17,GROWLITHE,PONYTA,0     ; $5

Green2Data: ; 3a401 (e:6401)
if DEF(_YELLOW) 
	db $FF,19,SPEAROW,16,RATTATA,18,SANDSHREW,20,EEVEE,0                                ; $1
	db $FF,25,FEAROW,23,SHELLDER,22,VULPIX,20,SANDSHREW,25,EEVEE,0                      ; $2
	db $FF,25,FEAROW,23,MAGNEMITE,22,SHELLDER,20,SANDSHREW,25,EEVEE,0                   ; $3
	db $FF,25,FEAROW,23,VULPIX,22,MAGNEMITE,20,SANDSHREW,25,EEVEE,0                     ; $4
	db $FF,38,SANDSLASH,35,NINETALES,37,CLOYSTER,35,KADABRA,40,JOLTEON,0                ; $5
	db $FF,38,SANDSLASH,35,CLOYSTER,37,MAGNETON,35,KADABRA,40,FLAREON,0                 ; $6
	db $FF,38,SANDSLASH,35,MAGNETON,37,NINETALES,35,KADABRA,40,VAPOREON,0               ; $7
	db $FF,47,SANDSLASH,45,EXEGGCUTE,45,NINETALES,47,CLOYSTER,50,KADABRA,53,JOLTEON,0   ; $8
	db $FF,47,SANDSLASH,45,EXEGGCUTE,45,CLOYSTER,47,MAGNETON,50,KADABRA,53,FLAREON,0    ; $9
	db $FF,47,SANDSLASH,45,EXEGGCUTE,45,MAGNETON,47,NINETALES,50,KADABRA,53,VAPOREON,0  ; $a
else
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,WARTORTLE,0                           ; $1
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,IVYSAUR,0                             ; $2
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,CHARMELEON,0                          ; $3
	db $FF,25,PIDGEOTTO,23,GROWLITHE,22,EXEGGCUTE,20,KADABRA,25,WARTORTLE,0             ; $4
	db $FF,25,PIDGEOTTO,23,GYARADOS,22,GROWLITHE,20,KADABRA,25,IVYSAUR,0                ; $5
	db $FF,25,PIDGEOTTO,23,EXEGGCUTE,22,GYARADOS,20,KADABRA,25,CHARMELEON,0             ; $6
	db $FF,37,PIDGEOT,38,GROWLITHE,35,EXEGGCUTE,35,ALAKAZAM,40,BLASTOISE,0              ; $7
	db $FF,37,PIDGEOT,38,GYARADOS,35,GROWLITHE,35,ALAKAZAM,40,VENUSAUR,0                ; $8
	db $FF,37,PIDGEOT,38,EXEGGCUTE,35,GYARADOS,35,ALAKAZAM,40,CHARIZARD,0               ; $9
	db $FF,47,PIDGEOT,45,RHYHORN,45,GROWLITHE,47,EXEGGCUTE,50,ALAKAZAM,53,BLASTOISE,0   ; $a
	db $FF,47,PIDGEOT,45,RHYHORN,45,GYARADOS,47,GROWLITHE,50,ALAKAZAM,53,VENUSAUR,0     ; $b
	db $FF,47,PIDGEOT,45,RHYHORN,45,EXEGGCUTE,47,GYARADOS,50,ALAKAZAM,53,CHARIZARD,0    ; $c
endc

Green3Data: ; 3a491 (e:6491)
if DEF(_YELLOW)
	db $FF,61,SANDSLASH,59,ALAKAZAM,61,EXEGGUTOR,61,CLOYSTER,63,NINETALES,65,JOLTEON,0   ; $1
	db $FF,61,SANDSLASH,59,ALAKAZAM,61,EXEGGUTOR,61,MAGNETON,63,CLOYSTER,65,FLAREON,0    ; $2
	db $FF,61,SANDSLASH,59,ALAKAZAM,61,EXEGGUTOR,61,NINETALES,63,MAGNETON,65,VAPOREON,0  ; $3
else
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,ARCANINE,63,EXEGGUTOR,65,BLASTOISE,0      ; $1
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,GYARADOS,63,ARCANINE,65,VENUSAUR,0        ; $2
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,EXEGGUTOR,63,GYARADOS,65,CHARIZARD,0      ; $3
endc

LoreleiData: ; 3a4bb (e:64bb)
	db $FF,54,DEWGONG,53,CLOYSTER,54,SLOWBRO,56,JYNX,56,LAPRAS,0

ChannelerData: ; 3a4c7 (e:64c7)
	db 22,GASTLY,0                 ; $1
	db 24,GASTLY,0                 ; $2
	db 23,GASTLY,GASTLY,0          ; $3
	db 24,GASTLY,0                 ; $4
	db 23,GASTLY,0                 ; $5
	db 24,GASTLY,0                 ; $6
	db 24,HAUNTER,0                ; $7
	db 22,GASTLY,0                 ; $8
	db 24,GASTLY,0                 ; $9
	db 23,GASTLY,GASTLY,0          ; $a
	db 24,GASTLY,0                 ; $b
	db 22,GASTLY,0                 ; $c
	db 24,GASTLY,0                 ; $d
	db 23,HAUNTER,0                ; $e
	db 24,GASTLY,0                 ; $f
	db 22,GASTLY,0                 ; $10
	db 24,GASTLY,0                 ; $11
	db 22,HAUNTER,0                ; $12
	db 22,GASTLY,GASTLY,GASTLY,0   ; $13
	db 24,GASTLY,0                 ; $14
	db 24,GASTLY,0                 ; $15
	db 34,GASTLY,HAUNTER,0         ; $16
	db 38,HAUNTER,0                ; $17
	db 33,GASTLY,GASTLY,HAUNTER,0  ; $18

AgathaData: ; 3a516 (e:6516)
	db $FF,56,GENGAR,56,GOLBAT,55,HAUNTER,58,ARBOK,60,GENGAR,0

LanceData: ; 3a522 (e:6522)
	db $FF,58,GYARADOS,56,DRAGONAIR,56,DRAGONAIR,60,AERODACTYL,62,DRAGONITE,0
