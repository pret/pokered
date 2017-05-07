Music_Pinballcatchem_red: ; 3d2ed
	dbw $c0, Music_Pinballcatchem_red_Ch1
	dbw $01, Music_Pinballcatchem_red_Ch2
	dbw $02, Music_Pinballcatchem_red_Ch3
	dbw $03, Music_Pinballcatchem_red_Ch4
; 3d2f9

Music_Pinballcatchem_red_Ch1: ; 3d2f9
	tempo 160
	volume $77
	dutycycle $3
	vibrato $12, $34
	tone $0001
	notetype $8, $a2
	note __, 12
	note __, 12
Music_Pinballcatchem_red_branch_3d30b: ; 3d30b
	octave 3
	note D#, 8
	note F#, 4
	note D#, 8
	note D#, 4
	note D#, 8
	note F#, 4
	note D#, 8
	note D#, 4
	note __, 12
	note __, 12
	note __, 12
	note __, 12
	callchannel Music_Pinballcatchem_red_branch_3d360
	intensity $92
	octave 4
	note A_, 2
	note A_, 3
	note A_, 16
	note __, 3
	callchannel Music_Pinballcatchem_red_branch_3d360
	intensity $92
	octave 4
	note A_, 2
	note A_, 3
	note A_, 16
	note __, 3
	intensity $a2
	note __, 12
	note __, 12
	note __, 12
	octave 4
	note G_, 2
	note F_, 3
	note D#, 3
	note D_, 12
	note __, 6
	note D#, 6
	octave 5
	note C_, 16
	note __, 12
	intensity $72
	octave 6
	note D_, 2
	note C_, 1
	octave 5
	note A#, 6
	octave 6
	note D_, 3
	note C_, 6
	octave 5
	note A#, 16
	intensity $a2
	note __, 2
	note D_, 2
	note D_, 3
	note C_, 3
	note D_, 4
	note __, 12
	note __, 12
	note __, 12
	note __, 12
	octave 4
	note A#, 2
	note A#, 3
	note A#, 16
	note __, 3
	octave 5
	note C_, 2
	note C_, 3
	note C_, 16
	note __, 3
	loopchannel 0, Music_Pinballcatchem_red_branch_3d30b
; 3d360

Music_Pinballcatchem_red_branch_3d360: ; 3d360
	intensity $52
	note __, 3
	octave 3
	note F_, 5
	note F_, 3
	note F_, 13
	note __, 3
	note G_, 5
	note G_, 4
	note G_, 5
	note A_, 7
	intensity $a2
	note __, 12
	note __, 12
	note __, 12
	note __, 12
	note __, 12
	octave 5
	note D#, 2
	note D_, 3
	note C_, 7
	note __, 12
	note __, 5
	octave 4
	note C_, 7
	note __, 12
	note __, 12
	note __, 12
	note __, 8
	note D_, 16
	note __, 12
	note A#, 2
	note A#, 3
	note A#, 16
	note __, 3
	endchannel
; 3d386

Music_Pinballcatchem_red_Ch2: ; 3d386
	dutycycle $1
	vibrato $12, $34
	notetype $8, $c1
	note __, 12
	note __, 6
	octave 4
	note G#, 2
	note F#, 1
	note F_, 2
	note D#, 1
Music_Pinballcatchem_red_branch_3d395: ; 3d395
	dutycycle $1
	intensity $c1
	note D_, 2
	octave 3
	note A#, 1
	note G_, 2
	note D#, 1
	note G_, 2
	octave 4
	note F_, 4
	note D_, 2
	octave 2
	note A#, 1
	octave 3
	note D#, 2
	note F_, 1
	note G_, 2
	octave 4
	note C_, 4
	note D_, 2
	octave 3
	note D#, 1
	note G_, 2
	note A#, 1
	octave 4
	note D_, 2
	note F_, 4
	note D_, 2
	octave 3
	note C_, 1
	note D#, 2
	note F_, 1
	note A_, 2
	octave 4
	note C_, 4
	note __, 12
	note __, 12
	note __, 12
	note __, 12
	callchannel Music_Pinballcatchem_red_branch_3d4fe
	intensity $92
	octave 5
	note F_, 2
	note F_, 3
	intensity $94
	note F_, 12
	note __, 7
	callchannel Music_Pinballcatchem_red_branch_3d4fe
	intensity $92
	octave 5
	note F_, 2
	note F_, 3
	intensity $94
	note F_, 13
	dutycycle $2
	intensity $82
	octave 5
	note C_, 3
	note D_, 3
	intensity $a2
	note D#, 2
	intensity $81
	octave 3
	note A#, 1
	octave 4
	note D#, 2
	note G_, 1
	note A#, 2
	octave 5
	note D_, 1
	intensity $a2
	note D#, 3
	note F_, 2
	note D#, 1
	intensity $81
	octave 4
	note G_, 2
	intensity $a2
	octave 5
	note D_, 1
	intensity $82
	octave 4
	note A#, 2
	intensity $a2
	octave 5
	note C_, 3
	intensity $83
	note C#, 1
	intensity $a2
	note D_, 2
	intensity $81
	octave 3
	note A#, 1
	octave 4
	note D_, 2
	note F_, 1
	note A_, 2
	octave 5
	note C#, 1
	intensity $a2
	note D_, 3
	intensity $93
	note D#, 2
	note D_, 3
	note C_, 3
	octave 4
	note A#, 4
	intensity $a2
	octave 5
	note D#, 3
	note D_, 3
	note C_, 3
	note D#, 5
	intensity $a4
	note G_, 4
	intensity $82
	octave 4
	note F_, 2
	intensity $a4
	octave 5
	note F_, 4
	intensity $81
	octave 4
	note A_, 2
	note A#, 1
	intensity $a2
	octave 5
	note D_, 2
	note F_, 4
	note D#, 3
	note D_, 3
	intensity $62
	octave 4
	note F_, 2
	note G#, 1
	intensity $82
	note B_, 2
	octave 5
	note D_, 1
	intensity $a2
	note F_, 2
	note G#, 1
	intensity $a3
	note A#, 2
	intensity $82
	note A_, 1
	intensity $a3
	note G_, 3
	intensity $82
	note D#, 2
	octave 4
	note A#, 1
	intensity $a3
	octave 5
	note A#, 2
	intensity $82
	note D#, 1
	intensity $a3
	note A_, 3
	intensity $82
	note G_, 2
	note D#, 1
	intensity $a3
	note G_, 3
	intensity $82
	note D#, 2
	note C_, 1
	intensity $a3
	note F_, 3
	note G#, 6
	intensity $a2
	note G_, 3
	note F_, 2
	note F_, 3
	note D#, 3
	intensity $a3
	note F_, 4
	note G_, 2
	intensity $52
	octave 4
	note C_, 1
	intensity $a3
	octave 5
	note F_, 2
	intensity $52
	octave 4
	note D#, 1
	note G_, 2
	note A#, 1
	intensity $a3
	octave 5
	note D#, 2
	intensity $52
	note C_, 1
	intensity $a3
	note A_, 2
	intensity $62
	octave 4
	note D_, 1
	intensity $a3
	octave 5
	note G_, 2
	intensity $62
	octave 4
	note F_, 1
	note A_, 2
	octave 5
	note C_, 1
	intensity $a3
	note F_, 2
	intensity $62
	note D_, 1
	intensity $a3
	note A#, 2
	intensity $72
	octave 4
	note D#, 1
	intensity $a3
	octave 5
	note A_, 2
	intensity $72
	octave 4
	note G_, 1
	note A#, 2
	octave 5
	note D_, 1
	intensity $a3
	note G_, 2
	intensity $72
	note F_, 1
	intensity $a3
	octave 6
	note C_, 2
	intensity $82
	octave 4
	note E_, 1
	intensity $a3
	octave 6
	note D_, 2
	intensity $82
	octave 4
	note G_, 1
	note A#, 2
	octave 5
	note C_, 1
	intensity $a3
	note A#, 2
	intensity $82
	note E_, 1
	intensity $a2
	octave 6
	note C_, 2
	note C_, 3
	intensity $a4
	note C_, 7
	intensity $82
	octave 5
	note C_, 2
	octave 4
	note F_, 1
	note A#, 2
	octave 5
	note C_, 1
	note A_, 2
	note F_, 1
	octave 6
	note C_, 2
	octave 5
	note A#, 1
	intensity $a2
	note A_, 2
	note A_, 3
	intensity $a4
	note A_, 13
	dutycycle $1
	intensity $82
	octave 4
	note G#, 2
	note F#, 1
	note F_, 2
	note D#, 1
	loopchannel 0, Music_Pinballcatchem_red_branch_3d395
; 3d4fe

Music_Pinballcatchem_red_branch_3d4fe: ; 3d4fe
	intensity $72
	octave 4
	note __, 3
	note D_, 5
	note D_, 3
	note D_, 13
	note __, 3
	note D#, 5
	note D#, 3
	note D#, 1
	note D#, 5
	note F_, 4
	octave 3
	note F_, 3
	intensity $c3
	octave 4
	note D_, 2
	intensity $62
	octave 3
	note A#, 1
	note F_, 2
	note A#, 1
	intensity $c3
	octave 4
	note D#, 2
	intensity $62
	octave 3
	note A#, 1
	note F_, 2
	note A#, 1
	intensity $c3
	octave 4
	note F_, 2
	intensity $62
	note D_, 1
	octave 3
	note A#, 2
	octave 4
	note D_, 1
	intensity $c3
	note A#, 2
	intensity $62
	note D_, 1
	octave 3
	note A#, 2
	octave 4
	note F_, 1
	intensity $c3
	note A_, 2
	intensity $62
	note D#, 1
	note C_, 2
	octave 3
	note A_, 1
	octave 4
	note C_, 2
	note D#, 1
	intensity $c3
	note G_, 2
	note A_, 1
	note G_, 2
	intensity $62
	note D#, 1
	note C_, 2
	octave 3
	note G_, 1
	octave 4
	note C_, 2
	note D#, 1
	note C_, 2
	note D#, 1
	note C_, 2
	octave 3
	note G_, 1
	intensity $c3
	octave 4
	note D#, 2
	intensity $62
	octave 3
	note G_, 1
	intensity $c3
	octave 4
	note F_, 2
	intensity $62
	octave 3
	note G_, 1
	intensity $c3
	octave 4
	note G_, 2
	intensity $62
	note C_, 1
	intensity $c3
	octave 5
	note C_, 2
	octave 4
	note A#, 3
	note A_, 4
	intensity $a3
	note G_, 2
	note A_, 1
	intensity $c3
	note A#, 2
	intensity $73
	note F_, 1
	note D_, 2
	octave 3
	note A#, 1
	octave 4
	note D_, 2
	note F_, 1
	intensity $c3
	note G_, 3
	note F_, 2
	intensity $73
	note D_, 1
	octave 3
	note G#, 2
	intensity $b4
	octave 4
	note G#, 7
	intensity $73
	note D#, 2
	note G_, 1
	intensity $c3
	note A#, 2
	intensity $73
	note D#, 1
	octave 3
	note A#, 2
	intensity $c3
	octave 4
	note A_, 1
	note A#, 2
	intensity $73
	note D#, 1
	intensity $c3
	note G_, 3
	intensity $73
	octave 3
	note G_, 2
	note D#, 1
	note G_, 2
	note A#, 1
	octave 4
	note D#, 2
	note G_, 1
	note D_, 2
	note F_, 1
	intensity $c3
	note A#, 3
	intensity $73
	note D_, 2
	intensity $c3
	note A_, 1
	note A#, 2
	intensity $73
	octave 3
	note A#, 1
	intensity $c3
	octave 4
	note F_, 2
	intensity $73
	note D_, 1
	note F_, 2
	octave 3
	note A#, 1
	note F_, 2
	intensity $b4
	octave 4
	note G#, 4
	intensity $73
	note D#, 2
	note G_, 1
	intensity $c3
	note A#, 2
	intensity $73
	note G_, 1
	note D#, 2
	octave 3
	note A#, 1
	intensity $c3
	octave 5
	note D_, 2
	intensity $73
	octave 4
	note D#, 1
	intensity $c3
	octave 5
	note C_, 2
	octave 4
	note A#, 1
	intensity $73
	note E_, 2
	intensity $c3
	note A_, 1
	note A#, 2
	intensity $73
	note E_, 1
	intensity $c3
	note B_, 3
	intensity $a3
	octave 5
	note C_, 2
	note C_, 3
	note C_, 7
	intensity $72
	octave 4
	note C_, 2
	octave 3
	note F_, 1
	note A#, 2
	octave 4
	note C_, 1
	note A_, 2
	note F_, 1
	octave 5
	note C_, 2
	octave 4
	note A#, 1
	endchannel
; 3d60e

Music_Pinballcatchem_red_Ch3: ; 3d60e
	notetype $8, $23
	note __, 12
	note __, 6
	octave 2
	note D#, 6
Music_Pinballcatchem_red_branch_3d615: ; 3d615
	note F_, 1
	note __, 7
	note G#, 4
	note F_, 1
	note __, 7
	note F#, 4
	note F_, 1
	note __, 7
	note G#, 4
	note F_, 1
	note __, 7
	note A_, 4
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F_, 2
	note __, 1
	note D_, 2
	note __, 1
	octave 1
	note A#, 2
	note __, 1
	octave 2
	note D_, 2
	note __, 1
	note D#, 2
	note __, 1
	octave 3
	note C_, 2
	note __, 1
	octave 2
	note B_, 2
	note __, 1
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note G_, 2
	note __, 1
	note F_, 2
	note __, 1
	note A_, 2
	note __, 1
Music_Pinballcatchem_red_branch_3d645: ; 3d645
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F_, 2
	note __, 1
	note D_, 2
	note __, 1
	octave 1
	note A#, 2
	note __, 1
	octave 2
	note D_, 2
	note __, 1
	note D#, 2
	note __, 1
	octave 3
	note C_, 2
	note __, 1
	octave 2
	note B_, 2
	note __, 1
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note G_, 2
	note __, 1
	note D#, 2
	note __, 1
	note C_, 2
	note __, 1
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F_, 2
	note __, 1
	note D_, 2
	note __, 1
	octave 1
	note A#, 2
	note __, 1
	octave 2
	note D_, 2
	note __, 1
	note C_, 2
	note __, 1
	note D#, 2
	note __, 1
	note G_, 2
	note __, 1
	octave 3
	note C_, 2
	note __, 1
	octave 2
	note B_, 2
	note __, 1
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note G_, 2
	note __, 1
	octave 3
	note C_, 2
	note __, 1
	octave 2
	note B_, 2
	note __, 1
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 2
	note F_, 4
	note C_, 2
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	octave 2
	note A#, 1
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F#, 2
	note __, 1
	note F_, 2
	octave 3
	note F_, 6
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	octave 3
	note D#, 2
	note __, 1
	note D_, 2
	note __, 1
	note C#, 2
	note __, 1
	note C_, 2
	note __, 1
	octave 2
	note B_, 2
	note __, 1
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note A#, 1
	note F_, 1
	note D#, 1
	note D_, 2
	note __, 1
	note D#, 2
	note __, 1
	note F_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note F_, 4
	octave 2
	note G_, 2
	note __, 1
	note D#, 2
	note __, 1
	note C_, 2
	note __, 1
	note F#, 2
	note __, 1
	note G_, 2
	note __, 1
	note E_, 2
	note __, 1
	note C_, 2
	note __, 1
	octave 1
	note A#, 2
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 2
	note F_, 7
	note C_, 2
	note __, 1
	octave 2
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note F_, 2
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 2
	note C_, 7
	octave 2
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note A_, 2
	note __, 1
	loopchannel 2, Music_Pinballcatchem_red_branch_3d645
	note C_, 2
	note __, 10
	note C_, 1
	note __, 1
	note F_, 1
	note C_, 2
	note __, 1
	note C_, 2
	note __, 1
	octave 1
	note B_, 3
	note A#, 2
	note __, 7
	note A#, 1
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	note F_, 1
	note __, 2
	note D_, 1
	note __, 2
	note F_, 3
	octave 1
	note B_, 1
	octave 2
	note C_, 2
	note __, 7
	note C_, 2
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note C_, 4
	octave 2
	note D#, 1
	note __, 1
	note A_, 4
	octave 1
	note A#, 2
	note __, 7
	note A#, 2
	note __, 1
	octave 2
	note G#, 1
	note F_, 1
	note D_, 1
	octave 1
	note B_, 2
	note __, 1
	note G#, 2
	note __, 1
	note B_, 2
	octave 2
	note D_, 1
	note D#, 3
	note D_, 1
	note __, 1
	note D#, 3
	note __, 1
	note G_, 2
	note __, 1
	note A_, 3
	note D#, 1
	note __, 1
	note C_, 1
	octave 3
	note C_, 3
	octave 2
	note A_, 1
	note __, 1
	note D#, 1
	octave 3
	note D_, 2
	note __, 1
	note C_, 2
	note __, 1
	octave 2
	note F_, 2
	note __, 1
	note G#, 2
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 2
	octave 3
	note F_, 1
	note __, 2
	octave 2
	note G#, 3
	note C#, 1
	note C_, 2
	octave 3
	note C_, 1
	octave 2
	note A#, 2
	note __, 1
	note G_, 2
	note __, 1
	note D#, 2
	note __, 1
	note D_, 2
	octave 3
	note D_, 1
	note C_, 2
	note __, 1
	octave 2
	note A_, 2
	note __, 1
	note F_, 3
	note D#, 2
	octave 3
	note D#, 1
	note D_, 2
	note __, 1
	octave 2
	note A#, 2
	note __, 1
	note G_, 2
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 2
	note G_, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note E_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 2
	note F_, 7
	note C_, 2
	note __, 1
	octave 2
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note F_, 2
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 2
	note F_, 7
	octave 2
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note A_, 2
	note __, 1
	loopchannel 0, Music_Pinballcatchem_red_branch_3d615
; 3d7b3

Music_Pinballcatchem_red_Ch4: ; 3d7b3
	togglenoise $0
	notetype $8
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
Music_Pinballcatchem_red_branch_3d7c3: ; 3d7c3
	note D#, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note F#, 4
	note D#, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note F#, 4
	note D#, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note F#, 4
	note D#, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note F#, 4
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 2
	note C_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 3
	note F#, 1
	note G_, 2
	note G_, 1
	note C_, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 3
	note F#, 1
	note __, 6
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D#, 2
	note F#, 3
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 1
	note G_, 2
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 1
	note D_, 2
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note F#, 3
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 3
	note F#, 1
	note G_, 2
	note G_, 1
	note C_, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 3
	note F#, 7
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D#, 2
	note F#, 3
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 1
	note G_, 2
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 1
	note D_, 2
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 3
	note D#, 2
	note D#, 1
	note C_, 3
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 3
	note G_, 4
	note D_, 3
	note G_, 2
	note G_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D_, 2
	note D_, 1
	note F#, 3
	note C_, 2
	note D_, 3
	note D_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D_, 2
	note D_, 4
	note D_, 2
	note F#, 4
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 3
	note G_, 4
	note D_, 3
	note G_, 2
	note G_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D_, 2
	note D_, 1
	note F#, 3
	note C_, 2
	note D_, 3
	note D_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D_, 2
	note D#, 1
	note G_, 2
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D#, 1
	note D_, 2
	note F#, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 3
	note D#, 2
	note D#, 1
	note C_, 3
	loopchannel 0, Music_Pinballcatchem_red_branch_3d7c3
; 3d973


