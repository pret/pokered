Music_ViridianCity: ; f4000
	dbw $c0, Music_ViridianCity_Ch1
	dbw $01, Music_ViridianCity_Ch2
	dbw $02, Music_ViridianCity_Ch3
	dbw $03, Music_ViridianCity_Ch4
; f400c

Music_ViridianCity_Ch1: ; f400c
	tempo 157
	volume $77
	stereopanning $f
	dutycycle $2
	vibrato $12, $34
	notetype $c, $a7
	octave 3
	note F#, 1
	note __, 3
	note F#, 2
	note __, 4
	note F#, 2
	note __, 2
	note F#, 1
	note __, 1
	note F#, 4
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	note F#, 2
	note __, 4
	note F#, 2
	note __, 2
	note G_, 1
	note __, 1
	note __, 4
	note G_, 8
	note __, 4
Music_ViridianCity_branch_f4039: ; f4039
	callchannel Music_ViridianCity_branch_f40c5
	note __, 4
	callchannel Music_ViridianCity_branch_f40c5
	octave 4
	note C_, 4
	callchannel Music_ViridianCity_branch_f410f
	octave 4
	note B_, 2
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	note F#, 2
	note E_, 2
	note F#, 1
	note __, 1
	note A_, 1
	note __, 3
	note F#, 2
	note A_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note __, 2
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note F#, 1
	note __, 1
	intensity $87
	octave 5
	note F#, 4
	note F_, 4
	intensity $a7
	octave 3
	note G_, 6
	note B_, 8
	octave 4
	note E_, 2
	note __, 2
	note E_, 2
	octave 3
	note B_, 4
	note G_, 2
	note F#, 2
	note E_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 1
	note __, 1
	note F#, 1
	note __, 3
	note D_, 2
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note __, 2
	note F#, 2
	note A_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D#, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	callchannel Music_ViridianCity_branch_f410f
	octave 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note F#, 2
	note E_, 2
	note F#, 1
	note __, 1
	note A_, 1
	note __, 3
	note F#, 2
	note A_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note __, 2
	note E_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	note F#, 2
	note G_, 6
	note B_, 1
	note __, 1
	octave 4
	note E_, 4
	note F#, 2
	note G_, 6
	note E_, 2
	note __, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	note __, 2
	note F#, 6
	note D_, 4
	octave 3
	note A_, 4
	note F#, 4
	note G_, 1
	note __, 3
	note G_, 8
	note A#, 4
	loopchannel 0, Music_ViridianCity_branch_f4039
; f40c5

Music_ViridianCity_branch_f40c5: ; f40c5
	octave 3
	note A_, 1
	note __, 3
	note A_, 2
	note __, 4
	note A_, 2
	note __, 2
	note A_, 1
	note __, 1
	octave 4
	note C_, 4
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 3
	note G_, 2
	note __, 4
	note G_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 4
	note __, 2
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 3
	note D_, 2
	note __, 4
	note D_, 2
	note __, 2
	note D_, 1
	note __, 1
	octave 3
	note G_, 4
	note __, 2
	octave 4
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 4
	note C#, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 3
	note F#, 2
	note __, 4
	note F#, 2
	note __, 2
	note G_, 1
	note __, 1
	note __, 4
	note G_, 8
	endchannel
; f410f

Music_ViridianCity_branch_f410f: ; f410f
	octave 3
	note B_, 2
	note D_, 2
	note G_, 1
	note __, 1
	note B_, 1
	note __, 3
	note G_, 2
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	endchannel
; f4125

Music_ViridianCity_Ch2: ; f4125
	vibrato $10, $46
	dutycycle $1
	notetype $c, $b7
	stereopanning $f0
	octave 2
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 4
	note __, 4
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C#, 4
	octave 2
	note A_, 1
	note __, 1
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 4
	note __, 2
	note E_, 1
	note __, 1
	note __, 4
	note E_, 8
	note __, 4
Music_ViridianCity_branch_f414c: ; f414c
	callchannel Music_ViridianCity_branch_f41c0
	note __, 4
	callchannel Music_ViridianCity_branch_f41c0
	octave 2
	note F#, 4
	callchannel Music_ViridianCity_branch_f4201
	note G_, 4
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note D_, 4
	octave 2
	note B_, 2
	callchannel Music_ViridianCity_branch_f420b
	note __, 2
	note F#, 2
	note __, 2
	octave 3
	note C#, 1
	note __, 1
	note C#, 4
	note C_, 4
	callchannel Music_ViridianCity_branch_f4215
	note E_, 4
	note __, 2
	note B_, 1
	note __, 1
	note E_, 2
	note B_, 2
	note G_, 4
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 4
	note C_, 2
	note C#, 2
	note __, 2
	note D#, 2
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note D#, 2
	note C_, 2
	octave 2
	note A_, 2
	note F#, 2
	callchannel Music_ViridianCity_branch_f4201
	note G_, 4
	note __, 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 4
	note G_, 2
	callchannel Music_ViridianCity_branch_f420b
	note __, 2
	note F#, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note D#, 2
	callchannel Music_ViridianCity_branch_f4215
	note E_, 4
	note __, 2
	note A#, 1
	note __, 1
	note A#, 4
	note __, 2
	note G_, 1
	note __, 1
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 4
	note __, 2
	note D_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 8
	octave 1
	note A_, 4
	loopchannel 0, Music_ViridianCity_branch_f414c
; f41c0

Music_ViridianCity_branch_f41c0: ; f41c0
	octave 2
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 4
	note __, 4
	note D#, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 4
	octave 2
	note A_, 1
	note __, 1
	note E_, 4
	note __, 2
	note B_, 1
	note __, 1
	note B_, 4
	note __, 4
	note E_, 4
	note __, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note D_, 4
	octave 2
	note B_, 1
	note __, 1
	note G_, 4
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	note D_, 4
	note __, 4
	octave 2
	note A_, 4
	note __, 2
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 4
	note E_, 1
	note __, 1
	octave 2
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A_, 4
	note __, 2
	note E_, 1
	note __, 1
	note __, 4
	note E_, 8
	endchannel
; f4201

Music_ViridianCity_branch_f4201: ; f4201
	note G_, 4
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	note D_, 4
	octave 2
	note F_, 2
	note F#, 2
	endchannel
; f420b

Music_ViridianCity_branch_f420b: ; f420b
	note F#, 4
	note __, 2
	octave 3
	note C#, 1
	note __, 1
	note C#, 4
	octave 2
	note E_, 2
	note F_, 2
	endchannel
; f4215

Music_ViridianCity_branch_f4215: ; f4215
	octave 2
	note E_, 4
	note __, 2
	note B_, 1
	note __, 1
	note B_, 4
	note D_, 2
	note D#, 2
	endchannel
; f421e

Music_ViridianCity_Ch3: ; f421e
	vibrato $12, $24
	notetype $c, $13
	stereopanning $ff
	octave 4
	note A_, 1
	note __, 3
	note A_, 2
	note __, 4
	note A_, 2
	note __, 2
	note A_, 1
	note __, 1
	note A_, 4
	note __, 2
	octave 5
	note F#, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 4
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	note A_, 2
	note __, 4
	note A_, 2
	note __, 2
	octave 5
	note D_, 1
	note __, 1
	note __, 4
	note D_, 8
	note F#, 2
	note G_, 2
Music_ViridianCity_branch_f4246: ; f4246
	intensity $13
	callchannel Music_ViridianCity_branch_f42a2
	octave 5
	note F#, 2
	note G_, 2
	callchannel Music_ViridianCity_branch_f42a2
	note E_, 4
	vibrato $18, $25
	intensity $25
	note B_, 12
	note G_, 4
	octave 6
	note D_, 8
	note E_, 2
	note D_, 2
	note C#, 2
	octave 5
	note B_, 2
	note A_, 12
	note F#, 4
	note A_, 8
	note A_, 4
	note G#, 4
	note E_, 10
	note E_, 2
	note F#, 2
	note G_, 2
	note __, 2
	note G_, 2
	note F#, 4
	note E_, 4
	note G_, 4
	note F#, 12
	note D_, 4
	note A_, 4
	note __, 4
	octave 6
	note C_, 8
	octave 5
	note B_, 12
	octave 6
	note C#, 2
	note D_, 2
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 5
	note B_, 2
	note __, 2
	note A_, 10
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	note __, 2
	octave 5
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 12
	note G_, 2
	note A_, 2
	note A#, 6
	note A_, 2
	note __, 2
	note G_, 2
	note A#, 2
	note __, 2
	note A_, 14
	note __, 4
	note D_, 1
	note __, 3
	note D_, 8
	note E_, 4
	loopchannel 0, Music_ViridianCity_branch_f4246
; f42a2

Music_ViridianCity_branch_f42a2: ; f42a2
	octave 5
	note A_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F#, 2
	note __, 6
	note __, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note __, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	octave 4
	note B_, 2
	note __, 4
	note B_, 2
	note __, 2
	octave 5
	note G_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 4
	note B_, 1
	note __, 1
	note B_, 4
	octave 5
	note E_, 2
	note F#, 2
	note G_, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 2
	note __, 6
	note __, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note __, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note D_, 2
	octave 4
	note A_, 2
	note __, 4
	note A_, 2
	note __, 2
	octave 5
	note D_, 1
	note __, 1
	note __, 4
	note D_, 8
	endchannel
; f42df

Music_ViridianCity_Ch4: ; f42df
	togglenoise $3
	notetype $c
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f432c
Music_ViridianCity_branch_f42e9: ; f42e9
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f432c
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f432c
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f434b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f434b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f433b
	loopchannel 0, Music_ViridianCity_branch_f42e9
; f431d

Music_ViridianCity_branch_f431d: ; f431d
	note E_, 2
	note E_, 2
	note D_, 2
	note E_, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note E_, 2
	note D_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	endchannel
; f432c

Music_ViridianCity_branch_f432c: ; f432c
	note E_, 2
	note E_, 2
	note D_, 2
	note E_, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note E_, 2
	note F#, 4
	note D_, 2
	note D_, 2
	note A#, 2
	note A#, 2
	endchannel
; f433b

Music_ViridianCity_branch_f433b: ; f433b
	note D#, 2
	note F#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note F#, 2
	note D_, 4
	note D#, 2
	note F#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note D#, 2
	endchannel
; f434b

Music_ViridianCity_branch_f434b: ; f434b
	note D#, 2
	note F#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note F#, 2
	note D_, 4
	note D#, 2
	note F#, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note F#, 2
	endchannel
; f435b


