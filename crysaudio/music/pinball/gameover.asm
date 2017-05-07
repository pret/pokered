Music_Pinballgameover: ; 4231d
	dbw $c0, Music_Pinballgameover_Ch1
	dbw $01, Music_Pinballgameover_Ch2
	dbw $02, Music_Pinballgameover_Ch3
	dbw $03, Music_Pinballgameover_Ch4
; 42329

Music_Pinballgameover_Ch1: ; 42329
	tempo 152
	volume $77
	dutycycle $3
	vibrato $18, $34
	notetype $8, $91
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	note E_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	octave 5
	note C_, 2
	intensity $98
	octave 3
	note G_, 4
	intensity $71
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	intensity $98
	note A_, 6
	intensity $71
	note C_, 2
	intensity $98
	note F_, 4
	intensity $71
	note C_, 2
	notetype $c, $98
	note E_, 16
	intensity $78
	note B_, 8
	vibrato $0, $34
	intensity $77
	note B_, 8
	note __, 2
	endchannel
; 4236b

Music_Pinballgameover_Ch2: ; 4236b
	dutycycle $1
	vibrato $20, $34
	notetype $8, $a8
	octave 5
	note E_, 4
	octave 4
	note F_, 1
	intensity $28
	note F_, 1
	intensity $a8
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	octave 5
	note C_, 1
	intensity $28
	note C_, 1
	intensity $a8
	note G_, 6
	note F_, 1
	intensity $28
	note F_, 1
	intensity $a8
	note D#, 4
	note F_, 1
	intensity $28
	note F_, 1
	intensity $a8
	note D_, 4
	octave 4
	note D#, 1
	intensity $28
	note D#, 1
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note A#, 1
	intensity $28
	note A#, 1
	intensity $a8
	octave 5
	note C_, 6
	octave 4
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	octave 5
	note C_, 4
	octave 4
	note C#, 1
	intensity $28
	note C#, 1
	notetype $c, $a8
	note B_, 16
	intensity $88
	octave 5
	note D_, 8
	vibrato $0, $34
	intensity $87
	octave 5
	note D_, 8
	note __, 2
	endchannel
; 423cc

Music_Pinballgameover_Ch3: ; 423cc
	notetype $8, $22
	octave 2
	note F_, 4
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note G#, 6
	octave 3
	note D#, 1
	note __, 1
	note C_, 4
	note D#, 1
	note __, 1
	octave 2
	note D#, 4
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 6
	note A_, 1
	note __, 1
	note G#, 4
	note F_, 1
	note __, 1
	notetype $c, $22
	note C_, 16
	note C_, 8
	note C_, 8
	note __, 2
	endchannel
; 423f8

Music_Pinballgameover_Ch4: ; 423f8
	togglenoise $0
	notetype $8
	note D_, 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C#, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 6
	note F#, 6
	note F#, 2
	notetype $c
	note B_, 16
	note __, 16
	note __, 2
	endchannel
; 42413


