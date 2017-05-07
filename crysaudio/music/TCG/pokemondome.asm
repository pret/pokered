Music_TCGPokemonDome:
	db $C0
	dw Music_TCGPokemonDome_Ch1
	db $01
	dw Music_TCGPokemonDome_Ch2
	db $02
	dw Music_TCGPokemonDome_Ch3
	db $03
	dw Music_TCGPokemonDome_Ch4

Music_TCGPokemonDome_Ch1: 
	notetype0 7
	vibrato 20, $33
	notetype2 8
	octave 2
	dutycycle 0
	notetype1 10
	notetype0 1
	note G_, 5
	note A_, 5
	note B_, 4
	inc_octave
	note C_, 5
	note D_, 5
	note E_, 4
	note C_, 5
	note D_, 5
	note E_, 4
	note F_, 5
	note G_, 5
	note A_, 4
	note F_, 5
	note G_, 5
	note A_, 4
	note B_, 5
	inc_octave
	note C_, 5
	note D_, 4
	dec_octave
	note B_, 5
	inc_octave
	note C_, 5
	note D_, 4
	note E_, 5
	note F_, 5
	note G_, 4
	dutycycle 1
	notetype1 8
	dec_octave
	notetype0 1
	note C_, 11
	notetype1 3
	note C_, 3
	notetype1 8
	note C_, 11
	notetype1 3
	note C_, 10
	note __, 7
	notetype1 8
	note C_, 4
	notetype1 3
	note C_, 3
	notetype1 8
	note C_, 4
	notetype1 3
	note C_, 3
	notetype1 8
	note C_, 11
	notetype1 3
	note C_, 3
	notetype1 8
	note C_, 11
	notetype1 3
	note C_, 10
	notetype0 7
	note __, 3
	notetype1 8
	notetype0 1
	note D_, 11
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 11
	notetype1 3
	note D_, 10
	note __, 7
	notetype1 8
	note D_, 4
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 4
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 11
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 11
	notetype1 3
	note D_, 3
.MainLoop
	notetype0 7
	dutycycle 1
	notetype1 10
	octave 2
	note G_, 4
	inc_octave
	dutycycle 1
	notetype1 8
	notetype0 1
	note E_, 11
	notetype1 3
	note E_, 3
	notetype1 8
	notetype0 1
	note E_, 11
	notetype1 3
	note E_, 10
	note __, 7
	notetype1 8
	note E_, 4
	notetype1 3
	note E_, 3
	notetype1 8
	note E_, 4
	notetype1 3
	note E_, 3
	notetype1 8
	note E_, 11
	notetype1 3
	note E_, 3
	notetype1 8
	note E_, 11
	notetype1 3
	note E_, 10
	notetype0 7
	note __, 3
	notetype1 8
	notetype0 1
	note D_, 11
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 11
	notetype1 3
	note D_, 10
	note __, 7
	notetype0 1
	notetype1 8
	note D_, 4
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 4
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 11
	notetype1 3
	note D_, 3
	notetype1 8
	note D_, 11
	notetype1 3
	note D_, 3
	dutycycle 0
	notetype1 10
	dec_octave
	notetype0 1
	note B_, 4
	inc_octave
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	notetype0 7
	inc_octave
	note C_, 12
	dec_octave
	note G_, 1
	notetype1 3
	note G_, 1
	note __, 1
	inc_octave
	notetype1 10
	note C_, 1
	note D_, 10
	notetype1 3
	note D_, 2
	notetype1 10
	note G_, 3
	notetype1 3
	note G_, 1
	notetype1 10
	note F_, 10
	notetype1 3
	note F_, 2
	notetype1 10
	note C_, 3
	notetype1 3
	note C_, 1
	notetype1 10
	note F_, 10
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 10
	note D_, 3
	notetype1 3
	note D_, 1
	notetype1 10
	note E_, 12
	dec_octave
	note G_, 1
	notetype1 3
	note G_, 1
	note __, 1
	inc_octave
	notetype1 10
	note C_, 1
	note D_, 8
	dec_octave
	note A_, 4
	inc_octave
	note D_, 3
	notetype1 3
	note D_, 1
	notetype1 10
	note C_, 14
	notetype1 3
	note C_, 2
	dec_octave
	notetype1 10
	note B_, 10
	notetype1 3
	note B_, 2
	notetype1 10
	note G_, 4
	note A_, 12
	note B_, 1
	notetype1 3
	note B_, 2
	inc_octave
	notetype1 10
	note C_, 1
	note D_, 8
	note E_, 4
	note F_, 4
	note G_, 8
	note G_, 8
	note G_, 8
	notetype1 3
	note G_, 2
	notetype1 10
	note F_, 2
	note E_, 2
	notetype1 3
	note E_, 1
	notetype1 10
	notetype0 1
	note E_, 5
	notetype1 3
	note E_, 2
	notetype0 7
	notetype1 10
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	dec_octave
	notetype1 10
	note A_, 1
	inc_octave
	note C_, 8
	note G_, 1
	notetype1 3
	note G_, 2
	notetype1 10
	note F_, 1
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	dec_octave
	notetype1 10
	note A_, 1
	inc_octave
	note C_, 8
	note G_, 1
	notetype1 3
	note G_, 2
	notetype1 10
	note F_, 1
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	dec_octave
	notetype1 10
	note G#, 1
	inc_octave
	note C_, 12
	note C_, 8
	note D_, 8
	note C_, 8
	note C_, 8
	note C_, 12
	loopchannel 0, .MainLoop


Music_TCGPokemonDome_Ch2: 
	notetype0 7
	vibrato 20, $33
	notetype2 8
	octave 1
	dutycycle 0
	notetype1 8
	notetype0 1
	note B_, 5
	inc_octave
	note C_, 5
	note D_, 4
	note E_, 5
	note F_, 5
	note G_, 4
	note E_, 5
	note F_, 5
	note G_, 4
	note A_, 5
	note B_, 5
	inc_octave
	note C_, 4
	dec_octave
	note A_, 5
	note B_, 5
	inc_octave
	note C_, 4
	note D_, 5
	note E_, 5
	note F_, 4
	note D_, 5
	note E_, 5
	note F_, 4
	note G_, 5
	note A_, 5
	note B_, 4
.MainLoop
	dutycycle 1
	notetype1 7
	octave 3
	notetype0 1
	note E_, 11
	notetype1 3
	note E_, 3
	notetype1 7
	note E_, 11
	notetype1 3
	note E_, 10
	note __, 7
	notetype1 7
	note E_, 4
	notetype1 3
	note E_, 3
	notetype1 7
	note E_, 4
	notetype1 3
	note E_, 3
	notetype1 7
	note E_, 11
	notetype1 3
	note E_, 3
	notetype1 7
	note E_, 11
	notetype1 3
	note E_, 10
	notetype0 7
	note __, 3
	callchannel Branch_f9554
	notetype0 7
	note __, 4
	notetype1 7
	notetype0 1
	note G_, 11
	notetype1 3
	note G_, 3
	notetype1 7
	note G_, 11
	notetype1 3
	note G_, 10
	note __, 7
	notetype1 7
	note G_, 4
	notetype1 3
	note G_, 3
	notetype1 7
	note G_, 4
	notetype1 3
	note G_, 3
	notetype1 7
	note G_, 11
	notetype1 3
	note G_, 3
	notetype1 7
	note G_, 11
	notetype1 3
	note G_, 10
	notetype0 7
	note __, 3
	callchannel Branch_f9554
	dutycycle 0
	notetype1 8
	dec_octave
	notetype0 1
	note G_, 4
	note A_, 3
	note B_, 4
	inc_octave
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note F#, 3
	notetype0 7
	note G_, 10
	note F_, 1
	note __, 1
	note E_, 1
	notetype1 2
	note E_, 1
	note __, 1
	notetype1 7
	note G_, 1
	note G_, 10
	note A_, 2
	note B_, 2
	note G_, 2
	inc_octave
	note C_, 10
	note __, 2
	dec_octave
	note A_, 3
	note __, 1
	note G#, 10
	note A#, 1
	note __, 1
	note G#, 3
	note __, 1
	note G_, 8
	inc_octave
	note C_, 4
	dec_octave
	note E_, 4
	note F#, 8
	note F#, 4
	notetype2 6
	note F#, 3
	notetype2 8
	notetype0 1
	note F#, 5
	note __, 2
	notetype0 7
	note F_, 14
	note __, 2
	dec_octave
	note G_, 1
	note A_, 1
	note B_, 1
	inc_octave
	note C_, 1
	note D_, 1
	dec_octave
	note B_, 1
	inc_octave
	note C_, 1
	note D_, 1
	note E_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note F_, 1
	note A_, 1
	note B_, 1
	dutycycle 1
	notetype1 8
	notetype0 1
.Loop1
	note F_, 5
	note C_, 5
	dec_octave
	note A_, 4
	inc_octave
	note C_, 5
	dec_octave
	note A_, 5
	note F_, 4
	inc_octave
	loopchannel 4, .Loop1
.Loop2
	note G#, 5
	note F_, 5
	note C_, 4
	note F_, 5
	note C_, 5
	dec_octave
	note G#, 4
	inc_octave
	loopchannel 4, .Loop2
.Loop3
	inc_octave
	note D_, 5
	dec_octave
	note B_, 5
	note G_, 4
	note B_, 5
	note G_, 5
	note D_, 4
	loopchannel 4, .Loop3
.Loop4
	inc_octave
	note C#, 5
	dec_octave
	note A#, 5
	note G_, 4
	note A#, 5
	note G_, 5
	note E_, 4
	loopchannel 3, .Loop4
	inc_octave
	note C#, 5
	dec_octave
	note C#, 5
	note E_, 4
	note G_, 5
	note A#, 5
	inc_octave
	note C#, 4
	dutycycle 0
	notetype1 8
	notetype0 7
.Loop5
	note C_, 1
	notetype1 2
	note C_, 1
	note __, 1
	notetype1 7
	dec_octave
	note F_, 1
	note A_, 8
	inc_octave
	note E_, 1
	notetype1 2
	note E_, 1
	note __, 1
	notetype1 7
	note D_, 1
	loopchannel 2, .Loop5
	note C_, 1
	notetype1 2
	note C_, 1
	note __, 1
	dec_octave
	notetype1 7
	note F_, 1
	note G#, 12
	note C_, 1
	dec_octave
	note F_, 1
	note G#, 1
	inc_octave
	note C_, 1
	note F_, 1
	dec_octave
	note G#, 1
	inc_octave
	note C_, 1
	note F_, 1
	note G#, 1
	note C_, 1
	note F_, 1
	note G#, 1
	inc_octave
	note C_, 1
	dec_octave
	note F_, 1
	note G#, 1
	note B_, 1
	loopchannel 0, .MainLoop

Branch_f9554:
	notetype0 1
	notetype1 7
	note F_, 11
	notetype1 3
	note F_, 3
	notetype1 7
	note F_, 11
	notetype1 3
	note F_, 10
	note __, 7
	notetype1 7
	note F_, 4
	notetype1 3
	note F_, 3
	notetype1 7
	note F_, 4
	notetype1 3
	note F_, 3
.Loop6
	notetype1 7
	note F_, 11
	notetype1 3
	note F_, 3
	loopchannel 2, .Loop6
	endchannel


Music_TCGPokemonDome_Ch3: 
	notetype0 7
	notetype1 1
	notetype2 11
	octave 2
	notetype0 1
.Loop1
	note G_, 5
	note G_, 5
	note G_, 4
	loopchannel 8, .Loop1
	notetype0 7
.MainLoop
	inc_octave
	note C_, 2
	note C_, 2
	note __, 2
	note C_, 1
	note C_, 1
	callchannel Branch_f9613
	octave 2
	note C_, 2
	inc_octave
	note C_, 2
	note __, 2
	note C_, 1
	note C_, 1
	callchannel Branch_f9613
	octave 3
	note C_, 2
	note C_, 2
	note __, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 2
	note __, 2
	dec_octave
	note G_, 2
	note B_, 2
	note B_, 2
	note __, 2
	note B_, 1
	note B_, 1
	note B_, 2
	note B_, 2
	note __, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 2
	note __, 2
	note F_, 2
	note G#, 2
	note G#, 2
	note __, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note __, 2
	note F_, 2
.Loop2
	note G_, 2
	note G_, 2
	note __, 2
	note G_, 1
	note G_, 1
	loopchannel 2, .Loop2
.Loop3
	note F#, 2
	note F#, 2
	note __, 2
	note F#, 1
	note F#, 1
	loopchannel 2, .Loop3
.Loop4
	note G_, 2
	note G_, 2
	note __, 2
	note G_, 1
	note G_, 1
	loopchannel 4, .Loop4
.Loop5
	note F_, 2
	note F_, 2
	note __, 2
	note F_, 1
	note F_, 1
	loopchannel 4, .Loop5
.Loop6
	note E_, 2
	note E_, 2
	note __, 2
	note E_, 1
	note E_, 1
	loopchannel 2, .Loop6
.Loop7
	note A_, 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	loopchannel 2, .Loop7
.Loop8
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 1
	note D_, 1
	loopchannel 4, .Loop8
.Loop9
	note G_, 2
	note G_, 2
	note __, 2
	note G_, 1
	note G_, 1
	loopchannel 4, .Loop9
	loopchannel 0, .MainLoop

Branch_f9613:
	octave 3
	note C_, 2
	note C_, 2
	note __, 2
	dec_octave
	note G_, 2
	inc_octave
	note C_, 2
	note C_, 2
	note __, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 2
	dec_octave
	note G_, 2
	note G_, 2
	endchannel


Music_TCGPokemonDome_Ch4: 
	togglenoise $06
	notetype 7
	octave 1
	note F_, 8
	notetype 1
	note C#, 4
	note D_, 3
.Loop1
	note D_, 4
	note D_, 3
	loopchannel 7, .Loop1
.MainLoop
.Loop2
	notetype 7
	note C#, 2
	note C#, 2
	note __, 2
	notetype 1
	note C#, 4
	note D_, 3
	note D_, 4
	note D_, 3
	loopchannel 2, .Loop2
	loopchannel 0, .MainLoop

