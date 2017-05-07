Cry_26: ; f2d81
	dbw $84, Cry_26_Ch5
	dbw $05, Cry_26_Ch6
	dbw $07, Cry_26_Ch8
; f2d8a

Cry_28: ; f2d8a
	dbw $44, Cry_28_Ch5
	dbw $05, Cry_28_Ch6
; f2d90

Cry_2C: ; f2d90
	dbw $44, Cry_2C_Ch5
	dbw $05, Cry_2C_Ch6
; f2d96

Cry_27: ; f2d96
	dbw $84, Cry_27_Ch5
	dbw $05, Cry_27_Ch6
	dbw $07, Cry_27_Ch8
; f2d9f

Cry_2A: ; f2d9f
	dbw $84, Cry_2A_Ch5
	dbw $05, Cry_2A_Ch6
	dbw $07, Cry_2A_Ch8
; f2da8

Cry_2D: ; f2da8
	dbw $84, Cry_2D_Ch5
	dbw $05, Cry_2D_Ch6
	dbw $07, Cry_2D_Ch8
; f2db1

Cry_2E: ; f2db1
	dbw $44, Cry_2E_Ch5
	dbw $05, Cry_2E_Ch6
; f2db7

Cry_2F: ; f2db7
	dbw $84, Cry_2F_Ch5
	dbw $05, Cry_2F_Ch6
	dbw $07, Cry_2F_Ch8
; f2dc0

Cry_2B: ; f2dc0
	dbw $44, Cry_2B_Ch5
	dbw $05, Cry_2B_Ch6
; f2dc6

Cry_30: ; f2dc6
	dbw $84, Cry_30_Ch5
	dbw $05, Cry_30_Ch6
	dbw $07, Cry_30_Ch8
; f2dcf

Cry_31: ; f2dcf
	dbw $84, Cry_31_Ch5
	dbw $05, Cry_31_Ch6
	dbw $07, Cry_31_Ch8
; f2dd8

Cry_33: ; f2dd8
	dbw $44, Cry_33_Ch5
	dbw $07, Cry_33_Ch8
; f2dde

Cry_29: ; f2dde
	dbw $84, Cry_29_Ch5
	dbw $05, Cry_29_Ch6
	dbw $07, Cry_29_Ch8
; f2de7

Cry_35: ; f2de7
	dbw $44, Cry_35_Ch5
	dbw $07, Cry_35_Ch8
; f2ded

Cry_36: ; f2ded
	dbw $84, Cry_36_Ch5
	dbw $05, Cry_36_Ch6
	dbw $07, Cry_36_Ch8
; f2df6

Cry_38: ; f2df6
	dbw $84, Cry_38_Ch5
	dbw $05, Cry_38_Ch6
	dbw $07, Cry_38_Ch8
; f2dff

Cry_43: ; f2dff
	dbw $84, Cry_43_Ch5
	dbw $05, Cry_43_Ch6
	dbw $07, Cry_43_Ch8
; f2e08

Cry_3A: ; f2e08
	dbw $84, Cry_3A_Ch5
	dbw $05, Cry_3A_Ch6
	dbw $07, Cry_3A_Ch8
; f2e11

Cry_3B: ; f2e11
	dbw $84, Cry_3B_Ch5
	dbw $05, Cry_3B_Ch6
	dbw $07, Cry_3B_Ch8
; f2e1a

Cry_3C: ; f2e1a
	dbw $84, Cry_3C_Ch5
	dbw $05, Cry_3C_Ch6
	dbw $07, Cry_3C_Ch8
; f2e23

Cry_3D: ; f2e23
	dbw $84, Cry_3D_Ch5
	dbw $05, Cry_3D_Ch6
	dbw $07, Cry_3D_Ch8
; f2e2c

Cry_3E: ; f2e2c
	dbw $84, Cry_3E_Ch5
	dbw $05, Cry_3E_Ch6
	dbw $07, Cry_3E_Ch8
; f2e35

Cry_32: ; f2e35
	dbw $84, Cry_32_Ch5
	dbw $05, Cry_32_Ch6
	dbw $07, Cry_32_Ch8
; f2e3e

Cry_34: ; f2e3e
	dbw $84, Cry_34_Ch5
	dbw $05, Cry_34_Ch6
	dbw $07, Cry_34_Ch8
; f2e47

Cry_40: ; f2e47
	dbw $84, Cry_40_Ch5
	dbw $05, Cry_40_Ch6
	dbw $07, Cry_40_Ch8
; f2e50

Cry_41: ; f2e50
	dbw $84, Cry_41_Ch5
	dbw $05, Cry_41_Ch6
	dbw $07, Cry_41_Ch8
; f2e59

Cry_42: ; f2e59
	dbw $84, Cry_42_Ch5
	dbw $05, Cry_42_Ch6
	dbw $07, Cry_42_Ch8
; f2e62

Cry_3F: ; f2e62
	dbw $84, Cry_3F_Ch5
	dbw $05, Cry_3F_Ch6
	dbw $07, Cry_3F_Ch8
; f2e6b

Cry_37: ; f2e6b
	dbw $84, Cry_37_Ch5
	dbw $05, Cry_37_Ch6
	dbw $07, Cry_37_Ch8
; f2e74

Cry_39: ; f2e74
	dbw $84, Cry_39_Ch5
	dbw $05, Cry_39_Ch6
	dbw $07, Cry_39_Ch8
; f2e7d

Cry_37_Ch5: ; f2e7d
	soundinput $ff
	unknownmusic0xde $63
	sound $1, $f8, $05f8
	sound $8, $9f, $04d8
	sound $6, $f8, $05c4
	sound $14, $f2, $0574
	soundinput $88
	endchannel
; f2e94

Cry_37_Ch6: ; f2e94
	unknownmusic0xde $33
	sound $1, $c8, $0640
	sound $6, $ff, $0668
	sound $7, $a8, $0534
	sound $14, $a2, $04a4
	endchannel
; f2ea7

Cry_37_Ch8: ; f2ea7
	noise $a, $d6, $6a
	noise $6, $bc, $6c
	noise $6, $e2, $5c
	noise $20, $b4, $6c
	endchannel
; f2eb4

Cry_3F_Ch5: ; f2eb4
	unknownmusic0xde $c4
	sound $4, $af, $0720
	sound $2, $f8, $071c
	sound $2, $f8, $0718
	sound $2, $f8, $0708
	sound $2, $f8, $070e
	sound $c, $c8, $0712
	sound $4, $91, $070e
	endchannel
; f2ed3

Cry_3F_Ch6: ; f2ed3
	unknownmusic0xde $a
	sound $1, $b8, $0710
	sound $3, $d8, $072c
	sound $4, $d8, $0665
	sound $1, $b8, $0656
	sound $1, $d8, $065c
	sound $c, $f8, $0760
	sound $4, $c1, $0750
	endchannel
; f2ef2

Cry_3F_Ch8: ; f2ef2
	noise $2, $e8, $3b
Cry_3F_branch_f2ef5: ; f2ef5
	noise $1, $f1, $4e
	loopchannel 5, Cry_3F_branch_f2ef5
	noise $2, $d8, $3f
	noise $14, $c2, $5f
	endchannel
; f2f03

Cry_42_Ch5: ; f2f03
	unknownmusic0xde $22
	sound $1, $f8, $05b0
	sound $1, $f8, $04b4
	sound $1, $f8, $05b8
	sound $3, $f8, $05c0
	sound $8, $c8, $0490
	sound $8, $c8, $0480
	soundinput $fe
	sound $10, $c3, $0490
	soundinput $88
	endchannel
; f2f26

Cry_42_Ch6: ; f2f26
	unknownmusic0xde $22
	sound $8, $b8, $04c8
	sound $20, $b5, $0410
	endchannel
; f2f31

Cry_42_Ch8: ; f2f31
	noise $3, $ff, $4b
	noise $3, $ef, $4c
	noise $20, $b5, $5f
	endchannel
; f2f3b

Cry_2F_Ch5: ; f2f3b
	unknownmusic0xde $33
	sound $2, $f1, $0550
	sound $2, $f1, $0530
	sound $2, $f1, $0510
	sound $2, $f2, $0650
	sound $2, $f2, $0640
	sound $2, $f2, $0630
	sound $10, $f2, $0550
	endchannel
; f2f5a

Cry_2F_Ch6: ; f2f5a
	unknownmusic0xde $f2
	sound $4, $e1, $0620
	sound $5, $e2, $0500
	sound $6, $e1, $0620
	sound $2, $e1, $0520
	sound $10, $e2, $0500
	endchannel
; f2f71

Cry_2F_Ch8: ; f2f71
	noise $2, $8a, $5d
	noise $2, $9a, $4c
	noise $5, $9a, $5d
	noise $2, $9a, $4d
	noise $2, $9a, $4b
	noise $2, $9a, $4d
	noise $2, $9a, $5f
	noise $10, $b2, $6f
	endchannel
; f2f8a

Cry_40_Ch5: ; f2f8a
	dutycycle $0
	soundinput $f7
	sound $2, $f8, $078d
	sound $2, $f8, $0791
	soundinput $ff
	sound $2, $f8, $07ad
	soundinput $88
	sound $2, $f8, $07b4
	soundinput $f7
	sound $2, $f8, $07b8
	soundinput $88
	endchannel
; f2fab

Cry_40_Ch6: ; f2fab
	unknownmusic0xde $10
	sound $2, $c8, $076d
	sound $2, $c8, $0771
	sound $2, $c8, $078d
	sound $2, $c8, $0794
	sound $2, $c8, $0798
	endchannel
; f2fc2

Cry_40_Ch8: ; f2fc2
	noise $2, $b8, $1
	noise $2, $b8, $19
	noise $2, $c8, $18
	noise $2, $b8, $10
	noise $8, $c2, $18
	endchannel
; f2fd2

Cry_26_Ch5: ; f2fd2
	unknownmusic0xde $22
	sound $2, $88, $06d8
	sound $8, $e2, $06e0
	sound $2, $61, $06e5
	sound $2, $e8, $06c0
	sound $2, $e8, $06b8
	sound $2, $d8, $06b0
	sound $8, $c1, $06aa
	endchannel
; f2ff1

Cry_26_Ch6: ; f2ff1
	unknownmusic0xde $63
	sound $2, $68, $06b1
	sound $5, $c1, $06b9
	sound $5, $99, $0760
	sound $2, $b8, $068c
	sound $2, $a8, $0684
	sound $a, $92, $067b
	endchannel
; f300c

Cry_26_Ch8: ; f300c
	noise $1, $99, $6c
	noise $1, $92, $5c
	noise $a, $62, $4c
	noise $2, $68, $6a
	noise $2, $68, $6b
	noise $a, $62, $6c
	endchannel
; f301f

Cry_28_Ch5: ; f301f
	tone $0002
Cry_28_Ch6: ; f3022
Cry_2C_branch_f3022: ; f3022
	unknownmusic0xde $52
	sound $4, $f1, $0796
	sound $4, $f1, $072d
	sound $7, $0, $0000
	sound $10, $f1, $07a7
	endchannel
; f3035

Cry_2C_Ch5: ; f3035
	tone $0002
Cry_2C_Ch6: ; f3038
Cry_2C_branch_f3038: ; f3038
	callchannel Cry_2C_branch_f3022
	loopchannel 2, Cry_2C_branch_f3038
	sound $e, $0, $0000
	sound $8, $f2, $07c2
	endchannel
; f3048

Cry_27_Ch5: ; f3048
	dutycycle $1
	sound $3, $2c, $07c4
	sound $1, $0, $0001
	sound $5, $59, $07b9
	sound $6, $b4, $07bb
	endchannel
; f305b

Cry_27_Ch6: ; f305b
	unknownmusic0xde $2a
	sound $3, $2c, $07c7
	sound $1, $0, $0000
	sound $5, $59, $07be
	sound $6, $b4, $07bd
	endchannel
; f306e

Cry_27_Ch8: ; f306e
	noise $3, $92, $10
	noise $1, $39, $0
	noise $5, $69, $10
	noise $6, $93, $0
	endchannel
; f307b

Cry_2A_Ch5: ; f307b
	unknownmusic0xde $f8
	sound $2, $f1, $04b0
	sound $2, $f7, $0590
	sound $8, $f8, $0510
	sound $3, $f2, $06c0
	sound $3, $f8, $06ba
	sound $3, $f2, $06b0
	sound $10, $f2, $0690
	endchannel
; f309a

Cry_2A_Ch6: ; f309a
	unknownmusic0xde $f2
	sound $2, $f1, $0720
	sound $2, $e1, $0650
	sound $4, $f1, $0750
	sound $4, $d1, $03a0
	sound $3, $f1, $0670
	sound $3, $e1, $0680
	sound $3, $f2, $0690
	sound $10, $e2, $06a0
	endchannel
; f30bd

Cry_2A_Ch8: ; f30bd
	noise $2, $89, $2e
	noise $2, $99, $1f
	noise $4, $89, $4e
	noise $4, $89, $7b
	noise $3, $d8, $4b
	noise $3, $e7, $4c
	noise $3, $ec, $4d
	noise $10, $d2, $4f
	endchannel
; f30d6

Cry_2D_Ch5: ; f30d6
	unknownmusic0xde $66
	sound $4, $78, $0650
	sound $4, $f8, $0660
	sound $4, $f8, $065c
	sound $1, $f8, $067c
	sound $4, $f8, $0680
	sound $4, $f8, $067c
	sound $4, $f8, $0678
	sound $4, $f1, $0674
	endchannel
; f30f9

Cry_2D_Ch6: ; f30f9
	unknownmusic0xde $22
Cry_2D_branch_f30fb: ; f30fb
	sound $2, $a1, $0600
	loopchannel 3, Cry_2D_branch_f30fb
Cry_2D_branch_f3103: ; f3103
	sound $2, $a1, $0630
	loopchannel 4, Cry_2D_branch_f3103
	sound $4, $a2, $0634
	sound $4, $91, $0638
	endchannel
; f3114

Cry_2D_Ch8: ; f3114
	noise $1, $68, $36
	noise $10, $88, $6a
	noise $1, $98, $5e
	noise $10, $a7, $6e
	endchannel
; f3121

Cry_2E_Ch5: ; f3121
	tone $0020
	dutycycle $0
	jumpchannel Cry_2E_branch_f312b
; f3129

Cry_2E_Ch6: ; f3129
	unknownmusic0xde $1b
Cry_2E_branch_f312b: ; f312b
	sound $8, $39, $072d
	sound $8, $f1, $0720
	endchannel
; f3134

Cry_2E_Ch8: ; f3134
	noise $8, $3b, $0
	noise $8, $92, $0
	endchannel
; f313b

Cry_2B_Ch5: ; f313b
	tone $0020
	dutycycle $0
	jumpchannel Cry_2B_branch_f3145
; f3143

Cry_2B_Ch6: ; f3143
	unknownmusic0xde $1
Cry_2B_branch_f3145: ; f3145
Cry_33_branch_f3145: ; f3145
	sound $4, $3a, $073d
	sound $6, $f8, $0762
	sound $6, $f8, $0760
	sound $6, $f1, $075e
	endchannel
; f3156

Cry_30_Ch5: ; f3156
	tone $0020
Cry_30_Ch6: ; f3159
	dutycycle $2
	sound $8, $2f, $0107
Cry_30_branch_f315f: ; f315f
	sound $0, $e1, $0483
	sound $0, $51, $044e
	loopchannel 4, Cry_30_branch_f315f
Cry_30_branch_f316b: ; f316b
	sound $0, $e1, $03da
	sound $1, $51, $0312
	loopchannel 4, Cry_30_branch_f316b
	endchannel
; f3178

Cry_30_Ch8: ; f3178
Cry_33_Ch8: ; f3178
	noise $8, $3f, $52
	noise $20, $93, $4f
	endchannel
; f317f

Cry_31_Ch5: ; f317f
	tone $0020
Cry_31_Ch6: ; f3182
	unknownmusic0xde $21
	sound $2, $c8, $0641
	sound $2, $48, $0641
	sound $6, $f8, $0790
	sound $4, $f8, $078e
	sound $4, $f1, $078b
	endchannel
; f3199

Cry_31_Ch8: ; f3199
	noise $4, $91, $10
	noise $8, $94, $3
	endchannel
; f31a0

Cry_33_Ch5: ; f31a0
	unknownmusic0xde $a2
	jumpchannel Cry_33_branch_f3145
; f31a5

Cry_29_Ch5: ; f31a5
	dutycycle $1
	tone $0004
	jumpchannel Cry_29_branch_f31af
; f31ad

Cry_29_Ch6: ; f31ad
	unknownmusic0xde $41
Cry_29_branch_f31af: ; f31af
	sound $4, $68, $0758
	sound $2, $e8, $0760
	sound $2, $e8, $0767
	sound $2, $e8, $076c
	sound $7, $f1, $0767
	endchannel
; f31c4

Cry_29_Ch8: ; f31c4
	noise $4, $29, $0
	noise $2, $39, $1
	noise $2, $49, $2
	noise $2, $59, $1
	noise $7, $41, $0
	endchannel
; f31d4

Cry_35_Ch5: ; f31d4
	unknownmusic0xde $91
	sound $c, $f2, $07a6
	sound $4, $f8, $07b0
	sound $4, $e8, $03b0
	sound $6, $f8, $03a0
	sound $8, $e1, $0290
	endchannel
; f31eb

Cry_35_Ch8: ; f31eb
	noise $c, $b2, $50
	noise $8, $a8, $60
	noise $6, $a8, $5b
	noise $8, $a1, $5c
	endchannel
; f31f8

Cry_36_Ch5: ; f31f8
	tone $0002
	dutycycle $2
	jumpchannel Cry_36_branch_f3202
; f3200

Cry_36_Ch6: ; f3200
	unknownmusic0xde $1
Cry_36_branch_f3202: ; f3202
	sound $3, $f8, $0791
	sound $3, $d8, $078d
	sound $2, $0, $0000
	sound $1, $78, $06c1
	sound $1, $f8, $0741
	sound $4, $e1, $0751
	endchannel
; f321b

Cry_36_Ch8: ; f321b
	noise $3, $59, $21
	noise $3, $81, $0
	noise $2, $20, $0
	noise $1, $80, $21
	noise $1, $80, $10
	noise $4, $87, $0
	endchannel
; f322e

Cry_38_Ch5: ; f322e
Cry_43_Ch5: ; f322e
	dutycycle $2
	sound $2, $99, $0718
	sound $4, $ab, $0722
	sound $8, $ab, $0734
	sound $4, $d6, $0716
	sound $8, $d1, $0712
	sound $8, $0, $0000
	endchannel
; f3249

Cry_38_Ch6: ; f3249
Cry_43_Ch6: ; f3249
	unknownmusic0xde $7
	sound $2, $b9, $0738
	sound $4, $cb, $0742
	sound $8, $cb, $0754
	sound $4, $f6, $0736
	sound $8, $f1, $0732
	sound $8, $0, $0000
	endchannel
; f3264

Cry_38_Ch8: ; f3264
	noise $2, $5b, $4
	noise $4, $68, $13
	noise $8, $68, $20
	noise $4, $68, $13
	noise $10, $51, $4
	endchannel
; f3274

Cry_43_Ch8: ; f3274
	noise $2, $8b, $59
	noise $4, $a8, $6a
	noise $8, $a8, $70
	noise $4, $a8, $69
	noise $10, $92, $6c
	endchannel
; f3284

Cry_3A_Ch5: ; f3284
Cry_3C_Ch5: ; f3284
	unknownmusic0xde $12
Cry_3A_branch_f3286: ; f3286
Cry_3C_branch_f3286: ; f3286
	sound $3, $c1, $0791
	loopchannel 3, Cry_3A_branch_f3286
Cry_3A_branch_f328e: ; f328e
Cry_3C_branch_f328e: ; f328e
	sound $3, $d1, $04b1
	loopchannel 6, Cry_3A_branch_f328e
Cry_3A_branch_f3296: ; f3296
Cry_3C_branch_f3296: ; f3296
	sound $1, $d1, $0491
	sound $1, $b1, $0451
	loopchannel 6, Cry_3A_branch_f3296
Cry_3A_branch_f32a2: ; f32a2
Cry_3C_branch_f32a2: ; f32a2
	sound $1, $a3, $0471
	sound $1, $81, $0441
	loopchannel 6, Cry_3A_branch_f32a2
Cry_3A_branch_f32ae: ; f32ae
Cry_3C_branch_f32ae: ; f32ae
	sound $1, $41, $0421
	sound $1, $21, $0401
	loopchannel 4, Cry_3A_branch_f32ae
	endchannel
; f32bb

Cry_3A_Ch6: ; f32bb
Cry_3C_Ch6: ; f32bb
	unknownmusic0xde $78
	sound $8, $99, $0740
	sound $8, $79, $0746
	sound $10, $f6, $078d
	sound $8, $f8, $0791
	sound $8, $f8, $078d
	sound $8, $f8, $0787
	sound $18, $e2, $0783
	endchannel
; f32da

Cry_3A_Ch8: ; f32da
	noise $10, $a6, $16
	noise $18, $98, $3d
	noise $20, $98, $5c
	noise $20, $75, $5f
	endchannel
; f32e7

Cry_3B_Ch5: ; f32e7
	unknownmusic0xde $de
Cry_39_branch_f32e9: ; f32e9
Cry_3D_branch_f32e9: ; f32e9
	sound $4, $f8, $07b1
	sound $4, $f8, $07b0
	sound $4, $48, $07af
Cry_39_branch_f32f5: ; f32f5
	sound $4, $f8, $07b2
	sound $4, $f8, $07b3
	sound $4, $48, $07b4
	endchannel
; f3302

Cry_39_branch_f3302: ; f3302
Cry_3B_Ch6: ; f3302
Cry_3D_Ch6: ; f3302
	unknownmusic0xde $f2
	sound $4, $f8, $07b2
	sound $4, $f8, $07b1
	sound $4, $28, $07b0
Cry_39_branch_f3310: ; f3310
	sound $4, $f8, $07b4
	sound $4, $f8, $07b6
	sound $4, $48, $07b8
	endchannel
; f331d

Cry_39_branch_f331d: ; f331d
Cry_3B_Ch8: ; f331d
Cry_3D_Ch8: ; f331d
	noise $4, $88, $5
	noise $4, $88, $4
	noise $4, $38, $3
Cry_39_branch_f3326: ; f3326
	noise $4, $88, $5
	noise $4, $88, $4
	noise $4, $87, $4
	endchannel
; f3330

Cry_3C_Ch8: ; f3330
	noise $8, $a6, $3a
	noise $8, $a1, $5a
	endchannel
; f3337

Cry_3D_Ch5: ; f3337
	dutycycle $0
	jumpchannel Cry_3D_branch_f32e9
; f333c

Cry_39_Ch5: ; f333c
	dutycycle $0
	callchannel Cry_39_branch_f32e9
	callchannel Cry_39_branch_f32f5
	endchannel
; f3345

Cry_39_Ch6: ; f3345
	callchannel Cry_39_branch_f3302
	callchannel Cry_39_branch_f3310
	endchannel
; f334c

Cry_39_Ch8: ; f334c
	callchannel Cry_39_branch_f331d
	callchannel Cry_39_branch_f3326
	endchannel
; f3353

Cry_3E_Ch5: ; f3353
	unknownmusic0xde $de
Cry_3E_branch_f3355: ; f3355
	sound $1, $c1, $0520
	sound $1, $a1, $0420
	loopchannel 4, Cry_3E_branch_f3355
	dutycycle $0
	sound $4, $78, $0760
	sound $4, $78, $0730
	sound $18, $c2, $0420
	endchannel
; f3370

Cry_3E_Ch6: ; f3370
	unknownmusic0xde $32
	sound $8, $f8, $0700
	sound $7, $f8, $0720
	sound $4, $f8, $0790
	sound $4, $f8, $0760
	sound $18, $f2, $0730
	endchannel
; f3387

Cry_3E_Ch8: ; f3387
	noise $4, $88, $6d
	noise $4, $d8, $68
	noise $7, $c8, $69
	noise $4, $98, $3a
	noise $4, $98, $3c
	noise $18, $d2, $5b
	endchannel
; f339a

Cry_32_Ch5: ; f339a
	unknownmusic0xde $32
	sound $8, $f8, $0330
	sound $8, $f8, $0340
	sound $8, $c8, $07b2
	sound $8, $b8, $07b3
	sound $20, $b2, $07b4
	endchannel
; f33b1

Cry_32_Ch6: ; f33b1
	unknownmusic0xde $12
	sound $8, $e8, $0320
	sound $8, $e8, $0328
	sound $8, $98, $0780
	sound $8, $88, $0782
	sound $20, $72, $0784
	endchannel
; f33c8

Cry_32_Ch8: ; f33c8
	noise $2, $be, $49
	noise $5, $be, $3a
	noise $2, $be, $29
	noise $28, $d3, $6e
	endchannel
; f33d5

Cry_34_Ch5: ; f33d5
	unknownmusic0xde $39
	soundinput $ff
	sound $2, $f8, $0720
	sound $2, $f8, $0727
	sound $2, $f8, $0780
	soundinput $88
	sound $2, $f8, $0779
	sound $4, $f8, $0740
	sound $4, $f8, $073c
	soundinput $ff
	sound $8, $f1, $0737
	soundinput $88
	endchannel
; f33fc

Cry_34_Ch6: ; f33fc
	unknownmusic0xde $22
	sound $6, $b2, $071e
	sound $5, $92, $0779
	sound $4, $82, $073e
	sound $8, $a1, $0735
	endchannel
; f340f

Cry_34_Ch8: ; f340f
	noise $2, $64, $7f
	noise $2, $84, $7d
	noise $2, $a4, $6f
	noise $2, $64, $6c
	noise $2, $94, $6f
	noise $2, $61, $6b
	endchannel
; f3422

Cry_41_Ch5: ; f3422
	unknownmusic0xde $d2
	sound $3, $f8, $06b0
	sound $1, $f8, $06a5
	sound $1, $f8, $069d
	sound $7, $f1, $068a
	sound $3, $f8, $0736
	sound $3, $f8, $0720
	sound $14, $f2, $070e
	endchannel
; f3441

Cry_41_Ch6: ; f3441
	unknownmusic0xde $27
Cry_41_branch_f3443: ; f3443
	sound $1, $f1, $07b4
	loopchannel 8, Cry_41_branch_f3443
Cry_41_branch_f344b: ; f344b
	sound $1, $c1, $0790
	loopchannel 3, Cry_41_branch_f344b
Cry_41_branch_f3453: ; f3453
	sound $1, $b1, $078d
	loopchannel 2, Cry_41_branch_f3453
	sound $10, $92, $0795
	endchannel
; f3460

Cry_41_Ch8: ; f3460
Cry_41_branch_f3460: ; f3460
	noise $0, $f1, $28
	loopchannel 4, Cry_41_branch_f3460
	noise $0, $91, $49
	noise $1, $a8, $4a
	noise $0, $e1, $4b
	noise $5, $d2, $4f
	noise $3, $c2, $4e
	noise $3, $b2, $4d
	noise $14, $a3, $4c
	endchannel
; f347d

Cry_00: ; f347d
	dbw $84, Cry_00_Ch5
	dbw $05, Cry_00_Ch6
	dbw $07, Cry_00_Ch8
; f3486

Cry_01: ; f3486
	dbw $84, Cry_01_Ch5
	dbw $05, Cry_01_Ch6
	dbw $07, Cry_01_Ch8
; f348f

Cry_02: ; f348f
	dbw $84, Cry_02_Ch5
	dbw $05, Cry_02_Ch6
	dbw $07, Cry_02_Ch8
; f3498

Cry_03: ; f3498
	dbw $84, Cry_03_Ch5
	dbw $05, Cry_03_Ch6
	dbw $07, Cry_03_Ch8
; f34a1

Cry_04: ; f34a1
	dbw $84, Cry_04_Ch5
	dbw $05, Cry_04_Ch6
	dbw $07, Cry_04_Ch8
; f34aa

Cry_05: ; f34aa
	dbw $84, Cry_05_Ch5
	dbw $05, Cry_05_Ch6
	dbw $07, Cry_05_Ch8
; f34b3

Cry_06: ; f34b3
	dbw $84, Cry_06_Ch5
	dbw $05, Cry_06_Ch6
	dbw $07, Cry_06_Ch8
; f34bc

Cry_07: ; f34bc
	dbw $84, Cry_07_Ch5
	dbw $05, Cry_07_Ch6
	dbw $07, Cry_07_Ch8
; f34c5

Cry_08: ; f34c5
	dbw $84, Cry_08_Ch5
	dbw $05, Cry_08_Ch6
	dbw $07, Cry_08_Ch8
; f34ce

Cry_09: ; f34ce
	dbw $84, Cry_09_Ch5
	dbw $05, Cry_09_Ch6
	dbw $07, Cry_09_Ch8
; f34d7

Cry_0A: ; f34d7
	dbw $84, Cry_0A_Ch5
	dbw $05, Cry_0A_Ch6
	dbw $07, Cry_0A_Ch8
; f34e0

Cry_0B: ; f34e0
	dbw $84, Cry_0B_Ch5
	dbw $05, Cry_0B_Ch6
	dbw $07, Cry_0B_Ch8
; f34e9

Cry_0C: ; f34e9
	dbw $84, Cry_0C_Ch5
	dbw $05, Cry_0C_Ch6
	dbw $07, Cry_0C_Ch8
; f34f2

Cry_0D: ; f34f2
	dbw $84, Cry_0D_Ch5
	dbw $05, Cry_0D_Ch6
	dbw $07, Cry_0D_Ch8
; f34fb

Cry_0E: ; f34fb
	dbw $84, Cry_0E_Ch5
	dbw $05, Cry_0E_Ch6
	dbw $07, Cry_0E_Ch8
; f3504

Cry_0F: ; f3504
	dbw $84, Cry_0F_Ch5
	dbw $05, Cry_0F_Ch6
	dbw $07, Cry_0F_Ch8
; f350d

Cry_10: ; f350d
	dbw $84, Cry_10_Ch5
	dbw $05, Cry_10_Ch6
	dbw $07, Cry_10_Ch8
; f3516

Cry_11: ; f3516
	dbw $84, Cry_11_Ch5
	dbw $05, Cry_11_Ch6
	dbw $07, Cry_11_Ch8
; f351f

Cry_12: ; f351f
	dbw $84, Cry_12_Ch5
	dbw $05, Cry_12_Ch6
	dbw $07, Cry_12_Ch8
; f3528

Cry_13: ; f3528
	dbw $84, Cry_13_Ch5
	dbw $05, Cry_13_Ch6
	dbw $07, Cry_13_Ch8
; f3531

Cry_14: ; f3531
	dbw $84, Cry_14_Ch5
	dbw $05, Cry_14_Ch6
	dbw $07, Cry_14_Ch8
; f353a

Cry_15: ; f353a
	dbw $84, Cry_15_Ch5
	dbw $05, Cry_15_Ch6
	dbw $07, Cry_15_Ch8
; f3543

Cry_16: ; f3543
	dbw $84, Cry_16_Ch5
	dbw $05, Cry_16_Ch6
	dbw $07, Cry_16_Ch8
; f354c

Cry_17: ; f354c
	dbw $84, Cry_17_Ch5
	dbw $05, Cry_17_Ch6
	dbw $07, Cry_17_Ch8
; f3555

Cry_18: ; f3555
	dbw $84, Cry_18_Ch5
	dbw $05, Cry_18_Ch6
	dbw $07, Cry_18_Ch8
; f355e

Cry_19: ; f355e
	dbw $84, Cry_19_Ch5
	dbw $05, Cry_19_Ch6
	dbw $07, Cry_19_Ch8
; f3567

Cry_1A: ; f3567
	dbw $84, Cry_1A_Ch5
	dbw $05, Cry_1A_Ch6
	dbw $07, Cry_1A_Ch8
; f3570

Cry_1B: ; f3570
	dbw $84, Cry_1B_Ch5
	dbw $05, Cry_1B_Ch6
	dbw $07, Cry_1B_Ch8
; f3579

Cry_1C: ; f3579
	dbw $84, Cry_1C_Ch5
	dbw $05, Cry_1C_Ch6
	dbw $07, Cry_1C_Ch8
; f3582

Cry_1D: ; f3582
	dbw $84, Cry_1D_Ch5
	dbw $05, Cry_1D_Ch6
	dbw $07, Cry_1D_Ch8
; f358b

Cry_1E: ; f358b
	dbw $84, Cry_1E_Ch5
	dbw $05, Cry_1E_Ch6
	dbw $07, Cry_1E_Ch8
; f3594

Cry_1F: ; f3594
	dbw $84, Cry_1F_Ch5
	dbw $05, Cry_1F_Ch6
	dbw $07, Cry_1F_Ch8
; f359d

Cry_20: ; f359d
	dbw $84, Cry_20_Ch5
	dbw $05, Cry_20_Ch6
	dbw $07, Cry_20_Ch8
; f35a6

Cry_21: ; f35a6
	dbw $84, Cry_21_Ch5
	dbw $05, Cry_21_Ch6
	dbw $07, Cry_21_Ch8
; f35af

Cry_22: ; f35af
	dbw $84, Cry_22_Ch5
	dbw $05, Cry_22_Ch6
	dbw $07, Cry_22_Ch8
; f35b8

Cry_23: ; f35b8
	dbw $84, Cry_23_Ch5
	dbw $05, Cry_23_Ch6
	dbw $07, Cry_23_Ch8
; f35c1

Cry_24: ; f35c1
	dbw $84, Cry_24_Ch5
	dbw $05, Cry_24_Ch6
	dbw $07, Cry_24_Ch8
; f35ca

Cry_25: ; f35ca
	dbw $84, Cry_25_Ch5
	dbw $05, Cry_25_Ch6
	dbw $07, Cry_25_Ch8
; f35d3

Unknown_Cry_Ch5: ; f35d3
	unknownmusic0xde $f0
	sound $f, $e0, $0780
	sound $f, $f0, $0784
	sound $f, $c3, $05e0
	sound $f, $c4, $0600
	sound $a, $6c, $0780
	sound $8, $71, $0784
	endchannel
; f35ee

Unknown_Cry_Ch6: ; f35ee
	unknownmusic0xde $5
	sound $f, $a0, $0741
	sound $f, $b0, $0743
	sound $f, $93, $05b1
	sound $f, $94, $05c1
	sound $a, $4c, $0741
	sound $8, $31, $0746
	endchannel
; f3609

Unknown_Cry_Ch8: ; f3609
	noise $2, $f2, $4c
	noise $6, $e0, $3a
	noise $f, $d0, $3a
	noise $8, $d0, $2c
	noise $6, $e6, $4c
	noise $c, $7d, $4c
	noise $f, $d3, $4c
	endchannel
; f361f

Cry_09_Ch5: ; f361f
	unknownmusic0xde $f0
	sound $f, $f7, $07a0
	sound $6, $e6, $07a3
	sound $a, $f4, $07a0
	unknownmusic0xde $a5
	sound $a, $f6, $07d8
	sound $4, $e3, $07d7
	sound $f, $f2, $07d8
	endchannel
; f363c

Cry_09_Ch6: ; f363c
	unknownmusic0xde $5
	sound $2, $8, $0000
	sound $f, $a7, $06a1
	sound $6, $86, $06a2
	sound $a, $74, $06a1
	unknownmusic0xde $5f
	sound $a, $76, $06d6
	sound $4, $83, $06d9
	sound $f, $a2, $06d7
	endchannel
; f365d

Cry_09_Ch8: ; f365d
	noise $2, $f2, $3c
	noise $8, $e4, $3e
	noise $f, $d7, $3c
	noise $6, $c5, $3b
	noise $6, $e4, $3d
	noise $8, $b6, $3c
	noise $6, $d4, $3d
	noise $8, $c1, $3b
	endchannel
; f3676

Cry_23_Ch5: ; f3676
	unknownmusic0xde $f0
	sound $f, $f7, $07c0
	sound $6, $e4, $07c1
	sound $a, $f6, $07c0
	sound $4, $d3, $07c2
	sound $8, $c1, $07c0
	endchannel
; f368d

Cry_23_Ch6: ; f368d
	unknownmusic0xde $5f
	sound $f, $97, $0781
	sound $6, $84, $0780
	sound $a, $96, $0781
	sound $f, $83, $0781
	endchannel
; f36a0

Cry_23_Ch8: ; f36a0
	noise $3, $f2, $3c
	noise $d, $e6, $2c
	noise $f, $d7, $3c
	noise $8, $c1, $2c
	endchannel
; f36ad

Cry_24_Ch5: ; f36ad
	unknownmusic0xde $f0
	sound $f, $f7, $0680
	sound $a, $e6, $0684
	sound $f, $d7, $0690
	sound $8, $d5, $0690
	sound $6, $c4, $0688
	sound $5, $d3, $0670
	sound $4, $d3, $0660
	sound $8, $c1, $0640
	endchannel
; f36d0

Cry_24_Ch6: ; f36d0
	unknownmusic0xde $5
	sound $f, $b7, $0641
	sound $a, $96, $0642
	sound $f, $a7, $0651
	sound $8, $a5, $0651
	sound $6, $94, $0647
	sound $5, $a3, $0631
	sound $4, $93, $0622
	sound $8, $71, $0601
	endchannel
; f36f3

Cry_24_Ch8: ; f36f3
	noise $f, $e4, $3c
	noise $a, $c7, $4c
	noise $a, $c7, $3c
	noise $c, $b7, $4c
	noise $f, $a2, $5c
	endchannel
; f3703

Cry_11_Ch5: ; f3703
	unknownmusic0xde $f0
	sound $6, $f7, $07a0
	sound $8, $e6, $07a4
	sound $4, $d6, $07a0
	sound $f, $d3, $0720
	sound $8, $c3, $0723
	sound $2, $c2, $0728
	sound $8, $b1, $0730
	endchannel
; f3722

Cry_11_Ch6: ; f3722
	unknownmusic0xde $a
	sound $4, $8, $0000
	sound $6, $a7, $0741
	sound $8, $86, $0743
	sound $4, $76, $0741
	sound $d, $83, $06c2
	sound $7, $73, $06c1
	sound $3, $82, $06cc
	sound $8, $71, $06d8
	endchannel
; f3745

Cry_11_Ch8: ; f3745
	noise $2, $f2, $4c
	noise $6, $e6, $3a
	noise $4, $d7, $3a
	noise $6, $d6, $2c
	noise $8, $e5, $3c
	noise $c, $d2, $3d
	noise $8, $d1, $2c
	endchannel
; f375b

Cry_25_Ch5: ; f375b
	unknownmusic0xde $a5
	sound $6, $f4, $0740
	sound $f, $e3, $0730
	sound $4, $f4, $0740
	sound $5, $b3, $0748
	sound $8, $d1, $0750
	endchannel
; f3772

Cry_25_Ch6: ; f3772
	unknownmusic0xde $77
	sound $6, $c3, $0712
	sound $f, $b3, $0704
	sound $3, $c3, $0712
	sound $4, $c3, $0721
	sound $8, $b1, $0732
	endchannel
; f3789

Cry_25_Ch8: ; f3789
	noise $8, $d6, $2c
	noise $c, $c6, $3c
	noise $a, $b6, $2c
	noise $8, $91, $1c
	endchannel
; f3796

Cry_03_Ch5: ; f3796
	unknownmusic0xde $f0
	sound $4, $f7, $0608
	sound $6, $e6, $0600
	sound $6, $d7, $05f0
	sound $6, $c4, $05e0
	sound $5, $d3, $05c0
	sound $4, $d3, $05a0
	sound $8, $e1, $0580
	endchannel
; f37b5

Cry_03_Ch6: ; f37b5
	unknownmusic0xde $a
	sound $4, $c7, $0504
	sound $6, $a6, $0502
	sound $6, $97, $04f1
	sound $4, $b4, $04e1
	sound $5, $a3, $04c2
	sound $4, $b3, $04a3
	sound $8, $c1, $0482
	endchannel
; f37d4

Cry_03_Ch8: ; f37d4
	noise $c, $e4, $4c
	noise $a, $c7, $5c
	noise $c, $b6, $4c
	noise $f, $a2, $5c
	endchannel
; f37e1

Cry_0F_Ch5: ; f37e1
	unknownmusic0xde $f1
	sound $4, $f7, $07c0
	sound $c, $e6, $07c2
	sound $6, $b5, $0680
	sound $4, $c4, $0670
	sound $4, $b5, $0660
	sound $8, $c1, $0640
	endchannel
; f37fc

Cry_0F_Ch6: ; f37fc
	unknownmusic0xde $cc
	sound $3, $c7, $0781
	sound $c, $b6, $0780
	sound $6, $a5, $0641
	sound $4, $c4, $0632
	sound $6, $b5, $0621
	sound $8, $a1, $0602
	endchannel
; f3817

Cry_0F_Ch8: ; f3817
	noise $3, $e4, $3c
	noise $c, $d6, $2c
	noise $4, $e4, $3c
	noise $8, $b7, $5c
	noise $f, $c2, $5d
	endchannel
; f3827

Cry_10_Ch5: ; f3827
	unknownmusic0xde $c9
	sound $8, $f7, $0680
	sound $2, $f7, $0660
	sound $1, $e7, $0640
	sound $1, $e7, $0620
	sound $f, $d1, $0600
	sound $4, $c7, $0740
	sound $4, $a7, $0730
	sound $f, $91, $0720
	endchannel
; f384a

Cry_10_Ch6: ; f384a
	unknownmusic0xde $79
	sound $a, $e7, $0682
	sound $2, $e7, $0662
	sound $1, $d7, $0642
	sound $1, $d7, $0622
	sound $f, $c1, $0602
	sound $4, $b7, $0742
	sound $2, $97, $0732
	sound $f, $81, $0722
	endchannel
; f386d

Cry_10_Ch8: ; f386d
	noise $4, $74, $21
	noise $4, $74, $10
	noise $4, $71, $20
	endchannel
; f3877

Cry_00_Ch5: ; f3877
	unknownmusic0xde $f5
	sound $4, $f3, $0718
	sound $f, $e5, $0798
	sound $8, $91, $0758
	endchannel
; f3886

Cry_00_Ch6: ; f3886
	unknownmusic0xde $a0
	sound $5, $b3, $0708
	sound $f, $c5, $0788
	sound $8, $71, $0748
	endchannel
; f3895

Cry_00_Ch8: ; f3895
	noise $3, $a1, $1c
	noise $e, $94, $2c
	noise $8, $81, $1c
	endchannel
; f389f

Cry_0E_Ch5: ; f389f
	unknownmusic0xde $a5
	sound $4, $e1, $0700
	sound $4, $f2, $0780
	sound $2, $92, $0740
	sound $8, $e1, $0600
	endchannel
; f38b2

Cry_0E_Ch6: ; f38b2
	unknownmusic0xde $a
	sound $4, $b1, $06e1
	sound $3, $c2, $06e1
	sound $3, $62, $0681
	sound $8, $b1, $05e1
	endchannel
; f38c5

Cry_0E_Ch8: ; f38c5
	noise $2, $61, $32
	noise $2, $61, $21
	noise $8, $61, $11
	endchannel
; f38cf

Cry_06_Ch5: ; f38cf
	unknownmusic0xde $fa
	sound $6, $83, $0247
	sound $f, $62, $0226
	sound $4, $52, $0245
	sound $9, $63, $0206
	sound $f, $82, $0225
	sound $f, $42, $0207
Cry_06_Ch6: ; f38e9
	endchannel
; f38ea

Cry_06_Ch8: ; f38ea
	noise $8, $d4, $8c
	noise $4, $e2, $9c
	noise $f, $c6, $8c
	noise $8, $e4, $ac
	noise $f, $d7, $9c
	noise $f, $f2, $ac
	endchannel
; f38fd

Cry_07_Ch5: ; f38fd
	unknownmusic0xde $f0
	sound $4, $f3, $06e0
	sound $f, $e4, $0640
	sound $8, $c1, $0620
	endchannel
; f390c

Cry_07_Ch6: ; f390c
	unknownmusic0xde $a
	sound $3, $c3, $0683
	sound $e, $b4, $0602
	sound $8, $a1, $0601
	endchannel
; f391b

Cry_07_Ch8: ; f391b
	noise $4, $d3, $5c
	noise $f, $e6, $4c
	noise $8, $b1, $5c
	endchannel
; f3925

Cry_05_Ch5: ; f3925
	unknownmusic0xde $a
	sound $6, $e2, $0500
	sound $6, $e3, $0580
	sound $6, $d3, $0570
	sound $8, $a1, $0560
	endchannel
; f3938

Cry_05_Ch6: ; f3938
	unknownmusic0xde $f5
	sound $6, $e2, $0482
	sound $6, $d3, $0501
	sound $6, $b2, $04e2
	sound $8, $81, $04c1
Cry_05_Ch8: ; f394a
	endchannel
; f394b

Cry_0B_Ch5: ; f394b
	unknownmusic0xde $cc
	sound $4, $f1, $0700
	sound $4, $e1, $0780
	sound $4, $d1, $0740
	sound $4, $e1, $0740
	sound $4, $f1, $0780
	sound $4, $d1, $0700
	sound $4, $f1, $0701
	sound $4, $d1, $0782
	sound $4, $c1, $0742
	sound $8, $b1, $0741
	endchannel
; f3976

Cry_0B_Ch6: ; f3976
	unknownmusic0xde $44
	sound $c, $8, $0000
	sound $4, $f1, $0701
	sound $4, $e1, $0782
	sound $4, $d1, $0741
	sound $4, $e1, $0741
	sound $4, $f1, $0782
	sound $8, $d1, $0701
	endchannel
; f3995

Cry_0B_Ch8: ; f3995
	noise $f, $8, $0
	noise $4, $8, $0
	noise $4, $d1, $4c
	noise $4, $b1, $2c
	noise $4, $d1, $3c
	noise $4, $b1, $3c
	noise $4, $c1, $2c
	noise $8, $a1, $4c
	endchannel
; f39ae

Cry_0C_Ch5: ; f39ae
	unknownmusic0xde $cc
	sound $8, $f5, $0600
	sound $2, $d2, $0638
	sound $2, $c2, $0630
	sound $2, $c2, $0628
	sound $2, $b2, $0620
	sound $2, $b2, $0610
	sound $2, $a2, $0618
	sound $2, $b2, $0610
	sound $8, $c1, $0620
	endchannel
; f39d5

Cry_0C_Ch6: ; f39d5
	unknownmusic0xde $44
	sound $c, $c3, $05c0
	sound $3, $b1, $05f9
	sound $2, $a1, $05f1
	sound $2, $a1, $05e9
	sound $2, $91, $05e1
	sound $2, $91, $05d9
	sound $2, $81, $05d1
	sound $2, $91, $05d9
	sound $8, $91, $05e1
Cry_0C_Ch8: ; f39fb
	endchannel
; f39fc

Cry_02_Ch5: ; f39fc
	unknownmusic0xde $0
	sound $8, $f5, $0480
	sound $2, $e1, $05e0
	sound $8, $d1, $05dc
	endchannel
; f3a0b

Cry_02_Ch6: ; f3a0b
	unknownmusic0xde $a5
	sound $7, $95, $0441
	sound $2, $81, $0521
	sound $8, $61, $051a
Cry_02_Ch8: ; f3a19
	endchannel
; f3a1a

Cry_0D_Ch5: ; f3a1a
Cry_0D_branch_f3a1a: ; f3a1a
	unknownmusic0xde $88
	sound $5, $f2, $0650
	sound $9, $d1, $0660
	sound $5, $e2, $0612
	sound $9, $c1, $0622
	sound $5, $f2, $0610
	sound $6, $d1, $0620
	loopchannel 2, Cry_0D_branch_f3a1a
	endchannel
; f3a39

Cry_0D_Ch6: ; f3a39
	unknownmusic0xde $40
	sound $4, $8, $0000
	sound $5, $f2, $0651
	sound $9, $d1, $0661
	sound $5, $e2, $0614
	sound $8, $c1, $0624
	sound $5, $f2, $0611
	sound $c, $d1, $0621
	sound $5, $e2, $0614
	sound $8, $c1, $0624
	sound $5, $f2, $0611
	sound $4, $d1, $0621
	endchannel
; f3a68

Cry_0D_Ch8: ; f3a68
	noise $6, $d2, $1c
	noise $9, $b1, $2c
	noise $8, $c2, $2c
	noise $9, $b1, $3c
	noise $6, $c2, $2c
	noise $9, $a2, $3c
	noise $7, $c2, $2c
	noise $5, $a1, $3c
	noise $9, $c2, $2c
	noise $4, $a1, $3c
	endchannel
; f3a87

Cry_01_Ch5: ; f3a87
	unknownmusic0xde $a0
	sound $4, $f3, $0600
	sound $8, $d5, $0760
	sound $3, $e2, $0720
	sound $8, $d1, $0710
	endchannel
; f3a9a

Cry_01_Ch6: ; f3a9a
	unknownmusic0xde $5a
	sound $5, $b3, $06f1
	sound $7, $c5, $0752
	sound $3, $a2, $0711
	sound $8, $b1, $0601
	endchannel
; f3aad

Cry_01_Ch8: ; f3aad
	noise $3, $a2, $3c
	noise $c, $94, $2c
	noise $3, $82, $1c
	noise $8, $71, $2c
	endchannel
; f3aba

Cry_0A_Ch5: ; f3aba
	unknownmusic0xde $f0
	sound $8, $f7, $06e0
	sound $6, $e6, $06e5
	sound $3, $f4, $06e0
	sound $3, $f6, $06d0
	sound $3, $e3, $06c0
	sound $4, $f2, $06b0
	sound $f, $a2, $06c8
	endchannel
; f3ad9

Cry_0A_Ch6: ; f3ad9
	unknownmusic0xde $5
	sound $3, $8, $0000
	sound $8, $a7, $06a1
	sound $6, $86, $06a3
	sound $3, $74, $06a1
	sound $3, $76, $0691
	sound $3, $83, $0682
	sound $4, $a2, $0671
	sound $f, $72, $0689
	endchannel
; f3afc

Cry_0A_Ch8: ; f3afc
	noise $2, $f2, $3c
	noise $8, $e4, $3e
	noise $8, $d7, $3c
	noise $5, $c5, $3b
	noise $3, $d4, $2c
	noise $2, $b6, $3c
	noise $3, $a4, $2c
	noise $8, $91, $3c
	endchannel
; f3b15

Cry_08_Ch5: ; f3b15
	unknownmusic0xde $f0
	sound $f, $f6, $0565
	sound $a, $e4, $057c
	sound $3, $c2, $055c
	sound $f, $b2, $053c
	endchannel
; f3b28

Cry_08_Ch6: ; f3b28
	unknownmusic0xde $5a
	sound $e, $d6, $0503
	sound $9, $b4, $051b
	sound $4, $92, $04fa
	sound $f, $a2, $04db
	endchannel
; f3b3b

Cry_08_Ch8: ; f3b3b
	noise $c, $e6, $4c
	noise $b, $d7, $5c
	noise $f, $c2, $4c
	endchannel
; f3b45

Cry_04_Ch5: ; f3b45
	unknownmusic0xde $f0
	sound $4, $f7, $06a0
	sound $8, $e6, $06a4
	sound $4, $d6, $06a0
	sound $c, $d3, $0620
	sound $8, $c3, $0624
	sound $4, $c2, $0620
	sound $8, $b1, $0610
	endchannel
; f3b64

Cry_04_Ch6: ; f3b64
	unknownmusic0xde $5a
	sound $4, $e7, $0601
	sound $8, $d6, $0603
	sound $4, $c6, $0601
	sound $c, $c3, $0581
	sound $8, $b3, $0583
	sound $4, $b2, $0582
	sound $8, $a1, $0571
	endchannel
; f3b83

Cry_04_Ch8: ; f3b83
	noise $7, $d6, $5c
	noise $8, $e6, $4c
	noise $4, $d4, $5c
	noise $4, $d4, $4c
	noise $7, $c3, $4c
	noise $8, $a1, $5c
	endchannel
; f3b96

Cry_19_Ch5: ; f3b96
	unknownmusic0xde $1b
	sound $7, $d2, $0740
	sound $f, $e5, $0760
	sound $18, $c1, $0730
	endchannel
; f3ba5

Cry_19_Ch6: ; f3ba5
	unknownmusic0xde $81
	sound $2, $c2, $0701
	sound $4, $c2, $0708
	sound $f, $d7, $0741
	sound $18, $a2, $0701
Cry_19_Ch8: ; f3bb7
	endchannel
; f3bb8

Cry_16_Ch5: ; f3bb8
	unknownmusic0xde $f0
	sound $f, $d7, $0780
	sound $4, $e6, $07a0
	sound $f, $d2, $0740
	endchannel
; f3bc7

Cry_16_Ch6: ; f3bc7
	unknownmusic0xde $5a
	sound $f, $c7, $0753
	sound $5, $b6, $0772
	sound $f, $c2, $0711
	endchannel
; f3bd6

Cry_16_Ch8: ; f3bd6
	noise $d, $f6, $4c
	noise $4, $e6, $3c
	noise $f, $f2, $4c
	endchannel
; f3be0

Cry_1B_Ch5: ; f3be0
	unknownmusic0xde $f0
	sound $6, $f7, $06c0
	sound $f, $e7, $0700
	sound $4, $f4, $06f0
	sound $4, $e4, $06e0
	sound $8, $d1, $06d0
	endchannel
; f3bf7

Cry_1B_Ch6: ; f3bf7
	unknownmusic0xde $a
	sound $7, $e6, $0681
	sound $e, $d5, $06c1
	sound $4, $c4, $06b1
	sound $4, $d4, $06a1
	sound $8, $c1, $0691
	endchannel
; f3c0e

Cry_1B_Ch8: ; f3c0e
	noise $a, $a6, $3c
	noise $e, $94, $2c
	noise $5, $a3, $3c
	noise $8, $91, $2c
	endchannel
; f3c1b

Cry_12_Ch5: ; f3c1b
	unknownmusic0xde $a5
	sound $c, $f2, $0440
	sound $f, $e3, $04a0
	sound $4, $d2, $0490
	sound $8, $d1, $0480
	endchannel
; f3c2e

Cry_12_Ch6: ; f3c2e
	unknownmusic0xde $ee
	sound $b, $d2, $0438
	sound $e, $c6, $0498
	sound $3, $b2, $0488
	sound $8, $b1, $0478
	endchannel
; f3c41

Cry_12_Ch8: ; f3c41
	noise $a, $e6, $6c
	noise $f, $d2, $5c
	noise $3, $c2, $6c
	noise $8, $d1, $5c
	endchannel
; f3c4e

Cry_13_Ch5: ; f3c4e
	unknownmusic0xde $33
	sound $f, $f6, $05c0
	sound $8, $e3, $05bc
	sound $6, $d2, $05d0
	sound $6, $b2, $05e0
	sound $6, $c2, $05f0
	sound $8, $b1, $0600
	endchannel
; f3c69

Cry_13_Ch6: ; f3c69
	unknownmusic0xde $99
	sound $e, $c6, $04b1
	sound $7, $c3, $04ad
	sound $5, $b2, $04c1
	sound $8, $92, $04d1
	sound $6, $a2, $04e1
	sound $8, $91, $04f1
	endchannel
; f3c84

Cry_13_Ch8: ; f3c84
	noise $a, $e6, $5c
	noise $a, $d6, $6c
	noise $4, $c2, $4c
	noise $6, $d3, $5c
	noise $8, $b3, $4c
	noise $8, $a1, $5c
	endchannel
; f3c97

Cry_14_Ch5: ; f3c97
	unknownmusic0xde $f0
	sound $8, $e4, $0790
	sound $f, $f5, $07c0
	sound $8, $d1, $07d8
	endchannel
; f3ca6

Cry_14_Ch6: ; f3ca6
	unknownmusic0xde $a5
	sound $a, $c4, $0771
	sound $f, $b6, $07a2
	sound $8, $a1, $07b7
	endchannel
; f3cb5

Cry_14_Ch8: ; f3cb5
	noise $8, $e4, $4c
	noise $e, $c4, $3c
	noise $8, $d1, $2c
	endchannel
; f3cbf

Cry_1E_Ch5: ; f3cbf
	unknownmusic0xde $f0
	sound $6, $f2, $0600
	sound $6, $e2, $0640
	sound $6, $d2, $0680
	sound $6, $e2, $06c0
	sound $6, $d2, $0700
	sound $6, $c2, $0740
	sound $6, $b2, $0780
	sound $8, $a1, $07c0
	endchannel
; f3ce2

Cry_1E_Ch6: ; f3ce2
	unknownmusic0xde $11
	sound $3, $8, $0001
	sound $6, $c2, $05c1
	sound $6, $b2, $0602
	sound $6, $a2, $0641
	sound $6, $b2, $0682
	sound $6, $a2, $06c2
	sound $6, $92, $0701
	sound $6, $a2, $0742
	sound $8, $81, $0781
	endchannel
; f3d09

Cry_1E_Ch8: ; f3d09
	noise $6, $8, $1
	noise $5, $e2, $5c
	noise $5, $c2, $4c
	noise $5, $d2, $3c
	noise $5, $b2, $2c
	noise $5, $c2, $1c
	noise $5, $a2, $1b
	noise $5, $92, $1a
	noise $8, $81, $18
	endchannel
; f3d25

Cry_15_Ch5: ; f3d25
	unknownmusic0xde $f0
	sound $4, $f3, $0780
	sound $f, $e7, $0700
	sound $8, $d3, $0710
	sound $4, $c2, $0700
	sound $4, $d2, $06f0
	sound $8, $c1, $06e0
	endchannel
; f3d40

Cry_15_Ch6: ; f3d40
	unknownmusic0xde $5a
	sound $6, $c3, $0701
	sound $e, $b7, $0681
	sound $7, $b3, $0692
	sound $3, $a2, $0681
	sound $4, $b2, $0672
	sound $8, $a1, $0661
	endchannel
; f3d5b

Cry_15_Ch8: ; f3d5b
	noise $6, $e3, $5c
	noise $e, $d6, $4c
	noise $6, $c6, $3c
	noise $3, $b3, $4c
	noise $3, $a2, $5c
	noise $8, $b1, $6c
	endchannel
; f3d6e

Cry_17_Ch5: ; f3d6e
	unknownmusic0xde $f
	sound $f, $f7, $0500
	sound $f, $e7, $0508
	sound $8, $b4, $0480
	sound $f, $a2, $0460
	endchannel
; f3d81

Cry_17_Ch6: ; f3d81
	unknownmusic0xde $44
	sound $e, $d7, $0481
	sound $e, $c7, $0489
	sound $a, $b4, $0401
	sound $f, $c2, $03e1
	endchannel
; f3d94

Cry_17_Ch8: ; f3d94
	noise $e, $f7, $7c
	noise $c, $f6, $6c
	noise $9, $e4, $7c
	noise $f, $e2, $6c
	endchannel
; f3da1

Cry_1C_Ch5: ; f3da1
	unknownmusic0xde $f5
	sound $7, $d6, $07e1
	sound $6, $c6, $07e2
	sound $9, $d6, $07e1
	sound $7, $c6, $07e0
	sound $5, $b6, $07e2
	sound $7, $c6, $07e1
	sound $6, $b6, $07e0
	sound $8, $a1, $07df
	endchannel
; f3dc4

Cry_1C_Ch6: ; f3dc4
	unknownmusic0xde $44
	sound $6, $c3, $07c9
	sound $6, $b3, $07c7
	sound $a, $c4, $07c3
	sound $8, $b4, $07c7
	sound $6, $c3, $07c9
	sound $f, $a2, $07c5
	endchannel
; f3ddf

Cry_1C_Ch8: ; f3ddf
	noise $d, $19, $7c
	noise $d, $f7, $8c
	noise $c, $d6, $7c
	noise $8, $c4, $6c
	noise $f, $b3, $5c
	endchannel
; f3def

Cry_1A_Ch5: ; f3def
	unknownmusic0xde $f0
	sound $6, $f7, $0740
	sound $c, $e6, $0744
	sound $6, $d5, $0750
	sound $4, $c3, $0760
	sound $3, $c3, $0780
	sound $8, $d1, $07a0
	endchannel
; f3e0a

Cry_1A_Ch6: ; f3e0a
	unknownmusic0xde $a
	sound $6, $c7, $0701
	sound $b, $b6, $0702
	sound $6, $a5, $0711
	sound $4, $93, $0721
	sound $3, $a3, $0741
	sound $8, $91, $0762
	endchannel
; f3e25

Cry_1A_Ch8: ; f3e25
	noise $3, $e2, $3c
	noise $8, $d6, $4c
	noise $5, $d4, $3c
	noise $c, $c7, $4c
	noise $2, $e2, $3c
	noise $8, $d1, $2c
	endchannel
; f3e38

Cry_1D_Ch5: ; f3e38
	unknownmusic0xde $f4
	sound $f, $f0, $0705
	sound $a, $e0, $0700
	sound $6, $b4, $0710
	sound $4, $d3, $0700
	sound $6, $b2, $0620
	sound $8, $a1, $0624
	endchannel
; f3e53

Cry_1D_Ch6: ; f3e53
	unknownmusic0xde $22
	sound $f, $b0, $06c3
	sound $a, $a0, $06c1
	sound $6, $84, $06d2
	sound $4, $93, $06c1
	sound $6, $82, $05e1
	sound $8, $61, $05e8
	endchannel
; f3e6e

Cry_1D_Ch8: ; f3e6e
	noise $6, $e6, $4c
	noise $f, $d6, $3c
	noise $a, $c5, $4a
	noise $1, $b2, $5b
	noise $f, $c2, $4c
	endchannel
; f3e7e

Cry_18_Ch5: ; f3e7e
	unknownmusic0xde $50
	sound $a, $f5, $0680
	sound $3, $e2, $06a0
	sound $3, $f2, $06c0
	sound $3, $e2, $06e0
	sound $3, $d2, $0700
	sound $3, $c2, $06e0
	sound $3, $d2, $06c0
	sound $8, $c1, $06a0
	endchannel
; f3ea1

Cry_18_Ch6: ; f3ea1
	unknownmusic0xde $f
	sound $9, $d5, $0631
	sound $3, $d2, $0652
	sound $3, $e2, $0671
	sound $3, $b2, $0691
	sound $3, $c2, $06b2
	sound $3, $b2, $0691
	sound $3, $c2, $0671
	sound $8, $b1, $0651
	endchannel
; f3ec4

Cry_18_Ch8: ; f3ec4
	noise $6, $e3, $4c
	noise $4, $c3, $3c
	noise $5, $d4, $3c
	noise $4, $c4, $2c
	noise $6, $b4, $3c
	noise $8, $c1, $2c
	endchannel
; f3ed7

Cry_1F_Ch5: ; f3ed7
	unknownmusic0xde $a5
	sound $3, $f4, $0641
	sound $d, $d6, $0721
	sound $8, $f4, $0719
	sound $8, $c1, $071a
	endchannel
; f3eea

Cry_1F_Ch6: ; f3eea
	unknownmusic0xde $cc
	sound $4, $f4, $0580
	sound $e, $e6, $06e0
	sound $8, $d5, $06d8
	sound $8, $d1, $06dc
	endchannel
; f3efd

Cry_1F_Ch8: ; f3efd
	noise $5, $c4, $46
	noise $d, $a5, $44
	noise $8, $c4, $45
	noise $8, $b1, $44
	endchannel
; f3f0a

Cry_20_Ch5: ; f3f0a
	unknownmusic0xde $f0
	sound $d, $f1, $0511
	sound $d, $e1, $0515
	sound $d, $e1, $0511
	sound $8, $d1, $0511
	endchannel
; f3f1d

Cry_20_Ch6: ; f3f1d
	unknownmusic0xde $15
	sound $c, $e1, $050c
	sound $c, $d1, $0510
	sound $e, $c1, $050c
	sound $8, $c1, $050a
	endchannel
; f3f30

Cry_20_Ch8: ; f3f30
	noise $e, $f2, $65
	noise $d, $e2, $55
	noise $e, $d2, $56
	noise $8, $d1, $66
	endchannel
; f3f3d

Cry_21_Ch5: ; f3f3d
	unknownmusic0xde $1b
	sound $3, $f3, $0564
	sound $2, $e2, $0544
	sound $5, $d1, $0522
	sound $2, $b2, $0484
	sound $8, $d1, $04a2
	sound $3, $f3, $0524
	sound $4, $e4, $04e4
	sound $8, $d1, $0502
	endchannel
; f3f60

Cry_21_Ch6: ; f3f60
	unknownmusic0xde $cc
	sound $3, $d3, $0560
	sound $2, $c2, $0540
	sound $5, $c1, $0520
	sound $2, $92, $0480
	sound $8, $c1, $04a0
	sound $3, $d3, $0520
	sound $3, $c4, $04e0
	sound $8, $c1, $0500
Cry_21_Ch8: ; f3f82
	endchannel
; f3f83

Cry_22_Ch5: ; f3f83
	unknownmusic0xde $11
	sound $2, $3d, $0381
	sound $7, $f5, $0601
	sound $1, $c2, $0481
	sound $8, $91, $0381
	endchannel
; f3f96

Cry_22_Ch6: ; f3f96
	unknownmusic0xde $ee
	sound $2, $3e, $05b0
	sound $7, $d5, $075d
	sound $1, $b2, $06b0
	sound $8, $61, $05b0
	endchannel
; f3fa9

Cry_22_Ch8: ; f3fa9
	noise $2, $92, $49
	noise $7, $b5, $29
	noise $1, $a2, $39
	noise $8, $91, $49
	endchannel
; f3fb6
