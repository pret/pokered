Music_Lavender:
	dbw $C0, Music_Lavender_Ch1
	dbw $01, Music_Lavender_Ch2
	dbw $02, Music_Lavender_Ch3
	dbw $03, Music_Lavender_Ch4

Music_Lavender_Ch1: ; bb58 (2:7b58)
	tempo 152
	volume 119
	dutycycle 1
	
	vibrato 0, 136
	notetype 12, 135
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype 12, 167

Music_Lavender_branch_bb6b:
	octave 3
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note C#, 8
	note C#, 8
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note C_, 8
	note C_, 8
	octave 3
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note C#, 8
	note C#, 8
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note C_, 8
	note C_, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_Lavender_branch_bb6b


Music_Lavender_Ch2: ; bb9e (2:7b9e)
	vibrato 0, 52
	dutycycle 3
	notetype 12, 145

Music_Lavender_branch_bba5:
	octave 5
	note C_, 4
	note G_, 4
	note B_, 4
	note F#, 4
	loopchannel 0, Music_Lavender_branch_bba5


Music_Lavender_Ch3: ; bbae (2:7bae)
	vibrato 4, 17
	notetype 12, $3f
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype 12, $2f
	db $f3, $21, $E2, $33, $28, $E1, $22, $FF, $EA, $10, $14, $DC, $10, $E3, $41, $51, $73
Music_Lavender_branch_bbb9:
	octave 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	notetype 12, $3f
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	notetype 12, $2f
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note E_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	notetype 12, $2f
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note E_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	loopchannel 0, Music_Lavender_branch_bbb9

Music_Lavender_Ch4: ; bc21 (2:7c21)
	notetype 12
	togglenoise 0
	note __, 16
	note __, 16
	note __, 16
	note __, 16

Music_Lavender_branch_bc26:
	note F#, 8
	note F#, 8
	loopchannel 0, Music_Lavender_branch_bc26
; 0xbc2e