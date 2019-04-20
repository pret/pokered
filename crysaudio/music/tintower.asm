Music_TinTower:
	musicheader 4, 1, Music_TinTower_Ch1
	musicheader 1, 2, Music_TinTower_Ch2
	musicheader 1, 3, Music_TinTower_Ch3
	musicheader 1, 4, Music_TinTower_Ch4

Music_TinTower_Ch1:
	tempo 208
	volume $77
	dutycycle $3
	tone $0004
	vibrato $8, $45
Music_TinTower_branch_f682a:
	stereopanning $f0
	notetype $c, $a5
	octave 3
	note G_, 4
	note C_, 4
	note G#, 8
	note G_, 4
	note C_, 4
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	octave 2
	note A#, 2
	octave 3
	note G_, 4
	note C_, 4
	note G#, 4
	note F_, 4
	note G_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 6
	note A#, 2
	note G_, 2
	note F_, 2
	note C#, 2
	note G_, 2
	note G#, 8
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note G#, 2
	note G_, 2
	note F_, 2
	note G#, 2
	note G_, 2
	note C#, 2
	octave 2
	note A#, 2
	octave 3
	note G_, 2
	note G#, 4
	note F_, 4
	note G_, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 8
	intensity $a2
	octave 2
	note G_, 4
	note G_, 12
	note G_, 4
	note G_, 8
	intensity $a7
	note G_, 4
	intensity $a2
	note G#, 4
	note G#, 8
	intensity $a7
	note G_, 4
	intensity $a2
	note G#, 4
	note G#, 8
	intensity $a7
	note A#, 4
	intensity $a2
	note G_, 4
	note G_, 12
	note G_, 4
	note G_, 12
	note G_, 4
	note G_, 12
	note G_, 4
	note G_, 8
	intensity $a5
	octave 3
	note A#, 4
	loopchannel 0, Music_TinTower_branch_f682a

Music_TinTower_Ch2:
	dutycycle $3
	tone $0002
	vibrato $18, $44
Music_TinTower_branch_f6893:
	stereopanning $ff
Music_TinTower_branch_f6895:
	notetype $c, $b5
	octave 4
	note C_, 4
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note C_, 4
	note F_, 4
	note C#, 4
	octave 3
	note A#, 4
	octave 4
	note C_, 4
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note C_, 4
	octave 3
	note C_, 4
	octave 4
	note C_, 8
	stereopanning $f
	loopchannel 2, Music_TinTower_branch_f6895
	intensity $b2
	octave 3
	note C_, 4
	note C_, 12
	note C_, 4
	note C_, 8
	intensity $b7
	note C_, 4
	intensity $b2
	note C#, 4
	note C#, 8
	intensity $b7
	note C_, 4
	intensity $b2
	note C#, 4
	note C#, 8
	intensity $b7
	note D#, 4
	intensity $90
	stereopanning $ff
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note G_, 4
	note C_, 4
	note G_, 8
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note C_, 4
	octave 4
	note C_, 6
	intensity $95
	note C#, 2
	loopchannel 0, Music_TinTower_branch_f6893

Music_TinTower_Ch3:
	notetype $c, $14
Music_TinTower_branch_f68fb:
	note __, 16
	note __, 16
	note __, 16
	note __, 10
	octave 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 3
	note C_, 8
	note C#, 8
	note E_, 8
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note D#, 2
	note C_, 8
	note C#, 8
	note E_, 8
	octave 4
	note C_, 8
	octave 3
	note C_, 1
	note __, 3
	note C_, 1
	note __, 11
	note C_, 1
	note __, 3
	note C_, 1
	note __, 7
	note C_, 4
	note C#, 1
	note __, 3
	note C#, 1
	note __, 7
	note C_, 4
	note C#, 1
	note __, 3
	note C#, 1
	note __, 7
	note D#, 4
	stereopanning $f
	note C_, 1
	note __, 3
	note C_, 1
	note __, 11
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	stereopanning $ff
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note D#, 2
	stereopanning $f
	note C_, 1
	note __, 3
	note C_, 1
	note __, 11
	note C_, 1
	note __, 3
	note C_, 1
	note __, 11
	stereopanning $ff
	loopchannel 0, Music_TinTower_branch_f68fb

Music_TinTower_Ch4:
	togglenoise $0
	notetype $c
Music_TinTower_branch_f694c:
	stereopanning $f
	note G_, 2
	stereopanning $f0
	note G_, 1
	note G_, 1
	stereopanning $f
	note G_, 2
	stereopanning $f0
	note F_, 4
	stereopanning $f
	note G_, 2
	note G_, 2
	note F_, 2
	stereopanning $f0
	note G_, 2
	stereopanning $f
	note G_, 1
	note G_, 1
	stereopanning $f0
	note G_, 2
	stereopanning $f
	note F_, 4
	stereopanning $f0
	note G_, 2
	note G_, 2
	note F_, 2
	loopchannel 0, Music_TinTower_branch_f694c
