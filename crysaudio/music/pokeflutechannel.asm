Music_PokeFluteChannel: ; f7b13
	dbw $80, Music_PokeFluteChannel_Ch1
	dbw $01, Music_PokeFluteChannel_Ch2
	dbw $02, Music_PokeFluteChannel_Ch3
; f7b1c

Music_PokeFluteChannel_Ch1: ; f7b1c
	tempo 240
	volume $77
	stereopanning $f0
	dutycycle $3
	tone $0002
	notetype $c, $b4
	note __, 4
	octave 3
	note E_, 8
	note E_, 8
	notetype $c, $b3
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 16
	note __, 2
	octave 2
	note G_, 4
	note A_, 8
Music_PokeFluteChannel_branch_f7b40: ; f7b40
	octave 3
	note E_, 2
	note G_, 2
	note F_, 4
	octave 2
	note F_, 8
	octave 3
	note G_, 2
	note A_, 2
	note G_, 4
	octave 2
	note E_, 4
	octave 3
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 8
	note A_, 8
	note G_, 8
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	octave 2
	note B_, 4
	note G_, 8
	octave 3
	note C_, 4
	note E_, 2
	note D_, 2
	octave 2
	note G_, 4
	note A_, 8
	loopchannel 0, Music_PokeFluteChannel_branch_f7b40
; f7b68

Music_PokeFluteChannel_Ch2: ; f7b68
	stereopanning $f
	dutycycle $3
	tone $0001
	notetype $c, $c4
	note __, 4
	octave 3
	note C_, 8
	octave 2
	note G_, 8
	note A_, 8
	octave 3
	note E_, 8
	notetype $c, $c3
	octave 2
	note E_, 2
	note G_, 2
	octave 3
	note C_, 2
	note E_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note E_, 2
	note D_, 2
	octave 2
	note E_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note E_, 2
	note G_, 2
Music_PokeFluteChannel_branch_f7b94: ; f7b94
	octave 3
	note C_, 2
	note E_, 2
	octave 2
	note A_, 4
	note C_, 4
	octave 3
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	octave 2
	note G_, 4
	note C_, 4
	note G_, 2
	note E_, 2
	octave 3
	note C_, 2
	octave 2
	note A_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	octave 2
	note D_, 4
	note G_, 4
	note E_, 2
	octave 3
	note C_, 2
	note C_, 4
	octave 2
	note G_, 2
	octave 3
	note E_, 2
	octave 2
	note G_, 2
	note B_, 2
	note E_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note E_, 2
	note G_, 2
	loopchannel 0, Music_PokeFluteChannel_branch_f7b94
; f7bd5

Music_PokeFluteChannel_Ch3: ; f7bd5
	vibrato $10, $14
	notetype $c, $10
	callchannel Music_PokeFluteChannel_branch_f7c05
	callchannel Music_PokeFluteChannel_branch_f7c05
Music_PokeFluteChannel_branch_f7be1: ; f7be1
	note __, 4
	octave 4
	note C_, 2
	octave 5
	note F_, 2
	note E_, 2
	note F_, 2
	octave 6
	note C_, 4
	note __, 4
	octave 4
	note C_, 2
	octave 5
	note G_, 2
	note F#, 2
	note G_, 2
	octave 6
	note C_, 4
	octave 5
	note B_, 2
	note A_, 2
	note B_, 4
	note A_, 2
	note G_, 2
	note A_, 4
	note G_, 2
	note F#, 2
	note G_, 8
	note __, 4
	callchannel Music_PokeFluteChannel_branch_f7c05
	loopchannel 0, Music_PokeFluteChannel_branch_f7be1
; f7c05

Music_PokeFluteChannel_branch_f7c05: ; f7c05
	octave 5
	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 2
	note G_, 2
	octave 6
	note C_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 5
	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 4
	endchannel
; f7c16


