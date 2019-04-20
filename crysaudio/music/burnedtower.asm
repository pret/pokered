Music_BurnedTower:
	musicheader 4, 1, Music_BurnedTower_Ch1
	musicheader 1, 2, Music_BurnedTower_Ch2
	musicheader 1, 3, Music_BurnedTower_Ch3
	musicheader 1, 4, Music_BurnedTower_Ch4

Music_BurnedTower_Ch1:
	tempo 168
	volume $77
	dutycycle $1
	tone $0004
	vibrato $8, $45
	stereopanning $f0
	notetype $c, $91
	note __, 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $80
	octave 3
	note D#, 6
	intensity $91
	note D_, 4
	note D_, 4
	note D_, 2
	intensity $80
	note C#, 6
Music_BurnedTower_branch_f6ac8:
	intensity $91
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $80
	note A#, 6
	loopchannel 2, Music_BurnedTower_branch_f6ac8
	tempo 150
Music_BurnedTower_branch_f6ad8:
	intensity $b1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $a0
	octave 3
	note D#, 6
	intensity $b1
	note D_, 4
	note D_, 4
	note D_, 2
	intensity $a0
	note C#, 6
	intensity $b1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $a0
	note A#, 6
	intensity $b1
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $b3
	note A#, 16
	note A#, 16
	note A#, 16
	note G#, 6
	intensity $b1
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $a0
	note A#, 6
	intensity $b1
	note B_, 4
	note B_, 4
	note B_, 2
	intensity $a0
	octave 3
	note F_, 6
	intensity $b1
	note E_, 4
	note E_, 4
	note E_, 2
	intensity $a0
	note D#, 6
Music_BurnedTower_branch_f6b17:
	intensity $b1
	octave 2
	note B_, 4
	note B_, 4
	note B_, 2
	intensity $a0
	octave 3
	note C_, 6
	loopchannel 2, Music_BurnedTower_branch_f6b17
	loopchannel 0, Music_BurnedTower_branch_f6ad8

Music_BurnedTower_Ch2:
	dutycycle $2
	vibrato $20, $82
	tone $0002
	notetype $c, $70
	callchannel Music_BurnedTower_branch_f6b8e
	intensity $c5
Music_BurnedTower_branch_f6b39:
	callchannel Music_BurnedTower_branch_f6b8e
	intensity $c1
	dutycycle $3
	note __, 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $b0
	octave 3
	note D#, 6
	intensity $c1
	note D_, 4
	note D_, 4
	note D_, 2
	intensity $b0
	note C#, 6
	intensity $c1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	intensity $b0
	note A#, 4
	intensity $c1
	intensity $c2
	octave 3
	note A_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 1
	vibrato $0, $0
	intensity $3d
	note E_, 8
	vibrato $20, $83
	intensity $b0
	octave 2
	note G_, 4
	dutycycle $2
	intensity $b0
	octave 3
	note F#, 4
	note E_, 2
	note F#, 2
	note G_, 4
	note B_, 4
	octave 4
	note C#, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 2
	note F#, 2
	note G_, 4
	note E_, 4
	intensity $b7
	note F#, 16
	loopchannel 0, Music_BurnedTower_branch_f6b39

Music_BurnedTower_branch_f6b8e:
	octave 3
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 4
	note F_, 4
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 4
	note D_, 4
	note E_, 16
	endchannel

Music_BurnedTower_Ch3:
	stereopanning $f
	notetype $c, $14
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	octave 3
	note D#, 4
Music_BurnedTower_branch_f6bad:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note F_, 4
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note D#, 4
	loopchannel 4, Music_BurnedTower_branch_f6bad
Music_BurnedTower_branch_f6bc3:
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note G_, 4
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note F_, 4
	loopchannel 2, Music_BurnedTower_branch_f6bc3
	loopchannel 0, Music_BurnedTower_branch_f6bad

Music_BurnedTower_Ch4:
	togglenoise $0
	notetype $c
Music_BurnedTower_branch_f6be1:
	note __, 16
	loopchannel 4, Music_BurnedTower_branch_f6be1
	note __, 2
Music_BurnedTower_branch_f6be7:
	stereopanning $f0
	note G_, 2
	note G#, 2
	note G_, 4
	note G#, 2
	note G_, 4
	loopchannel 0, Music_BurnedTower_branch_f6be7
