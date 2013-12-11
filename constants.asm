_JAPAN EQU 0
_GREEN EQU 0
_YELLOW EQU 0


INCLUDE "macros.asm"

INCLUDE "hram.asm"


; OAM flags used by this game
OAMFLAG_ENDOFDATA   EQU %00000001 ; pseudo OAM flag, only used by game logic
OAMFLAG_CANBEMASKED EQU %00000010 ; pseudo OAM flag, only used by game logic
OAMFLAG_VFLIPPED    EQU %00100000 ; OAM flag flips the sprite vertically. Used for making left facing sprites face right and to alternate between left and right foot animation when walking up or down

MONSTER_NAME  EQU 1
MOVE_NAME     EQU 2
; ???_NAME    EQU 3
ITEM_NAME     EQU 4
PLAYEROT_NAME EQU 5
ENEMYOT_NAME  EQU 6
TRAINER_NAME  EQU 7


; hardware registers, from the pandocs http://nocash.emubase.de/pandocs.htm
rJOYP EQU $FF00
rDIV  EQU $FF04
rLCDC EQU $FF40
rSCY  EQU $FF42
rSCX  EQU $FF43
rBGP  EQU $FF47
rOBP0 EQU $FF48
rOBP1 EQU $FF49
rWY   EQU $FF4A
rWX   EQU $FF4B
rIE   EQU $FFFF

BTN_A      EQU %00000001
BTN_B      EQU %00000010
BTN_SELECT EQU %00000100
BTN_START  EQU %00001000
BTN_RIGHT  EQU %00010000
BTN_LEFT   EQU %00100000
BTN_UP     EQU %01000000
BTN_DOWN   EQU %10000000

; OAM attribute flags
OAM_HFLIP EQU %00100000 ; horizontal flip
OAM_VFLIP EQU %01000000 ; vertical flip

; list menu ID's
PCPOKEMONLISTMENU  EQU $00 ; PC pokemon withdraw/deposit lists
MOVESLISTMENU      EQU $01 ; XXX where is this used?
PRICEDITEMLISTMENU EQU $02 ; Pokemart buy menu / Pokemart buy/sell choose quantity menu
ITEMLISTMENU       EQU $03 ; Start menu Item menu / Pokemart sell menu
SPECIALLISTMENU    EQU $04 ; list of special "items" e.g. floor list in elevators / list of badges


INCLUDE "constants/pokemon_constants.asm"
INCLUDE "constants/trainer_constants.asm"
INCLUDE "constants/pokedex_constants.asm"
INCLUDE "constants/item_constants.asm"

INCLUDE "constants/move_constants.asm"
INCLUDE "constants/move_effect_constants.asm"

; fixed damage constants
SONICBOOM_DAMAGE   EQU 20
DRAGON_RAGE_DAMAGE EQU 40

INCLUDE "constants/palette_constants.asm"
INCLUDE "constants/map_constants.asm"
INCLUDE "constants/map_dimensions.asm"

; Evolution types
EV_LEVEL EQU 1
EV_ITEM  EQU 2
EV_TRADE EQU 3

; Elemental types
NORMAL   EQU $00
FIGHTING EQU $01
FLYING   EQU $02
POISON   EQU $03
GROUND   EQU $04
ROCK     EQU $05
BUG      EQU $07
GHOST    EQU $08
FIRE     EQU $14
WATER    EQU $15
GRASS    EQU $16
ELECTRIC EQU $17
PSYCHIC  EQU $18
ICE      EQU $19
DRAGON   EQU $1A

EAST  EQU 1
WEST  EQU 2
SOUTH EQU 4
NORTH EQU 8

; different kinds of people events
ITEM    EQU $80
TRAINER EQU $40

; status ailments (masks)
SLP EQU %00000111
PSN EQU %00001000
BRN EQU %00010000
FRZ EQU %00100000
PAR EQU %01000000

; pokemon's overworld sprites
SPRITE_MON       EQU $0
SPRITE_BALL_M    EQU $1
SPRITE_HELIX     EQU $2
SPRITE_FAIRY     EQU $3
SPRITE_BIRD_M    EQU $4
SPRITE_WATER     EQU $5
SPRITE_BUG       EQU $6
SPRITE_GRASS     EQU $7
SPRITE_SNAKE     EQU $8
SPRITE_QUADRUPED EQU $9

; overworld sprites
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

