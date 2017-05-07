Music_Pinballdiglettstage_digletts: ; 44cb9
	dbw $c0, Music_Pinballdiglettstage_digletts_Ch1
	dbw $01, Music_Pinballdiglettstage_digletts_Ch2
	dbw $02, Music_Pinballdiglettstage_digletts_Ch3
	dbw $03, Music_Pinballdiglettstage_digletts_Ch4
; 44cc5

Music_Pinballdiglettstage_digletts_Ch1: ; 44cc5
	tempo 208
	volume $77
	notetype $6, $73
	dutycycle $2
	note __, 8
	octave 6
	note C_, 2
	octave 2
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
Music_Pinballdiglettstage_digletts_branch_44ce1: ; 44ce1
	dutycycle $3
	callchannel Music_Pinballdiglettstage_digletts_branch_44d6e
	callchannel Music_Pinballdiglettstage_digletts_branch_44d6e
	callchannel Music_Pinballdiglettstage_digletts_branch_44d8e
	callchannel Music_Pinballdiglettstage_digletts_branch_44d8e
	callchannel Music_Pinballdiglettstage_digletts_branch_44d6e
	callchannel Music_Pinballdiglettstage_digletts_branch_44d6e
	callchannel Music_Pinballdiglettstage_digletts_branch_44d8e
	octave 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 2
	note __, 2
	octave 4
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	notetype $c, $73
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype $6, $73
	dutycycle $0
Music_Pinballdiglettstage_digletts_branch_44d25: ; 44d25
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 3
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	loopchannel 2, Music_Pinballdiglettstage_digletts_branch_44d25
Music_Pinballdiglettstage_digletts_branch_44d48: ; 44d48
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 3
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	loopchannel 2, Music_Pinballdiglettstage_digletts_branch_44d48
	loopchannel 0, Music_Pinballdiglettstage_digletts_branch_44ce1
; 44d6e

Music_Pinballdiglettstage_digletts_branch_44d6e: ; 44d6e
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 3
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	endchannel
; 44d8e

Music_Pinballdiglettstage_digletts_branch_44d8e: ; 44d8e
	octave 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 3
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	endchannel
; 44daf

Music_Pinballdiglettstage_digletts_Ch2: ; 44daf
	notetype $6, $b3
	vibrato $9, $34
	dutycycle $2
	tone $0001
	note __, 8
	octave 5
	note C_, 2
	dutycycle $3
	octave 2
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
Music_Pinballdiglettstage_digletts_branch_44dce: ; 44dce
	dutycycle $2
	intensity $b3
	callchannel Music_Pinballdiglettstage_digletts_branch_44eaf
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note G_, 1
	note G#, 3
	note F_, 6
	note __, 2
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	callchannel Music_Pinballdiglettstage_digletts_branch_44eaf
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note G_, 1
	note G#, 3
	note F_, 6
	note __, 2
	note D_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	intensity $92
	dutycycle $0
Music_Pinballdiglettstage_digletts_branch_44e16: ; 44e16
	octave 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note D#, 3
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	loopchannel 2, Music_Pinballdiglettstage_digletts_branch_44e16
Music_Pinballdiglettstage_digletts_branch_44e3e: ; 44e3e
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note G#, 3
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	loopchannel 2, Music_Pinballdiglettstage_digletts_branch_44e3e
	dutycycle $2
Music_Pinballdiglettstage_digletts_branch_44e66: ; 44e66
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 3
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	loopchannel 2, Music_Pinballdiglettstage_digletts_branch_44e66
Music_Pinballdiglettstage_digletts_branch_44e89: ; 44e89
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 3
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	loopchannel 2, Music_Pinballdiglettstage_digletts_branch_44e89
	loopchannel 0, Music_Pinballdiglettstage_digletts_branch_44dce
; 44eaf

Music_Pinballdiglettstage_digletts_branch_44eaf: ; 44eaf
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note B_, 1
	octave 4
	note C_, 3
	octave 3
	note F_, 6
	note __, 2
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note D#, 2
	note __, 2
	intensity $b8
	note C_, 2
	intensity $b3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note B_, 1
	octave 4
	note C_, 3
	octave 3
	note F_, 6
	note __, 2
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note C_, 2
	note __, 2
	note D#, 2
	note D_, 1
	note __, 1
	note C_, 2
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note G_, 1
	note G#, 3
	note F_, 6
	note __, 2
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note C_, 2
	note __, 2
	octave 4
	note D#, 2
	note D_, 1
	note __, 1
	note C_, 2
	endchannel
; 44efb

Music_Pinballdiglettstage_digletts_Ch3: ; 44efb
	notetype $6, $22
	note __, 8
	octave 4
	note E_, 2
	octave 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
Music_Pinballdiglettstage_digletts_branch_44f10: ; 44f10
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f8e
	callchannel Music_Pinballdiglettstage_digletts_branch_44f8e
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f8e
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note G#, 2
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f8e
	callchannel Music_Pinballdiglettstage_digletts_branch_44f8e
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f69
	callchannel Music_Pinballdiglettstage_digletts_branch_44f8e
	callchannel Music_Pinballdiglettstage_digletts_branch_44f8e
	loopchannel 0, Music_Pinballdiglettstage_digletts_branch_44f10
; 44f69

Music_Pinballdiglettstage_digletts_branch_44f69: ; 44f69
	octave 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note D#, 3
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 1
	note B_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	endchannel
; 44f8e

Music_Pinballdiglettstage_digletts_branch_44f8e: ; 44f8e
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note G#, 3
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	endchannel
; 44fb1

Music_Pinballdiglettstage_digletts_Ch4: ; 44fb1
	togglenoise $0
	notetype $6
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note D_, 2
Music_Pinballdiglettstage_digletts_branch_44fc3: ; 44fc3
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	callchannel Music_Pinballdiglettstage_digletts_branch_4502f
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	callchannel Music_Pinballdiglettstage_digletts_branch_4502f
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 2
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	callchannel Music_Pinballdiglettstage_digletts_branch_4502f
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	callchannel Music_Pinballdiglettstage_digletts_branch_4502f
	callchannel Music_Pinballdiglettstage_digletts_branch_4501f
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D_, 2
	loopchannel 0, Music_Pinballdiglettstage_digletts_branch_44fc3
; 4501f

Music_Pinballdiglettstage_digletts_branch_4501f: ; 4501f
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D#, 4
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	endchannel
; 4502f

Music_Pinballdiglettstage_digletts_branch_4502f: ; 4502f
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D#, 4
	note D#, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	endchannel
; 45040


