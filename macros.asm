
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
	
; macro for two nibbles
dn: MACRO
	db (\1 << 4 | \2)
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

; text engine command $1
TX_RAM: MACRO
; prints text to screen
; \1: RAM address to read from
	db $1
	dw \1
	ENDM

; Predef macro.
PREDEF: MACRO
	ld a, (\1 - PredefPointers) / 3
	call Predef
	ENDM
	
PREDEF_JUMP: MACRO
	ld a, (\1 - PredefPointers) / 3
	jp Predef
	ENDM



;1_channel	EQU $00
;2_channels	EQU $40
;3_channels	EQU $80
;4_channels	EQU $C0

CH0		EQU 0
CH1		EQU 1
CH2		EQU 2
CH3		EQU 3
CH4		EQU 4
CH5		EQU 5
CH6		EQU 6
CH7		EQU 7

;Note Pitch
C_		EQU $0
C#		EQU $1
D_		EQU $2
D#		EQU $3
E_		EQU $4
F_		EQU $5
F#		EQU $6
G_		EQU $7
G#		EQU $8
A_		EQU $9
A#		EQU $A
B_		EQU $B

;drum instruments
snare1		EQU $01
snare2		EQU $02
snare3		EQU $03
snare4		EQU $04
snare5		EQU $05
triangle1	EQU $06
triangle2	EQU $07
snare6		EQU $08
snare7		EQU $09
snare8		EQU $0a
snare9		EQU $0b
cymbal1		EQU $0c
cymbal2		EQU $0d
cymbal3		EQU $0e
mutedsnare1	EQU $0f
triangle3	EQU $10
mutedsnare2	EQU $11
mutedsnare3	EQU $12
mutedsnare4	EQU $13

unknownsfx0x10: MACRO
	db $10
	db \1
ENDM

unknownsfx0x20: MACRO
	db $20 | \1
	db \2
	db \3
	db \4
ENDM

unknownnoise0x20: MACRO
	db $20 | \1
	db \2
	db \3
ENDM

;format: note pitch, length (in 16ths)
note: MACRO
	db (\1 << 4) | (\2 - 1)
ENDM

;format: dnote length (in 16ths), instrument
dnote: MACRO
	db $B0 | (\1 - 1)
	db \2
ENDM

;format: rest length (in 16ths)
rest: MACRO
	db $C0 | (\1 - 1)
ENDM

; format: notetype speed, volume, fade
notetype: MACRO
	db	$D0 | \1
	db	(\2 << 4) | \3
ENDM

dspeed: MACRO
	db $D0 | \1
ENDM

octave: MACRO
	db $E8 - \1
ENDM

togglecall: MACRO
	db $E8
ENDM

;format: vibrato delay, rate, depth
vibrato: MACRO
	db $EA
	db \1
	db (\2 << 4) | \3
ENDM

pitchbend: MACRO
	db $EB
	db \1
	db \2
ENDM

duty: MACRO
	db $EC
	db \1
ENDM

tempo: MACRO
	db $ED
	db \1
	db \2
ENDM

unknownmusic0xee: MACRO
	db $EE
	db \1
ENDM

stereopanning: MACRO
	db $F0
	db \1
ENDM

executemusic: MACRO
	db $F8
ENDM

dutycycle: MACRO
	db $FC
	db \1
ENDM

;format: callchannel address
;callchannel: MACRO
;	db $FD
;	dw \1
;ENDM

;format: loopchannel count, address
;loopchannel: MACRO
;	db $FE
;	db \1
;	dw \2
;ENDM

endchannel: MACRO
	db $FF
ENDM

