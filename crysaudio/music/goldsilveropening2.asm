Music_GoldSilverOpening2: ; f7308
	dbw $c0, Music_GoldSilverOpening2_Ch1
	dbw $01, Music_GoldSilverOpening2_Ch2
	dbw $02, Music_GoldSilverOpening2_Ch3
	dbw $03, Music_GoldSilverOpening2_Ch4
; f7314

Music_GoldSilverOpening2_Ch1: ; f7314
	ftempo 92
	volume $77
	dutycycle $3
	tone $0002
	stereopanning $f
	notetype $c, $3d
	octave 3
	note D#, 8
Music_GoldSilverOpening2_branch_f7325: ; f7325
	notetype $c, $c1
	octave 3
	note D_, 2
	note D_, 2
	note D_, 2
	intensity $b7
	note D#, 10
	intensity $c1
	note D_, 2
	note D_, 2
	note D_, 2
	intensity $b7
	note F_, 4
	note D#, 4
	note C_, 2
	loopchannel 2, Music_GoldSilverOpening2_branch_f7325
	intensity $c1
	note D_, 2
	note D_, 2
	note D_, 2
	intensity $b7
	note D#, 10
	intensity $c1
	note D_, 2
	note D_, 2
	note D_, 2
	intensity $b7
	note F_, 4
	note G_, 4
	note A#, 2
	intensity $b0
	note A_, 16
	note A_, 16
	intensity $b2
	octave 4
	note D_, 16
	endchannel
; f7358

Music_GoldSilverOpening2_Ch2: ; f7358
	dutycycle $3
	vibrato $14, $14
	stereopanning $f0
	notetype $c, $3f
	octave 3
	note A#, 8
	notetype $c, $d1
	octave 3
	note A_, 2
	note A_, 2
	note A_, 2
	intensity $c7
	note A#, 10
	intensity $d1
	note A_, 2
	note A_, 2
	note A_, 2
	intensity $c7
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note G_, 2
	intensity $d1
	note A_, 2
	note A_, 2
	note A_, 2
	intensity $c7
	note A#, 10
	intensity $d1
	note A_, 2
	note A_, 2
	note A_, 2
	intensity $c7
	octave 4
	note C_, 4
	note C#, 4
	note D#, 2
	intensity $c7
	note D_, 8
	note D#, 8
	note F_, 8
	note A#, 8
	intensity $b0
	octave 5
	note D_, 16
	note D_, 16
	intensity $c2
	note D_, 16
	endchannel
; f739c

Music_GoldSilverOpening2_Ch3: ; f739c
	notetype $c, $17
	note __, 8
	octave 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 8
	note __, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 4
	note F_, 4
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note D#, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note D#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	octave 3
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	note F#, 2
	note D#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	octave 3
	note D_, 2
	octave 2
	note A#, 2
	note F#, 2
	note A#, 2
	octave 3
	note C#, 2
	note D_, 2
	note __, 14
	endchannel
; f73ea

Music_GoldSilverOpening2_Ch4: ; f73ea
	togglenoise $0
	notetype $6
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
Music_GoldSilverOpening2_branch_f73f8: ; f73f8
	note D_, 2
	note D_, 2
	note D_, 2
	note C#, 4
	note D#, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note C#, 6
	notetype $6
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	notetype $c
	loopchannel 4, Music_GoldSilverOpening2_branch_f73f8
	note C_, 16
	endchannel
; f7411


