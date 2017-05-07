Music_MagnetTrain: ; ef5f0
	dbw $c0, Music_MagnetTrain_Ch1
	dbw $01, Music_MagnetTrain_Ch2
	dbw $02, Music_MagnetTrain_Ch3
	dbw $03, Music_MagnetTrain_Ch4
; ef5fc

Music_MagnetTrain_Ch1: ; ef5fc
	ftempo 110
	volume $77
	stereopanning $f
	vibrato $14, $23
	dutycycle $2
	notetype $c, $b2
	note __, 16
	note __, 16
	intensity $b7
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	notetype $6, $b7
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $c, $b7
	note D_, 16
	endchannel
; ef648

Music_MagnetTrain_Ch2: ; ef648
	vibrato $14, $23
	dutycycle $1
	notetype $c, $d2
	stereopanning $f0
	notetype $c, $d8
	octave 1
	note F_, 12
	note __, 2
	notetype $6, $d7
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	dutycycle $3
	notetype $c, $d7
	octave 4
	note G_, 16
	note A_, 13
	note __, 1
	notetype $6, $d7
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype $c, $d7
	note A_, 16
	endchannel
; ef67d

Music_MagnetTrain_Ch3: ; ef67d
	stereopanning $ff
	vibrato $10, $23
	notetype $c, $15
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	note D#, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D#, 1
	note G_, 1
	note C_, 1
	note D#, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note G_, 1
	note C_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 16
	endchannel
; ef6f4

Music_MagnetTrain_Ch4: ; ef6f4
	togglenoise $3
	notetype $c
	note B_, 12
	note D_, 2
	note A#, 1
	note A#, 1
	notetype $6
	note D#, 4
	note F#, 4
	note D#, 4
	note F#, 4
	note A#, 4
	note F#, 4
	note A#, 4
	note D_, 2
	note D_, 2
	callchannel Music_MagnetTrain_branch_ef71e
	callchannel Music_MagnetTrain_branch_ef71e
	notetype $c
	note B_, 16
	endchannel
; ef711




Music_MagnetTrain_branch_ef71e: ; ef71e
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	endchannel
; ef72f


