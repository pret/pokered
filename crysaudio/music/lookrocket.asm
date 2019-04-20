Music_LookRocket:
	musicheader 4, 1, Music_LookRocket_Ch1
	musicheader 1, 2, Music_LookRocket_Ch2
	musicheader 1, 3, Music_LookRocket_Ch3
	musicheader 1, 4, Music_LookRocket_Ch4

Music_LookRocket_Ch1:
	tempo 123
	volume $77
	pitchoffset 0, D_
	stereopanning $f
	dutycycle $3
	vibrato $5, $64
	notetype $c, $a8
	octave 4
	note C_, 1
	note D_, 1
	callchannel Music_LookRocket_branch_f74e6
	dutycycle $1
Music_LookRocket_branch_f74c7:
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

Music_LookRocket_branch_f74e6:
Music_RocketTheme_branch_f74e6:
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

Music_LookRocket_branch_f74f7:
Music_RocketTheme_branch_f74f7:
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

Music_LookRocket_branch_f750c:
Music_RocketTheme_branch_f750c:
	note __, 2
	octave 2
	note B_, 1
	note __, 7
	octave 3
	note C_, 1
	note __, 5
	endchannel

Music_LookRocket_Ch2:
	pitchoffset 0, D_
	vibrato $4, $64
	dutycycle $3
	notetype $c, $b7
	stereopanning $ff
	octave 5
	note C_, 1
	note D_, 1
	callchannel Music_LookRocket_branch_f7547
Music_LookRocket_branch_f7526:
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

Music_LookRocket_branch_f7547:
Music_RocketTheme_branch_f7547:
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

Music_LookRocket_branch_f7554:
Music_RocketTheme_branch_f7554:
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

Music_LookRocket_branch_f7568:
Music_RocketTheme_branch_f7568:
	note __, 2
	octave 3
	note F_, 1
	note __, 7
	note F#, 1
	note __, 5
	endchannel

Music_LookRocket_branch_f756f:
Music_RocketTheme_branch_f756f:
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

Music_LookRocket_branch_f758a:
Music_RocketTheme_branch_f758a:
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

Music_LookRocket_Ch3:
	pitchoffset 0, D_
	vibrato $4, $22
	notetype $c, $14
	stereopanning $f0
	note __, 2
	callchannel Music_LookRocket_branch_f75bf
Music_LookRocket_branch_f75a5:
	callchannel Music_LookRocket_branch_f75fe
	callchannel Music_LookRocket_branch_f75fe
	intensity $24
	callchannel Music_LookRocket_branch_f7623
	intensity $14
	callchannel Music_LookRocket_branch_f75cc
	callchannel Music_LookRocket_branch_f7623
	callchannel Music_LookRocket_branch_f75e1
	loopchannel 0, Music_LookRocket_branch_f75a5

Music_LookRocket_branch_f75bf:
Music_RocketTheme_branch_f75bf:
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

Music_LookRocket_branch_f75cc:
Music_RocketTheme_branch_f75cc:
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

Music_LookRocket_branch_f75e1:
Music_RocketTheme_branch_f75e1:
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

Music_LookRocket_branch_f75fe:
Music_RocketTheme_branch_f75fe:
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

Music_LookRocket_branch_f7623:
Music_RocketTheme_branch_f7623:
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

Music_LookRocket_Ch4:
	togglenoise $3
	notetype $c
	note __, 2
	callchannel Music_LookRocket_branch_f765c
Music_LookRocket_branch_f7640:
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f7664
	callchannel Music_LookRocket_branch_f765c
	loopchannel 0, Music_LookRocket_branch_f7640

Music_LookRocket_branch_f765c:
Music_RocketTheme_branch_f765c:
	note C_, 8
	note D_, 2
	note D#, 2
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	endchannel

Music_LookRocket_branch_f7664:
Music_RocketTheme_branch_f7664:
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	endchannel
