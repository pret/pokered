Music_KantoGymBattle:
	musicheader 3, 1, Music_KantoGymBattle_Ch1
	musicheader 1, 2, Music_KantoGymBattle_Ch2
	musicheader 1, 3, Music_KantoGymBattle_Ch3

Music_KantoGymBattle_Ch1:
	tempo 101
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
	octave 3
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	intensity $b7
	note B_, 2
	intensity $b2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	intensity $b7
	octave 3
	note E_, 2
	intensity $b2
	octave 2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	intensity $b7
	note B_, 2
	intensity $b2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	intensity $b4
	octave 3
	note E_, 4
	note E_, 4
	note E_, 2
Music_KantoGymBattle_branch_ec78b:
	callchannel Music_KantoGymBattle_branch_ec832
	octave 2
	note A#, 2
	intensity $b7
	note G#, 8
	note B_, 8
	octave 3
	note D#, 10
	note E_, 6
	callchannel Music_KantoGymBattle_branch_ec832
	note D#, 2
	intensity $b7
	note C#, 8
	octave 2
	note B_, 8
	note G#, 10
	octave 3
	note E_, 6
	intensity $b2
	note D#, 2
	note D#, 2
	note G_, 1
	note E_, 1
	note D#, 1
	note G_, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note E_, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note D#, 2
	intensity $b7
	note E_, 2
	intensity $b2
	note D#, 2
	note D#, 2
	note G_, 1
	note E_, 1
	note D#, 1
	note G_, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note E_, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note G#, 2
	intensity $b5
	note B_, 2
	note D#, 2
	note C#, 2
	octave 2
	note A#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	note D#, 4
	note C#, 2
	octave 2
	note A#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 3
	note C#, 2
	intensity $b7
	octave 2
	note B_, 8
	note A#, 8
	note G#, 10
	note B_, 6
	intensity $b5
	octave 3
	note D#, 2
	note C#, 2
	octave 2
	note A#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	note D#, 4
	note C#, 2
	octave 2
	note A#, 2
	note A#, 2
	note G#, 2
	note A#, 2
	octave 3
	note C#, 2
	intensity $b7
	note E_, 8
	note F#, 8
	note G_, 16
	intensity $b2
	octave 2
	note G#, 2
	note G#, 2
	intensity $b7
	octave 3
	note C#, 12
	intensity $b2
	note G#, 2
	note F_, 4
	intensity $b5
	octave 2
	note F_, 4
	note G_, 2
	note G#, 2
	note A#, 2
	intensity $b2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 12
	intensity $b2
	note A#, 2
	note G_, 4
	intensity $b7
	octave 4
	note D#, 6
	intensity $4c
	octave 3
	note D_, 4
	loopchannel 0, Music_KantoGymBattle_branch_ec78b

Music_KantoGymBattle_branch_ec832:
	intensity $b5
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 2
	octave 2
	note A#, 2
	note D#, 2
	note G#, 2
	note A#, 2
	octave 3
	note D#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	endchannel

Music_KantoGymBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
Music_KantoGymBattle_branch_ec852:
	octave 4
	note A#, 1
	note G#, 1
	note A#, 1
	octave 5
	note D#, 1
	loopchannel 8, Music_KantoGymBattle_branch_ec852
	octave 3
Music_KantoGymBattle_branch_ec85d:
	intensity $c2
	note D#, 2
	note D#, 2
	note F#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note F#, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note D_, 2
	intensity $c7
	note E_, 2
	intensity $c2
	note D#, 2
	note D#, 2
	note F#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note F#, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note G#, 2
	intensity $c7
	note B_, 2
	intensity $c2
	octave 4
	loopchannel 2, Music_KantoGymBattle_branch_ec85d
Music_KantoGymBattle_branch_ec894:
	callchannel Music_KantoGymBattle_branch_ec907
	note E_, 8
	note G#, 8
	note B_, 10
	note G#, 6
	callchannel Music_KantoGymBattle_branch_ec907
	note E_, 8
	note G#, 8
	note B_, 10
	octave 4
	note E_, 6
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $a2
	note __, 6
	octave 5
	note E_, 4
	note E_, 4
	note E_, 2
	intensity $a0
	note D#, 8
	intensity $a7
	note D#, 8
	note __, 12
	intensity $c5
	octave 3
	note A#, 4
	note B_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	note G#, 4
	note E_, 4
	intensity $b0
	note D#, 8
	note D#, 16
	intensity $b7
	note D#, 12
	intensity $c5
	note A#, 4
	note B_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	note G#, 4
	note B_, 4
	intensity $b0
	note A#, 8
	intensity $b7
	note A#, 8
	intensity $b0
	octave 4
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $c2
	octave 3
	note C#, 2
	note C#, 2
	intensity $c7
	note F_, 8
	intensity $c2
	octave 4
	note C#, 4
	note F_, 2
	note C#, 4
	intensity $c7
	note G#, 4
	note G_, 2
	note F_, 2
	note D#, 2
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	note G_, 8
	intensity $c2
	octave 4
	note D#, 4
	note G_, 2
	note D#, 4
	intensity $c7
	note A#, 6
	octave 3
	note A_, 4
	loopchannel 0, Music_KantoGymBattle_branch_ec894

Music_KantoGymBattle_branch_ec907:
	dutycycle $2
	intensity $d1
	octave 3
	note A#, 2
	intensity $a2
	note A#, 2
	intensity $d1
	note G#, 2
	intensity $a2
	note G#, 2
	intensity $d1
	note A#, 2
	intensity $a2
	note A#, 2
	intensity $c5
	note B_, 2
	octave 4
	note C#, 2
	note C#, 2
	octave 3
	note B_, 4
	note A#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A#, 2
	dutycycle $3
	intensity $b0
	endchannel

Music_KantoGymBattle_Ch3:
	notetype $c, $19
	octave 2
	note E_, 1
	note __, 1
Music_KantoGymBattle_branch_ec934:
	note B_, 3
	note __, 1
	loopchannel 6, Music_KantoGymBattle_branch_ec934
	note B_, 2
	note G#, 2
	note B_, 2
Music_KantoGymBattle_branch_ec93d:
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D_, 1
	note __, 1
	note F_, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note E_, 2
	loopchannel 2, Music_KantoGymBattle_branch_ec93d
Music_KantoGymBattle_branch_ec965:
	octave 2
	note D#, 2
	note A#, 2
	loopchannel 8, Music_KantoGymBattle_branch_ec965
Music_KantoGymBattle_branch_ec96c:
	note E_, 2
	note B_, 2
	loopchannel 4, Music_KantoGymBattle_branch_ec96c
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 4
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
Music_KantoGymBattle_branch_ec97f:
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	loopchannel 8, Music_KantoGymBattle_branch_ec97f
Music_KantoGymBattle_branch_ec987:
	octave 2
	note E_, 2
	note B_, 2
	loopchannel 7, Music_KantoGymBattle_branch_ec987
	octave 3
	note E_, 2
	octave 2
	note B_, 2
Music_KantoGymBattle_branch_ec992:
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note E_, 2
	loopchannel 2, Music_KantoGymBattle_branch_ec992
Music_KantoGymBattle_branch_ec9a8:
	note D#, 2
	note A#, 2
	loopchannel 7, Music_KantoGymBattle_branch_ec9a8
	octave 3
	note C#, 2
	octave 2
	note A#, 2
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
Music_KantoGymBattle_branch_ec9bb:
	octave 2
	note E_, 2
	note B_, 2
	loopchannel 5, Music_KantoGymBattle_branch_ec9bb
Music_KantoGymBattle_branch_ec9c2:
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	loopchannel 7, Music_KantoGymBattle_branch_ec9c2
	octave 2
	note A#, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	note A#, 2
	octave 3
	note E_, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note C#, 2
Music_KantoGymBattle_branch_ec9d8:
	octave 2
	note D#, 2
	note A#, 2
	loopchannel 4, Music_KantoGymBattle_branch_ec9d8
Music_KantoGymBattle_branch_ec9df:
	note C#, 2
	note G#, 2
	loopchannel 8, Music_KantoGymBattle_branch_ec9df
Music_KantoGymBattle_branch_ec9e5:
	note D#, 2
	note A#, 2
	loopchannel 4, Music_KantoGymBattle_branch_ec9e5
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note A#, 2
	octave 3
	note D#, 2
	note F_, 2
	loopchannel 0, Music_KantoGymBattle_branch_ec965
