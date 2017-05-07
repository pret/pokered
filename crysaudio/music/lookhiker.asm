Music_LookHiker: ; f7411
	dbw $c0, Music_LookHiker_Ch1
	dbw $01, Music_LookHiker_Ch2
	dbw $02, Music_LookHiker_Ch3
	dbw $03, Music_LookHiker_Ch4
; f741d

Music_LookHiker_Ch1: ; f741d
	tempo 132
	volume $77
	tone $0001
	vibrato $12, $24
	dutycycle $2
	stereopanning $f
	notetype $c, $68
	octave 3
	note F#, 2
	note F_, 2
	note F#, 8
Music_LookHiker_branch_f7433: ; f7433
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note __, 4
	note F#, 2
	note __, 4
	note F#, 2
	note __, 2
	note F#, 2
	note __, 6
	loopchannel 0, Music_LookHiker_branch_f7433
; f7443

Music_LookHiker_Ch2: ; f7443
	dutycycle $0
	notetype $c, $a1
	note __, 4
	octave 1
	note B_, 1
	note B_, 5
	octave 2
	note F#, 1
	note F#, 5
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 1
	note D_, 1
	intensity $a1
Music_LookHiker_branch_f7457: ; f7457
	octave 1
	note B_, 1
	note B_, 2
	octave 2
	note D_, 1
	note D_, 2
	note F#, 1
	note F#, 2
	note A#, 1
	note A#, 2
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 1
	note D_, 1
	loopchannel 0, Music_LookHiker_branch_f7457
; f746b

Music_LookHiker_Ch3: ; f746b
	vibrato $12, $24
	stereopanning $f0
	notetype $c, $14
	octave 4
	note B_, 2
	note A#, 2
	note B_, 8
Music_LookHiker_branch_f7477: ; f7477
	octave 5
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	callchannel Music_LookHiker_branch_f748a
	note G_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	callchannel Music_LookHiker_branch_f748a
	loopchannel 0, Music_LookHiker_branch_f7477
; f748a

Music_LookHiker_branch_f748a: ; f748a
	octave 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 2
	note B_, 2
	note __, 6
	endchannel
; f7494

Music_LookHiker_Ch4: ; f7494
	togglenoise $3
	notetype $c
	note F_, 4
	note __, 16
Music_LookHiker_branch_f749a: ; f749a
	note D#, 2
	note G_, 2
	note D_, 2
	note G_, 2
	loopchannel 0, Music_LookHiker_branch_f749a
; f74a2


