; PureRGBnote: CHANGED: framerate increased of coordinate movement, flapping rate left the same (every 3 frames)
DoFlyAnimation::
	ld a, 2 ; tracks when we will flap wings (every 3 frames)
	push af
.loop
	pop af
	push af
	and a ; is the flap counter at 0
	jr nz, .noFlapYet
	ld a, [wFlyAnimBirdSpriteImageIndex]
	xor $1 ; make the bird flap its wings
	ld [wFlyAnimBirdSpriteImageIndex], a
	ld [wSpritePlayerStateData1ImageIndex], a
.noFlapYet
	rst _DelayFrame ; delay only one frame between coordinate updates - looks smoother
	ld a, [wFlyAnimUsingCoordList]
	cp $ff
	jr z, .skipCopyingCoords ; if the bird is flapping its wings in place
	ld hl, wSpritePlayerStateData1YPixels
	ld a, [de]
	inc de
	ld [hli], a ; y
	inc hl
	ld a, [de]
	inc de
	ld [hl], a ; x
.skipCopyingCoords
	pop af ; flap now counter back in a
	dec a
	cp -1 ; was the flap counter at 0
	jr nz, .dontResetFlapCounter ; if not, don't reset it
	ld a, 2
.dontResetFlapCounter
	push af ; store flap counter
	ld a, [wFlyAnimCounter]
	dec a
	ld [wFlyAnimCounter], a
	jr nz, .loop
	pop af ; clear saved flap counter before exiting subroutine
	ret

FlyAnimationScreenCoords1:
; y, x pairs
; This is the sequence of screen coordinates used by the first part
; of the Fly overworld animation. ; PureRGBnote: CHANGED: updated to 60fps
	db 60, 72
	db 60, 75
	db 60, 78
	db 60, 80
	db 60, 82
	db 60, 85
	db 59, 88
	db 59, 91
	db 59, 94
	db 58, 96
	db 58, 98
	db 58, 101
	db 57, 104
	db 57, 107
	db 56, 110
	db 55, 112
	db 55, 115
	db 55, 118
	db 55, 120
	db 53, 123
	db 52, 126
	db 51, 128
	db 50, 130
	db 49, 133
	db 48, 136
	db 47, 139
	db 46, 142
	db 45, 144
	db 44, 146
	db 43, 149
	db 42, 152
	db 41, 155
	db 40, 158
	db 39, 160
	db 38, 163
	db 37, 166

FlyAnimationScreenCoords2:
; y, x pairs
; This is the sequence of screen coordinates used by the second part
; of the Fly overworld animation. ; PureRGBnote: CHANGED: updated to 60fps
	db  26, 144
	db  26, 139
	db  26, 134
	db  25, 128
	db  24, 121
	db  24, 116  
	db  23, 112
	db  23, 107
	db  22, 102
	db  21,  96
	db  20,  91
	db  19,  86
	db  18,  80
	db  17,  75
	db  16,  70
	db  15,  64
	db  14,  59
	db  13,  54
	db  12,  48
	db  11,  43
	db  10,  38
	db   9,  32
	db   8,  27
	db   6,  22
	db   5,  16
	db   3,  11
	db   1,   6
	db   0,   0
	db   0,   0
	db 250,   0
	db 240,   0
	db 235,   0
	db 230,   0

FlyAnimationEnterScreenCoords:
; y, x pairs
; This is the sequence of screen coordinates used by the overworld
; Fly animation when the player is entering a map. ; PureRGBnote: CHANGED: updated to 60fps
	db  5, 152
	db  8, 149
	db 11, 146
	db 15, 144
	db 18, 141
	db 21, 138
	db 24, 136
	db 27, 133
	db 30, 130
	db 32, 128
	db 34, 125
	db 37, 122
	db 39, 120
	db 41, 117
	db 43, 114
	db 45, 112
	db 47, 109
	db 48, 106
	db 50, 104
	db 51, 101
	db 53,  98
	db 54,  96
	db 55,  93
	db 56,  90
	db 57,  88
	db 58,  85
	db 58,  82
	db 59,  80
	db 59,  77
	db 59,  74
	db 60,  72
	db 60,  69
	db 60,  66
	db 60,  64
	db 60,  64
	db 60,  64 ; last pixel coords must be exactly this or sprite will appear misaligned
