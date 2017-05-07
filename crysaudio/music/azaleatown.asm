Music_AzaleaTown: ; f57e8
	dbw $c0, Music_AzaleaTown_Ch1
	dbw $01, Music_AzaleaTown_Ch2
	dbw $02, Music_AzaleaTown_Ch3
	dbw $03, Music_AzaleaTown_Ch4
; f57f4

Music_AzaleaTown_Ch1: ; f57f4
	tempo 160
	volume $77
	dutycycle $2
	stereopanning $f
	notetype $c, $a1
	note __, 2
Music_AzaleaTown_branch_f5801: ; f5801
	intensity $a1
	octave 3
	note F_, 2
	intensity $61
	note F_, 2
	note F_, 2
	intensity $a1
	note F_, 2
	intensity $61
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	loopchannel 2, Music_AzaleaTown_branch_f5801
Music_AzaleaTown_branch_f5816: ; f5816
	callchannel Music_AzaleaTown_branch_f588c
	stereopanning $f0
	intensity $a4
	note G#, 2
	note A#, 1
	note __, 3
	octave 4
	note C_, 4
	notetype $6, $a4
	note G_, 1
	note G#, 3
	note F#, 4
	note D#, 2
	note __, 2
	stereopanning $f
	callchannel Music_AzaleaTown_branch_f588c
	stereopanning $f0
	notetype $6, $a4
	note D#, 4
	note C_, 4
	note __, 3
	note B_, 1
	octave 4
	note C_, 12
	octave 3
	note A#, 4
	note F#, 4
	stereopanning $f
	callchannel Music_AzaleaTown_branch_f5912
	intensity $a3
	note A#, 4
	octave 4
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	intensity $a1
	octave 3
	note C#, 4
	note A_, 2
	note __, 14
	callchannel Music_AzaleaTown_branch_f5912
	intensity $a3
	octave 4
	note C_, 1
	note C#, 3
	note F_, 2
	note __, 2
	note C#, 2
	note __, 2
	intensity $a1
	octave 3
	note G_, 4
	note A#, 4
	note G_, 8
	intensity $a2
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note F#, 4
	note C#, 8
	note F#, 4
	note __, 4
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	note G_, 4
	note C#, 4
	note __, 4
	note G_, 4
	note __, 4
	octave 4
	note C#, 4
	note D#, 4
	note C#, 4
	octave 3
	note G#, 4
	note D#, 4
	note C#, 4
	octave 2
	note G#, 4
	note __, 8
	notetype $c, $2f
	octave 3
	note G#, 14
	note __, 2
	loopchannel 0, Music_AzaleaTown_branch_f5816
; f588c

Music_AzaleaTown_branch_f588c: ; f588c
	notetype $c, $a1
	octave 4
	note F_, 2
	intensity $61
	note F_, 2
	note F_, 2
	intensity $a1
	note D#, 2
	intensity $61
	note D#, 2
	note D#, 2
	intensity $a1
	note F_, 2
	intensity $61
	note F_, 2
	intensity $a1
	note A#, 2
	intensity $61
	note A#, 2
	note A#, 2
	intensity $a1
	note G#, 2
	intensity $61
	note G#, 2
	note G#, 2
	intensity $a1
	note A_, 2
	intensity $61
	note A_, 2
	intensity $a1
	note C_, 2
	intensity $61
	note C_, 2
	note C_, 2
	intensity $a1
	note C#, 2
	intensity $61
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	intensity $a1
	note D#, 2
	intensity $61
	note D#, 2
	note D#, 2
	intensity $a1
	note C#, 2
	intensity $61
	note C#, 2
	note C#, 2
	note C#, 2
	note __, 2
	intensity $a1
	octave 3
	note F_, 2
	intensity $61
	note F_, 2
	note F_, 2
	intensity $a1
	note F#, 2
	intensity $61
	note F#, 2
	note F#, 2
	note F#, 2
	note F#, 2
	intensity $a1
	note F_, 2
	intensity $61
	note F_, 2
	note F_, 2
	intensity $a1
	note D#, 2
	intensity $61
	note D#, 2
	note D#, 2
	intensity $a1
	note C#, 2
	intensity $61
	note C#, 2
	intensity $a1
	note C_, 2
	intensity $61
	note C_, 2
	note C_, 2
	intensity $a1
	octave 2
	note A#, 2
	intensity $61
	note A#, 2
	note A#, 2
	intensity $a1
	octave 3
	note C#, 2
	intensity $61
	note C#, 2
	endchannel
; f5912

Music_AzaleaTown_branch_f5912: ; f5912
	intensity $61
	note G#, 8
	note G#, 8
	intensity $81
	note A_, 8
	intensity $a1
	note A_, 8
	endchannel
; f591d

Music_AzaleaTown_Ch2: ; f591d
	vibrato $12, $23
	dutycycle $2
	stereopanning $f0
	notetype $c, $62
	note __, 1
	octave 4
	note D_, 1
	intensity $b1
	note D#, 2
	intensity $71
	note D#, 2
	note D#, 2
	intensity $b1
	note C#, 2
	intensity $71
	note C#, 2
	note C#, 2
	intensity $51
	note C#, 2
	note C#, 2
	intensity $b1
	note C_, 2
	intensity $71
	note C_, 2
	note C_, 2
	intensity $b1
	note C#, 2
	intensity $71
	note C#, 2
	note C#, 2
	notetype $6, $b4
	note F_, 7
	dutycycle $1
	octave 5
	note C_, 1
Music_AzaleaTown_branch_f5952: ; f5952
	callchannel Music_AzaleaTown_branch_f59c7
	note C#, 4
	note C_, 2
	note C#, 1
	note __, 3
	notetype $6, $b4
	note D#, 11
	note __, 8
	dutycycle $1
	octave 5
	note C_, 1
	callchannel Music_AzaleaTown_branch_f59c7
	note __, 2
	note C#, 2
	note C_, 2
	octave 3
	note G#, 2
	notetype $6, $b4
	note __, 3
	octave 4
	note G_, 1
	note G#, 12
	note F#, 4
	note F_, 4
	dutycycle $0
	note D_, 1
	note D#, 3
	note C#, 4
	note C_, 2
	note __, 2
	note G#, 4
	note __, 4
	note F#, 4
	note __, 4
	note F_, 4
	note D#, 4
	note F_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C#, 8
	note __, 12
	note D_, 1
	note D#, 3
	note C#, 4
	note C_, 2
	note __, 2
	note G#, 4
	note __, 4
	note A_, 4
	note __, 4
	octave 5
	note C_, 4
	octave 4
	note B_, 1
	octave 5
	note C_, 3
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 4
	note F_, 4
	note __, 4
	note D#, 4
	note __, 4
	note C#, 4
	dutycycle $2
	note F_, 4
	note D#, 4
	note C#, 4
	note F_, 4
	note __, 4
	note D#, 4
	note __, 4
	note C#, 4
	note F_, 4
	note D#, 4
	note C#, 4
	note F_, 4
	note __, 4
	note A#, 4
	note __, 4
	octave 5
	note C_, 4
	notetype $c, $b7
	octave 4
	note G#, 12
	note D#, 4
	intensity $1f
	note C_, 14
	notetype $6, $b4
	dutycycle $1
	note G#, 2
	octave 5
	note C_, 2
	loopchannel 0, Music_AzaleaTown_branch_f5952
; f59c7

Music_AzaleaTown_branch_f59c7: ; f59c7
	note C#, 4
	octave 4
	note G#, 2
	note __, 2
	octave 5
	note C_, 2
	note __, 2
	note C#, 8
	note D#, 8
	note F_, 2
	note __, 1
	note G_, 1
	note G#, 12
	note F_, 2
	note __, 6
	note D#, 8
	note F_, 2
	note __, 1
	note C_, 1
	notetype $c, $a8
	vibrato $0, $0
	note C#, 8
	intensity $a7
	vibrato $12, $23
	note C#, 16
	note __, 4
	intensity $b4
	dutycycle $2
	octave 3
	note A#, 2
	octave 4
	note C#, 1
	note __, 1
	note F#, 8
	note __, 2
	note F#, 2
	note F_, 2
	note D#, 1
	note __, 1
	note C#, 6
	note C_, 2
	note __, 2
	note C_, 4
	note C#, 1
	notetype $6, $b4
	note __, 1
	note D_, 1
	notetype $c, $b7
	note D#, 12
	intensity $b4
	endchannel
; f5a08

Music_AzaleaTown_Ch3: ; f5a08
	stereopanning $ff
	vibrato $6, $26
	notetype $c, $25
	octave 2
	note G#, 1
	octave 3
	note C_, 1
	note C#, 1
	note __, 5
	note C#, 1
	note __, 3
	note C#, 1
	note __, 1
	octave 2
	note G#, 4
	octave 3
	note C#, 1
	note __, 5
	note C#, 1
	note __, 3
	note C#, 1
	note __, 1
	note G#, 4
Music_AzaleaTown_branch_f5a24: ; f5a24
	callchannel Music_AzaleaTown_branch_f5a86
	note G#, 4
	note D#, 2
	callchannel Music_AzaleaTown_branch_f5a86
	note G#, 2
	note __, 2
	note F#, 2
	callchannel Music_AzaleaTown_branch_f5acf
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note F_, 2
	octave 3
	note A_, 4
	octave 4
	note C#, 1
	note __, 3
	note F_, 1
	note __, 1
	callchannel Music_AzaleaTown_branch_f5acf
	octave 2
	note A#, 2
	octave 3
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 1
	note __, 3
	note G_, 2
	octave 2
	note F#, 1
	note __, 5
	note F#, 1
	note F#, 1
	note F#, 1
	note __, 1
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note F_, 1
	note F#, 1
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note F#, 1
	note G_, 1
	note G#, 1
	note __, 5
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note F#, 1
	note G_, 1
	note G#, 1
	note __, 5
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	loopchannel 0, Music_AzaleaTown_branch_f5a24
; f5a86

Music_AzaleaTown_branch_f5a86: ; f5a86
	note C#, 1
	note __, 5
	note C#, 1
	note __, 3
	note C#, 1
	note __, 1
	octave 2
	note G#, 4
	octave 3
	note F_, 1
	note __, 5
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 4
	note A_, 2
	intensity $15
	note A#, 1
	note __, 1
	intensity $25
	octave 4
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note A_, 4
	octave 4
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note G#, 4
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 6
	note __, 4
	note F#, 1
	note __, 5
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note C#, 4
	note G_, 1
	note __, 5
	note G_, 1
	note __, 3
	note C#, 4
	note G_, 1
	note __, 1
	note G#, 1
	note __, 5
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 5
	note G#, 1
	note __, 1
	note C_, 1
	note __, 1
	endchannel
; f5acf

Music_AzaleaTown_branch_f5acf: ; f5acf
	intensity $35
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	intensity $25
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	endchannel
; f5ae5

Music_AzaleaTown_Ch4: ; f5ae5
	togglenoise $3
	notetype $c
	note F_, 2
Music_AzaleaTown_branch_f5aea: ; f5aea
	note D#, 2
	note F#, 2
	note D_, 2
	note D#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D#, 2
	note D_, 2
	note G_, 1
	note G_, 1
	note D#, 2
	note F#, 2
	note D_, 2
	note D#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D#, 2
	note D_, 2
	note F#, 2
	loopchannel 0, Music_AzaleaTown_branch_f5aea
; f5b03


