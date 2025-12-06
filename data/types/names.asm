TypeNames:
	table_width 2

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bird
	dw .Bug
	dw .Ghost
	dw .Steel

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon
	dw .Dark
	dw .Fairy

	assert_table_length NUM_TYPES

.Normal:   db "Normal@"
.Fighting: db "Fighting@"
.Flying:   db "Flying@"
.Poison:   db "Poison@"
.Fire:     db "Fire@"
.Water:    db "Water@"
.Grass:    db "Grass@"
.Electric: db "Electric@"
.Psychic:  db "Psychic@"
.Ice:      db "Ice@"
.Ground:   db "Ground@"
.Rock:     db "Rock@"
.Bird:     db "Normal@"
.Bug:      db "Bug@"
.Ghost:    db "Ghost@"
.Dragon:   db "Dragon@"
.Steel:    db "Steel@"
.Dark:     db "Dark@"
.Fairy:    db "Fairy@"
