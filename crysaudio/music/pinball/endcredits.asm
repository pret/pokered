Music_Pinballendcredits: ; 4ccb5
	dbw $c0, Music_Pinballendcredits_Ch1
	dbw $01, Music_Pinballendcredits_Ch2
	dbw $02, Music_Pinballendcredits_Ch3
	dbw $03, Music_Pinballendcredits_Ch4
; 4ccc1

Music_Pinballendcredits_Ch1: ; 4ccc1
	tempo 144
	volume $77
	tone $0001
	vibrato $14, $24
	dutycycle $2
	notetype $8, $93
	note __, 3
	octave 3
	note F#, 3
	octave 4
	note F#, 3
	note E_, 3
	note D_, 3
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
Music_Pinballendcredits_branch_4ccdf: ; 4ccdf
	notetype $6, $48
	octave 3
	note A_, 1
	intensity $18
	note A_, 1
	intensity $48
	octave 4
	note D_, 1
	intensity $18
	note D_, 1
	loopchannel 2, Music_Pinballendcredits_branch_4ccdf
Music_Pinballendcredits_branch_4ccf2: ; 4ccf2
	intensity $68
	octave 3
	note A_, 1
	intensity $28
	note A_, 1
	intensity $68
	octave 4
	note D_, 1
	intensity $28
	note D_, 1
	loopchannel 2, Music_Pinballendcredits_branch_4ccf2
Music_Pinballendcredits_branch_4cd04: ; 4cd04
	intensity $88
	octave 3
	note A_, 1
	intensity $28
	note A_, 1
	intensity $88
	octave 4
	note F#, 1
	intensity $28
	note F#, 1
	loopchannel 2, Music_Pinballendcredits_branch_4cd04
	intensity $a8
	octave 3
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	octave 4
	note F#, 1
	intensity $28
	note F#, 1
	intensity $88
	note D_, 4
	dutycycle $3
	intensity $98
	callchannel Music_Pinballendcredits_branch_4cef5
Music_Pinballendcredits_branch_4cd2e: ; 4cd2e
	forceoctave $1
	callchannel Music_Pinballendcredits_branch_4cef5
	forceoctave $5
	callchannel Music_Pinballendcredits_branch_4cef5
	forceoctave $0
	note D_, 2
	note __, 2
	note D_, 4
	note __, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note G_, 2
	note D_, 2
	octave 5
	note D_, 6
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	note D_, 4
	note __, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 4
	note __, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 2
	note __, 2
	note E_, 4
	note __, 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 2
	note __, 2
	note F_, 4
	note __, 4
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 2
	octave 3
	note E_, 4
	note F#, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 1
	note __, 15
	notetype $c, $b3
	note __, 16
	notetype $6, $88
	octave 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 4
	note __, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note G_, 8
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 4
	note __, 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 2
	note __, 2
	note F_, 4
	octave 3
	note B_, 4
	note F_, 4
	note G_, 2
	intensity $28
	note G_, 2
	notetype $8, $88
	note C_, 1
	note E_, 1
	note G_, 1
	notetype $c, $88
	octave 4
	note C_, 1
	intensity $28
	note C_, 1
	notetype $8, $88
	octave 3
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	notetype $c, $88
	note C#, 1
	intensity $28
	note C#, 1
	notetype $8, $68
	octave 3
	note G_, 1
	octave 4
	note C#, 1
	note F#, 1
	notetype $c, $68
	note G_, 1
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	intensity $88
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D_, 1
	note A_, 1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 4
	note F#, 1
	note E_, 1
	note D_, 1
	octave 3
	note A_, 1
	notetype $6, $88
	octave 4
	note G#, 1
	note A_, 7
	dutycycle $2
	vibrato $14, $4
	note __, 8
	notetype $8, $88
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 6
	note __, 6
	note __, 6
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 6
	note __, 6
	note __, 6
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	intensity $58
	note A#, 6
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 6
	note B_, 1
	note __, 1
	intensity $68
	note B_, 1
	note __, 1
	intensity $78
	note B_, 1
	note __, 1
	notetype $c, $88
	octave 5
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $8, $98
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	vibrato $14, $24
	notetype $c, $62
	octave 3
	note B_, 2
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 2
	note E_, 2
	notetype $8, $62
	note G_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 3
	note B_, 2
	note A#, 2
	note A_, 2
	notetype $c, $62
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	octave 4
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	octave 3
	note A_, 1
	note E_, 1
	note A_, 1
	octave 5
	note A_, 1
	intensity $18
	note A_, 1
	intensity $62
	note E_, 1
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	note F_, 1
	octave 4
	note C_, 1
	octave 5
	note A_, 1
	intensity $18
	note A_, 1
	intensity $62
	note F_, 1
	note C_, 1
	intensity $98
	octave 3
	note A_, 3
	note G#, 1
	note G_, 1
	note __, 1
	note A_, 2
	note __, 2
	note B_, 2
	notetype $8, $98
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	intensity $85
	octave 5
	note E_, 6
	note D#, 6
	note D_, 6
	note C#, 6
	note D_, 6
	note C_, 6
	octave 4
	note B_, 6
	octave 5
	note D_, 6
	dutycycle $3
	notetype $6, $a8
	octave 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 4
	note __, 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	notetype $8, $a8
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	notetype $c, $52
	note F#, 1
	note A_, 1
	intensity $72
	note F#, 1
	note A_, 1
	intensity $92
	note F#, 1
	note A_, 1
	intensity $b2
	note F#, 1
	note A_, 1
	intensity $52
	note F#, 1
	octave 5
	note D_, 1
	intensity $72
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	intensity $92
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	intensity $b2
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	intensity $98
	octave 3
	note B_, 1
	note __, 1
	note B_, 2
	note __, 2
	notetype $6, $98
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 2
	note __, 2
	note B_, 2
	note __, 10
	loopchannel 0, Music_Pinballendcredits_branch_4cd2e
; 4cef5

Music_Pinballendcredits_branch_4cef5: ; 4cef5
	octave 3
	note B_, 2
	note __, 2
	note B_, 4
	note __, 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 2
	note __, 2
	note B_, 2
	note __, 10
	endchannel
; 4cf03

Music_Pinballendcredits_Ch2: ; 4cf03
	vibrato $14, $24
	dutycycle $2
	notetype $c, $b3
	note __, 2
	octave 4
	note D_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note B_, 2
	notetype $8, $b3
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note F_, 2
	intensity $57
	note F#, 6
	intensity $67
	note G_, 6
	intensity $87
	note A_, 6
	intensity $a7
	octave 5
	note C_, 6
	dutycycle $3
	notetype $6, $a8
	octave 4
	note G_, 2
	intensity $28
	note G_, 2
	callchannel Music_Pinballendcredits_branch_4d1f2
Music_Pinballendcredits_branch_4cf36: ; 4cf36
	forceoctave $2
	callchannel Music_Pinballendcredits_branch_4d21e
	note A_, 2
	intensity $28
	note A_, 2
	intensity $a8
	octave 5
	note G_, 2
	intensity $88
	octave 2
	note A_, 1
	note G#, 1
	intensity $a8
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	forceoctave $5
	callchannel Music_Pinballendcredits_branch_4d21e
	octave 5
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	octave 4
	note E_, 4
	intensity $78
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	forceoctave $4
	callchannel Music_Pinballendcredits_branch_4d21e
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 5
	note G_, 6
	octave 3
	note A_, 1
	note A#, 1
	note B_, 4
	note A#, 4
	note A_, 4
	note B_, 4
	intensity $28
	note B_, 2
	note __, 2
	dutycycle $2
	intensity $a2
	octave 4
	note B_, 1
	intensity $22
	note B_, 1
	intensity $a2
	note B_, 2
	note A#, 1
	intensity $22
	note A#, 1
	intensity $a2
	note A#, 2
	note A_, 1
	intensity $22
	note A_, 1
	intensity $a2
	note A_, 2
	dutycycle $3
	intensity $a8
	octave 3
	note B_, 4
	note A#, 4
	note A_, 4
	note B_, 4
	intensity $28
	note B_, 2
	note __, 2
	dutycycle $2
	intensity $a2
	octave 4
	note B_, 1
	intensity $22
	note B_, 1
	intensity $a2
	note B_, 2
	octave 5
	note C_, 1
	intensity $22
	note C_, 1
	intensity $a2
	note C_, 2
	note D_, 1
	intensity $22
	note D_, 1
	intensity $a2
	note D_, 2
	dutycycle $3
	intensity $a8
	octave 4
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a8
	note E_, 2
	octave 3
	note G_, 4
	note A_, 2
	intensity $28
	note A_, 2
	intensity $a8
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 2
	note __, 1
	intensity $a8
	note B_, 4
	notetype $8, $a8
	note A_, 2
	note G#, 2
	note G_, 2
	notetype $6, $a8
	note F_, 1
	note F#, 3
	note E_, 2
	intensity $28
	note E_, 2
	intensity $a8
	note D_, 2
	intensity $28
	note D_, 2
	note __, 4
	intensity $a8
	octave 4
	note D_, 2
	note F#, 2
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 8
	dutycycle $2
	callchannel Music_Pinballendcredits_branch_4d24f
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	octave 5
	note C_, 4
	note D_, 4
	callchannel Music_Pinballendcredits_branch_4d24f
	note G_, 4
	note A_, 4
	note G_, 4
	octave 5
	note E_, 4
	octave 4
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note A_, 4
	note G_, 2
	intensity $28
	note G_, 2
	note __, 3
	intensity $a8
	note A#, 1
	note B_, 4
	note A_, 4
	note G_, 4
	note G#, 1
	note A_, 11
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note F_, 1
	note F#, 7
	vibrato $14, $4
	callchannel Music_Pinballendcredits_branch_4d23e
	intensity $a8
	note G_, 6
	octave 2
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	note A#, 1
	intensity $28
	note A#, 1
	intensity $a8
	octave 3
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	octave 2
	note D_, 6
Music_Pinballendcredits_branch_4d073: ; 4d073
	octave 5
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	loopchannel 3, Music_Pinballendcredits_branch_4d073
	note F#, 6
	octave 2
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	callchannel Music_Pinballendcredits_branch_4d23e
	intensity $68
	note G_, 6
Music_Pinballendcredits_branch_4d098: ; 4d098
	intensity $68
	note G_, 1
	intensity $18
	note G_, 1
	loopchannel 3, Music_Pinballendcredits_branch_4d098
	intensity $88
	note G#, 6
Music_Pinballendcredits_branch_4d0a5: ; 4d0a5
	intensity $78
	note G#, 1
	intensity $18
	note G#, 1
	loopchannel 3, Music_Pinballendcredits_branch_4d0a5
Music_Pinballendcredits_branch_4d0af: ; 4d0af
	notetype $c, $a8
	note A_, 1
	intensity $28
	note A_, 1
	loopchannel 2, Music_Pinballendcredits_branch_4d0af
Music_Pinballendcredits_branch_4d0ba: ; 4d0ba
	notetype $8, $b8
	note A_, 1
	intensity $28
	note A_, 1
	loopchannel 2, Music_Pinballendcredits_branch_4d0ba
	intensity $b8
	note A_, 1
	vibrato $14, $24
	dutycycle $2
	intensity $78
	octave 4
	note D#, 1
	notetype $c, $a8
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note A_, 2
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note A#, 2
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note A_, 2
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note B_, 1
	intensity $28
	note B_, 1
	intensity $a8
	note B_, 1
	intensity $28
	note B_, 1
	intensity $a8
	note A#, 2
	note B_, 1
	intensity $28
	note B_, 1
	intensity $a8
	octave 5
	note D_, 2
	note C_, 1
	intensity $28
	note C_, 1
	intensity $a8
	octave 4
	note B_, 2
	octave 5
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	note C_, 2
	octave 4
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a8
	note F#, 2
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note A_, 2
	note B_, 1
	intensity $28
	note B_, 1
	intensity $a8
	note A_, 2
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note F#, 3
	note F_, 1
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a8
	note F#, 2
	intensity $28
	note F#, 1
	note __, 1
	intensity $a8
	note G_, 2
	notetype $8, $a8
	octave 5
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	note D_, 1
	intensity $78
	dutycycle $3
	octave 3
	note D#, 1
	notetype $6, $a8
	note E_, 2
	intensity $28
	note E_, 2
	intensity $a8
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note A_, 4
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note A#, 4
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note A_, 4
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	note A#, 4
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	octave 4
	note D_, 4
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	octave 3
	note B_, 4
	octave 4
	note D_, 2
	intensity $28
	note D_, 2
Music_Pinballendcredits_branch_4d1a3: ; 4d1a3
	intensity $b8
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	loopchannel 2, Music_Pinballendcredits_branch_4d1a3
	intensity $b8
	note C_, 4
	intensity $28
	note C_, 2
	note __, 2
Music_Pinballendcredits_branch_4d1b5: ; 4d1b5
	intensity $b8
	note C_, 1
	intensity $28
	note C_, 1
	loopchannel 2, Music_Pinballendcredits_branch_4d1b5
Music_Pinballendcredits_branch_4d1bf: ; 4d1bf
	intensity $b8
	note C#, 2
	intensity $28
	note C#, 2
	loopchannel 2, Music_Pinballendcredits_branch_4d1bf
	notetype $8, $b8
	note C#, 1
	intensity $28
	note C#, 1
	intensity $b8
	octave 4
	note B_, 1
	intensity $28
	note B_, 1
	intensity $b8
	octave 5
	note C#, 1
	intensity $28
	note C#, 1
	intensity $a8
	note D_, 12
	intensity $b8
	note F#, 12
	notetype $6, $a8
	note G_, 2
	intensity $28
	note G_, 2
	callchannel Music_Pinballendcredits_branch_4d1f2
	loopchannel 0, Music_Pinballendcredits_branch_4cf36
; 4d1f2

Music_Pinballendcredits_branch_4d1f2: ; 4d1f2
	intensity $a8
	octave 4
	note G_, 4
	intensity $28
	note G_, 2
	note __, 2
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	forceoctave $0
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	octave 5
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	octave 2
	note G_, 2
	intensity $28
	note G_, 2
	note __, 4
	endchannel
; 4d21e

Music_Pinballendcredits_branch_4d21e: ; 4d21e
	notetype $6, $a8
	octave 4
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note G_, 4
	intensity $28
	note G_, 2
	note __, 2
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	forceoctave $0
	endchannel
; 4d23e

Music_Pinballendcredits_branch_4d23e: ; 4d23e
	notetype $8, $a8
	octave 2
	note D_, 6
Music_Pinballendcredits_branch_4d243: ; 4d243
	intensity $a8
	octave 5
	note F#, 1
	intensity $28
	note F#, 1
	loopchannel 3, Music_Pinballendcredits_branch_4d243
	endchannel
; 4d24f

Music_Pinballendcredits_branch_4d24f: ; 4d24f
	octave 4
	note B_, 4
	note A#, 4
	note A_, 4
	note B_, 2
	intensity $28
	note B_, 2
	note __, 4
	intensity $a8
	endchannel
; 4d25b

Music_Pinballendcredits_Ch3: ; 4d25b
	notetype $8, $12
	octave 1
	note D_, 1
	intensity $22
	note D_, 1
	note D_, 1
	notetype $c, $22
	octave 2
	note D_, 16
	notetype $6, $32
	octave 1
	note D_, 5
	note __, 3
	note D_, 5
	note __, 3
	intensity $22
	note D_, 3
	note __, 1
	notetype $8, $12
	octave 3
	note D_, 1
	intensity $32
	note D_, 1
	note D_, 1
	intensity $12
	note D_, 3
	octave 2
	note D_, 1
	intensity $22
	note D_, 1
	note D_, 1
	callchannel Music_Pinballendcredits_branch_4d401
	note __, 2
	octave 1
	note G_, 2
	note __, 6
Music_Pinballendcredits_branch_4d28e: ; 4d28e
	callchannel Music_Pinballendcredits_branch_4d401
	intensity $32
	octave 1
	note A_, 1
	note G#, 1
	intensity $22
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	callchannel Music_Pinballendcredits_branch_4d401
	note __, 2
	intensity $32
	note G_, 4
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	intensity $22
	octave 2
	note G_, 2
	note __, 2
	note G_, 4
	note __, 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 2
	note G_, 2
	octave 4
	note B_, 6
	note __, 2
Music_Pinballendcredits_branch_4d2bd: ; 4d2bd
	octave 1
	note G_, 2
	note __, 2
	note G_, 4
	note __, 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	octave 2
	note G_, 4
	note __, 4
	octave 1
	note G_, 1
	note __, 1
	intensity $32
	note G_, 1
	note __, 1
	intensity $22
	loopchannel 2, Music_Pinballendcredits_branch_4d2bd
	octave 2
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note C_, 6
	note __, 2
	note C#, 1
	note __, 3
	note G_, 4
	notetype $8, $22
	note C#, 2
	note G_, 2
	octave 3
	note C#, 2
	notetype $6, $22
	octave 2
	note C#, 1
	note D_, 3
	note D_, 2
	note __, 2
	note A_, 2
	note __, 6
	octave 3
	note D_, 2
	note F#, 2
	octave 4
	note C_, 2
	note D_, 2
	note C#, 8
	callchannel Music_Pinballendcredits_branch_4d412
	octave 2
	note B_, 2
	note __, 2
	note B_, 2
	note D#, 2
	octave 1
	note G_, 2
	note G_, 2
	callchannel Music_Pinballendcredits_branch_4d412
	octave 2
	note B_, 4
	note __, 4
	octave 1
	note G_, 2
	note G_, 2
	octave 2
	note C_, 2
	note __, 2
	octave 1
	note G_, 2
	note __, 6
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 3
	note C#, 8
	octave 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 6
	note D_, 1
	note __, 1
	note D_, 1
	note __, 13
	notetype $8, $32
	octave 3
	note D_, 1
	note D_, 1
	note D_, 1
	intensity $22
	octave 1
	note D_, 6
	octave 2
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	intensity $32
	octave 3
	note D#, 6
	intensity $22
	octave 1
	note C#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	octave 1
	note D_, 6
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	intensity $32
	octave 3
	note D_, 6
	intensity $22
	octave 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 6
	octave 2
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	intensity $32
	note D_, 6
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	note D_, 6
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	notetype $c, $12
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $8, $12
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	notetype $c, $22
	octave 2
	note C_, 1
	note __, 1
	note C_, 2
	note __, 2
	note G_, 2
	note C#, 1
	note __, 1
	note C#, 2
	note G_, 2
	note C#, 2
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note B_, 2
	note E_, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	octave 3
	note E_, 2
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note C_, 4
	octave 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F#, 2
	notetype $8, $22
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	intensity $32
	note B_, 1
	octave 3
	note C_, 12
	note C#, 12
	note D_, 12
	note E_, 12
	notetype $6, $12
	octave 2
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 4
	note __, 4
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	notetype $8, $12
	note C#, 1
	note __, 1
	note G_, 1
	note __, 1
	note C#, 1
	note __, 1
	intensity $22
	note A_, 12
	octave 3
	note D_, 12
	callchannel Music_Pinballendcredits_branch_4d401
	note __, 2
	octave 1
	note G_, 2
	note __, 6
	loopchannel 0, Music_Pinballendcredits_branch_4d28e
; 4d401

Music_Pinballendcredits_branch_4d401: ; 4d401
	notetype $6, $22
	octave 2
	note G_, 2
	note __, 2
	note G_, 4
	note __, 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	octave 3
	note G_, 2
	endchannel
; 4d412

Music_Pinballendcredits_branch_4d412: ; 4d412
	octave 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 2
	note B_, 4
	note __, 4
	octave 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	endchannel
; 4d424

Music_Pinballendcredits_Ch4: ; 4d424
	togglenoise $1
	notetype $8
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	note B_, 16
	note __, 15
	notetype $6
	note C#, 1
	note C#, 1
Music_Pinballendcredits_branch_4d433: ; 4d433
	notetype $6
	callchannel Music_Pinballendcredits_branch_4d51d
	loopchannel 4, Music_Pinballendcredits_branch_4d433
	note E_, 4
	note C#, 8
	note D_, 2
	note C#, 2
	note E_, 4
	note D_, 8
	note D_, 2
	note C#, 2
	note E_, 4
	note C#, 8
	note D_, 2
	note C#, 2
	note E_, 4
	note C#, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note E_, 2
	note C#, 2
	note D_, 4
	note E_, 8
	note E_, 4
	note D_, 4
	notetype $8
	note E_, 2
	note D_, 2
	note E_, 2
	notetype $c
	note D_, 1
	note C#, 1
	note D_, 2
	note D_, 4
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	notetype $6
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 2
	note D_, 2
	note C#, 8
	note D_, 2
	note C#, 2
	note E_, 4
	note D_, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 4
	note D_, 8
	note D_, 2
	note C#, 2
	note E_, 2
	note D_, 2
	note E_, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 4
	note D_, 8
	note D_, 2
	note C#, 2
	note E_, 4
	note D_, 12
	callchannel Music_Pinballendcredits_branch_4d51d
Music_Pinballendcredits_branch_4d493: ; 4d493
	note B_, 8
	notetype $8
	note E_, 2
	note C#, 2
	note D_, 2
	note E_, 3
	note D_, 3
	notetype $6
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 3, Music_Pinballendcredits_branch_4d493
	note D_, 4
	note C#, 4
	notetype $8
	note E_, 2
	note C#, 2
	note D_, 2
	note E_, 3
	note D_, 3
	note E_, 2
	note C#, 2
	note D_, 2
	note D_, 3
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 3
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 3
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $6
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note C#, 4
	note E_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note E_, 4
	note C#, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 4
	note C#, 2
	note D_, 2
	note B_, 8
	note E_, 4
	notetype $8
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	note B_, 4
	note E_, 2
	note C#, 2
	note E_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note E_, 2
	note C#, 2
	notetype $8
	note E_, 2
	note C#, 2
	note D_, 2
	notetype $c
	note B_, 16
	note __, 16
	note E_, 1
	note D_, 1
	note E_, 4
	note E_, 1
	note D_, 1
	note E_, 2
	note E_, 2
	notetype $8
	note E_, 2
	note D_, 2
	note E_, 2
	notetype $6
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $8
	note E_, 1
	note D_, 1
	note D_, 1
	note B_, 12
	loopchannel 0, Music_Pinballendcredits_branch_4d433
; 4d51d

Music_Pinballendcredits_branch_4d51d: ; 4d51d
	note E_, 4
	note C#, 8
	note D_, 2
	note C#, 2
	note E_, 4
	note D_, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	endchannel
; 4d52c


