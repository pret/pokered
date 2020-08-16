TypeNames:

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bird
	dw .Bug
	dw .Ghost

REPT FIRE - GHOST - 1
	dw .Normal
ENDR

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon

IF DEF(_ENGLISH)
.Normal:   db "NORMAL@"
.Fighting: db "FIGHTING@"
.Flying:   db "FLYING@"
.Poison:   db "POISON@"
.Fire:     db "FIRE@"
.Water:    db "WATER@"
.Grass:    db "GRASS@"
.Electric: db "ELECTRIC@"
.Psychic:  db "PSYCHIC@"
.Ice:      db "ICE@"
.Ground:   db "GROUND@"
.Rock:     db "ROCK@"
.Bird:     db "BIRD@"
.Bug:      db "BUG@"
.Ghost:    db "GHOST@"
.Dragon:   db "DRAGON@"
ENDC

IF DEF(_GERMAN)
.Normal:   db "NORMAL@"
.Fighting: db "KAMPF@"
.Flying:   db "FLUG@"
.Poison:   db "GIFT@"
.Fire:     db "FEUER@"
.Water:    db "WASSER@"
.Grass:    db "PFLANZE@"
.Electric: db "ELEKTRO@"
.Psychic:  db "PSYCHO@"
.Ice:      db "EIS@"
.Ground:   db "BODEN@"
.Rock:     db "GESTEIN@"
.Bird:     db "VOGEL@"
.Bug:      db "KÄFER@"
.Ghost:    db "GEIST@"
.Dragon:   db "DRACHEN@"
ENDC
