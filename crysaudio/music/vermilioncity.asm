Music_VermilionCity: ; eb676
	dbw $80, Music_VermilionCity_Ch1
	dbw $01, Music_VermilionCity_Ch2
	dbw $02, Music_VermilionCity_Ch3
; eb67f




Music_VermilionCity_Ch1: ; eb680
	stereopanning $f
	tempo 176
	volume $77
	dutycycle $2
	notetype $c, $65
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	note A_, 2
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 5
	note D_, 1
	vibrato $10, $23
Music_VermilionCity_branch_eb6a0: ; eb6a0
	dutycycle $1
	notetype $c, $85
	callchannel Music_VermilionCity_branch_eb6f9
	note F_, 4
	octave 4
	note D_, 4
	note C#, 4
	note E_, 4
	callchannel Music_VermilionCity_branch_eb6f9
	callchannel Music_VermilionCity_branch_eb701
	dutycycle $2
	notetype $c, $85
	callchannel Music_VermilionCity_branch_eb6f9
	note F_, 4
	octave 4
	note D_, 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	note C_, 1
	callchannel Music_VermilionCity_branch_eb6f9
	callchannel Music_VermilionCity_branch_eb701
	intensity $93
	dutycycle $0
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	callchannel Music_VermilionCity_branch_eb70c
	callchannel Music_VermilionCity_branch_eb70c
	intensity $87
	dutycycle $2
	octave 4
	note D_, 8
	octave 3
	note G#, 8
	note E_, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	octave 2
	note B_, 4
	note G#, 4
	note B_, 4
	octave 3
	note D_, 4
	loopchannel 0, Music_VermilionCity_branch_eb6a0
; eb6f9

Music_VermilionCity_branch_eb6f9: ; eb6f9
	octave 3
	note C#, 4
	note E_, 4
	note F#, 2
	note A_, 2
	note E_, 2
	note G#, 2
	endchannel
; eb701

Music_VermilionCity_branch_eb701: ; eb701
	note D_, 2
	note F_, 2
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	note E_, 2
	endchannel
; eb70c

Music_VermilionCity_branch_eb70c: ; eb70c
	note __, 2
	note F#, 2
	note A_, 2
	note F#, 2
	octave 4
	note D_, 2
	octave 3
	note F#, 2
	note A_, 2
	note F#, 2
	note __, 2
	note G#, 2
	note B_, 2
	note G#, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	note B_, 2
	note G#, 2
	endchannel
; eb721

Music_VermilionCity_Ch2: ; eb721
	stereopanning $ff
	dutycycle $3
	notetype $c, $77
	vibrato $10, $23
	octave 5
	note E_, 4
	note D_, 4
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note F#, 4
	note G#, 4
Music_VermilionCity_branch_eb735: ; eb735
	notetype $c, $97
	callchannel Music_VermilionCity_branch_eb768
	note G#, 2
	callchannel Music_VermilionCity_branch_eb768
	note E_, 2
	intensity $b7
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	note D_, 4
	note E_, 4
	callchannel Music_VermilionCity_branch_eb77e
	callchannel Music_VermilionCity_branch_eb77e
	note F#, 6
	note E_, 1
	note F#, 1
	note E_, 8
	note A_, 6
	note G#, 1
	note A_, 1
	note G#, 8
	note G#, 14
	notetype $6, $57
	note __, 1
	octave 4
	note E_, 1
	note G#, 1
	note B_, 1
	notetype $c, $87
	octave 5
	note E_, 16
	loopchannel 0, Music_VermilionCity_branch_eb735
; eb768

Music_VermilionCity_branch_eb768: ; eb768
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note C#, 1
	note D_, 1
	note E_, 8
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note E_, 1
	note D_, 1
	note C#, 2
	note E_, 2
	octave 1
	note A_, 2
	endchannel
; eb77e

Music_VermilionCity_branch_eb77e: ; eb77e
	note F#, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	endchannel
; eb785

Music_VermilionCity_Ch3: ; eb785
	stereopanning $f0
	vibrato $22, $23
	notetype $c, $25
	octave 2
	note E_, 4
	note B_, 4
	octave 3
	note E_, 4
	note B_, 4
	note D_, 4
	note E_, 4
	note D_, 2
	octave 3
	note B_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
Music_VermilionCity_branch_eb79e: ; eb79e
	notetype $c, $22
	callchannel Music_VermilionCity_branch_eb7de
	octave 5
	note A_, 6
	intensity $24
	note E_, 1
	note G#, 1
	callchannel Music_VermilionCity_branch_eb7de
	note A_, 8
	intensity $14
	octave 3
	note D_, 4
	note C#, 4
	octave 2
	note B_, 4
	note A_, 4
	octave 3
	note D_, 2
	note __, 4
	note D_, 1
	note D_, 1
	callchannel Music_VermilionCity_branch_eb7f5
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	note __, 2
	note D_, 2
	callchannel Music_VermilionCity_branch_eb7f5
	intensity $25
	octave 3
	note E_, 8
	octave 4
	note E_, 8
	octave 3
	note B_, 8
	octave 4
	note E_, 8
	octave 2
	note E_, 16
	octave 3
	note E_, 14
	intensity $22
	octave 5
	note E_, 1
	note G#, 1
	loopchannel 0, Music_VermilionCity_branch_eb79e
; eb7de

Music_VermilionCity_branch_eb7de: ; eb7de
	octave 5
	note A_, 8
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note B_, 6
	note A_, 1
	note B_, 1
	octave 6
	note C#, 8
	octave 5
	note A_, 8
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note B_, 6
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	endchannel
; eb7f5

Music_VermilionCity_branch_eb7f5: ; eb7f5
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note F#, 2
	note E_, 2
	note __, 4
	note E_, 1
	note E_, 1
	octave 4
	note E_, 1
	note __, 1
	note D_, 2
	note __, 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	endchannel
; eb808


