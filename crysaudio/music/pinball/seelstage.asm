Music_Pinballseelstage: ; 45601
	dbw $c0, Music_Pinballseelstage_Ch1
	dbw $01, Music_Pinballseelstage_Ch2
	dbw $02, Music_Pinballseelstage_Ch3
	dbw $03, Music_Pinballseelstage_Ch4
; 4560d

Music_Pinballseelstage_Ch1: ; 4560d
	tempo 153
	volume $77
	tone $0001
Music_Pinballseelstage_branch_45615: ; 45615
	dutycycle $1
	notetype $c, $b3
	note __, 16
	notetype $6, $54
	note __, 4
	octave 4
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 16
	note __, 5
	notetype $c, $b3
	note __, 16
	note __, 2
	notetype $6, $54
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 16
	note __, 1
	notetype $c, $b3
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 2
	notetype $6, $54
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 16
	note __, 5
	notetype $c, $b3
	note __, 16
	note __, 2
	notetype $6, $54
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 16
	note __, 1
	dutycycle $2
	forceoctave $7
	callchannel Music_Pinballseelstage_branch_4570a
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_456f0
	forceoctave $4
	callchannel Music_Pinballseelstage_branch_4570a
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_4570a
	forceoctave $7
	callchannel Music_Pinballseelstage_branch_4570a
	notetype $8, $b3
	note __, 12
	note __, 12
	note __, 12
	forceoctave $7
	callchannel Music_Pinballseelstage_branch_4570a
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_456f0
	forceoctave $c
	callchannel Music_Pinballseelstage_branch_4570a
	forceoctave $4
	callchannel Music_Pinballseelstage_branch_4570a
	forceoctave $0
	notetype $c, $b3
	note __, 16
	note __, 9
	notetype $6, $b1
	octave 2
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note D#, 1
	note __, 1
	intensity $c2
	note F#, 2
	callchannel Music_Pinballseelstage_branch_45725
	note __, 8
	intensity $52
	note F_, 2
	intensity $51
	note F#, 6
	note B_, 2
	octave 5
	note C_, 4
	note C_, 4
	note F#, 4
	note F#, 2
	callchannel Music_Pinballseelstage_branch_45725
	note __, 8
	intensity $52
	note F_, 2
	intensity $51
	note F#, 16
	note __, 2
	intensity $62
	octave 3
	note D#, 2
	note C_, 2
	callchannel Music_Pinballseelstage_branch_45725
	dutycycle $1
	intensity $73
	octave 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note G#, 2
	note A_, 1
	note __, 3
	note A#, 1
	note __, 1
	note B_, 1
	note __, 15
	loopchannel 0, Music_Pinballseelstage_branch_45615
; 456f0

Music_Pinballseelstage_branch_456f0: ; 456f0
	intensity $a4
	octave 3
	note F#, 2
	intensity $24
	note F#, 2
	intensity $64
	note F#, 2
	intensity $14
	note F#, 2
	intensity $44
	note F#, 2
	intensity $14
	note F#, 2
	intensity $a4
	note B_, 2
	intensity $14
	note B_, 2
	endchannel
; 4570a

Music_Pinballseelstage_branch_4570a: ; 4570a
	notetype $6, $a4
	octave 3
	note E_, 2
	intensity $24
	note E_, 2
	intensity $64
	note E_, 2
	intensity $14
	note E_, 2
	intensity $44
	note E_, 2
	intensity $14
	note E_, 2
	intensity $24
	note E_, 2
	intensity $14
	note E_, 2
	endchannel
; 45725

Music_Pinballseelstage_branch_45725: ; 45725
	note __, 8
	intensity $52
	octave 4
	note A#, 2
	intensity $51
	note B_, 6
	note __, 16
	note __, 8
	intensity $52
	note A_, 2
	intensity $51
	note A#, 6
	note __, 16
	note __, 8
	intensity $52
	note G_, 2
	intensity $51
	note G#, 6
	note __, 16
	endchannel
; 4573f

Music_Pinballseelstage_Ch2: ; 4573f
Music_Pinballseelstage_branch_4573f: ; 4573f
	dutycycle $2
	notetype $6, $a1
	callchannel Music_Pinballseelstage_branch_45924
	note __, 15
	note __, 9
	callchannel Music_Pinballseelstage_branch_45924
	note __, 6
	intensity $54
	octave 4
	note G#, 1
	note __, 15
	note __, 2
	forceoctave $5
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45935
	forceoctave $3
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45969
	intensity $b2
	octave 3
	note C_, 2
	intensity $43
	callchannel Music_Pinballseelstage_branch_45980
	forceoctave $5
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45935
	forceoctave $7
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45969
	intensity $42
	octave 3
	note G_, 2
	callchannel Music_Pinballseelstage_branch_459b6
	intensity $52
	note F#, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	note A#, 2
	note B_, 2
	notetype $6, $91
	callchannel Music_Pinballseelstage_branch_45924
	note __, 15
	note __, 9
	callchannel Music_Pinballseelstage_branch_45924
	note __, 6
	intensity $54
	octave 4
	note G#, 1
	note __, 15
	note __, 2
	intensity $b1
	forceoctave $5
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45935
	forceoctave $3
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45969
	forceoctave $c
	intensity $a3
	octave 3
	note C_, 2
	callchannel Music_Pinballseelstage_branch_45980
	forceoctave $5
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45935
	forceoctave $7
	callchannel Music_Pinballseelstage_branch_4594f
	forceoctave $0
	callchannel Music_Pinballseelstage_branch_45969
	intensity $32
	forceoctave $c
	octave 2
	note G_, 2
	callchannel Music_Pinballseelstage_branch_459b6
	forceoctave $0
	intensity $b1
	octave 2
	note B_, 1
	intensity $18
	note B_, 1
	intensity $b1
	note A#, 1
	intensity $18
	note A#, 1
	intensity $b1
	note B_, 1
	intensity $18
	note B_, 1
	intensity $b1
	octave 4
	note B_, 1
	intensity $18
	note B_, 1
	intensity $81
	octave 5
	note D#, 1
	intensity $18
	note D#, 1
	intensity $91
	note F#, 1
	intensity $18
	note F#, 1
	intensity $b2
	note B_, 2
	callchannel Music_Pinballseelstage_branch_459ef
	note __, 10
	intensity $82
	note G_, 2
	intensity $a4
	note G#, 4
	callchannel Music_Pinballseelstage_branch_45a01
	note __, 10
	intensity $82
	note A#, 2
	intensity $a4
	note B_, 4
	callchannel Music_Pinballseelstage_branch_45a14
	note __, 10
	intensity $82
	note A_, 2
	intensity $a4
	note A#, 4
	callchannel Music_Pinballseelstage_branch_45a25
	intensity $51
	octave 5
	note F_, 2
	note F#, 4
	note F#, 4
	intensity $82
	octave 4
	note A#, 2
	intensity $a4
	note B_, 4
	octave 5
	callchannel Music_Pinballseelstage_branch_459ef
	intensity $32
	octave 3
	note A#, 2
	intensity $42
	octave 4
	note C#, 2
	intensity $52
	octave 3
	note A#, 2
	intensity $62
	octave 4
	note C#, 2
	intensity $72
	note E_, 2
	intensity $92
	note G_, 2
	intensity $a4
	note G#, 4
	callchannel Music_Pinballseelstage_branch_45a01
	intensity $32
	octave 3
	note G#, 2
	intensity $42
	note B_, 2
	intensity $52
	note G#, 2
	intensity $62
	note B_, 2
	intensity $72
	octave 4
	note F#, 2
	intensity $92
	note A#, 2
	intensity $a4
	note B_, 4
	callchannel Music_Pinballseelstage_branch_45a14
	intensity $32
	octave 3
	note F#, 2
	intensity $42
	note A#, 2
	intensity $52
	note F#, 2
	intensity $62
	note A#, 2
	intensity $72
	octave 4
	note C#, 2
	intensity $92
	note A_, 2
	intensity $a4
	note A#, 4
	callchannel Music_Pinballseelstage_branch_45a25
	intensity $71
	octave 4
	note A_, 2
	intensity $61
	note F#, 2
	intensity $51
	note D#, 2
	note C_, 2
	octave 3
	note A_, 2
	note F#, 2
	intensity $74
	octave 4
	note B_, 4
	intensity $72
	octave 5
	note C#, 2
	intensity $71
	octave 4
	note G#, 2
	intensity $72
	note B_, 2
	intensity $71
	note E_, 6
	intensity $72
	note E_, 2
	note G#, 2
	note __, 10
	note G_, 2
	intensity $74
	note G#, 4
	intensity $72
	note F#, 2
	intensity $71
	note C#, 2
	intensity $72
	note F_, 2
	intensity $71
	octave 3
	note A#, 6
	intensity $72
	octave 4
	note F#, 2
	note B_, 2
	note __, 10
	note A#, 2
	intensity $74
	note B_, 4
	intensity $72
	note A#, 2
	intensity $71
	note E_, 2
	intensity $72
	note G#, 2
	intensity $71
	note C#, 6
	intensity $72
	note F#, 2
	note A#, 2
	note __, 10
	note A_, 2
	intensity $74
	note A#, 4
	intensity $b3
	note B_, 1
	intensity $63
	note D#, 1
	note __, 2
	intensity $b3
	note B_, 1
	note D#, 1
	note __, 2
	intensity $63
	note G#, 2
	intensity $b3
	note A_, 1
	intensity $63
	note C#, 1
	note __, 2
	intensity $b3
	note A#, 1
	intensity $63
	note D_, 1
	intensity $b3
	note B_, 1
	note D#, 1
	note __, 6
	intensity $61
	octave 5
	note F#, 1
	note E_, 1
	note C#, 1
	octave 4
	note A#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 3
	note A#, 1
	loopchannel 0, Music_Pinballseelstage_branch_4573f
; 45924

Music_Pinballseelstage_branch_45924: ; 45924
	octave 2
	note B_, 2
	note F#, 2
	note A#, 2
	note B_, 2
	note __, 15
	note __, 1
	octave 3
	note F#, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note B_, 2
	note G#, 2
	note G_, 2
	note G#, 2
	endchannel
; 45935

Music_Pinballseelstage_branch_45935: ; 45935
	intensity $a4
	octave 4
	note D#, 2
	intensity $24
	note D#, 2
	intensity $74
	note D#, 2
	intensity $24
	note D#, 2
	intensity $54
	note D#, 2
	intensity $14
	note D#, 2
	intensity $a4
	note F#, 2
	intensity $24
	note F#, 2
	endchannel
; 4594f

Music_Pinballseelstage_branch_4594f: ; 4594f
	intensity $a4
	octave 4
	note C#, 2
	intensity $24
	note C#, 2
	intensity $74
	note C#, 2
	intensity $24
	note C#, 2
	intensity $54
	note C#, 2
	intensity $14
	note C#, 2
	intensity $34
	note C#, 2
	intensity $14
	note C#, 2
	endchannel
; 45969

Music_Pinballseelstage_branch_45969: ; 45969
	intensity $a4
	octave 4
	note E_, 2
	intensity $24
	note E_, 2
	intensity $74
	note E_, 2
	intensity $24
	note E_, 2
	intensity $54
	note E_, 2
	intensity $14
	note E_, 2
	intensity $34
	note E_, 2
	endchannel
; 45980

Music_Pinballseelstage_branch_45980: ; 45980
	intensity $52
	note C#, 2
	octave 2
	note G#, 2
	intensity $b2
	octave 3
	note G#, 2
	intensity $52
	note C#, 2
	intensity $b2
	note C_, 2
	intensity $52
	note C#, 2
	intensity $b2
	note E_, 2
	note C#, 2
	note F#, 2
	intensity $52
	octave 2
	note A#, 2
	note B_, 2
	note A#, 2
	note B_, 2
	note A#, 2
	note B_, 2
	intensity $92
	octave 3
	note C#, 2
	intensity $b2
	note D#, 2
	intensity $52
	octave 2
	note F#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note F#, 2
	intensity $82
	note G#, 2
	intensity $92
	note A#, 2
	endchannel
; 459b6

Music_Pinballseelstage_branch_459b6: ; 459b6
	intensity $b2
	octave 3
	note G#, 2
	intensity $52
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note G#, 2
	intensity $b2
	note F#, 2
	intensity $52
	note E_, 2
	intensity $b2
	note G#, 2
	intensity $52
	octave 2
	note F#, 2
	note A#, 2
	octave 3
	note C#, 2
	intensity $b2
	note F#, 2
	intensity $52
	note A#, 2
	intensity $b2
	note B_, 2
	intensity $52
	note C#, 2
	note E_, 2
	note G#, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note A#, 2
	intensity $b2
	note B_, 2
	endchannel
; 459ef

Music_Pinballseelstage_branch_459ef: ; 459ef
	intensity $b2
	note C#, 2
	intensity $51
	octave 4
	note G#, 2
	intensity $b2
	note B_, 2
	intensity $51
	note E_, 6
	intensity $b2
	note E_, 2
	note G#, 2
	endchannel
; 45a01

Music_Pinballseelstage_branch_45a01: ; 45a01
	intensity $b2
	note F#, 2
	intensity $51
	note C#, 2
	intensity $b2
	note F_, 2
	intensity $51
	octave 3
	note A#, 6
	intensity $b2
	octave 4
	note F#, 2
	note B_, 2
	endchannel
; 45a14

Music_Pinballseelstage_branch_45a14: ; 45a14
	intensity $b2
	note A#, 2
	intensity $51
	note E_, 2
	intensity $b2
	note G#, 2
	intensity $51
	note C#, 6
	intensity $b2
	note F#, 2
	note A#, 2
	endchannel
; 45a25

Music_Pinballseelstage_branch_45a25: ; 45a25
	intensity $b2
	note B_, 2
	intensity $51
	note F#, 2
	intensity $b2
	note A#, 2
	intensity $51
	note D#, 6
	intensity $b2
	note B_, 2
	octave 5
	note D#, 2
	endchannel
; 45a37

Music_Pinballseelstage_Ch3: ; 45a37
Music_Pinballseelstage_branch_45a37: ; 45a37
	callchannel Music_Pinballseelstage_branch_45baa
	callchannel Music_Pinballseelstage_branch_45bb9
	callchannel Music_Pinballseelstage_branch_45baa
	callchannel Music_Pinballseelstage_branch_45bb9
	callchannel Music_Pinballseelstage_branch_45baa
	notetype $6, $22
	note E_, 2
	note __, 12
	octave 1
	note F#, 2
	note A_, 2
	note __, 6
	note A#, 2
	note __, 6
	octave 2
	note C#, 2
	note __, 12
	octave 1
	note F#, 2
	note A#, 2
	note __, 2
	octave 2
	note F#, 2
	note __, 6
	note F#, 2
	note __, 2
	note D#, 2
	note __, 12
	octave 1
	note F#, 2
	note G#, 2
	note __, 6
	note A#, 2
	note __, 6
	callchannel Music_Pinballseelstage_branch_45baa
	notetype $6, $22
	note E_, 2
	note __, 12
	octave 1
	note G#, 2
	note B_, 2
	note __, 6
	octave 2
	note E_, 2
	note __, 6
	note E_, 2
	note __, 12
	note C#, 2
	note F#, 2
	note __, 2
	note A#, 2
	note __, 6
	note A#, 2
	note __, 2
	note B_, 2
	note __, 14
	octave 1
	note B_, 2
	note __, 14
	callchannel Music_Pinballseelstage_branch_45baa
	callchannel Music_Pinballseelstage_branch_45bb9
	callchannel Music_Pinballseelstage_branch_45baa
	notetype $6, $22
	note E_, 2
	note __, 2
	notetype $6, $32
	octave 4
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	notetype $6, $22
	octave 1
	note F#, 2
	note A_, 2
	note __, 6
	notetype $6, $32
	octave 4
	note F_, 8
	notetype $6, $22
	callchannel Music_Pinballseelstage_branch_45bd1
	octave 2
	note E_, 2
	note __, 2
	notetype $6, $32
	octave 5
	note D#, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	notetype $6, $22
	octave 1
	note F#, 2
	note A_, 2
	note __, 6
	note A#, 2
	note __, 6
	octave 2
	note C#, 2
	note __, 2
	notetype $6, $32
	octave 5
	note D#, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	notetype $6, $22
	octave 1
	note F#, 2
	note A#, 2
	note __, 2
	octave 2
	note F#, 2
	note __, 6
	note F#, 2
	note __, 2
	note D#, 2
	note __, 2
	notetype $6, $32
	octave 5
	note D_, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 3
	notetype $6, $22
	octave 1
	note F#, 2
	note G#, 2
	note __, 6
	note A#, 2
	note __, 6
	callchannel Music_Pinballseelstage_branch_45bd1
	note E_, 2
	note __, 2
	notetype $6, $32
	octave 5
	note D#, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	notetype $6, $22
	octave 1
	note G#, 2
	note B_, 2
	note __, 6
	octave 2
	note E_, 2
	note __, 6
	note E_, 2
	note __, 2
	notetype $6, $32
	octave 5
	note D#, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	notetype $6, $22
	octave 2
	note C#, 2
	note F#, 2
	note __, 2
	note A#, 2
	note __, 6
	note A#, 2
	note __, 2
	note B_, 2
	note __, 2
	notetype $6, $32
	octave 5
	note D_, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 3
	note D#, 1
	note __, 1
	octave 1
	note B_, 2
	octave 5
	note D#, 1
	note __, 3
	notetype $6, $22
	note D#, 1
	note __, 3
	note D#, 1
	note __, 3
	note D#, 1
	note __, 1
	callchannel Music_Pinballseelstage_branch_45bec
	callchannel Music_Pinballseelstage_branch_45c23
	callchannel Music_Pinballseelstage_branch_45bec
	callchannel Music_Pinballseelstage_branch_45c23
	notetype $6, $32
	octave 2
	note E_, 2
	note __, 6
	octave 5
	note G_, 2
	note G#, 1
	note __, 3
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note B_, 2
	note __, 2
	octave 3
	note D#, 2
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note D#, 2
	note __, 6
	octave 5
	note F_, 2
	note F#, 1
	note __, 3
	octave 2
	note D#, 2
	note __, 2
	octave 1
	note G#, 2
	note __, 2
	octave 3
	note D_, 2
	note D#, 2
	note __, 2
	octave 2
	note D#, 2
	octave 3
	note D#, 2
	octave 2
	note C#, 2
	note __, 6
	octave 5
	note D#, 2
	note E_, 1
	note __, 3
	octave 2
	note C#, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 3
	note C_, 2
	note C#, 2
	note __, 2
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	note D#, 1
	note __, 3
	note D#, 1
	note __, 3
	note C_, 2
	note C#, 1
	note __, 3
	note D_, 1
	note __, 1
	note D#, 1
	note __, 7
	octave 4
	note A#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note E_, 1
	note C#, 1
	loopchannel 0, Music_Pinballseelstage_branch_45a37
; 45baa

Music_Pinballseelstage_branch_45baa: ; 45baa
	notetype $c, $22
	octave 1
	note B_, 1
	note __, 6
	note F#, 1
	note A_, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	endchannel
; 45bb9

Music_Pinballseelstage_branch_45bb9: ; 45bb9
	note E_, 1
	note __, 1
	notetype $6, $32
	octave 4
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	notetype $6, $22
	octave 1
	note F#, 2
	note A_, 2
	note __, 6
	note A#, 2
	note __, 6
	endchannel
; 45bd1

Music_Pinballseelstage_branch_45bd1: ; 45bd1
	octave 1
	note B_, 2
	note __, 2
	notetype $6, $32
	octave 5
	note D_, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 3
	notetype $6, $22
	octave 1
	note F#, 2
	note A_, 2
	note __, 2
	octave 2
	note F#, 2
	note __, 6
	note F#, 2
	note __, 2
	endchannel
; 45bec

Music_Pinballseelstage_branch_45bec: ; 45bec
	octave 2
	note E_, 2
	note __, 6
	notetype $6, $32
	octave 5
	note G_, 2
	notetype $6, $22
	note G#, 1
	note __, 3
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note B_, 2
	note __, 2
	octave 3
	note D#, 2
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note D#, 2
	note __, 6
	notetype $6, $32
	octave 5
	note F_, 2
	notetype $6, $22
	note F#, 1
	note __, 3
	octave 2
	note D#, 2
	note __, 2
	octave 1
	note G#, 2
	note __, 2
	octave 3
	note D_, 2
	note D#, 2
	note __, 2
	octave 2
	note D#, 2
	octave 3
	note D#, 2
	endchannel
; 45c23

Music_Pinballseelstage_branch_45c23: ; 45c23
	octave 2
	note C#, 2
	note __, 6
	notetype $6, $32
	octave 5
	note D#, 2
	notetype $6, $22
	note E_, 1
	note __, 3
	octave 2
	note C#, 2
	note __, 2
	octave 1
	note F#, 2
	note __, 2
	octave 3
	note C_, 2
	note C#, 2
	note __, 2
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	octave 1
	note B_, 2
	note __, 6
	notetype $6, $32
	octave 5
	note D_, 2
	notetype $6, $22
	note D#, 1
	note __, 3
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note F#, 2
	note __, 2
	note F#, 2
	note A_, 2
	note __, 2
	note F#, 2
	note A_, 2
	endchannel
; 45c57

Music_Pinballseelstage_Ch4: ; 45c57
	togglenoise $2
Music_Pinballseelstage_branch_45c59: ; 45c59
	notetype $c
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d26
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d26
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d32
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d32
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d32
	callchannel Music_Pinballseelstage_branch_45d1b
	note D#, 2
	note G_, 1
	note G_, 1
	note D_, 4
	note D#, 1
	note G_, 1
	note D_, 2
	note D_, 1
	note D#, 1
	note D_, 1
	note D_, 1
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d26
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d26
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d32
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d32
	callchannel Music_Pinballseelstage_branch_45d1b
	callchannel Music_Pinballseelstage_branch_45d32
	callchannel Music_Pinballseelstage_branch_45d1b
	note D#, 2
	note G_, 1
	note G_, 1
	note D_, 4
	note D#, 1
	note D#, 1
	note G_, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note D_, 1
	note G#, 1
	note G_, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note D_, 1
	note G#, 1
	note G_, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	callchannel Music_Pinballseelstage_branch_45d3e
	note D_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	notetype $c
	note C_, 2
	note C#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note A_, 2
	note A#, 2
	note B_, 4
	note A#, 2
	note A_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	note C#, 2
	note C_, 2
	note C_, 1
	note C#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note A_, 1
	note A#, 1
	note B_, 2
	note A#, 1
	note A_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note C#, 1
	note C_, 1
	notetype $6
	note D_, 4
	note D_, 4
	note D#, 2
	note D_, 4
	note D_, 2
	note D_, 8
	note D#, 4
	note D#, 2
	note D_, 2
	loopchannel 0, Music_Pinballseelstage_branch_45c59
; 45d1b

Music_Pinballseelstage_branch_45d1b: ; 45d1b
	note D#, 2
	note G_, 1
	note G_, 1
	note D_, 3
	note D#, 1
	note D#, 2
	note D#, 1
	note G_, 1
	note D_, 3
	note D#, 1
	endchannel
; 45d26

Music_Pinballseelstage_branch_45d26: ; 45d26
	note D#, 2
	note G_, 1
	note G_, 1
	note D_, 4
	note D#, 1
	note G_, 1
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 1
	note G_, 1
	endchannel
; 45d32

Music_Pinballseelstage_branch_45d32: ; 45d32
	note D#, 2
	note G_, 1
	note G_, 1
	note D_, 4
	note D#, 1
	note G_, 1
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	endchannel
; 45d3e

Music_Pinballseelstage_branch_45d3e: ; 45d3e
	note G#, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	endchannel
; 45d4b


