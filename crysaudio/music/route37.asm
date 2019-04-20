Music_Route37:
	musicheader 4, 1, Music_Route37_Ch1
	musicheader 1, 2, Music_Route37_Ch2
	musicheader 1, 3, Music_Route37_Ch3
	musicheader 1, 4, Music_Route37_Ch4

Music_Route37_Ch1:
	tempo 144
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $22
	notetype $c, $b3
	note __, 16
	note __, 16
Music_Route37_branch_ee969:
	intensity $b3
	note __, 2
	octave 2
	note F#, 2
	note B_, 2
	octave 3
	note E_, 2
	intensity $b7
	note D#, 10
	intensity $b3
	note E_, 4
	note D#, 4
	note C#, 4
	octave 2
	note B_, 2
	octave 3
	note D#, 3
	octave 2
	note B_, 1
	intensity $b7
	note F#, 8
	note B_, 8
	octave 3
	note B_, 12
	intensity $b3
	note __, 2
	octave 2
	note F#, 2
	note B_, 2
	octave 3
	note E_, 2
	intensity $b7
	note D#, 10
	octave 2
	note A_, 4
	octave 3
	note C#, 4
	note E_, 4
	note A_, 2
	note F#, 3
	note A_, 1
	note B_, 6
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note B_, 2
	note A_, 4
	note F#, 4
	note E_, 2
	note D#, 4
	stereopanning $f
Music_Route37_branch_ee9a5:
	callchannel Music_Route37_branch_ee9da
	octave 3
	note C#, 4
	loopchannel 2, Music_Route37_branch_ee9a5
	callchannel Music_Route37_branch_ee9e9
	octave 3
	note F#, 4
	callchannel Music_Route37_branch_ee9e9
	octave 3
	note F#, 4
	callchannel Music_Route37_branch_ee9da
	octave 3
	note E_, 4
	callchannel Music_Route37_branch_ee9da
	octave 3
	note G#, 4
	callchannel Music_Route37_branch_ee9e9
	octave 4
	note D#, 4
	callchannel Music_Route37_branch_ee9e9
	octave 3
	note F_, 4
	stereopanning $ff
	callchannel Music_Route37_branch_ee9e9
	note __, 4
	callchannel Music_Route37_branch_ee9e9
	note __, 4
	loopchannel 0, Music_Route37_branch_ee969

Music_Route37_branch_ee9da:
	intensity $c2
	octave 2
	note A_, 2
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 2
	intensity $b7
	endchannel

Music_Route37_branch_ee9e9:
	intensity $c2
	octave 2
	note B_, 2
	note B_, 1
	note B_, 1
	note B_, 2
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 2
	intensity $b7
	endchannel

Music_Route37_Ch2:
	dutycycle $3
	vibrato $1c, $12
	notetype $c, $c2
	octave 2
	note B_, 2
	notetype $c, $c1
	note B_, 1
	note B_, 1
	intensity $c2
	note B_, 2
	intensity $c1
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	intensity $c2
	note B_, 6
	note B_, 2
	intensity $c1
	note B_, 1
	note B_, 1
	intensity $c2
	note B_, 2
	intensity $c1
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	intensity $c2
	note B_, 2
Music_Route37_branch_eea24:
	callchannel Music_Route37_branch_eeab7
	intensity $c6
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	note A_, 4
	note E_, 4
	intensity $b0
	note F#, 8
	intensity $b7
	note F#, 8
	intensity $c7
	note D#, 12
	callchannel Music_Route37_branch_eeab7
	intensity $c7
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	note E_, 4
	intensity $b0
	note D#, 16
	intensity $b0
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $c4
	note __, 4
	octave 3
	note A_, 3
	octave 4
	note E_, 1
	note A_, 4
	note G#, 4
	intensity $a0
	note C#, 6
	note D#, 6
	note E_, 4
	intensity $c3
	note F#, 3
	note E_, 1
	intensity $b0
	note D#, 6
	intensity $b7
	note D#, 6
	intensity $c3
	octave 3
	note B_, 3
	note F#, 1
	intensity $b0
	octave 4
	note D#, 6
	intensity $b7
	octave 4
	note D#, 6
	intensity $c4
	note __, 4
	octave 3
	note A_, 3
	octave 4
	note E_, 1
	note A_, 4
	note G#, 4
	intensity $b0
	note C#, 6
	note D#, 6
	note E_, 4
	intensity $c3
	note F#, 3
	note D#, 1
	intensity $b0
	note B_, 6
	intensity $b7
	note B_, 6
	intensity $c3
	note B_, 3
	note F#, 1
	intensity $b0
	octave 5
	note D#, 6
	intensity $b7
	octave 5
	note D#, 6
	intensity $c2
	octave 3
	note F#, 2
	note F#, 1
	note F#, 1
	note F#, 2
	intensity $c1
	note F#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	intensity $c2
	note F#, 6
	note F#, 2
	note F#, 1
	note F#, 1
	note F#, 2
	intensity $c1
	note F#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	intensity $c2
	note F#, 2
	loopchannel 0, Music_Route37_branch_eea24

Music_Route37_branch_eeab7:
	intensity $c7
	octave 3
	note F#, 4
	intensity $b0
	note B_, 5
	intensity $b7
	note B_, 5
	intensity $c3
	note F#, 2
	note F#, 2
	note B_, 2
	endchannel

Music_Route37_Ch3:
	stereopanning $f0
	notetype $c, $14
Music_Route37_branch_eeacc:
	octave 2
	note F#, 2
	note __, 6
	loopchannel 4, Music_Route37_branch_eeacc
Music_Route37_branch_eead3:
	callchannel Music_Route37_branch_eeb32
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note G#, 2
	note B_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note E_, 2
Music_Route37_branch_eeae0:
	note D#, 2
	note F#, 2
	loopchannel 4, Music_Route37_branch_eeae0
	callchannel Music_Route37_branch_eeb32
	callchannel Music_Route37_branch_eeb32
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note G#, 2
	note B_, 2
	note F#, 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	callchannel Music_Route37_branch_eeb32
Music_Route37_branch_eeafb:
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 4, Music_Route37_branch_eeafb
Music_Route37_branch_eeb03:
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	loopchannel 7, Music_Route37_branch_eeb03
	note E_, 2
	note C#, 2
	callchannel Music_Route37_branch_eeb3c
Music_Route37_branch_eeb10:
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	loopchannel 4, Music_Route37_branch_eeb10
Music_Route37_branch_eeb18:
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	loopchannel 7, Music_Route37_branch_eeb18
	note E_, 2
	note C#, 2
	callchannel Music_Route37_branch_eeb3c
	callchannel Music_Route37_branch_eeb32
Music_Route37_branch_eeb28:
	note F#, 2
	note __, 6
	loopchannel 4, Music_Route37_branch_eeb28
	loopchannel 0, Music_Route37_branch_eead3

Music_Route37_branch_eeb32:
	octave 2
	note F#, 2
	note B_, 2
	note F#, 2
	note B_, 2
	note F#, 2
	note B_, 2
	note F#, 2
	note B_, 2
	endchannel

Music_Route37_branch_eeb3c:
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	endchannel

Music_Route37_Ch4:
	stereopanning $f
	togglenoise $0
Music_Route37_branch_eeb51:
	notetype $c
	callchannel Music_Route37_branch_eeb6b
	note D_, 1
	note D#, 1
	note D#, 1
	note D_, 1
	callchannel Music_Route37_branch_eeb6b
	notetype $6
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	loopchannel 0, Music_Route37_branch_eeb51

Music_Route37_branch_eeb6b:
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 2
	note D#, 1
	note D#, 1
	endchannel
