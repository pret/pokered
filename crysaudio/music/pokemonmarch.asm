Music_PokemonMarch: ; f6e23
	dbw $c0, Music_PokemonMarch_Ch1
	dbw $01, Music_PokemonMarch_Ch2
	dbw $02, Music_PokemonMarch_Ch3
	dbw $03, Music_PokemonMarch_Ch4
; f6e2f

Music_PokemonMarch_Ch1: ; f6e2f
	tempo 144
	volume $77
	stereopanning $f0
	dutycycle $3
	tone $0001
	notetype $c, $42
	octave 3
	note D_, 4
	intensity $62
	note D_, 4
	intensity $82
	note D_, 4
	intensity $a2
	note D_, 4
	notetype $8, $a2
Music_PokemonMarch_branch_f6e4c: ; f6e4c
	callchannel Music_PokemonMarch_branch_f6eae
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	callchannel Music_PokemonMarch_branch_f6eae
	note D#, 2
	note C_, 2
	note D#, 2
	note G_, 2
	callchannel Music_PokemonMarch_branch_f6eae
	note C_, 2
	note C_, 2
	note D#, 2
	note C_, 2
	callchannel Music_PokemonMarch_branch_f6eae
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	callchannel Music_PokemonMarch_branch_f6eb8
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel Music_PokemonMarch_branch_f6eb8
	note F_, 2
	note D_, 2
	note F_, 2
	note A_, 2
	callchannel Music_PokemonMarch_branch_f6eb8
	note D_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel Music_PokemonMarch_branch_f6eb8
	note F_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	callchannel Music_PokemonMarch_branch_f6eb8
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel Music_PokemonMarch_branch_f6eae
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	octave 2
	note A#, 2
	note A#, 2
	octave 3
	note C_, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	note __, 4
	note D#, 2
	note __, 4
	octave 3
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 4
	note F_, 2
	note G_, 4
	note A#, 2
	loopchannel 0, Music_PokemonMarch_branch_f6e4c
; f6eae

Music_PokemonMarch_branch_f6eae: ; f6eae
	note __, 4
	octave 3
	note D#, 1
	note D_, 1
	note D#, 2
	note __, 2
	note D#, 2
	note D#, 2
	note __, 2
	endchannel
; f6eb8

Music_PokemonMarch_branch_f6eb8: ; f6eb8
	note __, 4
	note F_, 1
	note E_, 1
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note __, 2
	endchannel
; f6ec1

Music_PokemonMarch_Ch2: ; f6ec1
	dutycycle $2
	vibrato $10, $22
	notetype $c, $b2
	octave 3
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
Music_PokemonMarch_branch_f6ece: ; f6ece
	notetype $c, $b7
	octave 3
	note G#, 12
	notetype $8, $b3
	note D#, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 2
	note __, 16
	note __, 6
	notetype $8, $b7
	octave 3
	note G#, 16
	notetype $8, $b3
	note D#, 2
	note G#, 4
	note A#, 2
	octave 4
	note C_, 4
	note C#, 2
	note C_, 4
	note C#, 2
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	notetype $8, $b7
	note A#, 16
	notetype $8, $b3
	note A#, 2
	note F_, 2
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note __, 16
	note __, 6
	notetype $8, $b7
	octave 3
	note A#, 16
	notetype $8, $b3
	note F_, 2
	note A#, 4
	octave 4
	note C_, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	notetype $8, $b7
	note A#, 16
	notetype $8, $b3
	note A_, 2
	note A#, 4
	octave 4
	note C_, 2
	notetype $8, $b7
	octave 3
	note G#, 16
	notetype $8, $b3
	note A#, 2
	note G#, 4
	note F_, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note __, 2
	octave 4
	note D#, 1
	note D_, 1
	note D#, 1
	note __, 5
	octave 3
	note G_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note __, 2
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note __, 5
	loopchannel 0, Music_PokemonMarch_branch_f6ece
; f6f4d

Music_PokemonMarch_Ch3: ; f6f4d
	stereopanning $f
	notetype $c, $16
	note __, 16
	notetype $8, $16
Music_PokemonMarch_branch_f6f56: ; f6f56
	callchannel Music_PokemonMarch_branch_f6fe8
	note __, 2
	octave 4
	note D#, 2
	callchannel Music_PokemonMarch_branch_f6fe8
	octave 4
	note G#, 2
	note D#, 2
	callchannel Music_PokemonMarch_branch_f6fe8
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note G_, 2
	note G#, 2
Music_PokemonMarch_branch_f6f7b: ; f6f7b
	octave 3
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 1
	octave 4
	note F_, 2
	note __, 1
	loopchannel 3, Music_PokemonMarch_branch_f6f7b
	octave 3
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note G_, 2
	note A#, 2
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note C_, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note __, 4
	octave 3
	note D#, 2
	note __, 4
	octave 4
	note G_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note __, 2
	note D#, 2
	note F_, 2
	note __, 2
	note G#, 2
	loopchannel 0, Music_PokemonMarch_branch_f6f56
; f6fe8

Music_PokemonMarch_branch_f6fe8: ; f6fe8
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G_, 2
	endchannel
; f6ffa

Music_PokemonMarch_Ch4: ; f6ffa
	stereopanning $f0
	togglenoise $5
	notetype $8
	callchannel Music_PokemonMarch_branch_f704c
Music_PokemonMarch_branch_f7003: ; f7003
	callchannel Music_PokemonMarch_branch_f7042
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 5
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $8
	callchannel Music_PokemonMarch_branch_f7042
	callchannel Music_PokemonMarch_branch_f704c
	callchannel Music_PokemonMarch_branch_f7042
	callchannel Music_PokemonMarch_branch_f704c
	callchannel Music_PokemonMarch_branch_f7042
	callchannel Music_PokemonMarch_branch_f704c
	callchannel Music_PokemonMarch_branch_f7042
	callchannel Music_PokemonMarch_branch_f704c
	note C#, 4
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 6
	note C_, 2
	notetype $4
	note __, 5
	notetype $6
	note D_, 1
	note D_, 1
	notetype $8
	callchannel Music_PokemonMarch_branch_f704c
	loopchannel 0, Music_PokemonMarch_branch_f7003
; f7042

Music_PokemonMarch_branch_f7042: ; f7042
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 2
	note C_, 4
	note D_, 2
	note D_, 2
	note C#, 2
	note C#, 2
	endchannel
; f704c

Music_PokemonMarch_branch_f704c: ; f704c
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 4
	note C_, 4
	note C#, 2
	note D_, 2
	note C#, 2
	endchannel
; f7055


