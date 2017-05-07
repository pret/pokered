Music_Route29: ; f0386
	dbw $c0, Music_Route29_Ch1
	dbw $01, Music_Route29_Ch2
	dbw $02, Music_Route29_Ch3
	dbw $03, Music_Route29_Ch4
; f0392

Music_Route29_Ch1: ; f0392
	tempo 146
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f
	notetype $c, $b2
	note __, 2
Music_Route29_branch_f03a5: ; f03a5
	note __, 2
	octave 4
	note C_, 2
	note E_, 2
	note C_, 4
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 4
	note A_, 2
	note F#, 2
	note C_, 4
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note D_, 4
	octave 4
	note C_, 2
	note E_, 2
	note C_, 4
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 4
	note A_, 2
	note C_, 2
	note D_, 2
	note G_, 2
	note C_, 2
	note C_, 4
	note G_, 2
	octave 4
	note C_, 2
	note E_, 2
	note C_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note F_, 1
	note G_, 1
	note A_, 2
	note C_, 2
	note F#, 2
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 4
	note E_, 2
	octave 4
	note C_, 2
	note E_, 2
	note E_, 2
	octave 3
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note D_, 1
	note G_, 1
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note G_, 2
	note E_, 1
	note F_, 1
	note G_, 2
	note G_, 2
	note F_, 8
	intensity $b4
	note A_, 4
	octave 4
	note C_, 2
	octave 3
	note A_, 10
	note E_, 4
	note G_, 2
	note E_, 2
	intensity $b2
	note G_, 6
	intensity $b4
	note F_, 4
	note A_, 2
	note G_, 2
	note F_, 2
	intensity $b2
	note A_, 4
	intensity $b4
	note C#, 4
	note E_, 2
	note G_, 4
	intensity $b3
	note E_, 8
	intensity $b4
	note A_, 2
	note G_, 2
	note A_, 2
	octave 4
	note C_, 4
	intensity $b2
	octave 3
	note A_, 6
	intensity $b4
	note G_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	intensity $b2
	note G_, 4
	note B_, 4
	intensity $b4
	note G_, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 4
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	intensity $b2
	note C_, 2
	note G_, 2
	note G_, 4
	loopchannel 0, Music_Route29_branch_f03a5
; f044d

Music_Route29_Ch2: ; f044d
	dutycycle $3
	vibrato $12, $36
	notetype $c, $c2
	octave 4
	note C_, 1
	note D_, 1
Music_Route29_branch_f0458: ; f0458
	callchannel Music_Route29_branch_f04de
	note F_, 1
	note E_, 1
	note D_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note E_, 2
	octave 4
	note C_, 1
	note D_, 1
	callchannel Music_Route29_branch_f04de
	note F_, 1
	note E_, 1
	note D_, 2
	note D_, 2
	octave 3
	note B_, 2
	intensity $c4
	octave 4
	note C_, 8
	octave 3
	note A_, 2
	note A_, 2
	octave 4
	note C_, 2
	note C_, 2
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	octave 3
	note G_, 2
	note G_, 2
	octave 4
	note C_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	octave 3
	note F_, 2
	note F_, 2
	note A_, 2
	note A_, 2
	octave 4
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	octave 4
	note C_, 2
	note C_, 2
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	octave 3
	note G_, 2
	note G_, 2
	octave 4
	note C_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	intensity $c2
	note E_, 4
	note D_, 4
	intensity $c4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note G_, 2
	intensity $c2
	octave 4
	note C_, 2
	note C_, 2
	note C_, 2
	octave 4
	note C_, 1
	note D_, 1
	loopchannel 0, Music_Route29_branch_f0458
; f04de

Music_Route29_branch_f04de: ; f04de
	note E_, 2
	note E_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	note F_, 1
	note E_, 1
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	octave 4
	note A_, 2
	note G_, 2
	note C_, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	endchannel
; f04fb

Music_Route29_Ch3: ; f04fb
	stereopanning $f0
	notetype $c, $25
	vibrato $9, $27
	note __, 2
Music_Route29_branch_f0504: ; f0504
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 3
	octave 3
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note E_, 1
	note __, 3
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 3
	note E_, 4
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note F_, 4
	note F#, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note E_, 4
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 6
	octave 3
	note F_, 6
	note A_, 4
	octave 4
	note C_, 6
	octave 3
	note G_, 6
	note A_, 2
	note A#, 2
	note B_, 6
	note G_, 6
	octave 4
	note D_, 2
	note F_, 2
	octave 3
	note A_, 6
	note E_, 2
	octave 4
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	note G_, 2
	note A_, 6
	octave 4
	note C_, 6
	octave 3
	note A_, 4
	note G_, 6
	octave 4
	note C_, 6
	note F_, 2
	note E_, 2
	note F_, 6
	note F_, 2
	note E_, 2
	note __, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 6
	octave 3
	note G_, 6
	octave 4
	note C_, 4
	note E_, 4
	note C_, 4
	octave 3
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 1
	note __, 3
	loopchannel 0, Music_Route29_branch_f0504
; f05a9

Music_Route29_Ch4: ; f05a9
	stereopanning $f
	togglenoise $0
	notetype $c
	note __, 2
Music_Route29_branch_f05b0: ; f05b0
	note __, 2
	note F_, 2
	note F_, 6
	note F_, 2
	note F_, 2
	note F_, 2
	note __, 2
	note F_, 4
	note F_, 4
	note F_, 2
	note F_, 4
	loopchannel 0, Music_Route29_branch_f05b0
; f05bf


