Music_HealPokemon: ; f0697
	dbw $80, Music_HealPokemon_Ch1
	dbw $01, Music_HealPokemon_Ch2
	dbw $02, Music_HealPokemon_Ch3
; f06a0

Music_HealPokemon_Ch1: ; f06a0
	ftempo 144
	volume $77
	fdutycycle $2
	tone $0001
	notetype $c, $81
	note __, 2
	unknownmusic0xe0 $0, $40
	note B_, 2
	unknownmusic0xe0 $0, $55
	note B_, 2
	unknownmusic0xe0 $0, $45
	note E_, 2
	note __, 4
	unknownmusic0xe0 $0, $30
	note E_, 4
	unknownmusic0xe0 $0, $40
	note B_, 4
	endchannel
; f06c4

Music_HealPokemon_Ch2: ; f06c4
	fdutycycle $2
	notetype $c, $c3
	octave 4
	note B_, 4
	note B_, 4
	note B_, 2
	note G#, 2
	notetype $c, $c4
	octave 5
	note E_, 8
	endchannel
; f06d4

Music_HealPokemon_Ch3: ; f06d4
	notetype $c, $10
	octave 4
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note E_, 6
	note __, 2
	endchannel
; f06e1


