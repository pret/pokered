Music_Pinballpokedex: ; 3d973
	dbw $c0, Music_Pinballpokedex_Ch1
	dbw $01, Music_Pinballpokedex_Ch2
	dbw $02, Music_Pinballpokedex_Ch3
	dbw $03, Music_Pinballpokedex_Ch4
; 3d97f

Music_Pinballpokedex_Ch1: ; 3d97f
	tempo 157
	volume $77
	notetype $c, $b3
	note __, 4
Music_Pinballpokedex_branch_3d988: ; 3d988
	notetype $c, $92
	dutycycle $2
	note __, 4
	octave 4
	note C#, 1
	note __, 5
	note C#, 1
	note __, 3
	note E_, 1
	note __, 1
	note __, 2
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note __, 16
	note __, 4
	note C#, 1
	note __, 5
	note C#, 1
	note __, 3
	note E_, 1
	note __, 1
	note __, 2
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note __, 16
	callchannel Music_Pinballpokedex_branch_3d9e2
	note __, 2
	note D_, 1
	note __, 3
	intensity $52
	note D_, 1
	note __, 3
	intensity $72
	note D_, 1
	note __, 3
	intensity $b2
	note D_, 1
	note __, 1
	callchannel Music_Pinballpokedex_branch_3d9e2
	note __, 2
	note D_, 1
	note __, 3
	note E_, 1
	note __, 9
	loopchannel 0, Music_Pinballpokedex_branch_3d988
; 3d9e2

Music_Pinballpokedex_branch_3d9e2: ; 3d9e2
	intensity $92
	note __, 4
	note F#, 1
	note __, 5
	note F#, 1
	note __, 3
	note A_, 1
	note __, 1
	note __, 2
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note C_, 1
	note __, 3
	note D_, 1
	note __, 1
	endchannel
; 3d9ff

Music_Pinballpokedex_Ch2: ; 3d9ff
	notetype $c, $b3
	note __, 4
	tone $0001
Music_Pinballpokedex_branch_3da06: ; 3da06
	notetype $c, $a2
	dutycycle $2
	note __, 4
	octave 4
	note G#, 1
	note __, 5
	note F#, 1
	note __, 3
	note B_, 1
	note __, 1
	note __, 2
	note B_, 1
	note __, 3
	note A_, 1
	note __, 1
	note G_, 1
	note __, 3
	note E_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note G#, 1
	note __, 1
	note A_, 1
	note __, 3
	intensity $b2
	note G#, 1
	note __, 1
	notetype $6, $a2
	note __, 2
	note __, 1
	note G_, 1
	notetype $c, $a2
	note G#, 2
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $6, $b2
	octave 3
	note G#, 1
	note A_, 1
	note A#, 2
	note G#, 2
	note __, 2
	note F_, 2
	note __, 2
	note D_, 2
	note __, 2
	intensity $61
	note __, 2
	note A_, 2
	octave 4
	note C#, 2
	note E_, 2
	intensity $b2
	note G#, 2
	intensity $61
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 2
	intensity $b2
	note F#, 2
	note __, 2
	intensity $61
	note E_, 2
	note G_, 2
	intensity $b2
	note B_, 2
	note __, 2
	intensity $61
	note E_, 2
	note G_, 2
	intensity $b2
	note B_, 2
	note __, 2
	intensity $61
	note C_, 2
	note E_, 2
	intensity $b2
	note A_, 2
	intensity $61
	note C_, 2
	intensity $b2
	note G_, 2
	intensity $61
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	intensity $b2
	note E_, 2
	note __, 4
	intensity $82
	note G#, 2
	intensity $b2
	note A_, 2
	intensity $61
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	intensity $b2
	note A_, 2
	intensity $61
	octave 3
	note F#, 2
	note B_, 2
	octave 4
	note D_, 2
	intensity $b2
	note G#, 2
	note __, 2
	note A_, 2
	note __, 2
	intensity $61
	octave 3
	note B_, 2
	note __, 2
	intensity $b2
	octave 4
	note G#, 2
	note __, 2
	note __, 3
	intensity $92
	note G_, 1
	intensity $a2
	note G#, 4
	note F_, 2
	note __, 2
	note D_, 2
	note __, 2
	intensity $b2
	octave 3
	note G#, 1
	note A_, 1
	note A#, 2
	note G#, 2
	note __, 2
	note F_, 2
	note __, 2
	note D_, 2
	note __, 2
	callchannel Music_Pinballpokedex_branch_3dae5
	note __, 4
	intensity $b2
	note A_, 2
	note __, 6
	intensity $52
	note A_, 2
	note __, 6
	intensity $82
	note A_, 2
	note __, 6
	intensity $c2
	note A_, 2
	note __, 2
	callchannel Music_Pinballpokedex_branch_3dae5
	note __, 4
	intensity $b2
	note A_, 2
	note __, 6
	note G#, 2
	notetype $c, $b3
	note __, 9
	loopchannel 0, Music_Pinballpokedex_branch_3da06
; 3dae5

Music_Pinballpokedex_branch_3dae5: ; 3dae5
	note __, 2
	intensity $61
	octave 4
	note D_, 2
	note F#, 2
	note A_, 2
	intensity $b2
	octave 5
	note C#, 2
	intensity $61
	octave 4
	note A_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A_, 2
	intensity $b2
	note B_, 2
	note __, 2
	intensity $61
	note A_, 2
	octave 5
	note C_, 2
	intensity $b2
	note E_, 2
	note __, 2
	intensity $61
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	intensity $b2
	note E_, 2
	note __, 2
	intensity $61
	octave 4
	note F_, 2
	note A_, 2
	intensity $b2
	octave 5
	note D_, 2
	intensity $61
	octave 4
	note F_, 2
	intensity $b2
	octave 5
	note C_, 2
	intensity $61
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	intensity $b2
	note A_, 2
	note __, 4
	intensity $82
	note A#, 2
	intensity $b2
	note B_, 2
	note __, 6
	note B_, 2
	note __, 6
	note A_, 2
	note __, 2
	note G_, 2
	note __, 6
	note A_, 2
	note __, 2
	endchannel
; 3db3a

Music_Pinballpokedex_Ch3: ; 3db3a
	notetype $c, $22
	note __, 4
Music_Pinballpokedex_branch_3db3e: ; 3db3e
	notetype $c, $22
	octave 1
	note A_, 4
	octave 2
	note A_, 1
	note __, 1
	octave 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 3
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C_, 2
	octave 3
	note C_, 1
	note __, 3
	octave 2
	note C_, 1
	note __, 1
	octave 1
	note G_, 4
	octave 2
	note G_, 1
	note __, 1
	octave 1
	note G_, 1
	note __, 1
	notetype $6, $22
	note B_, 7
	note __, 1
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note B_, 2
	note __, 2
	note F#, 3
	note __, 1
	octave 2
	note B_, 2
	note __, 6
	octave 1
	note A#, 2
	notetype $c, $22
	note __, 1
	note __, 16
	note A_, 4
	octave 2
	note A_, 1
	note __, 1
	octave 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 3
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C_, 2
	octave 3
	note C_, 1
	note __, 3
	octave 2
	note C_, 1
	note __, 1
	octave 1
	note G_, 4
	octave 2
	note G_, 1
	note __, 1
	octave 1
	note G_, 1
	note __, 1
	notetype $6, $22
	note B_, 7
	note __, 1
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note B_, 2
	note __, 2
	note F#, 3
	note __, 1
	octave 2
	note B_, 2
	note __, 6
	octave 1
	note A#, 2
	note __, 2
	note __, 4
	notetype $6, $32
	octave 5
	note G#, 2
	note __, 2
	note F_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 4
	note G#, 1
	note A_, 1
	note A#, 2
	note G#, 2
	note __, 2
	note F_, 2
	note __, 2
	note D_, 2
	note __, 2
	notetype $6, $22
	octave 2
	note D_, 8
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note D_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 6
	note F_, 2
	note __, 2
	octave 2
	note F_, 4
	octave 3
	note F_, 2
	note __, 6
	octave 2
	note F_, 2
	note __, 2
	note C_, 8
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 2
	note __, 2
	note C_, 8
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 2
	note __, 2
	octave 1
	note G_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 6
	note B_, 2
	note __, 2
	octave 1
	note B_, 4
	octave 2
	note B_, 2
	note __, 6
	notetype $6, $32
	octave 1
	note A#, 2
	note __, 2
	note A#, 4
	notetype $6, $22
	octave 2
	note A#, 2
	note __, 6
	octave 1
	note A#, 2
	note __, 2
	octave 2
	note D_, 8
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note D_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 6
	note F_, 2
	note __, 2
	octave 2
	note F_, 4
	octave 3
	note F_, 2
	note __, 6
	octave 2
	note F_, 2
	note __, 2
	note C_, 8
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 2
	note __, 2
	note C_, 8
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 2
	note __, 2
	octave 1
	note G_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 6
	note B_, 2
	note __, 2
	note __, 4
	note B_, 2
	note __, 6
	octave 3
	note B_, 2
	note __, 6
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note B_, 2
	note __, 2
	note E_, 2
	notetype $c, $22
	note __, 1
	loopchannel 0, Music_Pinballpokedex_branch_3db3e
; 3dc48

Music_Pinballpokedex_Ch4: ; 3dc48
	togglenoise $0
	notetype $8
	note F_, 3
	note C#, 1
	note C#, 1
	note C#, 1
Music_Pinballpokedex_branch_3dc50: ; 3dc50
	notetype $8
	callchannel Music_Pinballpokedex_branch_3dc7c
	callchannel Music_Pinballpokedex_branch_3dc97
	callchannel Music_Pinballpokedex_branch_3dc7c
	callchannel Music_Pinballpokedex_branch_3dc97
	callchannel Music_Pinballpokedex_branch_3dc7c
	note G_, 3
	note G_, 3
	note G_, 3
	note E_, 3
	note E_, 3
	note E_, 3
	note E_, 3
	note E_, 3
	callchannel Music_Pinballpokedex_branch_3dc7c
	note G_, 3
	note F#, 3
	note G_, 3
	note E_, 3
	note E_, 3
	note D#, 3
	notetype $c
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	loopchannel 0, Music_Pinballpokedex_branch_3dc50
; 3dc7c

Music_Pinballpokedex_branch_3dc7c: ; 3dc7c
	note F#, 3
	note G_, 3
	note E_, 3
	note G_, 3
	note G_, 3
	note E_, 3
	note G_, 3
	note E_, 3
	note G_, 3
	note E_, 3
	note G_, 3
	note G_, 1
	note G_, 1
	note G_, 1
	note E_, 3
	note G_, 3
	note G_, 3
	note F#, 3
	note E_, 3
	note G_, 3
	note E_, 3
	note G_, 3
	note E_, 3
	note E_, 3
	note G_, 3
	note F#, 3
	endchannel
; 3dc97

Music_Pinballpokedex_branch_3dc97: ; 3dc97
	note G_, 3
	note G_, 3
	note G_, 3
	note G_, 1
	note G_, 1
	note G_, 1
	note E_, 3
	note E_, 3
	note D#, 3
	note D#, 3
	endchannel
; 3dca2


