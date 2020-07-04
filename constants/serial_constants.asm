ESTABLISH_CONNECTION_WITH_INTERNAL_CLOCK EQU $01
ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK EQU $02

USING_EXTERNAL_CLOCK       EQU $01
USING_INTERNAL_CLOCK       EQU $02
CONNECTION_NOT_ESTABLISHED EQU $ff

; signals the start of an array of bytes transferred over the link cable
SERIAL_PREAMBLE_BYTE EQU $FD

; this byte is used when there is no data to send
SERIAL_NO_DATA_BYTE EQU $FE

; signals the end of one part of a patch list (there are two parts) for player/enemy party data
SERIAL_PATCH_LIST_PART_TERMINATOR EQU $FF

LINK_STATE_NONE          EQU $00 ; not using link
LINK_STATE_IN_CABLE_CLUB EQU $01 ; in a cable club room (Colosseum or Trade Centre)
LINK_STATE_START_TRADE   EQU $02 ; pre-trade selection screen initialisation
LINK_STATE_START_BATTLE  EQU $03 ; pre-battle initialisation
LINK_STATE_BATTLING      EQU $04 ; in a link battle
LINK_STATE_RESET         EQU $05 ; reset game (unused)
LINK_STATE_TRADING       EQU $32 ; in a link trade

LINKBATTLE_RUN       EQU $F
LINKBATTLE_STRUGGLE  EQU $E
LINKBATTLE_NO_ACTION EQU $D
