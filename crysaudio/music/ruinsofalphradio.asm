Music_RuinsOfAlphRadio: ; eedcb
	dbw $80, Music_RuinsOfAlphRadio_Ch1
	dbw $01, Music_RuinsOfAlphRadio_Ch2
	dbw $02, Music_RuinsOfAlphRadio_Ch3
; eedd4

Music_RuinsOfAlphRadio_Ch1: ; eedd4
	tempo 160
	volume $77
	dutycycle $0
	tone $0118
	vibrato $0, $f0
	stereopanning $f0
Music_RuinsOfAlphRadio_branch_eede3: ; eede3
	notetype $6, $71
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a1
	note __, 16
	note __, 16
	callchannel Music_RuinsOfAlphRadio_branch_eee08
	notetype $c, $a1
	note __, 16
	note __, 16
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a1
	note __, 16
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eede3
; eee01

Music_RuinsOfAlphRadio_branch_eee01: ; eee01
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note C_, 8
	endchannel
; eee08

Music_RuinsOfAlphRadio_branch_eee08: ; eee08
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note C_, 4
	note G_, 1
	octave 5
	note C_, 8
	endchannel
; eee12

Music_RuinsOfAlphRadio_Ch2: ; eee12
	dutycycle $1
	vibrato $1, $e0
Music_RuinsOfAlphRadio_branch_eee17: ; eee17
	stereopanning $f
	notetype $6, $81
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a1
	note __, 16
	note __, 16
	notetype $6, $81
	callchannel Music_RuinsOfAlphRadio_branch_eee08
	notetype $c, $a1
	note __, 16
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eee17
; eee32

Music_RuinsOfAlphRadio_Ch3: ; eee32
	notetype $6, $26
Music_RuinsOfAlphRadio_branch_eee35: ; eee35
	octave 2
	note C_, 1
	note C#, 1
	note C_, 1
	note __, 16
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eee35
; eee3e


