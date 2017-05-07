Music_UnionCave: ; f5c60
	dbw $c0, Music_UnionCave_Ch1
	dbw $01, Music_UnionCave_Ch2
	dbw $02, Music_UnionCave_Ch3
	dbw $03, Music_UnionCave_Ch4
; f5c6c

Music_UnionCave_Ch1: ; f5c6c
	tempo 160
	volume $77
	dutycycle $1
	tone $0002
	vibrato $18, $34
	stereopanning $f
Music_UnionCave_branch_f5c7b: ; f5c7b
	notetype $c, $b3
Music_UnionCave_branch_f5c7e: ; f5c7e
	callchannel Music_UnionCave_branch_f5ccf
	loopchannel 4, Music_UnionCave_branch_f5c7e
Music_UnionCave_branch_f5c85: ; f5c85
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 4
	note C#, 2
	note E_, 2
	note F_, 4
	loopchannel 8, Music_UnionCave_branch_f5c85
Music_UnionCave_branch_f5c91: ; f5c91
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note F_, 4
	note D_, 2
	note F_, 2
	note F#, 4
	loopchannel 4, Music_UnionCave_branch_f5c91
	note __, 4
	intensity $80
	note F_, 16
	note F#, 16
	note G_, 16
	note F#, 16
	note G_, 8
	note F#, 8
	note F_, 8
	note E_, 8
	note G_, 8
	note F#, 8
	octave 4
	note C_, 8
	octave 3
	note A_, 8
	intensity $95
	tone $0004
	callchannel Music_UnionCave_branch_f5ccf
	tone $0008
	callchannel Music_UnionCave_branch_f5ccf
	tone $000c
	callchannel Music_UnionCave_branch_f5ccf
	tone $0010
	callchannel Music_UnionCave_branch_f5ccf
	tone $0002
	loopchannel 0, Music_UnionCave_branch_f5c7b
; f5ccf

Music_UnionCave_branch_f5ccf: ; f5ccf
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 12
	endchannel
; f5cd5

Music_UnionCave_Ch2: ; f5cd5
	dutycycle $3
	vibrato $8, $24
Music_UnionCave_branch_f5cda: ; f5cda
	notetype $c, $c4
	callchannel Music_UnionCave_branch_f5d34
	intensity $c5
	callchannel Music_UnionCave_branch_f5d34
	intensity $c7
	callchannel Music_UnionCave_branch_f5d34
	intensity $c4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 8
	octave 3
	note B_, 4
	octave 4
	note D_, 4
	note F#, 2
	note F_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 8
	note D_, 4
	note C#, 4
	note __, 4
	intensity $a0
	note C_, 16
	note C#, 16
	note D_, 16
	note C#, 16
	note E_, 16
	note D#, 16
	note A#, 16
	note A_, 16
	intensity $a5
	vibrato $6, $44
	callchannel Music_UnionCave_branch_f5d52
	vibrato $4, $33
	callchannel Music_UnionCave_branch_f5d52
	vibrato $2, $22
	callchannel Music_UnionCave_branch_f5d52
	vibrato $1, $41
	callchannel Music_UnionCave_branch_f5d52
	vibrato $8, $24
	loopchannel 0, Music_UnionCave_branch_f5cda
; f5d34

Music_UnionCave_branch_f5d34: ; f5d34
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 2
	note D#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 8
	octave 3
	note A#, 4
	octave 4
	note C#, 4
	note F_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 8
	note C#, 4
	note C_, 4
	endchannel
; f5d52

Music_UnionCave_branch_f5d52: ; f5d52
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 12
	endchannel
; f5d58

Music_UnionCave_Ch3: ; f5d58
	notetype $c, $16
	stereopanning $f0
Music_UnionCave_branch_f5d5d: ; f5d5d
	note __, 16
	loopchannel 7, Music_UnionCave_branch_f5d5d
	note __, 14
	octave 4
	note C_, 2
Music_UnionCave_branch_f5d65: ; f5d65
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note __, 2
	octave 4
	note C_, 2
	loopchannel 4, Music_UnionCave_branch_f5d65
Music_UnionCave_branch_f5d73: ; f5d73
	note __, 2
	octave 3
	note F_, 2
	note __, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note __, 2
	octave 4
	note C#, 2
	loopchannel 4, Music_UnionCave_branch_f5d73
	note __, 4
	note C_, 8
	octave 3
	note B_, 8
	note A#, 8
	note A_, 8
	octave 4
	note C#, 8
	note C_, 8
	octave 3
	note B_, 8
	note A#, 8
Music_UnionCave_branch_f5d8d: ; f5d8d
	note A_, 4
	note G_, 4
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note G_, 2
	loopchannel 3, Music_UnionCave_branch_f5d8d
	note A_, 4
	note G_, 4
	note A#, 8
Music_UnionCave_branch_f5d9c: ; f5d9c
	note __, 16
	loopchannel 4, Music_UnionCave_branch_f5d9c
	loopchannel 0, Music_UnionCave_branch_f5d5d
; f5da5

Music_UnionCave_Ch4: ; f5da5
	togglenoise $1
	notetype $c
Music_UnionCave_branch_f5da9: ; f5da9
	stereopanning $f0
	note E_, 4
	stereopanning $ff
	note F_, 4
	stereopanning $f
	note G#, 4
	note __, 8
	stereopanning $f
	note E_, 4
	stereopanning $ff
	note F_, 4
	stereopanning $f0
	note G#, 4
	note __, 8
	loopchannel 0, Music_UnionCave_branch_f5da9
; f5dc1





