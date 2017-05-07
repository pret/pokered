Music_BugCatchingContest: ; f7c16
	dbw $c0, Music_BugCatchingContest_Ch1
	dbw $01, Music_BugCatchingContest_Ch2
	dbw $02, Music_BugCatchingContest_Ch3
	dbw $03, Music_BugCatchingContest_Ch4
; f7c22

Music_BugCatchingContest_Ch1: ; f7c22
	tempo 144
	volume $77
	stereopanning $f
	vibrato $8, $24
	dutycycle $2
	notetype $c, $b7
	note __, 8
	octave 4
	note C#, 1
	note __, 1
	note C#, 3
	note __, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D_, 3
	note __, 1
	note D_, 1
	note D_, 1
	note D#, 1
	note __, 1
	note D#, 3
	note __, 1
	note D#, 1
	note D#, 1
	note E_, 1
	note __, 1
	note E_, 3
	note __, 1
	note E_, 1
	note E_, 1
Music_BugCatchingContest_branch_f7c4b: ; f7c4b
	notetype $c, $b1
Music_BugCatchingContest_branch_f7c4e: ; f7c4e
	note __, 2
	octave 2
	note A_, 2
	loopchannel 4, Music_BugCatchingContest_branch_f7c4e
Music_BugCatchingContest_branch_f7c55: ; f7c55
	note __, 2
	note B_, 2
	loopchannel 8, Music_BugCatchingContest_branch_f7c55
	intensity $b4
	dutycycle $1
	octave 3
	note B_, 6
	note A_, 1
	note B_, 1
	note A_, 6
	octave 4
	note D_, 1
	note E_, 1
	intensity $b1
	dutycycle $2
Music_BugCatchingContest_branch_f7c6b: ; f7c6b
	note __, 2
	octave 2
	note A_, 2
	loopchannel 4, Music_BugCatchingContest_branch_f7c6b
	note __, 2
	note B_, 2
	note __, 2
	note B_, 2
	notetype $6, $b7
	octave 4
	note E_, 4
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note G_, 1
	note B_, 8
	octave 5
	note E_, 8
	intensity $b1
	note __, 4
	octave 2
	note B_, 4
	note __, 4
	octave 3
	note E_, 4
	note __, 4
	note E_, 4
Music_BugCatchingContest_branch_f7c8e: ; f7c8e
	note __, 4
	octave 2
	note A_, 4
	loopchannel 3, Music_BugCatchingContest_branch_f7c8e
	intensity $a7
	octave 4
	note F#, 4
	note A_, 4
	note __, 4
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 8
	note __, 4
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	note F#, 2
	octave 4
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 8
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note G_, 2
	note __, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note B_, 2
	note __, 2
	note G#, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note G#, 2
	note B_, 2
	note C#, 2
	note __, 2
	note C#, 6
	note __, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note __, 2
	note D_, 6
	note __, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note __, 2
	note D#, 6
	note __, 2
	note D#, 2
	note D#, 2
	note E_, 2
	note __, 2
	note E_, 6
	note __, 2
	note E_, 2
	note E_, 2
	loopchannel 0, Music_BugCatchingContest_branch_f7c4b
; f7cf4

Music_BugCatchingContest_Ch2: ; f7cf4
	stereopanning $f0
	vibrato $8, $23
	dutycycle $1
	notetype $c, $c7
	note __, 8
Music_BugCatchingContest_branch_f7cff: ; f7cff
	octave 4
	note A_, 1
	note __, 1
	note A_, 3
	note __, 1
	note A_, 1
	note A_, 1
	loopchannel 4, Music_BugCatchingContest_branch_f7cff
Music_BugCatchingContest_branch_f7d0a: ; f7d0a
	dutycycle $0
	callchannel Music_BugCatchingContest_branch_f7d8e
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note G#, 2
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note E_, 2
	octave 3
	note E_, 1
	note __, 1
	callchannel Music_BugCatchingContest_branch_f7d8e
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 4
	note C#, 1
	note __, 1
	octave 2
	note E_, 2
	octave 4
	note C#, 1
	note __, 1
	octave 2
	note D_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note A_, 1
	note __, 1
	dutycycle $0
	note __, 2
	octave 5
	note D_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	octave 4
	note B_, 8
	note __, 2
	octave 5
	note D_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	octave 4
	note A_, 8
	note __, 2
	octave 5
	note D_, 4
	note F#, 2
	note E_, 2
	note D_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 10
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	note A_, 10
	loopchannel 0, Music_BugCatchingContest_branch_f7d0a
; f7d8e

Music_BugCatchingContest_branch_f7d8e: ; f7d8e
	octave 2
	note D_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note C#, 2
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note C#, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note G_, 1
	note __, 1
	endchannel
; f7db7

Music_BugCatchingContest_Ch3: ; f7db7
	stereopanning $ff
	vibrato $10, $23
	notetype $c, $14
	note __, 8
	octave 3
	note A_, 1
	note __, 1
	note A_, 3
	note __, 1
	note A_, 1
	note A_, 1
	note B_, 1
	note __, 1
	note B_, 3
	note __, 1
	note B_, 1
	note B_, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 3
	note __, 1
	note C_, 1
	note C_, 1
	note C#, 1
	note __, 1
	note C#, 3
	note __, 1
	note C#, 1
	note C#, 1
Music_BugCatchingContest_branch_f7dda: ; f7dda
	notetype $c, $14
	note F#, 5
	note __, 1
	note F#, 1
	note G_, 1
	note A_, 4
	octave 5
	note D_, 4
	note C#, 2
	intensity $10
	note E_, 1
	note G_, 1
	note B_, 1
	note __, 1
	note G_, 1
	note E_, 1
	notetype $6, $20
	octave 6
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 8
	intensity $14
	octave 4
	note E_, 10
	note __, 2
	note E_, 2
	note F#, 2
	note G_, 8
	octave 5
	note C#, 8
	note __, 4
	intensity $10
	note E_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note E_, 2
	note C_, 2
	octave 6
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 8
	intensity $15
	octave 5
	note F#, 4
	note __, 4
	note G_, 4
	note __, 4
	note A_, 4
	note __, 4
	octave 6
	note D_, 4
	note __, 4
	note C#, 12
	octave 5
	note B_, 2
	octave 6
	note C#, 2
	octave 5
	note B_, 4
	note __, 4
	octave 6
	note G_, 4
	note F#, 4
	note __, 4
	octave 5
	note G_, 4
	note A_, 4
	note B_, 4
	octave 6
	note E_, 4
	note D_, 4
	note C#, 4
	octave 5
	note B_, 2
	octave 6
	note C#, 2
	note D_, 4
	note __, 8
	octave 5
	note B_, 4
	note A_, 4
	note __, 1
	note D#, 1
	note F#, 1
	note A_, 1
	octave 6
	note C_, 8
	octave 3
	note G_, 2
	note __, 2
	note B_, 2
	note __, 2
	note D_, 2
	note __, 2
	note B_, 2
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note __, 2
	note G_, 2
	note __, 2
	note B_, 2
	note __, 2
	note D_, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note F#, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note G_, 2
	note __, 2
	note B_, 2
	note __, 2
	note D_, 2
	note __, 2
	note B_, 2
	note __, 2
	note G#, 2
	note __, 2
	note B_, 2
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A_, 6
	note __, 2
	note A_, 2
	note A_, 2
	note B_, 2
	note __, 2
	note B_, 6
	note __, 2
	note B_, 2
	note B_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 6
	note __, 2
	note C_, 2
	note C_, 2
	note C#, 2
	note __, 2
	note C#, 6
	note __, 2
	note C#, 2
	note C#, 2
	loopchannel 0, Music_BugCatchingContest_branch_f7dda
; f7e9a

Music_BugCatchingContest_Ch4: ; f7e9a
	togglenoise $4
	notetype $6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 2
	note E_, 2
	callchannel Music_BugCatchingContest_branch_f7ee2
Music_BugCatchingContest_branch_f7eaf: ; f7eaf
	note D_, 4
	note D_, 4
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 5, Music_BugCatchingContest_branch_f7eaf
	note D_, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	callchannel Music_BugCatchingContest_branch_f7ee2
	loopchannel 0, Music_BugCatchingContest_branch_f7eaf
; f7ee2

Music_BugCatchingContest_branch_f7ee2: ; f7ee2
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	endchannel
; f7ef3

