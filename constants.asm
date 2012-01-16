_JAPAN EQU 0
_GREEN EQU 0
_YELLOW EQU 0

;\1 = X
;\2 = Y
FuncCoord: MACRO
Coord = $C3A0 + 20 * \2 + \1
	ENDM

;\1 = Map Width
;\2 = Rows above (Y-blocks)
;\3 = X movement (X-blocks)
EVENT_DISP: MACRO
	dw ($C6EF + (\1) + ((\1) + 6) * ((\2) >> 1) + ((\3) >> 1)) ; Ev.Disp
	db \2,\3	;Y,X
	ENDM

FLYWARP_DATA: MACRO
	EVENT_DISP \1,\2,\3
	db ((\2) & $01)	;sub-block Y
	db ((\3) & $01)	;sub-block X
	ENDM
        
; external map entry macro
EMAP: MACRO ; emap x-coordinate,y-coordinate,textpointer
; the appearance of towns and routes in the town map, indexed by map id
	; nybble: y-coordinate
	; nybble: x-coordinate
	; word  : pointer to map name
	db (\1 + (\2 << 4))
	dw \3
	ENDM

; internal map entry macro
IMAP: MACRO ; imap mapid_less_than,x-coordinate,y-coordinate,textpointer
; the appearance of buildings and dungeons in the town map
	; byte  : maximum map id subject to this rule
	; nybble: y-coordinate
	; nybble: x-coordinate
	; word  : pointer to map name
	db \1
	db \2 + \3 << 4
	dw \4
	ENDM

; tilesets' headers macro
TSETHEAD: MACRO
	db BANK(\2)
	dw \1,\2,\3
	db \4,\5,\6,\7,\8
	ENDM

; macro for putting a byte then a word
dbw: MACRO
	db \1
	dw \2
	ENDM

; data format macros
RGB: MACRO
	dw (\3 << 10 | \2 << 5 | \1)
	ENDM

; text macros
TX_NUM: MACRO
; print a big-endian decimal number.
; \1: address to read from
; \2: number of bytes to read
; \3: number of digits to display
	db $09
	dw \1
	db \2 << 4 | \3
	ENDM

TX_FAR: MACRO
	db $17
	dw \1
	db BANK(\1)
	ENDM

; wram locations
W_AICOUNT EQU $CCDF ; number of times remaining that AI action can occur

W_WHICHTRADE EQU $CD3D ; which entry from TradeMons to select

W_OPPONENTHP     EQU $CFE6 ; active opponent's hp (16 bits)
W_OPPONENTNUMBER EQU $CFE8 ; active opponent's position in team (0 to 5)
W_OPPONENTSTATUS EQU $CFE9 ; active opponent's status condition
	; bit 0 slp
	; bit 1 slp
	; bit 2 slp
	; bit 3 psn
	; bit 4 brn
	; bit 5 frz
	; bit 6 par
	; unused? (XXX confirm)

W_CURMONSTATUS EQU $D018 ; the status of the player’s current monster
	; bit 0 slp
	; bit 1 slp
	; bit 2 slp
	; bit 3 psn
	; bit 4 brn
	; bit 5 frz
	; bit 6 par
	; unused? (XXX confirm)

W_CURMONBATTSTATUS EQU $D067 ; various battle statuses
	; bit 5 held in place (Bind, Clamp, etc.)

W_TRAINERCLASS EQU $D031

W_ISINBATTLE EQU $D057 ; no battle, this is 0
                       ; wild battle, this is 1
                       ; trainer battle, this is 2

W_CUROPPONENT EQU $D059 ; in a wild battle, this is the species of pokemon
			; in a trainer battle, this is the trainer class + $C8

W_BATTLETYPE EQU $D05A ; in normal battle, this is 0
                       ; in old man battle, this is 1
                       ; in safari battle, this is 2

W_LONEATTACKNO EQU $D05C ; which entry in LoneAttacks to use
W_TRAINERNO    EQU $D05D ; which instance of [youngster, lass, etc] is this?

W_NUMHITS EQU $D074 ; number of hits in attacks like Doubleslap, etc.

; List type
; used in $D0B6
MONSTER_NAME  EQU 1
MOVE_NAME     EQU 2
; ???_NAME    EQU 3
ITEM_NAME     EQU 4
PLAYEROT_NAME EQU 5
ENEMYOT_NAME  EQU 6
TRAINER_NAME  EQU 7

W_CURENEMYLVL EQU $D127

W_ISLINKBATTLE EQU $D12B

W_PRIZE1 EQU $D13D
W_PRIZE2 EQU $D13E
W_PRIZE3 EQU $D13F

W_PLAYERNAME EQU $D158 ; 11 characters, including null

W_NUMINPARTY EQU $D163

W_NUMBAGITEMS EQU $D31D

W_RIVALNAME  EQU $D34A ; 11 characters, including null

W_CURMAP EQU $D35E

W_YCOORD EQU $D361 ; player’s position on the current map
W_XCOORD EQU $D362

W_MAPDATAPTR EQU $D36A
W_MAPTEXTPTR EQU $D36C
W_MAPSCRIPTPTR EQU $D36E

W_PEOPLEMOVEPERMISSIONS EQU $D4E4

W_PLAYERCOINS1 EQU $D5A4
W_PLAYERCOINS2 EQU $D5A5

W_RIVALSTARTER EQU $D715

W_PLAYERSTARTER EQU $D717

W_GRASSRATE EQU $D887
W_GRASSMONS EQU $D888
W_WATERRATE EQU $D8A4 ; OVERLOADED
W_WATERMONS EQU $D8A5 ; OVERLOADED

W_ENEMYMONCOUNT  EQU $D89C

W_ENEMYMON1HP EQU $D8A5 ; 16 bits

W_ENEMYMON1MOVE3 EQU $D8AE

W_ENEMYMON2MOVE3 EQU $D8DA

W_ENEMYMON3MOVE3 EQU $D906

W_ENEMYMON4MOVE3 EQU $D932

W_ENEMYMON5MOVE3 EQU $D95E

W_ENEMYMON6MOVE3 EQU $D98A

W_NUMSAFARIBALLS EQU $DA47

W_NUMINBOX EQU $DA80

H_RAND1 EQU $FFD3
H_RAND2 EQU $FFD4

H_WHOSETURN EQU $FFF3 ; 0 on player’s turn, 1 on enemy’s turn

; hardware registers, from the pandocs http://nocash.emubase.de/pandocs.htm
rDIV EQU $FF04
rBGP EQU $FF47
rOBP0 EQU $FF48
rOBP1 EQU $FF49


; pokemon name constants
RHYDON     EQU $01
KANGASKHAN EQU $02
NIDORAN_M  EQU $03
CLEFAIRY   EQU $04
SPEAROW    EQU $05
VOLTORB    EQU $06
NIDOKING   EQU $07
SLOWBRO    EQU $08
IVYSAUR    EQU $09
EXEGGUTOR  EQU $0A
LICKITUNG  EQU $0B
EXEGGCUTE  EQU $0C
GRIMER     EQU $0D
GENGAR     EQU $0E
NIDORAN_F  EQU $0F
NIDOQUEEN  EQU $10
CUBONE     EQU $11
RHYHORN    EQU $12
LAPRAS     EQU $13
ARCANINE   EQU $14
MEW        EQU $15
GYARADOS   EQU $16
SHELLDER   EQU $17
TENTACOOL  EQU $18
GASTLY     EQU $19
SCYTHER    EQU $1A
STARYU     EQU $1B
BLASTOISE  EQU $1C
PINSIR     EQU $1D
TANGELA    EQU $1E
GROWLITHE  EQU $21
ONIX       EQU $22
FEAROW     EQU $23
PIDGEY     EQU $24
SLOWPOKE   EQU $25
KADABRA    EQU $26
GRAVELER   EQU $27
CHANSEY    EQU $28
MACHOKE    EQU $29
MR_MIME    EQU $2A
HITMONLEE  EQU $2B
HITMONCHAN EQU $2C
ARBOK      EQU $2D
PARASECT   EQU $2E
PSYDUCK    EQU $2F
DROWZEE    EQU $30
GOLEM      EQU $31
MAGMAR     EQU $33
ELECTABUZZ EQU $35
MAGNETON   EQU $36
KOFFING    EQU $37
MANKEY     EQU $39
SEEL       EQU $3A
DIGLETT    EQU $3B
TAUROS     EQU $3C
FARFETCH_D EQU $40
VENONAT    EQU $41
DRAGONITE  EQU $42
DODUO      EQU $46
POLIWAG    EQU $47
JYNX       EQU $48
MOLTRES    EQU $49
ARTICUNO   EQU $4A
ZAPDOS     EQU $4B
DITTO      EQU $4C
MEOWTH     EQU $4D
KRABBY     EQU $4E
VULPIX     EQU $52
NINETALES  EQU $53
PIKACHU    EQU $54
RAICHU     EQU $55
DRATINI    EQU $58
DRAGONAIR  EQU $59
KABUTO     EQU $5A
KABUTOPS   EQU $5B
HORSEA     EQU $5C
SEADRA     EQU $5D
SANDSHREW  EQU $60
SANDSLASH  EQU $61
OMANYTE    EQU $62
OMASTAR    EQU $63
JIGGLYPUFF EQU $64
WIGGLYTUFF EQU $65
EEVEE      EQU $66
FLAREON    EQU $67
JOLTEON    EQU $68
VAPOREON   EQU $69
MACHOP     EQU $6A
ZUBAT      EQU $6B
EKANS      EQU $6C
PARAS      EQU $6D
POLIWHIRL  EQU $6E
POLIWRATH  EQU $6F
WEEDLE     EQU $70
KAKUNA     EQU $71
BEEDRILL   EQU $72
DODRIO     EQU $74
PRIMEAPE   EQU $75
DUGTRIO    EQU $76
VENOMOTH   EQU $77
DEWGONG    EQU $78
CATERPIE   EQU $7B
METAPOD    EQU $7C
BUTTERFREE EQU $7D
MACHAMP    EQU $7E
GOLDUCK    EQU $80
HYPNO      EQU $81
GOLBAT     EQU $82
MEWTWO     EQU $83
SNORLAX    EQU $84
MAGIKARP   EQU $85
MUK        EQU $88
KINGLER    EQU $8A
CLOYSTER   EQU $8B
ELECTRODE  EQU $8D
CLEFABLE   EQU $8E
WEEZING    EQU $8F
PERSIAN    EQU $90
MAROWAK    EQU $91
HAUNTER    EQU $93
ABRA       EQU $94
ALAKAZAM   EQU $95
PIDGEOTTO  EQU $96
PIDGEOT    EQU $97
STARMIE    EQU $98
BULBASAUR  EQU $99
VENUSAUR   EQU $9A
TENTACRUEL EQU $9B
GOLDEEN    EQU $9D
SEAKING    EQU $9E
PONYTA     EQU $A3
RAPIDASH   EQU $A4
RATTATA    EQU $A5
RATICATE   EQU $A6
NIDORINO   EQU $A7
NIDORINA   EQU $A8
GEODUDE    EQU $A9
PORYGON    EQU $AA
AERODACTYL EQU $AB
MAGNEMITE  EQU $AD
CHARMANDER EQU $B0
SQUIRTLE   EQU $B1
CHARMELEON EQU $B2
WARTORTLE  EQU $B3
CHARIZARD  EQU $B4
ODDISH     EQU $B9
GLOOM      EQU $BA
VILEPLUME  EQU $BB
BELLSPROUT EQU $BC
WEEPINBELL EQU $BD
VICTREEBEL EQU $BE


; trainer name constants
; sometimes it's necessary to add $C8 to these values
YOUNGSTER     EQU $01
BUG_CATCHER   EQU $02
LASS          EQU $03
SAILOR        EQU $04
JR__TRAINER_M EQU $05
JR__TRAINER_F EQU $06
POKEMANIAC    EQU $07
SUPER_NERD    EQU $08
HIKER         EQU $09
BIKER         EQU $0A
BURGLAR       EQU $0B
ENGINEER      EQU $0C
JUGGLER_X     EQU $0D
FISHER        EQU $0E
SWIMMER       EQU $0F
CUE_BALL      EQU $10
GAMBLER       EQU $11
BEAUTY        EQU $12
PSYCHIC_TR    EQU $13
ROCKER        EQU $14
JUGGLER       EQU $15
TAMER         EQU $16
BIRD_KEEPER   EQU $17
BLACKBELT     EQU $18
SONY1         EQU $19
PROF_OAK      EQU $1A
CHIEF         EQU $1B
SCIENTIST     EQU $1C
GIOVANNI      EQU $1D
ROCKET        EQU $1E
COOLTRAINER_M EQU $1F
COOLTRAINER_F EQU $20
BRUNO         EQU $21
BROCK         EQU $22
MISTY         EQU $23
LT__SURGE     EQU $24
ERIKA         EQU $25
KOGA          EQU $26
BLAINE        EQU $27
SABRINA       EQU $28
GENTLEMAN     EQU $29
SONY2         EQU $2A
SONY3         EQU $2B
LORELEI       EQU $2C
CHANNELER     EQU $2D
AGATHA        EQU $2E
LANCE         EQU $2F

; pokemon dex numbers
DEX_BULBASAUR  EQU 1
DEX_IVYSAUR    EQU 2
DEX_VENUSAUR   EQU 3
DEX_CHARMANDER EQU 4
DEX_CHARMELEON EQU 5
DEX_CHARIZARD  EQU 6
DEX_SQUIRTLE   EQU 7
DEX_WARTORTLE  EQU 8
DEX_BLASTOISE  EQU 9
DEX_CATERPIE   EQU 10
DEX_METAPOD    EQU 11
DEX_BUTTERFREE EQU 12
DEX_WEEDLE     EQU 13
DEX_KAKUNA     EQU 14
DEX_BEEDRILL   EQU 15
DEX_PIDGEY     EQU 16
DEX_PIDGEOTTO  EQU 17
DEX_PIDGEOT    EQU 18
DEX_RATTATA    EQU 19
DEX_RATICATE   EQU 20
DEX_SPEAROW    EQU 21
DEX_FEAROW     EQU 22
DEX_EKANS      EQU 23
DEX_ARBOK      EQU 24
DEX_PIKACHU    EQU 25
DEX_RAICHU     EQU 26
DEX_SANDSHREW  EQU 27
DEX_SANDSLASH  EQU 28
DEX_NIDORAN_F  EQU 29
DEX_NIDORINA   EQU 30
DEX_NIDOQUEEN  EQU 31
DEX_NIDORAN_M  EQU 32
DEX_NIDORINO   EQU 33
DEX_NIDOKING   EQU 34
DEX_CLEFAIRY   EQU 35
DEX_CLEFABLE   EQU 36
DEX_VULPIX     EQU 37
DEX_NINETALES  EQU 38
DEX_JIGGLYPUFF EQU 39
DEX_WIGGLYTUFF EQU 40
DEX_ZUBAT      EQU 41
DEX_GOLBAT     EQU 42
DEX_ODDISH     EQU 43
DEX_GLOOM      EQU 44
DEX_VILEPLUME  EQU 45
DEX_PARAS      EQU 46
DEX_PARASECT   EQU 47
DEX_VENONAT    EQU 48
DEX_VENOMOTH   EQU 49
DEX_DIGLETT    EQU 50
DEX_DUGTRIO    EQU 51
DEX_MEOWTH     EQU 52
DEX_PERSIAN    EQU 53
DEX_PSYDUCK    EQU 54
DEX_GOLDUCK    EQU 55
DEX_MANKEY     EQU 56
DEX_PRIMEAPE   EQU 57
DEX_GROWLITHE  EQU 58
DEX_ARCANINE   EQU 59
DEX_POLIWAG    EQU 60
DEX_POLIWHIRL  EQU 61
DEX_POLIWRATH  EQU 62
DEX_ABRA       EQU 63
DEX_KADABRA    EQU 64
DEX_ALAKAZAM   EQU 65
DEX_MACHOP     EQU 66
DEX_MACHOKE    EQU 67
DEX_MACHAMP    EQU 68
DEX_BELLSPROUT EQU 69
DEX_WEEPINBELL EQU 70
DEX_VICTREEBEL EQU 71
DEX_TENTACOOL  EQU 72
DEX_TENTACRUEL EQU 73
DEX_GEODUDE    EQU 74
DEX_GRAVELER   EQU 75
DEX_GOLEM      EQU 76
DEX_PONYTA     EQU 77
DEX_RAPIDASH   EQU 78
DEX_SLOWPOKE   EQU 79
DEX_SLOWBRO    EQU 80
DEX_MAGNEMITE  EQU 81
DEX_MAGNETON   EQU 82
DEX_FARFETCH_D EQU 83
DEX_DODUO      EQU 84
DEX_DODRIO     EQU 85
DEX_SEEL       EQU 86
DEX_DEWGONG    EQU 87
DEX_GRIMER     EQU 88
DEX_MUK        EQU 89
DEX_SHELLDER   EQU 90
DEX_CLOYSTER   EQU 91
DEX_GASTLY     EQU 92
DEX_HAUNTER    EQU 93
DEX_GENGAR     EQU 94
DEX_ONIX       EQU 95
DEX_DROWZEE    EQU 96
DEX_HYPNO      EQU 97
DEX_KRABBY     EQU 98
DEX_KINGLER    EQU 99
DEX_VOLTORB    EQU 100
DEX_ELECTRODE  EQU 101
DEX_EXEGGCUTE  EQU 102
DEX_EXEGGUTOR  EQU 103
DEX_CUBONE     EQU 104
DEX_MAROWAK    EQU 105
DEX_HITMONLEE  EQU 106
DEX_HITMONCHAN EQU 107
DEX_LICKITUNG  EQU 108
DEX_KOFFING    EQU 109
DEX_WEEZING    EQU 110
DEX_RHYHORN    EQU 111
DEX_RHYDON     EQU 112
DEX_CHANSEY    EQU 113
DEX_TANGELA    EQU 114
DEX_KANGASKHAN EQU 115
DEX_HORSEA     EQU 116
DEX_SEADRA     EQU 117
DEX_GOLDEEN    EQU 118
DEX_SEAKING    EQU 119
DEX_STARYU     EQU 120
DEX_STARMIE    EQU 121
DEX_MR_MIME    EQU 122
DEX_SCYTHER    EQU 123
DEX_JYNX       EQU 124
DEX_ELECTABUZZ EQU 125
DEX_MAGMAR     EQU 126
DEX_PINSIR     EQU 127
DEX_TAUROS     EQU 128
DEX_MAGIKARP   EQU 129
DEX_GYARADOS   EQU 130
DEX_LAPRAS     EQU 131
DEX_DITTO      EQU 132
DEX_EEVEE      EQU 133
DEX_VAPOREON   EQU 134
DEX_JOLTEON    EQU 135
DEX_FLAREON    EQU 136
DEX_PORYGON    EQU 137
DEX_OMANYTE    EQU 138
DEX_OMASTAR    EQU 139
DEX_KABUTO     EQU 140
DEX_KABUTOPS   EQU 141
DEX_AERODACTYL EQU 142
DEX_SNORLAX    EQU 143
DEX_ARTICUNO   EQU 144
DEX_ZAPDOS     EQU 145
DEX_MOLTRES    EQU 146
DEX_DRATINI    EQU 147
DEX_DRAGONAIR  EQU 148
DEX_DRAGONITE  EQU 149
DEX_MEWTWO     EQU 150
DEX_MEW        EQU 151


; item name constants
MASTER_BALL   EQU $01
ULTRA_BALL    EQU $02
GREAT_BALL    EQU $03
POKE_BALL     EQU $04
TOWN_MAP      EQU $05
BICYCLE       EQU $06
SURFBOARD     EQU $07 ; buggy?
SAFARI_BALL   EQU $08
POKEDEX       EQU $09
MOON_STONE    EQU $0A
ANTIDOTE      EQU $0B
BURN_HEAL     EQU $0C
ICE_HEAL      EQU $0D
AWAKENING     EQU $0E
PARLYZ_HEAL   EQU $0F
FULL_RESTORE  EQU $10
MAX_POTION    EQU $11
HYPER_POTION  EQU $12
SUPER_POTION  EQU $13
POTION        EQU $14
BOULDERBADGE  EQU $15
CASCADEBADGE  EQU $16
THUNDERBADGE  EQU $17
RAINBOWBADGE  EQU $18
SOULBADGE     EQU $19
MARSHBADGE    EQU $1A
VOLCANOBADGE  EQU $1B
EARTHBADGE    EQU $1C
ESCAPE_ROPE   EQU $1D
REPEL         EQU $1E
OLD_AMBER     EQU $1F
FIRE_STONE    EQU $20
THUNDER_STONE EQU $21
WATER_STONE   EQU $22
HP_UP         EQU $23
PROTEIN       EQU $24
IRON          EQU $25
CARBOS        EQU $26
CALCIUM       EQU $27
RARE_CANDY    EQU $28
DOME_FOSSIL   EQU $29
HELIX_FOSSIL  EQU $2A
SECRET_KEY    EQU $2B
; XXX ????? EQU $2C
BIKE_VOUCHER  EQU $2D
X_ACCURACY    EQU $2E
LEAF_STONE    EQU $2F
CARD_KEY      EQU $30
NUGGET        EQU $31
;PP_UP         EQU $32
POKE_DOLL     EQU $33
FULL_HEAL     EQU $34
REVIVE        EQU $35
MAX_REVIVE    EQU $36
GUARD_SPEC_   EQU $37
SUPER_REPEL   EQU $38
MAX_REPEL     EQU $39
DIRE_HIT      EQU $3A
COIN          EQU $3B
FRESH_WATER   EQU $3C
SODA_POP      EQU $3D
LEMONADE      EQU $3E
S_S__TICKET   EQU $3F
GOLD_TEETH    EQU $40
X_ATTACK      EQU $41
X_DEFEND      EQU $42
X_SPEED       EQU $43
X_SPECIAL     EQU $44
COIN_CASE     EQU $45
OAKS_PARCEL  EQU $46
ITEMFINDER    EQU $47
SILPH_SCOPE   EQU $48
POKE_FLUTE    EQU $49
LIFT_KEY      EQU $4A
EXP__ALL      EQU $4B
OLD_ROD       EQU $4C
GOOD_ROD      EQU $4D
SUPER_ROD     EQU $4E
; XXX todo: compare this to $32
PP_UP         EQU $4F
ETHER         EQU $50
MAX_ETHER     EQU $51
ELIXER        EQU $52
MAX_ELIXER    EQU $53
HM_01         EQU $C4
HM_02         EQU $C5
HM_03         EQU $C6
HM_04         EQU $C7
HM_05         EQU $C8
TM_01         EQU $C9
TM_02         EQU $CA
TM_03         EQU $CB
TM_04         EQU $CC
TM_05         EQU $CD
TM_06         EQU $CE
TM_07         EQU $CF
TM_08         EQU $D0
TM_09         EQU $D1
TM_10         EQU $D2
TM_11         EQU $D3
TM_12         EQU $D4
TM_13         EQU $D5
TM_14         EQU $D6
TM_15         EQU $D7
TM_16         EQU $D8
TM_17         EQU $D9
TM_18         EQU $DA
TM_19         EQU $DB
TM_20         EQU $DC
TM_21         EQU $DD
TM_22         EQU $DE
TM_23         EQU $DF
TM_24         EQU $E0
TM_25         EQU $E1
TM_26         EQU $E2
TM_27         EQU $E3
TM_28         EQU $E4
TM_29         EQU $E5
TM_30         EQU $E6
TM_31         EQU $E7
TM_32         EQU $E8
TM_33         EQU $E9
TM_34         EQU $EA
TM_35         EQU $EB
TM_36         EQU $EC
TM_37         EQU $ED
TM_38         EQU $EE
TM_39         EQU $EF
TM_40         EQU $F0
TM_41         EQU $F1
TM_42         EQU $F2
TM_43         EQU $F3
TM_44         EQU $F4
TM_45         EQU $F5
TM_46         EQU $F6
TM_47         EQU $F7
TM_48         EQU $F8
TM_49         EQU $F9
TM_50         EQU $FA


; move name constants
POUND        EQU $01
KARATE_CHOP  EQU $02
DOUBLESLAP   EQU $03
COMET_PUNCH  EQU $04
MEGA_PUNCH   EQU $05
PAY_DAY      EQU $06
FIRE_PUNCH   EQU $07
ICE_PUNCH    EQU $08
THUNDERPUNCH EQU $09
SCRATCH      EQU $0A
VICEGRIP     EQU $0B
GUILLOTINE   EQU $0C
RAZOR_WIND   EQU $0D
SWORDS_DANCE EQU $0E
CUT          EQU $0F
GUST         EQU $10
WING_ATTACK  EQU $11
WHIRLWIND    EQU $12
FLY          EQU $13
BIND         EQU $14
SLAM         EQU $15
VINE_WHIP    EQU $16
STOMP        EQU $17
DOUBLE_KICK  EQU $18
MEGA_KICK    EQU $19
JUMP_KICK    EQU $1A
ROLLING_KICK EQU $1B
SAND_ATTACK  EQU $1C
HEADBUTT     EQU $1D
HORN_ATTACK  EQU $1E
FURY_ATTACK  EQU $1F
HORN_DRILL   EQU $20
TACKLE       EQU $21
BODY_SLAM    EQU $22
WRAP         EQU $23
TAKE_DOWN    EQU $24
THRASH       EQU $25
DOUBLE_EDGE  EQU $26
TAIL_WHIP    EQU $27
POISON_STING EQU $28
TWINEEDLE    EQU $29
PIN_MISSILE  EQU $2A
LEER         EQU $2B
BITE         EQU $2C
GROWL        EQU $2D
ROAR         EQU $2E
SING         EQU $2F
SUPERSONIC   EQU $30
SONICBOOM    EQU $31
DISABLE      EQU $32
ACID         EQU $33
EMBER        EQU $34
FLAMETHROWER EQU $35
MIST         EQU $36
WATER_GUN    EQU $37
HYDRO_PUMP   EQU $38
SURF         EQU $39
ICE_BEAM     EQU $3A
BLIZZARD     EQU $3B
PSYBEAM      EQU $3C
BUBBLEBEAM   EQU $3D
AURORA_BEAM  EQU $3E
HYPER_BEAM   EQU $3F
PECK         EQU $40
DRILL_PECK   EQU $41
SUBMISSION   EQU $42
LOW_KICK     EQU $43
COUNTER      EQU $44
SEISMIC_TOSS EQU $45
STRENGTH     EQU $46
ABSORB       EQU $47
MEGA_DRAIN   EQU $48
LEECH_SEED   EQU $49
GROWTH       EQU $4A
RAZOR_LEAF   EQU $4B
SOLARBEAM    EQU $4C
POISONPOWDER EQU $4D
STUN_SPORE   EQU $4E
SLEEP_POWDER EQU $4F
PETAL_DANCE  EQU $50
STRING_SHOT  EQU $51
DRAGON_RAGE  EQU $52
FIRE_SPIN    EQU $53
THUNDERSHOCK EQU $54
THUNDERBOLT  EQU $55
THUNDER_WAVE EQU $56
THUNDER      EQU $57
ROCK_THROW   EQU $58
EARTHQUAKE   EQU $59
FISSURE      EQU $5A
DIG          EQU $5B
TOXIC        EQU $5C
CONFUSION    EQU $5D
PSYCHIC_M    EQU $5E
HYPNOSIS     EQU $5F
MEDITATE     EQU $60
AGILITY      EQU $61
QUICK_ATTACK EQU $62
RAGE         EQU $63
TELEPORT     EQU $64
NIGHT_SHADE  EQU $65
MIMIC        EQU $66
SCREECH      EQU $67
DOUBLE_TEAM  EQU $68
RECOVER      EQU $69
HARDEN       EQU $6A
MINIMIZE     EQU $6B
SMOKESCREEN  EQU $6C
CONFUSE_RAY  EQU $6D
WITHDRAW     EQU $6E
DEFENSE_CURL EQU $6F
BARRIER      EQU $70
LIGHT_SCREEN EQU $71
HAZE         EQU $72
REFLECT      EQU $73
FOCUS_ENERGY EQU $74
BIDE         EQU $75
METRONOME    EQU $76
MIRROR_MOVE  EQU $77
SELFDESTRUCT EQU $78
EGG_BOMB     EQU $79
LICK         EQU $7A
SMOG         EQU $7B
SLUDGE       EQU $7C
BONE_CLUB    EQU $7D
FIRE_BLAST   EQU $7E
WATERFALL    EQU $7F
CLAMP        EQU $80
SWIFT        EQU $81
SKULL_BASH   EQU $82
SPIKE_CANNON EQU $83
CONSTRICT    EQU $84
AMNESIA      EQU $85
KINESIS      EQU $86
SOFTBOILED   EQU $87
HI_JUMP_KICK EQU $88
GLARE        EQU $89
DREAM_EATER  EQU $8A
POISON_GAS   EQU $8B
BARRAGE      EQU $8C
LEECH_LIFE   EQU $8D
LOVELY_KISS  EQU $8E
SKY_ATTACK   EQU $8F
TRANSFORM    EQU $90
BUBBLE       EQU $91
DIZZY_PUNCH  EQU $92
SPORE        EQU $93
FLASH        EQU $94
PSYWAVE      EQU $95
SPLASH       EQU $96
ACID_ARMOR   EQU $97
CRABHAMMER   EQU $98
EXPLOSION    EQU $99
FURY_SWIPES  EQU $9A
BONEMERANG   EQU $9B
REST         EQU $9C
ROCK_SLIDE   EQU $9D
HYPER_FANG   EQU $9E
SHARPEN      EQU $9F
CONVERSION   EQU $A0
TRI_ATTACK   EQU $A1
SUPER_FANG   EQU $A2
SLASH        EQU $A3
SUBSTITUTE   EQU $A4
STRUGGLE     EQU $A5
; these do double duty as animation identifiers
SHOWPIC_ANIM EQU $A6 ; redraw monster pic
SLP_ANIM     EQU $BD ; sleeping monster
CONF_ANIM    EQU $BF ; confused monster
TOSS_ANIM    EQU $C1 ; toss Poké Ball
POOF_ANIM    EQU $C3 ; puff of smoke
BLOCKBALL_ANIM EQU $C4 ; trainer knocks away Poké Ball
GREATTOSS_ANIM EQU $C5 ; toss Great Ball
ULTRATOSS_ANIM EQU $C6 ; toss Ultra Ball or Master Ball
HIDEPIC_ANIM EQU $C8 ; monster disappears

; super game boy palettes
PAL_ROUTE     EQU $00
PAL_PALLET    EQU $01
PAL_VIRIDIAN  EQU $02
PAL_PEWTER    EQU $03
PAL_CERULEAN  EQU $04
PAL_LAVENDER  EQU $05
PAL_VERMILION EQU $06
PAL_CELADON   EQU $07
PAL_FUCHSIA   EQU $08
PAL_CINNABAR  EQU $09
PAL_INDIGO    EQU $0A
PAL_SAFFRON   EQU $0B
; XXX
PAL_LOGO1     EQU $0D
; XXX
PAL_LOGO2     EQU $0F
PAL_MEWMON    EQU $10
PAL_BLUEMON   EQU $11
PAL_REDMON    EQU $12
PAL_CYANMON   EQU $13
PAL_PURPLEMON EQU $14
PAL_BROWNMON  EQU $15
PAL_GREENMON  EQU $16
PAL_PINKMON   EQU $17
PAL_YELLOWMON EQU $18
PAL_GREYMON   EQU $19
PAL_SLOTS1    EQU $1A
PAL_SLOTS2    EQU $1B
PAL_SLOTS3    EQU $1C
PAL_SLOTS4    EQU $1D
PAL_BLACK     EQU $1E
PAL_GREENBAR  EQU $1F
PAL_YELLOWBAR EQU $20
PAL_REDBAR    EQU $21
PAL_BADGE     EQU $22
PAL_CAVE      EQU $23
; XXX

; map name constants
PALLET_TOWN     EQU $00
VIRIDIAN_CITY   EQU $01
PEWTER_CITY     EQU $02
CERULEAN_CITY   EQU $03
LAVENDER_TOWN   EQU $04
VERMILION_CITY  EQU $05
CELADON_CITY    EQU $06
FUCHSIA_CITY    EQU $07
CINNABAR_ISLAND EQU $08
INDIGO_PLATEAU  EQU $09
SAFFRON_CITY    EQU $0A
; unused        EQU $0B
ROUTE_1         EQU $0C
ROUTE_2         EQU $0D
ROUTE_3         EQU $0E
ROUTE_4         EQU $0F
ROUTE_5         EQU $10
ROUTE_6         EQU $11
ROUTE_7         EQU $12
ROUTE_8         EQU $13
ROUTE_9         EQU $14
ROUTE_10        EQU $15
ROUTE_11        EQU $16
ROUTE_12        EQU $17
ROUTE_13        EQU $18
ROUTE_14        EQU $19
ROUTE_15        EQU $1A
ROUTE_16        EQU $1B
ROUTE_17        EQU $1C
ROUTE_18        EQU $1D
ROUTE_19        EQU $1E
ROUTE_20        EQU $1F
ROUTE_21        EQU $20
ROUTE_22        EQU $21
ROUTE_23        EQU $22
ROUTE_24        EQU $23
ROUTE_25        EQU $24
REDS_HOUSE_1F EQU $25
REDS_HOUSE_2F EQU $26
BLUES_HOUSE EQU $27
OAKS_LAB EQU $28
VIRIDIAN_POKECENTER EQU $29
VIRIDIAN_MART EQU $2A
VIRIDIAN_SCHOOL EQU $2B
VIRIDIAN_HOUSE EQU $2C
VIRIDIAN_GYM EQU $2D
DIGLETTS_CAVE_EXIT EQU $2E
VIRIDIAN_FOREST_EXIT EQU $2F
ROUTE_2_HOUSE EQU $30
ROUTE_2_GATE EQU $31
VIRIDIAN_FOREST_ENTRANCE EQU $32
VIRIDIAN_FOREST EQU $33
MUSEUM_1F EQU $34
MUSEUM_2F EQU $35
PEWTER_GYM EQU $36
PEWTER_HOUSE_1 EQU $37
PEWTER_MART EQU $38
PEWTER_HOUSE_2 EQU $39
PEWTER_POKECENTER EQU $3A
MT_MOON_1 EQU $3B
MT_MOON_2 EQU $3C
MT_MOON_3 EQU $3D
TRASHED_HOUSE EQU $3E
CERULEAN_HOUSE EQU $3F
CERULEAN_POKECENTER EQU $40
CERULEAN_GYM EQU $41
BIKE_SHOP EQU $42
CERULEAN_MART EQU $43
MT_MOON_POKECENTER EQU $44
;copy of TRASHED_HOUSE EQU $45
ROUTE_5_GATE EQU $46
PATH_ENTRANCE_ROUTE_5 EQU $47
DAYCAREM EQU $48
ROUTE_6_GATE EQU $49
PATH_ENTRANCE_ROUTE_6 EQU $4A
;copy of PATH_ENTRANCE_ROUTE_6 EQU $4B
ROUTE_7_GATE EQU $4C
PATH_ENTRANCE_ROUTE_7 EQU $4D
;copy of PATH_ENTRANCE_ROUTE_7 EQU $4E
ROUTE_8_GATE EQU $4F
PATH_ENTRANCE_ROUTE_8 EQU $50
ROCK_TUNNEL_POKECENTER EQU $51
ROCK_TUNNEL_1 EQU $52
POWER_PLANT EQU $53
ROUTE_11_GATE_1F EQU $54
DIGLETTS_CAVE_ENTRANCE EQU $55
ROUTE_11_GATE_2F EQU $56
ROUTE_12_GATE EQU $57
BILLS_HOUSE EQU $58
VERMILION_POKECENTER EQU $59
POKEMON_FAN_CLUB EQU $5A
VERMILION_MART EQU $5B
VERMILION_GYM EQU $5C
VERMILION_HOUSE_1 EQU $5D
VERMILION_DOCK EQU $5E
SS_ANNE_1 EQU $5F
SS_ANNE_2 EQU $60
SS_ANNE_3 EQU $61
SS_ANNE_4 EQU $62
SS_ANNE_5 EQU $63
SS_ANNE_6 EQU $64
SS_ANNE_7 EQU $65
SS_ANNE_8 EQU $66
SS_ANNE_9 EQU $67
SS_ANNE_10 EQU $68
;EQU $69
;EQU $6A
;EQU $6B
VICTORY_ROAD_1 EQU $6C
;EQU $6D
;EQU $6E
;EQU $6F
;EQU $70
LANCES_ROOM EQU $71
;EQU $72
;EQU $73
;EQU $74
;EQU $75
HALL_OF_FAME EQU $76
UNDERGROUND_PATH_NS EQU $77
CHAMPIONS_ROOM EQU $78
UNDERGROUND_PATH_WE EQU $79
CELADON_MART_1 EQU $7A
CELADON_MART_2 EQU $7B
CELADON_MART_3 EQU $7C
CELADON_MART_4 EQU $7D
CELADON_MART_ROOF EQU $7E
CELADON_MART_ELEVATOR EQU $7F
CELADON_MANSION_1 EQU $80
CELADON_MANSION_2 EQU $81
CELADON_MANSION_3 EQU $82
CELADON_MANSION_4 EQU $83
CELADON_MANSION_5 EQU $84
CELADON_POKECENTER EQU $85
CELADON_GYM EQU $86
GAME_CORNER EQU $87
CELADON_MART_5 EQU $88
CELADONPRIZE_ROOM EQU $89
CELADON_DINER EQU $8A
CELADON_HOUSE EQU $8B
CELADON_HOTEL EQU $8C
LAVENDER_POKECENTER EQU $8D
POKEMONTOWER_1 EQU $8E
POKEMONTOWER_2 EQU $8F
POKEMONTOWER_3 EQU $90
POKEMONTOWER_4 EQU $91
POKEMONTOWER_5 EQU $92
POKEMONTOWER_6 EQU $93
POKEMONTOWER_7 EQU $94
LAVENDER_HOUSE_1 EQU $95
LAVENDER_MART EQU $96
LAVENDER_HOUSE_2 EQU $97
FUCHSIA_MART EQU $98
FUCHSIA_HOUSE_1 EQU $99
FUCHSIA_POKECENTER EQU $9A
FUCHSIA_HOUSE_2 EQU $9B
SAFARIZONEENTRANCE EQU $9C
FUCHSIA_GYM EQU $9D
FUCHSIAMEETINGROOM EQU $9E
SEAFOAM_ISLANDS_2 EQU $9F
SEAFOAM_ISLANDS_3 EQU $A0
SEAFOAM_ISLANDS_4 EQU $A1
SEAFOAM_ISLANDS_5 EQU $A2
VERMILION_HOUSE_2 EQU $A3
FUCHSIA_HOUSE_3 EQU $A4
MANSION_1 EQU $A5
CINNABAR_GYM EQU $A6
CINNABAR_LAB_1 EQU $A7
CINNABAR_LAB_2 EQU $A8
CINNABAR_LAB_3 EQU $A9
CINNABAR_LAB_4 EQU $AA
CINNABAR_POKECENTER EQU $AB
CINNABAR_MART EQU $AC
;copy of CINNABAR_MART EQU $AD
INDIGO_PLATEAU_LOBBY EQU $AE
COPYCATS_HOUSE_1F EQU $AF
COPYCATS_HOUSE_2F EQU $B0
FIGHTINGDOJO EQU $B1
SAFFRON_GYM EQU $B2
SAFFRON_HOUSE_1 EQU $B3
SAFFRON_MART EQU $B4
SILPH_CO_1F EQU $B5
SAFFRON_POKECENTER EQU $B6
SAFFRON_HOUSE_2 EQU $B7
ROUTE_15_GATE EQU $B8
ROUTE_16_GATE_1F EQU $BA
ROUTE_16_GATE_2F EQU $BB
ROUTE_16_HOUSE EQU $BC
ROUTE_12_HOUSE EQU $BD
ROUTE_18_GATE_1F EQU $BE
ROUTE_18_GATE_2F EQU $BF
SEAFOAM_ISLANDS_1 EQU $C0
ROUTE_22_GATE EQU $C1
VICTORY_ROAD_2 EQU $C2
ROUTE_12_GATE_2F EQU $C3
VERMILION_HOUSE_3 EQU $C4
DIGLETTS_CAVE EQU $C5
VICTORY_ROAD_3 EQU $C6
ROCKET_HIDEOUT_1 EQU $C7
ROCKET_HIDEOUT_2 EQU $C8
ROCKET_HIDEOUT_3 EQU $C9
ROCKET_HIDEOUT_4 EQU $CA
ROCKET_HIDEOUT_ELEVATOR EQU $CB
;EQU $CC
;EQU $CD
;EQU $CE
SILPH_CO_2F EQU $CF
SILPH_CO_3F EQU $D0
SILPH_CO_4F EQU $D1
SILPH_CO_5F EQU $D2
SILPH_CO_6F EQU $D3
SILPH_CO_7F EQU $D4
SILPH_CO_8F EQU $D5
MANSION_2 EQU $D6
MANSION_3 EQU $D7
MANSION_4 EQU $D8
SAFARI_ZONE_EAST EQU $D9
SAFARI_ZONE_NORTH EQU $DA
SAFARI_ZONE_WEST EQU $DB
SAFARI_ZONE_CENTER EQU $DC
SAFARI_ZONE_REST_HOUSE_1 EQU $DD
SAFARI_ZONE_SECRET_HOUSE EQU $DE
SAFARI_ZONE_REST_HOUSE_2 EQU $DF
SAFARI_ZONE_REST_HOUSE_3 EQU $E0
SAFARI_ZONE_REST_HOUSE_4 EQU $E1
UNKNOWN_DUNGEON_2 EQU $E2
UNKNOWN_DUNGEON_3 EQU $E3
UNKNOWN_DUNGEON_1 EQU $E4
NAME_RATERS_HOUSE EQU $E5
CERULEAN_HOUSE_3 EQU $E6
;EQU $E7
ROCK_TUNNEL_2 EQU $E8
SILPH_CO_9F EQU $E9
SILPH_CO_10F EQU $EA
SILPH_CO_11F EQU $EB
SILPH_CO_ELEVATOR EQU $EC
;EQU $ED
;EQU $EE
BATTLE_CENTER EQU $EF
TRADE_CENTER EQU $F0
;EQU $F1
;EQU $F2
;EQU $F3
;EQU $F4
LORELEIS_ROOM EQU $F5
BRUNOS_ROOM EQU $F6
AGATHAS_ROOM EQU $F7
BEACH_HOUSE EQU $F8 ; Yellow only

; Evolution types
EV_LEVEL	EQU 1
EV_ITEM 	EQU 2
EV_TRADE	EQU 3

; Elemental types
NORMAL EQU $00
FIGHTING EQU $01
FLYING EQU $02
POISON EQU $03
GROUND EQU $04
ROCK EQU $05
BUG EQU $07
GHOST EQU $08
FIRE EQU $14
WATER EQU $15
GRASS EQU $16
ELECTRIC EQU $17
PSYCHIC EQU $18
ICE EQU $19
DRAGON EQU $1A

EAST EQU 1
WEST EQU 2
SOUTH EQU 4
NORTH EQU 8

; different kinds of people events
ITEM EQU $80
TRAINER EQU $40

; status ailments (masks)
FRZ		EQU %00100000
SLP		EQU %00000111

SPRITE_RED                       EQU $01
SPRITE_BLUE                      EQU $02
SPRITE_OAK                       EQU $03
SPRITE_BUG_CATCHER               EQU $04
SPRITE_SLOWBRO                   EQU $05
SPRITE_LASS                      EQU $06
SPRITE_BLACK_HAIR_BOY_1          EQU $07
SPRITE_LITTLE_GIRL               EQU $08
SPRITE_BIRD                      EQU $09
SPRITE_FAT_BALD_GUY              EQU $0a
SPRITE_GAMBLER                   EQU $0b
SPRITE_BLACK_HAIR_BOY_2          EQU $0c
SPRITE_GIRL                      EQU $0d
SPRITE_HIKER                     EQU $0e
SPRITE_FOULARD_WOMAN             EQU $0f
SPRITE_GENTLEMAN                 EQU $10
SPRITE_DAISY                     EQU $11
SPRITE_BIKER                     EQU $12
SPRITE_SAILOR                    EQU $13
SPRITE_COOK                      EQU $14
SPRITE_BIKE_SHOP_GUY             EQU $15
SPRITE_MR_FUJI                   EQU $16
SPRITE_GIOVANNI                  EQU $17
SPRITE_ROCKET                    EQU $18
SPRITE_MEDIUM                    EQU $19
SPRITE_WAITER                    EQU $1a
SPRITE_ERIKA                     EQU $1b
SPRITE_MOM_GEISHA                EQU $1c
SPRITE_BRUNETTE_GIRL             EQU $1d
SPRITE_LANCE                     EQU $1e
SPRITE_OAK_SCIENTIST_AIDE        EQU $1f
SPRITE_OAK_AIDE                  EQU $20
SPRITE_ROCKER                    EQU $21
SPRITE_SWIMMER                   EQU $22
SPRITE_WHITE_PLAYER              EQU $23
SPRITE_GYM_HELPER                EQU $24
SPRITE_OLD_PERSON                EQU $25
SPRITE_MART_GUY                  EQU $26
SPRITE_FISHER                    EQU $27
SPRITE_OLD_MEDIUM_WOMAN          EQU $28
SPRITE_NURSE                     EQU $29
SPRITE_CABLE_CLUB_WOMAN          EQU $2a
SPRITE_MR_MASTERBALL             EQU $2b
SPRITE_LAPRAS_GIVER              EQU $2c
SPRITE_WARDEN                    EQU $2d
SPRITE_SS_CAPTAIN                EQU $2e
SPRITE_FISHER2                   EQU $2f
SPRITE_BLACKBELT                 EQU $30
SPRITE_GUARD                     EQU $31
;SPRITE_COP_GUARD                 EQU $32
SPRITE_MOM                       EQU $33
SPRITE_BALDING_GUY               EQU $34
SPRITE_YOUNG_BOY                 EQU $35
SPRITE_GAMEBOY_KID               EQU $36
SPRITE_GAMEBOY_KID_COPY          EQU $37
SPRITE_CLEFAIRY                  EQU $38
SPRITE_AGATHA                    EQU $39
SPRITE_BRUNO                     EQU $3a
SPRITE_LORELEI                   EQU $3b
SPRITE_SEEL                      EQU $3c
SPRITE_BALL                      EQU $3d
SPRITE_OMANYTE                   EQU $3e
SPRITE_BOULDER                   EQU $3f
SPRITE_PAPER_SHEET               EQU $40
SPRITE_BOOK_MAP_DEX              EQU $41
SPRITE_CLIPBOARD                 EQU $42
SPRITE_SNORLAX                   EQU $43
SPRITE_OLD_AMBER_COPY            EQU $44
SPRITE_OLD_AMBER                 EQU $45
SPRITE_LYING_OLD_MAN_UNUSED_1    EQU $46
SPRITE_LYING_OLD_MAN_UNUSED_2    EQU $47
SPRITE_LYING_OLD_MAN             EQU $48

; Map sizes (y, x)

; PalletTown_h map_id=0
PalletTownHeight EQU $09
PalletTownWidth  EQU $0a

; ViridianCity_h map_id=1
ViridianCityHeight EQU $12
ViridianCityWidth  EQU $14

; PewterCity_h map_id=2
PewterCityHeight EQU $12
PewterCityWidth  EQU $14

; CeruleanCity_h map_id=3
CeruleanCityHeight EQU $12
CeruleanCityWidth  EQU $14

; LavenderTown_h map_id=4
LavenderTownHeight EQU $09
LavenderTownWidth  EQU $0a

; VermilionCity_h map_id=5
VermilionCityHeight EQU $12
VermilionCityWidth  EQU $14

; CeladonCity_h map_id=6
CeladonCityHeight EQU $12
CeladonCityWidth  EQU $19

; FuchsiaCity_h map_id=7
FuchsiaCityHeight EQU $12
FuchsiaCityWidth  EQU $14

; CinnabarIsland_h map_id=8
CinnabarIslandHeight EQU $09
CinnabarIslandWidth  EQU $0a

; IndigoPlateau_h map_id=9
IndigoPlateauHeight EQU $09
IndigoPlateauWidth  EQU $0a

; SaffronCity_h map_id=10
SaffronCityHeight EQU $12
SaffronCityWidth  EQU $14

; Route1_h map_id=12
Route1Height EQU $12
Route1Width  EQU $0a

; Route2_h map_id=13
Route2Height EQU $24
Route2Width  EQU $0a

; Route3_h map_id=14
Route3Height EQU $09
Route3Width  EQU $23

; Route4_h map_id=15
Route4Height EQU $09
Route4Width  EQU $2d

; Route5_h map_id=16
Route5Height EQU $12
Route5Width  EQU $0a

; Route6_h map_id=17
Route6Height EQU $12
Route6Width  EQU $0a

; Route7_h map_id=18
Route7Height EQU $09
Route7Width  EQU $0a

; Route8_h map_id=19
Route8Height EQU $09
Route8Width  EQU $1e

; Route9_h map_id=20
Route9Height EQU $09
Route9Width  EQU $1e

; Route10_h map_id=21
Route10Height EQU $24
Route10Width  EQU $0a

; Route11_h map_id=22
Route11Height EQU $09
Route11Width  EQU $1e

; Route12_h map_id=23
Route12Height EQU $36
Route12Width  EQU $0a

; Route13_h map_id=24
Route13Height EQU $09
Route13Width  EQU $1e

; Route14_h map_id=25
Route14Height EQU $1b
Route14Width  EQU $0a

; Route15_h map_id=26
Route15Height EQU $09
Route15Width  EQU $1e

; Route16_h map_id=27
Route16Height EQU $09
Route16Width  EQU $14

; Route17_h map_id=28
Route17Height EQU $48
Route17Width  EQU $0a

; Route18_h map_id=29
Route18Height EQU $09
Route18Width  EQU $19

; Route19_h map_id=30
Route19Height EQU $1b
Route19Width  EQU $0a

; Route20_h map_id=31
Route20Height EQU $09
Route20Width  EQU $32

; Route21_h map_id=32
Route21Height EQU $2d
Route21Width  EQU $0a

; Route22_h map_id=33
Route22Height EQU $09
Route22Width  EQU $14

; Route23_h map_id=34
Route23Height EQU $48
Route23Width  EQU $0a

; Route24_h map_id=35
Route24Height EQU $12
Route24Width  EQU $0a

; Route25_h map_id=36
Route25Height EQU $09
Route25Width  EQU $1e

; RedsHouse1F_h map_id=37
RedsHouse1FHeight EQU $04
RedsHouse1FWidth  EQU $04

; RedsHouse2F_h map_id=38
RedsHouse2FHeight EQU $04
RedsHouse2FWidth  EQU $04

; BluesHouse_h map_id=39
BluesHouseHeight EQU $04
BluesHouseWidth  EQU $04

; OaksLab_h map_id=40
OaksLabHeight EQU $06
OaksLabWidth  EQU $05

; ViridianPokeCenter_h map_id=41
ViridianPokeCenterHeight EQU $04
ViridianPokeCenterWidth  EQU $07

; ViridianMart_h map_id=42
ViridianMartHeight EQU $04
ViridianMartWidth  EQU $04

; School_h map_id=43
SchoolHeight EQU $04
SchoolWidth  EQU $04

; ViridianHouse_h map_id=44
ViridianHouseHeight EQU $04
ViridianHouseWidth  EQU $04

; ViridianGym_h map_id=45
ViridianGymHeight EQU $09
ViridianGymWidth  EQU $0a

; DiglettsCaveRoute2_h map_id=46
DiglettsCaveRoute2Height EQU $04
DiglettsCaveRoute2Width  EQU $04

; ViridianForestexit_h map_id=47
ViridianForestexitHeight EQU $04
ViridianForestexitWidth  EQU $05

; Route2House_h map_id=48
Route2HouseHeight EQU $04
Route2HouseWidth  EQU $04

; Route2Gate_h map_id=49
Route2GateHeight EQU $04
Route2GateWidth  EQU $05

; ViridianForestEntrance_h map_id=50
ViridianForestEntranceHeight EQU $04
ViridianForestEntranceWidth  EQU $05

; ViridianForest_h map_id=51
ViridianForestHeight EQU $18
ViridianForestWidth  EQU $11

; MuseumF1_h map_id=52
MuseumF1Height EQU $04
MuseumF1Width  EQU $0a

; MuseumF2_h map_id=53
MuseumF2Height EQU $04
MuseumF2Width  EQU $07

; PewterGym_h map_id=54
PewterGymHeight EQU $07
PewterGymWidth  EQU $05

; PewterHouse1_h map_id=55
PewterHouse1Height EQU $04
PewterHouse1Width  EQU $04

; PewterMart_h map_id=56
PewterMartHeight EQU $04
PewterMartWidth  EQU $04

; PewterHouse2_h map_id=57
PewterHouse2Height EQU $04
PewterHouse2Width  EQU $04

; PewterPokecenter_h map_id=58
PewterPokecenterHeight EQU $04
PewterPokecenterWidth  EQU $07

; MtMoon1_h map_id=59
MtMoon1Height EQU $12
MtMoon1Width  EQU $14

; MtMoon2_h map_id=60
MtMoon2Height EQU $0e
MtMoon2Width  EQU $0e

; MtMoon3_h map_id=61
MtMoon3Height EQU $12
MtMoon3Width  EQU $14

; CeruleanHouseTrashed_h map_id=62
CeruleanHouseTrashedHeight EQU $04
CeruleanHouseTrashedWidth  EQU $04

; CeruleanHouse2_h map_id=63
CeruleanHouse2Height EQU $04
CeruleanHouse2Width  EQU $04

; CeruleanPokecenter_h map_id=64
CeruleanPokecenterHeight EQU $04
CeruleanPokecenterWidth  EQU $07

; CeruleanGym_h map_id=65
CeruleanGymHeight EQU $07
CeruleanGymWidth  EQU $05

; BikeShop_h map_id=66
BikeShopHeight EQU $04
BikeShopWidth  EQU $04

; CeruleanMart_h map_id=67
CeruleanMartHeight EQU $04
CeruleanMartWidth  EQU $04

; MtMoonPokecenter_h map_id=68
MtMoonPokecenterHeight EQU $04
MtMoonPokecenterWidth  EQU $07

; Route5Gate_h map_id=70
Route5GateHeight EQU $03
Route5GateWidth  EQU $04

; UndergroundTunnelEntranceRoute5_h map_id=71
UndergroundTunnelEntranceRoute5Height EQU $04
UndergroundTunnelEntranceRoute5Width  EQU $04

; DayCareM_h map_id=72
DayCareMHeight EQU $04
DayCareMWidth  EQU $04

; Route6Gate_h map_id=73
Route6GateHeight EQU $03
Route6GateWidth  EQU $04

; UndergroundTunnelEntranceRoute6_h map_id=74
UndergroundTunnelEntranceRoute6Height EQU $04
UndergroundTunnelEntranceRoute6Width  EQU $04

; Route7Gate_h map_id=76
Route7GateHeight EQU $04
Route7GateWidth  EQU $03

; UndergroundPathEntranceRoute7_h map_id=77
UndergroundPathEntranceRoute7Height EQU $04
UndergroundPathEntranceRoute7Width  EQU $04

; Route8Gate_h map_id=79
Route8GateHeight EQU $04
Route8GateWidth  EQU $03

; UndergroundPathEntranceRoute8_h map_id=80
UndergroundPathEntranceRoute8Height EQU $04
UndergroundPathEntranceRoute8Width  EQU $04

; RockTunnelPokecenter_h map_id=81
RockTunnelPokecenterHeight EQU $04
RockTunnelPokecenterWidth  EQU $07

; RockTunnel1_h map_id=82
RockTunnel1Height EQU $12
RockTunnel1Width  EQU $14

; PowerPlant_h map_id=83
PowerPlantHeight EQU $12
PowerPlantWidth  EQU $14

; Route11Gate_h map_id=84
Route11GateHeight EQU $05
Route11GateWidth  EQU $04

; DiglettsCaveEntranceRoute11_h map_id=85
DiglettsCaveEntranceRoute11Height EQU $04
DiglettsCaveEntranceRoute11Width  EQU $04

; Route11GateUpstairs_h map_id=86
Route11GateUpstairsHeight EQU $04
Route11GateUpstairsWidth  EQU $04

; Route12Gate_h map_id=87
Route12GateHeight EQU $04
Route12GateWidth  EQU $05

; BillsHouse_h map_id=88
BillsHouseHeight EQU $04
BillsHouseWidth  EQU $04

; VermilionPokecenter_h map_id=89
VermilionPokecenterHeight EQU $04
VermilionPokecenterWidth  EQU $07

; FanClub_h map_id=90
FanClubHeight EQU $04
FanClubWidth  EQU $04

; VermilionMart_h map_id=91
VermilionMartHeight EQU $04
VermilionMartWidth  EQU $04

; VermilionGym_h map_id=92
VermilionGymHeight EQU $09
VermilionGymWidth  EQU $05

; VermilionHouse1_h map_id=93
VermilionHouse1Height EQU $04
VermilionHouse1Width  EQU $04

; VermilionDock_h map_id=94
VermilionDockHeight EQU $06
VermilionDockWidth  EQU $0e

; SSAnne1_h map_id=95
SSAnne1Height EQU $09
SSAnne1Width  EQU $14

; SSAnne2_h map_id=96
SSAnne2Height EQU $09
SSAnne2Width  EQU $14

; SSAnne3_h map_id=97
SSAnne3Height EQU $03
SSAnne3Width  EQU $0a

; SSAnne4_h map_id=98
SSAnne4Height EQU $04
SSAnne4Width  EQU $0f

; SSAnne5_h map_id=99
SSAnne5Height EQU $07
SSAnne5Width  EQU $0a

; SSAnne6_h map_id=100
SSAnne6Height EQU $08
SSAnne6Width  EQU $07

; SSAnne7_h map_id=101
SSAnne7Height EQU $04
SSAnne7Width  EQU $03

; SSAnne8_h map_id=102
SSAnne8Height EQU $08
SSAnne8Width  EQU $0c

; SSAnne9_h map_id=103
SSAnne9Height EQU $08
SSAnne9Width  EQU $0c

; SSAnne10_h map_id=104
SSAnne10Height EQU $08
SSAnne10Width  EQU $0c

; VictoryRoad1_h map_id=108
VictoryRoad1Height EQU $09
VictoryRoad1Width  EQU $0a

; Lance_h map_id=113
LanceHeight EQU $0d
LanceWidth  EQU $0d

; HallofFameRoom_h map_id=118
HallofFameRoomHeight EQU $04
HallofFameRoomWidth  EQU $05

; UndergroundPathNS_h map_id=119
UndergroundPathNSHeight EQU $18
UndergroundPathNSWidth  EQU $04

; Gary_h map_id=120
GaryHeight EQU $04
GaryWidth  EQU $04

; UndergroundPathWE_h map_id=121
UndergroundPathWEHeight EQU $04
UndergroundPathWEWidth  EQU $19

; CeladonMart1_h map_id=122
CeladonMart1Height EQU $04
CeladonMart1Width  EQU $0a

; CeladonMart2_h map_id=123
CeladonMart2Height EQU $04
CeladonMart2Width  EQU $0a

; CeladonMart3_h map_id=124
CeladonMart3Height EQU $04
CeladonMart3Width  EQU $0a

; CeladonMart4_h map_id=125
CeladonMart4Height EQU $04
CeladonMart4Width  EQU $0a

; CeladonMartRoof_h map_id=126
CeladonMartRoofHeight EQU $04
CeladonMartRoofWidth  EQU $0a

; CeladonMartElevator_h map_id=127
CeladonMartElevatorHeight EQU $02
CeladonMartElevatorWidth  EQU $02

; CeladonMansion1_h map_id=128
CeladonMansion1Height EQU $06
CeladonMansion1Width  EQU $04

; CeladonMansion2_h map_id=129
CeladonMansion2Height EQU $06
CeladonMansion2Width  EQU $04

; CeladonMansion3_h map_id=130
CeladonMansion3Height EQU $06
CeladonMansion3Width  EQU $04

; CeladonMansion4_h map_id=131
CeladonMansion4Height EQU $06
CeladonMansion4Width  EQU $04

; CeladonMansion5_h map_id=132
CeladonMansion5Height EQU $04
CeladonMansion5Width  EQU $04

; CeladonPokecenter_h map_id=133
CeladonPokecenterHeight EQU $04
CeladonPokecenterWidth  EQU $07

; CeladonGym_h map_id=134
CeladonGymHeight EQU $09
CeladonGymWidth  EQU $05

; CeladonGameCorner_h map_id=135
CeladonGameCornerHeight EQU $09
CeladonGameCornerWidth  EQU $0a

; CeladonMart5_h map_id=136
CeladonMart5Height EQU $04
CeladonMart5Width  EQU $0a

; CeladonPrizeRoom_h map_id=137
CeladonPrizeRoomHeight EQU $04
CeladonPrizeRoomWidth  EQU $05

; CeladonDiner_h map_id=138
CeladonDinerHeight EQU $04
CeladonDinerWidth  EQU $05

; CeladonHouse_h map_id=139
CeladonHouseHeight EQU $04
CeladonHouseWidth  EQU $04

; CeladonHotel_h map_id=140
CeladonHotelHeight EQU $04
CeladonHotelWidth  EQU $07

; LavenderPokecenter_h map_id=141
LavenderPokecenterHeight EQU $04
LavenderPokecenterWidth  EQU $07

; PokemonTower1_h map_id=142
PokemonTower1Height EQU $09
PokemonTower1Width  EQU $0a

; PokemonTower2_h map_id=143
PokemonTower2Height EQU $09
PokemonTower2Width  EQU $0a

; PokemonTower3_h map_id=144
PokemonTower3Height EQU $09
PokemonTower3Width  EQU $0a

; PokemonTower4_h map_id=145
PokemonTower4Height EQU $09
PokemonTower4Width  EQU $0a

; PokemonTower5_h map_id=146
PokemonTower5Height EQU $09
PokemonTower5Width  EQU $0a

; PokemonTower6_h map_id=147
PokemonTower6Height EQU $09
PokemonTower6Width  EQU $0a

; PokemonTower7_h map_id=148
PokemonTower7Height EQU $09
PokemonTower7Width  EQU $0a

; LavenderHouse1_h map_id=149
LavenderHouse1Height EQU $04
LavenderHouse1Width  EQU $04

; LavenderMart_h map_id=150
LavenderMartHeight EQU $04
LavenderMartWidth  EQU $04

; LavenderHouse2_h map_id=151
LavenderHouse2Height EQU $04
LavenderHouse2Width  EQU $04

; FuchsiaMart_h map_id=152
FuchsiaMartHeight EQU $04
FuchsiaMartWidth  EQU $04

; FuchsiaHouse1_h map_id=153
FuchsiaHouse1Height EQU $04
FuchsiaHouse1Width  EQU $04

; FuchsiaPokecenter_h map_id=154
FuchsiaPokecenterHeight EQU $04
FuchsiaPokecenterWidth  EQU $07

; FuchsiaHouse2_h map_id=155
FuchsiaHouse2Height EQU $04
FuchsiaHouse2Width  EQU $05

; SafariZoneEntrance_h map_id=156
SafariZoneEntranceHeight EQU $03
SafariZoneEntranceWidth  EQU $04

; FuchsiaGym_h map_id=157
FuchsiaGymHeight EQU $09
FuchsiaGymWidth  EQU $05

; FuchsiaMeetingRoom_h map_id=158
FuchsiaMeetingRoomHeight EQU $04
FuchsiaMeetingRoomWidth  EQU $07

; SeafoamIslands2_h map_id=159
SeafoamIslands2Height EQU $09
SeafoamIslands2Width  EQU $0f

; SeafoamIslands3_h map_id=160
SeafoamIslands3Height EQU $09
SeafoamIslands3Width  EQU $0f

; SeafoamIslands4_h map_id=161
SeafoamIslands4Height EQU $09
SeafoamIslands4Width  EQU $0f

; SeafoamIslands5_h map_id=162
SeafoamIslands5Height EQU $09
SeafoamIslands5Width  EQU $0f

; VermilionHouse2_h map_id=163
VermilionHouse2Height EQU $04
VermilionHouse2Width  EQU $04

; FuchsiaHouse3_h map_id=164
FuchsiaHouse3Height EQU $04
FuchsiaHouse3Width  EQU $04

; Mansion1_h map_id=165
Mansion1Height EQU $0e
Mansion1Width  EQU $0f

; CinnabarGym_h map_id=166
CinnabarGymHeight EQU $09
CinnabarGymWidth  EQU $0a

; Lab1_h map_id=167
Lab1Height EQU $04
Lab1Width  EQU $09

; Lab2_h map_id=168
Lab2Height EQU $04
Lab2Width  EQU $04

; Lab3_h map_id=169
Lab3Height EQU $04
Lab3Width  EQU $04

; Lab4_h map_id=170
Lab4Height EQU $04
Lab4Width  EQU $04

; CinnabarPokecenter_h map_id=171
CinnabarPokecenterHeight EQU $04
CinnabarPokecenterWidth  EQU $07

; CinnabarMart_h map_id=172
CinnabarMartHeight EQU $04
CinnabarMartWidth  EQU $04

; IndigoPlateauLobby_h map_id=174
IndigoPlateauLobbyHeight EQU $06
IndigoPlateauLobbyWidth  EQU $08

; CopycatsHouseF1_h map_id=175
CopycatsHouseF1Height EQU $04
CopycatsHouseF1Width  EQU $04

; CopycatsHouseF2_h map_id=176
CopycatsHouseF2Height EQU $04
CopycatsHouseF2Width  EQU $04

; FightingDojo_h map_id=177
FightingDojoHeight EQU $06
FightingDojoWidth  EQU $05

; SaffronGym_h map_id=178
SaffronGymHeight EQU $09
SaffronGymWidth  EQU $0a

; SaffronHouse1_h map_id=179
SaffronHouse1Height EQU $04
SaffronHouse1Width  EQU $04

; SaffronMart_h map_id=180
SaffronMartHeight EQU $04
SaffronMartWidth  EQU $04

; SilphCo1_h map_id=181
SilphCo1Height EQU $09
SilphCo1Width  EQU $0f

; SaffronPokecenter_h map_id=182
SaffronPokecenterHeight EQU $04
SaffronPokecenterWidth  EQU $07

; SaffronHouse2_h map_id=183
SaffronHouse2Height EQU $04
SaffronHouse2Width  EQU $04

; Route15Gate_h map_id=184
Route15GateHeight EQU $05
Route15GateWidth  EQU $04

; Route16GateMap_h map_id=186
Route16GateMapHeight EQU $07
Route16GateMapWidth  EQU $04

; Route16GateUpstairs_h map_id=187
Route16GateUpstairsHeight EQU $04
Route16GateUpstairsWidth  EQU $04

; Route16House_h map_id=188
Route16HouseHeight EQU $04
Route16HouseWidth  EQU $04

; Route12House_h map_id=189
Route12HouseHeight EQU $04
Route12HouseWidth  EQU $04

; Route18Gate_h map_id=190
Route18GateHeight EQU $05
Route18GateWidth  EQU $04

; Route18GateHeader_h map_id=191
Route18GateHeaderHeight EQU $04
Route18GateHeaderWidth  EQU $04

; SeafoamIslands1_h map_id=192
SeafoamIslands1Height EQU $09
SeafoamIslands1Width  EQU $0f

; Route22Gate_h map_id=193
Route22GateHeight EQU $04
Route22GateWidth  EQU $05

; VictoryRoad2_h map_id=194
VictoryRoad2Height EQU $09
VictoryRoad2Width  EQU $0f

; Route12GateUpstairs_h map_id=195
Route12GateUpstairsHeight EQU $04
Route12GateUpstairsWidth  EQU $04

; VermilionHouse3_h map_id=196
VermilionHouse3Height EQU $04
VermilionHouse3Width  EQU $04

; DiglettsCave_h map_id=197
DiglettsCaveHeight EQU $12
DiglettsCaveWidth  EQU $14

; VictoryRoad3_h map_id=198
VictoryRoad3Height EQU $09
VictoryRoad3Width  EQU $0f

; RocketHideout1_h map_id=199
RocketHideout1Height EQU $0e
RocketHideout1Width  EQU $0f

; RocketHideout2_h map_id=200
RocketHideout2Height EQU $0e
RocketHideout2Width  EQU $0f

; RocketHideout3_h map_id=201
RocketHideout3Height EQU $0e
RocketHideout3Width  EQU $0f

; RocketHideout4_h map_id=202
RocketHideout4Height EQU $0c
RocketHideout4Width  EQU $0f

; RocketHideoutElevator_h map_id=203
RocketHideoutElevatorHeight EQU $04
RocketHideoutElevatorWidth  EQU $03

; SilphCo2_h map_id=207
SilphCo2Height EQU $09
SilphCo2Width  EQU $0f

; SilphCo3_h map_id=208
SilphCo3Height EQU $09
SilphCo3Width  EQU $0f

; SilphCo4_h map_id=209
SilphCo4Height EQU $09
SilphCo4Width  EQU $0f

; SilphCo5_h map_id=210
SilphCo5Height EQU $09
SilphCo5Width  EQU $0f

; SilphCo6_h map_id=211
SilphCo6Height EQU $09
SilphCo6Width  EQU $0d

; SilphCo7_h map_id=212
SilphCo7Height EQU $09
SilphCo7Width  EQU $0d

; SilphCo8_h map_id=213
SilphCo8Height EQU $09
SilphCo8Width  EQU $0d

; Mansion2_h map_id=214
Mansion2Height EQU $0e
Mansion2Width  EQU $0f

; Mansion3_h map_id=215
Mansion3Height EQU $09
Mansion3Width  EQU $0f

; Mansion4_h map_id=216
Mansion4Height EQU $0e
Mansion4Width  EQU $0f

; SafariZoneEast_h map_id=217
SafariZoneEastHeight EQU $0d
SafariZoneEastWidth  EQU $0f

; SafariZoneNorth_h map_id=218
SafariZoneNorthHeight EQU $12
SafariZoneNorthWidth  EQU $14

; SafariZoneWest_h map_id=219
SafariZoneWestHeight EQU $0d
SafariZoneWestWidth  EQU $0f

; SafariZoneCenter_h map_id=220
SafariZoneCenterHeight EQU $0d
SafariZoneCenterWidth  EQU $0f

; SafariZoneRestHouse1_h map_id=221
SafariZoneRestHouse1Height EQU $04
SafariZoneRestHouse1Width  EQU $04

; SafariZoneSecretHouse_h map_id=222
SafariZoneSecretHouseHeight EQU $04
SafariZoneSecretHouseWidth  EQU $04

; SafariZoneRestHouse2_h map_id=223
SafariZoneRestHouse2Height EQU $04
SafariZoneRestHouse2Width  EQU $04

; SafariZoneRestHouse3_h map_id=224
SafariZoneRestHouse3Height EQU $04
SafariZoneRestHouse3Width  EQU $04

; SafariZoneRestHouse4_h map_id=225
SafariZoneRestHouse4Height EQU $04
SafariZoneRestHouse4Width  EQU $04

; UnknownDungeon2_h map_id=226
UnknownDungeon2Height EQU $09
UnknownDungeon2Width  EQU $0f

; UnknownDungeon3_h map_id=227
UnknownDungeon3Height EQU $09
UnknownDungeon3Width  EQU $0f

; UnknownDungeon1_h map_id=228
UnknownDungeon1Height EQU $09
UnknownDungeon1Width  EQU $0f

; NameRater_h map_id=229
NameRaterHeight EQU $04
NameRaterWidth  EQU $04

; CeruleanHouse3_h map_id=230
CeruleanHouse3Height EQU $04
CeruleanHouse3Width  EQU $04

; RockTunnel2_h map_id=232
RockTunnel2Height EQU $12
RockTunnel2Width  EQU $14

; SilphCo9_h map_id=233
SilphCo9Height EQU $09
SilphCo9Width  EQU $0d

; SilphCo10_h map_id=234
SilphCo10Height EQU $09
SilphCo10Width  EQU $08

; SilphCo11_h map_id=235
SilphCo11Height EQU $09
SilphCo11Width  EQU $09

; SilphCoElevator_h map_id=236
SilphCoElevatorHeight EQU $02
SilphCoElevatorWidth  EQU $02

; BattleCenterM_h map_id=239
BattleCenterMHeight EQU $04
BattleCenterMWidth  EQU $05

; TradeCenterM_h map_id=240
TradeCenterMHeight EQU $04
TradeCenterMWidth  EQU $05

; Lorelei_h map_id=245
LoreleiHeight EQU $06
LoreleiWidth  EQU $05

; Bruno_h map_id=246
BrunoHeight EQU $06
BrunoWidth  EQU $05

; Agatha_h map_id=247
AgathaHeight EQU $06
AgathaWidth  EQU $05

;Tilesets
TileSet_Outside equ $0
TileSet_YourHouse1 equ $1
TileSet_PkmnCtr1 equ $2
TileSet_VirForest equ $3
TileSet_YourHouse2 equ $4
TileSet_Gym1 equ $5
TileSet_PkmnCtr2 equ $6
TileSet_Gym2 equ $7
TileSet_House equ $8
TileSet_Museum1 equ $9
TileSet_Museum2 equ $A
TileSet_UndPath equ $B
TileSet_Museum3 equ $C
TileSet_SSAnne equ $D
TileSet_VermPort equ $E
TileSet_PokeCem equ $F
TileSet_Silph equ $10
TileSet_Cave equ $11
TileSet_CeldMart equ $12
TileSet_GmFrkHQ equ $13
TileSet_Lab equ $14
TileSet_BikeShp equ $15
TileSet_Mansion equ $16
TileSet_IndigoPlt equ $17