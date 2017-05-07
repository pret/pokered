Music_MtMoon: ; edb29
	dbw $c0, Music_MtMoon_Ch1
	dbw $01, Music_MtMoon_Ch2
	dbw $02, Music_MtMoon_Ch3
	dbw $03, Music_MtMoon_Ch4
; edb35

Music_MtMoon_Ch1: ; edb35
	tempo 208
	volume $77
	dutycycle $2
	tone $0001
	vibrato $8, $14
	stereopanning $f0
	notetype $c, $45
	note __, 2
	loopchannel 0, Music_MtMoon_branch_edb56
; edb4c

Music_MtMoon_Ch2: ; edb4c
	vibrato $b, $15
	dutycycle $2
	notetype $c, $84
	stereopanning $f
Music_MtMoon_branch_edb56: ; edb56
	octave 4
	note D#, 6
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	note A#, 2
	note B_, 6
	octave 4
	note C#, 10
	note G#, 6
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note D#, 2
	note E_, 6
	note F#, 6
	note E_, 4
	loopchannel 0, Music_MtMoon_branch_edb56
; edb8a

Music_MtMoon_Ch3: ; edb8a
Music_MtMoon_branch_edb8a: ; edb8a
	notetype $c, $28
Music_MtMoon_branch_edb8d: ; edb8d
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 3, Music_MtMoon_branch_edb8d
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	note D#, 2
	note E_, 2
Music_MtMoon_branch_edbab: ; edbab
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	loopchannel 4, Music_MtMoon_branch_edbab
	loopchannel 0, Music_MtMoon_branch_edb8a
; edbbf

Music_MtMoon_Ch4: ; edbbf
	togglenoise $5
	notetype $c
Music_MtMoon_branch_edbc3: ; edbc3
	stereopanning $f
	note A#, 4
	note A#, 8
	note A#, 4
	stereopanning $f0
	note A#, 4
	note A#, 4
	note A#, 4
	stereopanning $f
	note A#, 4
	note A#, 4
	stereopanning $f0
	note A#, 8
	loopchannel 0, Music_MtMoon_branch_edbc3
; edbd8


