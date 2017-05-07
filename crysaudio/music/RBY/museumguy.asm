Music_MuseumGuy:
	dbw $C0, Music_MuseumGuy_Ch1
	dbw $01, Music_MuseumGuy_Ch2
	dbw $02, Music_MuseumGuy_Ch3
	dbw $03, Music_MuseumGuy_Ch4

Music_MuseumGuy_Ch1: ; adae (2:6dae)
	tempo 128
	volume 119
	dutycycle 2
	
	notetype 12, 177
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	octave 2
	note B_, 4
	note B_, 1
	octave 3
	note D#, 1
	note E_, 1
	note G#, 1
	note B_, 10
	callchannel Music_MuseumGuy_branch_ade7
	callchannel Music_MuseumGuy_branch_adec
	callchannel Music_MuseumGuy_branch_ade7
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 6

Music_MuseumGuy_branch_add6:
	callchannel Music_MuseumGuy_branch_ade7
	callchannel Music_MuseumGuy_branch_adec
	callchannel Music_MuseumGuy_branch_ade7
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 6
	loopchannel 0, Music_MuseumGuy_branch_add6

Music_MuseumGuy_branch_ade7:
	note E_, 2
	note E_, 6
	note F#, 2
	note F#, 6
	endchannel

Music_MuseumGuy_branch_adec:
	note E_, 2
	note E_, 6
	note D_, 2
	note D_, 6
	endchannel


Music_MuseumGuy_Ch2: ; adf1 (2:6df1)
	dutycycle 2
	notetype 12, 193
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note E_, 4
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 8
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	note A_, 4
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A_, 4

Music_MuseumGuy_branch_ae26:
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 3
	notetype 12, 129
	note E_, 1
	notetype 12, 193
	note D_, 2
	note F#, 2
	note A_, 3
	notetype 12, 145
	note A_, 1
	notetype 12, 193
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note B_, 3
	notetype 12, 161
	note G#, 1
	notetype 12, 193
	note A_, 2
	octave 4
	note C#, 2
	note E_, 3
	notetype 12, 145
	note E_, 1
	notetype 12, 193
	note D_, 2
	note F#, 2
	note A_, 3
	notetype 12, 129
	note A_, 1
	notetype 12, 193
	note G#, 2
	note E_, 1
	notetype 12, 129
	note E_, 1
	notetype 12, 193
	note F#, 2
	notetype 12, 129
	note F#, 1
	notetype 12, 193
	note G#, 1
	note A_, 2
	note A_, 2
	note A_, 4
	loopchannel 0, Music_MuseumGuy_branch_ae26


Music_MuseumGuy_Ch3: ; ae6e (2:6e6e)
	notetype 12, 16
	note __, 16
	octave 4
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 9
	callchannel Music_MuseumGuy_branch_aeb8
	note A_, 1
	note __, 1
	note A_, 1
	note __, 5
	note G#, 1
	note __, 1
	note G#, 1
	note __, 5
	callchannel Music_MuseumGuy_branch_aeb8
	note B_, 1
	note __, 3
	note G#, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3

Music_MuseumGuy_branch_ae8e:
	callchannel Music_MuseumGuy_branch_aec1
	note __, 3
	octave 6
	note E_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	callchannel Music_MuseumGuy_branch_aec1
	note __, 1
	octave 6
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	loopchannel 0, Music_MuseumGuy_branch_ae8e

Music_MuseumGuy_branch_aeb8:
	note A_, 1
	note __, 1
	note A_, 1
	note __, 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 5
	endchannel

Music_MuseumGuy_branch_aec1:
	octave 6
	note C#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	octave 6
	note F#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	endchannel


Music_MuseumGuy_Ch4: ; aed1 (2:6ed1)
	notetype 12
	togglenoise 1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 14
	notetype 6
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1

Music_MuseumGuy_branch_aee1:
	note A_, 4
	note A_, 6
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note B_, 1
	note B_, 1
	note A_, 6
	note B_, 1
	note B_, 1
	note A_, 4
	note A_, 6
	note A_, 2
	note A#, 1
	note A#, 1
	note A_, 2
	note A_, 2
	note A_, 2
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 6
	note A_, 2
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note A_, 2
	note A#, 1
	note A#, 1
	note A_, 2
	note A_, 4
	note A_, 4
	note A_, 2
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 6
	note B_, 1
	note B_, 1
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	loopchannel 0, Music_MuseumGuy_branch_aee1
; 0xaf59