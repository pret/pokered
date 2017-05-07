Music_Pinballredfield: ; 3ccbf
	dbw $c0, Music_Pinballredfield_Ch1
	dbw $01, Music_Pinballredfield_Ch2
	dbw $02, Music_Pinballredfield_Ch3
	dbw $03, Music_Pinballredfield_Ch4
; 3cccb

Music_Pinballredfield_Ch1: ; 3cccb
	tempo 144
	volume $77
	dutycycle $3
	vibrato $12, $34
	tone $0001
	notetype $8, $b3
	octave 3
	note D#, 4
	intensity $83
	octave 2
	note F#, 2
	note B_, 2
	octave 3
	note D#, 2
	intensity $b3
	note D#, 8
	intensity $83
	octave 2
	note F#, 2
	octave 3
	note C_, 2
	note D#, 2
	intensity $b3
	note F_, 4
	intensity $82
	note E_, 2
	note D#, 4
	intensity $a3
	note G#, 6
	note __, 8
Music_Pinballredfield_branch_3ccf9: ; 3ccf9
	note __, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	intensity $83
	octave 4
	note C#, 4
	intensity $82
	octave 3
	note B_, 6
	note G#, 6
	intensity $84
	note F_, 16
	note __, 6
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 10
	intensity $83
	octave 4
	note C#, 4
	intensity $82
	octave 3
	note B_, 6
	note G#, 6
	intensity $84
	note F_, 16
	note __, 6
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 6
	intensity $21
	note A#, 2
	intensity $41
	octave 4
	note C#, 2
	intensity $61
	octave 3
	note A#, 2
	intensity $81
	octave 4
	note C#, 2
	intensity $a1
	octave 3
	note A#, 2
	intensity $c1
	octave 4
	note C#, 12
	note __, 5
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 1
	loopchannel 0, Music_Pinballredfield_branch_3ccf9
; 3cd5b

Music_Pinballredfield_Ch2: ; 3cd5b
	dutycycle $2
	vibrato $12, $34
	notetype $8, $c4
	octave 3
	note A#, 4
	intensity $a2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	intensity $c4
	note A#, 8
	intensity $a2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	intensity $c3
	note A#, 4
	intensity $a2
	note A_, 2
	note G#, 4
	intensity $c5
	octave 4
	note C#, 14
Music_Pinballredfield_branch_3cd81: ; 3cd81
	callchannel Music_Pinballredfield_branch_3cf69
	dutycycle $3
	intensity $a3
	octave 4
	note F_, 4
	intensity $a2
	note F#, 6
	note G_, 6
	intensity $a4
	note G#, 8
	callchannel Music_Pinballredfield_branch_3cfa5
	note A#, 4
	note F#, 2
	intensity $92
	panning $f
	note A#, 4
	note F#, 2
	intensity $72
	panning $f0
	note A#, 4
	note F#, 2
	panning $f
	intensity $42
	note A#, 4
	note F#, 10
	panning $ff
	note __, 16
	callchannel Music_Pinballredfield_branch_3cf69
	dutycycle $3
	intensity $a3
	octave 4
	note F_, 4
	intensity $a2
	note F#, 6
	note G_, 6
	intensity $a6
	note G#, 8
	callchannel Music_Pinballredfield_branch_3cfa5
	intensity $b2
	note A#, 4
	intensity $a2
	note F#, 16
	note __, 4
	intensity $1d
	note __, 12
	octave 4
	note E_, 12
	dutycycle $0
	intensity $a2
	octave 5
	note D#, 2
	intensity $52
	octave 4
	note D#, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note F#, 2
	intensity $a2
	note B_, 2
	intensity $52
	note F#, 2
	note D#, 2
	intensity $a2
	octave 5
	note F#, 2
	intensity $52
	octave 4
	note D#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note D#, 2
	intensity $a2
	octave 5
	note G#, 2
	intensity $52
	octave 4
	note D#, 2
	intensity $a2
	octave 5
	note F#, 2
	note F_, 2
	intensity $52
	octave 4
	note F#, 2
	intensity $a2
	octave 5
	note D#, 2
	note C#, 2
	intensity $52
	octave 4
	note C#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	intensity $a2
	note A#, 2
	intensity $52
	note F_, 2
	note C#, 2
	intensity $a2
	octave 5
	note C#, 2
	intensity $52
	octave 4
	note E_, 2
	note G#, 2
	octave 5
	note C#, 2
	note E_, 2
	note G#, 2
	octave 6
	note C#, 2
	octave 5
	note G#, 2
	note E_, 2
	note C#, 2
	octave 4
	note G#, 2
	note E_, 2
	intensity $a2
	note G#, 2
	intensity $52
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	note G#, 2
	note B_, 2
	intensity $a2
	octave 4
	note G#, 2
	note A#, 2
	intensity $52
	note D#, 2
	intensity $a2
	note B_, 2
	intensity $52
	note D#, 2
	note F_, 2
	intensity $a2
	note B_, 2
	note A#, 2
	intensity $52
	note F_, 2
	note C#, 2
	intensity $a2
	note G#, 2
	intensity $52
	note D#, 2
	note F_, 2
	intensity $a2
	note B_, 2
	intensity $52
	note F_, 2
	note C#, 2
	intensity $a2
	note A#, 2
	intensity $52
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note F_, 2
	note C#, 2
	octave 3
	note A#, 2
	note F#, 2
	octave 4
	note C#, 2
	note F_, 2
	intensity $a2
	note F#, 2
	intensity $52
	note C#, 2
	octave 3
	note A#, 2
	intensity $a2
	octave 5
	note C#, 2
	intensity $52
	octave 3
	note A#, 2
	octave 4
	note E_, 2
	octave 3
	note A#, 2
	octave 4
	note E_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note G_, 2
	note A#, 2
	intensity $a2
	octave 5
	note D#, 2
	intensity $52
	octave 4
	note D#, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note F#, 2
	intensity $a2
	note B_, 2
	intensity $52
	note F#, 2
	note D#, 2
	intensity $a2
	octave 5
	note F#, 2
	intensity $52
	octave 4
	note D#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note D#, 2
	intensity $a2
	octave 5
	note G#, 2
	intensity $52
	octave 4
	note D#, 2
	intensity $a2
	octave 5
	note F#, 2
	note F_, 2
	intensity $52
	octave 4
	note F#, 2
	intensity $a2
	octave 5
	note D#, 2
	note C#, 2
	intensity $52
	octave 4
	note C#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	intensity $a2
	octave 5
	note C#, 2
	note D#, 2
	intensity $52
	octave 4
	note F_, 2
	intensity $a2
	octave 5
	note E_, 4
	intensity $52
	octave 4
	note E_, 2
	note G#, 2
	intensity $a2
	octave 5
	note D#, 2
	intensity $52
	note E_, 2
	note G#, 2
	intensity $a2
	note C#, 2
	intensity $52
	note G#, 2
	note E_, 2
	intensity $a2
	octave 4
	note A#, 2
	intensity $52
	note G#, 2
	note E_, 2
	intensity $a2
	note B_, 2
	intensity $52
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	note G#, 2
	note B_, 2
	intensity $a2
	octave 4
	note B_, 2
	octave 5
	note C#, 2
	intensity $52
	octave 4
	note D#, 2
	intensity $a2
	octave 5
	note D_, 2
	intensity $52
	octave 4
	note D_, 2
	note F#, 2
	note B_, 2
	intensity $a2
	octave 5
	note C#, 2
	intensity $52
	octave 4
	note F#, 2
	note D_, 2
	intensity $a2
	note B_, 2
	intensity $52
	note D_, 2
	note F#, 2
	intensity $a2
	octave 5
	note D_, 2
	intensity $52
	octave 4
	note F#, 2
	intensity $a2
	octave 5
	note C#, 2
	intensity $52
	octave 3
	note F#, 2
	note A#, 2
	octave 4
	note C#, 2
	note F_, 2
	note C#, 2
	octave 3
	note A#, 2
	note F#, 2
	note A#, 2
	octave 4
	note C#, 2
	note F_, 2
	note C#, 2
	octave 3
	note A#, 2
	note G#, 2
	note B_, 2
	octave 4
	note D#, 2
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	note G#, 2
	note B_, 2
	octave 4
	note D#, 2
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	loopchannel 0, Music_Pinballredfield_branch_3cd81
; 3cf69

Music_Pinballredfield_branch_3cf69: ; 3cf69
	dutycycle $2
	intensity $c2
	octave 4
	note C#, 2
	intensity $72
	octave 3
	note C#, 2
	note F#, 2
	intensity $c2
	note B_, 2
	intensity $72
	note C#, 2
	note F#, 2
	intensity $c2
	note A#, 4
	intensity $72
	note C#, 2
	note D#, 4
	note C#, 2
	note E_, 4
	intensity $c2
	note A#, 2
	note B_, 4
	octave 4
	note C#, 6
	note C#, 2
	octave 3
	note B_, 4
	note A#, 2
	note B_, 4
	note G#, 2
	intensity $92
	panning $f0
	note B_, 4
	note G#, 2
	intensity $72
	panning $f
	note B_, 4
	note G#, 2
	panning $f0
	intensity $42
	note B_, 4
	note G#, 2
	panning $ff
	endchannel
; 3cfa5

Music_Pinballredfield_branch_3cfa5: ; 3cfa5
	dutycycle $2
	intensity $c2
	octave 3
	note B_, 2
	intensity $72
	note D#, 2
	note F#, 2
	intensity $c2
	note A#, 2
	intensity $72
	note D#, 2
	note F#, 2
	intensity $c2
	note G#, 4
	intensity $72
	note D_, 2
	note F#, 4
	note D_, 2
	note G#, 4
	intensity $c2
	note G#, 2
	note A#, 4
	intensity $c3
	note B_, 6
	intensity $c2
	note B_, 2
	note A#, 4
	note G#, 2
	endchannel
; 3cfcc

Music_Pinballredfield_Ch3: ; 3cfcc
	notetype $8, $23
	octave 2
	note B_, 4
	note __, 6
	octave 3
	note C_, 7
	note __, 7
	note C#, 4
	note __, 6
	octave 4
	note F_, 6
	note __, 2
	octave 3
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
Music_Pinballredfield_branch_3cfe1: ; 3cfe1
	octave 2
	note F#, 1
	note __, 3
	octave 3
	note F#, 1
	note __, 1
	note F_, 4
	note __, 2
	note E_, 4
	note __, 2
	note D#, 4
	note __, 2
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A#, 4
	note A#, 1
	note __, 1
	note B_, 1
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note D#, 4
	note __, 2
	note D#, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 3
	note G_, 1
	note __, 1
	note G#, 1
	note __, 3
	octave 3
	note D#, 1
	note __, 1
	note F_, 4
	note G#, 1
	note __, 5
	note B_, 1
	note __, 5
	octave 4
	note C#, 6
	note __, 2
	octave 2
	note G#, 1
	note __, 3
	octave 3
	note G#, 1
	note __, 1
	note G_, 4
	note __, 2
	note F#, 4
	note __, 2
	note D#, 4
	note __, 2
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G#, 4
	note B_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 3
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note B_, 4
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A#, 4
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note G#, 4
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	note D#, 4
	note E_, 1
	note __, 1
	note F_, 4
	note E_, 1
	note __, 1
	note D#, 4
	note D_, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 3
	octave 3
	note F#, 1
	note __, 1
	note F_, 4
	note __, 2
	note E_, 4
	note __, 2
	note D#, 4
	note __, 2
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A#, 4
	note A#, 1
	note __, 1
	note B_, 1
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note D#, 4
	note __, 2
	note D#, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 3
	note G_, 1
	note __, 1
	note G#, 1
	note __, 3
	octave 3
	note D#, 1
	note __, 1
	note F_, 4
	note G#, 1
	note __, 5
	note B_, 1
	note __, 5
	octave 4
	note C#, 6
	note __, 2
	octave 2
	note G#, 1
	note __, 3
	octave 3
	note G#, 1
	note __, 1
	note G_, 4
	note __, 2
	note F#, 4
	note __, 2
	note D#, 4
	note __, 2
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G#, 4
	note B_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 3
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note B_, 4
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A#, 4
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note G#, 4
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F#, 2
	note __, 10
	octave 3
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note B_, 3
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 7
	note B_, 3
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 7
	note A#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 3
	note A#, 1
	note __, 7
	note A#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 5
	note G#, 3
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 7
	note G#, 3
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 7
	note F#, 3
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 3
	note F#, 1
	note __, 7
	note G_, 3
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 5
	note B_, 3
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 7
	note B_, 3
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 7
	note A#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 3
	note A#, 1
	note __, 7
	note A#, 3
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 3
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 5
	note G#, 3
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 7
	note G#, 3
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note F#, 2
	octave 2
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note G#, 1
	note __, 1
	note G#, 2
	note __, 4
	note F#, 3
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 3
	note F#, 1
	note __, 7
	note G#, 3
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	loopchannel 0, Music_Pinballredfield_branch_3cfe1
; 3d1cd

Music_Pinballredfield_Ch4: ; 3d1cd
	togglenoise $0
	notetype $8
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
Music_Pinballredfield_branch_3d1e4: ; 3d1e4
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 8
	note __, 16
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note D_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note D_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note D_, 4
	note G_, 2
	loopchannel 0, Music_Pinballredfield_branch_3d1e4
; 3d2ed


