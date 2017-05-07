Music_Pinballhurryup_red: ; 3dca2
	dbw $80, Music_Pinballhurryup_red_Ch1
	dbw $01, Music_Pinballhurryup_red_Ch2
	dbw $02, Music_Pinballhurryup_red_Ch3
; 3dcab

Music_Pinballhurryup_red_Ch1: ; 3dcab
	tempo 117
	volume $77
	dutycycle $2
	tone $0001
	notetype $c, $98
	octave 3
	note A_, 1
	note A#, 1
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	intensity $a8
	note D_, 2
	note F_, 2
Music_Pinballhurryup_red_branch_3dccb: ; 3dccb
	intensity $91
	note __, 2
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 2
	note __, 2
	note E_, 4
	note E_, 4
	note E_, 3
	note E_, 1
	note F_, 1
	note E_, 1
	note __, 2
	note F_, 3
	note G_, 1
	note F_, 4
	note F_, 3
	note D_, 1
	note F_, 1
	note D_, 1
	note __, 2
	note G_, 3
	note A_, 1
	note G_, 4
	note G_, 6
	loopchannel 0, Music_Pinballhurryup_red_branch_3dccb
; 3dcea

Music_Pinballhurryup_red_Ch2: ; 3dcea
	dutycycle $2
	vibrato $9, $33
	notetype $c, $a8
	octave 4
	note E_, 1
	note F_, 1
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
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a8
	note D_, 1
	intensity $28
	note D_, 1
	intensity $a8
	note C_, 1
	intensity $28
	note C_, 1
	intensity $a8
	octave 3
	note B_, 2
	octave 4
	note D_, 2
Music_Pinballhurryup_red_branch_3dd1f: ; 3dd1f
	dutycycle $2
	callchannel Music_Pinballhurryup_red_branch_3dd43
	callchannel Music_Pinballhurryup_red_branch_3dd49
	callchannel Music_Pinballhurryup_red_branch_3dd43
	callchannel Music_Pinballhurryup_red_branch_3dd49
	callchannel Music_Pinballhurryup_red_branch_3dd43
	dutycycle $3
	callchannel Music_Pinballhurryup_red_branch_3dd49
	dutycycle $2
	callchannel Music_Pinballhurryup_red_branch_3dd43
	dutycycle $3
	callchannel Music_Pinballhurryup_red_branch_3dd49
	loopchannel 0, Music_Pinballhurryup_red_branch_3dd1f
; 3dd43

Music_Pinballhurryup_red_branch_3dd43: ; 3dd43
	octave 1
	note D_, 1
	intensity $28
	note D_, 1
	endchannel
; 3dd49

Music_Pinballhurryup_red_branch_3dd49: ; 3dd49
	intensity $a3
	octave 4
	note G_, 2
	intensity $a1
	octave 3
	note B_, 1
	intensity $a3
	octave 4
	note F_, 2
	intensity $a1
	octave 3
	note A_, 1
	intensity $a3
	octave 4
	note E_, 2
	intensity $a1
	octave 3
	note G_, 1
	intensity $a3
	octave 4
	note D#, 2
	intensity $a1
	octave 3
	note A_, 1
	intensity $a3
	octave 4
	note F_, 2
	note E_, 3
	note D#, 1
	note D_, 2
	note E_, 4
	note D#, 1
	intensity $28
	note D#, 1
	intensity $a3
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F_, 3
	note E_, 1
	note D_, 2
	note F_, 4
	note E_, 1
	intensity $28
	note E_, 1
	intensity $a3
	note F_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 3
	note D#, 1
	note D_, 2
	note E_, 4
	note D#, 2
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	endchannel
; 3dd96

Music_Pinballhurryup_red_Ch3: ; 3dd96
	notetype $c, $22
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 2
	note G_, 2
Music_Pinballhurryup_red_branch_3ddae: ; 3ddae
	intensity $12
	note D_, 1
	note __, 3
	intensity $22
	octave 1
	note D_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note B_, 2
	octave 2
	note C_, 2
	note __, 2
	octave 1
	note G_, 1
	note __, 3
	octave 2
	note C_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C#, 2
	note D_, 2
	note __, 2
	octave 1
	note G_, 1
	note __, 3
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	note D#, 2
	note E_, 2
	note __, 2
	octave 1
	note G_, 1
	note __, 3
	octave 2
	note E_, 2
	note E_, 1
	note __, 1
	note D#, 2
	note D_, 2
	loopchannel 0, Music_Pinballhurryup_red_branch_3ddae
; 3ddea


