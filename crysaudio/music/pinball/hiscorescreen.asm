Music_Pinballhiscorescreen: ; 41d37
	dbw $c0, Music_Pinballhiscorescreen_Ch1
	dbw $01, Music_Pinballhiscorescreen_Ch2
	dbw $02, Music_Pinballhiscorescreen_Ch3
	dbw $03, Music_Pinballhiscorescreen_Ch4
; 41d43

Music_Pinballhiscorescreen_Ch1: ; 41d43
	tempo 112
	volume $77
	tone $0001
	notetype $c, $b3
	note __, 16
Music_Pinballhiscorescreen_branch_41d4f: ; 41d4f
	notetype $8, $92
	dutycycle $2
	callchannel Music_Pinballhiscorescreen_branch_41e36
	note G#, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note F#, 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note E_, 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 5
	note F#, 3
	note __, 1
	note F#, 1
	note __, 1
	intensity $82
	callchannel Music_Pinballhiscorescreen_branch_41e36
	note A_, 4
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note G#, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note B_, 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note A#, 1
	note __, 5
	note A#, 3
	note __, 1
	note B_, 1
	note __, 1
	callchannel Music_Pinballhiscorescreen_branch_41e36
	note A_, 4
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note G#, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note B_, 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note A#, 1
	note __, 3
	intensity $84
	octave 4
	note E_, 2
	note G#, 4
	note __, 2
Music_Pinballhiscorescreen_branch_41db2: ; 41db2
	intensity $81
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note B_, 4
	note F#, 2
	note B_, 4
	note F#, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note F_, 2
	note G#, 2
	octave 4
	note C#, 4
	octave 3
	note G#, 2
	octave 4
	note C#, 4
	octave 3
	note G#, 2
	intensity $91
	note C#, 2
	note C_, 2
	octave 2
	note B_, 2
	intensity $81
	note A#, 2
	octave 3
	note C#, 2
	note F_, 2
	note A#, 4
	note F_, 2
	note A#, 4
	note F_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	intensity $91
	note D#, 2
	note G#, 2
	note A#, 2
	octave 4
	note D#, 2
	note G#, 2
	note A#, 2
	octave 5
	note D#, 2
	octave 4
	note A#, 2
	note G_, 2
	note D#, 2
	octave 3
	note A#, 2
	note G_, 2
	loopchannel 3, Music_Pinballhiscorescreen_branch_41db2
	intensity $81
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note B_, 4
	note F#, 2
	note B_, 4
	note F#, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note F_, 2
	note G#, 2
	octave 4
	note C#, 4
	octave 3
	note G#, 2
	octave 4
	note C#, 4
	octave 3
	note G#, 2
	intensity $91
	note C#, 2
	note C_, 2
	octave 2
	note B_, 2
	intensity $81
	note A#, 2
	octave 3
	note C#, 2
	note F_, 2
	note A#, 4
	note F_, 2
	note A#, 4
	note F_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	intensity $91
	note D#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D#, 2
	note G_, 2
	intensity $94
	note A#, 9
	intensity $54
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	loopchannel 0, Music_Pinballhiscorescreen_branch_41d4f
; 41e36

Music_Pinballhiscorescreen_branch_41e36: ; 41e36
	octave 3
	note G#, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note F#, 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note G#, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note F#, 1
	note __, 5
	note F#, 4
	note F#, 1
	note __, 1
	loopchannel 3, Music_Pinballhiscorescreen_branch_41e36
	endchannel
; 41e56

Music_Pinballhiscorescreen_Ch2: ; 41e56
	vibrato $12, $34
	notetype $c, $b3
	note __, 16
Music_Pinballhiscorescreen_branch_41e5d: ; 41e5d
	dutycycle $2
	notetype $8, $a2
	callchannel Music_Pinballhiscorescreen_branch_41fd5
	callchannel Music_Pinballhiscorescreen_branch_41fd5
	forceoctave $2
	callchannel Music_Pinballhiscorescreen_branch_41fd5
	forceoctave $0
	intensity $a2
	note E_, 4
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a2
	note E_, 1
	intensity $28
	note E_, 1
	note __, 2
	intensity $a2
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a2
	note D_, 4
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a2
	note D_, 1
	intensity $28
	note D_, 1
	note __, 2
	intensity $a2
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a2
	note C#, 4
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	note __, 2
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	note __, 4
	dutycycle $3
	intensity $98
	note D_, 3
	intensity $88
	note G_, 1
	note G#, 1
	note A_, 1
	notetype $c, $a8
	note A#, 16
	notetype $8, $98
	note A#, 2
	intensity $48
	note A#, 2
	note __, 2
	intensity $98
	note B_, 4
	note C#, 2
	note A#, 4
	note B_, 4
	note __, 2
	intensity $68
	note B_, 1
	octave 5
	note C_, 1
	intensity $98
	note C#, 12
	note C#, 4
	octave 4
	note B_, 2
	note A#, 4
	note F#, 4
	intensity $38
	note F#, 2
	note __, 13
	intensity $68
	note F_, 1
	intensity $98
	note F#, 4
	octave 5
	note D#, 2
	notetype $c, $a8
	note D#, 16
	notetype $8, $a8
	intensity $48
	note D#, 2
	note __, 4
	intensity $98
	note D#, 6
	note C#, 6
	octave 4
	note A#, 6
	note F#, 16
	note G#, 2
	note A_, 4
	note G#, 14
	intensity $48
	note G#, 2
	note __, 2
	intensity $98
	note A#, 2
	note B_, 4
	note A#, 2
	notetype $c, $98
	note A#, 16
	intensity $48
	note A#, 2
	note __, 2
	notetype $8, $98
	note B_, 4
	intensity $48
	note B_, 2
	intensity $98
	note A#, 4
	note B_, 4
	intensity $48
	note B_, 2
	intensity $68
	note B_, 1
	octave 5
	note C_, 1
	intensity $98
	note C#, 16
	octave 4
	note B_, 2
	note A#, 4
	note F#, 4
	intensity $58
	note F_, 1
	note E_, 1
	intensity $48
	note D#, 1
	note D_, 1
	intensity $28
	note D_, 2
	note __, 9
	intensity $68
	note F_, 1
	intensity $98
	note F#, 4
	octave 5
	note D#, 2
	notetype $c, $98
	note D#, 16
	notetype $8, $98
	note D#, 2
	intensity $48
	note D#, 2
	note __, 2
	intensity $98
	note D#, 4
	octave 4
	note F#, 1
	intensity $48
	note F#, 1
	intensity $98
	octave 5
	note C#, 4
	octave 4
	note F#, 1
	intensity $48
	note F#, 1
	intensity $98
	note A#, 4
	intensity $48
	note A#, 1
	intensity $68
	note F_, 1
	intensity $98
	note F#, 16
	note G#, 2
	note A_, 4
	note G#, 14
	intensity $48
	note G#, 2
	note __, 2
	intensity $98
	dutycycle $2
	note A#, 2
	note B_, 4
	intensity $58
	octave 5
	note C#, 1
	note D_, 1
	callchannel Music_Pinballhiscorescreen_branch_42021
	callchannel Music_Pinballhiscorescreen_branch_42047
	callchannel Music_Pinballhiscorescreen_branch_42021
	intensity $a8
	note C#, 4
	intensity $a1
	note C_, 2
	note C#, 4
	octave 4
	note A#, 2
	note __, 6
	intensity $a8
	octave 5
	note G#, 5
	intensity $48
	note G#, 1
	intensity $a8
	note G_, 1
	note G#, 9
	intensity $a1
	note G_, 2
	note __, 4
	intensity $a8
	note G#, 2
	note A#, 1
	intensity $28
	note A#, 1
	note __, 2
	intensity $a8
	octave 6
	note D#, 2
	dutycycle $3
	callchannel Music_Pinballhiscorescreen_branch_42021
	callchannel Music_Pinballhiscorescreen_branch_42047
	callchannel Music_Pinballhiscorescreen_branch_42021
	intensity $a8
	note C#, 4
	intensity $a1
	note C_, 2
	note C#, 4
	octave 4
	note A#, 2
	note __, 6
	intensity $a8
	note G_, 1
	note G#, 5
	intensity $a2
	note G_, 2
	note __, 2
	note G#, 2
	note A#, 2
	note __, 2
	intensity $a8
	octave 5
	note D#, 9
	intensity $64
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 1
	note A#, 1
	loopchannel 0, Music_Pinballhiscorescreen_branch_41e5d
; 41fd5

Music_Pinballhiscorescreen_branch_41fd5: ; 41fd5
	intensity $a2
	octave 4
	note C#, 4
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	note __, 2
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 4
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	note __, 2
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 4
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	note __, 2
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a2
	note C#, 1
	intensity $28
	note C#, 1
	note __, 4
	intensity $a2
	note C#, 4
	note C#, 1
	intensity $28
	note C#, 1
	endchannel
; 42021

Music_Pinballhiscorescreen_branch_42021: ; 42021
	intensity $a8
	octave 5
	note D#, 4
	intensity $a1
	note C#, 2
	note D#, 4
	octave 4
	note B_, 2
	note __, 6
	intensity $a8
	octave 5
	note F#, 4
	intensity $78
	note D#, 1
	note E_, 1
	intensity $a8
	note F_, 4
	intensity $a1
	note D#, 2
	note F_, 4
	note C#, 2
	note __, 6
	intensity $a8
	octave 4
	note A#, 4
	intensity $78
	note B_, 1
	octave 5
	note C_, 1
	endchannel
; 42047

Music_Pinballhiscorescreen_branch_42047: ; 42047
	intensity $a8
	note C#, 4
	intensity $a1
	note C_, 2
	note C#, 4
	octave 4
	note A#, 2
	note __, 6
	intensity $a8
	octave 5
	note G#, 5
	intensity $78
	note G_, 1
	intensity $a8
	note G#, 4
	intensity $a1
	note A#, 2
	note G#, 4
	intensity $a8
	note G_, 8
	intensity $48
	note G_, 2
	note __, 2
	intensity $78
	note C#, 1
	note D_, 1
	endchannel
; 4206b

Music_Pinballhiscorescreen_Ch3: ; 4206b
	notetype $c, $22
	note __, 16
	notetype $8, $22
Music_Pinballhiscorescreen_branch_42072: ; 42072
	forceoctave $2
	callchannel Music_Pinballhiscorescreen_branch_42153
	forceoctave $0
	callchannel Music_Pinballhiscorescreen_branch_42153
	callchannel Music_Pinballhiscorescreen_branch_4219a
	octave 2
	note D_, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note F#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	note B_, 4
	note __, 2
	octave 2
	note C#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note D_, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note C#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	note B_, 1
	note __, 5
	octave 2
	note D_, 3
	note __, 1
	note D_, 1
	note __, 1
	forceoctave $2
	callchannel Music_Pinballhiscorescreen_branch_42153
	forceoctave $0
	callchannel Music_Pinballhiscorescreen_branch_42153
	callchannel Music_Pinballhiscorescreen_branch_4219a
	callchannel Music_Pinballhiscorescreen_branch_421e1
	octave 2
	note B_, 4
	note __, 2
	octave 3
	note E_, 4
	notetype $8, $32
	octave 2
	note E_, 1
	note __, 1
	notetype $8, $22
	forceoctave $2
	callchannel Music_Pinballhiscorescreen_branch_42153
	forceoctave $0
	callchannel Music_Pinballhiscorescreen_branch_42153
	callchannel Music_Pinballhiscorescreen_branch_4219a
	callchannel Music_Pinballhiscorescreen_branch_421e1
	note B_, 4
	octave 3
	note E_, 2
	octave 2
	note B_, 4
	note E_, 1
	note __, 1
	callchannel Music_Pinballhiscorescreen_branch_42219
	callchannel Music_Pinballhiscorescreen_branch_42244
	note D#, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 3
	note G_, 1
	note __, 1
	callchannel Music_Pinballhiscorescreen_branch_42219
	callchannel Music_Pinballhiscorescreen_branch_42244
	note D#, 1
	note __, 3
	octave 5
	note D#, 1
	note __, 1
	note G_, 1
	note __, 3
	note G_, 2
	callchannel Music_Pinballhiscorescreen_branch_42219
	callchannel Music_Pinballhiscorescreen_branch_42244
	note D#, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 3
	note G_, 1
	note __, 1
	callchannel Music_Pinballhiscorescreen_branch_42219
	octave 1
	note A#, 2
	note __, 2
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 3
	note F_, 1
	note __, 1
	note A#, 1
	note __, 3
	note B_, 1
	note __, 1
	octave 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 3
	octave 1
	note A#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 3
	note G_, 1
	note __, 1
	loopchannel 0, Music_Pinballhiscorescreen_branch_42072
; 42153

Music_Pinballhiscorescreen_branch_42153: ; 42153
	octave 2
	note E_, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note G#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	note B_, 4
	note __, 2
	octave 2
	note C#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note E_, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note C#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	note B_, 4
	note __, 2
	octave 2
	note G#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	endchannel
; 4219a

Music_Pinballhiscorescreen_branch_4219a: ; 4219a
	octave 2
	note D#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note F#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	note B_, 4
	note __, 2
	octave 2
	note C#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note D#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note C#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	note B_, 4
	note __, 2
	octave 2
	note B_, 4
	notetype $8, $32
	octave 1
	note A#, 1
	note __, 1
	notetype $8, $22
	endchannel
; 421e1

Music_Pinballhiscorescreen_branch_421e1: ; 421e1
	octave 2
	note D_, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note F#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	note A_, 4
	note __, 2
	note B_, 4
	notetype $8, $32
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note E_, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	octave 2
	note G#, 4
	notetype $8, $32
	octave 1
	note B_, 1
	note __, 1
	notetype $8, $22
	endchannel
; 42219

Music_Pinballhiscorescreen_branch_42219: ; 42219
	octave 1
	note B_, 2
	note __, 2
	note B_, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note F#, 1
	note __, 1
	note B_, 1
	note __, 3
	octave 2
	note C_, 1
	note __, 1
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 3
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 3
	note C_, 1
	note __, 1
	endchannel
; 42244

Music_Pinballhiscorescreen_branch_42244: ; 42244
	octave 1
	note A#, 2
	note __, 2
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 3
	note F_, 1
	note __, 1
	note A#, 1
	note __, 3
	note B_, 1
	note __, 1
	octave 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	endchannel
; 42265

Music_Pinballhiscorescreen_Ch4: ; 42265
	togglenoise $1
	notetype $8
	note D_, 4
	note C#, 2
	note D_, 4
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note D_, 4
	note D_, 2
Music_Pinballhiscorescreen_branch_42272: ; 42272
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	callchannel Music_Pinballhiscorescreen_branch_42309
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	note D_, 4
	note D_, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 2
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	callchannel Music_Pinballhiscorescreen_branch_42309
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	note D#, 4
	note F_, 2
	note D_, 2
	note D_, 2
	note F_, 2
	note D#, 4
	note D_, 2
	note D_, 4
	note D_, 2
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	callchannel Music_Pinballhiscorescreen_branch_42309
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	note D#, 4
	note F_, 2
	note D_, 4
	note F_, 6
	note D_, 2
	note D_, 4
	note D_, 2
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	note D#, 4
	note F_, 2
	note D_, 2
	note D_, 2
	note F_, 2
	note D#, 4
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	callchannel Music_Pinballhiscorescreen_branch_42313
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	callchannel Music_Pinballhiscorescreen_branch_42313
	callchannel Music_Pinballhiscorescreen_branch_422ee
	callchannel Music_Pinballhiscorescreen_branch_42300
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 2
	note D_, 4
	note D_, 2
	note D_, 4
	note D_, 2
	loopchannel 0, Music_Pinballhiscorescreen_branch_42272
; 422ee

Music_Pinballhiscorescreen_branch_422ee: ; 422ee
	note D#, 4
	note F_, 2
	note D_, 4
	note F_, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D_, 2
	note D#, 4
	note F_, 2
	note D_, 2
	note D_, 2
	note F_, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D#, 2
	endchannel
; 42300

Music_Pinballhiscorescreen_branch_42300: ; 42300
	note D#, 4
	note F_, 2
	note D_, 4
	note F_, 2
	note D#, 4
	note F_, 2
	note D_, 4
	note F_, 2
	endchannel
; 42309

Music_Pinballhiscorescreen_branch_42309: ; 42309
	note D#, 4
	note F_, 2
	note D_, 2
	note D_, 2
	note F_, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D#, 2
	endchannel
; 42313

Music_Pinballhiscorescreen_branch_42313: ; 42313
	note D#, 4
	note F_, 2
	note D_, 2
	note D_, 2
	note F_, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D_, 2
	endchannel
; 4231d


