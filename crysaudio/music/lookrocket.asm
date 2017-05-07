Music_LookRocket: ; f74a2
	dbw $c0, Music_LookRocket_Ch1
	dbw $01, Music_LookRocket_Ch2
	dbw $02, Music_LookRocket_Ch3
	dbw $03, Music_LookRocket_Ch4
; f74ae

Music_LookRocket_Ch1: ; f74ae
	tempo 123
	volume $77
	forceoctave $2
	stereopanning $f
	dutycycle $3
	vibrato $5, $64
	notetype $c, $a8
	octave 4
	note C_, 1
	note D_, 1
	callchannel Music_LookRocket_branch_f74e6
	dutycycle $1
Music_LookRocket_branch_f74c7: ; f74c7
	intensity $a8
	callchannel Music_LookRocket_branch_f74f7
	callchannel Music_LookRocket_branch_f758a
	octave 4
	note F#, 1
	note __, 1
	intensity $53
	callchannel Music_LookRocket_branch_f750c
	intensity $c3
	callchannel Music_LookRocket_branch_f750c
	intensity $e3
	callchannel Music_LookRocket_branch_f750c
	note __, 16
	loopchannel 0, Music_LookRocket_branch_f74c7
; f74e6

Music_LookRocket_branch_f74e6: ; f74e6
Music_RocketTheme_branch_f74e6: ; f74e6
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 3
	octave 2
	note F_, 1
	note G#, 1
	note B_, 1
	octave 3
	note D_, 1
	note F_, 1
	note G#, 1
	endchannel
; f74f7

Music_LookRocket_branch_f74f7: ; f74f7
Music_RocketTheme_branch_f74f7: ; f74f7
	note __, 2
	octave 3
	note D#, 1
	note __, 5
	note D#, 4
	octave 2
	note A_, 2
	octave 3
	note D#, 1
	note F_, 1
	note F#, 6
	note D#, 1
	note __, 3
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	endchannel
; f750c

Music_LookRocket_branch_f750c: ; f750c
Music_RocketTheme_branch_f750c: ; f750c
	note __, 2
	octave 2
	note B_, 1
	note __, 7
	octave 3
	note C_, 1
	note __, 5
	endchannel
; f7514

Music_LookRocket_Ch2: ; f7514
	forceoctave $2
	vibrato $4, $64
	dutycycle $3
	notetype $c, $b7
	stereopanning $ff
	octave 5
	note C_, 1
	note D_, 1
	callchannel Music_LookRocket_branch_f7547
Music_LookRocket_branch_f7526: ; f7526
	intensity $b7
	callchannel Music_LookRocket_branch_f758a
	octave 5
	note C_, 1
	note __, 1
	callchannel Music_LookRocket_branch_f7554
	intensity $53
	callchannel Music_LookRocket_branch_f7568
	intensity $c3
	callchannel Music_LookRocket_branch_f7568
	intensity $e3
	callchannel Music_LookRocket_branch_f7568
	callchannel Music_LookRocket_branch_f756f
	loopchannel 0, Music_LookRocket_branch_f7526
; f7547

Music_LookRocket_branch_f7547: ; f7547
Music_RocketTheme_branch_f7547: ; f7547
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 3
	octave 3
	note B_, 6
	dutycycle $0
	endchannel
; f7554

Music_LookRocket_branch_f7554: ; f7554
Music_RocketTheme_branch_f7554: ; f7554
	note __, 2
	octave 4
	note D#, 1
	note __, 5
	note F_, 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note F#, 6
	note D#, 1
	note __, 3
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 5
	note D#, 1
	note __, 1
	endchannel
; f7568

Music_LookRocket_branch_f7568: ; f7568
Music_RocketTheme_branch_f7568: ; f7568
	note __, 2
	octave 3
	note F_, 1
	note __, 7
	note F#, 1
	note __, 5
	endchannel
; f756f

Music_LookRocket_branch_f756f: ; f756f
Music_RocketTheme_branch_f756f: ; f756f
	intensity $63
	note G#, 1
	note F_, 1
	note D_, 1
	octave 2
	note B_, 1
	intensity $a3
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	intensity $c3
	note A#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	intensity $f3
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	endchannel
; f758a

Music_LookRocket_branch_f758a: ; f758a
Music_RocketTheme_branch_f758a: ; f758a
	octave 3
	note __, 2
	note G_, 1
	note __, 5
	note A_, 8
	note A#, 6
	note A_, 1
	note __, 3
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel
; f7597

Music_LookRocket_Ch3: ; f7597
	forceoctave $2
	vibrato $4, $22
	notetype $c, $14
	stereopanning $f0
	note __, 2
	callchannel Music_LookRocket_branch_f75bf
Music_LookRocket_branch_f75a5: ; f75a5
	callchannel Music_LookRocket_branch_f75fe
	callchannel Music_LookRocket_branch_f75fe
	intensity $24
	callchannel Music_LookRocket_branch_f7623
	intensity $14
	callchannel Music_LookRocket_branch_f75cc
	callchannel Music_LookRocket_branch_f7623
	callchannel Music_LookRocket_branch_f75e1
	loopchannel 0, Music_LookRocket_branch_f75a5
; f75bf

Music_LookRocket_branch_f75bf: ; f75bf
Music_RocketTheme_branch_f75bf: ; f75bf
	octave 3
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	octave 3
	note D_, 6
	endchannel
; f75cc

Music_LookRocket_branch_f75cc: ; f75cc
Music_RocketTheme_branch_f75cc: ; f75cc
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F#, 1
	note __, 1
	endchannel
; f75e1

Music_LookRocket_branch_f75e1: ; f75e1
Music_RocketTheme_branch_f75e1: ; f75e1
	intensity $24
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	intensity $14
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	endchannel
; f75fe

Music_LookRocket_branch_f75fe: ; f75fe
Music_RocketTheme_branch_f75fe: ; f75fe
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel
; f7623

Music_LookRocket_branch_f7623: ; f7623
Music_RocketTheme_branch_f7623: ; f7623
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	note G#, 1
	note F#, 1
	note D#, 1
	note C_, 1
	endchannel
; f7638

Music_LookRocket_Ch4: ; f7638
	togglenoise $3
	notetype $c
	note __, 2
	callchannel Music_LookRocket_branch_f765c
Music_LookRocket_branch_f7640: ; f7640
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f765c
	loopchannel 0, Music_LookRocket_branch_f7640
; f765c

Music_LookRocket_branch_f765c: ; f765c
Music_RocketTheme_branch_f765c: ; f765c
	note C_, 8
	note D_, 2
	note D#, 2
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	endchannel
; f7664

Music_LookRocket_branch_f7664: ; f7664
Music_RocketTheme_branch_f7664: ; f7664
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	endchannel
; f766d


