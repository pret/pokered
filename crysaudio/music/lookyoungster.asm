Music_LookYoungster: ; f66c3
	dbw $80, Music_LookYoungster_Ch1
	dbw $01, Music_LookYoungster_Ch2
	dbw $02, Music_LookYoungster_Ch3
; f66cc

Music_LookYoungster_Ch1: ; f66cc
	tempo 118
	volume $77
	stereopanning $f
	dutycycle $3
	notetype $c, $a3
	octave 3
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	intensity $3e
	note B_, 16
	intensity $c3
	octave 4
	note C_, 1
	note __, 3
	note C_, 4
	note __, 2
	note C_, 6
	intensity $b3
Music_LookYoungster_branch_f66ea: ; f66ea
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note __, 16
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note __, 16
	loopchannel 0, Music_LookYoungster_branch_f66ea
; f670e




Music_LookYoungster_Ch2: ; f670f
	stereopanning $f0
	vibrato $12, $26
	dutycycle $1
	notetype $c, $a3
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
	note D_, 1
	intensity $3e
	notetype $c, $2e
	note G_, 16
	notetype $c, $b3
	intensity $c3
	note F_, 1
	note __, 3
	note F_, 4
	note __, 2
	note F#, 6
Music_LookYoungster_branch_f672f: ; f672f
	dutycycle $3
	intensity $b3
	note __, 2
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	intensity $97
	dutycycle $2
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 3
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	dutycycle $3
	intensity $b3
	note __, 2
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	dutycycle $2
	intensity $97
	note G#, 1
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note __, 3
	octave 3
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	loopchannel 0, Music_LookYoungster_branch_f672f
; f6783




Music_LookYoungster_Ch3: ; f6784
	stereopanning $ff
	vibrato $2, $24
	notetype $c, $25
	note __, 4
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	intensity $15
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 4
	note __, 2
	note G#, 6
	intensity $25
Music_LookYoungster_branch_f67ae: ; f67ae
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	loopchannel 0, Music_LookYoungster_branch_f67ae
; f6810





