Music_HealPokemon:
	musicheader 3, 1, Music_HealPokemon_Ch1
	musicheader 1, 2, Music_HealPokemon_Ch2
	musicheader 1, 3, Music_HealPokemon_Ch3

Music_HealPokemon_Ch1:
	tempo 144
	volume $77
	dutycycle $2
	tone $0001
	notetype $c, $81
	note __, 2
	slidepitchto 1, 4, __
	note B_, 2
	slidepitchto 1, 5, E_
	note B_, 2
	slidepitchto 1, 4, E_
	note E_, 2
	note __, 4
	slidepitchto 1, 3, __
	note E_, 4
	slidepitchto 1, 4, __
	note B_, 4
	endchannel

Music_HealPokemon_Ch2:
	dutycycle $2
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

Music_HealPokemon_Ch3:
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
