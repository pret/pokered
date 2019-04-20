Music_Surf:
	musicheader 3, 1, Music_Surf_Ch1
	musicheader 1, 2, Music_Surf_Ch2
	musicheader 1, 3, Music_Surf_Ch3

	db $3

Music_Surf_Ch1:
	tempo 108
	volume $77
	notetype $c, $a7
	stereopanning $f
Music_Surf_branch_f519e:
	dutycycle $2
	vibrato $10, $24
	intensity $73
	octave 3
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	intensity $73
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	intensity $73
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	intensity $93
	note __, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	intensity $a7
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	intensity $b7
	note __, 1
	note A#, 2
	note G#, 2
	note F_, 2
	note D_, 2
	notetype $8, $c7
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note F_, 2
	intensity $f7
	note G#, 2
	note A#, 2
	octave 4
	note D_, 2
	dutycycle $0
	callchannel Music_Surf_branch_f5233
	dutycycle $1
	notetype $8, $a7
	callchannel Music_Surf_branch_f5233
	callchannel Music_Surf_branch_f5293
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note G_, 2
	octave 4
	note C_, 2
	note D#, 2
	note G_, 2
	dutycycle $1
	notetype $6, $97
	callchannel Music_Surf_branch_f5293
	intensity $a8
	note G#, 6
	note A_, 6
	note A#, 3
	octave 4
	note D_, 3
	intensity $a8
	dutycycle $1
	callchannel Music_Surf_branch_f52d9
	octave 3
	note D#, 8
	note G#, 8
	note D#, 8
	dutycycle $3
	notetype $8, $98
	callchannel Music_Surf_branch_f52d9
	notetype $c, $a7
	octave 3
	note D#, 12
	octave 2
	note F_, 4
	note D#, 4
	note F_, 4
	note G#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 0, Music_Surf_branch_f519e

Music_Surf_branch_f5233:
	notetype $c, $a7
	octave 3
	note D#, 4
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note D#, 4
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note C#, 4
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note C#, 4
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note C_, 4
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 4
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	notetype $6, $a7
	octave 3
	note A#, 1
	note B_, 15
	octave 4
	note D#, 4
	octave 3
	note B_, 4
	note G#, 8
	note F_, 8
	note C#, 4
	note D_, 4
	endchannel

Music_Surf_branch_f5293:
	octave 4
	note G#, 16
	note D#, 4
	note C_, 4
	octave 3
	note G#, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 4
	note G_, 4
	note G#, 4
	notetype $8, $92
	note A#, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note F_, 2
	note G#, 2
	note A#, 2
	octave 4
	note D_, 2
	notetype $6, $97
	note C#, 1
	note D_, 15
	note G_, 4
	note D_, 4
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note G_, 4
	note A_, 4
	note A#, 4
	notetype $8, $92
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	octave 3
	note G_, 2
	endchannel

Music_Surf_branch_f52d9:
	octave 3
	note A#, 3
	note G_, 3
	note A#, 3
	octave 4
	note D#, 9
	notetype $6, $58
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	intensity $a8
	note D#, 4
	note D_, 4
	note D#, 4
	note G_, 4
	note A_, 4
	note G#, 4
	note G_, 4
	note F#, 4
	note F_, 4
	note E_, 4
	note G_, 8
	note C#, 8
	note A#, 8
	note A_, 1
	note A#, 3
	note G#, 4
	octave 4
	note C_, 4
	note F_, 12
	intensity $58
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	intensity $a8
	note G#, 8
	octave 4
	note D#, 4
	octave 3
	note B_, 4
	note G#, 8
	note D#, 8
	octave 2
	note B_, 8
	endchannel

Music_Surf_Ch2:
Music_Surf_branch_f5317:
	notetype $c, $c2
	stereopanning $f0
	dutycycle $2
	vibrato $14, $23
Music_Surf_branch_f5321:
	octave 1
	note A#, 4
	octave 2
	note A#, 1
	note __, 3
	note A#, 1
	note __, 3
	loopchannel 3, Music_Surf_branch_f5321
	octave 1
	note A#, 4
	octave 2
	note F_, 1
	note __, 3
	note A#, 1
	note __, 3
Music_Surf_branch_f5333:
	note D#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note D#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C_, 4
	note F_, 2
	note G_, 2
	note G#, 4
	note C_, 4
	note F_, 2
	note G_, 2
	note G#, 4
	octave 1
	note B_, 4
	octave 2
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note B_, 4
	note A#, 4
	note G#, 4
	loopchannel 2, Music_Surf_branch_f5333
	intensity $c7
	callchannel Music_Surf_branch_f53b2
	note D#, 4
	note D_, 4
	note C#, 4
	callchannel Music_Surf_branch_f53b2
	note D_, 4
	note D#, 4
	octave 1
	note A#, 4
	notetype $6, $b8
	callchannel Music_Surf_branch_f53d6
	dutycycle $1
	intensity $b8
	callchannel Music_Surf_branch_f53e8
	dutycycle $2
	callchannel Music_Surf_branch_f53f3
	dutycycle $1
	intensity $b8
	callchannel Music_Surf_branch_f5404
	octave 3
	note B_, 16
	octave 4
	note C#, 8
	pitchoffset 0, CC
	dutycycle $3
	callchannel Music_Surf_branch_f53d6
	intensity $b8
	dutycycle $1
	callchannel Music_Surf_branch_f53e8
	dutycycle $3
	callchannel Music_Surf_branch_f53f3
	intensity $b8
	dutycycle $1
	callchannel Music_Surf_branch_f5404
	pitchoffset 0, C_
	notetype $c, $b8
	octave 4
	note B_, 12
	dutycycle $2
	note A#, 4
	note G#, 4
	note D#, 4
	note G#, 4
	note A#, 4
	note B_, 4
	loopchannel 0, Music_Surf_branch_f5317

Music_Surf_branch_f53b2:
	octave 1
	note G#, 4
	octave 3
	note F_, 4
	note D#, 4
	octave 1
	note G#, 4
	octave 3
	note D#, 4
	note D_, 4
	octave 1
	note A#, 4
	octave 3
	note C_, 4
	octave 2
	note A#, 4
	octave 1
	note A#, 4
	octave 2
	note G#, 4
	note A#, 4
	octave 1
	note G_, 4
	octave 3
	note D_, 4
	note C_, 4
	octave 1
	note G_, 4
	octave 2
	note A#, 4
	note G_, 4
	note C_, 4
	octave 3
	note F_, 4
	note G_, 4
	endchannel

Music_Surf_branch_f53d6:
	octave 4
	note F_, 4
	note D#, 4
	note F_, 4
	note G_, 12
	intensity $58
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	endchannel

Music_Surf_branch_f53e8:
	note A#, 7
	octave 4
	note C_, 8
	note C#, 16
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 16
	note G_, 8
	endchannel

Music_Surf_branch_f53f3:
	note F#, 1
	note G_, 3
	note F_, 4
	note G_, 4
	note G#, 12
	intensity $58
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	endchannel

Music_Surf_branch_f5404:
	octave 4
	note C_, 8
	note G_, 4
	note G#, 4
	note A#, 8
	note G#, 8
	note D#, 8
	endchannel

Music_Surf_Ch3:
Music_Surf_branch_f540c:
	stereopanning $ff
	notetype $c, $15
	vibrato $16, $23
	octave 4
	note A#, 12
	octave 5
	note C_, 12
	note D_, 8
	note D#, 4
	note F_, 4
	note G_, 4
	note G#, 4
	intensity $12
	note A#, 12
	note __, 4
	note G#, 4
	note G_, 4
	notetype $6, $12
	note F#, 1
	note G_, 15
	note G#, 4
	note G_, 4
	note F_, 16
	octave 4
	note A#, 8
	notetype $c, $12
	octave 5
	note G#, 16
	note G_, 4
	note F_, 4
	notetype $6, $12
	note E_, 1
	note F_, 15
	note G_, 4
	note F_, 4
	note D#, 16
	note F_, 8
	notetype $c, $14
	note A#, 12
	note __, 4
	note G#, 4
	note G_, 4
	notetype $6, $14
	note F#, 1
	note G_, 15
	note G#, 4
	note G_, 4
	note F_, 16
	octave 4
	note A#, 8
	notetype $c, $14
	octave 5
	note G#, 16
	note G_, 4
	note F_, 4
	notetype $6, $14
	note E_, 1
	note F_, 15
	note G_, 4
	note F_, 4
	note D#, 16
	octave 6
	note D#, 8
	notetype $c, $13
	note C_, 16
	note D_, 4
	note D#, 4
	notetype $6, $13
	note D_, 1
	note D#, 15
	note D_, 4
	note C_, 4
	octave 5
	note D_, 16
	octave 6
	note D_, 8
	notetype $c, $13
	octave 5
	note A#, 12
	notetype $6, $13
	note A_, 1
	note A#, 7
	octave 6
	note C_, 8
	note D_, 8
	note F_, 16
	note D#, 4
	note D_, 4
	note D#, 16
	note D_, 8
	notetype $c, $14
	note C_, 12
	note C_, 4
	note D_, 4
	note D#, 4
	notetype $6, $14
	note D_, 1
	note D#, 15
	note D_, 4
	note C_, 4
	octave 5
	note D_, 16
	octave 6
	note D_, 8
	notetype $c, $14
	octave 5
	note A#, 12
	notetype $6, $14
	note A_, 1
	note A#, 7
	octave 6
	note C_, 8
	note D_, 8
	notetype $c, $14
	note F_, 12
	note G_, 8
	octave 5
	note A#, 4
	intensity $15
	callchannel Music_Surf_branch_f54c8
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note F_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	callchannel Music_Surf_branch_f54c8
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note G#, 4
	note B_, 12
	octave 2
	note B_, 12
	octave 3
	note D#, 8
	octave 2
	note B_, 4
	loopchannel 0, Music_Surf_branch_f540c

Music_Surf_branch_f54c8:
	octave 3
	note D#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note D#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note C#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note C#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note C_, 4
	note F_, 1
	note __, 3
	note G#, 1
	note __, 3
	note C_, 4
	note F_, 1
	note __, 3
	note G#, 1
	note __, 3
	endchannel
