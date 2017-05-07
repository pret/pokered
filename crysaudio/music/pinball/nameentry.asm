Music_Pinballnameentry: ; 4d52c
	dbw $c0, Music_Pinballnameentry_Ch1
	dbw $01, Music_Pinballnameentry_Ch2
	dbw $02, Music_Pinballnameentry_Ch3
	dbw $03, Music_Pinballnameentry_Ch4
; 4d538

Music_Pinballnameentry_Ch1: ; 4d538
	tempo 144
	volume $77
	dutycycle $3
	vibrato $18, $34
	tone $0001
	notetype $c, $88
	note __, 12
	octave 4
	note C_, 4
	notetype $8, $a8
	octave 3
	note A_, 4
	note B_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 3
	octave 3
	note B_, 6
	octave 4
	note C#, 1
	note __, 1
	note D#, 3
	note __, 3
Music_Pinballnameentry_branch_4d55c: ; 4d55c
	dutycycle $2
	intensity $68
	forceoctave $7
	callchannel Music_Pinballnameentry_branch_4d80d
	forceoctave $5
	callchannel Music_Pinballnameentry_branch_4d80d
	callchannel Music_Pinballnameentry_branch_4d80d
Music_Pinballnameentry_branch_4d56d: ; 4d56d
	forceoctave $3
	callchannel Music_Pinballnameentry_branch_4d80d
	loopchannel 3, Music_Pinballnameentry_branch_4d56d
	forceoctave $0
	callchannel Music_Pinballnameentry_branch_4d80d
	octave 3
	note C#, 4
	note __, 2
	note C#, 2
	note __, 2
	note C_, 4
	note __, 10
	intensity $88
	octave 4
	note C_, 1
	note C#, 3
	note F_, 1
	note __, 1
	intensity $81
	octave 6
	note C#, 2
	octave 5
	note G#, 2
	note F_, 14
	intensity $88
	octave 3
	note B_, 1
	octave 4
	note C_, 3
	intensity $81
	note D#, 2
	octave 6
	note C_, 2
	octave 5
	note G#, 2
	note D#, 14
	intensity $88
	octave 3
	note A#, 1
	note B_, 3
	octave 4
	note D#, 1
	note __, 1
	intensity $81
	octave 5
	note B_, 2
	note F#, 2
	note D#, 6
	intensity $88
	octave 4
	note G#, 6
	note F_, 1
	note __, 1
	note A#, 4
	note G#, 1
	note __, 1
	intensity $81
	octave 6
	note C#, 2
	octave 5
	note A#, 2
	intensity $88
	octave 4
	note F#, 6
	note __, 2
	intensity $81
	note A#, 2
	note F#, 2
	note C#, 2
	intensity $88
	octave 3
	note G#, 1
	note A_, 3
	octave 4
	note C#, 1
	note __, 1
	intensity $81
	octave 6
	note C#, 2
	octave 5
	note A_, 2
	note F#, 6
	intensity $88
	octave 4
	note F#, 1
	note __, 1
	note G#, 4
	note F#, 1
	note __, 1
	intensity $88
	octave 3
	note G_, 1
	note G#, 3
	intensity $98
	octave 4
	note F_, 1
	note __, 7
	intensity $88
	octave 3
	note G#, 1
	intensity $14
	note G#, 1
	intensity $88
	octave 4
	note C#, 1
	intensity $14
	note C#, 1
	intensity $88
	note G#, 1
	intensity $14
	note G#, 1
	intensity $98
	octave 5
	note C#, 5
	intensity $88
	note D_, 1
	note D#, 8
	note __, 2
	octave 4
	note A#, 2
	note G_, 4
	note D#, 1
	note __, 5
	note G_, 1
	note __, 1
	intensity $78
	octave 3
	note C_, 1
	intensity $14
	note C_, 1
	intensity $78
	note D#, 1
	intensity $14
	note D#, 1
	intensity $78
	note G#, 1
	intensity $14
	note G#, 1
	intensity $78
	octave 4
	note C_, 1
	intensity $14
	note C_, 1
	intensity $78
	note D#, 1
	intensity $14
	note D#, 1
	intensity $98
	note F#, 8
	intensity $14
	note F#, 2
	note __, 4
	intensity $73
	octave 3
	note G_, 1
	note G#, 3
	note B_, 1
	note __, 1
	octave 4
	note C#, 4
	note D#, 1
	note __, 4
	note D_, 1
	note D#, 2
	note E_, 4
	octave 3
	note B_, 2
	octave 4
	note D_, 1
	note D#, 5
	note __, 3
	note F_, 1
	note F#, 2
	note D#, 2
	intensity $71
	octave 5
	note D#, 4
	note D#, 2
	note D_, 2
	note C#, 2
	intensity $73
	octave 4
	note F#, 4
	intensity $71
	note B_, 2
	intensity $73
	note F#, 4
	intensity $71
	note B_, 5
	intensity $73
	note D_, 1
	note D#, 2
	octave 3
	note B_, 4
	octave 4
	note D#, 2
	note C#, 4
	note __, 2
	octave 3
	note B_, 4
	note __, 2
	note G#, 4
	note __, 2
	octave 4
	note F_, 4
	note __, 2
	intensity $71
	note C#, 2
	note F#, 2
	note C#, 2
	intensity $73
	note F#, 4
	intensity $71
	note C#, 2
	intensity $73
	note F#, 4
	intensity $71
	note C#, 2
	intensity $73
	octave 3
	note A_, 4
	octave 4
	note C#, 2
	intensity $73
	note F_, 4
	intensity $71
	octave 5
	note C#, 2
	intensity $73
	octave 4
	note F_, 4
	intensity $71
	octave 5
	note C#, 2
	intensity $73
	octave 3
	note G#, 1
	note A_, 3
	octave 4
	note C#, 1
	note __, 1
	note C#, 4
	note E_, 1
	note __, 1
	intensity $71
	note C#, 2
	note E_, 2
	note C#, 2
	intensity $73
	note E_, 4
	intensity $71
	note C#, 2
	intensity $73
	note D#, 1
	note E_, 3
	note C#, 1
	note __, 1
	octave 3
	note B_, 4
	octave 4
	note C#, 2
	intensity $74
	note F#, 6
	note __, 6
	octave 3
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	octave 5
	note D#, 1
	dutycycle $3
	intensity $84
	octave 4
	note E_, 4
	octave 3
	note B_, 1
	note __, 1
	note A_, 4
	note G#, 1
	note __, 5
	note G#, 1
	note __, 1
	note A_, 4
	note B_, 2
	octave 4
	note D#, 6
	note __, 2
	note D_, 2
	note C#, 2
	note C_, 2
	note __, 2
	octave 3
	note B_, 2
	note A#, 2
	note __, 2
	note A_, 2
	note G#, 4
	note G_, 1
	note __, 1
	note G#, 4
	octave 4
	note C#, 1
	note D_, 5
	note C#, 6
	octave 3
	note G#, 2
	note B_, 6
	note G#, 4
	note __, 2
	octave 4
	note F#, 4
	note F_, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note F#, 2
	octave 3
	note F#, 4
	note G#, 2
	note A_, 4
	note B_, 6
	note A_, 2
	note G#, 4
	intensity $87
	note A_, 10
	intensity $84
	note B_, 2
	octave 4
	note C#, 2
	note F_, 2
	note __, 2
	note A_, 2
	note C#, 2
	note __, 2
	octave 5
	note C#, 2
	octave 4
	note B_, 4
	note A_, 2
	note G#, 4
	note F#, 2
	note E_, 4
	note D#, 2
	note E_, 4
	note F#, 2
	intensity $88
	note A_, 1
	intensity $28
	note A_, 1
	intensity $88
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $88
	octave 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $88
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $88
	octave 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $88
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $88
	octave 4
	note E_, 1
	intensity $28
	note E_, 1
	intensity $88
	note A_, 1
	intensity $28
	note A_, 1
	intensity $88
	note E_, 1
	intensity $28
	note E_, 1
	intensity $88
	note A_, 1
	intensity $28
	note A_, 1
	intensity $88
	note E_, 1
	intensity $28
	note E_, 1
	intensity $88
	note A_, 1
	intensity $28
	note A_, 1
	intensity $68
	note A_, 1
	intensity $28
	note A_, 1
	intensity $78
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $88
	octave 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $98
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $a8
	octave 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $b8
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $68
	note C_, 1
	intensity $28
	note C_, 1
	intensity $78
	note D#, 1
	intensity $28
	note D#, 1
	intensity $88
	note C_, 1
	intensity $28
	note C_, 1
	intensity $98
	note D#, 1
	intensity $28
	note D#, 1
	intensity $a8
	note C_, 1
	intensity $28
	note C_, 1
	intensity $b8
	note D#, 1
	intensity $28
	note D#, 1
	intensity $78
	octave 4
	note E_, 1
	intensity $28
	note E_, 1
	intensity $78
	note G#, 1
	intensity $28
	note G#, 1
	intensity $78
	note B_, 1
	intensity $28
	note B_, 1
	intensity $78
	octave 5
	note D#, 1
	intensity $28
	note D#, 1
	intensity $88
	note E_, 1
	intensity $28
	note E_, 1
	intensity $98
	note G#, 1
	intensity $28
	note G#, 1
	intensity $a8
	note B_, 1
	intensity $24
	note B_, 4
	dutycycle $2
	vibrato $18, $4
	intensity $78
	note A#, 1
	intensity $98
	note B_, 6
	intensity $28
	note G#, 2
	intensity $18
	note G#, 2
	note __, 2
	dutycycle $3
	vibrato $18, $34
	notetype $c, $88
	note __, 8
	octave 3
	note B_, 4
	notetype $8, $a8
	note E_, 4
	note F#, 1
	note __, 1
	note G#, 1
	note __, 3
	note F#, 6
	note G#, 1
	note __, 1
	note A_, 4
	note B_, 1
	note __, 1
	loopchannel 0, Music_Pinballnameentry_branch_4d55c
; 4d80d

Music_Pinballnameentry_branch_4d80d: ; 4d80d
	octave 2
	note A#, 2
	note __, 4
	note A#, 2
	note __, 4
	note A#, 2
	note __, 4
	note A#, 2
	note __, 4
	endchannel
; 4d817

Music_Pinballnameentry_Ch2: ; 4d817
	dutycycle $3
	vibrato $18, $34
	notetype $8, $a8
	octave 3
	note A#, 4
	octave 4
	note C_, 1
	intensity $28
	note C_, 1
	intensity $a8
	note C#, 1
	intensity $28
	note C#, 1
	note __, 2
	intensity $a8
	note C_, 6
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	note D#, 6
	note C#, 4
	note D#, 1
	intensity $28
	note D#, 1
	intensity $a8
	note E_, 1
	intensity $28
	note E_, 1
	note __, 2
	intensity $a8
	note D#, 6
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a8
	note F#, 3
	intensity $28
	note F#, 1
	intensity $a8
	note F_, 1
	note F#, 1
Music_Pinballnameentry_branch_4d854: ; 4d854
	vibrato $18, $34
	octave 4
	note G#, 12
	intensity $28
	note G#, 2
	note __, 2
	intensity $a8
	octave 5
	note D#, 6
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	octave 4
	note G#, 12
	intensity $91
	note C_, 2
	note D#, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 1
	note F#, 1
	intensity $a8
	note G#, 12
	intensity $28
	note G#, 2
	note __, 2
	intensity $a8
	octave 5
	note D#, 6
	note C#, 1
	intensity $78
	note E_, 1
	intensity $a8
	note F_, 4
	note D#, 1
	intensity $28
	note D#, 2
	note __, 3
	intensity $a8
	note C#, 6
	intensity $28
	note C#, 1
	intensity $a8
	octave 4
	note B_, 1
	octave 5
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note C#, 2
	octave 4
	note A_, 12
	intensity $28
	note A_, 2
	note __, 2
	intensity $a8
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	note B_, 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	note G#, 8
	intensity $28
	note G#, 1
	intensity $78
	octave 5
	note C_, 1
	intensity $a8
	note C#, 8
	note F_, 5
	intensity $78
	note A_, 1
	intensity $a8
	note A#, 3
	intensity $28
	note A#, 1
	intensity $a8
	note F_, 2
	intensity $28
	note F_, 2
	note __, 2
	intensity $a8
	note D#, 2
	intensity $28
	note D#, 2
	note __, 2
	intensity $a8
	octave 4
	note A#, 2
	intensity $28
	note A#, 2
	note __, 2
	intensity $a8
	octave 5
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	octave 4
	note B_, 1
	octave 5
	note C_, 3
	note C#, 1
	intensity $28
	note C#, 2
	note __, 3
	intensity $a8
	note D#, 8
	dutycycle $2
	octave 4
	note F_, 2
	intensity $28
	note F_, 2
	intensity $a8
	note F#, 1
	intensity $28
	note F#, 1
	intensity $78
	note G_, 1
	intensity $a8
	note G#, 11
	note F_, 1
	intensity $28
	note F_, 3
	intensity $a8
	octave 5
	note D#, 6
	note C#, 2
	octave 4
	note G#, 12
	intensity $91
	note C_, 2
	note D#, 2
	note G#, 2
	intensity $93
	note F#, 2
	intensity $91
	note F_, 2
	note D#, 1
	note G_, 1
	intensity $a8
	note G#, 12
	intensity $88
	note D#, 1
	intensity $18
	note D#, 3
	intensity $a8
	octave 5
	note D#, 6
	note C#, 1
	intensity $78
	note E_, 1
	intensity $a8
	note F_, 4
	intensity $88
	note D#, 1
	intensity $18
	note D#, 2
	note __, 3
	intensity $a8
	note C#, 6
	intensity $28
	note C#, 1
	intensity $78
	octave 4
	note B_, 1
	intensity $a8
	octave 5
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note C#, 2
	octave 4
	note A_, 12
	intensity $88
	note F#, 1
	intensity $18
	note F#, 3
	intensity $a1
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	note B_, 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	note G#, 8
	intensity $28
	note G#, 2
	intensity $a8
	octave 5
	note C#, 6
	intensity $28
	note C#, 2
	intensity $a8
	note F_, 5
	intensity $78
	note A_, 1
	intensity $a8
	vibrato $18, $24
	note A#, 8
	vibrato $18, $34
	intensity $28
	note A#, 2
	intensity $a8
	note F_, 2
	note D#, 4
	octave 4
	note A#, 1
	intensity $28
	note A#, 2
	note __, 3
	intensity $a8
	octave 5
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	octave 4
	note B_, 1
	octave 5
	note C_, 3
	note C#, 1
	intensity $28
	note C#, 2
	note __, 3
	intensity $a8
	note D#, 8
	dutycycle $3
	octave 4
	note E_, 4
	note F#, 1
	intensity $28
	note F#, 1
	callchannel Music_Pinballnameentry_branch_4da64
	note F#, 4
	intensity $28
	note F#, 2
	callchannel Music_Pinballnameentry_branch_4da8d
	intensity $28
	note A_, 3
	intensity $78
	note G#, 1
	intensity $88
	note A_, 2
	intensity $a8
	note B_, 4
	octave 5
	note C#, 2
	octave 4
	note B_, 6
	intensity $28
	note B_, 2
	note __, 4
	dutycycle $2
	intensity $a8
	note F#, 1
	intensity $28
	note F#, 1
	intensity $a8
	note B_, 1
	intensity $28
	note B_, 1
	intensity $a8
	octave 5
	note D#, 1
	intensity $28
	note D#, 1
	intensity $a8
	note F#, 1
	intensity $28
	note F#, 1
	intensity $a8
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	note B_, 1
	intensity $78
	note G_, 1
	vibrato $18, $24
	forceoctave $c
	callchannel Music_Pinballnameentry_branch_4da64
	forceoctave $0
	octave 5
	note F_, 1
	note F#, 5
	forceoctave $c
	callchannel Music_Pinballnameentry_branch_4da8d
	intensity $28
	note A_, 2
	octave 5
	note __, 2
	forceoctave $0
	intensity $a8
	note A_, 2
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note F#, 2
	note E_, 12
	intensity $28
	note E_, 2
	note __, 2
	intensity $a8
	note C_, 2
	note E_, 4
	note C_, 1
	intensity $28
	note C_, 1
	intensity $a8
	note E_, 12
	note F#, 12
	note G#, 1
	note G#, 16
	intensity $78
	vibrato $18, $4
	note G_, 1
	intensity $a8
	note G#, 6
	vibrato $18, $34
	dutycycle $3
	octave 3
	note A_, 4
	note B_, 1
	intensity $28
	note B_, 1
	intensity $a8
	octave 4
	note C#, 1
	intensity $28
	note C#, 2
	note __, 1
	intensity $a8
	octave 3
	note B_, 6
	octave 4
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	note D#, 6
	note C#, 4
	note D#, 1
	intensity $28
	note D#, 1
	intensity $a8
	note E_, 1
	intensity $28
	note E_, 2
	note __, 1
	intensity $a8
	note D#, 6
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a8
	note F#, 4
	note F_, 1
	note F#, 1
	loopchannel 0, Music_Pinballnameentry_branch_4d854
; 4da64

Music_Pinballnameentry_branch_4da64: ; 4da64
	intensity $a8
	octave 4
	note G#, 12
	intensity $28
	note G#, 2
	note __, 1
	intensity $88
	note G_, 1
	intensity $a8
	note G#, 2
	note A_, 4
	note G#, 2
	note F#, 6
	intensity $28
	note F#, 3
	intensity $a8
	note A#, 1
	note B_, 10
	note A#, 2
	note A_, 2
	note G#, 12
	intensity $28
	note G#, 3
	intensity $78
	note G_, 1
	intensity $88
	note G#, 2
	intensity $a8
	note A_, 4
	note G#, 2
	endchannel
; 4da8d

Music_Pinballnameentry_branch_4da8d: ; 4da8d
	intensity $a8
	octave 4
	note F_, 4
	intensity $28
	note F_, 2
	intensity $a8
	note F#, 4
	intensity $28
	note F#, 2
	intensity $a8
	note G#, 4
	note A_, 14
	intensity $28
	note A_, 2
	note __, 2
	intensity $a8
	note A_, 2
	note G#, 4
	note F#, 2
	note B_, 8
	intensity $28
	note B_, 2
	intensity $a8
	note A_, 2
	intensity $28
	note A_, 2
	note __, 4
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note A_, 14
	endchannel
; 4dabc

Music_Pinballnameentry_Ch3: ; 4dabc
	notetype $8, $22
	octave 1
	note F#, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	octave 1
	note F#, 1
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	octave 1
	note G#, 2
	octave 3
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 3
	octave 3
	note D#, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 1
	note A_, 1
	note __, 3
	octave 3
	note E_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
Music_Pinballnameentry_branch_4daf5: ; 4daf5
	note G#, 2
	note __, 2
	note C#, 1
	note __, 1
	note G#, 2
	note __, 2
	note C#, 1
	note __, 1
	note G#, 2
	note __, 2
	note C#, 1
	note __, 1
	note G#, 2
	note __, 2
	note C#, 1
	note __, 1
	note G#, 2
	note __, 2
	note C_, 1
	note __, 1
	note G#, 2
	note __, 2
	note C_, 1
	note __, 1
	note G#, 2
	note __, 2
	note C_, 1
	note __, 1
	note G#, 2
	note __, 2
	note C_, 1
	note __, 1
	note G#, 2
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note G#, 2
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note G#, 2
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note G#, 2
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note D#, 4
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note G#, 4
	octave 3
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	notetype $8, $32
	octave 3
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 3
	notetype $8, $22
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note C#, 2
	note __, 2
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note C_, 2
	note __, 2
	note C_, 1
	note __, 1
	notetype $8, $32
	octave 3
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G#, 1
	note __, 3
	notetype $8, $22
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note C_, 2
	note __, 2
	octave 1
	note A#, 1
	note __, 1
	note B_, 2
	note __, 2
	note B_, 1
	note __, 1
	notetype $8, $32
	octave 3
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 3
	notetype $8, $22
	octave 1
	note G#, 1
	note __, 1
	note B_, 2
	note __, 2
	note A_, 1
	note __, 1
	note A#, 2
	note __, 2
	note A#, 1
	note __, 1
	notetype $8, $32
	octave 3
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	note A#, 1
	note __, 3
	notetype $8, $22
	octave 1
	note F#, 1
	note __, 1
	note A#, 2
	note __, 2
	note G#, 1
	note __, 1
	note A_, 2
	note __, 2
	note A_, 1
	note __, 1
	notetype $8, $32
	octave 3
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 3
	notetype $8, $22
	octave 1
	note F#, 1
	note __, 1
	note A_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G#, 2
	note __, 2
	note G#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 1
	note F_, 1
	note __, 1
	note G#, 2
	note __, 2
	note F#, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	octave 4
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	notetype $8, $22
	octave 1
	note G#, 2
	note __, 2
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	notetype $8, $12
	note B_, 2
	note __, 2
	octave 2
	note D#, 1
	note __, 1
	note F#, 4
	notetype $8, $32
	octave 1
	note B_, 2
	notetype $8, $22
	octave 2
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note E_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note E_, 1
	notetype $8, $32
	note D_, 1
	notetype $8, $22
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 1
	notetype $8, $32
	note C#, 1
	notetype $8, $22
	note D_, 2
	note __, 2
	note D_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D_, 2
	note __, 2
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 1
	notetype $8, $32
	note C_, 1
	notetype $8, $22
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note C#, 4
	octave 2
	note B_, 1
	note __, 5
	note G#, 2
	callchannel Music_Pinballnameentry_branch_4ddc7
	note D#, 6
	note __, 6
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note E_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note E_, 1
	notetype $8, $32
	note D_, 1
	notetype $8, $22
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note D#, 1
	notetype $8, $32
	note C#, 1
	notetype $8, $22
	note D_, 2
	note __, 2
	note D_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D_, 2
	note __, 2
	note D_, 1
	note __, 1
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note D_, 1
	notetype $8, $32
	note C_, 1
	notetype $8, $22
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note C#, 4
	octave 2
	note B_, 1
	note __, 5
	note G#, 2
	callchannel Music_Pinballnameentry_branch_4ddc7
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	notetype $8, $32
	note D#, 12
	octave 2
	note A_, 12
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note E_, 2
	note __, 3
	notetype $8, $32
	octave 2
	note D#, 1
	notetype $8, $22
	note E_, 6
	octave 1
	note A_, 3
	note __, 1
	note A_, 1
	note __, 1
	octave 2
	note E_, 1
	note __, 3
	octave 1
	note B_, 6
	octave 2
	note D#, 1
	note __, 1
	note F#, 6
	note A_, 4
	note E_, 1
	note __, 1
	note C#, 1
	note __, 3
	note B_, 6
	note F#, 1
	note __, 1
	note B_, 4
	octave 3
	note D#, 1
	note __, 1
	loopchannel 0, Music_Pinballnameentry_branch_4daf5
; 4ddc7

Music_Pinballnameentry_branch_4ddc7: ; 4ddc7
	note F#, 2
	note __, 2
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	note F#, 2
	note __, 2
	note F#, 1
	note __, 1
	note C#, 2
	note __, 2
	note F#, 1
	notetype $8, $32
	note E_, 1
	notetype $8, $22
	note F_, 2
	note __, 2
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	note F_, 2
	note __, 2
	note F_, 1
	note __, 1
	note C#, 2
	note __, 2
	note F_, 1
	notetype $8, $32
	note D#, 1
	notetype $8, $22
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	note C#, 2
	note __, 2
	note E_, 1
	notetype $8, $32
	note D_, 1
	notetype $8, $22
	endchannel
; 4de10

Music_Pinballnameentry_Ch4: ; 4de10
	togglenoise $0
	notetype $c
	note F_, 16
	note __, 8
	notetype $8
	note D#, 2
	note D_, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note D_, 2
Music_Pinballnameentry_branch_4de1e: ; 4de1e
	callchannel Music_Pinballnameentry_branch_4dec7
	note D_, 2
	note G_, 2
	note G#, 2
	callchannel Music_Pinballnameentry_branch_4dec7
	note D_, 2
	note G_, 2
	note C#, 2
	callchannel Music_Pinballnameentry_branch_4dec7
	note D_, 2
	note G_, 2
	note G#, 2
	callchannel Music_Pinballnameentry_branch_4ded1
	note G#, 2
	note G_, 2
	note D_, 2
	callchannel Music_Pinballnameentry_branch_4dec7
	note D_, 2
	note G_, 2
	note G#, 2
	callchannel Music_Pinballnameentry_branch_4dec7
	note D_, 2
	note G_, 2
	note C#, 2
	callchannel Music_Pinballnameentry_branch_4ded1
	note D_, 2
	note G_, 2
	note D_, 2
	callchannel Music_Pinballnameentry_branch_4dec7
	note D_, 2
	note D_, 2
	note D_, 2
Music_Pinballnameentry_branch_4de4e: ; 4de4e
	callchannel Music_Pinballnameentry_branch_4dedb
	note D#, 2
	note G_, 2
	note D#, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note D_, 2
	note G_, 2
	note C#, 2
	loopchannel 3, Music_Pinballnameentry_branch_4de4e
	callchannel Music_Pinballnameentry_branch_4dedb
	note D#, 2
	note G_, 2
	note D#, 2
	note D_, 2
	note G_, 2
	note D#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D#, 2
	note G_, 2
	note F#, 2
	note D_, 4
	note D#, 2
	note D#, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
Music_Pinballnameentry_branch_4de7a: ; 4de7a
	callchannel Music_Pinballnameentry_branch_4dee8
	loopchannel 5, Music_Pinballnameentry_branch_4de7a
	note D#, 2
	note G_, 2
	note F#, 2
	note D_, 4
	note D#, 2
	note D#, 2
	note G#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note D_, 12
	note D#, 2
	note D_, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note D_, 2
Music_Pinballnameentry_branch_4de93: ; 4de93
	callchannel Music_Pinballnameentry_branch_4dee8
	loopchannel 7, Music_Pinballnameentry_branch_4de93
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note G#, 2
	note G#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note F#, 9
	note G_, 1
	note G_, 1
	note G_, 1
	note F#, 12
	note D#, 2
	note G_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	notetype $c
	note __, 16
	note __, 8
	notetype $8
	note D_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note C#, 2
	note D_, 2
	loopchannel 0, Music_Pinballnameentry_branch_4de1e
; 4dec7

Music_Pinballnameentry_branch_4dec7: ; 4dec7
	note D#, 2
	note G_, 2
	note G#, 2
	note D_, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	endchannel
; 4ded1

Music_Pinballnameentry_branch_4ded1: ; 4ded1
	note D#, 2
	note G_, 2
	note G#, 2
	note D_, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note D_, 2
	note D#, 2
	endchannel
; 4dedb

Music_Pinballnameentry_branch_4dedb: ; 4dedb
	note D#, 2
	note G_, 2
	note D#, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note G_, 2
	endchannel
; 4dee8

Music_Pinballnameentry_branch_4dee8: ; 4dee8
	note D#, 2
	note G_, 2
	note F#, 2
	note D_, 4
	note D#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note D_, 2
	note G_, 2
	note F#, 2
	endchannel
; 4def4

