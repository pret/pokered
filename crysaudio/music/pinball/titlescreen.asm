Music_Pinballtitlescreen: ; 45d4b
	dbw $c0, Music_Pinballtitlescreen_Ch1
	dbw $01, Music_Pinballtitlescreen_Ch2
	dbw $02, Music_Pinballtitlescreen_Ch3
	dbw $03, Music_Pinballtitlescreen_Ch4
; 45d57

Music_Pinballtitlescreen_Ch1: ; 45d57
	tempo 130
	volume $77
	tone $0001
	dutycycle $2
	notetype $c, $92
	note __, 2
	note __, 2
	octave 4
	note C_, 2
	notetype $6, $61
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	intensity $92
	octave 3
	note A_, 2
	note __, 6
	note A_, 2
	note __, 6
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	intensity $41
	octave 4
	note C#, 2
	note G_, 2
	intensity $51
	note C#, 2
	note G_, 2
	intensity $71
	note C#, 2
	note G_, 2
	intensity $91
	note C#, 2
	note G_, 2
	intensity $a1
	note C#, 2
	note G_, 2
Music_Pinballtitlescreen_branch_45d91: ; 45d91
	intensity $88
	note __, 4
	octave 3
	note C_, 2
	note __, 2
	loopchannel 8, Music_Pinballtitlescreen_branch_45d91
	intensity $61
	note F_, 2
	note C#, 2
	note F_, 2
	note C#, 2
	note F_, 2
	note C#, 2
	note F_, 2
	note C#, 2
	note D_, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D#, 2
	note C#, 4
	note C_, 4
	octave 3
	note A#, 16
	intensity $91
	octave 4
	note G#, 2
	note D#, 2
	intensity $88
	octave 3
	note C_, 2
	note __, 6
	note C_, 2
	note __, 6
	note C_, 2
	note __, 6
	note C_, 2
	note __, 2
	intensity $91
	octave 4
	note G#, 2
	note F_, 2
	intensity $88
	octave 3
	note C_, 2
	note __, 6
	note C_, 2
	note __, 6
	note C_, 2
	note __, 6
	note C_, 2
	note __, 2
	intensity $91
	octave 5
	note C#, 2
	octave 4
	note G#, 2
	intensity $61
	octave 3
	note F_, 2
	note C#, 2
	note F_, 2
	note C#, 2
	note F_, 2
	note C#, 2
	note D_, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	octave 2
	note B_, 2
	note __, 16
	note __, 7
	intensity $68
	octave 5
	note D_, 1
	intensity $78
	note D#, 8
	intensity $88
	note __, 4
	octave 3
	note F_, 2
	note __, 6
	note F_, 2
	note __, 6
	note F_, 2
	note __, 6
	note F_, 2
	note __, 2
	note __, 4
	note G#, 2
	note __, 6
	note G#, 2
	note __, 6
	note A_, 2
	note __, 6
	note A_, 2
	note __, 2
	note __, 4
	octave 4
	note C#, 2
	note __, 6
	note C#, 2
	note __, 6
	octave 3
	note A#, 2
	note __, 6
	note A#, 2
	note __, 2
	intensity $72
	note D#, 2
	note G_, 2
	octave 4
	note C#, 2
	note D#, 2
	note C#, 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	note G_, 4
	octave 4
	note D#, 4
	intensity $71
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	intensity $88
	octave 3
	note F_, 2
	intensity $71
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	intensity $88
	octave 3
	note F_, 2
	intensity $71
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D_, 2
	intensity $88
	octave 3
	note F_, 2
	intensity $71
	octave 4
	note D_, 2
	octave 3
	note G#, 2
	octave 4
	note D_, 2
	intensity $88
	octave 3
	note F_, 2
	intensity $71
	octave 4
	note D_, 2
	note C_, 2
	note D#, 2
	intensity $88
	octave 3
	note G#, 2
	intensity $71
	octave 4
	note D#, 2
	note C_, 2
	note D#, 2
	intensity $88
	octave 3
	note G#, 2
	intensity $71
	octave 4
	note D#, 2
	note C_, 2
	note D#, 2
	intensity $88
	octave 3
	note A_, 2
	intensity $71
	octave 4
	note D#, 2
	note F_, 2
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	note C#, 2
	note A#, 2
	intensity $88
	note F_, 2
	intensity $71
	note A#, 2
	note C#, 2
	note A#, 2
	intensity $88
	note F_, 2
	intensity $71
	note A#, 2
	note D_, 2
	note A#, 2
	intensity $88
	note F_, 2
	intensity $71
	note A#, 2
	note D_, 2
	note A#, 2
	intensity $88
	note F_, 2
	intensity $71
	note A#, 2
	intensity $57
	note G_, 8
	intensity $77
	note G#, 8
	intensity $97
	note A_, 8
	intensity $a7
	note A#, 8
	loopchannel 0, Music_Pinballtitlescreen_branch_45d91
; 45eae

Music_Pinballtitlescreen_Ch2: ; 45eae
	notetype $c, $b3
	dutycycle $2
	vibrato $9, $24
	note __, 2
	intensity $a8
	octave 2
	note G#, 1
	note __, 1
	intensity $a8
	octave 4
	note G#, 6
	intensity $a1
	note G_, 1
	notetype $6, $71
	note D#, 2
	note C_, 2
	note D#, 2
	intensity $a1
	note G_, 2
	intensity $71
	note D#, 2
	note C_, 2
	note D#, 2
	intensity $a1
	note F_, 2
	intensity $71
	note C#, 2
	intensity $a1
	note E_, 2
	intensity $71
	note C#, 2
	intensity $a1
	note D#, 2
	intensity $71
	note C#, 2
	notetype $c, $a8
	note A#, 10
Music_Pinballtitlescreen_branch_45ee7: ; 45ee7
	notetype $c, $a8
	dutycycle $2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A#, 2
	octave 4
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	octave 3
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A#, 2
	octave 4
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note C#, 2
	intensity $28
	note C#, 2
	intensity $a8
	note D#, 2
	callchannel Music_Pinballtitlescreen_branch_460da
	intensity $a8
	note G#, 1
	intensity $28
	note G#, 1
	intensity $a8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $a8
	note F#, 1
	intensity $28
	note F#, 1
	intensity $a8
	note F_, 1
	intensity $28
	note F_, 1
	intensity $a8
	note D#, 1
	intensity $28
	note D#, 1
	notetype $6, $61
	note G#, 4
	note G_, 4
	intensity $78
	note A#, 2
	intensity $68
	note B_, 2
	intensity $a8
	octave 4
	note C_, 6
	octave 3
	note B_, 2
	note A#, 4
	octave 4
	note C_, 4
	intensity $28
	note C_, 4
	intensity $a8
	octave 3
	note B_, 4
	intensity $28
	note B_, 4
	intensity $a8
	note A#, 4
	octave 4
	note C_, 6
	octave 3
	note B_, 2
	note A#, 4
	octave 4
	note C_, 4
	intensity $28
	note C_, 4
	intensity $a8
	note C#, 4
	intensity $28
	note C#, 4
	intensity $a8
	note D#, 4
	notetype $c, $a8
	callchannel Music_Pinballtitlescreen_branch_460da
	notetype $6, $a2
	note G#, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	note D#, 1
	intensity $28
	note D#, 1
	intensity $a8
	octave 2
	note A#, 2
	intensity $28
	note A#, 2
	intensity $a8
	note A_, 1
	intensity $28
	note A_, 1
	intensity $a8
	note A#, 1
	intensity $28
	note A#, 1
	intensity $a8
	note D#, 3
	intensity $68
	octave 4
	note F#, 1
	intensity $78
	note G_, 8
	dutycycle $3
	intensity $a8
	note F_, 2
	intensity $28
	note F_, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note A#, 2
	intensity $28
	note A#, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 1
	intensity $58
	note A#, 1
	intensity $a8
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note A#, 2
	intensity $28
	note A#, 2
	intensity $a8
	note G#, 2
	intensity $58
	note A#, 1
	note B_, 1
	intensity $a8
	octave 5
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	octave 4
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	octave 5
	note C_, 2
	intensity $28
	note C_, 1
	intensity $58
	note D_, 1
	intensity $a8
	note D#, 2
	intensity $28
	note D#, 2
	intensity $a8
	note C#, 2
	intensity $28
	note C#, 2
	intensity $a8
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note D#, 2
	intensity $28
	note D#, 2
	intensity $a8
	note C#, 2
	intensity $28
	note C#, 2
	intensity $a8
	octave 4
	note F_, 2
	intensity $28
	note F_, 2
	intensity $a8
	note G_, 2
	intensity $28
	note G_, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note A#, 2
	intensity $28
	note A#, 2
	intensity $a8
	octave 5
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	octave 4
	note A#, 2
	intensity $28
	note A#, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note G_, 6
	note F#, 2
	note F_, 2
	intensity $28
	note F_, 2
	intensity $a8
	note G_, 8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note A#, 4
	intensity $48
	note A_, 1
	note G#, 1
	intensity $28
	note G_, 1
	note F#, 1
	intensity $a8
	note F_, 2
	intensity $28
	note F_, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note A#, 2
	intensity $28
	note A#, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	note A#, 2
	intensity $28
	note A#, 2
	intensity $a8
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	octave 5
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	octave 4
	note B_, 2
	intensity $28
	note B_, 2
	intensity $a8
	octave 5
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note D#, 2
	intensity $28
	note D#, 2
	intensity $a8
	note C#, 2
	intensity $28
	note C#, 2
	intensity $a8
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note D#, 2
	intensity $28
	note D#, 2
	intensity $a8
	note C#, 8
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note C#, 2
	intensity $28
	note C#, 2
	intensity $a8
	note D_, 8
	note C_, 2
	intensity $28
	note C_, 2
	intensity $a8
	note D_, 2
	intensity $28
	note D_, 2
	notetype $c, $a8
	note D#, 16
	loopchannel 0, Music_Pinballtitlescreen_branch_45ee7
; 460da

Music_Pinballtitlescreen_branch_460da: ; 460da
	note F_, 2
	octave 3
	note G#, 2
	note A#, 2
	note G#, 2
	intensity $28
	note G#, 2
	intensity $a8
	octave 4
	note C_, 1
	intensity $28
	note C_, 1
	intensity $a8
	octave 3
	note A#, 1
	intensity $28
	note A#, 1
	intensity $a8
	note G#, 1
	intensity $28
	note G#, 1
	endchannel
; 460f7

Music_Pinballtitlescreen_Ch3: ; 460f7
	notetype $c, $22
	note __, 2
	octave 1
	note G#, 1
	note __, 1
	octave 2
	note D#, 6
	octave 1
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A#, 1
	note __, 1
	octave 2
	note C#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	octave 2
	note D#, 4
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
Music_Pinballtitlescreen_branch_46115: ; 46115
	notetype $c, $22
	callchannel Music_Pinballtitlescreen_branch_461df
	callchannel Music_Pinballtitlescreen_branch_46210
	note D#, 1
	note __, 1
	note A#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 1
	note __, 1
	note D#, 1
	note __, 7
	callchannel Music_Pinballtitlescreen_branch_461df
	callchannel Music_Pinballtitlescreen_branch_46210
	note D#, 1
	note __, 1
	note A#, 1
	note __, 1
	note D#, 1
	note __, 5
	notetype $6, $22
	octave 1
	note D#, 3
	notetype $6, $32
	octave 3
	note A_, 1
	notetype $6, $22
	note A#, 8
	notetype $c, $22
	callchannel Music_Pinballtitlescreen_branch_46210
	callchannel Music_Pinballtitlescreen_branch_46222
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	callchannel Music_Pinballtitlescreen_branch_46210
	callchannel Music_Pinballtitlescreen_branch_46222
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A#, 1
	notetype $6, $32
	octave 4
	note D#, 1
	note __, 1
	notetype $6, $22
	octave 3
	note G_, 2
	notetype $6, $32
	octave 4
	note D#, 1
	note __, 1
	notetype $6, $22
	octave 2
	note A#, 2
	notetype $6, $32
	octave 4
	note D#, 1
	note __, 1
	notetype $6, $22
	octave 3
	note G_, 2
	notetype $6, $32
	octave 4
	note D#, 1
	note __, 1
	notetype $6, $22
	octave 2
	note A#, 2
	notetype $6, $32
	octave 4
	note D#, 1
	note __, 1
	notetype $6, $22
	octave 3
	note G_, 2
	notetype $6, $32
	octave 4
	note D#, 1
	note __, 1
	notetype $6, $12
	octave 3
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 4
	loopchannel 0, Music_Pinballtitlescreen_branch_46115
; 461df

Music_Pinballtitlescreen_branch_461df: ; 461df
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	endchannel
; 46210

Music_Pinballtitlescreen_branch_46210: ; 46210
	octave 2
	note C#, 1
	note __, 1
	note G#, 1
	note __, 1
	note C#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	endchannel
; 46222

Music_Pinballtitlescreen_branch_46222: ; 46222
	note D#, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	endchannel
; 4623a

Music_Pinballtitlescreen_Ch4: ; 4623a
	togglenoise $1
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D#, 2
	note B_, 6
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	callchannel Music_Pinballtitlescreen_branch_462b8
Music_Pinballtitlescreen_branch_4624f: ; 4624f
	notetype $c
	callchannel Music_Pinballtitlescreen_branch_462cb
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	notetype $8
	note A_, 1
	note G_, 1
	note G_, 1
	notetype $c
	note A_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	callchannel Music_Pinballtitlescreen_branch_462cb
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 8
	callchannel Music_Pinballtitlescreen_branch_462cb
	callchannel Music_Pinballtitlescreen_branch_462b8
	callchannel Music_Pinballtitlescreen_branch_462cb
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note A_, 1
	note D#, 1
	notetype $6
	note __, 1
	note B_, 9
	notetype $c
	callchannel Music_Pinballtitlescreen_branch_462cb
	callchannel Music_Pinballtitlescreen_branch_462cb
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
Music_Pinballtitlescreen_branch_4629d: ; 4629d
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	loopchannel 2, Music_Pinballtitlescreen_branch_4629d
	callchannel Music_Pinballtitlescreen_branch_462cb
	callchannel Music_Pinballtitlescreen_branch_462cb
	callchannel Music_Pinballtitlescreen_branch_462cb
	callchannel Music_Pinballtitlescreen_branch_462cb
	loopchannel 0, Music_Pinballtitlescreen_branch_4624f
; 462b8

Music_Pinballtitlescreen_branch_462b8: ; 462b8
	note A_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	notetype $8
	note A_, 1
	note G_, 1
	note G_, 1
	notetype $c
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	endchannel
; 462cb

Music_Pinballtitlescreen_branch_462cb: ; 462cb
	note A_, 2
	note G_, 1
	note G_, 1
	loopchannel 4, Music_Pinballtitlescreen_branch_462cb
	endchannel
; 462d3

