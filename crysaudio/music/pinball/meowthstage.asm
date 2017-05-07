Music_Pinballmeowthstage: ; 496fe
	dbw $c0, Music_Pinballmeowthstage_Ch1
	dbw $01, Music_Pinballmeowthstage_Ch2
	dbw $02, Music_Pinballmeowthstage_Ch3
	dbw $03, Music_Pinballmeowthstage_Ch4
; 4970a

Music_Pinballmeowthstage_Ch1: ; 4970a
	tempo 96
	volume $77
	vibrato $12, $24
	dutycycle $3
	notetype $8, $93
	callchannel Music_Pinballmeowthstage_branch_497e7
Music_Pinballmeowthstage_branch_4971a: ; 4971a
	intensity $91
	octave 3
	note __, 6
	note D#, 4
	octave 2
	note B_, 2
	octave 3
	note D#, 4
	note F#, 8
	note __, 6
	note F#, 4
	note D#, 2
	note F#, 4
	note A#, 8
	note __, 6
	note F#, 4
	note D#, 2
	note A_, 4
	note F#, 2
	note D#, 4
	note C_, 2
	intensity $97
	note D#, 4
	note __, 2
	note C#, 4
	note __, 2
	note C_, 4
	note __, 2
	note C#, 4
	note __, 2
	callchannel Music_Pinballmeowthstage_branch_49804
	intensity $91
	note __, 6
	note G_, 4
	octave 4
	note C#, 2
	octave 3
	note G_, 4
	note E_, 2
	note C#, 4
	note E_, 2
	intensity $97
	note F#, 4
	note __, 2
	note D#, 4
	note __, 2
	note F#, 4
	note __, 2
	note A#, 4
	note __, 2
	intensity $97
	note B_, 4
	note __, 2
	intensity $91
	note D#, 4
	octave 2
	note B_, 2
	octave 3
	note D#, 4
	note F#, 8
	intensity $97
	note A#, 4
	note __, 2
	intensity $91
	note F#, 4
	note D#, 2
	note F#, 4
	note A#, 8
	note D#, 1
	note __, 3
	intensity $97
	note A_, 6
	note __, 2
	intensity $91
	note F#, 6
	note D#, 6
	intensity $97
	note D#, 4
	note __, 2
	note C#, 4
	note __, 2
	note C_, 4
	note __, 2
	note C#, 4
	note __, 2
	callchannel Music_Pinballmeowthstage_branch_49804
	intensity $97
	note A#, 4
	note B_, 2
	octave 4
	note C_, 4
	note C#, 6
	octave 3
	note B_, 2
	note A#, 2
	note __, 2
	intensity $91
	note C#, 2
	octave 4
	note D#, 14
	note __, 10
	callchannel Music_Pinballmeowthstage_branch_49814
	intensity $97
	note B_, 14
	note __, 2
	intensity $91
	note E_, 2
	note B_, 4
	note G#, 2
	intensity $97
	note A#, 8
	note __, 2
	intensity $91
	note G#, 8
	note A#, 6
	intensity $97
	note F#, 14
	note __, 2
	intensity $91
	note E_, 6
	note D#, 2
	intensity $97
	octave 4
	note D#, 12
	note __, 4
	intensity $91
	note E_, 6
	note D#, 2
	callchannel Music_Pinballmeowthstage_branch_49814
	intensity $97
	note E_, 14
	note __, 2
	intensity $91
	note E_, 2
	note F#, 4
	note G#, 2
	intensity $97
	note F_, 8
	note __, 2
	intensity $91
	note E_, 8
	note F_, 6
	notetype $c, $97
	note A#, 12
	notetype $8, $97
	note G#, 2
	note __, 4
	intensity $91
	note F#, 4
	octave 4
	note C#, 6
	intensity $97
	octave 5
	note C#, 10
	note __, 4
	forceoctave $c
	callchannel Music_Pinballmeowthstage_branch_497e7
	forceoctave $0
	loopchannel 0, Music_Pinballmeowthstage_branch_4971a
; 497e7

Music_Pinballmeowthstage_branch_497e7: ; 497e7
	intensity $91
	octave 2
	note A#, 4
	note B_, 2
	octave 3
	note C_, 4
	intensity $97
	note C#, 4
	note __, 2
	intensity $91
	note C_, 2
	octave 2
	note B_, 4
	note A#, 2
	note __, 4
	intensity $97
	octave 4
	note C#, 4
	note __, 4
	intensity $91
	octave 3
	note A#, 6
	note F#, 6
	endchannel
; 49804

Music_Pinballmeowthstage_branch_49804: ; 49804
	intensity $91
	octave 3
	note __, 6
	note C#, 4
	octave 2
	note A#, 2
	octave 3
	note C#, 4
	note E_, 8
	note __, 6
	note E_, 4
	note C#, 2
	note E_, 4
	note G#, 8
	endchannel
; 49814

Music_Pinballmeowthstage_branch_49814: ; 49814
	intensity $91
	octave 4
	note G_, 4
	note G#, 2
	note A#, 4
	intensity $97
	note A#, 6
	intensity $91
	note G#, 2
	note G_, 4
	octave 3
	note A#, 2
	octave 4
	note C#, 4
	note D#, 2
	note C#, 4
	octave 3
	note B_, 6
	note A#, 6
	note B_, 2
	octave 4
	note G_, 4
	note G#, 2
	note A#, 4
	intensity $97
	octave 5
	note C#, 6
	intensity $91
	octave 4
	note A#, 2
	note A#, 4
	note G_, 2
	octave 3
	note A#, 4
	note B_, 2
	note A#, 4
	note G#, 6
	note G_, 6
	note G#, 2
	endchannel
; 49841

Music_Pinballmeowthstage_Ch2: ; 49841
	vibrato $12, $24
	dutycycle $3
	notetype $8, $b3
	callchannel Music_Pinballmeowthstage_branch_4993c
Music_Pinballmeowthstage_branch_4984c: ; 4984c
	callchannel Music_Pinballmeowthstage_branch_4995b
	callchannel Music_Pinballmeowthstage_branch_499bb
	intensity $b1
	octave 4
	note F#, 4
	note C_, 2
	note C#, 4
	note F#, 2
	note C_, 4
	note C#, 2
	note F#, 4
	note C#, 2
	intensity $b7
	note E_, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note E_, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note E_, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note D#, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note D#, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note D#, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note D_, 4
	intensity $18
	note D_, 2
	intensity $b7
	note D#, 4
	intensity $18
	note D#, 1
	intensity $68
	note D_, 1
	callchannel Music_Pinballmeowthstage_branch_4995b
	callchannel Music_Pinballmeowthstage_branch_499bb
	intensity $b7
	octave 4
	note F#, 4
	note G#, 2
	note A_, 4
	note A#, 6
	note G#, 2
	note F#, 2
	intensity $18
	note F#, 2
	intensity $b1
	octave 3
	note F#, 2
	octave 4
	note B_, 4
	intensity $78
	octave 2
	note F#, 1
	note __, 1
	note F#, 3
	intensity $18
	note F#, 2
	note __, 1
	intensity $78
	note G#, 4
	intensity $18
	note G#, 2
	intensity $78
	note A_, 4
	intensity $18
	note A_, 1
	intensity $78
	octave 4
	note A_, 1
	callchannel Music_Pinballmeowthstage_branch_499e5
	intensity $b7
	note G#, 14
	intensity $18
	note G#, 2
	intensity $b1
	note C#, 2
	note G#, 4
	note E_, 2
	intensity $b7
	note F#, 8
	intensity $18
	note F#, 2
	intensity $b1
	note E_, 8
	note F#, 6
	intensity $b7
	note D#, 14
	intensity $18
	note D#, 2
	intensity $b1
	note C#, 6
	octave 3
	note B_, 2
	intensity $b7
	octave 4
	note B_, 12
	intensity $18
	note B_, 2
	note __, 2
	intensity $b1
	octave 5
	note C#, 6
	octave 4
	note B_, 2
	callchannel Music_Pinballmeowthstage_branch_499e5
	intensity $b7
	note G#, 14
	intensity $18
	note G#, 2
	intensity $b1
	note G#, 2
	note A#, 4
	note B_, 2
	intensity $b7
	note B_, 8
	intensity $18
	note B_, 2
	intensity $b1
	note A#, 8
	note B_, 6
	notetype $c, $b7
	octave 5
	note C#, 12
	notetype $8, $b7
	octave 4
	note B_, 2
	intensity $18
	note B_, 2
	note __, 2
	intensity $b1
	note A#, 4
	note F#, 6
	intensity $b7
	octave 5
	note F#, 10
	intensity $18
	note F#, 2
	note __, 2
	forceoctave $c
	callchannel Music_Pinballmeowthstage_branch_4993c
	forceoctave $0
	loopchannel 0, Music_Pinballmeowthstage_branch_4984c
; 4993c

Music_Pinballmeowthstage_branch_4993c: ; 4993c
	intensity $b1
	octave 3
	note F#, 4
	note G#, 2
	note A_, 4
	intensity $b7
	note A#, 4
	intensity $18
	note A#, 2
	intensity $b1
	note A_, 2
	note G#, 4
	note F#, 2
	note __, 4
	intensity $b7
	octave 4
	note F#, 4
	intensity $18
	note F#, 2
	note __, 2
	intensity $b1
	note E_, 6
	note C#, 6
	endchannel
; 4995b

Music_Pinballmeowthstage_branch_4995b: ; 4995b
	intensity $b7
	octave 4
	note D#, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note D#, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b7
	octave 4
	note D#, 1
	intensity $68
	octave 3
	note B_, 1
	intensity $b1
	octave 4
	note D_, 4
	note D#, 2
	note G#, 4
	note D_, 2
	note D#, 4
	note G#, 2
	note D_, 4
	note D#, 2
	note G#, 4
	note D_, 2
	note D#, 4
	note G#, 2
	note D_, 4
	note D#, 2
	note G#, 4
	note D_, 2
	note D#, 4
	note G#, 2
	note D_, 4
	note D#, 2
	note G#, 4
	note D#, 2
	intensity $b7
	note F#, 1
	intensity $68
	note C#, 1
	intensity $b7
	note F#, 1
	intensity $68
	note C#, 1
	intensity $b1
	note F#, 2
	note E_, 1
	intensity $68
	note C#, 1
	intensity $b7
	note E_, 1
	intensity $68
	note C#, 1
	intensity $b7
	note E_, 1
	intensity $68
	note C#, 1
	intensity $b7
	note D#, 4
	intensity $18
	note D#, 2
	intensity $b7
	note E_, 4
	intensity $18
	note E_, 1
	intensity $68
	note C_, 1
	endchannel
; 499bb

Music_Pinballmeowthstage_branch_499bb: ; 499bb
	intensity $b7
	octave 4
	note C#, 1
	intensity $68
	octave 3
	note A#, 1
	intensity $b7
	octave 4
	note C#, 1
	intensity $68
	octave 3
	note A#, 1
	intensity $b7
	octave 4
	note C#, 1
	intensity $68
	octave 3
	note A#, 1
	intensity $b1
	octave 4
	note C_, 4
	note C#, 2
	note F#, 4
	note C_, 2
	note C#, 4
	note F#, 2
	note C_, 4
	note C#, 2
	note F#, 4
	note C_, 2
	note C#, 4
	note F#, 2
	note C_, 4
	note C#, 2
	endchannel
; 499e5

Music_Pinballmeowthstage_branch_499e5: ; 499e5
	intensity $b1
	octave 4
	note A#, 4
	note B_, 2
	octave 5
	note C#, 4
	intensity $b7
	note C#, 6
	intensity $b1
	octave 4
	note B_, 2
	note A#, 4
	note D#, 1
	intensity $78
	note A_, 1
	intensity $b1
	note A#, 4
	note B_, 2
	note A#, 4
	note G#, 6
	note G_, 6
	note G#, 1
	intensity $78
	note A_, 1
	intensity $b1
	note A#, 4
	note B_, 2
	octave 5
	note C#, 4
	intensity $b7
	note E_, 6
	intensity $b1
	note D#, 2
	note C#, 4
	octave 4
	note A#, 2
	octave 5
	note C#, 4
	note D#, 2
	note C#, 4
	octave 4
	note B_, 6
	note A#, 6
	note B_, 2
	endchannel
; 49a1b

Music_Pinballmeowthstage_Ch3: ; 49a1b
	notetype $8, $22
	callchannel Music_Pinballmeowthstage_branch_49add
Music_Pinballmeowthstage_branch_49a21: ; 49a21
	callchannel Music_Pinballmeowthstage_branch_49af9
	octave 3
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G_, 2
	note __, 2
	note F#, 1
	note __, 1
	note E_, 2
	note __, 2
	note C#, 1
	note __, 1
	octave 1
	note B_, 4
	note __, 2
	octave 2
	note D#, 4
	note __, 2
	note F#, 4
	note __, 2
	note A#, 4
	note __, 2
	callchannel Music_Pinballmeowthstage_branch_49af9
	octave 2
	note A#, 4
	note B_, 2
	octave 3
	note C_, 4
	note C#, 6
	octave 2
	note B_, 2
	note A#, 2
	note __, 2
	octave 1
	note A#, 1
	note __, 1
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note F#, 1
	note __, 1
	note F#, 3
	note __, 3
	note G#, 4
	note __, 2
	note A_, 4
	note __, 2
	callchannel Music_Pinballmeowthstage_branch_49b66
	octave 2
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note E_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note G#, 6
	note __, 6
	note F#, 2
	note __, 2
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	note A#, 6
	note __, 6
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note F#, 4
	note E_, 2
	note D#, 4
	note F#, 2
	octave 1
	note B_, 1
	note __, 2
	intensity $32
	octave 2
	note G#, 1
	intensity $22
	note A_, 8
	note G#, 2
	note __, 4
	note F#, 2
	note __, 4
	callchannel Music_Pinballmeowthstage_branch_49b66
	octave 2
	note B_, 2
	note __, 2
	note B_, 1
	note __, 1
	note E_, 1
	note __, 1
	note B_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G#, 6
	note __, 6
	note B_, 2
	note __, 2
	note B_, 1
	note __, 1
	note F_, 1
	note __, 1
	note B_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G#, 4
	note G_, 2
	note G#, 4
	note A_, 2
	note F#, 2
	note __, 2
	note F#, 1
	note __, 1
	note F_, 4
	note __, 2
	note E_, 4
	note __, 2
	note D#, 4
	note __, 2
	note C#, 4
	note __, 2
	octave 1
	note B_, 4
	note __, 2
	note A#, 4
	note __, 2
	octave 2
	note C#, 4
	note __, 2
	forceoctave $c
	callchannel Music_Pinballmeowthstage_branch_49add
	forceoctave $0
	loopchannel 0, Music_Pinballmeowthstage_branch_49a21
; 49add

Music_Pinballmeowthstage_branch_49add: ; 49add
	octave 1
	note F#, 1
	note __, 3
	octave 2
	note C#, 1
	note __, 1
	note D#, 1
	note __, 3
	note E_, 4
	note __, 2
	note D#, 1
	note __, 1
	note C#, 1
	note __, 3
	octave 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	note F#, 4
	note __, 2
	note G_, 1
	note __, 1
	note G#, 1
	note __, 5
	note A#, 1
	note __, 5
	endchannel
; 49af9

Music_Pinballmeowthstage_branch_49af9: ; 49af9
	octave 1
	note B_, 2
	note __, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	note D#, 2
	note __, 2
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D#, 2
	note __, 2
	note F#, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	note A#, 2
	note __, 2
	note G#, 1
	note __, 1
	note F#, 2
	note __, 2
	note E_, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 2
	note __, 2
	note F#, 1
	note __, 1
	note E_, 2
	note __, 2
	note D#, 1
	note __, 1
	note C#, 4
	note __, 2
	note E_, 4
	note __, 2
	note G#, 4
	note __, 2
	note E_, 4
	note __, 2
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	note F#, 2
	note __, 2
	note C#, 1
	note __, 1
	note F#, 2
	note __, 2
	note A#, 1
	note __, 1
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	note A_, 2
	note __, 2
	note A#, 1
	note __, 1
	endchannel
; 49b66

Music_Pinballmeowthstage_branch_49b66: ; 49b66
	octave 2
	note A#, 2
	note __, 2
	note A#, 1
	note __, 1
	note G_, 4
	note __, 2
	note A#, 4
	note __, 2
	octave 3
	note D#, 4
	note __, 2
	octave 2
	note G#, 4
	note __, 2
	note G_, 4
	note __, 2
	note F#, 4
	note __, 2
	note F_, 4
	note __, 2
	note G_, 4
	note __, 2
	note D#, 1
	note __, 3
	note G_, 2
	note __, 4
	note A#, 2
	note __, 4
	octave 3
	note D#, 2
	octave 2
	note G#, 4
	note __, 2
	note G_, 4
	note __, 2
	note F#, 4
	note __, 2
	note F_, 4
	note __, 2
	endchannel
; 49b8f

Music_Pinballmeowthstage_Ch4: ; 49b8f
	togglenoise $1
	notetype $c
	note C_, 16
	note __, 8
	notetype $8
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 4
	note G_, 2
Music_Pinballmeowthstage_branch_49b9c: ; 49b9c
	callchannel Music_Pinballmeowthstage_branch_49bf0
	callchannel Music_Pinballmeowthstage_branch_49bf9
Music_Pinballmeowthstage_branch_49ba2: ; 49ba2
	callchannel Music_Pinballmeowthstage_branch_49bf0
	loopchannel 7, Music_Pinballmeowthstage_branch_49ba2
	callchannel Music_Pinballmeowthstage_branch_49bf9
Music_Pinballmeowthstage_branch_49bac: ; 49bac
	callchannel Music_Pinballmeowthstage_branch_49bf0
	loopchannel 5, Music_Pinballmeowthstage_branch_49bac
	notetype $c
	note G_, 16
	notetype $8
	callchannel Music_Pinballmeowthstage_branch_49bf0
	callchannel Music_Pinballmeowthstage_branch_49bf9
	callchannel Music_Pinballmeowthstage_branch_49bf0
	callchannel Music_Pinballmeowthstage_branch_49bf9
Music_Pinballmeowthstage_branch_49bc4: ; 49bc4
	callchannel Music_Pinballmeowthstage_branch_49bf0
	loopchannel 3, Music_Pinballmeowthstage_branch_49bc4
	callchannel Music_Pinballmeowthstage_branch_49bf9
	callchannel Music_Pinballmeowthstage_branch_49bf0
	callchannel Music_Pinballmeowthstage_branch_49bf9
	callchannel Music_Pinballmeowthstage_branch_49bf0
	callchannel Music_Pinballmeowthstage_branch_49bf9
Music_Pinballmeowthstage_branch_49bda: ; 49bda
	callchannel Music_Pinballmeowthstage_branch_49bf0
	loopchannel 4, Music_Pinballmeowthstage_branch_49bda
	notetype $c
	note __, 16
	note __, 8
	notetype $8
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 4
	note G_, 2
	loopchannel 0, Music_Pinballmeowthstage_branch_49b9c
; 49bf0

Music_Pinballmeowthstage_branch_49bf0: ; 49bf0
	note G#, 4
	note G_, 2
	note G_, 4
	note G_, 2
	note G#, 4
	note G_, 2
	note G_, 4
	note G_, 2
	endchannel
; 49bf9

Music_Pinballmeowthstage_branch_49bf9: ; 49bf9
	note G_, 1
	note G_, 1
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 2
	note G#, 4
	note G_, 2
	note G_, 4
	note G_, 2
	endchannel
; 49c04

