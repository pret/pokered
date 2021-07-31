TypeNames:
	table_width 2, TypeNames

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

	assert_table_length NUM_TYPES

.Normal:   db "NORMAL@"
.Fighting: db "LUCHA@"
.Flying:   db "VOLADOR@"
.Poison:   db "VENENO@"
.Fire:     db "FUEGO@"
.Water:    db "AGUA@"
.Grass:    db "PLANTA@"
.Electric: db "ELÉCTRIC@"
.Psychic:  db "PSÍQUICO@"
.Ice:      db "HIELO@"
.Ground:   db "TIERRA@"
.Rock:     db "ROCA@"
.Bird:     db "PÁJARO@"
.Bug:      db "BICHO@"
.Ghost:    db "FANTASMA@"
.Dragon:   db "DRAGÓN@"
