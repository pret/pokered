Music_Pinballmewtwostage: ; 48cb9
	dbw $c0, Music_Pinballmewtwostage_Ch1
	dbw $01, Music_Pinballmewtwostage_Ch2
	dbw $02, Music_Pinballmewtwostage_Ch3
	dbw $03, Music_Pinballmewtwostage_Ch4
; 48cc5

Music_Pinballmewtwostage_Ch1: ; 48cc5
	tempo 112
	volume $77
	dutycycle $2
	notetype $c, $48
	note __, 16
	note __, 16
	note __, 16
	note __, 16
Music_Pinballmewtwostage_branch_48cd3: ; 48cd3
	notetype $c, $48
	soundinput $88
	intensity $48
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	intensity $58
	note C_, 1
	note D_, 1
	intensity $68
	note C_, 1
	note D_, 1
	intensity $78
	note C_, 1
	note D_, 1
	intensity $88
	note C_, 1
	note D_, 1
	intensity $98
	note C_, 1
	note D_, 1
	intensity $b8
	note C_, 1
	note D_, 1
	intensity $c1
	callchannel Music_Pinballmewtwostage_branch_48e46
	callchannel Music_Pinballmewtwostage_branch_48e5c
	callchannel Music_Pinballmewtwostage_branch_48e46
	soundinput $ab
	octave 2
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	callchannel Music_Pinballmewtwostage_branch_48dc4
	intensity $c1
	callchannel Music_Pinballmewtwostage_branch_48e46
	callchannel Music_Pinballmewtwostage_branch_48ddc
	callchannel Music_Pinballmewtwostage_branch_48df4
	callchannel Music_Pinballmewtwostage_branch_48e11
	callchannel Music_Pinballmewtwostage_branch_48ddc
	callchannel Music_Pinballmewtwostage_branch_48e20
	callchannel Music_Pinballmewtwostage_branch_48dc4
	intensity $c1
	callchannel Music_Pinballmewtwostage_branch_48e46
	intensity $c1
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 1
	intensity $a1
	soundinput $ad
	octave 4
	note F_, 1
	soundinput $ad
	note F_, 1
	soundinput $ad
	note C#, 1
	note __, 1
	soundinput $ad
	octave 3
	note G_, 1
	intensity $c1
	soundinput $ab
	octave 2
	note F_, 1
	callchannel Music_Pinballmewtwostage_branch_48e46
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	intensity $b1
	soundinput $ad
	octave 4
	note C#, 1
	note __, 1
	soundinput $ad
	octave 3
	note G_, 1
	note __, 1
	callchannel Music_Pinballmewtwostage_branch_48dc4
	intensity $c1
	callchannel Music_Pinballmewtwostage_branch_48e46
	callchannel Music_Pinballmewtwostage_branch_48e5c
	callchannel Music_Pinballmewtwostage_branch_48e46
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	intensity $b1
	soundinput $ad
	octave 4
	note D#, 1
	soundinput $ad
	note D#, 1
	soundinput $ad
	note C#, 1
	soundinput $ad
	note C#, 1
	soundinput $ad
	octave 3
	note A#, 1
	soundinput $ad
	note A#, 1
	intensity $c1
	soundinput $ab
	octave 2
	note F_, 1
	callchannel Music_Pinballmewtwostage_branch_48e46
	callchannel Music_Pinballmewtwostage_branch_48e5c
	callchannel Music_Pinballmewtwostage_branch_48e46
	callchannel Music_Pinballmewtwostage_branch_48e5c
	callchannel Music_Pinballmewtwostage_branch_48e46
	callchannel Music_Pinballmewtwostage_branch_48ddc
	callchannel Music_Pinballmewtwostage_branch_48df4
	callchannel Music_Pinballmewtwostage_branch_48e11
	callchannel Music_Pinballmewtwostage_branch_48ddc
	callchannel Music_Pinballmewtwostage_branch_48e20
	callchannel Music_Pinballmewtwostage_branch_48dc4
	loopchannel 0, Music_Pinballmewtwostage_branch_48cd3
; 48dc4

Music_Pinballmewtwostage_branch_48dc4: ; 48dc4
	notetype $8, $b1
	soundinput $ad
	octave 4
	note D#, 1
	soundinput $ad
	note D#, 1
	soundinput $ad
	note D#, 1
	notetype $c, $b1
	soundinput $ad
	octave 3
	note B_, 1
	soundinput $ad
	note F#, 1
	endchannel
; 48ddc

Music_Pinballmewtwostage_branch_48ddc: ; 48ddc
	intensity $c1
	soundinput $ab
	octave 2
	note F_, 1
	note __, 1
	intensity $b1
	soundinput $ad
	octave 4
	note F_, 1
	note __, 1
	soundinput $ad
	octave 3
	note G_, 1
	note __, 1
	soundinput $ad
	note C_, 1
	note __, 1
	endchannel
; 48df4

Music_Pinballmewtwostage_branch_48df4: ; 48df4
	intensity $c1
	soundinput $ab
	octave 2
	note F_, 1
	note __, 1
	dutycycle $0
	intensity $a8
	soundinput $88
	octave 3
	note C#, 1
	note __, 1
	dutycycle $2
	intensity $c1
	soundinput $ab
	octave 2
	note F_, 1
	note __, 2
	soundinput $ab
	note F_, 1
	endchannel
; 48e11

Music_Pinballmewtwostage_branch_48e11: ; 48e11
	intensity $c1
	soundinput $ab
	note F_, 1
	note __, 1
	soundinput $ab
	note F_, 1
	note __, 1
	soundinput $ab
	note F_, 1
	note __, 3
	endchannel
; 48e20

Music_Pinballmewtwostage_branch_48e20: ; 48e20
	intensity $c1
	soundinput $ab
	note F_, 1
	note __, 1
	dutycycle $0
	intensity $a8
	soundinput $88
	octave 3
	note C#, 1
	note __, 1
	dutycycle $2
	intensity $c1
	soundinput $ab
	octave 2
	note F_, 1
	note __, 3
	dutycycle $0
	intensity $a8
	soundinput $88
	octave 3
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	dutycycle $2
	endchannel
; 48e46

Music_Pinballmewtwostage_branch_48e46: ; 48e46
	soundinput $ab
	octave 2
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 1
	soundinput $ab
	note F_, 1
	note __, 1
	endchannel
; 48e5c

Music_Pinballmewtwostage_branch_48e5c: ; 48e5c
	soundinput $ab
	octave 2
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 3
	soundinput $ab
	note F_, 1
	note __, 2
	soundinput $ab
	note F_, 1
	endchannel
; 48e71

Music_Pinballmewtwostage_Ch2: ; 48e71
	dutycycle $2
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 4
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 4
	callchannel Music_Pinballmewtwostage_branch_49062
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 4
	callchannel Music_Pinballmewtwostage_branch_49033
	callchannel Music_Pinballmewtwostage_branch_49043
	callchannel Music_Pinballmewtwostage_branch_49043
	callchannel Music_Pinballmewtwostage_branch_49043
	callchannel Music_Pinballmewtwostage_branch_49043
	callchannel Music_Pinballmewtwostage_branch_49062
	note __, 4
	intensity $c8
	octave 3
	note C_, 1
	intensity $a8
	octave 2
	note A_, 1
	intensity $78
	note F_, 1
	intensity $48
	note D_, 1
	callchannel Music_Pinballmewtwostage_branch_49033
Music_Pinballmewtwostage_branch_48ea6: ; 48ea6
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 12
	loopchannel 3, Music_Pinballmewtwostage_branch_48ea6
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 4
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 4
Music_Pinballmewtwostage_branch_48eb6: ; 48eb6
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 12
	loopchannel 3, Music_Pinballmewtwostage_branch_48eb6
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 8
	callchannel Music_Pinballmewtwostage_branch_49033
Music_Pinballmewtwostage_branch_48ec5: ; 48ec5
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 12
	loopchannel 3, Music_Pinballmewtwostage_branch_48ec5
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 4
	callchannel Music_Pinballmewtwostage_branch_49033
	note __, 4
Music_Pinballmewtwostage_branch_48ed5: ; 48ed5
	vibrato $12, $4
	notetype $c, $1e
	octave 4
	note G_, 16
	vibrato $12, $43
	callchannel Music_Pinballmewtwostage_branch_48f3f
	callchannel Music_Pinballmewtwostage_branch_48fd6
	callchannel Music_Pinballmewtwostage_branch_48fe4
	callchannel Music_Pinballmewtwostage_branch_48fd6
	callchannel Music_Pinballmewtwostage_branch_48ff6
	callchannel Music_Pinballmewtwostage_branch_48f3f
	dutycycle $3
	intensity $98
	callchannel Music_Pinballmewtwostage_branch_49018
	notetype $c, $98
	note F#, 12
	note A_, 4
	note A#, 3
	notetype $6, $98
	note D#, 1
	note D_, 1
	notetype $c, $98
	note C#, 2
	note D_, 2
	intensity $28
	note D_, 2
	intensity $18
	note D_, 2
	note __, 4
	notetype $6, $98
	callchannel Music_Pinballmewtwostage_branch_49018
	note F#, 14
	note F_, 1
	note F#, 1
	note G_, 14
	note F#, 1
	note G_, 1
	note G#, 12
	note A#, 1
	note B_, 1
	octave 5
	note C_, 1
	note C#, 1
	note D_, 2
	octave 4
	note A_, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	dutycycle $2
	callchannel Music_Pinballmewtwostage_branch_48fd6
	callchannel Music_Pinballmewtwostage_branch_48fe4
	callchannel Music_Pinballmewtwostage_branch_48fd6
	callchannel Music_Pinballmewtwostage_branch_48ff6
	loopchannel 0, Music_Pinballmewtwostage_branch_48ed5
; 48f3f

Music_Pinballmewtwostage_branch_48f3f: ; 48f3f
	notetype $6, $b8
	octave 1
	note G_, 2
	intensity $98
	octave 4
	note F_, 1
	note F#, 1
	note G_, 2
	intensity $18
	note G_, 2
	intensity $98
	note A#, 2
	intensity $18
	note A#, 2
	intensity $98
	note E_, 4
	intensity $b8
	octave 1
	note G_, 2
	note __, 2
	intensity $98
	octave 3
	note A#, 2
	intensity $18
	note A#, 2
	intensity $98
	note A_, 2
	intensity $18
	note A_, 2
	intensity $98
	note A#, 4
	octave 4
	note G_, 2
	intensity $18
	note G_, 2
	intensity $98
	note A#, 2
	intensity $18
	note A#, 2
	intensity $98
	octave 5
	note F_, 2
	intensity $18
	note F_, 2
	intensity $98
	note E_, 2
	intensity $18
	note E_, 2
	intensity $b8
	octave 1
	note G_, 2
	note __, 2
	intensity $98
	octave 5
	note C#, 12
	octave 4
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 2
	note __, 2
	note A#, 2
	intensity $18
	note A#, 2
	intensity $98
	note E_, 4
	intensity $b8
	octave 1
	note G_, 2
	note __, 2
	intensity $98
	octave 3
	note A#, 2
	intensity $18
	note A#, 2
	intensity $98
	note A_, 2
	intensity $18
	note A_, 2
	intensity $98
	note A#, 4
	octave 4
	note G_, 2
	intensity $18
	note G_, 2
	intensity $98
	note A#, 2
	intensity $b8
	octave 1
	note G_, 2
	intensity $98
	octave 5
	note F_, 2
	intensity $18
	note F_, 2
	intensity $98
	note E_, 2
	intensity $18
	note E_, 2
	intensity $b8
	octave 1
	note G_, 2
	note __, 2
	intensity $98
	octave 5
	note G_, 8
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	endchannel
; 48fd6

Music_Pinballmewtwostage_branch_48fd6: ; 48fd6
	intensity $b8
	octave 1
	note G_, 2
	note __, 6
	note G_, 2
	note __, 6
	note G_, 2
	note __, 6
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	endchannel
; 48fe4

Music_Pinballmewtwostage_branch_48fe4: ; 48fe4
	note G_, 2
	note __, 6
	note G_, 2
	note __, 6
	note G_, 2
	note __, 2
	dutycycle $0
	octave 3
	note G_, 2
	note __, 2
	dutycycle $2
	octave 1
	note G_, 2
	note __, 4
	note G_, 2
	endchannel
; 48ff6

Music_Pinballmewtwostage_branch_48ff6: ; 48ff6
	note G_, 2
	note __, 2
	dutycycle $0
	octave 3
	note G_, 2
	dutycycle $2
	octave 1
	note G_, 2
	note G_, 2
	note __, 6
	dutycycle $0
	octave 3
	note G_, 2
	note __, 2
	note A#, 2
	note __, 2
	dutycycle $2
	intensity $68
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note C#, 2
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note F_, 2
	endchannel
; 49018

Music_Pinballmewtwostage_branch_49018: ; 49018
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	note G_, 2
	note A_, 2
	note A#, 15
	note B_, 1
	octave 5
	note C_, 7
	octave 4
	note B_, 1
	note A#, 8
	note A_, 3
	note G#, 1
	note G_, 12
	intensity $28
	note G_, 2
	note __, 2
	intensity $98
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	endchannel
; 49033

Music_Pinballmewtwostage_branch_49033: ; 49033
	notetype $3, $c8
	octave 2
	note F_, 1
	intensity $b8
	note C#, 1
	intensity $98
	octave 1
	note A_, 1
	intensity $58
	note F#, 1
	endchannel
; 49043

Music_Pinballmewtwostage_branch_49043: ; 49043
	notetype $3, $c8
	octave 3
	note A#, 1
	intensity $a8
	note F#, 1
	intensity $88
	note D#, 1
	intensity $78
	note C#, 1
	endchannel
; 49052




Music_Pinballmewtwostage_branch_49062: ; 49062
	notetype $3, $c8
	octave 3
	note F#, 1
	intensity $a8
	note D_, 1
	intensity $78
	octave 2
	note B_, 1
	intensity $48
	note A#, 1
	endchannel
; 49072

Music_Pinballmewtwostage_Ch3: ; 49072
	notetype $c, $22
	note __, 16
	octave 1
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 1
	note G_, 1
	octave 3
	note E_, 1
	note D#, 1
	note D_, 1
	octave 1
	note G_, 1
	octave 3
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 1
	note G_, 1
	octave 2
	note A#, 1
	octave 1
	note G_, 1
	octave 2
	note A_, 1
	octave 1
	note G_, 1
	notetype $6, $32
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	intensity $22
	octave 1
	note G_, 2
	note __, 2
	intensity $32
	octave 6
	note G_, 1
	note __, 3
	intensity $22
	octave 1
	note G_, 2
	intensity $32
	octave 6
	note D_, 1
	note __, 1
	octave 1
	note G_, 2
	octave 6
	note G_, 1
	note __, 1
	intensity $22
	octave 1
	note G_, 2
	intensity $32
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	intensity $22
	octave 1
	note G_, 2
	note G_, 2
	octave 2
	note G_, 2
	note G#, 2
	note A_, 2
	octave 1
	note G_, 2
	octave 2
	note A#, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 1
	note G_, 2
	octave 3
	note C#, 2
	note D_, 2
	note D#, 2
	octave 1
	note G_, 2
	octave 3
	note E_, 2
	octave 1
	note G_, 2
	octave 3
	note F_, 2
Music_Pinballmewtwostage_branch_490e0: ; 490e0
	notetype $c, $32
	octave 3
	note G#, 8
	notetype $6, $22
	note G#, 8
	intensity $12
	note G#, 8
	callchannel Music_Pinballmewtwostage_branch_49156
	callchannel Music_Pinballmewtwostage_branch_491e6
	callchannel Music_Pinballmewtwostage_branch_49156
	intensity $22
	callchannel Music_Pinballmewtwostage_branch_49237
	octave 2
	note D_, 2
	note __, 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note __, 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note __, 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note __, 2
	note A_, 2
	octave 3
	note C#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note A_, 2
	octave 2
	note D_, 2
	note __, 2
	note A_, 2
	octave 3
	note D_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 2
	note G#, 2
	note F#, 2
	note D_, 2
	octave 1
	note A_, 2
	callchannel Music_Pinballmewtwostage_branch_49237
	octave 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	octave 3
	note D_, 2
	note A_, 2
	note D_, 2
	octave 2
	note A_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	note G#, 2
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	octave 2
	note G_, 2
	note F#, 4
	note D_, 4
	note F#, 4
	octave 1
	note A_, 4
	callchannel Music_Pinballmewtwostage_branch_491e6
	loopchannel 0, Music_Pinballmewtwostage_branch_490e0
; 49156

Music_Pinballmewtwostage_branch_49156: ; 49156
	notetype $6, $32
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	intensity $22
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	intensity $12
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	intensity $22
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	intensity $32
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	loopchannel 2, Music_Pinballmewtwostage_branch_49156
	endchannel
; 491e6

Music_Pinballmewtwostage_branch_491e6: ; 491e6
	notetype $6, $32
	octave 4
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	intensity $22
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note A_, 1
	note C#, 1
	intensity $12
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	intensity $22
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	intensity $32
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	loopchannel 2, Music_Pinballmewtwostage_branch_491e6
	endchannel
; 49237

Music_Pinballmewtwostage_branch_49237: ; 49237
	octave 2
	note D#, 2
	note __, 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note D#, 2
	note __, 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note D#, 2
	note __, 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note D#, 2
	note __, 2
	note A#, 2
	octave 3
	note D_, 2
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note A#, 2
	octave 2
	note D#, 2
	note __, 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note D#, 2
	note __, 2
	note A#, 2
	octave 3
	note D#, 2
	octave 2
	note D#, 2
	note __, 2
	note D_, 2
	note F#, 2
	endchannel
; 49267

Music_Pinballmewtwostage_Ch4: ; 49267
	togglenoise $0
	notetype $c
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 2
	note G#, 1
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 1
	callchannel Music_Pinballmewtwostage_branch_492e5
	callchannel Music_Pinballmewtwostage_branch_492f6
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
Music_Pinballmewtwostage_branch_49292: ; 49292
	note __, 16
	callchannel Music_Pinballmewtwostage_branch_49306
	callchannel Music_Pinballmewtwostage_branch_492f6
	callchannel Music_Pinballmewtwostage_branch_492e5
	callchannel Music_Pinballmewtwostage_branch_49317
	callchannel Music_Pinballmewtwostage_branch_49306
	callchannel Music_Pinballmewtwostage_branch_4932d
	callchannel Music_Pinballmewtwostage_branch_4934d
	callchannel Music_Pinballmewtwostage_branch_49306
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note G#, 2
	note D_, 1
	note D_, 1
	callchannel Music_Pinballmewtwostage_branch_492e5
	callchannel Music_Pinballmewtwostage_branch_49317
	callchannel Music_Pinballmewtwostage_branch_492e5
	callchannel Music_Pinballmewtwostage_branch_49363
	callchannel Music_Pinballmewtwostage_branch_492e5
	callchannel Music_Pinballmewtwostage_branch_49363
	callchannel Music_Pinballmewtwostage_branch_492e5
	callchannel Music_Pinballmewtwostage_branch_49363
	callchannel Music_Pinballmewtwostage_branch_492e5
	callchannel Music_Pinballmewtwostage_branch_49363
	callchannel Music_Pinballmewtwostage_branch_49306
	callchannel Music_Pinballmewtwostage_branch_4932d
	callchannel Music_Pinballmewtwostage_branch_4934d
	loopchannel 0, Music_Pinballmewtwostage_branch_49292
; 492e5

Music_Pinballmewtwostage_branch_492e5: ; 492e5
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note D_, 1
	endchannel
; 492f6

Music_Pinballmewtwostage_branch_492f6: ; 492f6
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 2
	note D_, 1
	note D_, 1
	endchannel
; 49306

Music_Pinballmewtwostage_branch_49306: ; 49306
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note D_, 1
	endchannel
; 49317

Music_Pinballmewtwostage_branch_49317: ; 49317
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D_, 1
	note D_, 1
	endchannel
; 4932d

Music_Pinballmewtwostage_branch_4932d: ; 4932d
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 2
	note D_, 1
	note D_, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D_, 1
	endchannel
; 4934d

Music_Pinballmewtwostage_branch_4934d: ; 4934d
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D_, 1
	note D_, 1
	endchannel
; 49363

Music_Pinballmewtwostage_branch_49363: ; 49363
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	endchannel
; 49374


