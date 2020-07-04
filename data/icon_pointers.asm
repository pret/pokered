MonPartySpritePointers:
	dw SlowbroSprite + $c0
	db $40 / $10 ; 40 bytes
	db BANK(SlowbroSprite)
	dw vSprites

	dw BallSprite
	db $80 / $10 ; $80 bytes
	db BANK(BallSprite)
	dw vSprites + $40

	dw ClefairySprite + $c0
	db $40 / $10 ; $40 bytes
	db BANK(ClefairySprite)
	dw vSprites + $c0

	dw BirdSprite + $c0
	db $40 / $10 ; $40 bytes
	db BANK(BirdSprite)
	dw vSprites + $100

	dw SeelSprite
	db $40 / $10 ; $40 bytes
	db BANK(SeelSprite)
	dw vSprites + $140

	dw BugIconFrame2
	db $10 / $10 ; $10 bytes
	db BANK(BugIconFrame2)
	dw vSprites + $180

	dw BugIconFrame2 + $10
	db $10 / $10 ; $10 bytes
	db BANK(BugIconFrame2)
	dw vSprites + $1a0

	dw PlantIconFrame2
	db $10 / $10 ; $10 bytes
	db BANK(PlantIconFrame2)
	dw vSprites + $1c0

	dw PlantIconFrame2 + $10
	db $10 / $10 ; $10 bytes
	db BANK(PlantIconFrame2)
	dw vSprites + $1e0

	dw SnakeIconFrame1
	db $10 / $10 ; $10 bytes
	db BANK(SnakeIconFrame1)
	dw vSprites + $200

	dw SnakeIconFrame1 + $10
	db $10 / $10 ; $10 bytes
	db BANK(SnakeIconFrame1)
	dw vSprites + $220

	dw QuadrupedIconFrame1
	db $10 / $10 ; $10 bytes
	db BANK(QuadrupedIconFrame1)
	dw vSprites + $240

	dw QuadrupedIconFrame1 + $10
	db $10 / $10 ; $10 bytes
	db BANK(QuadrupedIconFrame1)
	dw vSprites + $260

	dw TradeBubbleIconGFX
	db $40 / $10 ; $40 bytes
	db BANK(TradeBubbleIconGFX)
	dw vSprites + $380

	dw SlowbroSprite
	db $40 / $10 ; $40 bytes
	db BANK(SlowbroSprite)
	dw vSprites + $400

	dw BallSprite
	db $80 / $10 ; $80 bytes
	db BANK(BallSprite)
	dw vSprites + $440

	dw ClefairySprite
	db $40 / $10 ; $40 bytes
	db BANK(ClefairySprite)
	dw vSprites + $4c0

	dw BirdSprite
	db $40 / $10 ; $40 bytes
	db BANK(BirdSprite)
	dw vSprites + $500

	dw SeelSprite + $C0
	db $40 / $10 ; $40 bytes
	db BANK(SeelSprite)
	dw vSprites + $540

	dw BugIconFrame1
	db $10 / $10 ; $10 bytes
	db BANK(BugIconFrame1)
	dw vSprites + $580

	dw BugIconFrame1 + $10
	db $10 / $10 ; $10 bytes
	db BANK(BugIconFrame1)
	dw vSprites + $5a0

	dw PlantIconFrame1
	db $10 / $10 ; $10 bytes
	db BANK(PlantIconFrame1)
	dw vSprites + $5c0

	dw PlantIconFrame1 + $10
	db $10 / $10 ; $10 bytes
	db BANK(PlantIconFrame1)
	dw vSprites + $5E0

	dw SnakeIconFrame2
	db $10 / $10 ; $10 bytes
	db BANK(SnakeIconFrame2)
	dw vSprites + $600

	dw SnakeIconFrame2 + $10
	db $10 / $10 ; $10 bytes
	db BANK(SnakeIconFrame2)
	dw vSprites + $620

	dw QuadrupedIconFrame2
	db $10 / $10 ; $10 bytes
	db BANK(QuadrupedIconFrame2)
	dw vSprites + $640

	dw QuadrupedIconFrame2 + $10
	db $10 / $10 ; $10 bytes
	db BANK(QuadrupedIconFrame2)
	dw vSprites + $660

	dw TradeBubbleIconGFX + $40
	db $40 / $10 ; $40 bytes
	db BANK(TradeBubbleIconGFX)
	dw vSprites + $780
