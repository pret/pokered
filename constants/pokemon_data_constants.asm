PARTY_LENGTH EQU 6

MONS_PER_BOX EQU 20
NUM_BOXES    EQU 12

HOF_MON           EQU $10
HOF_TEAM          EQU PARTY_LENGTH * HOF_MON
HOF_TEAM_CAPACITY EQU 50


; mon data locations
; Note that some values are not supported by all functions that use these values.
PLAYER_PARTY_DATA EQU 0
ENEMY_PARTY_DATA  EQU 1
BOX_DATA          EQU 2
DAYCARE_DATA      EQU 3
BATTLE_MON_DATA   EQU 4


; See data/pokemon/evos_moves.asm

; Evolution types
EV_LEVEL EQU 1
EV_ITEM  EQU 2
EV_TRADE EQU 3

MAX_EVOLUTIONS EQU 3
EVOLUTION_SIZE EQU 4
