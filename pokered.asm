; wram locations
W_CUROPPONENT EQU $D059 ; in a wild battle, this is the species of pokemon
			; in a trainer battle, this is the trainer class

W_LONEATTACKNO EQU $D05C ; which entry in LoneAttacks to use
W_TRAINERNO    EQU $D05D ; which instance of [youngster, lass, etc] is this?

W_CURENEMYLVL EQU $D127

W_ISLINKBATTLE EQU $D12B

W_CURMAP EQU $D35E

W_RIVALSTARTER EQU $D715

W_GRASSRATE EQU $D887
W_GRASSMONS EQU $D888
W_WATERRATE EQU $D8A4
W_WATERMONS EQU $D8A5

W_ENEMYMONCOUNT  EQU $D89C

W_ENEMYMON1MOVE3 EQU $D8AE

W_ENEMYMON2MOVE3 EQU $D8DA

W_ENEMYMON3MOVE3 EQU $D906

W_ENEMYMON4MOVE3 EQU $D932

W_ENEMYMON5MOVE3 EQU $D95E

W_ENEMYMON6MOVE3 EQU $D98A


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
MR__MIME   EQU $2A
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
PSYCHIC_T     EQU $13
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


; move name constants
POUND       EQU $01
KARATE_CHOP EQU $02
DOUBLESLAP  EQU $03
COMET_PUNCH EQU $04
MEGA_PUNCH  EQU $05
PAY_DAY     EQU $06
FIRE_PUNCH  EQU $07
ICE_PUNCH   EQU $08
THUNDERPUNCH EQU $09
SCRATCH      EQU $0A
VICEGRIP     EQU $0B
GUILLOTINE   EQU $0C
RAZOR_WIND   EQU $0D
SWORDS_DANCE EQU $0E
CUT          EQU $0F
GUST         EQU $10
WING_ATTACH  EQU $11
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
SAND_ATTACH  EQU $1C
HEADBUTT     EQU $1D
HORN_ATTACH  EQU $1E
FURY_ATTACH  EQU $1F
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



SECTION "bank0",HOME[0]
INCBIN "baserom.gbc",$0,$9D

FarCopyData: ; 009D
; copy bc bytes of data from a:hl to de
	ld [$CEE9],a ; save future bank # for later
	ld a,[$FFB8] ; get current bank #
	push af
	ld a,[$CEE9] ; get future bank #, switch
	ld [$FFB8],a
	ld [$2000],a
	call CopyData
	pop af       ; okay, done, time to switch back
	ld [$FFB8],a
	ld [$2000],a
	ret
CopyData: ; 00B5
; copy bc bytes of data from hl to de
	ld a,[hli]
	ld [de],a
	inc de
	dec bc
	ld a,c
	or b
	jr nz,CopyData
	ret


SECTION "romheader",HOME[$100]
nop
jp Start

Section "start",HOME[$150]
Start:
INCBIN "baserom.gbc",$150,$1AE - $150
; see also MapHeaderBanks
MapHeaderPointers: ; $01AE
	dw $42a1
	dw $4357
	dw $4554
	dw $474e
	dw $4000
	dw $4998
	dw $4000
	dw $4ba7
	dw $4000
	dw $491e
	dw $49a4
	dw $49a4
	dw $40c3
	dw $4000
	dw $41e6
	dw $4390
	dw $4581
	dw $4000
	dw $4000
	dw $412d
	dw $4686
	dw $42d4
	dw $44be
	dw $466d
	dw $480c
	dw $4999
	dw $492c
	dw $4ada
	dw $4b20
	dw $4c38
	dw $4e78
	dw $40f1
	dw $4fff
	dw $4000
	dw $433f
	dw $4682
	dw $479b
	dw $415c
	dw $40a4
	dw $5b2f
	dw $4b02
	dw $4251
	dw $5462
	dw $5540
	dw $557d
	dw $4897
	dw $5ea4
	dw $557b
	dw $5ee1
	dw $55c8
	dw $5650
	dw $5101
	dw $40eb
	dw $430b
	dw $437b
	dw $55e7
	dw $4ca1
	dw $563c
	dw $457b
	dw $59bc
	dw $5a36
	dw $5cff
	dw $5679
	dw $56ea
	dw $4639
	dw $46a7
	dw $5730
	dw $4889
	dw $52c3
	dw $5679
	dw $5f27
	dw $569d
	dw $6243
	dw $6031
	dw $56e3
	dw $56e3
	dw $60f4
	dw $5720
	dw $575d
	dw $61bb
	dw $627d
	dw $53ae
	dw $44d0
	dw $62ba
	dw $5400
	dw $65ae
	dw $5448
	dw $54f8
	dw $675e
	dw $4983
	dw $5b64
	dw $49d5
	dw $4a1a
	dw $5af0
	dw $5b46
	dw $5259
	dw $5393
	dw $4926
	dw $5622
	dw $56a2
	dw $57a7
	dw $5889
	dw $596a
	dw $5b3f
	dw $5d49
	dw $62a2
	dw $62a2
	dw $62a2
	dw $59fe
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $62a2
	dw $6492
	dw $5f1a
	dw $5f11
	dw $5f3e
	dw $4f7a
	dw $60e9
	dw $4219
	dw $434a
	dw $43c9
	dw $45f4
	dw $4688
	dw $472e
	dw $4784
	dw $485f
	dw $5d2e
	dw $48ac
	dw $48fe
	dw $4bb1
	dw $505d
	dw $50e4
	dw $5145
	dw $5202
	dw $525d
	dw $48ce
	dw $4420
	dw $44e6
	dw $46c0
	dw $47ea
	dw $4926
	dw $4ae3
	dw $4cf9
	dw $589c
	dw $4920
	dw $59a2
	dw $5d7c
	dw $500c
	dw $5057
	dw $50a9
	dw $51c1
	dw $5431
	dw $56d7
	dw $6309
	dw $6445
	dw $6581
	dw $678d
	dw $6064
	dw $6170
	dw $42a3
	dw $573e
	dw $5b80
	dw $5c15
	dw $5c7b
	dw $5d25
	dw $5e20
	dw $5e72
	dw $5e72
	dw $5c4f
	dw $5eb7
	dw $4c65
	dw $4d51
	dw $5001
	dw $5dd1
	dw $53fd
	dw $5442
	dw $5529
	dw $5e30
	dw $55f6
	dw $563e
	dw $56b2
	dw $57ff
	dw $65ec
	dw $6473
	dw $586a
	dw $5969
	dw $47dd
	dw $6677
	dw $5791
	dw $5554
	dw $5c06
	dw $5f62
	dw $4974
	dw $4bbe
	dw $4e1b
	dw $5219
	dw $5451
	dw $5704
	dw $5704
	dw $5704
	dw $5704
	dw $5ce5
	dw $5f4f
	dw $5cff
	dw $5f2b
	dw $619d
	dw $5b55
	dw $64f8
	dw $5fcc
	dw $61e2
	dw $63ad
	dw $585f
	dw $599f
	dw $61a9
	dw $5ba6
	dw $5ce1
	dw $630b
	dw $5d1e
	dw $5d69
	dw $5db4
	dw $5dff
	dw $5ee4
	dw $4d00
	dw $5a06
	dw $4dfd
	dw $56b2
	dw $5fdf
	dw $57af
	dw $612d
	dw $60ee
	dw $57b4
	dw $5ce5
	dw $5ce5
	dw $7d04
	dw $7d71
	dw $5CE5
	dw $5CE5
	dw $5CE5
	dw $5CE5
	dw $616F
	dw $62CA
	dw $6421

incbin "baserom.gbc",$39E,$1627 - $39E


;XXX what does this do
;XXX what points to this
; offset 1627
	ld bc,$D0B8
	add hl,bc
	ld a,[hli]
	ld [$D0AB],a
	ld a,[hl]
	ld [$D0AC],a

; offset 1633
; define (by index number) the bank that a pokemon's image is in
; index == Mew, bank 1
; index == Kabutops fossil, bank $B
;        index < $1F, bank 9
; $1F <= index < $4A, bank $A
; $4A <= index < $74, bank $B
; $74 <= index < $99, bank $C
; $99 <= index,       bank $D
	ld a,[$CF91] ; XXX name for this ram location
	ld b,a
	cp $15
	ld a,$01
	jr z,.GotBank\@
	ld a,b
	cp $B6
	ld a,$0B
	jr z,.GotBank\@
	ld a,b
	cp $1F
	ld a,$09
	jr c,.GotBank\@
	ld a,b
	cp $4A
	ld a,$0A
	jr c,.GotBank\@
	ld a,b
	cp $74
	ld a,$0B
	jr c,.GotBank\@
	ld a,b
	cp $99
	ld a,$0C
	jr c,.GotBank\@
	ld a,$0D
.GotBank\@
	jp $24FD

INCBIN "baserom.gbc",$1665,$3A87 - $1665

AddNTimes: ; 3A87
; add bc to hl a times
	and a
	ret z
.loop\@
	add hl,bc
	dec a
	jr nz,.loop\@
	ret

INCBIN "baserom.gbc",$3A8E,$4000 - $3A8E

SECTION "bank1",DATA,BANK[$1]
INCBIN "baserom.gbc",$4000,$4000

SECTION "bank2",DATA,BANK[$2]
INCBIN "baserom.gbc",$8000,$4000

SECTION "bank3",DATA,BANK[$3]
INCBIN "baserom.gbc",$C000,$C23D - $C000

; see also MapHeaderPointers
MapHeaderBanks: ; 423D
	db $06
	db $06
	db $06
	db $06
	db $11
	db $06
	db $06
	db $06
	db $07
	db $14
	db $14
	db $01
	db $07
	db $15
	db $15
	db $15
	db $15
	db $16
	db $12
	db $16
	db $15
	db $16
	db $16
	db $16
	db $15
	db $15
	db $16
	db $16
	db $15
	db $16
	db $15
	db $14
	db $15
	db $14
	db $14
	db $14
	db $14
	db $12
	db $17
	db $06
	db $07
	db $11
	db $07
	db $07
	db $07
	db $1D
	db $07
	db $17
	db $07
	db $17
	db $17
	db $18
	db $17
	db $17
	db $17
	db $07
	db $1D
	db $07
	db $17
	db $12
	db $14
	db $12
	db $07
	db $07
	db $17
	db $17
	db $07
	db $17
	db $12
	db $07
	db $07
	db $17
	db $15
	db $07
	db $17
	db $17
	db $07
	db $17
	db $17
	db $07
	db $07
	db $12
	db $11
	db $07
	db $12
	db $07
	db $12
	db $12
	db $07
	db $17
	db $16
	db $17
	db $17
	db $07
	db $07
	db $18
	db $18
	db $11
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $1D
	db $1D
	db $1D
	db $17
	db $1D
	db $1D
	db $1D
	db $1D
	db $16
	db $1D
	db $1D
	db $1D
	db $1D
	db $16
	db $18
	db $1D
	db $18
	db $18
	db $15
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $07
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $12
	db $17
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $07
	db $17
	db $07
	db $07
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $11
	db $11
	db $11
	db $11
	db $15
	db $15
	db $11
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $1D
	db $06
	db $1D
	db $17
	db $17
	db $17
	db $07
	db $17
	db $17
	db $17
	db $07
	db $12
	db $12
	db $12
	db $12
	db $07
	db $15
	db $12
	db $12
	db $11
	db $07
	db $14
	db $12
	db $06
	db $18
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $01
	db $01
	db $01
	db $16
	db $16
	db $06
	db $06
	db $06
	db $14
	db $15
	db $14
	db $14
	db $14
	db $11
	db $11
	db $12
	db $11
	db $11
	db $12
	db $11
	db $11
	db $11
	db $11
	db $11
	db $1D
	db $07
	db $1D
	db $01
	db $11
	db $17
	db $16
	db $18
	db $11
	db $11
	db $11
	db $13
	db $13
	db $11
	db $11
	db $11
	db $11
	db $1D
	db $1D
	db $1D

INCBIN "baserom.gbc",$C335,$CEB8 - $C335

; wild pokemon data: from 4EB8 to 55C7

LoadWildData: ; 4EB8
        ld hl,WildDataPointers
        ld a,[W_CURMAP]

	; get wild data for current map
        ld c,a
        ld b,0
        add hl,bc
        add hl,bc
        ld a,[hli]
        ld h,[hl]
        ld l,a       ; hl now points to wild data for current map
        ld a,[hli]
        ld [W_GRASSRATE],a
        and a
        jr z,.NoGrassData\@ ; if no grass data, skip to surfing data
        push hl
        ld de,W_GRASSMONS ; otherwise, load grass data
        ld bc,$0014
        call CopyData
        pop hl
        ld bc,$0014
        add hl,bc
.NoGrassData\@
        ld a,[hli]
        ld [W_WATERRATE],a
        and a
        ret z        ; if no water data, we're done
        ld de,W_WATERMONS  ; otherwise, load surfing data
        ld bc,$0014
        jp CopyData

WildDataPointers: ; 4EEB
        dw NoMons ; PalletTown
        dw NoMons ; ViridianCity
        dw NoMons ; PewterCity
        dw NoMons ; CeruleanCity
        dw NoMons ; LavenderTown
        dw NoMons ; VermilionCity
        dw NoMons ; CeladonCity
        dw NoMons ; FuchsiaCity
        dw NoMons ; CinnibarIsland
        dw NoMons ; IndigoPlateau
        dw NoMons ; SaffronCity
        dw NoMons ; not a real map
        dw Route1Mons
        dw Route2Mons
        dw Route3Mons
        dw Route4Mons
        dw Route5Mons
        dw Route6Mons
        dw Route7Mons
        dw Route8Mons
        dw Route9Mons
        dw Route10Mons
        dw Route11Mons
        dw Route12Mons
        dw Route13Mons
        dw Route14Mons
        dw Route15Mons
        dw Route16Mons
        dw Route17Mons
        dw Route18Mons
        dw WaterMons ; Route19
        dw WaterMons ; Route20
        dw Route21Mons
        dw Route22Mons
        dw Route23Mons
        dw Route24Mons
        dw Route25Mons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw ForestMons ; ViridianForest
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw MoonMons1
        dw MoonMonsB1
        dw MoonMonsB2
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw TunnelMonsB1
        dw PowerPlantMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw PlateauMons1
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw TowerMons1
        dw TowerMons2
        dw TowerMons3
        dw TowerMons4
        dw TowerMons5
        dw TowerMons6
        dw TowerMons7
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw IslandMonsB1
        dw IslandMonsB2
        dw IslandMonsB3
        dw IslandMonsB4
        dw NoMons
        dw NoMons
        dw MansionMons1
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw IslandMons1
        dw NoMons
        dw PlateauMons2
        dw NoMons
        dw NoMons
        dw CaveMons
        dw PlateauMons3
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw MansionMons2
        dw MansionMons3
        dw MansionMonsB1
        dw ZoneMons1
        dw ZoneMons2
        dw ZoneMons3
        dw ZoneMonsCenter
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw DungeonMons2
        dw DungeonMonsB1
        dw DungeonMons1
        dw NoMons
        dw NoMons
        dw NoMons
        dw TunnelMonsB2
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw NoMons
        dw $FFFF

; wild pokemon data is divided into two parts.
; first part:  pokemon found in grass
; second part: pokemon found while surfing
; each part goes as follows:
	; if first byte == 00, then
		; no wild pokemon on this map
	; if first byte != 00, then
		; first byte is encounter rate
		; followed by 20 bytes:
		; level, species (ten times)

NoMons: ; no wild pokemon
	db 0
	db 0

Route1Mons:
	db $19
	db 3,PIDGEY
	db 3,RATTATA
	db 3,RATTATA
	db 2,RATTATA
	db 2,PIDGEY
	db 3,PIDGEY
	db 3,PIDGEY
	db 4,RATTATA
	db 4,PIDGEY
	db 5,PIDGEY

	db 0

Route2Mons:
	db $19
	db 3,RATTATA
	db 3,PIDGEY
	db 4,PIDGEY
	db 4,RATTATA
	db 5,PIDGEY
	db 3,WEEDLE
	db 2,RATTATA
	db 5,RATTATA
	db 4,WEEDLE
	db 5,WEEDLE

	db 0

Route22Mons:
	db $19
	db 3,RATTATA
	db 3,NIDORAN_M
	db 4,RATTATA
	db 4,NIDORAN_M
	db 2,RATTATA
	db 2,NIDORAN_M
	db 3,SPEAROW
	db 5,SPEAROW
	db 3,NIDORAN_F
	db 4,NIDORAN_F

	db 0

ForestMons:
	db $08
	db 4,WEEDLE
	db 5,KAKUNA
	db 3,WEEDLE
	db 5,WEEDLE
	db 4,KAKUNA
	db 6,KAKUNA
	db 4,METAPOD
	db 3,CATERPIE
	db 3,PIKACHU
	db 5,PIKACHU

	db 0

Route3Mons:
	db $14
	db 6,PIDGEY
	db 5,SPEAROW
	db 7,PIDGEY
	db 6,SPEAROW
	db 7,SPEAROW
	db 8,PIDGEY
	db 8,SPEAROW
	db 3,JIGGLYPUFF
	db 5,JIGGLYPUFF
	db 7,JIGGLYPUFF

	db 0

MoonMons1:
	db $0A
	db 8,ZUBAT
	db 7,ZUBAT
	db 9,ZUBAT
	db 8,GEODUDE
	db 6,ZUBAT
	db 10,ZUBAT
	db 10,GEODUDE
	db 8,PARAS
	db 11,ZUBAT
	db 8,CLEFAIRY

	db 0

MoonMonsB1:
	db $0A
	db 8,ZUBAT
	db 7,ZUBAT
	db 7,GEODUDE
	db 8,GEODUDE
	db 9,ZUBAT
	db 10,PARAS
	db 10,ZUBAT
	db 11,ZUBAT
	db 9,CLEFAIRY
	db 9,GEODUDE

	db 0

MoonMonsB2:
	db $0A
	db 9,ZUBAT
	db 9,GEODUDE
	db 10,ZUBAT
	db 10,GEODUDE
	db 11,ZUBAT
	db 10,PARAS
	db 12,PARAS
	db 10,CLEFAIRY
	db 12,ZUBAT
	db 12,CLEFAIRY

	db 0

Route4Mons:
	db $14
	db 10,RATTATA
	db 10,SPEAROW
	db 8,RATTATA
	db 6,EKANS
	db 8,SPEAROW
	db 10,EKANS
	db 12,RATTATA
	db 12,SPEAROW
	db 8,EKANS
	db 12,EKANS

	db 0

Route24Mons:
	db $19
	db 7,WEEDLE
	db 8,KAKUNA
	db 12,PIDGEY
	db 12,ODDISH
	db 13,ODDISH
	db 10,ABRA
	db 14,ODDISH
	db 13,PIDGEY
	db 8,ABRA
	db 12,ABRA

	db 0

Route25Mons:
	db $0F
	db 8,WEEDLE
	db 9,KAKUNA
	db 13,PIDGEY
	db 12,ODDISH
	db 13,ODDISH
	db 12,ABRA
	db 14,ODDISH
	db 10,ABRA
	db 7,METAPOD
	db 8,CATERPIE

	db 0

Route9Mons:
	db $0F
	db 16,RATTATA
	db 16,SPEAROW
	db 14,RATTATA
	db 11,EKANS
	db 13,SPEAROW
	db 15,EKANS
	db 17,RATTATA
	db 17,SPEAROW
	db 13,EKANS
	db 17,EKANS

	db 0

Route5Mons:
	db $0F
	db 13,ODDISH
	db 13,PIDGEY
	db 15,PIDGEY
	db 10,MANKEY
	db 12,MANKEY
	db 15,ODDISH
	db 16,ODDISH
	db 16,PIDGEY
	db 14,MANKEY
	db 16,MANKEY

	db 0

Route6Mons:
	db $0F
	db 13,ODDISH
	db 13,PIDGEY
	db 15,PIDGEY
	db 10,MANKEY
	db 12,MANKEY
	db 15,ODDISH
	db 16,ODDISH
	db 16,PIDGEY
	db 14,MANKEY
	db 16,MANKEY

	db 0

Route11Mons:
	db $0F
	db 14,EKANS
	db 15,SPEAROW
	db 12,EKANS
	db 9,DROWZEE
	db 13,SPEAROW
	db 13,DROWZEE
	db 15,EKANS
	db 17,SPEAROW
	db 11,DROWZEE
	db 15,DROWZEE

	db 0

TunnelMonsB1:
	db $0F
	db 16,ZUBAT
	db 17,ZUBAT
	db 17,GEODUDE
	db 15,MACHOP
	db 16,GEODUDE
	db 18,ZUBAT
	db 15,ZUBAT
	db 17,MACHOP
	db 13,ONIX
	db 15,ONIX

	db 0

TunnelMonsB2:
	db $0F
	db 16,ZUBAT
	db 17,ZUBAT
	db 17,GEODUDE
	db 15,MACHOP
	db 16,GEODUDE
	db 18,ZUBAT
	db 17,MACHOP
	db 17,ONIX
	db 13,ONIX
	db 18,GEODUDE

	db 0

Route10Mons:
	db $0F
	db 16,VOLTORB
	db 16,SPEAROW
	db 14,VOLTORB
	db 11,EKANS
	db 13,SPEAROW
	db 15,EKANS
	db 17,VOLTORB
	db 17,SPEAROW
	db 13,EKANS
	db 17,EKANS

	db 0

Route12Mons:
	db $0F
	db 24,ODDISH
	db 25,PIDGEY
	db 23,PIDGEY
	db 24,VENONAT
	db 22,ODDISH
	db 26,VENONAT
	db 26,ODDISH
	db 27,PIDGEY
	db 28,GLOOM
	db 30,GLOOM

	db 0

Route8Mons:
	db $0F
	db 18,PIDGEY
	db 18,MANKEY
	db 17,EKANS
	db 16,GROWLITHE
	db 20,PIDGEY
	db 20,MANKEY
	db 19,EKANS
	db 17,GROWLITHE
	db 15,GROWLITHE
	db 18,GROWLITHE

	db 0

Route7Mons:
	db $0F
	db 19,PIDGEY
	db 19,ODDISH
	db 17,MANKEY
	db 22,ODDISH
	db 22,PIDGEY
	db 18,MANKEY
	db 18,GROWLITHE
	db 20,GROWLITHE
	db 19,MANKEY
	db 20,MANKEY

	db 0

TowerMons1:
	db 0
	db 0

TowerMons2:
	db 0
	db 0

TowerMons3:
	db $0A
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 19,GASTLY
	db 18,GASTLY
	db 24,GASTLY
	db 20,CUBONE
	db 22,CUBONE
	db 25,HAUNTER

	db 0

TowerMons4:
	db $0A
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 19,GASTLY
	db 18,GASTLY
	db 25,HAUNTER
	db 20,CUBONE
	db 22,CUBONE
	db 24,GASTLY

	db 0

TowerMons5:
	db $0A
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 19,GASTLY
	db 18,GASTLY
	db 25,HAUNTER
	db 20,CUBONE
	db 22,CUBONE
	db 24,GASTLY

	db 0

TowerMons6:
	db $0F
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 24,GASTLY
	db 20,GASTLY
	db 19,GASTLY
	db 26,HAUNTER
	db 22,CUBONE
	db 24,CUBONE
	db 28,HAUNTER

	db 0

TowerMons7:
	db $0F
	db 21,GASTLY
	db 22,GASTLY
	db 23,GASTLY
	db 24,GASTLY
	db 20,GASTLY
	db 28,HAUNTER
	db 22,CUBONE
	db 24,CUBONE
	db 28,HAUNTER
	db 30,HAUNTER

	db 0

Route13Mons:
	db $14
	db 24,ODDISH
	db 25,PIDGEY
	db 27,PIDGEY
	db 24,VENONAT
	db 22,ODDISH
	db 26,VENONAT
	db 26,ODDISH
	db 25,DITTO
	db 28,GLOOM
	db 30,GLOOM

	db 0

Route14Mons:
	db $0F
	db 24,ODDISH
	db 26,PIDGEY
	db 23,DITTO
	db 24,VENONAT
	db 22,ODDISH
	db 26,VENONAT
	db 26,ODDISH
	db 30,GLOOM
	db 28,PIDGEOTTO
	db 30,PIDGEOTTO

	db 0

Route15Mons:
	db $0F
	db 24,ODDISH
	db 26,DITTO
	db 23,PIDGEY
	db 26,VENONAT
	db 22,ODDISH
	db 28,VENONAT
	db 26,ODDISH
	db 30,GLOOM
	db 28,PIDGEOTTO
	db 30,PIDGEOTTO

	db 0

Route16Mons:
	db $19
	db 20,SPEAROW
	db 22,SPEAROW
	db 18,RATTATA
	db 20,DODUO
	db 20,RATTATA
	db 18,DODUO
	db 22,DODUO
	db 22,RATTATA
	db 23,RATICATE
	db 25,RATICATE

	db 0

Route17Mons:
	db $19
	db 20,SPEAROW
	db 22,SPEAROW
	db 25,RATICATE
	db 24,DODUO
	db 27,RATICATE
	db 26,DODUO
	db 28,DODUO
	db 29,RATICATE
	db 25,FEAROW
	db 27,FEAROW

	db 0

Route18Mons:
	db $19
	db 20,SPEAROW
	db 22,SPEAROW
	db 25,RATICATE
	db 24,DODUO
	db 25,FEAROW
	db 26,DODUO
	db 28,DODUO
	db 29,RATICATE
	db 27,FEAROW
	db 29,FEAROW

	db 0

ZoneMonsCenter:
	db $1E
	db 22,NIDORAN_M
	db 25,RHYHORN
	db 22,VENONAT
	db 24,EXEGGCUTE
	db 31,NIDORINO
	db 25,EXEGGCUTE
	db 31,NIDORINA
	db 30,PARASECT
	db 23,SCYTHER
	db 23,CHANSEY

	db 0

ZoneMons1:
	db $1E
	db 24,NIDORAN_M
	db 26,DODUO
	db 22,PARAS
	db 25,EXEGGCUTE
	db 33,NIDORINO
	db 23,EXEGGCUTE
	db 24,NIDORAN_F
	db 25,PARASECT
	db 25,KANGASKHAN
	db 28,SCYTHER

	db 0

ZoneMons2:
	db $1E
	db 22,NIDORAN_M
	db 26,RHYHORN
	db 23,PARAS
	db 25,EXEGGCUTE
	db 30,NIDORINO
	db 27,EXEGGCUTE
	db 30,NIDORINA
	db 32,VENOMOTH
	db 26,CHANSEY
	db 28,TAUROS

	db 0

ZoneMons3:
	db $1E
	db 25,NIDORAN_M
	db 26,DODUO
	db 23,VENONAT
	db 24,EXEGGCUTE
	db 33,NIDORINO
	db 26,EXEGGCUTE
	db 25,NIDORAN_F
	db 31,VENOMOTH
	db 26,TAUROS
	db 28,KANGASKHAN

	db 0

WaterMons:
	db 0

	db 5
	db 5,   TENTACOOL
	db 10,  TENTACOOL
	db 15,  TENTACOOL
	db 5,   TENTACOOL
	db 10,  TENTACOOL
	db 15,  TENTACOOL
	db 20,  TENTACOOL
	db 30,  TENTACOOL
	db 35,  TENTACOOL
	db 40,  TENTACOOL

IslandMons1:
	db $0F
	db 30,SEEL
	db 30,SLOWPOKE
	db 30,SHELLDER
	db 30,HORSEA
	db 28,HORSEA
	db 21,ZUBAT
	db 29,GOLBAT
	db 28,PSYDUCK
	db 28,SHELLDER
	db 38,GOLDUCK

	db 0

IslandMonsB1:
	db $0A
	db 30,STARYU
	db 30,HORSEA
	db 32,SHELLDER
	db 32,HORSEA
	db 28,SLOWPOKE
	db 30,SEEL
	db 30,SLOWPOKE
	db 28,SEEL
	db 38,DEWGONG
	db 37,SEADRA

	db 0

IslandMonsB2:
	db $0A
	db 30,SEEL
	db 30,SLOWPOKE
	db 32,SEEL
	db 32,SLOWPOKE
	db 28,HORSEA
	db 30,STARYU
	db 30,HORSEA
	db 28,SHELLDER
	db 30,GOLBAT
	db 37,SLOWBRO

	db 0

IslandMonsB3:
	db $0A
	db 31,SLOWPOKE
	db 31,SEEL
	db 33,SLOWPOKE
	db 33,SEEL
	db 29,HORSEA
	db 31,SHELLDER
	db 31,HORSEA
	db 29,SHELLDER
	db 39,SEADRA
	db 37,DEWGONG

	db 0

IslandMonsB4:
	db $0A
	db 31,HORSEA
	db 31,SHELLDER
	db 33,HORSEA
	db 33,SHELLDER
	db 29,SLOWPOKE
	db 31,SEEL
	db 31,SLOWPOKE
	db 29,SEEL
	db 39,SLOWBRO
	db 32,GOLBAT

	db 0

MansionMons1:
	db $0A
	db 32,KOFFING
	db 30,KOFFING
	db 34,PONYTA
	db 30,PONYTA
	db 34,GROWLITHE
	db 32,PONYTA
	db 30,GRIMER
	db 28,PONYTA
	db 37,WEEZING
	db 39,MUK

	db 0

MansionMons2:
	db $0A
	db 32,GROWLITHE
	db 34,KOFFING
	db 34,KOFFING
	db 30,PONYTA
	db 30,KOFFING
	db 32,PONYTA
	db 30,GRIMER
	db 28,PONYTA
	db 39,WEEZING
	db 37,MUK

	db 0

MansionMons3:
	db $0A
	db 31,KOFFING
	db 33,GROWLITHE
	db 35,KOFFING
	db 32,PONYTA
	db 34,PONYTA
	db 40,WEEZING
	db 34,GRIMER
	db 38,WEEZING
	db 36,PONYTA
	db 42,MUK

	db 0

MansionMonsB1:
	db $0A
	db 33,KOFFING
	db 31,KOFFING
	db 35,GROWLITHE
	db 32,PONYTA
	db 31,KOFFING
	db 40,WEEZING
	db 34,PONYTA
	db 35,GRIMER
	db 42,WEEZING
	db 42,MUK

	db 0

Route21Mons:
	db $19
	db 21,RATTATA
	db 23,PIDGEY
	db 30,RATICATE
	db 23,RATTATA
	db 21,PIDGEY
	db 30,PIDGEOTTO
	db 32,PIDGEOTTO
	db 28,TANGELA
	db 30,TANGELA
	db 32,TANGELA

	db 5
	db 5,TENTACOOL
	db 10,TENTACOOL
	db 15,TENTACOOL
	db 5,TENTACOOL
	db 10,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACOOL
	db 40,TENTACOOL

DungeonMons1:
	db $0A
	db 46,GOLBAT
	db 46,HYPNO
	db 46,MAGNETON
	db 49,DODRIO
	db 49,VENOMOTH
	db 52,ARBOK
	db 49,KADABRA
	db 52,PARASECT
	db 53,RAICHU
	db 53,DITTO

	db 0

DungeonMons2:
	db $0F
	db 51,DODRIO
	db 51,VENOMOTH
	db 51,KADABRA
	db 52,RHYDON
	db 52,MAROWAK
	db 52,ELECTRODE
	db 56,CHANSEY
	db 54,WIGGLYTUFF
	db 55,DITTO
	db 60,DITTO

	db 0

DungeonMonsB1:
	db $19
	db 55,RHYDON
	db 55,MAROWAK
	db 55,ELECTRODE
	db 64,CHANSEY
	db 64,PARASECT
	db 64,RAICHU
	db 57,ARBOK
	db 65,DITTO
	db 63,DITTO
	db 67,DITTO

	db 0

PowerPlantMons:
	db $0A
	db 21,VOLTORB
	db 21,MAGNEMITE
	db 20,PIKACHU
	db 24,PIKACHU
	db 23,MAGNEMITE
	db 23,VOLTORB
	db 32,MAGNETON
	db 35,MAGNETON
	db 33,ELECTABUZZ
	db 36,ELECTABUZZ

	db 0

Route23Mons:
	db $0A
	db 26,EKANS
	db 33,DITTO
	db 26,SPEAROW
	db 38,FEAROW
	db 38,DITTO
	db 38,FEAROW
	db 41,ARBOK
	db 43,DITTO
	db 41,FEAROW
	db 43,FEAROW

	db 0

PlateauMons2:
	db $0A
	db 22,MACHOP
	db 24,GEODUDE
	db 26,ZUBAT
	db 36,ONIX
	db 39,ONIX
	db 42,ONIX
	db 41,MACHOKE
	db 40,GOLBAT
	db 40,MAROWAK
	db 43,GRAVELER

	db 0

PlateauMons3:
	db $0F
	db 24,MACHOP
	db 26,GEODUDE
	db 22,ZUBAT
	db 42,ONIX
	db 40,VENOMOTH
	db 45,ONIX
	db 43,GRAVELER
	db 41,GOLBAT
	db 42,MACHOKE
	db 45,MACHOKE

	db 0

PlateauMons1:
	db $0F
	db 24,MACHOP
	db 26,GEODUDE
	db 22,ZUBAT
	db 36,ONIX
	db 39,ONIX
	db 42,ONIX
	db 41,GRAVELER
	db 41,GOLBAT
	db 42,MACHOKE
	db 43,MAROWAK

	db 0

CaveMons:
	db $14
	db 18,DIGLETT
	db 19,DIGLETT
	db 17,DIGLETT
	db 20,DIGLETT
	db 16,DIGLETT
	db 15,DIGLETT
	db 21,DIGLETT
	db 22,DIGLETT
	db 29,DUGTRIO
	db 31,DUGTRIO

	db 0



INCBIN "baserom.gbc",$D5C7,$10000 - $D5C7

SECTION "bank4",DATA,BANK[$4]
INCBIN "baserom.gbc",$10000,$4000

SECTION "bank5",DATA,BANK[$5]
INCBIN "baserom.gbc",$14000,$4000

SECTION "bank6",DATA,BANK[$6]
INCBIN "baserom.gbc",$18000,$4000

SECTION "bank7",DATA,BANK[$7]
INCBIN "baserom.gbc",$1C000,$4000

SECTION "bank8",DATA,BANK[$8]
INCBIN "baserom.gbc",$20000,$4000

SECTION "bank9",DATA,BANK[$9]
INCBIN "baserom.gbc",$24000,$4000

SECTION "bankA",DATA,BANK[$A]
INCBIN "baserom.gbc",$28000,$4000

SECTION "bankB",DATA,BANK[$B]
INCBIN "baserom.gbc",$2C000,$4000

SECTION "bankC",DATA,BANK[$C]
INCBIN "baserom.gbc",$30000,$4000

SECTION "bankD",DATA,BANK[$D]
INCBIN "baserom.gbc",$34000,$4000

SECTION "bankE",DATA,BANK[$E]
INCBIN "baserom.gbc",$38000,$1C53

; trainer data: from 5C53 to 652E

ReadTrainer: ; 5C53

; don't change any moves in a link battle
        ld a,[W_ISLINKBATTLE]
        and a
        ret nz

; set [W_ENEMYMONCOUNT] to 0, [$D89D] to FF
; first is total enemy pokemon?
; second is species of first pokemon?
        ld hl,W_ENEMYMONCOUNT
        xor a
        ld [hli],a
        dec a
        ld [hl],a

; get the pointer to trainer data for this class
        ld a,[W_CUROPPONENT]
        sub $C9 ; convert value from pokemon to trainer
        add a,a
        ld hl,TrainerDataPointers
        ld c,a
        ld b,0
        add hl,bc ; hl points to trainer class
        ld a,[hli]
        ld h,[hl]
        ld l,a
        ld a,[W_TRAINERNO]
        ld b,a
; at this point b contains the trainer number,
; and hl points to the trainer class.
; the next function is to iterate through the trainers,
; decrementing b each time, until we get to the right one
.outer\@
        dec b
        jr z,.IterateTrainer
.inner\@
        ld a,[hli]
        and a
        jr nz,.inner\@
        jr .outer\@

; if the first byte of trainer data is FF,
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [W_LONEATTACKNO] != 0, one pokemon on the team has a special move
; else the first byte is the level of every pokemon on the team
.IterateTrainer
        ld a,[hli]
        cp $FF ; is the trainer special?
        jr z,.SpecialTrainer\@ ; if so, check for special attacks
        ld [W_CURENEMYLVL],a
.LoopTrainerData\@
        ld a,[hli]
        and a ; have we reached the end of the trainer data?
        jr z,.FinishUp\@
        ld [$CF91],a ; write species somewhere (why?)
        ld a,1
        ld [$CC49],a
        push hl
        call $3927
        pop hl
        jr .LoopTrainerData\@
.SpecialTrainer\@
; if this code is being run:
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [W_LONEATTACKNO] != 0, one pokemon on the team has a special move
        ld a,[hli]
        and a ; have we reached the end of the trainer data?
        jr z,.AddLoneAttack\@
        ld [W_CURENEMYLVL],a
        ld a,[hli]
        ld [$CF91],a
        ld a,1
        ld [$CC49],a
        push hl
        call $3927
        pop hl
        jr .SpecialTrainer\@
.AddLoneAttack\@
; does the trainer have a single monster with a different move
        ld a,[W_LONEATTACKNO] ; Brock is 01, Misty is 02, Erika is 04, etc
        and a
        jr z,.AddTeamAttack\@
        dec a
        add a,a
        ld c,a
        ld b,0
        ld hl,LoneAttacks
        add hl,bc
        ld a,[hli]
        ld d,[hl]
        ld hl,W_ENEMYMON1MOVE3
        ld bc,W_ENEMYMON2MOVE3 - W_ENEMYMON1MOVE3
        call AddNTimes
        ld [hl],d
        jr .FinishUp\@
.AddTeamAttack\@
; check if our trainer's team has special moves

; get trainer class number
        ld a,[$D059]
        sub $C8
        ld b,a
        ld hl,TeamAttacks

; iterate through entries in TeamAttacks, checking each for our trainer class
.IterateTeamAttacks\@
        ld a,[hli]
        cp b
        jr z,.GiveTeamAttacks\@ ; is there a match?
        inc hl ; if not, go to the next entry
        inc a
        jr nz,.IterateTeamAttacks\@

        ; no matches found. is this trainer champion rival?
        ld a,b
        cp SONY3
        jr z,.ChampionRival\@
        jr .FinishUp\@ ; nope
.GiveTeamAttacks\@
        ld a,[hl]
        ld [$D95E],a
        jr .FinishUp\@
.ChampionRival\@ ; give attacks to his team

; pidgeot
        ld a,SKY_ATTACK
        ld [W_ENEMYMON1MOVE3],a

; starter
        ld a,[W_RIVALSTARTER]
        cp BULBASAUR
        ld b,MEGA_DRAIN
        jr z,.GiveStarterMove\@
        cp CHARMANDER
        ld b,FIRE_BLAST
        jr z,.GiveStarterMove\@
        ld b,BLIZZARD ; must be squirtle
.GiveStarterMove\@
        ld a,b
        ld [W_ENEMYMON6MOVE3],a
.FinishUp\@ ; this needs documenting
        xor a       ; clear D079-D07B
        ld de,$D079
        ld [de],a
        inc de
        ld [de],a
        inc de
        ld [de],a
        ld a,[W_CURENEMYLVL]
        ld b,a
.LastLoop\@
        ld hl,$D047
        ld c,2
        push bc
        ld a,$B
        call $3E6D
        pop bc
        inc de
        inc de
        dec b
        jr nz,.LastLoop\@
        ret

LoneAttacks: ; 5D22
; these are used for gym leaders.
; this is not automatic! you have to write the number you want to W_LONEATTACKNO
; first. e.g., erika's script writes 4 to W_LONEATTACKNO to get mega drain,
; the fourth entry in the list.

; first byte:  pokemon in the trainer's party that gets the move
; second byte: move
; unterminated
	db 1,BIDE
	db 1,BUBBLEBEAM
	db 2,THUNDERBOLT
	db 2,MEGA_DRAIN
	db 3,TOXIC
	db 3,PSYWAVE
	db 3,FIRE_BLAST
	db 4,FISSURE

TeamAttacks: ; 5D32
; these are used for elite four.
; this is automatic, based on trainer class.
; don't be confused by LoneAttacks above, the two data structures are
	; _completely_ unrelated.

; first byte: trainer (all trainers in this class have this move)
; second byte: move
; ff-terminated
	db LORELEI,BLIZZARD
	db BRUNO,FISSURE
	db AGATHA,TOXIC
	db LANCE,BARRIER
	db $FF

TrainerDataPointers: ; 5D3B
	dw YoungsterData,BugCatcherData,LassData,SailorData,JrTrainerMData
	dw JrTrainerFData,PokemaniacData,SuperNerdData,HikerData,BikerData
	dw BurglarData,EngineerData,Juggler1Data,FisherData,SwimmerData
	dw CueBallData,GamblerData,BeautyData,PsychicData,RockerData
	dw JugglerData,TamerData,BirdKeeperData,BlackbeltData,Green1Data
	dw ProfOakData,ChiefData,ScientistData,GiovanniData,RocketData
	dw CooltrainerMData,CooltrainerFData,BrunoData,BrockData,MistyData
	dw LtSurgeData,ErikaData,KogaData,BlaineData,SabrinaData
	dw GentlemanData,Green2Data,Green3Data,LoreleiData,ChannelerData
	dw AgathaData,LanceData

; if first byte != FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == FF, then
	; first byte is FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
	db 11,RATTATA,EKANS,0
	db 14,SPEAROW,0
	db 10,RATTATA,RATTATA,ZUBAT,0
	db 14,RATTATA,EKANS,ZUBAT,0
	db 15,RATTATA,SPEAROW,0
	db 17,SLOWPOKE,0
	db 14,EKANS,SANDSHREW,0
	db 21,NIDORAN_M,0
	db 21,EKANS,0
	db 19,SANDSHREW,ZUBAT,0
	db 17,RATTATA,RATTATA,RATICATE,0
	db 18,NIDORAN_M,NIDORINO,0
	db 17,SPEAROW,RATTATA,RATTATA,SPEAROW,0
BugCatcherData:
	db 6,WEEDLE,CATERPIE,0
	db 7,WEEDLE,KAKUNA,WEEDLE,0
	db 9,WEEDLE,0
	db 10,CATERPIE,WEEDLE,CATERPIE,0
	db 9,WEEDLE,KAKUNA,CATERPIE,METAPOD,0
	db 11,CATERPIE,METAPOD,0
	db 11,WEEDLE,KAKUNA,0
	db 10,CATERPIE,METAPOD,CATERPIE,0
	db 14,CATERPIE,WEEDLE,0
	db 16,WEEDLE,CATERPIE,WEEDLE,0
	db 20,BUTTERFREE,0
	db 18,METAPOD,CATERPIE,VENONAT,0
	db 19,BEEDRILL,BEEDRILL,0
	db 20,CATERPIE,WEEDLE,VENONAT,0
LassData:
	db 9,PIDGEY,PIDGEY,0
	db 10,RATTATA,NIDORAN_M,0
	db 14,JIGGLYPUFF,0
	db 31,PARAS,PARAS,PARASECT,0
	db 11,ODDISH,BELLSPROUT,0
	db 14,CLEFAIRY,0
	db 16,PIDGEY,NIDORAN_F,0
	db 14,PIDGEY,NIDORAN_F,0
	db 15,NIDORAN_M,NIDORAN_F,0
	db 13,ODDISH,PIDGEY,ODDISH,0
	db 18,PIDGEY,NIDORAN_F,0
	db 18,RATTATA,PIKACHU,0
	db 23,NIDORAN_F,NIDORINA,0
	db 24,MEOWTH,MEOWTH,MEOWTH,0
	db 19,PIDGEY,RATTATA,NIDORAN_M,MEOWTH,PIKACHU,0
	db 22,CLEFAIRY,CLEFAIRY,0
	db 23,BELLSPROUT,WEEPINBELL,0
	db 23,ODDISH,GLOOM,0
SailorData:
	db 18,MACHOP,SHELLDER,0
	db 17,MACHOP,TENTACOOL,0
	db 21,SHELLDER,0
	db 17,HORSEA,SHELLDER,TENTACOOL,0
	db 18,TENTACOOL,STARYU,0
	db 17,HORSEA,HORSEA,HORSEA,0
	db 20,MACHOP,0
	db 21,PIKACHU,PIKACHU,0
JrTrainerMData:
	db 11,DIGLETT,SANDSHREW,0
	db 14,RATTATA,EKANS,0
	db 18,MANKEY,0
	db 20,SQUIRTLE,0
	db 16,SPEAROW,RATICATE,0
	db 18,DIGLETT,DIGLETT,SANDSHREW,0
	db 21,GROWLITHE,CHARMANDER,0
	db 19,RATTATA,DIGLETT,EKANS,SANDSHREW,0
	db 29,NIDORAN_M,NIDORINO,0
JrTrainerFData:
	db 19,GOLDEEN,0
	db 16,RATTATA,PIKACHU,0
	db 16,PIDGEY,PIDGEY,PIDGEY,0
	db 22,BULBASAUR,0
	db 18,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0
	db 23,MEOWTH,0
	db 20,PIKACHU,CLEFAIRY,0
	db 21,PIDGEY,PIDGEOTTO,0
	db 21,JIGGLYPUFF,PIDGEY,MEOWTH,0
	db 22,ODDISH,BULBASAUR,0
	db 24,BULBASAUR,IVYSAUR,0
	db 24,PIDGEY,MEOWTH,RATTATA,PIKACHU,MEOWTH,0
	db 30,POLIWAG,POLIWAG,0
	db 27,PIDGEY,MEOWTH,PIDGEY,PIDGEOTTO,0
	db 28,GOLDEEN,POLIWAG,HORSEA,0
	db 31,GOLDEEN,SEAKING,0
	db 22,BELLSPROUT,CLEFAIRY,0
	db 20,MEOWTH,ODDISH,PIDGEY,0
	db 19,PIDGEY,RATTATA,RATTATA,BELLSPROUT,0
	db 28,GLOOM,ODDISH,ODDISH,0
	db 29,PIKACHU,RAICHU,0
	db 33,CLEFAIRY,0
	db 29,BELLSPROUT,ODDISH,TANGELA,0
	db 30,TENTACOOL,HORSEA,SEEL,0
PokemaniacData:
	db 30,RHYHORN,LICKITUNG,0
	db 20,CUBONE,SLOWPOKE,0
	db 20,SLOWPOKE,SLOWPOKE,SLOWPOKE,0
	db 22,CHARMANDER,CUBONE,0
	db 25,SLOWPOKE,0
	db 40,CHARMELEON,LAPRAS,LICKITUNG,0
	db 23,CUBONE,SLOWPOKE,0
SuperNerdData:
	db 11,MAGNEMITE,VOLTORB,0
	db 12,GRIMER,VOLTORB,KOFFING,0
	db 20,VOLTORB,KOFFING,VOLTORB,MAGNEMITE,0
	db 22,GRIMER,MUK,GRIMER,0
	db 26,KOFFING,0
	db 22,KOFFING,MAGNEMITE,WEEZING,0
	db 20,MAGNEMITE,MAGNEMITE,KOFFING,MAGNEMITE,0
	db 24,MAGNEMITE,VOLTORB,0
	db 36,VULPIX,VULPIX,NINETALES,0
	db 34,PONYTA,CHARMANDER,VULPIX,GROWLITHE,0
	db 41,RAPIDASH,0
	db 37,GROWLITHE,VULPIX,0
HikerData:
	db 10,GEODUDE,GEODUDE,ONIX,0
	db 15,MACHOP,GEODUDE,0
	db 13,GEODUDE,GEODUDE,MACHOP,GEODUDE,0
	db 17,ONIX,0
	db 21,GEODUDE,ONIX,0
	db 20,GEODUDE,MACHOP,GEODUDE,0
	db 21,GEODUDE,ONIX,0
	db 19,ONIX,GRAVELER,0
	db 21,GEODUDE,GEODUDE,GRAVELER,0
	db 25,GEODUDE,0
	db 20,MACHOP,ONIX,0
	db 19,GEODUDE,MACHOP,GEODUDE,GEODUDE,0
	db 20,ONIX,ONIX,GEODUDE,0
	db 21,GEODUDE,GRAVELER,0
BikerData:
	db 28,KOFFING,KOFFING,KOFFING,0
	db 29,KOFFING,GRIMER,0
	db 25,KOFFING,KOFFING,WEEZING,KOFFING,GRIMER,0
	db 28,KOFFING,GRIMER,WEEZING,0
	db 29,GRIMER,KOFFING,0
	db 33,WEEZING,0
	db 26,GRIMER,GRIMER,GRIMER,GRIMER,0
	db 28,WEEZING,KOFFING,WEEZING,0
	db 33,MUK,0
	db 29,VOLTORB,VOLTORB,0
	db 29,WEEZING,MUK,0
	db 25,KOFFING,WEEZING,KOFFING,KOFFING,WEEZING,0
	db 26,KOFFING,KOFFING,GRIMER,KOFFING,0
	db 28,GRIMER,GRIMER,KOFFING,0
	db 29,KOFFING,MUK,0
BurglarData:
	db 29,GROWLITHE,VULPIX,0
	db 33,GROWLITHE,0
	db 28,VULPIX,CHARMANDER,PONYTA,0
	db 36,GROWLITHE,VULPIX,NINETALES,0
	db 41,PONYTA,0
	db 37,VULPIX,GROWLITHE,0
	db 34,CHARMANDER,CHARMELEON,0
	db 38,NINETALES,0
	db 34,GROWLITHE,PONYTA,0
EngineerData:
	db 21,VOLTORB,MAGNEMITE,0
	db 21,MAGNEMITE,0
	db 18,MAGNEMITE,MAGNEMITE,MAGNETON,0
Juggler1Data:
; none
FisherData:
	db 17,GOLDEEN,TENTACOOL,GOLDEEN,0
	db 17,TENTACOOL,STARYU,SHELLDER,0
	db 22,GOLDEEN,POLIWAG,GOLDEEN,0
	db 24,TENTACOOL,GOLDEEN,0
	db 27,GOLDEEN,0
	db 21,POLIWAG,SHELLDER,GOLDEEN,HORSEA,0
	db 28,SEAKING,GOLDEEN,SEAKING,SEAKING,0
	db 31,SHELLDER,CLOYSTER,0
	db 27,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,0
	db 33,SEAKING,GOLDEEN,0
	db 24,MAGIKARP,MAGIKARP,0
SwimmerData:
	db 16,HORSEA,SHELLDER,0
	db 30,TENTACOOL,SHELLDER,0
	db 29,GOLDEEN,HORSEA,STARYU,0
	db 30,POLIWAG,POLIWHIRL,0
	db 27,HORSEA,TENTACOOL,TENTACOOL,GOLDEEN,0
	db 29,GOLDEEN,SHELLDER,SEAKING,0
	db 30,HORSEA,HORSEA,0
	db 27,TENTACOOL,TENTACOOL,STARYU,HORSEA,TENTACRUEL,0
	db 31,SHELLDER,CLOYSTER,0
	db 35,STARYU,0
	db 28,HORSEA,HORSEA,SEADRA,HORSEA,0
	db 33,SEADRA,TENTACRUEL,0
	db 37,STARMIE,0
	db 33,STARYU,WARTORTLE,0
	db 32,POLIWHIRL,TENTACOOL,SEADRA,0
CueBallData:
	db 28,MACHOP,MANKEY,MACHOP,0
	db 29,MANKEY,MACHOP,0
	db 33,MACHOP,0
	db 29,MANKEY,PRIMEAPE,0
	db 29,MACHOP,MACHOKE,0
	db 33,MACHOKE,0
	db 26,MANKEY,MANKEY,MACHOKE,MACHOP,0
	db 29,PRIMEAPE,MACHOKE,0
	db 31,TENTACOOL,TENTACOOL,TENTACRUEL,0
GamblerData:
	db 18,POLIWAG,HORSEA,0
	db 18,BELLSPROUT,ODDISH,0
	db 18,VOLTORB,MAGNEMITE,0
	db 18,GROWLITHE,VULPIX,0
	db 22,POLIWAG,POLIWAG,POLIWHIRL,0
	db 22,ONIX,GEODUDE,GRAVELER,0
	db 24,GROWLITHE,VULPIX,0
BeautyData:
	db 21,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0
	db 24,BELLSPROUT,BELLSPROUT,0
	db 26,EXEGGCUTE,0
	db 27,RATTATA,PIKACHU,RATTATA,0
	db 29,CLEFAIRY,MEOWTH,0
	db 35,SEAKING,0
	db 30,SHELLDER,SHELLDER,CLOYSTER,0
	db 31,POLIWAG,SEAKING,0
	db 29,PIDGEOTTO,WIGGLYTUFF,0
	db 29,BULBASAUR,IVYSAUR,0
	db 33,WEEPINBELL,BELLSPROUT,WEEPINBELL,0
	db 27,POLIWAG,GOLDEEN,SEAKING,GOLDEEN,POLIWAG,0
	db 30,GOLDEEN,SEAKING,0
	db 29,STARYU,STARYU,STARYU,0
	db 30,SEADRA,HORSEA,SEADRA,0
PsychicData:
	db 31,KADABRA,SLOWPOKE,MR__MIME,KADABRA,0
	db 34,MR__MIME,KADABRA,0
	db 33,SLOWPOKE,SLOWPOKE,SLOWBRO,0
	db 38,SLOWBRO,0
RockerData:
	db 20,VOLTORB,MAGNEMITE,VOLTORB,0
	db 29,VOLTORB,ELECTRODE,0
JugglerData:
	db 29,KADABRA,MR__MIME,0
	db 41,DROWZEE,HYPNO,KADABRA,KADABRA,0
	db 31,DROWZEE,DROWZEE,KADABRA,DROWZEE,0
	db 34,DROWZEE,HYPNO,0
	db 48,MR__MIME,0
	db 33,HYPNO,0
	db 38,HYPNO,0
	db 34,DROWZEE,KADABRA,0
TamerData:
	db 34,SANDSLASH,ARBOK,0
	db 33,ARBOK,SANDSLASH,ARBOK,0
	db 43,RHYHORN,0
	db 39,ARBOK,TAUROS,0
	db 44,PERSIAN,GOLDUCK,0
	db 42,RHYHORN,PRIMEAPE,ARBOK,TAUROS,0
BirdKeeperData:
	db 29,PIDGEY,PIDGEOTTO,0
	db 25,SPEAROW,PIDGEY,PIDGEY,SPEAROW,SPEAROW,0
	db 26,PIDGEY,PIDGEOTTO,SPEAROW,FEAROW,0
	db 33,FARFETCH_D,0
	db 29,SPEAROW,FEAROW,0
	db 26,PIDGEOTTO,FARFETCH_D,DODUO,PIDGEY,0
	db 28,DODRIO,DODUO,DODUO,0
	db 29,SPEAROW,FEAROW,0
	db 34,DODRIO,0
	db 26,SPEAROW,SPEAROW,FEAROW,SPEAROW,0
	db 30,FEAROW,FEAROW,PIDGEOTTO,0
	db 39,PIDGEOTTO,PIDGEOTTO,PIDGEY,PIDGEOTTO,0
	db 42,FARFETCH_D,FEAROW,0
	db 28,PIDGEY,DODUO,PIDGEOTTO,0
	db 26,PIDGEY,SPEAROW,PIDGEY,FEAROW,0
	db 29,PIDGEOTTO,FEAROW,0
	db 28,SPEAROW,DODUO,FEAROW,0
BlackbeltData:
	db 37,HITMONLEE,HITMONCHAN,0
	db 31,MANKEY,MANKEY,PRIMEAPE,0
	db 32,MACHOP,MACHOKE,0
	db 36,PRIMEAPE,0
	db 31,MACHOP,MANKEY,PRIMEAPE,0
	db 40,MACHOP,MACHOKE,0
	db 43,MACHOKE,0
	db 38,MACHOKE,MACHOP,MACHOKE,0
	db 43,MACHOKE,MACHOP,MACHOKE,0
Green1Data:
	db 5,SQUIRTLE,0
	db 5,BULBASAUR,0
	db 5,CHARMANDER,0
	db $FF,9,PIDGEY,8,SQUIRTLE,0
	db $FF,9,PIDGEY,8,BULBASAUR,0
	db $FF,9,PIDGEY,8,CHARMANDER,0
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,SQUIRTLE,0
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,BULBASAUR,0
	db $FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,CHARMANDER,0
ProfOakData:
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,BLASTOISE,70,GYARADOS,0
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,VENUSAUR,70,GYARADOS,0
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,CHARIZARD,70,GYARADOS,0
ChiefData:
; none
ScientistData:
	db 34,KOFFING,VOLTORB,0
	db 26,GRIMER,WEEZING,KOFFING,WEEZING,0
	db 28,MAGNEMITE,VOLTORB,MAGNETON,0
	db 29,ELECTRODE,WEEZING,0
	db 33,ELECTRODE,0
	db 26,MAGNETON,KOFFING,WEEZING,MAGNEMITE,0
	db 25,VOLTORB,KOFFING,MAGNETON,MAGNEMITE,KOFFING,0
	db 29,ELECTRODE,MUK,0
	db 29,GRIMER,ELECTRODE,0
	db 28,VOLTORB,KOFFING,MAGNETON,0
	db 29,MAGNEMITE,KOFFING,0
	db 33,MAGNEMITE,MAGNETON,VOLTORB,0
	db 34,MAGNEMITE,ELECTRODE,0
GiovanniData:
	db $FF,25,ONIX,24,RHYHORN,29,KANGASKHAN,0
	db $FF,37,NIDORINO,35,KANGASKHAN,37,RHYHORN,41,NIDOQUEEN,0
	db $FF,45,RHYHORN,42,DUGTRIO,44,NIDOQUEEN,45,NIDOKING,50,RHYDON,0
RocketData:
	db 13,RATTATA,ZUBAT,0
	db 11,SANDSHREW,RATTATA,ZUBAT,0
	db 12,ZUBAT,EKANS,0
	db 16,RATICATE,0
	db 17,MACHOP,DROWZEE,0
	db 15,EKANS,ZUBAT,0
	db 20,RATICATE,ZUBAT,0
	db 21,DROWZEE,MACHOP,0
	db 21,RATICATE,RATICATE,0
	db 20,GRIMER,KOFFING,KOFFING,0
	db 19,RATTATA,RATICATE,RATICATE,RATTATA,0
	db 22,GRIMER,KOFFING,0
	db 17,ZUBAT,KOFFING,GRIMER,ZUBAT,RATICATE,0
	db 20,RATTATA,RATICATE,DROWZEE,0
	db 21,MACHOP,MACHOP,0
	db 23,SANDSHREW,EKANS,SANDSLASH,0
	db 23,EKANS,SANDSHREW,ARBOK,0
	db 21,KOFFING,ZUBAT,0
	db 25,ZUBAT,ZUBAT,GOLBAT,0
	db 26,KOFFING,DROWZEE,0
	db 23,ZUBAT,RATTATA,RATICATE,ZUBAT,0
	db 26,DROWZEE,KOFFING,0
	db 29,CUBONE,ZUBAT,0
	db 25,GOLBAT,ZUBAT,ZUBAT,RATICATE,ZUBAT,0
	db 28,RATICATE,HYPNO,RATICATE,0
	db 29,MACHOP,DROWZEE,0
	db 28,EKANS,ZUBAT,CUBONE,0
	db 33,ARBOK,0
	db 33,HYPNO,0
	db 29,MACHOP,MACHOKE,0
	db 28,ZUBAT,ZUBAT,GOLBAT,0
	db 26,RATICATE,ARBOK,KOFFING,GOLBAT,0
	db 29,CUBONE,CUBONE,0
	db 29,SANDSHREW,SANDSLASH,0
	db 26,RATICATE,ZUBAT,GOLBAT,RATTATA,0
	db 28,WEEZING,GOLBAT,KOFFING,0
	db 28,DROWZEE,GRIMER,MACHOP,0
	db 28,GOLBAT,DROWZEE,HYPNO,0
	db 33,MACHOKE,0
	db 25,RATTATA,RATTATA,ZUBAT,RATTATA,EKANS,0
	db 32,CUBONE,DROWZEE,MAROWAK,0
CooltrainerMData:
	db 39,NIDORINO,NIDOKING,0
	db 43,EXEGGUTOR,CLOYSTER,ARCANINE,0
	db 43,KINGLER,TENTACRUEL,BLASTOISE,0
	db 45,KINGLER,STARMIE,0
	db 42,IVYSAUR,WARTORTLE,CHARMELEON,CHARIZARD,0
	db 44,IVYSAUR,WARTORTLE,CHARMELEON,0
	db 49,NIDOKING,0
	db 44,KINGLER,CLOYSTER,0
	db 39,SANDSLASH,DUGTRIO,0
	db 43,RHYHORN,0
CooltrainerFData:
	db 24,WEEPINBELL,GLOOM,IVYSAUR,0
	db 43,BELLSPROUT,WEEPINBELL,VICTREEBEL,0
	db 43,PARASECT,DEWGONG,CHANSEY,0
	db 46,VILEPLUME,BUTTERFREE,0
	db 44,PERSIAN,NINETALES,0
	db 45,IVYSAUR,VENUSAUR,0
	db 45,NIDORINA,NIDOQUEEN,0
	db 43,PERSIAN,NINETALES,RAICHU,0
BrunoData:
	db $FF,53,ONIX,55,HITMONCHAN,55,HITMONLEE,56,ONIX,58,MACHAMP,0
BrockData:
	db $FF,12,GEODUDE,14,ONIX,0
MistyData:
	db $FF,18,STARYU,21,STARMIE,0
LtSurgeData:
	db $FF,21,VOLTORB,18,PIKACHU,24,RAICHU,0
ErikaData:
	db $FF,29,VICTREEBEL,24,TANGELA,29,VILEPLUME,0
KogaData:
	db $FF,37,KOFFING,39,MUK,37,KOFFING,43,WEEZING,0
BlaineData:
	db $FF,42,GROWLITHE,40,PONYTA,42,RAPIDASH,47,ARCANINE,0
SabrinaData:
	db $FF,38,KADABRA,37,MR__MIME,38,VENOMOTH,43,ALAKAZAM,0
GentlemanData:
	db 18,GROWLITHE,GROWLITHE,0
	db 19,NIDORAN_M,NIDORAN_F,0
	db 23,PIKACHU,0
	db 48,PRIMEAPE,0
	db 17,GROWLITHE,PONYTA,0
Green2Data:
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,WARTORTLE,0
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,IVYSAUR,0
	db $FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,CHARMELEON,0
	db $FF,25,PIDGEOTTO,23,GROWLITHE,22,EXEGGCUTE,20,KADABRA,25,WARTORTLE,0
	db $FF,25,PIDGEOTTO,23,GYARADOS,22,GROWLITHE,20,KADABRA,25,IVYSAUR,0
	db $FF,25,PIDGEOTTO,23,EXEGGCUTE,22,GYARADOS,20,KADABRA,25,CHARMELEON,0
	db $FF,37,PIDGEOT,38,GROWLITHE,35,EXEGGCUTE,35,ALAKAZAM,40,BLASTOISE,0
	db $FF,37,PIDGEOT,38,GYARADOS,35,GROWLITHE,35,ALAKAZAM,40,VENUSAUR,0
	db $FF,37,PIDGEOT,38,EXEGGCUTE,35,GYARADOS,35,ALAKAZAM,40,CHARIZARD,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,GROWLITHE,47,EXEGGCUTE,50,ALAKAZAM ;\
		db 53,BLASTOISE,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,GYARADOS,47,GROWLITHE,50,ALAKAZAM ;\
		db 53,VENUSAUR,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,EXEGGCUTE,47,GYARADOS,50,ALAKAZAM ;\
		db 53,CHARIZARD,0
Green3Data:
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,ARCANINE,63,EXEGGUTOR ;\
		db 65,BLASTOISE,0
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,GYARADOS,63,ARCANINE ;\
		db 65,VENUSAUR,0
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,EXEGGUTOR,63,GYARADOS ;\
		db 65,CHARIZARD,0
LoreleiData:
	db $FF,54,DEWGONG,53,CLOYSTER,54,SLOWBRO,56,JYNX,56,LAPRAS,0
ChannelerData:
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 23,GASTLY,GASTLY,0
	db 24,GASTLY,0
	db 23,GASTLY,0
	db 24,GASTLY,0
	db 24,HAUNTER,0
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 23,GASTLY,GASTLY,0
	db 24,GASTLY,0
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 23,HAUNTER,0
	db 24,GASTLY,0
	db 22,GASTLY,0
	db 24,GASTLY,0
	db 22,HAUNTER,0
	db 22,GASTLY,GASTLY,GASTLY,0
	db 24,GASTLY,0
	db 24,GASTLY,0
	db 34,GASTLY,HAUNTER,0
	db 38,HAUNTER,0
	db 33,GASTLY,GASTLY,HAUNTER,0
AgathaData:
	db $FF,56,GENGAR,56,GOLBAT,55,HAUNTER,58,ARBOK,60,GENGAR,0
LanceData:
	db $FF,58,GYARADOS,56,DRAGONAIR,56,DRAGONAIR,60,AERODACTYL ;\
		db 62,DRAGONITE,0



INCBIN "baserom.gbc",$3A52E,$3C000 - $3A52E

SECTION "bankF",DATA,BANK[$F]
INCBIN "baserom.gbc",$3C000,$4000

SECTION "bank10",DATA,BANK[$10]
INCBIN "baserom.gbc",$40000,$4000

SECTION "bank11",DATA,BANK[$11]
INCBIN "baserom.gbc",$44000,$4000

SECTION "bank12",DATA,BANK[$12]
INCBIN "baserom.gbc",$48000,$4000

SECTION "bank13",DATA,BANK[$13]
INCBIN "baserom.gbc",$4C000,$4000

SECTION "bank14",DATA,BANK[$14]
INCBIN "baserom.gbc",$50000,$4000

SECTION "bank15",DATA,BANK[$15]
INCBIN "baserom.gbc",$54000,$4000

SECTION "bank16",DATA,BANK[$16]
INCBIN "baserom.gbc",$58000,$4000

SECTION "bank17",DATA,BANK[$17]
INCBIN "baserom.gbc",$5C000,$4000

SECTION "bank18",DATA,BANK[$18]
INCBIN "baserom.gbc",$60000,$4000

SECTION "bank19",DATA,BANK[$19]
INCBIN "baserom.gbc",$64000,$4000

SECTION "bank1A",DATA,BANK[$1A]
INCBIN "baserom.gbc",$68000,$4000

SECTION "bank1B",DATA,BANK[$1B]
INCBIN "baserom.gbc",$6C000,$4000

SECTION "bank1C",DATA,BANK[$1C]
INCBIN "baserom.gbc",$70000,$4000

SECTION "bank1D",DATA,BANK[$1D]
INCBIN "baserom.gbc",$74000,$4000

SECTION "bank1E",DATA,BANK[$1E]
INCBIN "baserom.gbc",$78000,$4000

SECTION "bank1F",DATA,BANK[$1F]
INCBIN "baserom.gbc",$7C000,$4000

SECTION "bank20",DATA,BANK[$20]
INCBIN "baserom.gbc",$80000,$4000

SECTION "bank21",DATA,BANK[$21]
INCBIN "baserom.gbc",$84000,$4000

SECTION "bank22",DATA,BANK[$22]
INCBIN "baserom.gbc",$88000,$4000

SECTION "bank23",DATA,BANK[$23]
INCBIN "baserom.gbc",$8C000,$4000

SECTION "bank24",DATA,BANK[$24]
INCBIN "baserom.gbc",$90000,$4000

SECTION "bank25",DATA,BANK[$25]
INCBIN "baserom.gbc",$94000,$4000

SECTION "bank26",DATA,BANK[$26]
INCBIN "baserom.gbc",$98000,$4000

SECTION "bank27",DATA,BANK[$27]
INCBIN "baserom.gbc",$9C000,$4000

SECTION "bank28",DATA,BANK[$28]
INCBIN "baserom.gbc",$A0000,$4000

SECTION "bank29",DATA,BANK[$29]
INCBIN "baserom.gbc",$A4000,$4000

SECTION "bank2A",DATA,BANK[$2A]
INCBIN "baserom.gbc",$A8000,$4000

SECTION "bank2B",DATA,BANK[$2B]
INCBIN "baserom.gbc",$AC000,$4000

SECTION "bank2C",DATA,BANK[$2C]
INCBIN "baserom.gbc",$B0000,$4000
