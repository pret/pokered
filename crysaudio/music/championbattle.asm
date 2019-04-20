Music_ChampionBattle:
	musicheader 3, 1, Music_ChampionBattle_Ch1
	musicheader 1, 2, Music_ChampionBattle_Ch2
	musicheader 1, 3, Music_ChampionBattle_Ch3

Music_ChampionBattle_Ch1:
	tempo 98
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
	octave 2
	note A#, 8
	note A#, 8
	note A#, 8
	note A#, 4
	intensity $b7
	note B_, 4
Music_ChampionBattle_branch_ea9e2:
	callchannel Music_ChampionBattle_branch_eaaee
	octave 3
	note D#, 4
	loopchannel 2, Music_ChampionBattle_branch_ea9e2
	callchannel Music_ChampionBattle_branch_eaaee
	octave 3
	note E_, 4
Music_ChampionBattle_branch_ea9f0:
	callchannel Music_ChampionBattle_branch_eaafc
	loopchannel 3, Music_ChampionBattle_branch_ea9f0
	callchannel Music_ChampionBattle_branch_eab06
Music_ChampionBattle_branch_ea9fa:
	callchannel Music_ChampionBattle_branch_eaafc
	loopchannel 7, Music_ChampionBattle_branch_ea9fa
	callchannel Music_ChampionBattle_branch_eab06
	intensity $b2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note E_, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note F#, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note G#, 4
	intensity $a0
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note B_, 12
	intensity $b2
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
Music_ChampionBattle_branch_eaa35:
	callchannel Music_ChampionBattle_branch_eab0f
	note E_, 2
	note E_, 2
	intensity $b7
	note F#, 4
Music_ChampionBattle_branch_eaa3d:
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note G#, 4
	loopchannel 2, Music_ChampionBattle_branch_eaa3d
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note B_, 4
	callchannel Music_ChampionBattle_branch_eab0f
	note E_, 2
	note E_, 2
	intensity $b7
	note F#, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note G#, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note B_, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	octave 4
	note E_, 4
	callchannel Music_ChampionBattle_branch_eab24
	note B_, 4
	note G#, 4
	callchannel Music_ChampionBattle_branch_eab24
	octave 4
	note D_, 4
	note D_, 4
	intensity $a0
	octave 3
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note F#, 8
	octave 2
	note F#, 8
	intensity $60
	note B_, 16
	intensity $70
	note B_, 16
	intensity $80
	octave 3
	note C#, 16
	intensity $a0
	note D#, 16
	intensity $b4
	octave 4
	note F#, 4
	note F_, 4
	note E_, 4
	note D#, 4
	note D_, 4
	note C#, 4
	note F#, 4
	note F#, 4
	note F#, 4
	note F_, 4
	note E_, 4
	note D#, 4
	note F#, 2
	note G#, 2
	note D#, 2
	note E_, 2
	note F#, 4
	note F#, 4
	note __, 16
	intensity $90
	octave 3
	note F#, 8
	intensity $b4
	note E_, 4
	note E_, 4
	intensity $90
	note D#, 16
	note C#, 16
Music_ChampionBattle_branch_eaab1:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	loopchannel 4, Music_ChampionBattle_branch_eaab1
Music_ChampionBattle_branch_eaabe:
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note D#, 4
	loopchannel 2, Music_ChampionBattle_branch_eaabe
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note F#, 4
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note G#, 4
	callchannel Music_ChampionBattle_branch_eab31
	octave 3
	note D#, 2
	note D#, 2
	intensity $b7
	note B_, 4
	callchannel Music_ChampionBattle_branch_eab31
	octave 3
	note D#, 2
	note D#, 2
	intensity $b7
	octave 4
	note D_, 4
	loopchannel 0, Music_ChampionBattle_branch_eaa35

Music_ChampionBattle_branch_eaaee:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 2
	intensity $b7
	endchannel

Music_ChampionBattle_branch_eaafc:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	endchannel

Music_ChampionBattle_branch_eab06:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	note B_, 4
	endchannel

Music_ChampionBattle_branch_eab0f:
	intensity $b5
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note F#, 4
	note F_, 2
	note E_, 2
	note B_, 2
	note F#, 2
	note A#, 2
	note F_, 2
	note A_, 2
	note E_, 2
	note G#, 2
	note D#, 2
	note G_, 2
	intensity $b2
	endchannel

Music_ChampionBattle_branch_eab24:
	intensity $b2
	octave 3
	note A#, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 2
	intensity $b7
	endchannel

Music_ChampionBattle_branch_eab31:
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	note A#, 4
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	note B_, 4
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	octave 4
	note C#, 4
	intensity $b2
	endchannel

Music_ChampionBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	octave 3
	note D#, 8
	note D#, 8
	note D#, 8
	note D#, 4
	intensity $c7
	note D_, 4
	callchannel Music_ChampionBattle_branch_eac4f
	note A#, 4
	callchannel Music_ChampionBattle_branch_eac4f
	note B_, 4
	callchannel Music_ChampionBattle_branch_eac4f
	octave 4
	note C#, 4
	callchannel Music_ChampionBattle_branch_eac5c
	note D_, 4
	callchannel Music_ChampionBattle_branch_eac5c
	note F_, 4
	callchannel Music_ChampionBattle_branch_eac5c
	note D_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C_, 4
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C#, 4
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note E_, 8
	intensity $3c
	note E_, 8
Music_ChampionBattle_branch_eab9d:
	intensity $c5
	note D#, 6
	octave 3
	note A#, 6
	octave 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C_, 4
	octave 3
	note B_, 4
	note A#, 4
	intensity $c7
	note B_, 8
	octave 4
	note E_, 8
	intensity $c2
	octave 3
	note G#, 2
	note G#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note G#, 2
	note G#, 2
	intensity $c7
	octave 4
	note C#, 4
	intensity $c5
	note D#, 6
	octave 3
	note A#, 6
	octave 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C_, 4
	octave 3
	note B_, 4
	note A#, 2
	note B_, 2
	intensity $c7
	octave 4
	note E_, 8
	note G#, 8
	note E_, 8
	note B_, 8
	callchannel Music_ChampionBattle_branch_eac79
	note E_, 4
	note E_, 4
	callchannel Music_ChampionBattle_branch_eac79
	note F#, 4
	note F#, 4
	intensity $c7
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note C#, 8
	octave 3
	note C#, 8
	intensity $b0
	note D#, 16
	note D#, 16
	note F_, 16
	note F#, 16
	intensity $c4
Music_ChampionBattle_branch_eabef:
	octave 5
	note D#, 4
	note D_, 4
	note C#, 4
	note C_, 4
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 4
	note B_, 4
	note B_, 4
	loopchannel 2, Music_ChampionBattle_branch_eabef
	intensity $b0
	octave 3
	note D#, 16
	note B_, 16
	note A#, 16
	note G#, 16
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C#, 4
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note D_, 4
	intensity $b0
	note D#, 8
	note E_, 8
	note F#, 8
	note E_, 8
	note D#, 8
	note E_, 8
	note F#, 8
	note G#, 8
	loopchannel 0, Music_ChampionBattle_branch_eab9d

Music_ChampionBattle_branch_eac4f:
	intensity $c2
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 2
	intensity $c7
	endchannel

Music_ChampionBattle_branch_eac5c:
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	endchannel

Music_ChampionBattle_branch_eac79:
	intensity $c1
	note D#, 2
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 2
	intensity $c5
	endchannel

Music_ChampionBattle_Ch3:
	notetype $c, $14
Music_ChampionBattle_branch_eac88:
	octave 3
	note D#, 1
	note __, 7
	loopchannel 3, Music_ChampionBattle_branch_eac88
	note D#, 1
	note __, 3
	note E_, 4
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead6f
	note D_, 4
	callchannel Music_ChampionBattle_branch_ead6f
	note A_, 4
	callchannel Music_ChampionBattle_branch_ead6f
	note D_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
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
	octave 4
	note C#, 4
	note D#, 8
	octave 3
	note D#, 8
	note B_, 4
	note G_, 2
	note B_, 2
	note F#, 2
	note A#, 2
	note F_, 2
	note A_, 2
Music_ChampionBattle_branch_eacc6:
	note D#, 2
	note A#, 2
	loopchannel 8, Music_ChampionBattle_branch_eacc6
Music_ChampionBattle_branch_eaccc:
	note E_, 2
	note B_, 2
	loopchannel 5, Music_ChampionBattle_branch_eaccc
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
Music_ChampionBattle_branch_eacda:
	note D#, 2
	note A#, 2
	loopchannel 8, Music_ChampionBattle_branch_eacda
Music_ChampionBattle_branch_eace0:
	note E_, 2
	note B_, 2
	loopchannel 8, Music_ChampionBattle_branch_eace0
	callchannel Music_ChampionBattle_branch_ead83
	octave 3
	note D#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	callchannel Music_ChampionBattle_branch_ead83
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 8
	note D#, 8
	note B_, 8
	note D#, 8
Music_ChampionBattle_branch_ead05:
	note D#, 2
	note F#, 2
	loopchannel 16, Music_ChampionBattle_branch_ead05
	callchannel Music_ChampionBattle_branch_ead8e
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	note F#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	callchannel Music_ChampionBattle_branch_ead8e
Music_ChampionBattle_branch_ead1d:
	octave 3
	note E_, 2
	note B_, 2
	loopchannel 4, Music_ChampionBattle_branch_ead1d
Music_ChampionBattle_branch_ead24:
	note D#, 2
	note A#, 2
	loopchannel 5, Music_ChampionBattle_branch_ead24
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
Music_ChampionBattle_branch_ead32:
	note E_, 2
	note B_, 2
	loopchannel 5, Music_ChampionBattle_branch_ead32
	octave 4
	note C#, 2
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
Music_ChampionBattle_branch_ead40:
	note D#, 2
	note G#, 2
	loopchannel 8, Music_ChampionBattle_branch_ead40
Music_ChampionBattle_branch_ead46:
	note D#, 2
	note A#, 2
	loopchannel 7, Music_ChampionBattle_branch_ead46
	note B_, 2
	note A#, 2
Music_ChampionBattle_branch_ead4e:
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D_, 2
	note D#, 2
	loopchannel 7, Music_ChampionBattle_branch_ead4e
	note C#, 2
	octave 3
	note B_, 2
	note A#, 2
	note G#, 2
	loopchannel 0, Music_ChampionBattle_branch_eacc6

Music_ChampionBattle_branch_ead61:
	note D#, 1
	note __, 1
	note D#, 1
	note __, 5
	loopchannel 3, Music_ChampionBattle_branch_ead61
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	endchannel

Music_ChampionBattle_branch_ead6f:
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
	note D#, 1
	note __, 1
	endchannel

Music_ChampionBattle_branch_ead83:
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	endchannel

Music_ChampionBattle_branch_ead8e:
	octave 3
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	endchannel
