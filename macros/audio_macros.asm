
StopAllMusic: MACRO
	ld a, $ff
	call PlaySound
ENDM

Ch1    EQU 0
Ch2    EQU 1
Ch3    EQU 2
Ch4    EQU 3
Ch5    EQU 4
Ch6    EQU 5
Ch7    EQU 6
Ch8    EQU 7

audio_header: MACRO
	db (_NARG - 2) << 6 | \2
	dw \1_\2
	IF _NARG > 2
		db \3
		dw \1_\3
	ENDC
	IF _NARG > 3
		db \4
		dw \1_\4
	ENDC
	IF _NARG > 4
		db \5
		dw \1_\5
	ENDC
ENDM

; arguments: length [0, 7], pitch change [-7, 7]
; length: length of time between pitch shifts
;         sometimes used with a value >7 in which case the MSB is ignored
; pitch change: positive value means increase in pitch, negative value means decrease in pitch
;               small magnitude means quick change, large magnitude means slow change
;               in signed magnitude representation, so a value of 8 is the same as (negative) 0
pitch_sweep: MACRO
	db $10
	IF \2 < 0
		db (\1 << 4) | (%1000 | (\2 * -1))
	ELSE
		db (\1 << 4) | \2
	ENDC
ENDM

; arguments: length [0, 15], volume [0, 15], fade [-7, 7], frequency
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
square_note: MACRO
	db $20 | \1
	IF \3 < 0
		db (\2 << 4) | (%1000 | (\3 * -1))
	ELSE
		db (\2 << 4) | \3
	ENDC
	dw \4
ENDM

; arguments: length [0, 15], volume [0, 15], fade [-7, 7], frequency
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
noise_note: MACRO
	db $20 | \1
	IF \3 < 0
		db (\2 << 4) | (%1000 | (\3 * -1))
	ELSE
		db (\2 << 4) | \3
	ENDC
	db \4
ENDM

C_ EQU $0
C# EQU $1
D_ EQU $2
D# EQU $3
E_ EQU $4
F_ EQU $5
F# EQU $6
G_ EQU $7
G# EQU $8
A_ EQU $9
A# EQU $A
B_ EQU $B

; arguments: pitch, length [1, 16]
note: MACRO
	db (\1 << 4) | (\2 - 1)
ENDM

; arguments: instrument [1, 19], length [1, 16]
drum_note: MACRO
	db $B0 | (\2 - 1)
	db \1
ENDM

; arguments: instrument, length [1, 16]
; like drum_note but one 1 byte instead of 2
; can only be used with instruments 1-10, excluding 2
; unused
drum_note_short: MACRO
	db (\1 << 4) | (\2 - 1)
ENDM

; arguments: length [1, 16]
rest: MACRO
	db $C0 | (\1 - 1)
ENDM

; arguments: speed [0, 15], volume [0, 15], fade [-7, 7]
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
note_type: MACRO
	db $D0 | \1
	IF \3 < 0
		db (\2 << 4) | (%1000 | (\3 * -1))
	ELSE
		db (\2 << 4) | \3
	ENDC
ENDM

; arguments: speed [0, 15]
drum_speed: MACRO
	db $D0 | \1
ENDM

; arguments: octave [1, 8]
octave: MACRO
	db $E8 - \1
ENDM

; when enabled, effective frequency used is incremented by 1
toggle_perfect_pitch: MACRO
	db $E8
ENDM

; arguments: delay [0, 255], depth [0, 15], rate [0, 15]
; delay: time delay until vibrato effect begins
; depth: amplitude of vibrato wave
; rate: frequency of vibrato wave
vibrato: MACRO
	db $EA
	db \1
	db (\2 << 4) | \3
ENDM

; arguments: length [1, 256], octave [1, 8], pitch
pitch_slide: MACRO
	db $EB
	db \1 - 1
	db ((8 - \2) << 4) | \3
ENDM

; arguments: duty cycle [0, 3] (12.5%, 25%, 50%, 75%)
duty_cycle: MACRO
	db $EC
	db \1
ENDM

; arguments: tempo [0, $ffff]
; used to calculate note delay counters
; so a smaller value means music plays faster
; ideally should be set to $100 or less to guarantee no overflow
; if larger than $100, large note speed or note length values might cause overflow
; stored in big endian
tempo: MACRO
	db $ED
	db \1 / $100
	db \1 % $100
ENDM

; arguments: left output enable mask, right output enable mask
stereo_panning: MACRO
	db $EE
	db (\1 << 4) | \2
ENDM

; arguments: left master volume [0, 7], right master volume [0, 7]
volume: MACRO
	db $F0
	db (\1 << 4) | \2
ENDM

; when enabled, the sfx data is interpreted as music data
execute_music: MACRO
	db $F8
ENDM

; arguments: duty cycle 1, duty cycle 2, duty cycle 3, duty cycle 4
duty_cycle_pattern: MACRO
	db $FC
	db \1 << 6 | \2 << 4 | \3 << 2 | \4
ENDM

; arguments: address
sound_call: MACRO
	db $FD
	dw \1
ENDM

; arguments: count, address
sound_loop: MACRO
	db $FE
	db \1
	dw \2
ENDM

sound_ret: MACRO
	db $FF
ENDM
