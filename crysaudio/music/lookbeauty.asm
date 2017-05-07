Music_LookBeauty: ; eee3e
	dbw $c0, Music_LookBeauty_Ch1
	dbw $01, Music_LookBeauty_Ch2
	dbw $02, Music_LookBeauty_Ch3
	dbw $03, Music_LookBeauty_Ch4
; eee4a

Music_LookBeauty_Ch1: ; eee4a
	stereopanning $f
	vibrato $12, $25
	dutycycle $2
	tempo 128
	volume $77
	notetype $c, $a3
	note __, 16
	note __, 8
	octave 4
	note C_, 8
	dutycycle $3
Music_LookBeauty_branch_eee5f: ; eee5f
	note __, 4
	octave 3
	note D_, 1
	note __, 5
	note D_, 1
	note __, 5
	note __, 2
	note D_, 1
	note __, 3
	note D_, 1
	note __, 5
	note D_, 4
	note __, 4
	note D_, 1
	note __, 5
	note D_, 1
	note __, 5
	note __, 2
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 2
	note __, 2
	note D_, 2
	note __, 4
	note E_, 1
	note __, 5
	note E_, 1
	note __, 5
	note __, 2
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 4
	note __, 4
	note F#, 1
	note __, 5
	note F#, 1
	note __, 3
	note D_, 2
	note D_, 1
	note __, 7
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	loopchannel 0, Music_LookBeauty_branch_eee5f
; eee9c

Music_LookBeauty_Ch2: ; eee9c
	stereopanning $f0
	vibrato $10, $23
	dutycycle $2
	notetype $c, $c7
	octave 3
	note D_, 1
	note __, 1
	octave 5
	note D_, 6
	note C_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 2
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	dutycycle $3
Music_LookBeauty_branch_eeec5: ; eeec5
	notetype $c, $c7
	note G_, 16
	note A_, 8
	note B_, 8
	note A_, 10
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 2
	note G#, 8
	note __, 2
	note F_, 2
	note __, 2
	note E_, 2
	intensity $b7
	vibrato $10, $24
	octave 5
	note C_, 15
	notetype $6, $c7
	intensity $c5
	vibrato $10, $23
	note __, 1
	note C#, 1
	note D_, 16
	note C_, 16
	octave 4
	note B_, 16
	note __, 4
	octave 5
	note D_, 2
	note __, 2
	octave 4
	note B_, 2
	note __, 2
	note A_, 6
	note __, 14
	note F#, 8
	note A_, 8
	loopchannel 0, Music_LookBeauty_branch_eeec5
; eeefa

Music_LookBeauty_Ch3: ; eeefa
	stereopanning $ff
	vibrato $8, $12
	notetype $c, $15
	note __, 16
	octave 5
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note D_, 7
	note F#, 1
Music_LookBeauty_branch_eef0f: ; eef0f
	note G_, 4
	octave 4
	note B_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note G_, 2
	note G_, 1
	octave 4
	note A#, 1
	note B_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 3
	octave 4
	note B_, 4
	octave 3
	note E_, 4
	octave 4
	note B_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note E_, 2
	note E_, 1
	octave 4
	note G_, 1
	note G#, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 3
	note G#, 2
	note __, 2
	note B_, 2
	octave 3
	note A_, 4
	octave 5
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 2
	note A_, 1
	octave 4
	note B_, 1
	octave 5
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 4
	octave 3
	note D_, 4
	octave 4
	note B_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note A_, 2
	note A_, 1
	note __, 7
	octave 3
	note D_, 8
	loopchannel 0, Music_LookBeauty_branch_eef0f
; eef8b

Music_LookBeauty_Ch4: ; eef8b
	togglenoise $3
	notetype $c
	note __, 16
	note __, 16
Music_LookBeauty_branch_eef91: ; eef91
	callchannel Music_LookBeauty_branch_eefa1
	callchannel Music_LookBeauty_branch_eefa1
	callchannel Music_LookBeauty_branch_eefa1
	callchannel Music_LookBeauty_branch_eefa1
	loopchannel 0, Music_LookBeauty_branch_eef91
; eefa1

Music_LookBeauty_branch_eefa1: ; eefa1
	note F#, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note G_, 2
	note F#, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	endchannel
; eefb2


