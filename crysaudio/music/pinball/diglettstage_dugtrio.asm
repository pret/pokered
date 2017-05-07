Music_Pinballdiglettstage_dugtrio: ; 45040
	dbw $c0, Music_Pinballdiglettstage_dugtrio_Ch1
	dbw $01, Music_Pinballdiglettstage_dugtrio_Ch2
	dbw $02, Music_Pinballdiglettstage_dugtrio_Ch3
	dbw $03, Music_Pinballdiglettstage_dugtrio_Ch4
; 4504c

Music_Pinballdiglettstage_dugtrio_Ch1: ; 4504c
	tempo 144
	volume $77
	notetype $c, $83
	note __, 16
	dutycycle $2
Music_Pinballdiglettstage_dugtrio_branch_45057: ; 45057
	note __, 16
	note __, 12
	notetype $6, $73
	octave 4
	note F_, 1
	intensity $43
	note F_, 1
	intensity $73
	note F#, 1
	intensity $43
	note F#, 1
	note __, 2
	intensity $73
	note G_, 1
	intensity $43
	note G_, 1
	notetype $c, $83
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 9
	notetype $6, $73
	octave 5
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	notetype $c, $83
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
	loopchannel 0, Music_Pinballdiglettstage_dugtrio_branch_45057
; 4509e

Music_Pinballdiglettstage_dugtrio_Ch2: ; 4509e
	dutycycle $2
	tone $0001
	notetype $c, $b3
	note __, 12
	notetype $6, $83
	octave 3
	note D#, 1
	intensity $53
	note D#, 1
	intensity $83
	octave 4
	note D#, 1
	intensity $53
	note D#, 1
	intensity $83
	octave 3
	note E_, 1
	intensity $53
	note E_, 1
	intensity $83
	octave 4
	note E_, 1
	intensity $53
	note E_, 1
Music_Pinballdiglettstage_dugtrio_branch_450c4: ; 450c4
	panning $ff
	notetype $c, $b3
	note __, 16
	note __, 8
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45213
	intensity $83
	octave 5
	note C#, 1
	intensity $53
	note C#, 1
	intensity $83
	note D_, 1
	intensity $33
	note D_, 1
	note __, 2
	intensity $83
	note D#, 1
	intensity $53
	note D#, 1
	notetype $c, $b3
	note __, 16
	note __, 8
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45221
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45245
	panning $ff
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4529e
	forceoctave $4
	panning $f0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452cb
	panning $f
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452e4
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45245
	panning $ff
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452cb
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452e4
	intensity $83
	note __, 2
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $43
	note C_, 1
	note __, 1
	intensity $53
	octave 4
	note A#, 1
	note __, 1
	intensity $63
	octave 5
	note C_, 1
	note __, 1
	intensity $73
	note E_, 1
	note __, 1
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45245
	panning $f
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4529e
	forceoctave $4
	panning $f0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452cb
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452e4
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45245
	panning $ff
	intensity $83
	octave 1
	note D#, 1
	intensity $53
	note D#, 1
	intensity $83
	note D#, 1
	intensity $53
	note D#, 1
	intensity $83
	octave 2
	note D#, 1
	intensity $53
	note D#, 1
	intensity $83
	octave 1
	note D#, 1
	intensity $53
	note D#, 1
	intensity $83
	octave 2
	note C#, 1
	intensity $53
	note C#, 1
	intensity $83
	note D_, 1
	intensity $53
	note D_, 1
	note __, 2
	intensity $83
	note D#, 1
	intensity $53
	note D#, 1
	forceoctave $1
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45221
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452fd
	panning $f0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4532e
	forceoctave $e
	panning $f
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45213
	forceoctave $a
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45213
	panning $ff
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45345
	panning $f0
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_452fd
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4532e
	panning $f
	forceoctave $e
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45213
	forceoctave $a
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45213
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45345
	panning $ff
	intensity $83
	octave 1
	note C_, 1
	note __, 1
	octave 6
	note C_, 1
	intensity $53
	octave 5
	note G_, 1
	intensity $83
	note A#, 1
	note __, 1
	note G_, 1
	intensity $53
	note C_, 1
	note E_, 1
	note __, 1
	intensity $83
	note C_, 1
	intensity $53
	octave 4
	note G_, 1
	intensity $83
	note A#, 1
	note __, 1
	note G_, 1
	intensity $53
	note C_, 1
	intensity $83
	note E_, 1
	note __, 1
	note C_, 1
	intensity $53
	octave 3
	note G_, 1
	intensity $83
	note A#, 1
	note __, 1
	note G_, 1
	intensity $53
	note E_, 1
	panning $f0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45213
	loopchannel 0, Music_Pinballdiglettstage_dugtrio_branch_450c4
; 45213

Music_Pinballdiglettstage_dugtrio_branch_45213: ; 45213
	notetype $6, $83
	octave 1
	note B_, 1
	intensity $53
	octave 2
	note C_, 1
	loopchannel 4, Music_Pinballdiglettstage_dugtrio_branch_45213
	endchannel
; 45221

Music_Pinballdiglettstage_dugtrio_branch_45221: ; 45221
	notetype $6, $33
	octave 2
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	intensity $43
	note E_, 1
	intensity $53
	note F_, 1
	intensity $63
	note F#, 1
	intensity $73
	note G_, 1
	intensity $83
	note G#, 1
	intensity $93
	note A_, 1
	intensity $a3
	note A#, 1
	endchannel
; 45245

Music_Pinballdiglettstage_dugtrio_branch_45245: ; 45245
	panning $f0
	intensity $83
	octave 3
	note F_, 1
	note B_, 1
	intensity $53
	note F_, 1
	note B_, 1
	intensity $83
	note F_, 1
	octave 4
	note C_, 1
	intensity $53
	octave 3
	note F_, 1
	octave 4
	note C_, 1
	intensity $83
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	intensity $53
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	intensity $83
	octave 3
	note F_, 1
	note B_, 1
	intensity $53
	note F_, 1
	note B_, 1
	panning $f
	intensity $83
	note F_, 1
	octave 4
	note C_, 1
	intensity $53
	octave 3
	note F_, 1
	octave 4
	note C_, 1
	intensity $83
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	intensity $53
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	intensity $83
	octave 3
	note F_, 1
	note B_, 1
	intensity $53
	note F_, 1
	note B_, 1
	intensity $83
	note F_, 1
	octave 4
	note C_, 1
	intensity $53
	octave 3
	note F_, 1
	octave 4
	note C_, 1
	endchannel
; 4529e

Music_Pinballdiglettstage_dugtrio_branch_4529e: ; 4529e
	intensity $83
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $53
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $83
	octave 3
	note G#, 1
	octave 4
	note D_, 1
	intensity $53
	octave 3
	note G#, 1
	octave 4
	note D_, 1
	intensity $83
	octave 3
	note F_, 1
	octave 4
	note C#, 1
	intensity $53
	octave 3
	note F_, 1
	octave 4
	note C#, 1
	intensity $83
	note C#, 1
	note G_, 1
	intensity $53
	note C#, 1
	note G_, 1
	endchannel
; 452cb

Music_Pinballdiglettstage_dugtrio_branch_452cb: ; 452cb
	intensity $73
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $63
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $53
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $43
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	endchannel
; 452e4

Music_Pinballdiglettstage_dugtrio_branch_452e4: ; 452e4
	intensity $33
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $43
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $53
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	intensity $63
	octave 3
	note A_, 1
	octave 4
	note D#, 1
	endchannel
; 452fd

Music_Pinballdiglettstage_dugtrio_branch_452fd: ; 452fd
	intensity $83
	octave 4
	note C_, 1
	note __, 1
	octave 1
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 1
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	endchannel
; 4532e

Music_Pinballdiglettstage_dugtrio_branch_4532e: ; 4532e
	octave 1
	note G_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 1
	note G_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note D_, 1
	note __, 1
	endchannel
; 45345

Music_Pinballdiglettstage_dugtrio_branch_45345: ; 45345
	intensity $83
	octave 4
	note C_, 1
	note __, 1
	octave 1
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 1
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	endchannel
; 45375

Music_Pinballdiglettstage_dugtrio_Ch3: ; 45375
	notetype $6, $12
	octave 1
	note A_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C#, 1
	intensity $32
	note C#, 1
	intensity $12
	octave 3
	note C#, 1
	intensity $32
	note C#, 1
	intensity $12
	octave 2
	note D_, 1
	intensity $32
	note D_, 1
	intensity $12
	octave 3
	note D_, 1
	intensity $32
	note D_, 1
	intensity $12
	octave 2
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 3
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 2
	note E_, 1
	intensity $32
	note E_, 1
	intensity $12
	octave 3
	note E_, 1
	intensity $32
	note E_, 1
Music_Pinballdiglettstage_dugtrio_branch_453c5: ; 453c5
	forceoctave $2
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454d5
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454d5
	forceoctave $2
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	forceoctave $2
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	forceoctave $2
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	intensity $12
	octave 1
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 2
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 1
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 2
	note C#, 1
	intensity $32
	note C#, 1
	intensity $12
	note D_, 1
	intensity $32
	note D_, 1
	note __, 2
	intensity $12
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 1
	note D#, 1
	intensity $32
	note D#, 1
	note __, 6
	intensity $12
	note B_, 1
	octave 2
	note C_, 1
	intensity $32
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	intensity $12
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	intensity $32
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	forceoctave $2
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	forceoctave $2
	callchannel Music_Pinballdiglettstage_dugtrio_branch_454fe
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45556
	intensity $22
	octave 4
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	intensity $32
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	intensity $22
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note G_, 1
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45565
	forceoctave $4
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4559a
	forceoctave $0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4559a
	forceoctave $4
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4559a
	forceoctave $0
	intensity $12
	note F#, 1
	note G_, 1
	intensity $32
	note F#, 1
	note G_, 1
	intensity $12
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	intensity $22
	callchannel Music_Pinballdiglettstage_dugtrio_branch_45565
	octave 2
	note C_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	forceoctave $4
	callchannel Music_Pinballdiglettstage_dugtrio_branch_4559a
	loopchannel 0, Music_Pinballdiglettstage_dugtrio_branch_453c5
; 454d5

Music_Pinballdiglettstage_dugtrio_branch_454d5: ; 454d5
	intensity $12
	octave 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	octave 1
	note D#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	note D_, 1
	note __, 3
	note D#, 1
	note __, 1
	intensity $22
	octave 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	octave 1
	note D#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	note D_, 1
	note __, 3
	note D#, 1
	note __, 1
	endchannel
; 454fe

Music_Pinballdiglettstage_dugtrio_branch_454fe: ; 454fe
	intensity $12
	octave 1
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 2
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 1
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 2
	note C#, 1
	intensity $32
	note C#, 1
	intensity $12
	note D_, 1
	intensity $32
	note D_, 1
	note __, 2
	intensity $12
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 1
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 2
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 1
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	note D#, 1
	intensity $32
	note D#, 1
	intensity $12
	octave 2
	note D#, 1
	intensity $32
	note D#, 1
	endchannel
; 45556

Music_Pinballdiglettstage_dugtrio_branch_45556: ; 45556
	intensity $12
	octave 1
	note E_, 1
	intensity $32
	note E_, 1
	intensity $12
	octave 2
	note E_, 1
	intensity $32
	note E_, 1
	endchannel
; 45565

Music_Pinballdiglettstage_dugtrio_branch_45565: ; 45565
	octave 3
	note E_, 1
	note __, 5
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 5
	octave 3
	note E_, 1
	note __, 5
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	note __, 4
	note G_, 1
	note __, 1
	note A_, 1
	note __, 5
	note G_, 1
	note __, 1
	note A_, 1
	note __, 16
	note __, 1
	note E_, 1
	note __, 5
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 5
	octave 3
	note E_, 1
	note __, 5
	note G_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	endchannel
; 4559a

Music_Pinballdiglettstage_dugtrio_branch_4559a: ; 4559a
	intensity $12
	octave 1
	note F#, 1
	note G_, 1
	intensity $32
	note F#, 1
	note G_, 1
	intensity $12
	note F#, 1
	note G_, 1
	intensity $32
	note F#, 1
	note G_, 1
	endchannel
; 455ac

Music_Pinballdiglettstage_dugtrio_Ch4: ; 455ac
	togglenoise $1
	notetype $c
	note C_, 8
	notetype $8
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
Music_Pinballdiglettstage_dugtrio_branch_455be: ; 455be
	callchannel Music_Pinballdiglettstage_dugtrio_branch_455df
	loopchannel 7, Music_Pinballdiglettstage_dugtrio_branch_455be
	callchannel Music_Pinballdiglettstage_dugtrio_branch_455f0
	callchannel Music_Pinballdiglettstage_dugtrio_branch_455df
	callchannel Music_Pinballdiglettstage_dugtrio_branch_455df
	callchannel Music_Pinballdiglettstage_dugtrio_branch_455df
	callchannel Music_Pinballdiglettstage_dugtrio_branch_455f0
Music_Pinballdiglettstage_dugtrio_branch_455d4: ; 455d4
	callchannel Music_Pinballdiglettstage_dugtrio_branch_455df
	loopchannel 8, Music_Pinballdiglettstage_dugtrio_branch_455d4
	loopchannel 0, Music_Pinballdiglettstage_dugtrio_branch_455be
; 455df

Music_Pinballdiglettstage_dugtrio_branch_455df: ; 455df
	note D#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	endchannel
; 455f0

Music_Pinballdiglettstage_dugtrio_branch_455f0: ; 455f0
	note D#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	endchannel
; 45601


