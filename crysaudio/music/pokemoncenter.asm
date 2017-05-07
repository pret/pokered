Music_PokemonCenter: ; ed5c6
	dbw $c0, Music_PokemonCenter_Ch1
	dbw $01, Music_PokemonCenter_Ch2
	dbw $02, Music_PokemonCenter_Ch3
	dbw $03, Music_PokemonCenter_Ch4
; ed5d2

Music_PokemonCenter_Ch1: ; ed5d2
	tempo 152
	volume $77
	dutycycle $2
	vibrato $a, $14
	tone $0001
Music_PokemonCenter_branch_ed5df: ; ed5df
	stereopanning $f
	notetype $c, $83
	octave 3
	note F#, 2
	note F_, 2
	note F#, 2
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note F#, 2
	note F_, 2
	note F#, 2
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	notetype $c, $b4
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	stereopanning $f0
	note F#, 2
	note E_, 2
	note D_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 4
	note C#, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 8
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 4
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 4
	note G_, 2
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	loopchannel 0, Music_PokemonCenter_branch_ed5df
; ed671

Music_PokemonCenter_Ch2: ; ed671
	vibrato $10, $25
Music_PokemonCenter_branch_ed674: ; ed674
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6d1
	stereopanning $f
	notetype $c, $a5
	octave 3
	note A_, 4
	note E_, 4
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6e4
	note D_, 2
	note F#, 6
	stereopanning $f
	notetype $c, $a5
	octave 3
	note A_, 4
	note E_, 4
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6d1
	stereopanning $f
	notetype $c, $a5
	octave 3
	note A_, 4
	note E_, 4
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6e4
	note D_, 8
	stereopanning $f
	notetype $c, $a5
	octave 3
	note D_, 4
	note E_, 4
	notetype $c, $c6
	octave 4
	note F#, 8
	note A_, 8
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 8
	note C#, 8
	note E_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	note F#, 8
	note A_, 8
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 8
	note A_, 4
	note G_, 2
	note F#, 2
	note G_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	loopchannel 0, Music_PokemonCenter_branch_ed674
; ed6d1

Music_PokemonCenter_branch_ed6d1: ; ed6d1
	dutycycle $2
	notetype $c, $c2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	intensity $c3
	note A_, 4
	note G_, 4
	note F#, 2
	note E_, 2
	note C#, 6
	endchannel
; ed6e4

Music_PokemonCenter_branch_ed6e4: ; ed6e4
	notetype $c, $c2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	intensity $c3
	note F#, 4
	note E_, 4
	note C#, 2
	endchannel
; ed6f3

Music_PokemonCenter_Ch3: ; ed6f3
	notetype $c, $28
Music_PokemonCenter_branch_ed6f6: ; ed6f6
	stereopanning $f0
	octave 3
	note D_, 1
	note __, 5
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	callchannel Music_PokemonCenter_branch_ed76f
	callchannel Music_PokemonCenter_branch_ed778
	note F#, 1
	note __, 5
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 5
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	callchannel Music_PokemonCenter_branch_ed76f
	callchannel Music_PokemonCenter_branch_ed778
	note D_, 1
	note __, 5
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed783
	note G_, 1
	note __, 5
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note E_, 1
	note __, 5
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F#, 1
	note __, 5
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	callchannel Music_PokemonCenter_branch_ed783
	note G_, 1
	note __, 5
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note E_, 1
	note __, 5
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F#, 1
	note __, 5
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	loopchannel 0, Music_PokemonCenter_branch_ed6f6
; ed76f

Music_PokemonCenter_branch_ed76f: ; ed76f
	note E_, 1
	note __, 5
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	endchannel
; ed778

Music_PokemonCenter_branch_ed778: ; ed778
	note E_, 1
	note __, 5
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel
; ed783

Music_PokemonCenter_branch_ed783: ; ed783
	note F#, 1
	note __, 5
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	endchannel
; ed78c

Music_PokemonCenter_Ch4: ; ed78c
	togglenoise $3
	notetype $c
	stereopanning $ff
Music_PokemonCenter_branch_ed792: ; ed792
	note G_, 6
	note G_, 4
	note G_, 2
	note G_, 2
	note G_, 2
	loopchannel 0, Music_PokemonCenter_branch_ed792
; ed79b


