Music_CrystalOpening: ; 1786e8
	dbw $c0, Music_CrystalOpening_Ch1
	dbw $01, Music_CrystalOpening_Ch2
	dbw $02, Music_CrystalOpening_Ch3
	dbw $03, Music_CrystalOpening_Ch4
; 1786f4

Music_CrystalOpening_Ch1: ; 1786f4
	ftempo 136
	volume $77
	tone $0002
	vibrato $10, $34
	dutycycle $3
	stereopanning $f0
	notetype $c, $92
	octave 2
	note F#, 2
	note F#, 4
	note F#, 2
	note F#, 2
	note F#, 4
	note F#, 2
	note F#, 2
	note F#, 4
	note F#, 2
	note F#, 2
	note F#, 6
	notetype $c, $b4
	octave 2
	note B_, 2
	note F#, 2
	note E_, 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note G#, 2
	note F#, 2
	octave 3
	note C#, 2
	octave 2
	note F#, 2
	note C#, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	note B_, 2
	octave 3
	note E_, 2
	note F#, 2
	note E_, 2
	octave 2
	note B_, 2
	note F#, 2
	note B_, 2
	octave 3
	note E_, 2
	note F#, 2
	note E_, 2
	octave 2
	note B_, 2
	note F#, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note D_, 8
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	note G_, 2
	octave 3
	note D_, 2
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	note E_, 2
	note D_, 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note F#, 2
	octave 4
	note C_, 2
	notetype $c, $a0
	note D_, 8
	note D_, 8
	notetype $c, $a7
	note D_, 8
	notetype $c, $b2
	octave 2
	note D_, 16
	endchannel
; 17877a

Music_CrystalOpening_Ch2: ; 17877a
	notetype $c, $a2
	dutycycle $3
	vibrato $8, $44
	octave 2
	note B_, 2
	note B_, 4
	note B_, 2
	note B_, 2
	note B_, 4
	note B_, 2
	note B_, 2
	note B_, 4
	note B_, 2
	note B_, 2
	note B_, 2
	notetype $c, $a2
	octave 2
	note E_, 1
	note B_, 1
	octave 3
	note E_, 1
	note F#, 1
	notetype $c, $c7
	note E_, 8
	note F#, 8
	octave 2
	note B_, 8
	notetype $c, $b0
	octave 3
	note B_, 8
	notetype $c, $c7
	note B_, 16
	note __, 16
	note G_, 8
	note A_, 8
	note D_, 8
	notetype $c, $c7
	octave 4
	note D_, 8
	notetype $c, $7c
	note D_, 8
	notetype $c, $c7
	note D_, 8
	note G_, 8
	notetype $c, $b0
	note F#, 8
	note F#, 8
	notetype $c, $c7
	note F#, 8
	notetype $c, $c2
	octave 3
	note D_, 16
	endchannel
; 1787c8

Music_CrystalOpening_Ch3: ; 1787c8
	notetype $c, $16
	octave 1
	note B_, 4
	notetype $6, $16
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	notetype $c, $16
	note B_, 4
	note B_, 4
	note B_, 4
	notetype $6, $16
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	notetype $c, $16
	note B_, 4
	note B_, 4
	octave 2
	note B_, 8
	note F#, 8
	note D#, 8
	note B_, 4
	note F#, 4
	note B_, 4
	octave 3
	note E_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	note C#, 4
	octave 2
	note A_, 8
	octave 3
	note D_, 8
	octave 2
	note A_, 8
	note F#, 8
	octave 3
	note D_, 4
	note E_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	note C#, 4
	note C_, 8
	note D_, 8
	note D_, 16
	octave 2
	note D_, 1
	note __, 15
	endchannel
; 178810

Music_CrystalOpening_Ch4: ; 178810
	stereopanning $f
	togglenoise $3
	notetype $c
	note __, 16
	note __, 12
	octave 2
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	notetype $8
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 3
	notetype $c
	note C#, 1
	note C#, 1
	note G_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 1
	note C#, 1
	note G_, 2
	note D_, 1
	note C#, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note G_, 1
	note __, 1
	note C#, 1
	note C#, 1
	note A_, 1
	note G_, 1
	note C#, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note A_, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note A_, 2
	note D_, 2
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note G_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note G_, 1
	note D_, 1
	note C#, 1
	note C#, 2
	note D_, 2
	note __, 2
	note D_, 2
	note D_, 2
	note __, 6
	note __, 16
	note __, 16
	endchannel
; 178889


