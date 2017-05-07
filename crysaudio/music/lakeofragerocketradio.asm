Music_LakeOfRageRocketRadio: ; ef5b1
	dbw $80, Music_LakeOfRageRocketRadio_Ch1
	dbw $01, Music_LakeOfRageRocketRadio_Ch2
	dbw $02, Music_LakeOfRageRocketRadio_Ch3
; ef5ba

Music_LakeOfRageRocketRadio_Ch1: ; ef5ba
	tempo 160
	volume $77
	dutycycle $1
	tone $1118
	vibrato $0, $f0
	stereopanning $f0
Music_LakeOfRageRocketRadio_branch_ef5c9: ; ef5c9
	notetype $c, $a7
	octave 7
	note G_, 4
	note F#, 4
	note G_, 4
	note F#, 4
	note __, 16
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9
; ef5d6

Music_LakeOfRageRocketRadio_Ch2: ; ef5d6
	dutycycle $1
	vibrato $13, $e8
	notetype $c, $a7
	note __, 2
	stereopanning $f
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9
; ef5e5

Music_LakeOfRageRocketRadio_Ch3: ; ef5e5
	notetype $c, $26
	vibrato $10, $44
	note __, 4
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9
; ef5f0


