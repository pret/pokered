Music_TinTower: ; f6811
	dbw $c0, Music_TinTower_Ch1
	dbw $01, Music_TinTower_Ch2
	dbw $02, Music_TinTower_Ch3
	dbw $03, Music_TinTower_Ch4
; f681d

Music_TinTower_Ch1: ; f681d
	tempo 208
	volume $77
	dutycycle $3
	tone $0004
	vibrato $8, $45
Music_TinTower_branch_f682a: ; f682a
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
; f688b

Music_TinTower_Ch2: ; f688b
	dutycycle $3
	tone $0002
	vibrato $18, $44
Music_TinTower_branch_f6893: ; f6893
	stereopanning $ff
Music_TinTower_branch_f6895: ; f6895
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
; f68f8

Music_TinTower_Ch3: ; f68f8
	notetype $c, $14
Music_TinTower_branch_f68fb: ; f68fb
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
; f6948

Music_TinTower_Ch4: ; f6948
	togglenoise $0
	notetype $c
Music_TinTower_branch_f694c: ; f694c
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
; f6974


