Sfx_IntroUnown1:
	musicheader 1, 5, Sfx_IntroUnown1_Ch5

Sfx_IntroUnown1_Ch5:
	vibrato $1, $a3
	dutycycle $2
	sound __,  9, $39, $0705
	sound C#,  1, $e2, $0705
	endchannel

Sfx_IntroUnown2:
	musicheader 1, 6, Sfx_IntroUnown2_Ch6

Sfx_IntroUnown2_Ch6:
	vibrato $1, $73
	dutycycle $2
	sound __,  9, $39, $0758
	sound C#,  1, $e2, $0758
	endchannel

Sfx_IntroUnown3:
	musicheader 1, 7, Sfx_IntroUnown3_Ch7

Sfx_IntroUnown3_Ch7:
	vibrato $1, $53
	sound __,  4, $32, $07c2
	sound __,  4, $22, $07c2
	sound __,  4, $12, $07c2
	sound C_,  1, $12, $07c2
	sound __,  7, $22, $07c2
	sound __,  7, $32, $07c2
	endchannel

Sfx_DittoPopUp:
	musicheader 1, 5, Sfx_DittoPopUp_Ch5

Sfx_DittoPopUp_Ch5:
	dutycycle $2
	soundinput $1e
	sound __,  4, $82, $0700
	sound __,  2, $31, $0701
	soundinput $16
	sound __,  5, $b1, $0640
	sound C_,  1, $31, $0641
	endchannel

Sfx_DittoTransform:
	musicheader 1, 5, Sfx_DittoTransform_Ch5

Sfx_DittoTransform_Ch5:
	dutycycle $1
	soundinput $26
	sound C_,  5, $3b, $0440
	sound __,  5, $97, $04c0
	sound __,  5, $67, $04c1
	sound __,  5, $42, $04c2
	endchannel

Sfx_IntroSuicune1:
	musicheader 1, 8, Sfx_IntroSuicune1_Ch8

Sfx_IntroSuicune1_Ch8:
	noise __,  2, $58, $59
	noise __,  3, $91, $23
	endchannel

Sfx_IntroPichu:
	musicheader 1, 5, Sfx_IntroPichu_Ch5

Sfx_IntroPichu_Ch5:
	dutycycle $3
	soundinput $4d
	sound __,  2, $88, $0770
	sound __,  4, $0, 0
	soundinput $17
	sound __,  3, $88, $0776
	endchannel

Sfx_IntroSuicune2:
	musicheader 1, 8, Sfx_IntroSuicune2_Ch8

Sfx_IntroSuicune2_Ch8:
	noise __,  2, $a7, $31
	noise __,  2, $91, $0
	noise __,  2, $92, $21
	noise __,  2, $91, $0
	noise __,  2, $92, $22
	noise __,  2, $82, $11
	noise __,  2, $82, $22
	noise __,  2, $72, $11
	noise __,  2, $72, $12
	noise __,  2, $62, $10
	noise __,  2, $63, $0
	noise __,  2, $53, $10
	noise __,  2, $43, $0
	noise __,  2, $33, $10
	noise __,  2, $23, $0
	noise __,  2, $13, $10
	endchannel

Sfx_IntroSuicune3:
	musicheader 1, 8, Sfx_IntroSuicune3_Ch8

Sfx_IntroSuicune3_Ch8:
	noise __,  2, $88, $31
	noise __,  9, $39, $11
	noise __,  5, $a4, $10
	noise __,  5, $44, $10
	noise __,  5, $24, $10
	endchannel

Sfx_DittoBounce:
	musicheader 1, 5, Sfx_DittoBounce_Ch5

Sfx_DittoBounce_Ch5:
	dutycycle $2
	soundinput $2c
	sound __,  3, $82, $04b0
	sound __,  1, $31, $04b0
	soundinput $34
	sound C_,  1, $b1, $0420
	endchannel

Sfx_IntroSuicune4:
	musicheader 1, 8, Sfx_IntroSuicune4_Ch8

Sfx_IntroSuicune4_Ch8:
	noise __,  2, $a1, $5c
	noise __,  1, $0, $0
	noise __,  2, $c1, $4d
	noise __,  1, $0, $0
	noise __,  5, $b2, $31
	noise __,  1, $0, $0
	noise __,  5, $a2, $2
	noise __,  1, $0, $0
	noise __,  5, $92, $1
	noise __,  1, $0, $0
	noise C#,  1, $72, $0
	endchannel

Sfx_GameFreakPresents:
	musicheader 1, 5, Sfx_GameFreakPresents_Ch5

Sfx_GameFreakPresents_Ch5:
	togglesfx
	dutycycle $2
	notetype $2, $b1
	soundinput $ff
	pitchoffset 1, A#
	octave 5
	note C_, 2
	note E_, 2
	note G_, 2
	octave 6
	note C_, 2
	note E_, 2
	note G_, 3
	intensity $81
	note G_, 3
	intensity $51
	note G_, 3
	intensity $31
	note G_, 3
	endchannel

Sfx_Tingle:
	musicheader 1, 5, Sfx_Tingle_Ch5

Sfx_Tingle_Ch5:
	togglesfx
	dutycycle $1
	pitchoffset 0, B_
	notetype $1, $b1
.loop
	octave 5
	note C_, 3
	octave 6
	note G_, 2
	octave 5
	note C_, 3
	note __, 2
	loopchannel 2, .loop
	note C_, 2
	intensity $a1
	note G_, 13
	endchannel

Sfx_TwoPcBeeps:
	musicheader 1, 5, Sfx_TwoPcBeeps_Ch5

Sfx_TwoPcBeeps_Ch5:
	dutycycle $2
	sound __,  3, $e8, $07c2
	sound __,  3, $28, $07c2
	sound __,  3, $e8, $07c2
	sound __,  3, $28, $07c2
	endchannel

Sfx_4NoteDitty:
	musicheader 3, 5, Sfx_4NoteDitty_Ch5
	musicheader 1, 6, Sfx_4NoteDitty_Ch6
	musicheader 1, 7, Sfx_4NoteDitty_Ch7

Sfx_4NoteDitty_Ch5:
	togglesfx
	dutycycle $2
	notetype $2, $e8
	pitchoffset 0, D_
	octave 4
	note C_, 2
	intensity $48
	note C_, 2
	intensity $e8
	note G_, 2
	intensity $48
	note G_, 2
	octave 5
	intensity $e8
	note E_, 2
	intensity $48
	note E_, 2
	octave 6
	intensity $e8
	note C_, 2
	intensity $43
	note C_, 16
	endchannel

Sfx_4NoteDitty_Ch6:
	togglesfx
	notetype $2, $b8
	note __, 9
	note __, 16
	endchannel

Sfx_4NoteDitty_Ch7:
	togglesfx
	notetype $2, $b8
	note __, 9
	note __, 16
	endchannel

Sfx_Twinkle:
	musicheader 1, 5, Sfx_Twinkle_Ch5

Sfx_Twinkle_Ch5:
	togglesfx
	dutycycle $0
	pitchoffset 0, D_
	notetype $2, $e1
	octave 3
	note G_, 2
	intensity $b1
	octave 4
	note D_, 2
	intensity $e1
	note B_, 2
	intensity $b1
	note G_, 2
	intensity $e1
	octave 5
	note D_, 2
	intensity $b1
	octave 4
	note B_, 2
	intensity $e1
	octave 5
	note G_, 6
	endchannel
