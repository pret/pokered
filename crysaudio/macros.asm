MACRO bigdw ; big-endian word
	db HIGH(\1), LOW(\1)
ENDM

MACRO maskbits
; masks just enough bits to cover values 0 to \1 - 1
; \2 is an optional shift amount
; e.g. "maskbits 26" becomes "and %00011111" (since 26 - 1 = %00011001)
; and "maskbits 3, 2" becomes "and %00001100" (since "maskbits 3" becomes %00000011)
; example usage in rejection sampling:
; .loop
; 	call Random
; 	maskbits 26
; 	cp 26
; 	jr nc, .loop
	assert 0 < (\1) && (\1) <= $100, "bitmask must be 8-bit"
	DEF x = 1
	rept 8
		if x + 1 < (\1)
			DEF x = (x << 1) | 1
		endc
	endr
	if _NARG == 2
		and x << (\2)
	else
		and x
	endc
ENDM

MACRO channel_count
	assert 0 < (\1) && (\1) <= NUM_MUSIC_CHANS, \
		"channel_count must be 1-{d:NUM_MUSIC_CHANS}"
	DEF _num_channels = \1 - 1
ENDM

MACRO channel
	assert 0 < (\1) && (\1) <= NUM_CHANNELS, \
		"channel id must be 1-{d:NUM_CHANNELS}"
	dn (_num_channels << 2), \1 - 1 ; channel id
	dw \2 ; address
	DEF _num_channels = 0
ENDM

MACRO note
	dn (\1), (\2) - 1 ; pitch, length
ENDM

MACRO drum_note
	note \1, \2 ; drum instrument, length
ENDM

MACRO rest
	note 0, \1 ; length
ENDM

MACRO square_note
	db \1 ; length
	if \3 < 0
		dn \2, %1000 | (\3 * -1) ; volume envelope
	else
		dn \2, \3 ; volume envelope
	endc
	dw \4 ; frequency
ENDM

MACRO noise_note
	db \1 ; length
	if \3 < 0
		dn \2, %1000 | (\3 * -1) ; volume envelope
	else
		dn \2, \3 ; volume envelope
	endc
	db \4 ; frequency
ENDM

; MusicCommands indexes (see audio/engine.asm)
	const_def $d0
DEF FIRST_MUSIC_CMD EQU const_value

	const octave_cmd ; $d0
MACRO octave
	assert 1 <= (\1) && (\1) <= 8, "octave must be 1-8"
	db octave_cmd + 8 - (\1) ; octave
ENDM

	const_skip 7 ; all octave values

	const note_type_cmd ; $d8
MACRO note_type
	db note_type_cmd
	db \1 ; note length
	if _NARG >= 2
		if \3 < 0
			dn \2, %1000 | (\3 * -1) ; volume envelope
		else
			dn \2, \3 ; volume envelope
		endc
	endc
ENDM

; only valid on the noise channel
MACRO drum_speed
	note_type \1 ; note length
ENDM

	const transpose_cmd ; $d9
MACRO transpose
	db transpose_cmd
	dn \1, \2 ; num octaves, num pitches
ENDM

	const tempo_cmd ; $da
MACRO tempo
	db tempo_cmd
	bigdw \1 ; tempo
ENDM

	const duty_cycle_cmd ; $db
MACRO duty_cycle
	db duty_cycle_cmd
	db \1 ; duty cycle
ENDM

	const volume_envelope_cmd ; $dc
MACRO volume_envelope
	db volume_envelope_cmd
	if \2 < 0
		dn \1, %1000 | (\2 * -1) ; volume envelope
	else
		dn \1, \2 ; volume envelope
	endc
ENDM

	const pitch_sweep_cmd ; $dd
MACRO pitch_sweep
	db pitch_sweep_cmd
	if \2 < 0
		dn \1, %1000 | (\2 * -1) ; pitch sweep
	else
		dn \1, \2 ; pitch sweep
	endc
ENDM

	const duty_cycle_pattern_cmd ; $de
MACRO duty_cycle_pattern
	db duty_cycle_pattern_cmd
	db (\1 << 6) | (\2 << 4) | (\3 << 2) | (\4 << 0) ; duty cycle pattern
ENDM

	const toggle_sfx_cmd ; $df
MACRO toggle_sfx
	db toggle_sfx_cmd
ENDM
execute_music EQUS "toggle_sfx"

	const pitch_slide_cmd ; $e0
MACRO pitch_slide
	db pitch_slide_cmd
	db \1 - 1 ; duration
	dn 8 - \2, \3 % 12 ; octave, pitch
ENDM

	const vibrato_cmd ; $e1
MACRO vibrato
	db vibrato_cmd
	db \1 ; delay
	if _NARG > 2
		dn \2, \3 ; extent, rate
	else
		db \2 ; LEGACY: Support for 1-arg extent
	endc
ENDM

	const unknownmusic0xe2_cmd ; $e2
MACRO unknownmusic0xe2
	db unknownmusic0xe2_cmd
	db \1 ; unknown
ENDM

	const toggle_noise_cmd ; $e3
MACRO toggle_noise
	db toggle_noise_cmd
	if _NARG > 0
		db \1 ; drum kit
	endc
ENDM

	const force_stereo_panning_cmd ; $e4
MACRO force_stereo_panning
	db force_stereo_panning_cmd
	dn %1111 * (1 && \1), %1111 * (1 && \2) ; left enable, right enable
ENDM

	const volume_cmd ; $e5
MACRO volume
	db volume_cmd
	if _NARG > 1
		dn \1, \2 ; left volume, right volume
	else
		db \1 ; LEGACY: Support for 1-arg volume
	endc
ENDM

	const pitch_offset_cmd ; $e6
MACRO pitch_offset
	db pitch_offset_cmd
	bigdw \1 ; pitch offset
ENDM
toggle_perfect_pitch EQUS "pitch_offset 1"

	const unknownmusic0xe7_cmd ; $e7
MACRO unknownmusic0xe7
	db unknownmusic0xe7_cmd
	db \1 ; unknown
ENDM

	const unknownmusic0xe8_cmd ; $e8
MACRO unknownmusic0xe8
	db unknownmusic0xe8_cmd
	db \1 ; unknown
ENDM

	const tempo_relative_cmd ; $e9
MACRO tempo_relative
	db tempo_relative_cmd
	bigdw \1 ; tempo adjustment
ENDM

	const restart_channel_cmd ; $ea
MACRO restart_channel
	db restart_channel_cmd
	dw \1 ; address
ENDM

	const new_song_cmd ; $eb
MACRO new_song
	db new_song_cmd
	bigdw \1 ; id
ENDM

	const sfx_priority_on_cmd ; $ec
MACRO sfx_priority_on
	db sfx_priority_on_cmd
ENDM

	const sfx_priority_off_cmd ; $ed
MACRO sfx_priority_off
	db sfx_priority_off_cmd
ENDM

	const unknownmusic0xee_cmd ; $ee
MACRO unknownmusic0xee
	db unknownmusic0xee_cmd
	dw \1 ; address
ENDM

	const stereo_panning_cmd ; $ef
MACRO stereo_panning
	db stereo_panning_cmd
	dn %1111 * (1 && \1), %1111 * (1 && \2) ; left enable, right enable
ENDM

	const sfx_toggle_noise_cmd ; $f0
MACRO sfx_toggle_noise
	db sfx_toggle_noise_cmd
	if _NARG > 0
		db \1 ; drum kit
	endc
ENDM

	const music0xf1_cmd ; $f1
MACRO music0xf1
	db music0xf1_cmd
ENDM

	const music0xf2_cmd ; $f2
MACRO music0xf2
	db music0xf2_cmd
ENDM

	const music0xf3_cmd ; $f3
MACRO music0xf3
	db music0xf3_cmd
ENDM

	const music0xf4_cmd ; $f4
MACRO music0xf4
	db music0xf4_cmd
ENDM

	const music0xf5_cmd ; $f5
MACRO music0xf5
	db music0xf5_cmd
ENDM

	const music0xf6_cmd ; $f6
MACRO music0xf6
	db music0xf6_cmd
ENDM

	const music0xf7_cmd ; $f7
MACRO music0xf7
	db music0xf7_cmd
ENDM

	const music0xf8_cmd ; $f8
MACRO music0xf8
	db music0xf8_cmd
ENDM

	const unknownmusic0xf9_cmd ; $f9
MACRO unknownmusic0xf9
	db unknownmusic0xf9_cmd
ENDM

	const set_condition_cmd ; $fa
MACRO set_condition
	db set_condition_cmd
	db \1 ; condition
ENDM

	const sound_jump_if_cmd ; $fb
MACRO sound_jump_if
	db sound_jump_if_cmd
	db \1 ; condition
	dw \2 ; address
ENDM

	const sound_jump_cmd ; $fc
MACRO sound_jump
	db sound_jump_cmd
	dw \1 ; address
ENDM

	const sound_loop_cmd ; $fd
MACRO sound_loop
	db sound_loop_cmd
	db \1 ; count
	dw \2 ; address
ENDM

	const sound_call_cmd ; $fe
MACRO sound_call
	db sound_call_cmd
	dw \1 ; address
ENDM

	const sound_ret_cmd ; $ff
MACRO sound_ret
	db sound_ret_cmd
ENDM

; custom commands:

MACRO load_wave
	db $f3
	IF _NARG > 16
		REPT 16
		dn \1, \2
		SHIFT
		SHIFT
		ENDR
	ELSE
		REPT 16
		db \1
		SHIFT
		ENDR
	ENDC
ENDM

MACRO inc_octave
	db $f4
ENDM

MACRO dec_octave
	db $f5
ENDM

MACRO speed
	db $f6, \1
ENDM

MACRO channel_volume
	db $f7, \1
ENDM

MACRO fade_wave
	db $f8, \1
ENDM
