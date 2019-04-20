Music_PokemonChannel:
	musicheader 4, 1, Music_PokemonChannel_Ch1
	musicheader 1, 2, Music_PokemonChannel_Ch2
	musicheader 1, 3, Music_PokemonChannel_Ch3
	musicheader 1, 4, Music_PokemonChannel_Ch4

Music_PokemonChannel_Ch1:
	tempo 128
	volume $77
	vibrato $8, $38
	dutycycle $1
	stereopanning $f
	notetype $c, $b3
	octave 2
	note B_, 1
	note __, 2
	note F#, 1
	note B_, 1
	note __, 1
	octave 3
	note F#, 4
	dutycycle $0
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $6, $b3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	dutycycle $1
	octave 3
	note C_, 2
	note __, 4
	note G_, 2
	note C_, 2
	note __, 2
	note B_, 8
	dutycycle $0
	note C_, 4
	note C_, 4
	octave 2
	note G_, 2
	note __, 2
	dutycycle $3
	octave 4
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note G_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C_, 2
	note __, 2
	note D#, 2
	note __, 2
	note __, 8
	octave 3
	note G_, 2
	note __, 6
	note B_, 2
	note __, 6
	note D_, 2
	note __, 6
	endchannel

Music_PokemonChannel_Ch2:
	dutycycle $1
	vibrato $8, $38
	stereopanning $ff
	notetype $c, $b3
	octave 3
	note G_, 3
	note A_, 1
	note B_, 1
	note __, 1
	octave 4
	note D_, 4
	dutycycle $0
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype $6, $b3
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	dutycycle $1
	octave 4
	note C_, 6
	note D_, 2
	note E_, 2
	note __, 2
	note G_, 8
	dutycycle $0
	octave 3
	note G_, 4
	note F#, 4
	note E_, 2
	note __, 2
	dutycycle $3
	octave 4
	note B_, 2
	note __, 2
	note A#, 2
	note __, 2
	note B_, 8
	octave 5
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 4
	note A#, 2
	note __, 2
	note G#, 2
	note __, 2
	note __, 8
	note D_, 2
	octave 3
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note G_, 2
	note __, 6
	octave 3
	note G_, 2
	note __, 6
	endchannel

Music_PokemonChannel_Ch3:
	vibrato $8, $38
	notetype $c, $25
	stereopanning $f0
	octave 2
	note G_, 1
	note __, 2
	note B_, 1
	octave 3
	note D_, 1
	note __, 1
	note G_, 6
	note __, 4
	note C_, 1
	note __, 2
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	note __, 1
	note E_, 6
	note __, 4
	octave 4
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note G_, 4
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	endchannel

Music_PokemonChannel_Ch4:
	togglenoise $3
	notetype $c
Music_PokemonChannel_branch_ee54d:
	note A#, 3
	note A#, 1
	note D_, 2
	note C_, 4
	note D_, 2
	note D_, 2
	note A#, 1
	note D_, 1
	loopchannel 2, Music_PokemonChannel_branch_ee54d
	note G#, 2
	note A#, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note C_, 4
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note B_, 4
	note D_, 4
	note A#, 4
	note A#, 4
	endchannel
