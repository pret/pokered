Music_PokemonTower:
	dbw $80, Music_PokemonTower_Ch1
	dbw $01, Music_PokemonTower_Ch2
	dbw $02, Music_PokemonTower_Ch3

Music_PokemonTower_Ch1: ; 7f04a (1f:704a)
	tempo 152
	volume 119
	dutycycle 3
	
	vibrato 12, 35
	notetype 12, 128
	note __, 4
	octave 4
	note B_, 12

Music_PokemonTower_branch_7f05a:
	notetype 12, 180
	octave 4
	note G_, 1
	note __, 7
	note G_, 1
	note __, 7
	octave 3
	note B_, 1
	note __, 7
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	octave 4
	note F#, 1
	note __, 7
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	note __, 5
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note F#, 1
	note __, 7
	note E_, 1
	note __, 7
	note G_, 1
	note __, 7
	note G_, 1
	note __, 7
	note F#, 1
	note __, 7
	note F#, 1
	note __, 7
	note G_, 1
	note __, 7
	note E_, 1
	note __, 7
	note D_, 1
	note __, 7
	note E_, 1
	note __, 7
	note G_, 1
	note __, 7
	note G_, 1
	note __, 7
	note F#, 1
	note __, 7
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	octave 4
	note C_, 1
	note __, 7
	note C_, 1
	note __, 7
	note C#, 1
	note __, 7
	note C#, 1
	note __, 7
	note C_, 1
	note __, 7
	note C_, 1
	note __, 3
	notetype 12, 132
	note C_, 1
	note __, 3
	notetype 12, 180
	note D_, 1
	note __, 7
	note D_, 1
	note __, 7
	octave 3
	note A_, 1
	note __, 7
	note A_, 1
	note __, 7
	notetype 12, 167
	note B_, 8
	note B_, 8
	octave 4
	note C_, 8
	note C_, 8
	note C#, 8
	note C#, 8
	notetype 12, 166
	note D_, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype 12, 146
	note B_, 4
	octave 5
	note E_, 4
	note D_, 4
	note C_, 4
	octave 4
	note B_, 4
	octave 5
	note E_, 4
	note D_, 4
	note C_, 4
	octave 4
	note B_, 4
	octave 5
	note E_, 4
	note D_, 4
	note C_, 4
	octave 4
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	octave 5
	note C_, 16
	note C_, 16
	loopchannel 0, Music_PokemonTower_branch_7f05a


Music_PokemonTower_Ch2: ; 7f0e3 (1f:70e3)
	vibrato 20, 52
	dutycycle 3
	notetype 12, 160
	octave 5
	note C_, 12
	octave 4
	note E_, 4

Music_PokemonTower_branch_7f0ee:
	notetype 12, 193
	octave 5
	note C_, 8
	octave 4
	note B_, 4
	notetype 12, 196
	note G_, 1
	note F#, 1
	note E_, 1
	note D#, 1
	notetype 12, 176
	note G_, 8
	octave 5
	note C_, 8
	octave 4
	note B_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	octave 5
	note C_, 8
	notetype 12, 183
	note C_, 8
	notetype 12, 194
	octave 4
	note G_, 1
	note F#, 1
	note E_, 1
	note __, 1
	notetype 12, 150
	octave 3
	note G_, 4
	notetype 12, 199
	note G_, 4
	note B_, 4
	note G_, 4
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	notetype 12, 176
	octave 4
	note C_, 16
	note E_, 8
	notetype 12, 183
	note E_, 12
	notetype 12, 197
	octave 5
	note C_, 4
	octave 4
	note B_, 4
	note G_, 4
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	notetype 12, 176
	note F#, 12
	note G_, 4
	notetype 12, 176
	note F#, 8
	notetype 12, 183
	note F#, 8
	notetype 12, 176
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 16
	notetype 12, 176
	octave 5
	note C_, 4
	octave 4
	note G_, 4
	note F#, 4
	note E_, 4
	notetype 12, 144
	octave 5
	note C_, 16
	notetype 12, 176
	note D_, 4
	octave 4
	note A_, 4
	note G#, 4
	note F#, 4
	notetype 12, 47
	octave 5
	note D_, 16
	notetype 12, 192
	note E_, 4
	octave 4
	note B_, 4
	note A_, 4
	note G_, 4
	octave 5
	note F_, 4
	note C_, 4
	octave 4
	note A#, 4
	note G#, 4
	octave 5
	note F#, 4
	note D_, 4
	note C_, 4
	octave 4
	note A#, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note D_, 4
	notetype 12, 176
	note C_, 8
	notetype 12, 144
	note C_, 8
	notetype 12, 128
	note C_, 8
	notetype 12, 112
	note C_, 8
	notetype 12, 96
	note C_, 8
	notetype 12, 103
	note C_, 8
	note __, 16
	notetype 12, 160
	octave 5
	note G_, 16
	octave 6
	note C_, 16
	octave 5
	note B_, 8
	note G_, 8
	note E_, 8
	note G_, 8
	octave 6
	note C_, 16
	vibrato 0, 52
	notetype 12, 167
	note C_, 16
	loopchannel 0, Music_PokemonTower_branch_7f0ee


Music_PokemonTower_Ch3: ; 7f19a (1f:719a)
	vibrato 4, 17
	notetype 12, 19
	note __, 8
	octave 5
	note G_, 8

Music_PokemonTower_branch_7f1a2:
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 3
	note E_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note E_, 1
	note __, 7
	note G_, 1
	note __, 7
	note E_, 1
	note __, 7
	note B_, 1
	note __, 7
	note E_, 1
	note D#, 1
	octave 4
	note B_, 1
	note __, 5
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	octave 5
	note C_, 1
	note __, 7
	note C_, 1
	note __, 7
	note C_, 1
	note __, 7
	note C_, 1
	note __, 7
	octave 4
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	note B_, 1
	note __, 7
	octave 5
	note C_, 1
	note __, 7
	note C_, 1
	note __, 7
	note C_, 1
	note __, 7
	note C_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note E_, 1
	note __, 3
	note G_, 1
	note __, 3
	note F#, 1
	note __, 7
	note F#, 1
	note __, 7
	note D_, 1
	note __, 7
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 1
	note __, 7
	note E_, 1
	note __, 7
	note F_, 1
	note __, 7
	note F_, 1
	note __, 7
	note F#, 1
	note __, 7
	note F#, 1
	note __, 7
	note G_, 1
	note __, 15
	notetype 12, $1f
	db $f3, $21, $E2, $33, $28, $E1, $22, $FF, $22, $F7, $24, $22, $F7, $34, $24, $F7, $44
	octave 4
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	note G_, 1
	note __, 3
	note F#, 1
	note __, 3
	note F#, 1
	note __, 15
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	note G_, 1
	note __, 3
	note F#, 1
	note __, 3
	note F#, 1
	note __, 7
	notetype 12, 19
	octave 6
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 1
	note __, 15
	note E_, 1
	note __, 15
	note E_, 1
	note __, 15
	note E_, 1
	note __, 15
	note E_, 1
	note __, 15
	note E_, 1
	note __, 7
	octave 5
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	loopchannel 0, Music_PokemonTower_branch_7f1a2
; 0x7f243