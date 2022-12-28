MACRO channel_count
	ASSERT 0 < (\1) && (\1) <= NUM_MUSIC_CHANS, \
		"channel_count must be 1-{d:NUM_MUSIC_CHANS}"
	DEF _num_channels = \1 - 1
ENDM

MACRO channel
	ASSERT 0 < (\1) && (\1) <= NUM_CHANNELS, \
		"channel id must be 1-{d:NUM_CHANNELS}"
	dn (_num_channels << 2), \1 - 1 ; channel id
	dw \2 ; address
	DEF _num_channels = 0
ENDM

	const_def $10

; arguments: length [0, 7], pitch change [-7, 7]
; length: length of time between pitch shifts
;         sometimes used with a value >7 in which case the MSB is ignored
; pitch change: positive value means increase in pitch, negative value means decrease in pitch
;               small magnitude means quick change, large magnitude means slow change
;               in signed magnitude representation, so a value of 8 is the same as (negative) 0
	const pitch_sweep_cmd ; $10
MACRO pitch_sweep
	db pitch_sweep_cmd
	IF \2 < 0
		dn \1, %1000 | (\2 * -1)
	ELSE
		dn \1, \2
	ENDC
ENDM

	const_next $20

	const sfx_note_cmd ; $20

; arguments: length [0, 15], volume [0, 15], fade [-7, 7], frequency
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
DEF square_note_cmd EQU sfx_note_cmd ; $20
MACRO square_note
	db square_note_cmd | \1
	IF \3 < 0
		dn \2, %1000 | (\3 * -1)
	ELSE
		dn \2, \3
	ENDC
	dw \4
ENDM

; arguments: length [0, 15], volume [0, 15], fade [-7, 7], frequency
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
DEF noise_note_cmd EQU sfx_note_cmd ; $20
MACRO noise_note
	db noise_note_cmd | \1
	IF \3 < 0
		dn \2, %1000 | (\3 * -1)
	ELSE
		dn \2, \3
	ENDC
	db \4
ENDM

; arguments: pitch, length [1, 16]
MACRO note
	dn \1, \2 - 1
ENDM

	const_next $b0

; arguments: instrument [1, 19], length [1, 16]
	const drum_note_cmd ; $b0
MACRO drum_note
	db drum_note_cmd | (\2 - 1)
	db \1
ENDM

; arguments: instrument, length [1, 16]
; like drum_note but one 1 byte instead of 2
; can only be used with instruments 1-10, excluding 2
; unused
MACRO drum_note_short
	note \1, \2
ENDM

	const_next $c0

; arguments: length [1, 16]
	const rest_cmd ; $c0
MACRO rest
	db rest_cmd | (\1 - 1)
ENDM

	const_next $d0

; arguments: speed [0, 15], volume [0, 15], fade [-7, 7]
; fade: positive value means decrease in volume, negative value means increase in volume
;       small magnitude means quick change, large magnitude means slow change
;       in signed magnitude representation, so a value of 8 is the same as (negative) 0
	const note_type_cmd ; $d0
MACRO note_type
	db note_type_cmd | \1
	IF \3 < 0
		dn \2, %1000 | (\3 * -1)
	ELSE
		dn \2, \3
	ENDC
ENDM

; arguments: speed [0, 15]
DEF drum_speed_cmd EQU note_type_cmd ; $d0
MACRO drum_speed
	db drum_speed_cmd | \1
ENDM

	const_next $e0

; arguments: octave [1, 8]
	const octave_cmd ; $e0
MACRO octave
	db octave_cmd | (8 - \1)
ENDM

	const_next $e8

; when enabled, effective frequency used is incremented by 1
	const toggle_perfect_pitch_cmd ; $e8
MACRO toggle_perfect_pitch
	db toggle_perfect_pitch_cmd
ENDM

	const_skip ; $e9

; arguments: delay [0, 255], depth [0, 15], rate [0, 15]
; delay: time delay until vibrato effect begins
; depth: amplitude of vibrato wave
; rate: frequency of vibrato wave
	const vibrato_cmd ; $ea
MACRO vibrato
	db vibrato_cmd
	db \1
	dn \2, \3
ENDM

; arguments: length [1, 256], octave [1, 8], pitch
	const pitch_slide_cmd ; $eb
MACRO pitch_slide
	db pitch_slide_cmd
	db \1 - 1
	dn 8 - \2, \3
ENDM

; arguments: duty cycle [0, 3] (12.5%, 25%, 50%, 75%)
	const duty_cycle_cmd ; $ec
MACRO duty_cycle
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
MACRO tempo
	db tempo_cmd
	db HIGH(\1), LOW(\1)
ENDM

; arguments: left output enable mask, right output enable mask
	const stereo_panning_cmd ; $ee
MACRO stereo_panning
	db stereo_panning_cmd
	dn \1, \2
ENDM

	const unknownmusic0xef_cmd ; $ef
MACRO unknownmusic0xef
	db unknownmusic0xef_cmd
	db \1
ENDM

; arguments: left master volume [0, 7], right master volume [0, 7]
	const volume_cmd ; $f0
MACRO volume
	db volume_cmd
	dn \1, \2
ENDM

	const_next $f8

; when enabled, the sfx data is interpreted as music data
	const execute_music_cmd ; $f8
MACRO execute_music
	db execute_music_cmd
ENDM

	const_next $fc

; arguments: duty cycle 1, duty cycle 2, duty cycle 3, duty cycle 4
	const duty_cycle_pattern_cmd ; $fc
MACRO duty_cycle_pattern
	db duty_cycle_pattern_cmd
	db \1 << 6 | \2 << 4 | \3 << 2 | \4
ENDM

; arguments: address
	const sound_call_cmd ; $fd
MACRO sound_call
	db sound_call_cmd
	dw \1
ENDM

; arguments: count, address
	const sound_loop_cmd ; $fe
MACRO sound_loop
	db sound_loop_cmd
	db \1
	dw \2
ENDM

	const sound_ret_cmd ; $ff
MACRO sound_ret
	db sound_ret_cmd
ENDM
