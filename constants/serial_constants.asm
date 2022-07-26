DEF ESTABLISH_CONNECTION_WITH_INTERNAL_CLOCK EQU $01
DEF ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK EQU $02

DEF USING_EXTERNAL_CLOCK       EQU $01
DEF USING_INTERNAL_CLOCK       EQU $02
DEF CONNECTION_NOT_ESTABLISHED EQU $ff

; signals the start of an array of bytes transferred over the link cable
DEF SERIAL_PREAMBLE_BYTE EQU $FD

; this byte is used when there is no data to send
DEF SERIAL_NO_DATA_BYTE  EQU $FE

; signals the end of one part of a patch list (there are two parts) for player/enemy party data
DEF SERIAL_PATCH_LIST_PART_TERMINATOR EQU $FF

DEF SERIAL_PREAMBLE_LENGTH    EQU 6
DEF SERIAL_RN_PREAMBLE_LENGTH EQU 7
DEF SERIAL_RNS_LENGTH         EQU 10

DEF LINK_STATE_NONE          EQU $00 ; not using link
DEF LINK_STATE_IN_CABLE_CLUB EQU $01 ; in a cable club room (Colosseum or Trade Centre)
DEF LINK_STATE_START_TRADE   EQU $02 ; pre-trade selection screen initialisation
DEF LINK_STATE_START_BATTLE  EQU $03 ; pre-battle initialisation
DEF LINK_STATE_BATTLING      EQU $04 ; in a link battle
DEF LINK_STATE_RESET         EQU $05 ; reset game (unused)
DEF LINK_STATE_TRADING       EQU $32 ; in a link trade

DEF LINKBATTLE_RUN       EQU $F
DEF LINKBATTLE_STRUGGLE  EQU $E
DEF LINKBATTLE_NO_ACTION EQU $D
