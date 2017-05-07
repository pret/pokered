Music_Pinballfieldselect: ; 494bb
	dbw $c0, Music_Pinballfieldselect_Ch1
	dbw $01, Music_Pinballfieldselect_Ch2
	dbw $02, Music_Pinballfieldselect_Ch3
	dbw $03, Music_Pinballfieldselect_Ch4
; 494c7

Music_Pinballfieldselect_Ch1: ; 494c7
	tempo 152
	volume $77
	tone $0001
	dutycycle $2
	notetype $8, $71
	note __, 12
	note __, 2
	octave 6
	note F_, 2
	note __, 2
	dutycycle $3
	notetype $6, $58
	octave 5
	note C_, 1
	note C#, 1
	intensity $68
	note C_, 1
	note C#, 1
	intensity $78
	note C_, 1
	intensity $98
	note C#, 1
	intensity $b8
	note C_, 1
	note C#, 1
Music_Pinballfieldselect_branch_494ef: ; 494ef
	dutycycle $2
	intensity $a8
	octave 3
	note A#, 1
	note __, 16
	note __, 5
	callchannel Music_Pinballfieldselect_branch_49514
	note __, 14
	callchannel Music_Pinballfieldselect_branch_49514
	note __, 14
	callchannel Music_Pinballfieldselect_branch_49514
	panning $ff
	note __, 14
	intensity $a4
	octave 3
	note A#, 1
	intensity $24
	note A#, 1
	intensity $a4
	note A#, 4
	note B_, 4
	loopchannel 0, Music_Pinballfieldselect_branch_494ef
; 49514

Music_Pinballfieldselect_branch_49514: ; 49514
	intensity $81
	octave 4
	note F#, 2
	panning $f
	note A#, 2
	intensity $74
	note F#, 2
	panning $f0
	intensity $64
	note A#, 2
	intensity $54
	note F#, 2
	panning $f
	intensity $44
	note A#, 2
	intensity $34
	note F#, 2
	panning $f0
	intensity $24
	note A#, 2
	intensity $14
	note F#, 2
	endchannel
; 49537

Music_Pinballfieldselect_Ch2: ; 49537
	dutycycle $2
	notetype $c, $b4
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	intensity $24
	note C#, 1
	intensity $b4
	note C#, 1
	note C#, 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	intensity $24
	note C#, 1
	notetype $8, $b4
	note C#, 2
	octave 5
	note C#, 2
	octave 3
	note C#, 2
	notetype $c, $b4
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	notetype $6, $b4
	note B_, 1
	octave 4
	note C_, 3
Music_Pinballfieldselect_branch_49563: ; 49563
	intensity $b4
	note C#, 1
	intensity $24
	note C#, 1
	intensity $91
	octave 3
	note F#, 2
	note C#, 2
	intensity $b4
	note A#, 1
	intensity $24
	note A#, 1
	intensity $b4
	note F#, 1
	intensity $24
	note F#, 1
	intensity $b4
	note C#, 1
	intensity $24
	note C#, 1
	intensity $91
	octave 4
	note F#, 2
	intensity $b4
	note C#, 1
	intensity $24
	note C#, 1
	note __, 2
	intensity $b4
	note C#, 1
	intensity $24
	note C#, 1
	intensity $91
	note A#, 2
	intensity $b4
	octave 3
	note A#, 1
	intensity $24
	note A#, 1
	intensity $b4
	note F#, 1
	intensity $24
	note F#, 1
	intensity $b4
	note C#, 2
	intensity $94
	octave 4
	note C_, 1
	intensity $b4
	note C#, 3
	callchannel Music_Pinballfieldselect_branch_49630
	note __, 2
	intensity $b4
	note D_, 1
	intensity $24
	note D_, 1
	intensity $91
	note A#, 2
	intensity $b4
	octave 3
	note A#, 1
	intensity $24
	note A#, 1
	intensity $b4
	note F#, 1
	intensity $24
	note F#, 1
	intensity $b4
	note D_, 2
	intensity $94
	octave 4
	note C#, 1
	intensity $b4
	note D_, 3
	note D#, 1
	intensity $24
	note D#, 1
	intensity $91
	octave 3
	note F#, 2
	note D#, 2
	intensity $b4
	note A#, 1
	intensity $24
	note A#, 1
	intensity $b4
	note F#, 1
	intensity $24
	note F#, 1
	intensity $b4
	note D#, 1
	intensity $24
	note D#, 1
	intensity $91
	octave 4
	note F#, 2
	intensity $b4
	note D#, 1
	intensity $24
	note D#, 1
	note __, 2
	intensity $b4
	note D#, 1
	intensity $24
	note D#, 1
	intensity $91
	note A#, 2
	intensity $b4
	octave 3
	note A#, 1
	intensity $24
	note A#, 1
	intensity $b4
	note F#, 1
	intensity $24
	note F#, 1
	intensity $b4
	note D#, 2
	intensity $94
	octave 4
	note D_, 1
	intensity $b4
	note D#, 3
	callchannel Music_Pinballfieldselect_branch_49630
	note __, 2
	intensity $b4
	note D_, 1
	intensity $24
	note D_, 1
	intensity $91
	note A#, 2
	intensity $b4
	note F#, 1
	intensity $24
	note F#, 1
	intensity $b4
	note F#, 4
	note G#, 4
	loopchannel 0, Music_Pinballfieldselect_branch_49563
; 49630

Music_Pinballfieldselect_branch_49630: ; 49630
	intensity $b4
	note D_, 1
	intensity $24
	note D_, 1
	intensity $91
	octave 3
	note F#, 2
	note D_, 2
	intensity $b4
	note A#, 1
	intensity $24
	note A#, 1
	intensity $b4
	note F#, 1
	intensity $24
	note F#, 1
	intensity $b4
	note D_, 1
	intensity $24
	note D_, 1
	intensity $91
	octave 4
	note F#, 2
	intensity $b4
	note D_, 1
	intensity $24
	note D_, 1
	endchannel
; 49658

Music_Pinballfieldselect_Ch3: ; 49658
	notetype $6, $22
	octave 1
	note B_, 3
	note __, 1
	octave 2
	note C_, 3
	note __, 1
	note C#, 3
	note __, 1
	note D_, 3
	note __, 1
	notetype $8, $22
	note D#, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	notetype $c, $22
	note F_, 1
	octave 3
	note F_, 1
	notetype $6, $22
	note G#, 1
	note A_, 3
Music_Pinballfieldselect_branch_49678: ; 49678
	octave 1
	note F#, 4
	note __, 2
	octave 2
	note C#, 1
	note __, 1
	note C#, 6
	octave 1
	note F#, 1
	note __, 3
	octave 2
	note C#, 1
	note __, 3
	note F_, 1
	note __, 1
	note F#, 4
	octave 1
	note F#, 2
	note __, 2
	note F#, 4
	note __, 2
	octave 2
	note D_, 1
	note __, 1
	note D_, 6
	octave 1
	note F#, 1
	note __, 3
	octave 2
	note D_, 1
	note __, 3
	note F_, 1
	note __, 1
	note F#, 4
	octave 1
	note F#, 2
	note __, 2
	note F#, 4
	note __, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 6
	octave 1
	note F#, 1
	note __, 3
	octave 2
	note D#, 1
	note __, 3
	note F_, 1
	note __, 1
	note F#, 4
	octave 1
	note F#, 2
	note __, 2
	note F#, 4
	note __, 2
	octave 2
	note D_, 1
	note __, 1
	note D_, 6
	octave 1
	note F#, 1
	note __, 3
	octave 2
	note D_, 1
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note C#, 4
	octave 2
	note F_, 4
	loopchannel 0, Music_Pinballfieldselect_branch_49678
; 496c5

Music_Pinballfieldselect_Ch4: ; 496c5
	togglenoise $0
	notetype $6
	note G#, 1
	note G#, 1
	note G#, 4
	note F#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note F#, 2
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
	note D#, 1
	note D_, 1
	note D_, 2
Music_Pinballfieldselect_branch_496db: ; 496db
	note D#, 4
	note D_, 1
	note D#, 2
	note D#, 2
	note D#, 5
	note D_, 2
	note D#, 3
	note C#, 1
	note D_, 1
	note D#, 2
	note D#, 2
	note D#, 3
	note D#, 1
	note D#, 1
	note D_, 2
	note D#, 3
	note D#, 1
	note D_, 3
	note D#, 4
	note D#, 2
	note D#, 1
	note D_, 2
	note D#, 3
	note D#, 1
	note D_, 2
	note D#, 2
	note D#, 3
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 1
	loopchannel 0, Music_Pinballfieldselect_branch_496db
; 496fe


