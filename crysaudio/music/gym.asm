Music_Gym: ; f48ae
	dbw $c0, Music_Gym_Ch1
	dbw $01, Music_Gym_Ch2
	dbw $02, Music_Gym_Ch3
	dbw $03, Music_Gym_Ch4
; f48ba

Music_Gym_Ch1: ; f48ba
	tempo 156
	volume $77
	stereopanning $f
	vibrato $12, $24
	dutycycle $1
	notetype $c, $b7
Music_Gym_branch_f48c9: ; f48c9
	octave 4
	note F#, 2
	octave 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 3
	octave 4
	note E_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	octave 4
	note D_, 2
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note D_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note A_, 12
	note F#, 2
	note A_, 2
	note G_, 1
	note __, 2
	note E_, 1
	note E_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 8
	note A_, 4
	note F#, 2
	note A_, 2
	note E_, 1
	note __, 1
	note E_, 1
	note F#, 1
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C_, 2
	note D_, 6
	octave 3
	note A_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note B_, 1
	note __, 2
	note G_, 1
	note G_, 4
	octave 4
	note E_, 1
	note __, 2
	note C_, 1
	note C_, 2
	octave 3
	note B_, 1
	note A#, 1
	note A_, 12
	note F#, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 2
	note C_, 2
	note E_, 2
	note C_, 1
	note E_, 1
	note G_, 4
	note D_, 6
	octave 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	octave 4
	note F#, 3
	note G_, 4
	note F#, 4
	note E_, 4
	note C_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note __, 2
	octave 3
	note B_, 4
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	octave 4
	note D_, 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	octave 4
	note E_, 4
	note F#, 6
	octave 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	octave 4
	note F#, 3
	note A_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note E_, 1
	note F#, 4
	note E_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note F#, 1
	note G_, 4
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note A_, 4
	octave 5
	note D_, 4
	octave 4
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	loopchannel 0, Music_Gym_branch_f48c9
; f497c

Music_Gym_Ch2: ; f497c
	dutycycle $1
	stereopanning $f0
Music_Gym_branch_f4980: ; f4980
	notetype $c, $c3
	octave 2
	note D_, 2
	octave 1
	note D_, 1
	note D_, 1
	note D_, 2
	note A_, 1
	octave 2
	note F#, 1
	note C_, 2
	octave 1
	note C_, 1
	note C_, 1
	note C_, 2
	octave 2
	note G_, 1
	note E_, 1
	octave 1
	note G_, 2
	octave 1
	note G_, 1
	note G_, 1
	note G_, 2
	octave 1
	note G_, 1
	note G_, 1
	note A_, 4
	octave 2
	note A_, 2
	octave 3
	note C_, 1
	note C#, 1
	callchannel Music_Gym_branch_f49e9
	octave 3
	note E_, 2
	note C_, 1
	note C#, 1
	callchannel Music_Gym_branch_f49e9
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	intensity $d2
	callchannel Music_Gym_branch_f4a15
	octave 1
	note F#, 1
	note B_, 1
	note F#, 2
	octave 2
	note F#, 2
	octave 1
	note B_, 2
	note A#, 4
	note A#, 2
	note F_, 1
	note F_, 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note E_, 2
	callchannel Music_Gym_branch_f4a15
	octave 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note E_, 2
	note C_, 2
	note D_, 4
	note D_, 2
	octave 1
	note A_, 1
	note A_, 1
	note A_, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 2
	octave 2
	note F#, 2
	note D_, 2
	loopchannel 0, Music_Gym_branch_f4980
; f49e9

Music_Gym_branch_f49e9: ; f49e9
	octave 3
	note D_, 3
	octave 2
	note D_, 3
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C_, 3
	octave 2
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	octave 3
	note E_, 2
	note C_, 1
	note C#, 1
	note D_, 3
	octave 2
	note D_, 3
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C_, 3
	octave 2
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	endchannel
; f4a15

Music_Gym_branch_f4a15: ; f4a15
	octave 2
	note D_, 4
	note D_, 2
	octave 1
	note A_, 1
	note A_, 1
	note A_, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	note D_, 2
	note C_, 4
	note C_, 2
	octave 1
	note G_, 1
	note G_, 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note C_, 2
	octave 1
	note B_, 2
	note __, 2
	note B_, 2
	note F#, 1
	note F#, 1
	endchannel
; f4a37

Music_Gym_Ch3: ; f4a37
	vibrato $14, $23
	stereopanning $ff
Music_Gym_branch_f4a3c: ; f4a3c
	notetype $c, $14
	octave 6
	note D_, 2
	octave 4
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	octave 5
	note A_, 1
	octave 6
	note D_, 1
	note C_, 2
	octave 4
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 2
	octave 3
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	octave 5
	note B_, 1
	note B_, 1
	note B_, 4
	octave 6
	note C#, 4
	octave 5
	note D_, 12
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note E_, 1
	note __, 2
	note C_, 1
	note C_, 4
	note G_, 4
	note E_, 4
	note D_, 12
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note D_, 1
	note E_, 8
	note __, 4
	note F#, 12
	note E_, 2
	note F#, 2
	note G_, 1
	note __, 2
	note E_, 1
	note E_, 4
	octave 6
	note C_, 1
	note __, 2
	octave 5
	note G_, 1
	note G_, 4
	note F#, 12
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 1
	note G_, 1
	octave 6
	note C_, 8
	octave 5
	note B_, 4
	intensity $13
	callchannel Music_Gym_branch_f4ab3
	note __, 2
	note A_, 2
	octave 6
	note D_, 2
	octave 5
	note A_, 2
	octave 6
	note C_, 4
	octave 5
	note A#, 4
	note A_, 4
	note G_, 4
	callchannel Music_Gym_branch_f4ab3
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note F#, 8
	note E_, 4
	loopchannel 0, Music_Gym_branch_f4a3c
; f4ab3

Music_Gym_branch_f4ab3: ; f4ab3
	octave 5
	note A_, 6
	octave 6
	note D_, 6
	octave 5
	note A_, 4
	octave 6
	note C_, 4
	octave 5
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 1
	note __, 1
	note F#, 1
	note G_, 1
	note A_, 4
	endchannel
; f4ac5

Music_Gym_Ch4: ; f4ac5
	togglenoise $4
Music_Gym_branch_f4ac7: ; f4ac7
	notetype $c
	note D_, 2
	note C#, 1
	note C#, 1
	note B_, 4
	note D_, 2
	note C#, 1
	note C#, 1
	note B_, 4
	note D_, 2
	note C#, 1
	note C#, 1
	note D_, 2
	note C#, 1
	note C#, 1
	note A#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	notetype $6
Music_Gym_branch_f4ae1: ; f4ae1
	note D_, 6
	note D_, 6
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 6
	note D_, 6
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	loopchannel 4, Music_Gym_branch_f4ae1
Music_Gym_branch_f4afa: ; f4afa
	note D#, 4
	note F#, 4
	note D_, 4
	note D#, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 4
	note F#, 4
	loopchannel 8, Music_Gym_branch_f4afa
	loopchannel 0, Music_Gym_branch_f4ac7
; f4b0c


