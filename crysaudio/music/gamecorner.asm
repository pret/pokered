Music_GameCorner: ; edd6d
	dbw $c0, Music_GameCorner_Ch1
	dbw $01, Music_GameCorner_Ch2
	dbw $02, Music_GameCorner_Ch3
	dbw $03, Music_GameCorner_Ch4
; edd79

Music_GameCorner_Ch1: ; edd79
	tempo 147
	volume $77
	stereopanning $f
	notetype $c, $91
	note __, 8
Music_GameCorner_branch_edd84: ; edd84
	intensity $91
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede13
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede13
	octave 3
	note __, 2
	note G#, 3
	note G#, 3
	note A#, 2
	note A#, 2
	note G#, 2
	note G_, 2
	intensity $71
Music_GameCorner_branch_eddb1: ; eddb1
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note F_, 1
	note C_, 1
	loopchannel 4, Music_GameCorner_branch_eddb1
Music_GameCorner_branch_eddbb: ; eddbb
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	loopchannel 4, Music_GameCorner_branch_eddbb
Music_GameCorner_branch_eddc5: ; eddc5
	octave 4
	note D#, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	loopchannel 4, Music_GameCorner_branch_eddc5
Music_GameCorner_branch_eddd0: ; eddd0
	octave 4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	loopchannel 4, Music_GameCorner_branch_eddd0
Music_GameCorner_branch_edddb: ; edddb
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note F_, 1
	note C_, 1
	loopchannel 4, Music_GameCorner_branch_edddb
Music_GameCorner_branch_edde5: ; edde5
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	loopchannel 4, Music_GameCorner_branch_edde5
Music_GameCorner_branch_eddef: ; eddef
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	loopchannel 4, Music_GameCorner_branch_eddef
	octave 3
	note D_, 1
	note D_, 1
	note D_, 3
	note F_, 2
	note F_, 9
	loopchannel 0, Music_GameCorner_branch_edd84
; ede03

Music_GameCorner_branch_ede03: ; ede03
	note __, 2
	octave 4
	note A#, 3
	note G_, 3
	note D#, 3
	octave 3
	note F_, 3
	note F_, 2
	note __, 2
	note G#, 3
	note G#, 3
	note A#, 2
	note A#, 2
	note G#, 1
	note A#, 3
	endchannel
; ede13

Music_GameCorner_branch_ede13: ; ede13
	note __, 2
	octave 4
	note A#, 3
	note G_, 3
	note D#, 3
	octave 3
	note F_, 3
	note F_, 2
	endchannel
; ede1c

Music_GameCorner_Ch2: ; ede1c
	stereopanning $ff
	vibrato $8, $24
	notetype $c, $a1
	note __, 8
Music_GameCorner_branch_ede25: ; ede25
	intensity $92
	dutycycle $1
	callchannel Music_GameCorner_branch_ede75
	octave 1
	note F_, 2
	octave 3
	note G#, 2
	octave 1
	note F_, 1
	octave 3
	note G#, 2
	intensity $a4
	note G#, 3
	intensity $92
	note G_, 2
	note A#, 1
	octave 4
	note C_, 3
	callchannel Music_GameCorner_branch_ede75
	octave 4
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	intensity $a4
	note G_, 3
	note F_, 4
	dutycycle $2
	intensity $c7
	octave 3
	note D#, 1
	note F_, 1
	note G_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	note D#, 6
	note F_, 4
	note D_, 6
	note C_, 6
	octave 2
	note A#, 4
	note A_, 4
	note __, 10
	octave 3
	note D#, 1
	note F_, 1
	note G_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	note D#, 6
	note F_, 2
	note D#, 1
	note F_, 1
	note G_, 16
	intensity $92
	note G_, 1
	note G_, 1
	note G_, 3
	note A#, 2
	note A#, 9
	intensity $a4
	loopchannel 0, Music_GameCorner_branch_ede25
; ede75

Music_GameCorner_branch_ede75: ; ede75
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note D#, 3
	note F_, 3
	note F_, 2
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note F_, 2
	note F_, 2
	note D#, 1
	note F_, 3
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note D#, 3
	note F_, 3
	note F_, 2
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note F_, 2
	note C_, 2
	note D#, 1
	note F_, 3
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	intensity $a4
	note F_, 3
	note G_, 4
	intensity $92
	note F#, 1
	note F_, 1
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	octave 1
	note F_, 1
	octave 4
	note F_, 1
	note D#, 2
	note G_, 1
	note D#, 2
	intensity $a4
	note A#, 3
	note A_, 2
	intensity $92
	note A#, 1
	octave 5
	note C_, 3
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	intensity $a4
	note F_, 3
	note G_, 4
	intensity $92
	note F#, 1
	note F_, 1
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	endchannel
; edee8

Music_GameCorner_Ch3: ; edee8
	vibrato $8, $22
	notetype $c, $14
	note __, 8
Music_GameCorner_branch_edeef: ; edeef
	stereopanning $ff
	notetype $c, $14
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note G_, 1
	note A_, 3
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	stereopanning $f0
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee024
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	stereopanning $ff
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 2
	note F_, 1
	octave 5
	note C_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 3
	note D_, 1
	note __, 1
	note D#, 1
	note F_, 1
	note __, 2
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note G_, 1
	note A_, 3
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	stereopanning $f0
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee024
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	intensity $15
	callchannel Music_GameCorner_branch_ee03f
	octave 2
	note C_, 2
	note __, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 2
	octave 3
	note C_, 1
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	octave 2
	note F_, 2
	note __, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 2
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note F_, 1
	callchannel Music_GameCorner_branch_ee03f
	octave 2
	note G_, 2
	note __, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	octave 2
	note B_, 1
	note B_, 1
	note B_, 1
	note __, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 4
	notetype $6, $15
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	loopchannel 0, Music_GameCorner_branch_edeef
; edfdd

Music_GameCorner_branch_edfdd: ; edfdd
	octave 2
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A_, 2
	endchannel
; edff8

Music_GameCorner_branch_edff8: ; edff8
	octave 2
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel
; ee00c

Music_GameCorner_branch_ee00c: ; ee00c
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note D_, 3
	endchannel
; ee024

Music_GameCorner_branch_ee024: ; ee024
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note D_, 1
	octave 3
	note F_, 1
	note __, 1
	endchannel
; ee03f

Music_GameCorner_branch_ee03f: ; ee03f
	octave 2
	note F_, 2
	note __, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 2
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note F_, 1
	octave 2
	note G_, 2
	note __, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note D#, 1
	octave 3
	note D#, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	endchannel
; ee06f

Music_GameCorner_Ch4: ; ee06f
	togglenoise $3
	notetype $c
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 1
Music_GameCorner_branch_ee07f: ; ee07f
	callchannel Music_GameCorner_branch_ee106
Music_GameCorner_branch_ee082: ; ee082
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 6, Music_GameCorner_branch_ee082
	callchannel Music_GameCorner_branch_ee10f
Music_GameCorner_branch_ee091: ; ee091
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, Music_GameCorner_branch_ee091
	note __, 12
	note D_, 1
	note D_, 1
	note F#, 2
	callchannel Music_GameCorner_branch_ee106
Music_GameCorner_branch_ee0a4: ; ee0a4
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 6, Music_GameCorner_branch_ee0a4
	callchannel Music_GameCorner_branch_ee10f
Music_GameCorner_branch_ee0b3: ; ee0b3
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, Music_GameCorner_branch_ee0b3
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
Music_GameCorner_branch_ee0c9: ; ee0c9
	note A#, 2
	note F#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note D_, 2
	note F#, 2
	loopchannel 3, Music_GameCorner_branch_ee0c9
	note A#, 2
	note F#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note D_, 2
	note D_, 1
	note D_, 1
Music_GameCorner_branch_ee0e8: ; ee0e8
	note A#, 2
	note F#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note D_, 2
	note F#, 2
	loopchannel 3, Music_GameCorner_branch_ee0e8
	note D_, 1
	note D_, 1
	note D_, 2
	note A#, 1
	note F#, 2
	note F#, 5
	note D_, 1
	note D_, 1
	note D#, 2
	loopchannel 0, Music_GameCorner_branch_ee07f
; ee106

Music_GameCorner_branch_ee106: ; ee106
	note C_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	endchannel
; ee10f

Music_GameCorner_branch_ee10f: ; ee10f
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note F#, 2
	endchannel
; ee119


