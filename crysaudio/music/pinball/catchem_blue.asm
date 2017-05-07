Music_Pinballcatchem_blue: ; 4138f
	dbw $c0, Music_Pinballcatchem_blue_Ch1
	dbw $01, Music_Pinballcatchem_blue_Ch2
	dbw $02, Music_Pinballcatchem_blue_Ch3
	dbw $03, Music_Pinballcatchem_blue_Ch4
; 4139b

Music_Pinballcatchem_blue_Ch1: ; 4139b
	tempo 160
	volume $77
	vibrato $9, $34
	tone $0001
	notetype $c, $b3
	note __, 16
Music_Pinballcatchem_blue_branch_413aa: ; 413aa
	notetype $8, $a2
	dutycycle $3
	octave 4
	note C#, 2
	note __, 12
	note __, 10
	octave 3
	note A#, 2
	note __, 12
	note A#, 3
	note __, 7
	octave 4
	note C#, 2
	note __, 1
	intensity $81
	octave 2
	note A#, 2
	octave 3
	note C#, 1
	note A#, 2
	octave 4
	note C#, 1
	octave 3
	note C#, 2
	intensity $a2
	note A#, 2
	note __, 2
	octave 4
	note F_, 3
	note __, 6
	note C#, 2
	note __, 12
	note D#, 3
	note __, 7
	intensity $81
	dutycycle $2
	octave 3
	note A#, 2
	octave 4
	note F_, 1
	note A#, 2
	note F_, 3
	note A_, 1
	note A#, 2
	note F_, 1
	note __, 3
	note G#, 5
	note G_, 1
	note G#, 2
	note D#, 1
	note __, 3
	note F#, 5
	note F_, 1
	note F#, 2
	note F_, 4
	note G#, 3
	dutycycle $3
	octave 3
	note A#, 2
	octave 4
	note C_, 3
	dutycycle $2
	note D#, 1
	note A#, 2
	note F_, 1
	note A#, 3
	note F_, 2
	note A_, 1
	note A#, 2
	note F_, 4
	note G#, 5
	note G_, 1
	note G#, 2
	note F_, 1
	intensity $a1
	dutycycle $3
	note C#, 3
	note C#, 3
	note C_, 2
	octave 3
	note A#, 4
	note G#, 2
	note G_, 1
	note F#, 2
	note A_, 1
	note __, 2
	intensity $a3
	note A_, 3
	intensity $81
	dutycycle $2
	octave 5
	note E_, 1
	note F_, 2
	octave 4
	note A#, 3
	note F_, 3
	note A_, 1
	note A#, 2
	note F_, 4
	note G#, 3
	note G_, 2
	intensity $83
	note G#, 3
	intensity $81
	octave 5
	note C_, 1
	note C#, 2
	octave 4
	note A#, 3
	note F_, 3
	note F_, 1
	note F#, 2
	note F_, 1
	note __, 3
	octave 5
	note C_, 2
	octave 4
	note F_, 1
	note B_, 2
	intensity $83
	octave 5
	note C_, 3
	intensity $81
	octave 4
	note F_, 1
	note __, 6
	intensity $a1
	dutycycle $3
	note C#, 3
	note C_, 3
	octave 3
	note A#, 2
	intensity $a2
	note F_, 2
	note __, 5
	intensity $a1
	note F#, 2
	note F#, 1
	note A#, 3
	intensity $a3
	note F#, 3
	note __, 12
	note __, 6
	intensity $81
	dutycycle $2
	octave 4
	note D_, 2
	note A#, 3
	octave 5
	note C_, 1
	note D_, 3
	note F_, 1
	note D_, 1
	note F_, 1
	intensity $73
	note A#, 3
	note __, 9
	note __, 12
	intensity $72
	note D_, 2
	note __, 4
	intensity $71
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note __, 12
	note __, 2
	intensity $81
	note C_, 1
	intensity $91
	note C_, 3
	intensity $81
	note C_, 2
	intensity $91
	note C_, 4
	note __, 12
	note __, 6
	intensity $71
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	notetype $c, $b3
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype $8, $a2
	dutycycle $3
	note __, 12
	octave 4
	note F_, 2
	note __, 10
	callchannel Music_Pinballcatchem_blue_branch_4158d
	note G#, 2
	note F_, 1
	octave 4
	note D_, 2
	octave 3
	note F_, 1
	note G#, 2
	note F_, 1
	note G#, 2
	note F_, 1
	note G_, 2
	octave 5
	note F#, 1
	note G_, 2
	octave 3
	note F_, 1
	note G_, 2
	octave 5
	note G_, 1
	octave 3
	note G_, 2
	octave 5
	note G_, 1
	octave 3
	note D#, 2
	note G_, 1
	note A#, 2
	note G_, 1
	note D#, 2
	note A#, 1
	note D#, 2
	note A#, 1
	note E_, 2
	note G_, 1
	note A#, 2
	note G_, 1
	note E_, 2
	note A#, 1
	note G_, 2
	note A#, 1
	note __, 12
	note __, 2
	intensity $a4
	dutycycle $3
	note A#, 3
	note __, 3
	note A_, 4
	dutycycle $2
	callchannel Music_Pinballcatchem_blue_branch_4158d
	note G#, 2
	note D_, 1
	note F_, 2
	note D_, 1
	note F_, 2
	note D_, 1
	note F_, 2
	intensity $a2
	dutycycle $3
	note D#, 3
	note __, 4
	intensity $a1
	note D#, 2
	note C_, 2
	note D#, 2
	intensity $a2
	note D#, 2
	note __, 4
	note G_, 2
	note __, 4
	intensity $a1
	note F_, 2
	note C_, 3
	octave 2
	note B_, 1
	octave 3
	note C_, 2
	note C_, 1
	octave 4
	note C_, 2
	intensity $97
	note D#, 12
	note __, 1
	intensity $94
	note D_, 6
	note __, 6
	note C#, 6
	note __, 6
	intensity $a1
	note C_, 6
	note C_, 2
	note C_, 1
	note C#, 2
	octave 3
	note B_, 1
	intensity $a4
	octave 4
	note C_, 6
	note __, 12
	note __, 3
	intensity $a1
	octave 3
	note B_, 2
	octave 4
	note C_, 1
	intensity $a2
	note C#, 2
	note __, 1
	intensity $a1
	note C#, 3
	note C#, 3
	note C#, 5
	intensity $a3
	octave 3
	note D#, 3
	note __, 3
	note F#, 3
	octave 4
	note D_, 1
	intensity $97
	note D#, 12
	note __, 6
	intensity $81
	octave 2
	note G#, 2
	note G#, 2
	note G#, 2
	intensity $a1
	octave 3
	note F#, 3
	note C#, 3
	note F#, 2
	note E_, 1
	intensity $82
	note F_, 3
	note __, 12
	intensity $a1
	note D#, 3
	note D#, 3
	note G#, 2
	note D_, 1
	intensity $a3
	note D#, 3
	note __, 9
	intensity $81
	dutycycle $2
	note C#, 3
	note F#, 3
	note C#, 3
	note F#, 3
	note C#, 1
	note F#, 1
	note C#, 1
	note G#, 6
	note G#, 3
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	intensity $41
	note C_, 1
	note D#, 1
	intensity $a1
	note C_, 1
	intensity $51
	note D#, 1
	intensity $a1
	note C_, 1
	note D#, 1
	intensity $61
	note C_, 1
	note D#, 1
	intensity $a1
	octave 3
	note G#, 1
	intensity $71
	octave 4
	note D#, 1
	octave 3
	note G#, 1
	octave 4
	note D#, 1
	intensity $a1
	octave 3
	note G#, 1
	intensity $81
	octave 4
	note D#, 1
	octave 3
	note G#, 1
	intensity $91
	octave 4
	note G#, 1
	octave 3
	note G#, 1
	intensity $a1
	octave 4
	note G#, 1
	octave 3
	note G#, 1
	octave 4
	note G#, 1
	loopchannel 0, Music_Pinballcatchem_blue_branch_413aa
; 4158d

Music_Pinballcatchem_blue_branch_4158d: ; 4158d
	intensity $71
	dutycycle $2
	octave 2
	note A#, 2
	octave 3
	note F_, 1
	note A#, 2
	note F_, 1
	octave 2
	note A#, 2
	octave 3
	note F_, 1
	note A#, 2
	note F_, 1
	octave 2
	note A_, 2
	octave 3
	note F_, 1
	note A_, 2
	note F_, 1
	octave 2
	note A_, 2
	octave 3
	note F_, 1
	note A_, 2
	note F_, 1
	endchannel
; 415aa

Music_Pinballcatchem_blue_Ch2: ; 415aa
	vibrato $9, $34
	notetype $c, $b3
	note __, 16
Music_Pinballcatchem_blue_branch_415b1: ; 415b1
	notetype $8, $b2
	dutycycle $3
	callchannel Music_Pinballcatchem_blue_branch_418d2
	intensity $b2
	note G_, 2
	note __, 1
	intensity $b1
	octave 3
	note G_, 2
	note A#, 1
	octave 4
	note C#, 2
	note D#, 3
	intensity $b2
	note F_, 2
	note __, 1
	note F#, 3
	note __, 1
	intensity $b1
	note F_, 1
	note F#, 1
	note F_, 1
	note D#, 2
	note C_, 1
	callchannel Music_Pinballcatchem_blue_branch_418d2
	intensity $b2
	note A#, 2
	note __, 1
	intensity $b1
	octave 3
	note G_, 2
	note A#, 1
	octave 4
	note C#, 2
	note D#, 1
	note F_, 2
	note G_, 3
	intensity $b2
	note G#, 3
	note __, 3
	intensity $b1
	octave 3
	note A#, 1
	note A#, 2
	note A#, 1
	callchannel Music_Pinballcatchem_blue_branch_41900
	note A#, 3
	octave 4
	note C#, 3
	note C#, 2
	note C#, 3
	intensity $b4
	note C_, 7
	intensity $b1
	note F#, 2
	note G#, 3
	note C_, 1
	callchannel Music_Pinballcatchem_blue_branch_41900
	octave 4
	note F_, 3
	note F_, 3
	note D#, 2
	note C#, 4
	note C_, 2
	octave 3
	note B_, 1
	note A#, 2
	octave 4
	note F#, 3
	intensity $b3
	note G#, 4
	callchannel Music_Pinballcatchem_blue_branch_41900
	note A#, 3
	octave 4
	note C#, 3
	note C#, 2
	note C#, 3
	intensity $b4
	note C_, 7
	note __, 3
	intensity $b1
	octave 3
	note A#, 2
	note A#, 1
	intensity $b1
	octave 4
	note C#, 2
	octave 3
	note A#, 4
	octave 4
	note F_, 2
	intensity $91
	octave 3
	note A#, 1
	intensity $b2
	octave 4
	note D#, 2
	intensity $81
	octave 3
	note F_, 1
	intensity $b1
	octave 4
	note C#, 2
	intensity $b2
	octave 3
	note A#, 2
	note __, 5
	intensity $b1
	note A#, 2
	note A#, 1
	octave 4
	note C#, 3
	intensity $b3
	octave 3
	note A#, 3
	note __, 6
	intensity $b1
	octave 4
	note A#, 2
	octave 3
	note A#, 3
	note A#, 1
	octave 4
	note F_, 2
	intensity $b2
	note D#, 3
	note __, 1
	intensity $b1
	note F_, 2
	note G_, 1
	note F_, 2
	note G_, 1
	note F_, 2
	note G_, 1
	note F_, 2
	note G_, 1
	note F_, 3
	note __, 6
	intensity $91
	dutycycle $2
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	note G_, 1
	intensity $b2
	dutycycle $3
	octave 4
	note D_, 2
	intensity $91
	octave 3
	note G_, 1
	note A#, 2
	octave 4
	note D_, 1
	intensity $b1
	note D_, 2
	note D_, 1
	note D_, 2
	intensity $b2
	note D_, 2
	note __, 1
	intensity $91
	dutycycle $2
	note G_, 1
	note A#, 2
	octave 5
	note D_, 1
	intensity $b1
	dutycycle $3
	octave 3
	note A#, 2
	note A#, 1
	note A#, 2
	octave 4
	note D_, 1
	note C_, 3
	intensity $b2
	note F_, 3
	note __, 8
	intensity $91
	dutycycle $2
	octave 5
	note E_, 1
	note F_, 2
	octave 4
	note F_, 1
	octave 5
	note E_, 2
	note F_, 3
	octave 4
	note F_, 1
	intensity $b1
	dutycycle $3
	note D_, 2
	note D_, 1
	intensity $b2
	note D_, 3
	intensity $b1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	intensity $91
	dutycycle $2
	octave 5
	note D_, 2
	note D_, 1
	note D_, 3
	intensity $b1
	dutycycle $3
	octave 3
	note A#, 2
	note A#, 1
	note A#, 2
	octave 4
	note D_, 1
	intensity $b2
	note C_, 3
	intensity $91
	dutycycle $2
	octave 3
	note A_, 3
	note F_, 2
	note A_, 1
	octave 4
	note C_, 2
	note F_, 1
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 4
	note A_, 1
	note F_, 1
	note D#, 1
	intensity $b2
	dutycycle $3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	note __, 1
	octave 3
	note A#, 2
	note __, 1
	note G_, 2
	note __, 1
	note A#, 2
	intensity $b1
	octave 4
	note C_, 3
	note D_, 4
	intensity $b2
	octave 3
	note A#, 2
	note __, 1
	intensity $91
	dutycycle $2
	octave 4
	note A#, 2
	note A_, 2
	note G#, 1
	octave 3
	note A_, 1
	intensity $b2
	dutycycle $3
	note A#, 2
	note __, 1
	note A#, 2
	note __, 1
	note A#, 2
	intensity $b1
	octave 4
	note F_, 3
	intensity $b2
	note C#, 1
	note D_, 2
	intensity $91
	dutycycle $2
	octave 3
	note A#, 1
	octave 4
	note F_, 1
	note A#, 1
	octave 5
	note F_, 1
	note A#, 1
	note F_, 1
	octave 4
	note A#, 1
	intensity $b2
	dutycycle $3
	octave 3
	note A#, 2
	octave 4
	note D_, 1
	note D#, 2
	note D_, 2
	note __, 1
	note C#, 1
	note C_, 2
	note __, 1
	octave 3
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note A#, 2
	note __, 1
	octave 4
	note C_, 2
	note __, 1
	octave 3
	note A_, 2
	note A#, 1
	octave 4
	note C_, 2
	octave 3
	note B_, 1
	note A#, 2
	note __, 1
	note A_, 2
	note A#, 2
	note B_, 2
	octave 4
	note C_, 2
	note __, 4
	note D_, 2
	note __, 1
	note D#, 2
	note __, 1
	note F_, 2
	note A_, 1
	note A#, 2
	note __, 1
	intensity $b1
	note A#, 2
	octave 5
	note C_, 3
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	octave 4
	note A#, 2
	note A_, 3
	note G_, 3
	intensity $b2
	note F_, 2
	note __, 1
	intensity $b1
	note G_, 3
	note F_, 3
	note F_, 2
	note D_, 3
	intensity $b2
	octave 3
	note A#, 3
	intensity $91
	dutycycle $2
	octave 5
	note A_, 1
	note A#, 2
	octave 4
	note A#, 1
	intensity $b1
	dutycycle $3
	octave 3
	note A#, 2
	intensity $91
	dutycycle $2
	octave 5
	note A#, 1
	intensity $b1
	dutycycle $3
	octave 4
	note C_, 2
	intensity $91
	dutycycle $2
	octave 5
	note A#, 1
	intensity $b1
	dutycycle $3
	octave 4
	note D_, 3
	note D_, 3
	note D_, 2
	note D#, 3
	note F_, 2
	note __, 2
	note F_, 3
	note D#, 3
	note D_, 3
	intensity $b2
	note D_, 1
	intensity $91
	note D#, 1
	intensity $b1
	note C_, 2
	note __, 2
	intensity $91
	dutycycle $2
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note D#, 1
	note F_, 1
	note C_, 1
	note __, 2
	intensity $b3
	dutycycle $3
	octave 4
	note A#, 3
	intensity $91
	dutycycle $2
	octave 3
	note E_, 1
	intensity $b1
	note F_, 2
	intensity $b3
	dutycycle $3
	octave 5
	note C_, 4
	intensity $b2
	dutycycle $3
	note __, 2
	intensity $b2
	octave 4
	note A_, 1
	note A#, 2
	note __, 1
	intensity $b1
	note A#, 2
	octave 5
	note C_, 3
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	octave 4
	note A#, 2
	note A_, 2
	note A#, 1
	note G_, 3
	note F_, 3
	note G_, 2
	intensity $91
	note D_, 1
	intensity $b1
	note F_, 2
	intensity $91
	octave 3
	note A#, 1
	intensity $b1
	octave 4
	note F_, 2
	note D_, 3
	intensity $b2
	octave 3
	note A#, 3
	note __, 3
	intensity $91
	note A_, 1
	intensity $b1
	note A#, 2
	octave 4
	note D_, 2
	note C_, 2
	intensity $b2
	octave 3
	note A#, 2
	note __, 4
	octave 4
	note D_, 2
	note __, 4
	intensity $b1
	note C_, 2
	octave 3
	note F_, 3
	note F_, 1
	note F_, 2
	note F_, 1
	octave 4
	note F_, 2
	notetype $c, $a8
	note A#, 9
	intensity $a3
	note A#, 3
	notetype $8, $b3
	note __, 1
	note __, 5
	note A_, 1
	intensity $b3
	note A#, 6
	note __, 6
	intensity $b1
	note G#, 2
	octave 3
	note G#, 3
	note G#, 1
	octave 4
	note G#, 2
	note G#, 1
	note A#, 2
	note G_, 1
	intensity $b3
	note G#, 6
	intensity $91
	dutycycle $2
	note C_, 2
	note D#, 2
	note C_, 2
	octave 5
	note C_, 1
	octave 4
	note G#, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	note D#, 1
	note C_, 1
	octave 2
	note G#, 1
	note D#, 1
	intensity $b1
	dutycycle $3
	octave 4
	note G#, 1
	note __, 1
	note A_, 1
	intensity $b2
	note A#, 2
	note __, 1
	intensity $b1
	note A#, 3
	note A#, 3
	note A#, 3
	note C_, 2
	intensity $b4
	note G#, 3
	intensity $b1
	note C_, 1
	note C_, 2
	intensity $b4
	note A#, 3
	intensity $b1
	note G_, 1
	intensity $b6
	note G#, 12
	intensity $91
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 4
	intensity $b1
	octave 4
	note G_, 1
	note G#, 3
	note A#, 3
	note G#, 3
	note A#, 2
	intensity $b2
	note G_, 1
	note G#, 3
	intensity $91
	dutycycle $2
	octave 5
	note G#, 1
	note D#, 1
	note C_, 1
	octave 4
	note G#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note F_, 1
	intensity $b1
	dutycycle $3
	note F#, 1
	note G_, 3
	note G#, 3
	note G#, 3
	note F_, 2
	note G_, 1
	intensity $b2
	note G#, 3
	intensity $91
	dutycycle $2
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	intensity $b1
	dutycycle $3
	note G#, 3
	intensity $b1
	dutycycle $3
	note A#, 3
	note G#, 3
	note A#, 3
	note G#, 1
	note A#, 1
	note G#, 1
	intensity $91
	dutycycle $2
	note D#, 1
	note C_, 1
	note D#, 1
	note G#, 1
	note D#, 1
	intensity $92
	dutycycle $3
	octave 5
	note C_, 1
	intensity $b2
	note C#, 2
	note __, 1
	notetype $c, $b8
	note C_, 2
	intensity $b8
	note C_, 12
	intensity $b4
	note C_, 4
	loopchannel 0, Music_Pinballcatchem_blue_branch_415b1
; 418d2

Music_Pinballcatchem_blue_branch_418d2: ; 418d2
	intensity $b2
	octave 4
	note A#, 2
	note __, 1
	octave 3
	note A#, 2
	notetype $8, $91
	note F_, 1
	notetype $8, $b1
	octave 4
	note C#, 2
	note D#, 1
	notetype $8, $91
	octave 3
	note F_, 2
	notetype $8, $b2
	octave 4
	note F_, 2
	note __, 1
	notetype $8, $91
	note D#, 1
	notetype $8, $b2
	note G#, 3
	notetype $8, $91
	octave 3
	note A#, 2
	octave 4
	note C#, 1
	note F_, 2
	note G#, 1
	endchannel
; 41900

Music_Pinballcatchem_blue_branch_41900: ; 41900
	intensity $b1
	octave 4
	note C#, 2
	octave 3
	note A#, 1
	octave 4
	note C#, 2
	octave 3
	note A#, 1
	notetype $8, $a1
	octave 4
	note C#, 2
	octave 3
	note A#, 1
	octave 4
	note C#, 2
	octave 3
	note A#, 1
	notetype $8, $91
	octave 4
	note C#, 2
	octave 3
	note A#, 1
	octave 4
	note C#, 2
	octave 3
	note A#, 1
	notetype $8, $81
	octave 4
	note C#, 2
	notetype $8, $91
	octave 3
	note A#, 1
	notetype $8, $a1
	note A#, 2
	notetype $8, $b1
	note A#, 1
	endchannel
; 41933

Music_Pinballcatchem_blue_Ch3: ; 41933
	notetype $c, $b3
	note __, 16
Music_Pinballcatchem_blue_branch_41937: ; 41937
	notetype $8, $22
	octave 1
	note A#, 2
	note __, 6
	note A#, 1
	note __, 2
	note G#, 2
	note __, 4
	note G#, 1
	note __, 2
	note G#, 1
	note __, 2
	note F#, 1
	note G_, 2
	note __, 12
	note F#, 3
	note __, 1
	note G#, 2
	note __, 3
	note A_, 1
	note A#, 2
	note __, 3
	note A#, 1
	octave 2
	note A#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 2
	note G#, 2
	note __, 4
	note G#, 1
	octave 2
	note G#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 2
	note F#, 1
	note G_, 2
	note __, 3
	note G_, 1
	octave 2
	note G_, 1
	note __, 1
	octave 1
	note G_, 1
	note __, 2
	note G_, 1
	note __, 2
	note F_, 3
	note __, 6
	note A_, 1
	callchannel Music_Pinballcatchem_blue_branch_41b46
	note F#, 2
	octave 2
	note F#, 1
	note __, 2
	octave 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 2
	note __, 1
	octave 2
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F#, 2
	note __, 1
	note F_, 2
	note A_, 1
	callchannel Music_Pinballcatchem_blue_branch_41b5b
	callchannel Music_Pinballcatchem_blue_branch_41b46
	octave 2
	note F#, 1
	note C#, 1
	octave 1
	note A#, 1
	note F#, 1
	note __, 2
	note F#, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 2
	octave 1
	note F#, 1
	note F_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 2
	octave 1
	note F_, 1
	note F_, 1
	note __, 1
	octave 2
	note F_, 3
	note A_, 1
	callchannel Music_Pinballcatchem_blue_branch_41b5b
	octave 1
	note A#, 2
	note __, 3
	note A#, 1
	octave 2
	note F_, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 2
	note A#, 1
	octave 2
	note A#, 3
	note __, 8
	intensity $32
	octave 1
	note D_, 1
Music_Pinballcatchem_blue_branch_419ba: ; 419ba
	intensity $22
	note D#, 2
	note __, 3
	note D#, 1
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 2
	note A#, 1
	note __, 1
	note A_, 1
	note A#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 2
	octave 1
	note A#, 1
	note __, 2
	note G_, 1
	note F_, 2
	note __, 3
	note F_, 1
	note A_, 1
	note __, 1
	note G#, 1
	note A_, 1
	note __, 2
	octave 2
	note C_, 1
	note __, 1
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note __, 1
	note F_, 1
	note __, 2
	note C_, 1
	note __, 2
	octave 1
	note A_, 1
	loopchannel 2, Music_Pinballcatchem_blue_branch_419ba
	note G_, 2
	octave 2
	note D_, 1
	note G_, 1
	note __, 2
	octave 1
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 2
	octave 1
	note F_, 1
	note F#, 2
	note F#, 1
	octave 2
	note F#, 1
	note __, 2
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 1
	note F_, 2
	octave 2
	note D_, 1
	note F_, 1
	note __, 2
	octave 1
	note F_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 2
	octave 1
	note A#, 1
	note E_, 2
	note A#, 1
	octave 2
	note D_, 1
	note __, 1
	note G_, 1
	note D_, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 2
	note B_, 1
	octave 2
	note C_, 2
	note __, 1
	note C_, 2
	note __, 1
	note D_, 2
	note __, 1
	note D_, 2
	note __, 1
	note D#, 2
	note __, 1
	note D#, 2
	note __, 1
	note E_, 2
	note __, 1
	note E_, 2
	note __, 1
	note F_, 2
	octave 3
	note D#, 1
	note __, 2
	octave 2
	note F_, 1
	note F_, 1
	note __, 1
	octave 3
	note D#, 2
	note C_, 2
	octave 2
	note A_, 2
	note __, 9
	octave 1
	note A_, 1
	callchannel Music_Pinballcatchem_blue_branch_41b7e
	note G#, 2
	note __, 1
	note F_, 2
	note __, 1
	note D_, 2
	note __, 1
	octave 1
	note A#, 2
	note F#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 2
	note A#, 1
	octave 2
	note D#, 2
	note __, 1
	note G_, 2
	note __, 1
	octave 3
	note D#, 1
	note D_, 1
	octave 2
	note A#, 1
	note G_, 2
	note __, 1
	note D#, 2
	note A#, 1
	note __, 2
	note D#, 1
	note E_, 2
	note __, 1
	note E_, 2
	note __, 1
	note G_, 2
	note __, 1
	note A#, 2
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F_, 1
	note __, 2
	note A#, 1
	note F_, 1
	note __, 1
	note F_, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 2
	note E_, 3
	note __, 3
	note F_, 3
	octave 1
	note A_, 1
	callchannel Music_Pinballcatchem_blue_branch_41b7e
	note G#, 2
	note __, 1
	note F_, 2
	note __, 1
	note D_, 2
	note __, 1
	octave 1
	note A#, 2
	note G_, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 2
	octave 2
	note C_, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F#, 2
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note F_, 2
	octave 1
	note F_, 1
	note __, 2
	note F_, 1
	note F_, 1
	note __, 1
	octave 2
	note C_, 1
	note D#, 1
	note __, 1
	note D_, 1
	intensity $32
	octave 3
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	intensity $22
	note D_, 1
	note F_, 1
	note A#, 1
	octave 4
	note D_, 1
	note F_, 1
	note __, 1
	octave 1
	note F#, 1
	note __, 1
	note F#, 1
	note A#, 2
	note __, 1
	octave 2
	note C#, 2
	note __, 1
	note F_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F#, 2
	note __, 1
	note F_, 2
	note __, 1
	note D#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 2
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note A#, 1
	note __, 1
	note G#, 1
	note G#, 2
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 6
	note F#, 1
	note __, 1
	note F#, 1
	note A#, 2
	note __, 1
	octave 2
	note C#, 2
	note __, 1
	note F_, 2
	note __, 3
	intensity $32
	octave 3
	note C_, 3
	note __, 3
	note C#, 3
	note __, 1
	intensity $22
	octave 2
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 2
	note __, 1
	note E_, 2
	note __, 1
	note D#, 2
	note __, 1
	note D_, 2
	note __, 1
	note C#, 2
	note __, 1
	note C_, 2
	note __, 1
	note D#, 2
	note __, 1
	octave 1
	note F#, 1
	note __, 2
	note F#, 1
	note __, 2
	note A#, 1
	note __, 1
	octave 2
	note C_, 1
	note C#, 3
	note __, 12
	octave 1
	note G#, 1
	note __, 2
	note G#, 1
	note __, 2
	octave 2
	note C_, 1
	note __, 1
	note D_, 1
	note D#, 3
	note __, 9
	octave 1
	note G_, 3
	note F#, 2
	octave 2
	note F#, 1
	note F_, 2
	note __, 1
	note E_, 2
	note __, 1
	note D#, 2
	note __, 1
	note D_, 2
	note __, 1
	note C#, 2
	note __, 1
	note G#, 2
	note __, 1
	notetype $c, $22
	octave 3
	note D#, 2
	note D#, 16
	loopchannel 0, Music_Pinballcatchem_blue_branch_41937
; 41b46

Music_Pinballcatchem_blue_branch_41b46: ; 41b46
	note A#, 2
	note __, 1
	octave 2
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	octave 1
	note A#, 2
	note __, 1
	note G#, 2
	note __, 1
	octave 2
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	octave 1
	note G#, 2
	note __, 1
	endchannel
; 41b5b

Music_Pinballcatchem_blue_branch_41b5b: ; 41b5b
	note A#, 2
	note __, 1
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F#, 2
	note __, 1
	note F_, 2
	note __, 1
	note E_, 2
	note __, 1
	note F_, 2
	note __, 1
	octave 1
	note F#, 2
	note __, 1
	note F#, 2
	note __, 1
	note G_, 2
	note __, 1
	note G_, 2
	note __, 1
	octave 2
	note G#, 2
	note __, 1
	note G_, 2
	octave 3
	note D#, 1
	note __, 2
	octave 2
	note F_, 4
	endchannel
; 41b7e

Music_Pinballcatchem_blue_branch_41b7e: ; 41b7e
	note A#, 2
	note __, 3
	note A#, 1
	octave 2
	note F_, 1
	note __, 1
	note D_, 1
	note __, 2
	octave 1
	note A#, 1
	note A_, 1
	note __, 1
	note A_, 1
	octave 2
	note D_, 2
	note __, 1
	note F_, 1
	note __, 2
	note A_, 2
	note G_, 1
	endchannel
; 41b93

Music_Pinballcatchem_blue_Ch4: ; 41b93
	togglenoise $0
	notetype $8
	note D#, 3
	note D_, 3
	note D#, 2
	note D_, 1
	note F#, 2
	note G_, 1
	note D_, 3
	note D_, 3
	note C#, 2
	note C#, 1
	note D_, 2
	note D_, 1
Music_Pinballcatchem_blue_branch_41ba3: ; 41ba3
	note D_, 3
	note D#, 2
	note D#, 1
	note D#, 2
	note D#, 3
	note C#, 1
	note D_, 3
	note D_, 3
	note D#, 2
	note D_, 1
	note D#, 2
	note D_, 1
	note D#, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 2
	note G_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 3
	note G_, 2
	note D#, 1
	note D_, 5
	note D_, 3
	note G_, 1
	note F#, 3
	note D_, 2
	note G_, 1
	note F#, 2
	note D_, 1
	note G_, 2
	note G_, 1
	note F#, 2
	note D#, 1
	note D_, 2
	note G_, 1
	note F#, 2
	note G_, 1
	note D#, 2
	note D_, 1
	note C_, 5
	note D_, 1
	note D_, 2
	note D#, 1
	callchannel Music_Pinballcatchem_blue_branch_41cfe
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note F#, 3
	callchannel Music_Pinballcatchem_blue_branch_41cfe
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D_, 1
	note D#, 2
	note D#, 1
	callchannel Music_Pinballcatchem_blue_branch_41cfe
	note D_, 1
	note C#, 1
	note C#, 1
	note D_, 3
	note D_, 2
	note D#, 1
	note F#, 3
	callchannel Music_Pinballcatchem_blue_branch_41cfe
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D#, 2
	note C_, 1
	note D_, 2
	note D_, 1
	note D_, 2
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
	callchannel Music_Pinballcatchem_blue_branch_41cfe
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note D_, 1
	note D_, 2
	note D#, 1
	callchannel Music_Pinballcatchem_blue_branch_41cfe
	note D_, 1
	note C#, 1
	note C#, 1
	note D_, 3
	note D_, 2
	note D#, 1
	note F#, 3
	callchannel Music_Pinballcatchem_blue_branch_41cfe
	note D_, 2
	note D#, 3
	note D#, 1
	note D#, 2
	note B_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D#, 3
	note D_, 1
	note D_, 2
	note D_, 3
	note D_, 1
	note B_, 12
	callchannel Music_Pinballcatchem_blue_branch_41d05
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D#, 3
	note D_, 2
	note D_, 1
	note D_, 3
	note D_, 2
	note D_, 1
	callchannel Music_Pinballcatchem_blue_branch_41d05
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 2
	note D_, 1
	note G_, 2
	note G_, 1
	note D#, 3
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 3
	note D_, 2
	note D_, 1
	callchannel Music_Pinballcatchem_blue_branch_41d12
	note D_, 2
	note D_, 2
	note D_, 2
	callchannel Music_Pinballcatchem_blue_branch_41d12
	note G_, 2
	note G_, 1
	note F#, 3
Music_Pinballcatchem_blue_branch_41c5e: ; 41c5e
	note G_, 2
	note G_, 1
	note F#, 3
	loopchannel 4, Music_Pinballcatchem_blue_branch_41c5e
	note G_, 2
	note G_, 1
	note F#, 3
	note D_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note C_, 6
	callchannel Music_Pinballcatchem_blue_branch_41d1c
	note D#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note D#, 1
	callchannel Music_Pinballcatchem_blue_branch_41d1c
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 2
	note D_, 3
	note D#, 1
	note D#, 3
	note D#, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note G_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note G_, 2
	note D#, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note D_, 3
	note D_, 2
	note D_, 1
	note D#, 2
	note D_, 3
	note D#, 1
	note D#, 2
	note D_, 2
	note D_, 2
	callchannel Music_Pinballcatchem_blue_branch_41d23
	note D_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	callchannel Music_Pinballcatchem_blue_branch_41d23
	note D_, 2
	note G_, 1
	note D_, 2
	note D_, 1
	callchannel Music_Pinballcatchem_blue_branch_41d23
	note D_, 2
	note G_, 1
	note F#, 3
	note F#, 3
	note G_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note F#, 3
	note D#, 3
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 3
	note D_, 2
	note D_, 1
Music_Pinballcatchem_blue_branch_41cba: ; 41cba
	callchannel Music_Pinballcatchem_blue_branch_41d30
	loopchannel 4, Music_Pinballcatchem_blue_branch_41cba
	callchannel Music_Pinballcatchem_blue_branch_41d30
	note D#, 2
	note D_, 3
	note D_, 1
	note D#, 2
	note D_, 3
	note D_, 1
	callchannel Music_Pinballcatchem_blue_branch_41d30
	callchannel Music_Pinballcatchem_blue_branch_41d30
	callchannel Music_Pinballcatchem_blue_branch_41d30
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 3
	note D_, 3
	note D#, 2
	note D_, 1
	callchannel Music_Pinballcatchem_blue_branch_41d30
	note D#, 2
	note D_, 1
	note D#, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D#, 2
	note D_, 1
	callchannel Music_Pinballcatchem_blue_branch_41d30
	callchannel Music_Pinballcatchem_blue_branch_41d30
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 2
	note D_, 1
	note D#, 2
	note C#, 1
	note D_, 3
	note D_, 3
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 2
	note D_, 1
	loopchannel 0, Music_Pinballcatchem_blue_branch_41ba3
; 41cfe

Music_Pinballcatchem_blue_branch_41cfe: ; 41cfe
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	endchannel
; 41d05

Music_Pinballcatchem_blue_branch_41d05: ; 41d05
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
	note D#, 1
	endchannel
; 41d12

Music_Pinballcatchem_blue_branch_41d12: ; 41d12
	note D#, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note D_, 1
	note D#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	endchannel
; 41d1c

Music_Pinballcatchem_blue_branch_41d1c: ; 41d1c
	note D#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	endchannel
; 41d23

Music_Pinballcatchem_blue_branch_41d23: ; 41d23
	note D#, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note D#, 2
	note G_, 1
	note D#, 2
	note G_, 1
	endchannel
; 41d30

Music_Pinballcatchem_blue_branch_41d30: ; 41d30
	note F#, 3
	note G_, 2
	note G_, 1
	note F#, 3
	note G_, 2
	note G_, 1
	endchannel
; 41d37


