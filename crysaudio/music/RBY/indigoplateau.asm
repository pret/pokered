Music_RBYIndigoPlateau:
	dbw $C0, Music_RBYIndigoPlateau_Ch1
	dbw $01, Music_RBYIndigoPlateau_Ch2
	dbw $02, Music_RBYIndigoPlateau_Ch3
	dbw $03, Music_RBYIndigoPlateau_Ch4

Music_RBYIndigoPlateau_Ch1: ; a5f0 (2:65f0)
	tempo 132
	volume 119
	dutycycle 3
	vibrato 6, 52
	
	notetype 12, 178
	octave 2
	note A_, 8
	note A_, 8
	note A_, 8
	note A_, 4
	notetype 12, 164
	note A#, 4

Music_RBYIndigoPlateau_branch_a605:
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, 180
	octave 3
	note D_, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, 180
	octave 3
	note D#, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, 180
	octave 3
	note D_, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, 160
	octave 2
	note A#, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, 180
	octave 3
	note D_, 4
	notetype 12, 212
	octave 3
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	notetype 12, 180
	octave 3
	note D#, 4
	notetype 12, 212
	octave 3
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	notetype 12, 180
	octave 3
	note F_, 2
	notetype 12, 180
	octave 3
	note G_, 2
	notetype 12, 176
	note A_, 8
	octave 2
	note A_, 8
	notetype 12, 183
	octave 3
	note F_, 8
	notetype 12, 78
	octave 2
	note A#, 8
	loopchannel 0, Music_RBYIndigoPlateau_branch_a605

Music_RBYIndigoPlateau_branch_a659:
	notetype 12, 178
	octave 2
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	endchannel


Music_RBYIndigoPlateau_Ch2: ; a664 (2:6664)
	dutycycle 3
	vibrato 8, 37
	notetype 12, 194
	octave 3
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 4
	notetype 12, 90
	note D#, 4

Music_RBYIndigoPlateau_branch_a673:
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, 197
	note A_, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, 197
	note A#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, 197
	note A_, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, 199
	note C#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, 197
	note A_, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, 197
	note A#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, 197
	octave 4
	note C_, 2
	notetype 12, 199
	octave 4
	note C#, 2
	note D_, 8
	octave 3
	note D_, 8
	octave 4
	note C_, 8
	notetype 12, 77
	octave 4
	note D#, 8
	loopchannel 0, Music_RBYIndigoPlateau_branch_a673

Music_RBYIndigoPlateau_branch_a6af:
	notetype 12, 194
	octave 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	endchannel


Music_RBYIndigoPlateau_Ch3: ; a6ba (2:66ba)
	notetype 12, 16
	octave 4
	note D_, 2
	note __, 6
	note D_, 2
	note __, 6
	note D_, 2
	note __, 6
	note D_, 2
	note __, 2
	note D#, 4

Music_RBYIndigoPlateau_branch_a6c6:
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note F#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 8
	note D_, 8
	note A#, 8
	note D#, 8
	loopchannel 0, Music_RBYIndigoPlateau_branch_a6c6

Music_RBYIndigoPlateau_branch_a6fe:
	octave 4
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note A_, 4
	endchannel


Music_RBYIndigoPlateau_Ch4: ; a70f (2:670f)
	notetype 6
	togglenoise 1
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 8
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1

Music_RBYIndigoPlateau_branch_a728:
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	note A_, 16
	note A_, 8
	note A#, 8
	note A_, 16
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	loopchannel 0, Music_RBYIndigoPlateau_branch_a728

Music_RBYIndigoPlateau_branch_a77e:
	note A_, 4
	note A#, 4
	note B_, 4
	note A#, 4
	note A_, 4
	note A#, 4
	note B_, 4
	note B_, 2
	note A#, 2
	endchannel

Music_RBYIndigoPlateau_branch_a791:
	note A_, 4
	note A#, 4
	note B_, 4
	note A#, 4
	note A_, 4
	note A#, 4
	note B_, 4
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	endchannel

Music_RBYIndigoPlateau_branch_a7a8:
	note A_, 4
	note A#, 4
	note A_, 4
	note A#, 4
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	endchannel
; 0xa7c5