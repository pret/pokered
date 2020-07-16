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

	const_def $10

; arguments: length [0, 7], pitch change [-7, 7]
; length: length of time between pitch shifts
;         sometimes used with a value >7 in which case the MSB is ignored
; pitch change: positive value means increase in pitch, negative value means decrease in pitch
;               small magnitude means quick change, large magnitude means slow change
;               in signed magnitude representation, so a value of 8 is the same as (negative) 0
	const pitch_sweep_cmd ; $10
pitch_sweep: MACRO
	db pitch_sweep_cmd
	IF \2 < 0
		db (\1 << 4) | (%1000 | (\2 * -1))
	ELSE
		db (\1 << 4) | \2
	ENDC
ENDM

	const_next $20

	const sfx_note_cmd ; $20

; arguments: length [0, 15], volume [0, 15], fade [-7, 7], frequency
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
square_note_cmd EQU sfx_note_cmd ; $20
square_note: MACRO
	db square_note_cmd | \1
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
noise_note_cmd EQU sfx_note_cmd ; $20
noise_note: MACRO
	db noise_note_cmd | \1
	IF \3 < 0
		db (\2 << 4) | (%1000 | (\3 * -1))
	ELSE
		db (\2 << 4) | \3
	ENDC
	db \4
ENDM

; arguments: pitch, length [1, 16]
note: MACRO
	db (\1 << 4) | (\2 - 1)
ENDM

	const_next $b0

; arguments: instrument [1, 19], length [1, 16]
	const drum_note_cmd ; $b0
drum_note: MACRO
	db drum_note_cmd | (\2 - 1)
	db \1
ENDM

; arguments: instrument, length [1, 16]
; like drum_note but one 1 byte instead of 2
; can only be used with instruments 1-10, excluding 2
; unused
drum_note_short: MACRO
	db (\1 << 4) | (\2 - 1)
ENDM

	const_next $c0

; arguments: length [1, 16]
	const rest_cmd ; $c0
rest: MACRO
	db rest_cmd | (\1 - 1)
ENDM

	const_next $d0

; arguments: speed [0, 15], volume [0, 15], fade [-7, 7]
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
	const note_type_cmd ; $d0
note_type: MACRO
	db note_type_cmd | \1
	IF \3 < 0
		db (\2 << 4) | (%1000 | (\3 * -1))
	ELSE
		db (\2 << 4) | \3
	ENDC
ENDM

; arguments: speed [0, 15]
drum_speed_cmd EQU note_type_cmd ; $d0
drum_speed: MACRO
	db drum_speed_cmd | \1
ENDM

	const_next $e0

; arguments: octave [1, 8]
	const octave_cmd ; $e0
octave: MACRO
	db octave_cmd | (8 - \1)
ENDM

	const_next $e8

; when enabled, effective frequency used is incremented by 1
	const toggle_perfect_pitch_cmd ; $e8
toggle_perfect_pitch: MACRO
	db toggle_perfect_pitch_cmd
ENDM

	const_skip ; $e9

; arguments: delay [0, 255], depth [0, 15], rate [0, 15]
; delay: time delay until vibrato effect begins
; depth: amplitude of vibrato wave
; rate: frequency of vibrato wave
	const vibrato_cmd ; $ea
vibrato: MACRO
	db vibrato_cmd
	db \1
	db (\2 << 4) | \3
ENDM

; arguments: length [1, 256], octave [1, 8], pitch
	const pitch_slide_cmd ; $eb
pitch_slide: MACRO
	db pitch_slide_cmd
	db \1 - 1
	db ((8 - \2) << 4) | \3
ENDM

; arguments: duty cycle [0, 3] (12.5%, 25%, 50%, 75%)
	const duty_cycle_cmd ; $ec
duty_cycle: MACRO
	db duty_cycle_cmd
	db \1
ENDM

; arguments: tempo [0, $ffff]
; used to calculate note delay counters
; so a smaller value means music plays faster
; ideally should be set to $100 or less to guarantee no overflow
; if larger than $100, large note speed or note length values might cause overflow
; stored in big endian
	const tempo_cmd ; $ed
tempo: MACRO
	db tempo_cmd
	db HIGH(\1), LOW(\1)
ENDM

; arguments: left output enable mask, right output enable mask
	const stereo_panning_cmd ; $ee
stereo_panning: MACRO
	db stereo_panning_cmd
	db (\1 << 4) | \2
ENDM

	const unknownmusic0xef_cmd ; $ef
unknownmusic0xef: MACRO
	db unknownmusic0xef_cmd
	db \1
ENDM

; arguments: left master volume [0, 7], right master volume [0, 7]
	const volume_cmd ; $f0
volume: MACRO
	db volume_cmd
	db (\1 << 4) | \2
ENDM

	const_next $f8

; when enabled, the sfx data is interpreted as music data
	const execute_music_cmd ; $f8
execute_music: MACRO
	db execute_music_cmd
ENDM

	const_next $fc

; arguments: duty cycle 1, duty cycle 2, duty cycle 3, duty cycle 4
	const duty_cycle_pattern_cmd ; $fc
duty_cycle_pattern: MACRO
	db duty_cycle_pattern_cmd
	db \1 << 6 | \2 << 4 | \3 << 2 | \4
ENDM

; arguments: address
	const sound_call_cmd ; $fd
sound_call: MACRO
	db sound_call_cmd
	dw \1
ENDM

; arguments: count, address
	const sound_loop_cmd ; $fe
sound_loop: MACRO
	db sound_loop_cmd
	db \1
	dw \2
ENDM

	const sound_ret_cmd ; $ff
sound_ret: MACRO
	db sound_ret_cmd
ENDM
