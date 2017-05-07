Music_Pinballgengarstage_haunter: ; 3dffc
	dbw $80, Music_Pinballgengarstage_haunter_Ch1
	dbw $01, Music_Pinballgengarstage_haunter_Ch2
	dbw $02, Music_Pinballgengarstage_haunter_Ch3
; 3e005

Music_Pinballgengarstage_haunter_Ch1: ; 3e005
	forceoctave $2
	callchannel Music_Pinballgengarstage_haunter_branch_3ddf3
Music_Pinballgengarstage_haunter_Ch2: ; 3e00a
	forceoctave $2
	callchannel Music_Pinballgengarstage_haunter_branch_3de4c
Music_Pinballgengarstage_haunter_Ch3: ; 3e00f
	forceoctave $2
	callchannel Music_Pinballgengarstage_haunter_branch_3df1f

Music_Pinballgengarstage_gengar: ; 3e014
	dbw $c0, Music_Pinballgengarstage_gengar_Ch1
	dbw $01, Music_Pinballgengarstage_gengar_Ch2
	dbw $02, Music_Pinballgengarstage_gengar_Ch3
	dbw $03, Music_Pinballgengarstage_gengar_Ch4
; 3e020

Music_Pinballgengarstage_gengar_Ch1: ; 3e020
	tempo 124
	volume $77
	notetype $c, $b3
	dutycycle $3
	notetype $6, $21
	note __, 16
	octave 4
	note E_, 1
	note A_, 1
	intensity $48
	note E_, 1
	note A_, 1
	intensity $68
	note E_, 1
	note A_, 1
	intensity $88
	note E_, 1
	note A_, 1
	intensity $a8
	note E_, 1
	note A_, 1
	intensity $88
	note E_, 1
	note A_, 1
	intensity $68
	note E_, 1
	note A_, 1
	intensity $48
	note E_, 1
	note A_, 1
	intensity $28
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	intensity $38
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	intensity $48
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	intensity $58
	note F_, 1
	note G#, 1
	intensity $68
	note F_, 1
	note G#, 1
	intensity $78
	note F_, 1
	note G#, 1
	intensity $88
	note F_, 1
	note G#, 1
	intensity $98
	note F_, 1
	note G#, 1
	intensity $a8
	note F_, 1
	note G#, 1
	intensity $b8
	note F_, 1
	note G#, 1
Music_Pinballgengarstage_gengar_branch_3e081: ; 3e081
Music_Pinballgengarstage_haunter_branch_3e081: ; 3e081
	vibrato $8, $33
	intensity $81
	octave 2
	note F_, 2
	note F_, 1
	note __, 1
	note F_, 2
	note F_, 1
	note __, 1
	note F_, 2
	note F_, 1
	note __, 1
	note F_, 2
	note F_, 1
	note __, 1
	intensity $88
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	note G#, 2
	note __, 2
	intensity $81
	note C_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note C_, 1
	note __, 1
	intensity $88
	note A_, 6
	note F#, 6
	note D#, 2
	note __, 2
	loopchannel 2, Music_Pinballgengarstage_haunter_branch_3e081
	callchannel Music_Pinballgengarstage_haunter_branch_3e12f
	forceoctave $3
	callchannel Music_Pinballgengarstage_haunter_branch_3e12f
	forceoctave $8
	callchannel Music_Pinballgengarstage_haunter_branch_3e12f
	forceoctave $0
	intensity $88
	octave 4
	note C#, 4
	intensity $81
	octave 3
	note D#, 1
	note __, 1
	intensity $88
	octave 4
	note C_, 4
	intensity $81
	octave 3
	note D_, 1
	note __, 1
	intensity $88
	note B_, 4
	intensity $81
	note C#, 1
	note __, 1
	intensity $88
	note A#, 4
	intensity $81
	note C_, 1
	note __, 1
	intensity $88
	note A_, 2
	note G#, 2
	note G_, 2
	note F#, 2
	callchannel Music_Pinballgengarstage_haunter_branch_3e14e
	intensity $81
	octave 2
	note C_, 2
	note C_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note C_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	note D#, 2
	note E_, 1
	note __, 1
	note F_, 2
	note F#, 1
	note __, 1
	note G_, 2
	callchannel Music_Pinballgengarstage_haunter_branch_3e14e
	intensity $88
	octave 2
	note B_, 2
	octave 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	note B_, 2
	octave 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	vibrato $6, $53
	intensity $88
	octave 2
	note A#, 1
	note B_, 11
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	loopchannel 0, Music_Pinballgengarstage_haunter_branch_3e081
; 3e12f

Music_Pinballgengarstage_gengar_branch_3e12f: ; 3e12f
Music_Pinballgengarstage_haunter_branch_3e12f: ; 3e12f
	intensity $88
	octave 3
	note C_, 4
	intensity $81
	octave 2
	note C_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note C_, 1
	note __, 1
	intensity $88
	octave 3
	note C_, 4
	intensity $81
	octave 2
	note C_, 2
	octave 3
	note C_, 2
	note __, 2
	intensity $88
	note F#, 6
	endchannel
; 3e14e

Music_Pinballgengarstage_gengar_branch_3e14e: ; 3e14e
Music_Pinballgengarstage_haunter_branch_3e14e: ; 3e14e
	intensity $81
	octave 2
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note G#, 2
	intensity $88
	note B_, 6
	intensity $81
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note B_, 2
	intensity $88
	octave 3
	note D_, 6
	endchannel
; 3e165

Music_Pinballgengarstage_gengar_Ch2: ; 3e165
	dutycycle $1
	vibrato $12, $34
	notetype $6, $b8
	octave 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $b8
	note A#, 1
	intensity $28
	note A#, 1
	intensity $b8
	note B_, 1
	intensity $28
	note B_, 1
	intensity $b8
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $48
	octave 4
	note A_, 1
	intensity $18
	note A_, 1
	intensity $68
	note A#, 1
	intensity $18
	note A#, 1
	intensity $88
	note B_, 1
	intensity $18
	note B_, 1
	intensity $a8
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $b8
	note C#, 16
	note D_, 16
	octave 4
	note B_, 16
	vibrato $8, $33
Music_Pinballgengarstage_gengar_branch_3e1a8: ; 3e1a8
	intensity $91
	octave 2
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note G#, 1
	note __, 1
	intensity $b8
	octave 3
	note F_, 6
	note D_, 6
	octave 2
	note B_, 2
	intensity $18
	note B_, 2
	intensity $91
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	intensity $b8
	octave 3
	note C_, 6
	octave 2
	note A_, 6
	note F#, 2
	intensity $18
	note F#, 2
	loopchannel 2, Music_Pinballgengarstage_gengar_branch_3e1a8
	callchannel Music_Pinballgengarstage_gengar_branch_3e25f
	forceoctave $3
	callchannel Music_Pinballgengarstage_gengar_branch_3e25f
	forceoctave $8
	callchannel Music_Pinballgengarstage_gengar_branch_3e25f
	forceoctave $0
	intensity $b8
	octave 4
	note E_, 4
	intensity $a1
	octave 3
	note F#, 1
	note __, 1
	intensity $b8
	octave 4
	note D#, 4
	intensity $a1
	octave 3
	note F_, 1
	note __, 1
	intensity $b8
	octave 4
	note D_, 4
	intensity $a1
	octave 3
	note E_, 1
	note __, 1
	intensity $b8
	octave 4
	note C#, 4
	intensity $a1
	octave 3
	note D#, 1
	note __, 1
	intensity $a8
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A#, 2
	note A_, 2
	callchannel Music_Pinballgengarstage_gengar_branch_3e280
	intensity $a1
	octave 2
	note D#, 2
	note D#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note E_, 2
	note F_, 1
	note __, 1
	note F#, 2
	note G_, 1
	note __, 1
	note G#, 2
	note A_, 1
	note __, 1
	note A#, 2
	callchannel Music_Pinballgengarstage_gengar_branch_3e280
	intensity $a1
	note D_, 2
	octave 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	vibrato $6, $43
	intensity $b8
	octave 3
	note C#, 1
	note D_, 11
	note C#, 2
	note C_, 2
	octave 2
	note B_, 2
	note A#, 2
	loopchannel 0, Music_Pinballgengarstage_gengar_branch_3e1a8
; 3e25f

Music_Pinballgengarstage_gengar_branch_3e25f: ; 3e25f
	intensity $b8
	octave 3
	note D#, 4
	intensity $91
	octave 2
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	intensity $b8
	octave 3
	note D#, 4
	intensity $a1
	octave 2
	note D#, 2
	octave 3
	note D#, 2
	intensity $18
	note D#, 2
	intensity $b8
	note A_, 6
	endchannel
; 3e280

Music_Pinballgengarstage_gengar_branch_3e280: ; 3e280
	intensity $91
	octave 2
	note G#, 2
	note __, 2
	note G#, 2
	note G#, 2
	note B_, 2
	intensity $b8
	octave 3
	note D_, 6
	intensity $91
	octave 2
	note G#, 2
	note __, 2
	note G#, 2
	note G#, 2
	octave 3
	note D_, 2
	intensity $b8
	note F_, 6
	endchannel
; 3e299

Music_Pinballgengarstage_gengar_Ch3: ; 3e299
	notetype $6, $22
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	notetype $6, $32
	note D#, 1
	note __, 1
	notetype $6, $32
	octave 3
	note D#, 1
	note __, 1
	notetype $6, $22
	octave 2
	note D#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note D#, 16
	notetype $6, $32
	note D_, 1
	note C#, 1
	note C_, 1
	octave 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	notetype $6, $22
	note D#, 16
	notetype $6, $12
	forceoctave $28
	octave 3
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	forceoctave $0
Music_Pinballgengarstage_gengar_branch_3e2db: ; 3e2db
	notetype $6, $22
	octave 1
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note G#, 1
	note __, 1
	note G#, 2
	note G#, 1
	note __, 1
	octave 2
	note F_, 6
	note D_, 6
	octave 1
	note B_, 2
	note __, 2
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	octave 2
	note C_, 6
	octave 1
	note A_, 6
	note F#, 2
	note __, 2
	loopchannel 2, Music_Pinballgengarstage_gengar_branch_3e2db
	callchannel Music_Pinballgengarstage_gengar_branch_3e36d
	forceoctave $3
	callchannel Music_Pinballgengarstage_gengar_branch_3e36d
	forceoctave $8
	callchannel Music_Pinballgengarstage_gengar_branch_3e36d
	forceoctave $0
	note E_, 4
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note D#, 4
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D_, 4
	octave 2
	note E_, 1
	note __, 1
	octave 3
	note C#, 4
	octave 2
	note D#, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A#, 2
	note A_, 2
	callchannel Music_Pinballgengarstage_gengar_branch_3e382
	octave 1
	note D#, 2
	note D#, 1
	note __, 1
	octave 2
	note D#, 2
	octave 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 2
	octave 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 2
	octave 1
	note D#, 1
	note __, 1
	note E_, 2
	note F_, 1
	note __, 1
	note F#, 2
	note G_, 1
	note __, 1
	note G#, 2
	note A_, 1
	note __, 1
	note A#, 2
	callchannel Music_Pinballgengarstage_gengar_branch_3e382
	note D_, 2
	octave 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note D_, 2
	octave 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note C#, 1
	note D_, 11
	note C#, 2
	note C_, 2
	octave 1
	note B_, 2
	note A#, 2
	loopchannel 0, Music_Pinballgengarstage_gengar_branch_3e2db
; 3e36d

Music_Pinballgengarstage_gengar_branch_3e36d: ; 3e36d
	octave 2
	note D#, 4
	octave 1
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	note D#, 2
	note D#, 1
	note __, 1
	octave 2
	note D#, 4
	octave 1
	note D#, 2
	octave 2
	note D#, 2
	note __, 2
	note A_, 6
	endchannel
; 3e382

Music_Pinballgengarstage_gengar_branch_3e382: ; 3e382
	octave 1
	note G#, 2
	note __, 2
	note G#, 2
	note G#, 2
	note B_, 2
	octave 2
	note D_, 6
	octave 1
	note G#, 2
	note __, 2
	note G#, 2
	note G#, 2
	octave 2
	note D_, 2
	note F_, 6
	endchannel
; 3e393

Music_Pinballgengarstage_gengar_Ch4: ; 3e393
	togglenoise $0
	notetype $c
	note F_, 16
	note __, 16
Music_Pinballgengarstage_gengar_branch_3e399: ; 3e399
	callchannel Music_Pinballgengarstage_gengar_branch_3e3c3
	loopchannel 7, Music_Pinballgengarstage_gengar_branch_3e399
	note D_, 2
	note D#, 1
	note D_, 2
	note D#, 1
	note D_, 2
	note D#, 1
	note D_, 2
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D_, 1
Music_Pinballgengarstage_gengar_branch_3e3ac: ; 3e3ac
	callchannel Music_Pinballgengarstage_gengar_branch_3e3c3
	loopchannel 3, Music_Pinballgengarstage_gengar_branch_3e3ac
	note D#, 2
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 2
	note D#, 2
	note D_, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	loopchannel 0, Music_Pinballgengarstage_gengar_branch_3e399
; 3e3c3

Music_Pinballgengarstage_gengar_branch_3e3c3: ; 3e3c3
	note D#, 2
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 2
	note D#, 2
	note D_, 1
	note D#, 2
	note D#, 1
	note D_, 2
	endchannel
; 3e3ce

