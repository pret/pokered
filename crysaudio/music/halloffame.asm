Music_HallOfFame: ; f05bf
	dbw $c0, Music_HallOfFame_Ch1
	dbw $01, Music_HallOfFame_Ch2
	dbw $02, Music_HallOfFame_Ch3
	dbw $03, Music_HallOfFame_Ch4
; f05cb

Music_HallOfFame_Ch1: ; f05cb
	tempo 112
	volume $77
	dutycycle $2
	vibrato $c, $22
	tone $0001
	stereopanning $f0
	notetype $c, $93
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1
Music_HallOfFame_branch_f05e6: ; f05e6
	intensity $97
	octave 4
	note C_, 8
	intensity $77
	note C_, 8
	intensity $97
	note E_, 8
	intensity $77
	note E_, 8
	intensity $97
	note F#, 8
	intensity $77
	note F#, 8
	intensity $77
	note F_, 8
	intensity $57
	note F_, 8
	loopchannel 3, Music_HallOfFame_branch_f05e6
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_HallOfFame_branch_f05e6
; f060b

Music_HallOfFame_Ch2: ; f060b
	vibrato $8, $25
	dutycycle $3
Music_HallOfFame_branch_f0610: ; f0610
	notetype $c, $c4
	octave 3
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note G_, 2
	note D_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note F_, 2
	note C_, 2
	note F_, 2
	note A#, 4
	note A_, 4
	note F_, 2
	loopchannel 0, Music_HallOfFame_branch_f0610
; f062e

Music_HallOfFame_Ch3: ; f062e
Music_HallOfFame_branch_f062e: ; f062e
	notetype $c, $28
Music_HallOfFame_branch_f0631: ; f0631
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	loopchannel 3, Music_HallOfFame_branch_f0631
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F#, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	loopchannel 0, Music_HallOfFame_branch_f062e
; f066d

Music_HallOfFame_Ch4: ; f066d
	togglenoise $5
	notetype $c
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype $6
Music_HallOfFame_branch_f0677: ; f0677
	stereopanning $f
	note A#, 4
	note A#, 8
	note A#, 4
	note A#, 4
	note A#, 4
	stereopanning $f0
	note A_, 2
	note A_, 2
	note A#, 2
	note A#, 2
	note A#, 4
	note A#, 4
	note A#, 8
	note A#, 4
	note A#, 4
	stereopanning $f
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	loopchannel 0, Music_HallOfFame_branch_f0677
; f0697


