
Music_TCG_BattleTheme1:
	dbw $c0, Music_TCG_BattleTheme1_Ch1
	dbw $01, Music_TCG_BattleTheme1_Ch2
	dbw $02, Music_TCG_BattleTheme1_Ch3
	dbw $03, Music_TCG_BattleTheme1_Ch4


Music_TCG_BattleTheme1_Ch1: ; f532a (3d:532a)
	stereopanning $f
	tone $0002
	notetype $c, $b2
	forceoctave 2

	tempo 20* 7
	;musicdc 17
	vibrato 20, 8
	;musice8 8	
	dutycycle 2
.MainLoop
	octave 2
rept 7
	note __, 16
endr
	note __, 9
rept 2
	note __, 3
	callchannel  Branch_f54f9
	volume 160
	tempo 20* 1
	note F_, 4
	note F#, 3
	;no_fade
	tempo 20* 7
	note F#, 1
	volume 55
	note F#, 1
	decoctave
	volume 160
	note A_, 1
	note __, 2
	incoctave
	volume 160
	note D_, 10
	volume 55
	note D_, 12
	callchannel  Branch_f54f9
	volume 160
	note F#, 2
	volume 55
	note F#, 1
	volume 160
	note A_, 13
	volume 55
	note A_, 10
	volume 160
	note F#, 1
	volume 55
	note F#, 1
	volume 160
	note F#, 1
	note G_, 1
	note A_, 1
	volume 55
	note A_, 1
	volume 160
	tempo 20* 1
	note A#, 4
	note B_, 3
	;no_fade
	tempo 20* 7
	note B_, 15
	volume 55
	note B_, 4
	volume 160
	tempo 20* 1
	note A#, 4
	note B_, 3
	;no_fade
	tempo 20* 7
	note B_, 3
	note A_, 3
	volume 55
	note A_, 1
	volume 160
	note G_, 2
	volume 55
	note G_, 2
	volume 160
	tempo 20* 1
	note G#, 4
	note A_, 3
	;no_fade
	tempo 20* 7
	note A_, 15
	volume 55
	note A_, 4
	volume 160
	tempo 20* 1
	note G#, 4
	note A_, 3
	;no_fade
	tempo 20* 7
	note A_, 3
	note G_, 4
	note F#, 2
	volume 55
	note F#, 2
	volume 160
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 15
	volume 55
	note G_, 4
	volume 160
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 3
	note F#, 4
	note E_, 3
	volume 55
	note E_, 1
	volume 160
	tempo 20* 1
	note D#, 4
	note E_, 3
	;no_fade
	tempo 20* 7
	note E_, 1
	volume 55
	note E_, 1
	volume 160
	note D_, 13
	volume 55
	note D_, 9
	decoctave
endr
	incoctave
	dutycycle 1
	volume 160
	tempo 20* 1
	note C#, 4
	note D_, 3
	;no_fade
	tempo 20* 7
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel  Branch_f5538
	tempo 20* 1
	note G#, 4
	note A_, 3
	;no_fade
	tempo 20* 7
	note A_, 1
	volume 55
	note A_, 1
	volume 160
	note F#, 5
	volume 55
	note F#, 1
	decoctave
	volume 160
	note A_, 1
	incoctave
	tempo 20* 1
	note D_, 4
	volume 55
	note D_, 3
	volume 160
	note F#, 4
	volume 55
	note F#, 3
	volume 160
	note A_, 4
	volume 55
	note A_, 3
	tempo 20* 7
	note __, 3
	decoctave
	dutycycle 1
	volume 160
	;musice8 8
rept 3
	note A_, 1
	note __, 2
endr
	incoctave
	tempo 20* 1
	note C#, 4
	note D_, 3
	;no_fade
	tempo 20* 7
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel  Branch_f5538
	tempo 20* 1
	note G#, 4
	note A_, 3
	;no_fade
	tempo 20* 7
	note A_, 5
	;no_fade
	note A_, 10
	;no_fade
	note A_, 6
	volume 55
	note A_, 2
	incoctave
	volume 160
	tempo 20* 1
	note C#, 4
	note D_, 3
	;no_fade
	tempo 20* 7
	note D_, 2
	note C#, 1
	volume 55
	note C#, 2
	decoctave
	volume 160
	note B_, 1
	volume 55
	note B_, 1
	volume 160
	tempo 20* 1
	note A#, 4
	note B_, 3
	;no_fade
	tempo 20* 7
	note B_, 1
	volume 55
	note B_, 1
	volume 160
	note A_, 13
	;no_fade
	note A_, 6
	volume 55
	note A_, 2
	decoctave
	volume 121
	tempo 20* 1
	note A_, 5
	incoctave
	note C#, 5
	note E_, 4
	note A_, 5
	incoctave
	note C#, 5
	note E_, 4
	decoctave
	note C#, 5
	note E_, 5
	note A_, 4
	incoctave
	note C#, 5
	note E_, 5
	note A_, 4
	decoctave
	callchannel  Branch_f5580
	volume 160
	note A_, 2
	;no_fade
	note A_, 8
	;no_fade
	note A_, 8
	;no_fade
	note A_, 6
	dutycycle 1
	volume 160
	tempo 20* 1
	decoctave
	note B_, 4
	incoctave
	note C_, 3
	tempo 20* 7
	note C#, 1
	note __, 1
	note C#, 1
	note D_, 2
	note E_, 2
	note G_, 2
	dutycycle 2
	callchannel  Branch_f5580
	volume 160
	tempo 20* 1
	note G#, 4
	note A_, 3
	;no_fade
	tempo 20* 7
	note A_, 5
	note G_, 2
	note F#, 2
	volume 55
	note F#, 2
	volume 160
	note E_, 2
	volume 55
	note E_, 2
	volume 160
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 5
	note F#, 2
	note E_, 2
	volume 55
	note E_, 2
	volume 160
	note D_, 2
	volume 55
	note D_, 2
	volume 160
	note D_, 8
	;no_fade
	note D_, 8
	note D_, 8
	;no_fade
	note D_, 8
	volume 55
	note D_, 2
	volume 160
	note D_, 12
	volume 55
	note D_, 2
	volume 160
	note D_, 6
	;no_fade
	note D_, 8
	note __, 4
	loopchannel 0, .MainLoop

Branch_f54f9:
	octave 2
	volume 160
	note A_, 1
	note B_, 1
	incoctave
	note D_, 1
	volume 55
	note D_, 1
	volume 160
	tempo 20* 1
	note F_, 4
	note F#, 3
	;no_fade
	tempo 20* 7
	note F#, 10
	volume 55
	note F#, 1
	volume 160
	note D_, 3
	volume 55
	note D_, 1
	volume 160
	tempo 20* 1
	note D#, 4
	note E_, 3
	;no_fade
	tempo 20* 7
	note E_, 5
	volume 55
	note E_, 2
	volume 160
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 2
	note F#, 1
	volume 55
	note F#, 2
	volume 160
	note E_, 1
	volume 55
	note E_, 1
	endchannel

Branch_f5538:
	note C_, 1
	note __, 2
	decoctave
	note G_, 1
	note __, 2
	note G_, 1
	note __, 2
	dutycycle 2
	volume 160
	note G_, 1
	incoctave
	tempo 20* 1
	note C_, 4
	volume 55
	note C_, 3
	volume 160
	note E_, 4
	volume 55
	note E_, 3
	volume 160
	note G_, 4
	volume 55
	note G_, 3
	tempo 20* 7
	note __, 3
	dutycycle 1
	volume 160
	;musice8 8
	decoctave
rept 3
	note G_, 1
	note __, 2
endr
	incoctave
	dutycycle 2
	volume 160
	tempo 20* 1
	note A#, 4
	note B_, 3
	;no_fade
	tempo 20* 7
	note B_, 2
	note A_, 1
	volume 55
	note A_, 1
	volume 160
	note G_, 1
	volume 55
	note G_, 1
	volume 160
	endchannel

Branch_f5580:
	tempo 20* 1
	volume 160
	note F_, 4
	note F#, 3
	;no_fade
	tempo 20* 7
	note F#, 9
	volume 55
	note F#, 2
	volume 160
	note G_, 1
	volume 55
	note G_, 1
	volume 160
	note A_, 1
	volume 55
	note A_, 1
	volume 160
	note B_, 2
	volume 55
	note B_, 2
	incoctave
	volume 160
	tempo 20* 1
	note F_, 4
	note F#, 3
	;no_fade
	tempo 20* 7
	note F#, 7
	note E_, 1
	volume 55
	note E_, 1
	volume 160
	note D_, 1
	volume 55
	note D_, 1
	volume 160
	note C#, 2
	volume 55
	note C#, 1
	decoctave
	volume 160
	note A_, 9
	note F#, 1
	volume 55
	note F#, 1
	volume 160
	tempo 20* 1
	note A#, 4
	note B_, 3
	;no_fade
	tempo 20* 7
	note B_, 8
	volume 55
	note B_, 1
	volume 160
	note A_, 4
	note G_, 4
	note F#, 10
	note G_, 1
	volume 55
	note G_, 1
	volume 160
	note A_, 1
	volume 55
	note A_, 1
	volume 160
	note D_, 10
	note E_, 2
	note F#, 2
	volume 55
	note F#, 2
	endchannel


Music_TCG_BattleTheme1_Ch2: ; f55e7 (3d:55e7)
	forceoctave 2
	stereopanning $f
	tone $0001
	notetype $c, $c2
	tempo 20* 7
	;musicdc 17
	vibrato $12, $15;vibrato 20, 8
	;musice8 8
.MainLoop
	dutycycle 1
	volume 144
	octave 2
rept 4
rept 3
	note D_, 1
	note __, 2
endr
	note __, 1
	decoctave
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	incoctave
endr
rept 4
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 2
	callchannel  Branch_f59f9
endr
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	incoctave
	volume 162
	;musice8 6
	note D_, 2
	callchannel  Branch_f59f9
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	incoctave
	volume 162
	;musice8 6
	note C_, 2
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	decoctave
	note A_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 162
	;musice8 6
	note G_, 1
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note B_, 1
	note __, 2
	incoctave
rept 3
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	incoctave
	volume 162
	;musice8 6
	note D_, 2
	callchannel  Branch_f59f9
endr
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	incoctave
	volume 162
	;musice8 6
	note C_, 2
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	decoctave
	note A_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 162
	;musice8 6
	note G_, 1
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note B_, 1
	note __, 2
	incoctave
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	incoctave
	volume 162
	;musice8 6
	note D_, 2
	callchannel  Branch_f59f9
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	incoctave
	volume 162
	;musice8 6
	note D_, 2
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 2
	dutycycle 1
	volume 144
	;musice8 8
	note F#, 1
	note __, 1
rept 2
	note G_, 1
	note __, 2
	note G_, 1
	dutycycle 2
	volume 162
	;musice8 6
	note G_, 2
	dutycycle 1
	volume 144
	;musice8 8
	note G_, 1
	note __, 3
	note D_, 1
	note __, 1
	dutycycle 2
	volume 162
	;musice8 6
	note G_, 1
	dutycycle 1
	volume 144
	;musice8 8
	note E_, 1
	note __, 2
endr
	note F#, 1
	note __, 2
	note F#, 1
	dutycycle 2
	volume 162
	;musice8 6
	incoctave
	note C#, 2
	callchannel  Branch_f5a17
	octave 2
	note F#, 1
	note __, 2
	note F#, 1
	incoctave
	dutycycle 2
	volume 162
	;musice8 6
	note E_, 2
	callchannel  Branch_f5a17
	note E_, 1
	note __, 2
	note E_, 1
	dutycycle 2
	volume 162
	;musice8 6
	note G_, 2
	dutycycle 1
	volume 144
	;musice8 8
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	dutycycle 2
	volume 162
	;musice8 6
	note B_, 1
	dutycycle 1
	volume 144
	;musice8 8
	note G_, 1
	note __, 2
	note A_, 1
	note __, 2
	note A_, 1
	dutycycle 2
	volume 162
	;musice8 6
	note G_, 2
	dutycycle 1
	volume 144
	;musice8 8
	note A_, 1
	note __, 3
	note E_, 1
	note __, 1
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 1
	dutycycle 1
	volume 144
	;musice8 8
	note A_, 1
	note __, 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 2
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	decoctave
	note A_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 1
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note B_, 1
	note __, 2
	incoctave
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 2
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	decoctave
	note A_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 112
	;musice4 0
	note E_, 1
	note F#, 1
	note A_, 1
	note __, 1
	volume 112
	callchannel  Branch_f594d
	volume 112
	octave 3
	tempo 20* 1
	note C#, 4
	note D_, 3
	;no_fade
	tempo 20* 7
	note D_, 1
	note __, 1
	decoctave
	note F#, 1
	volume 162
	;musice8 6
	note F#, 2
	volume 112
	;musice8 8
	note A_, 10
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	volume 162
	;musice8 6
	incoctave
	note D_, 2
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	decoctave
	note A_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 112
	note E_, 1
	note F#, 1
	note A_, 1
	note __, 1
	callchannel  Branch_f594d
	volume 112
	octave 3
	note D_, 2
	note __, 1
	note F#, 13
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	incoctave
	volume 162
	;musice8 6
	note D_, 2
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	incoctave
	dutycycle 2
	volume 112
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note __, 1
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 15
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note G_, 1
	note __, 2
	note G_, 1
	incoctave
	dutycycle 2
	volume 112
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 2
	note __, 1
	note F#, 3
	note __, 1
	decoctave
	volume 162
	;musice8 6
	note G_, 1
	dutycycle 1
	volume 144
	;musice8 8
	note E_, 1
	note __, 2
	incoctave
	dutycycle 2
	volume 112
	tempo 20* 1
	note E_, 4
	note F#, 3
	;no_fade
	tempo 20* 7
	note F#, 15
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note F#, 1
	note __, 2
	note F#, 1
	incoctave
	dutycycle 2
	volume 112
	tempo 20* 1
	note E_, 4
	note F#, 3
	;no_fade
	tempo 20* 7
	note F#, 2
	note __, 1
	note E_, 3
	note __, 1
	decoctave
	volume 162
	;musice8 6
	note A_, 1
	dutycycle 1
	volume 144
	;musice8 8
	note E_, 1
	note __, 2
	incoctave
	dutycycle 2
	volume 112
	tempo 20* 1
	note D#, 4
	note E_, 3
	;no_fade
	tempo 20* 7
	note E_, 15
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note A_, 1
	note __, 2
	note A_, 1
	dutycycle 2
	volume 112
	tempo 20* 1
	note A#, 4
	note B_, 3
	;no_fade
	tempo 20* 7
	note B_, 2
	note __, 1
	note A_, 3
	note __, 1
	note G_, 3
	note __, 1
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 1
	note __, 1
	note F#, 13
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	dutycycle 2
	volume 162
	;musice8 6
	note D_, 2
	decoctave
	;musice4 0
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 2
	callchannel  Branch_f59b4
	octave 3
	tempo 20* 1
	volume 112
	note F_, 4
	note F#, 3
	;no_fade
	tempo 20* 7
	note F#, 1
	note __, 1
	note D_, 5
	note __, 1
	decoctave
	note F#, 1
	tempo 20* 1
	note A_, 4
	note __, 3
	incoctave
	note D_, 4
	note __, 3
	note F#, 4
	note __, 3
	tempo 20* 7
	note __, 3
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
rept 3
	note D_, 1
	note __, 2
endr
	callchannel  Branch_f59b4
	volume 128
	octave 3
	note D_, 16
	;no_fade
	note D_, 6
	note __, 2
	tempo 20* 1
	note G#, 4
	note A_, 3
	;no_fade
	tempo 20* 7
	note A_, 2
	note A_, 1
	note __, 2
	note A_, 1
	note __, 1
	note D_, 2
	note __, 1
	note D_, 13
	note C#, 6
	note __, 2
	decoctave
	volume 121
	tempo 20* 1
	note E_, 5
	note A_, 5
	incoctave
	note C#, 4
	note E_, 5
	note A_, 5
	incoctave
	note C#, 4
	decoctave
	decoctave
	note A_, 5
	incoctave
	note C#, 5
	note E_, 4
	note A_, 5
	incoctave
	note C#, 5
	note E_, 4
	decoctave
	tempo 20* 7
	callchannel  Branch_f598c
	note D_, 8
	;no_fade
	note D_, 8
	note C#, 6
	decoctave
	dutycycle 1
	volume 112
	tempo 20* 1
	note G_, 4
	note G#, 3
	tempo 20* 7
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 2
	incoctave
	note C#, 2
	note E_, 2
	dutycycle 2
	callchannel  Branch_f598c
	note D_, 4
	note E_, 2
	note D_, 2
	note __, 2
	note C#, 2
	note __, 2
	note E_, 6
	note D_, 2
	note C#, 2
	note __, 2
	decoctave
	note A_, 2
	note __, 2
	note G_, 8
	;no_fade
	note G_, 8
	note F#, 8
	;no_fade
	note F#, 8
	note __, 2
	note G_, 12
	note __, 2
	note G_, 14
	note __, 4
	loopchannel 0, .MainLoop

Branch_f594d:
	octave 3
	tempo 20* 1
	note C#, 4
	note D_, 3
	;no_fade
	tempo 20* 7
	note D_, 9
	decoctave
	dutycycle 1
	volume 144
	decoctave
	note A_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 112
	note A_, 3
	note __, 1
	incoctave
	note C_, 6
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 112
	tempo 20* 1
	note D#, 4
	note E_, 3
	;no_fade
	tempo 20* 7
	note E_, 2
	note D_, 1
	decoctave
	volume 162
	;musice8 6
	note G_, 2
	incoctave
	volume 112
	;musice8 8
	note C_, 1
	note __, 1
	endchannel

Branch_f598c:
	volume 128
	note D_, 10
	note __, 2
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 2
	note __, 2
	incoctave
	note D_, 8
	note C#, 1
	note __, 1
	decoctave
	note B_, 1
	note __, 1
	note A_, 2
	note __, 1
	note F#, 9
	note D_, 1
	note __, 1
	note G_, 9
	note __, 1
	note F#, 4
	note E_, 4
	note D_, 10
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	decoctave
	note B_, 10
	incoctave
	note C#, 2
	note D_, 2
	note __, 2
	note D_, 2
	;no_fade
	endchannel

Branch_f59b4:
	octave 2
	volume 128
	tempo 20* 1
	note G#, 4
	note A_, 3
	;no_fade
	tempo 20* 7
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 2
	note C_, 1
	note __, 2
	note C_, 1
	note __, 2
	dutycycle 2
	volume 112
	note E_, 1
	tempo 20* 1
	note G_, 4
	note __, 3
	incoctave
	note C_, 4
	note __, 3
	note E_, 4
	note __, 3
	tempo 20* 7
	note __, 3
	;musice8 8
	decoctave
	dutycycle 1
	volume 128
rept 3
	note C_, 1
	note __, 2
endr
	incoctave
	dutycycle 2
	volume 112
	tempo 20* 1
	note F#, 4
	note G_, 3
	;no_fade
	tempo 20* 7
	note G_, 2
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	endchannel

Branch_f59f9:
	octave 2
	dutycycle 1
	volume 144
	;musice8 8
	note D_, 1
	note __, 3
	decoctave
	note A_, 1
	note __, 1
	incoctave
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 1
	decoctave
	dutycycle 1
	volume 144
	;musice8 8
	note B_, 1
	note __, 2
	endchannel

Branch_f5a17:
	octave 2
	dutycycle 1
	volume 144
	;musice8 8
	note F#, 1
	note __, 3
	note C#, 1
	note __, 1
	dutycycle 2
	volume 162
	;musice8 6
	note A_, 1
	dutycycle 1
	volume 144
	;musice8 8
	note E_, 1
	note __, 2
	endchannel


Music_TCG_BattleTheme1_Ch3: ; f5a32 (3d:5a32)
	notetype $c, $14
	tempo 20* 7
	;musicdc 17
	volume 32
	;duty3 4
	;musice9 96
	;musice8 8
	octave 1
.MainLoop
rept 4
rept 3
	note D_, 1
	note __, 2
endr
	note __, 1
	callchannel  Branch_f5c47
endr
rept 4
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	incoctave
	;musice8 3
	note D_, 2
	decoctave
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
endr
	callchannel  Branch_f5b8d
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note F#, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	incoctave
	;musice8 3
	note D_, 2
	decoctave
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
	callchannel  Branch_f5b8d
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note A_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note A_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 2
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel  Branch_f5c7e
	octave 2
	note C_, 3
	decoctave
	note G_, 1
	note __, 1
	incoctave
	note C_, 1
	note __, 1
	decoctave
rept 3
	note D_, 1
	note __, 2
endr
	incoctave
	note D_, 1
	tempo 20* 1
	note F#, 4
	note __, 3
	note A_, 4
	note __, 3
	incoctave
	note D_, 4
	note __, 3
	tempo 20* 7
	note __, 3
	decoctave
	decoctave
rept 3
	note D_, 1
	note __, 2
endr
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel  Branch_f5c7e
	octave 1
	note C_, 3
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	callchannel  Branch_f5c60
	octave 1
	;musice8 8
	note E_, 1
	note __, 1
	note E_, 2
	;musice8 6
	note B_, 2
	callchannel  Branch_f5c60
	octave 1
	;musice8 8
	note F#, 2
	note G_, 2
	;musice8 6
	note G#, 2
	callchannel  Branch_f5c6f
	octave 1
	;musice8 8
	note A_, 1
	note __, 1
	note A_, 2
	;musice8 6
	note E_, 2
	callchannel  Branch_f5c6f
	octave 1
	;musice8 8
	note B_, 2
	incoctave
	note C_, 2
	note C#, 2
	decoctave
rept 2
	callchannel  Branch_f5c4d
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	;musice8 7
	note E_, 1
	;musice8 8
	note E_, 1
	note __, 1
	note E_, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 2
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	;musice8 7
	note F#, 1
	;musice8 8
	note F#, 1
	note __, 1
	note F#, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	;musice8 7
	note G_, 1
	;musice8 8
	note F#, 1
	note __, 1
	note E_, 2
	callchannel  Branch_f5c4d
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 2
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	;musice8 7
	note B_, 1
	;musice8 8
	note F#, 1
	note __, 1
	note F_, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note F#, 2
	note G_, 2
	note G#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note A_, 2
	note E_, 2
	note C#, 2
endr
rept 2
	callchannel  Branch_f5c4d
endr
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	;musice8 7
	note D_, 1
	;musice8 8
	note D_, 1
	note __, 1
	note A_, 14
	note __, 4
	loopchannel 0, .MainLoop

Branch_f5b8d:
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note A_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note G_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
rept 3
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note A_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
endr
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note G_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note A_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	callchannel  Branch_f5c47
	note D_, 1
	note __, 2
	note D_, 1
	incoctave
	;musice8 3
	note A_, 2
	decoctave
	;musice8 8
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note E_, 2
	note F#, 1
	note __, 1
rept 2
	note G_, 1
	note __, 2
	note G_, 1
	incoctave
	;musice8 3
	note B_, 2
	decoctave
	;musice8 8
	note G_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note __, 2
endr
	note F#, 1
	note __, 2
	note F#, 1
	incoctave
	;musice8 3
	note A_, 2
	decoctave
	;musice8 8
	note F#, 1
	note __, 3
	note C#, 1
	note __, 1
	note C#, 1
	note E_, 1
	note __, 2
	note F#, 1
	note __, 2
	note F#, 1
	incoctave
	incoctave
	;musice8 3
	note C#, 2
	decoctave
	decoctave
	;musice8 8
	note F#, 1
	note __, 3
	note C#, 1
	note __, 1
	note C#, 1
	note E_, 1
	note __, 2
	note E_, 1
	note __, 2
	note E_, 1
	incoctave
	;musice8 3
	note B_, 2
	decoctave
	;musice8 8
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 2
	note A_, 1
	note __, 2
	note A_, 1
	incoctave
	;musice8 3
	note B_, 2
	decoctave
	;musice8 8
	note A_, 1
	note __, 3
	note E_, 1
	note __, 1
	note F#, 1
	note A_, 1
	note __, 2
	endchannel

Branch_f5c47:
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	endchannel

Branch_f5c4d:
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	;musice8 7
	note D_, 1
	;musice8 8
	note D_, 1
	note __, 1
	note D_, 2
	endchannel

Branch_f5c60:
	octave 1
	;musice8 8
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 1
	note E_, 1
	note __, 1
	;musice8 6
	note E_, 1
	endchannel

Branch_f5c6f:
	octave 1
	;musice8 8
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 1
	note A_, 1
	note __, 1
	;musice8 6
	note A_, 1
	endchannel

Branch_f5c7e:
	octave 1
rept 3
	note C_, 1
	note __, 2
endr
	incoctave
	note C_, 1
	tempo 20* 1
	note E_, 4
	note __, 3
	note G_, 4
	note __, 3
	incoctave
	note C_, 4
	note __, 3
	tempo 20* 7
	note __, 3
	decoctave
	decoctave
rept 3
	note C_, 1
	note __, 2
endr
	endchannel


Music_TCG_BattleTheme1_Ch4: ; f5c9a (3d:5c9a)
	togglenoise $0
	notetype $c
	tempo 20* 7
	octave 1
.MainLoop
rept 3
	note C_, 2
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note E_, 2
	note F_, 1
	note C_, 1
	note G_, 2
	note D_, 1
	note G_, 1
	note __, 1
	note F_, 1
endr
	note C_, 2
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note E_, 2
	note F_, 1
	note D_, 1
	note G_, 1
	tempo 20* 1
	note E_, 4
	note E_, 3
	tempo 20* 7
	note D_, 1
	note D_, 1
	note D_, 2
rept 3
	callchannel  Branch_f5d39
endr
	callchannel  Branch_f5d46
rept 15
	callchannel  Branch_f5d39
endr
	callchannel  Branch_f5d46
rept 15
	callchannel  Branch_f5d39
endr
	note C_, 2
	note F_, 1
	note G_, 1
	note D_, 2
	note G_, 2
	note F_, 1
	note D_, 1
	note G_, 1
	tempo 20* 1
	note E_, 4
	note E_, 3
	tempo 20* 7
rept 4
	note D_, 1
endr
rept 5
	note C_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note C_, 1
	note G_, 2
	note F_, 1
	note C_, 1
	note F_, 2
	note D_, 2
	note G_, 2
endr
	note C_, 2
	note F_, 1
	note D_, 1
	note F_, 1
	note C_, 1
	note G_, 2
	note F_, 1
	note C_, 1
	note G_, 1
	tempo 20* 1
	note E_, 4
	note E_, 3
	tempo 20* 7
rept 4
	note D_, 1
endr
rept 3
	callchannel  Branch_f5d39
endr
	callchannel  Branch_f5d58
rept 7
	callchannel  Branch_f5d39
endr
	callchannel  Branch_f5d46
rept 7
	callchannel  Branch_f5d39
endr
	callchannel  Branch_f5d58
rept 2
	callchannel  Branch_f5d39
endr
	note C_, 2
	note F_, 1
	note G_, 1
	note D_, 2
	note G_, 2
	note C_, 1
	note F_, 1
	note G_, 2
	note D_, 2
	note A_, 14
	note D_, 4
	loopchannel 0, .MainLoop

Branch_f5d39:
	note C_, 2
	note F_, 1
	note G_, 1
	note D_, 2
	note G_, 2
	note C_, 1
	note F_, 1
	note G_, 2
	note D_, 1
	note G_, 1
	note __, 1
	note F_, 1
	endchannel

Branch_f5d46:
	note C_, 2
	note F_, 1
	note G_, 1
	note D_, 2
	note G_, 2
	note F_, 1
	note D_, 1
	note G_, 1
	tempo 20* 1
	note E_, 4
	note E_, 3
	tempo 20* 7
	note D_, 1
	note D_, 1
	note D_, 2
	endchannel

Branch_f5d58:
	note C_, 2
	note F_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	tempo 20* 1
	note E_, 4
	note E_, 3
	tempo 20* 7
rept 8
	note D_, 1
endr
	endchannel
; 0xf5d68
