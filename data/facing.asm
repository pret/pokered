SpriteFacingAndAnimationTable: ; 4000 (1:4000)
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; facing down, walk animation frame 0
	dw SpriteFacingDownAndWalking, SpriteOAMParameters         ; facing down, walk animation frame 1
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; facing down, walk animation frame 2
	dw SpriteFacingDownAndWalking, SpriteOAMParametersFlipped  ; facing down, walk animation frame 3
	dw SpriteFacingUpAndStanding, SpriteOAMParameters          ; facing up, walk animation frame 0
	dw SpriteFacingUpAndWalking, SpriteOAMParameters           ; facing up, walk animation frame 1
	dw SpriteFacingUpAndStanding, SpriteOAMParameters          ; facing up, walk animation frame 2
	dw SpriteFacingUpAndWalking, SpriteOAMParametersFlipped    ; facing up, walk animation frame 3
	dw SpriteFacingLeftAndStanding, SpriteOAMParameters        ; facing left, walk animation frame 0
	dw SpriteFacingLeftAndWalking, SpriteOAMParameters         ; facing left, walk animation frame 1
	dw SpriteFacingLeftAndStanding, SpriteOAMParameters        ; facing left, walk animation frame 2
	dw SpriteFacingLeftAndWalking, SpriteOAMParameters         ; facing left, walk animation frame 3
	dw SpriteFacingLeftAndStanding, SpriteOAMParametersFlipped ; facing right, walk animation frame 0
	dw SpriteFacingLeftAndWalking, SpriteOAMParametersFlipped  ; facing right, walk animation frame 1
	dw SpriteFacingLeftAndStanding, SpriteOAMParametersFlipped ; facing right, walk animation frame 2
	dw SpriteFacingLeftAndWalking, SpriteOAMParametersFlipped  ; facing right, walk animation frame 3
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; ---
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; This table is used for sprites $a and $b.
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; All orientation and animation parameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; lead to the same result. Used for immobile
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; sprites like items on the ground
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; ---
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters

SpriteFacingDownAndStanding: ; 4080 (1:4080)
	db $00,$01,$02,$03
SpriteFacingDownAndWalking: ; 4084 (1:4084)
	db $80,$81,$82,$83
SpriteFacingUpAndStanding: ; 4088 (1:4088)
	db $04,$05,$06,$07
SpriteFacingUpAndWalking: ; 408c (1:408c)
	db $84,$85,$86,$87
SpriteFacingLeftAndStanding: ; 4090 (1:4090)
	db $08,$09,$0a,$0b
SpriteFacingLeftAndWalking: ; 4094 (1:4094)
	db $88,$89,$8a,$8b

SpriteOAMParameters: ; 4098 (1:4098)
	db $00,$00, $00                                      ; top left
	db $00,$08, $00                                      ; top right
	db $08,$00, OAMFLAG_CANBEMASKED                      ; bottom left
	db $08,$08, OAMFLAG_CANBEMASKED | OAMFLAG_ENDOFDATA  ; bottom right
SpriteOAMParametersFlipped: ; 40a4 (1:40a4)
	db $00,$08, OAMFLAG_VFLIPPED
	db $00,$00, OAMFLAG_VFLIPPED
	db $08,$08, OAMFLAG_VFLIPPED | OAMFLAG_CANBEMASKED
	db $08,$00, OAMFLAG_VFLIPPED | OAMFLAG_CANBEMASKED | OAMFLAG_ENDOFDATA
