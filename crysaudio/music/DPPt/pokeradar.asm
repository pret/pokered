Music_PokeRadar::
	dbw $80, Music_PokeRadar_Ch1
	dbw $01, Music_PokeRadar_Ch2
	dbw $02, Music_PokeRadar_Ch3

Music_PokeRadar_Ch1:
	tempo $68
	volume $77
	tone $0001
	notetype $6, $91
	dutycycle 2
	octave 5
	note F_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 9
Music_PokeRadar_Loop1:
	notetype $C, $82
	octave 3
	note A#, 6
	octave 4
	note G#, 10
	octave 3
	note A#, 2
	octave 4
	note G#, 4
	note F_, 2
	intensity $86
	note C#, 12
	note D_, 6
	note D#, 6
	octave 3
	note A#, 6
	intensity $82
	octave 4
	note G#, 10
	octave 3
	note A#, 2
	octave 4
	note G#, 4
	note F_, 2
	intensity $86
	note D_, 12
	note C#, 6
	note E_, 6
	note F_, 4
	note E_, 4
	note D#, 4
	note D_, 12
	note E_, 4
	note D#, 4
	note D_, 4
	note C#, 12
	note D#, 4
	note D_, 4
	note C#, 4
	note C_, 12
	intensity $82
	octave 3
	note B_, 4
	intensity $72
	note B_, 4
	intensity $62
	note B_, 4
	intensity $52
	note B_, 4
	intensity $42
	note B_, 4
	intensity $32
	note B_, 14
	note __, 14
	loopchannel 0, Music_PokeRadar_Loop1
Music_PokeRadar_Ch2:
	notetype $6, $C1
	dutycycle 2
	octave 6
	note F_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	notetype $C, $C2
	note F_, 4
Music_PokeRadar_Loop2:
	intensity $C2
	dutycycle 1
	octave 3
	note A#, 6
	octave 4
	note G#, 10
	octave 3
	note A#, 2
	octave 4
	note G#, 4
	note F_, 2
	intensity $C7
	note C#, 12
	note D_, 6
	note D#, 6
	octave 3
	note A#, 6
	intensity $C2
	octave 4
	note G#, 10
	octave 3
	note A#, 2
	octave 4
	note G#, 4
	note F_, 2
	intensity $C7
	note D_, 12
	note C#, 6
	note E_, 6
	note F_, 4
	note E_, 4
	note D#, 4
	note D_, 12
	note E_, 4
	note D#, 4
	note D_, 4
	note C#, 12
	note D#, 4
	note D_, 4
	note C#, 4
	note C_, 12
	octave 3
	note B_, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_PokeRadar_Loop2
Music_PokeRadar_Ch3:
	notetype $C, $10
	note __, 6
Music_PokeRadar_Loop3:
	octave 2
	note A#, 6
	octave 3
	note G#, 4
	octave 2
	note A_, 1
	note __, 1
	note A#, 2
	note __, 2
	note A#, 2
	octave 3
	note G#, 2
	note __, 4
	octave 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	intensity $20
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	intensity $30
	note A#, 2
	intensity $10
	note F_, 6
	note A#, 6
	note F_, 2
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 10
	note __, 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	intensity $20
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	intensity $30
	note A#, 2
	intensity $10
	note F_, 4
	octave 3
	note C_, 2
	octave 2
	note F_, 10
	octave 3
	note C#, 1
	note __, 1
	note D_, 12
	octave 2
	note E_, 10
	octave 3
	note C_, 1
	note __, 1
	note C#, 12
	octave 2
	note D#, 10
	note B_, 1
	note __, 1
	octave 3
	note C_, 12
	octave 2
	note D#, 2
	note __, 8
	note D#, 12
	note __, 12
	note __, 14
	loopchannel 0, Music_PokeRadar_Loop3
