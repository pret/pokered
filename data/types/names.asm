TypeNames:
	table_width 2

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Typeless
	dw .Bug
	dw .Ghost
	dw .Crystal
	dw .Ground ; bonemerang type

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR
	dw .Tri
	dw .Floating
	dw .Magma
	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon

	assert_table_length NUM_TYPES

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
.Typeless: db "NONE@"
.Bug:      db "BUG@"
.Ghost:    db "GHOST@"
.Dragon:   db "DRAGON@"
.Tri:      db "TRI@"
.Crystal:  db "CRYSTAL@"
.Floating: db "FLOATING@"
.Magma:    db "MAGMA@"
