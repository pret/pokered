Music_KantoWildBattle:
	musicheader 3, 1, Music_KantoWildBattle_Ch1
	musicheader 1, 2, Music_KantoWildBattle_Ch2
	musicheader 1, 3, Music_KantoWildBattle_Ch3

	db $3

Music_KantoWildBattle_Ch1:
	tempo 112
	volume $77
	vibrato $12, $23
	dutycycle $2
	notetype $c, $b7
	note __, 16
	octave 4
	note A#, 6
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
Music_KantoWildBattle_branch_ed091:
	notetype $c, $b7
	callchannel Music_KantoWildBattle_branch_ed18a
	octave 4
	note F_, 4
	note C#, 4
	octave 3
	note B_, 8
	callchannel Music_KantoWildBattle_branch_ed18a
	note __, 8
	note G_, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note D#, 1
	intensity $b1
	note E_, 6
	note C_, 6
	octave 3
	note G_, 4
	octave 4
	note E_, 6
	note C_, 6
	note E_, 4
	intensity $b7
	note F_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note C#, 1
	octave 3
	note G#, 1
	note F_, 1
	note G_, 1
	note G#, 4
	note F#, 1
	note G_, 1
	note G#, 1
	octave 4
	note C_, 1
	note C#, 4
	octave 3
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note E_, 1
	note F_, 3
	note G_, 1
	note G#, 4
	intensity $b1
	octave 3
	note G_, 6
	note F_, 6
	note E_, 4
	note G#, 6
	note G_, 6
	note F_, 4
	octave 4
	note C_, 6
	octave 3
	note A#, 6
	note G_, 4
	notetype $8, $b7
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note E_, 2
	note F_, 2
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note C#, 2
	note F_, 2
	note C#, 2
	octave 2
	note G#, 2
	notetype $c, $b7
	octave 3
	note G#, 4
	octave 4
	note C#, 4
	intensity $71
	note F_, 1
	note F_, 1
	intensity $91
	note F_, 1
	note F_, 1
	intensity $b1
	note G#, 1
	note G#, 1
	intensity $d1
	note G#, 1
	note G#, 1
	intensity $c7
	note E_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 12
	note E_, 8
	intensity $b1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	intensity $b7
	note D_, 8
	note F_, 8
	note A#, 8
	octave 4
	note D_, 8
	octave 3
	note G_, 8
	octave 4
	note C_, 8
	note E_, 8
	note G_, 8
	note __, 8
	octave 3
	note D#, 8
	note G#, 8
	octave 4
	note C_, 8
	octave 3
	note A#, 8
	note __, 8
	octave 4
	note D_, 8
	octave 3
	note G#, 2
	note F_, 2
	note D_, 2
	note F_, 2
	octave 4
	note C_, 4
	note __, 6
	note C_, 1
	note __, 5
	note C#, 2
	note C_, 1
	note __, 13
	note C#, 4
	note __, 6
	note C#, 1
	note __, 5
	note F_, 2
	note D#, 1
	note __, 5
	note C#, 8
Music_KantoWildBattle_branch_ed15b:
	intensity $b1
	octave 3
	note C_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	loopchannel 8, Music_KantoWildBattle_branch_ed15b
Music_KantoWildBattle_branch_ed166:
	note C#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	loopchannel 8, Music_KantoWildBattle_branch_ed166
Music_KantoWildBattle_branch_ed16e:
	note C_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	loopchannel 16, Music_KantoWildBattle_branch_ed16e
Music_KantoWildBattle_branch_ed176:
	note C#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	loopchannel 8, Music_KantoWildBattle_branch_ed176
Music_KantoWildBattle_branch_ed17e:
	note C_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	loopchannel 8, Music_KantoWildBattle_branch_ed17e
	loopchannel 0, Music_KantoWildBattle_branch_ed091

Music_KantoWildBattle_branch_ed18a:
	octave 4
	note C_, 1
	note __, 5
	octave 3
	note B_, 1
	note __, 5
	note A#, 1
	note __, 3
	note __, 10
	octave 4
	note C_, 2
	note __, 2
	note D#, 2
	note C#, 1
	note __, 5
	note C_, 1
	note __, 5
	octave 3
	note B_, 1
	note __, 3
	endchannel

Music_KantoWildBattle_Ch2:
	dutycycle $1
	vibrato $12, $23
	notetype $c, $b1
	octave 4
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
Music_KantoWildBattle_branch_ed1c8:
	notetype $c, $b7
	callchannel Music_KantoWildBattle_branch_ed2c6
	octave 2
	note F_, 2
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note G_, 2
	callchannel Music_KantoWildBattle_branch_ed2c6
	octave 2
	note G_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note F_, 1
	note F#, 1
	notetype $6, $b7
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	pitchoffset 0, C#
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	pitchoffset 0, C_
rept 4
	callchannel Music_KantoWildBattle_branch_ed307
endr
	pitchoffset 0, C#
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	pitchoffset 0, C_
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	note __, 16
	octave 3
	note A#, 16
	octave 4
	note D_, 16
	note F_, 16
	notetype $c, $b7
	note E_, 16
	note G_, 8
	octave 5
	note C_, 8
	note __, 8
	octave 3
	note G#, 8
	octave 4
	note C_, 8
	note D#, 8
	note F_, 8
	note F_, 1
	octave 3
	note A#, 1
	note G#, 1
	note A#, 1
	octave 4
	note F_, 1
	octave 3
	note A#, 1
	note G#, 1
	note A#, 1
	octave 4
	note G#, 8
	note G#, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G#, 1
	notetype $6, $b7
	callchannel Music_KantoWildBattle_branch_ed31b
	pitchoffset 0, C#
	callchannel Music_KantoWildBattle_branch_ed31b
	pitchoffset 0, C_
	callchannel Music_KantoWildBattle_branch_ed340
	octave 2
	note C_, 2
	note __, 2
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 4
	note C_, 4
	octave 2
	note C_, 2
	note __, 2
	octave 4
	note D#, 4
	octave 2
	note C_, 2
	note __, 2
	octave 4
	note C#, 4
	octave 2
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 4
	octave 2
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 4
	octave 2
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 4
	octave 2
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 4
	octave 2
	note C#, 2
	note __, 2
	octave 4
	note F_, 4
	octave 2
	note C#, 2
	note __, 2
	callchannel Music_KantoWildBattle_branch_ed340
	callchannel Music_KantoWildBattle_branch_ed354
	callchannel Music_KantoWildBattle_branch_ed340
	callchannel Music_KantoWildBattle_branch_ed354
	pitchoffset 0, C#
	callchannel Music_KantoWildBattle_branch_ed340
	pitchoffset 0, C_
	note C#, 2
	note __, 2
	octave 3
	note G#, 4
	octave 2
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 4
	octave 2
	note C#, 2
	note __, 2
	octave 3
	note A#, 4
	octave 2
	note C#, 2
	note __, 2
	callchannel Music_KantoWildBattle_branch_ed340
	note C_, 2
	note __, 2
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 4
	note C_, 4
	octave 2
	note C_, 2
	note __, 2
	octave 3
	note A#, 4
	octave 2
	note C_, 2
	note __, 2
	loopchannel 0, Music_KantoWildBattle_branch_ed1c8

Music_KantoWildBattle_branch_ed2c6:
	octave 2
	note C_, 1
	note __, 2
	note C_, 1
	octave 1
	note G_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note C_, 1
	note __, 1
	octave 1
	note G_, 1
	note __, 2
	note G_, 1
	octave 2
	note C_, 3
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note F#, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note C#, 1
	note __, 2
	note C#, 1
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note C#, 2
	octave 1
	note G#, 1
	note __, 2
	note G#, 1
	octave 2
	note C#, 1
	note __, 2
	note C#, 1
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	octave 1
	note G_, 2
	endchannel

Music_KantoWildBattle_branch_ed307:
	octave 2
	note C_, 2
	note __, 4
	note C_, 1
	note __, 1
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 4
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 4
	endchannel

Music_KantoWildBattle_branch_ed31b:
	octave 2
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	octave 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note C_, 6
	note C_, 2
	note __, 4
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note E_, 2
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note C_, 2
	note __, 4
	note C_, 2
	note E_, 2
	note G_, 2
	note B_, 2
	octave 3
	note C_, 2
	endchannel

Music_KantoWildBattle_branch_ed340:
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	endchannel

Music_KantoWildBattle_branch_ed354:
	note C_, 2
	note __, 2
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	octave 3
	note G_, 4
	octave 2
	note C_, 2
	note __, 2
	endchannel

Music_KantoWildBattle_Ch3:
	vibrato $14, $23
	notetype $c, $14
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	octave 4
	note C#, 1
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	octave 4
	note D#, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	octave 4
	note F_, 1
	octave 3
	note F#, 1
	note __, 1
	note F#, 1
	octave 4
	note F#, 1
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	octave 4
	note G_, 1
Music_KantoWildBattle_branch_ed39e:
	notetype $c, $14
	octave 5
	note G_, 1
	note __, 2
	octave 4
	note G_, 1
	note __, 2
	octave 5
	note G_, 1
	note __, 3
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 2
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 6
	octave 5
	note D#, 2
	note __, 2
	note G_, 2
	note G#, 1
	note __, 2
	octave 4
	note G#, 1
	note __, 2
	octave 5
	note G#, 1
	note __, 3
	octave 4
	note G#, 1
	note __, 1
	octave 5
	note G#, 1
	note __, 2
	octave 4
	note G#, 1
	octave 6
	note C#, 6
	octave 5
	note G#, 1
	note F_, 1
	note B_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	octave 4
	note B_, 1
	octave 5
	note G_, 1
	note __, 2
	octave 4
	note G_, 1
	note __, 2
	octave 5
	note G_, 1
	note __, 3
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 2
	octave 4
	note G_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 6
	octave 5
	note D#, 2
	note __, 2
	note G_, 2
	note G#, 1
	note __, 2
	octave 4
	note G_, 1
	note __, 2
	octave 5
	note G#, 1
	note __, 3
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note G#, 1
	note __, 2
	octave 4
	note G_, 1
	note C#, 4
	note G#, 4
	octave 5
	note F_, 7
	note F#, 1
	note G_, 2
	intensity $24
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	intensity $14
	octave 5
	note F#, 2
	intensity $24
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	intensity $14
	octave 5
	note E_, 2
	intensity $24
	note C_, 1
	octave 4
	note G_, 1
	intensity $14
	octave 5
	note G_, 2
	intensity $24
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	intensity $14
	octave 5
	note A_, 2
	intensity $24
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	intensity $14
	octave 5
	note G_, 2
	intensity $24
	note C_, 1
	octave 4
	note G#, 1
	intensity $14
	octave 5
	note G#, 12
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 2
	note C#, 1
	note F_, 1
	note G#, 1
	octave 6
	note C_, 1
	note C#, 8
	octave 5
	note C_, 2
	intensity $24
	octave 4
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	intensity $14
	note A#, 2
	intensity $24
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	intensity $14
	note G#, 2
	intensity $24
	note E_, 1
	note G_, 1
	intensity $14
	octave 5
	note C#, 2
	intensity $24
	octave 4
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	intensity $14
	octave 5
	note C_, 2
	intensity $24
	octave 4
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	intensity $14
	note A#, 2
	intensity $24
	note E_, 1
	note G_, 1
	intensity $14
	octave 5
	note F_, 2
	intensity $24
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	intensity $14
	note E_, 2
	intensity $24
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	intensity $14
	note D_, 2
	intensity $24
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	intensity $14
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note D_, 4
	note F_, 4
	note G#, 16
	notetype $6, $14
	note G#, 1
	note __, 1
	intensity $24
	note G#, 1
	note __, 1
	intensity $34
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	intensity $24
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	intensity $14
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 5
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	notetype $c, $15
	note G_, 12
	note G_, 8
	notetype $6, $15
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $24
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $14
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype $c, $14
	octave 2
	note A#, 16
	note A#, 1
	note __, 2
	note A#, 1
	note __, 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 2
	note A#, 1
	note __, 2
	note A#, 1
	note __, 1
	note C_, 1
	note __, 2
	notetype $6, $15
	note C_, 1
	note __, 1
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 4
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note C_, 4
	note C_, 2
	note __, 4
	note C_, 1
	note __, 1
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 4
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	octave 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	notetype $c, $14
	note G#, 16
	note G#, 16
	note A#, 2
	note __, 2
	note A#, 1
	note __, 3
	note A#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 5
	note E_, 4
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 5
	note C_, 1
	note __, 1
	note E_, 1
	note __, 5
	note F_, 2
	note E_, 1
	note __, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	octave 5
	note C_, 1
	note E_, 1
	note G_, 1
	note F_, 4
	octave 4
	note C#, 1
	note F_, 1
	note G#, 1
	octave 5
	note C_, 1
	note C#, 1
	note __, 1
	note F_, 1
	note __, 5
	note G#, 2
	note G_, 1
	note __, 5
	note F_, 8
	intensity $13
	note G_, 6
	note F#, 6
	note E_, 2
	note __, 2
	note G_, 6
	note A_, 6
	note G_, 2
	note __, 2
	note G#, 12
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 2
	note __, 4
	octave 6
	note C#, 8
	octave 5
	note C_, 6
	octave 4
	note A#, 6
	note G#, 2
	note __, 2
	octave 5
	note C#, 6
	note C_, 6
	octave 4
	note A#, 2
	note __, 2
	octave 5
	note F_, 6
	note E_, 6
	note D_, 2
	note __, 2
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note D_, 4
	note F_, 4
	note G#, 16
	note G#, 16
	note G_, 16
	note G_, 16
	loopchannel 0, Music_KantoWildBattle_branch_ed39e
