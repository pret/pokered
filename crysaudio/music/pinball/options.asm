Music_Pinballoptions: ; 49374
	dbw $80, Music_Pinballoptions_Ch1
	dbw $01, Music_Pinballoptions_Ch2
	dbw $02, Music_Pinballoptions_Ch3
; 4937d

Music_Pinballoptions_Ch1: ; 4937d
	tempo 272
	volume $77
	endchannel
; 49383

Music_Pinballoptions_Ch2: ; 49383
	dutycycle $2
	tone $0001
Music_Pinballoptions_branch_49388: ; 49388
	callchannel Music_Pinballoptions_branch_49406
	intensity $a2
	note A_, 1
	intensity $52
	note A_, 1
	intensity $22
	note A_, 2
	intensity $a2
	note G#, 1
	intensity $52
	note G#, 1
	callchannel Music_Pinballoptions_branch_49406
	intensity $a2
	note B_, 1
	intensity $52
	note B_, 1
	intensity $22
	note B_, 2
	intensity $a2
	octave 6
	note C#, 1
	intensity $52
	note C#, 1
	intensity $a2
	note D#, 1
	intensity $52
	note D#, 1
	intensity $a2
	octave 5
	note F#, 1
	intensity $52
	note F#, 1
	intensity $a2
	note G#, 1
	intensity $52
	note G#, 1
	intensity $a2
	note F#, 1
	intensity $52
	note F#, 1
	intensity $22
	note F#, 2
	intensity $a2
	note A#, 1
	intensity $52
	note A#, 1
	intensity $a2
	note G#, 1
	intensity $52
	note G#, 1
	intensity $a2
	note F#, 1
	intensity $52
	note F#, 1
	intensity $a2
	note F#, 1
	intensity $52
	note F#, 1
	intensity $a2
	note F_, 1
	intensity $52
	note F_, 1
	intensity $a2
	note E_, 1
	intensity $52
	note E_, 1
	intensity $a2
	note D#, 1
	intensity $52
	note D#, 1
	intensity $a2
	note C#, 1
	intensity $52
	note C#, 1
	intensity $22
	note C#, 4
	intensity $a2
	note A_, 1
	intensity $52
	note A_, 1
	loopchannel 0, Music_Pinballoptions_branch_49388
; 49406

Music_Pinballoptions_branch_49406: ; 49406
	notetype $c, $a2
	octave 5
	note A#, 1
	intensity $52
	note A#, 1
	intensity $a2
	note A_, 1
	intensity $52
	note A_, 1
	intensity $a2
	note G#, 1
	intensity $52
	note G#, 1
	intensity $a2
	note A#, 1
	intensity $52
	note A#, 1
	intensity $22
	note A#, 2
	endchannel
; 49424

Music_Pinballoptions_Ch3: ; 49424
Music_Pinballoptions_branch_49424: ; 49424
	callchannel Music_Pinballoptions_branch_494ac
	intensity $22
	octave 5
	note C#, 1
	intensity $32
	note C#, 1
	note __, 2
	callchannel Music_Pinballoptions_branch_494ac
	intensity $22
	octave 5
	note D_, 1
	intensity $32
	note D_, 1
	note __, 2
	callchannel Music_Pinballoptions_branch_494ac
	intensity $22
	octave 5
	note D#, 1
	intensity $32
	note D#, 1
	note __, 2
	callchannel Music_Pinballoptions_branch_494ac
	intensity $22
	octave 5
	note E_, 1
	intensity $32
	note E_, 1
	note __, 2
	intensity $22
	octave 3
	note B_, 1
	intensity $32
	note B_, 1
	intensity $22
	octave 4
	note D#, 1
	intensity $32
	note D#, 1
	intensity $22
	note F#, 1
	intensity $32
	note F#, 1
	note __, 2
	intensity $22
	note C_, 1
	intensity $32
	note C_, 1
	intensity $22
	note D#, 1
	intensity $32
	note D#, 1
	intensity $22
	note F#, 1
	intensity $32
	note F#, 1
	note __, 2
	intensity $22
	note C#, 1
	intensity $32
	note C#, 1
	intensity $22
	note F_, 1
	intensity $32
	note F_, 1
	intensity $22
	note G#, 1
	intensity $32
	note G#, 1
	intensity $22
	note F_, 1
	intensity $32
	note F_, 1
	intensity $22
	note G#, 1
	intensity $32
	note G#, 1
	intensity $22
	note F_, 1
	intensity $32
	note F_, 1
	intensity $22
	note G#, 1
	intensity $32
	note G#, 1
	intensity $22
	note B_, 1
	intensity $32
	note B_, 1
	loopchannel 0, Music_Pinballoptions_branch_49424
; 494ac

Music_Pinballoptions_branch_494ac: ; 494ac
	notetype $c, $22
	octave 4
	note F#, 1
	intensity $32
	note F#, 1
	intensity $22
	note A#, 1
	intensity $32
	note A#, 1
	endchannel
; 494bb


