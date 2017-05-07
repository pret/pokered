Music_GymLeaderVictory: ; f462c
	dbw $c0, Music_GymLeaderVictory_Ch1
	dbw $01, Music_GymLeaderVictory_Ch2
	dbw $02, Music_GymLeaderVictory_Ch3
	dbw $03, Music_GymLeaderVictory_Ch4
; f4638

Music_GymLeaderVictory_Ch1: ; f4638
	ftempo 116
	volume $77
	vibrato $12, $34
	dutycycle $3
	tone $0001
	notetype $c, $b7
	octave 4
	note D_, 6
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note F#, 6
	note D_, 1
	note F#, 1
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 8
	stereopanning $f
Music_GymLeaderVictory_branch_f4658: ; f4658
	dutycycle $1
	callchannel Music_GymLeaderVictory_branch_f4689
	octave 4
	note C#, 4
	note E_, 4
	callchannel Music_GymLeaderVictory_branch_f4689
	note F#, 8
	loopchannel 2, Music_GymLeaderVictory_branch_f4658
	dutycycle $2
	callchannel Music_GymLeaderVictory_branch_f46a0
	note A_, 4
	note G_, 4
	note F#, 6
	note D_, 1
	note E_, 1
	note F#, 6
	note E_, 2
	note D_, 8
	note C#, 8
	dutycycle $3
	callchannel Music_GymLeaderVictory_branch_f46a0
	note C#, 4
	note E_, 4
	note G_, 6
	note A_, 1
	note G_, 1
	note A_, 6
	note G_, 2
	intensity $87
	note F#, 16
	loopchannel 0, Music_GymLeaderVictory_branch_f4658
; f4689

Music_GymLeaderVictory_branch_f4689: ; f4689
	intensity $91
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 1
	note F#, 1
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 1
	note E_, 1
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 1
	note D_, 1
	endchannel
; f46a0

Music_GymLeaderVictory_branch_f46a0: ; f46a0
	intensity $87
	octave 3
	note F#, 14
	note D_, 1
	note F#, 1
	note A_, 8
	note F#, 4
	note A_, 1
	note G#, 1
	note F#, 1
	note A_, 1
	note G#, 14
	note E_, 1
	note G#, 1
	note B_, 8
	octave 4
	note D_, 4
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 14
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 8
	endchannel
; f46bd

Music_GymLeaderVictory_Ch2: ; f46bd
	vibrato $12, $34
	dutycycle $3
	notetype $c, $d7
	octave 4
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 6
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note F#, 16
Music_GymLeaderVictory_branch_f46d0: ; f46d0
	dutycycle $3
	intensity $a1
	callchannel Music_GymLeaderVictory_branch_f4711
	note A_, 4
	note A_, 4
	callchannel Music_GymLeaderVictory_branch_f4711
	note D_, 6
	dutycycle $2
	note B_, 1
	octave 5
	note C#, 1
	callchannel Music_GymLeaderVictory_branch_f4711
	note A_, 4
	note A_, 4
	callchannel Music_GymLeaderVictory_branch_f4711
	note D_, 8
	dutycycle $3
	callchannel Music_GymLeaderVictory_branch_f4720
	note F#, 4
	note E_, 4
	note D_, 14
	octave 4
	note B_, 2
	intensity $a7
	note A_, 16
	dutycycle $2
	callchannel Music_GymLeaderVictory_branch_f4720
	octave 4
	note A_, 4
	octave 5
	note C#, 4
	note D_, 14
	note E_, 2
	intensity $a6
	note D_, 12
	note __, 2
	dutycycle $3
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	loopchannel 0, Music_GymLeaderVictory_branch_f46d0
; f4711

Music_GymLeaderVictory_branch_f4711: ; f4711
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 4
	octave 5
	note C#, 2
	octave 4
	note B_, 2
	note A_, 4
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	endchannel
; f4720

Music_GymLeaderVictory_branch_f4720: ; f4720
	intensity $98
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 8
	note D_, 16
	octave 4
	note B_, 6
	note G#, 1
	note B_, 1
	octave 5
	note E_, 8
	note E_, 16
	octave 4
	note G_, 6
	note E_, 1
	note G_, 1
	octave 5
	note C#, 8
	note C#, 8
	endchannel
; f4737

Music_GymLeaderVictory_Ch3: ; f4737
	notetype $c, $25
	octave 3
	note F#, 16
	note D_, 10
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	stereopanning $f0
Music_GymLeaderVictory_branch_f4744: ; f4744
	note D_, 2
	note __, 4
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note A_, 2
	note B_, 2
	note __, 4
	note G_, 2
	note A_, 2
	note __, 2
	octave 3
	note C#, 4
	note D_, 2
	note __, 4
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note A_, 2
	note B_, 2
	note __, 4
	note G_, 2
	octave 3
	note D_, 2
	note __, 6
	loopchannel 2, Music_GymLeaderVictory_branch_f4744
	callchannel Music_GymLeaderVictory_branch_f479e
	octave 3
	note D_, 2
	note __, 2
	note D_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note D_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	callchannel Music_GymLeaderVictory_branch_f479e
	octave 3
	note D_, 2
	note __, 2
	note G_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note D_, 2
	note G_, 2
	note E_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	loopchannel 0, Music_GymLeaderVictory_branch_f4744
; f479e

Music_GymLeaderVictory_branch_f479e: ; f479e
	octave 3
	note D_, 2
	note __, 2
	note D_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note D_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	note __, 2
	note D_, 2
	note F#, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	octave 4
	note E_, 2
	note __, 2
	octave 3
	note E_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note __, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	note __, 2
	note A_, 2
	octave 3
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	endchannel
; f47e5

Music_GymLeaderVictory_Ch4: ; f47e5
	togglenoise $4
	notetype $c
	note B_, 16
	note B_, 16
Music_GymLeaderVictory_branch_f47eb: ; f47eb
	callchannel Music_GymLeaderVictory_branch_f480b
	note D#, 6
	note D#, 2
	note D#, 8
	callchannel Music_GymLeaderVictory_branch_f480b
	note D#, 6
	note D#, 2
	note D#, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
Music_GymLeaderVictory_branch_f47fb: ; f47fb
	note D#, 2
	note G_, 2
	note D_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note D_, 2
	note G_, 2
	loopchannel 16, Music_GymLeaderVictory_branch_f47fb
	loopchannel 0, Music_GymLeaderVictory_branch_f47eb
; f480b

Music_GymLeaderVictory_branch_f480b: ; f480b
	note D#, 6
	note D#, 2
	note D#, 4
	note D_, 2
	note D#, 2
	loopchannel 3, Music_GymLeaderVictory_branch_f480b
	endchannel
; f4815


