Music_ProfOak:
	musicheader 3, 1, Music_ProfOak_Ch1
	musicheader 1, 2, Music_ProfOak_Ch2
	musicheader 1, 3, Music_ProfOak_Ch3

Music_ProfOak_Ch1:
	tempo 118
	volume $77
	vibrato $12, $34
	tone $0001
	stereopanning $f0
	dutycycle $3
	notetype $c, $98
	octave 2
	note F#, 1
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	note A_, 16
	note G#, 8
	intensity $97
	note G#, 8
Music_ProfOak_branch_f4e10:
	intensity $91
	callchannel Music_ProfOak_branch_f4e42
	callchannel Music_ProfOak_branch_f4e42
	callchannel Music_ProfOak_branch_f4e4d
	callchannel Music_ProfOak_branch_f4e4d
	loopchannel 2, Music_ProfOak_branch_f4e10
Music_ProfOak_branch_f4e22:
	callchannel Music_ProfOak_branch_f4e58
	callchannel Music_ProfOak_branch_f4e58
	callchannel Music_ProfOak_branch_f4e6c
	callchannel Music_ProfOak_branch_f4e6c
	pitchoffset 0, D_
	callchannel Music_ProfOak_branch_f4e58
	callchannel Music_ProfOak_branch_f4e58
	pitchoffset 0, C_
	callchannel Music_ProfOak_branch_f4e6c
	callchannel Music_ProfOak_branch_f4e6c
	loopchannel 0, Music_ProfOak_branch_f4e22

Music_ProfOak_branch_f4e42:
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note G#, 2
	note E_, 2
	endchannel

Music_ProfOak_branch_f4e4d:
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	note B_, 2
	note D#, 2
	note F#, 2
	note D#, 2
	endchannel

Music_ProfOak_branch_f4e58:
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note C#, 1
	note E_, 1
	note C#, 2
	intensity $92
	note A_, 2
	intensity $91
	note C#, 2
	intensity $92
	note E_, 2
	intensity $91
	endchannel

Music_ProfOak_branch_f4e6c:
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	intensity $92
	note G#, 4
	note E_, 4
	intensity $91
	note E_, 1
	note G#, 1
	intensity $92
	note B_, 4
	intensity $91
	endchannel

Music_ProfOak_Ch2:
	vibrato $12, $34
	dutycycle $3
	notetype $c, $a8
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	note F#, 1
	note A#, 1
	note B_, 16
	intensity $a7
	note B_, 10
	dutycycle $2
Music_ProfOak_branch_f4e92:
	intensity $b2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 4
	intensity $91
	note B_, 2
	octave 5
	note C#, 2
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 4
	intensity $b2
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 4
	note B_, 1
	note __, 1
	note B_, 4
	intensity $91
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 4
	note B_, 2
	note B_, 4
	loopchannel 2, Music_ProfOak_branch_f4e92
	note __, 6
	intensity $b4
Music_ProfOak_branch_f4ebf:
	note C#, 6
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 6
	note C#, 1
	note E_, 1
	note F#, 4
	note E_, 4
	note D#, 4
	note C#, 4
	octave 3
	note B_, 6
	note G#, 1
	note B_, 1
	octave 4
	note E_, 8
	intensity $82
	note B_, 6
	note G#, 1
	note B_, 1
	intensity $83
	octave 5
	note E_, 8
	intensity $b4
	octave 3
	note A_, 6
	note F#, 1
	note A_, 1
	octave 4
	note D#, 8
	note E_, 4
	note D#, 4
	note C#, 4
	note C_, 4
	octave 3
	note B_, 6
	note G#, 1
	note B_, 1
	octave 4
	note E_, 6
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note G#, 16
	loopchannel 0, Music_ProfOak_branch_f4ebf

Music_ProfOak_Ch3:
	stereopanning $f
	notetype $c, $14
	note __, 4
	octave 3
	note E_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note A_, 2
	note __, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 1
	note __, 1
	note E_, 2
	callchannel Music_ProfOak_branch_f4f3d
Music_ProfOak_branch_f4f0d:
	callchannel Music_ProfOak_branch_f4f3d
	callchannel Music_ProfOak_branch_f4f3d
	callchannel Music_ProfOak_branch_f4f4c
	callchannel Music_ProfOak_branch_f4f4c
	loopchannel 2, Music_ProfOak_branch_f4f0d
Music_ProfOak_branch_f4f1d:
	callchannel Music_ProfOak_branch_f4f5a
	callchannel Music_ProfOak_branch_f4f5a
	callchannel Music_ProfOak_branch_f4f69
	callchannel Music_ProfOak_branch_f4f69
	pitchoffset 0, D_
	callchannel Music_ProfOak_branch_f4f5a
	callchannel Music_ProfOak_branch_f4f5a
	pitchoffset 0, C_
	callchannel Music_ProfOak_branch_f4f69
	callchannel Music_ProfOak_branch_f4f69
	loopchannel 0, Music_ProfOak_branch_f4f1d

Music_ProfOak_branch_f4f3d:
	note E_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note G#, 2
	note __, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 1
	note __, 1
	note E_, 2
	endchannel

Music_ProfOak_branch_f4f4c:
	octave 2
	note B_, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	note F#, 2
	note B_, 1
	note __, 1
	note D#, 2
	endchannel

Music_ProfOak_branch_f4f5a:
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note E_, 2
	note A_, 1
	note __, 1
	note C#, 2
	endchannel

Music_ProfOak_branch_f4f69:
	octave 2
	note G#, 2
	note __, 2
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 2
	note __, 2
	octave 3
	note E_, 2
	note G#, 1
	note __, 1
	octave 2
	note B_, 2
	endchannel
