; Type names for battle print_type

TypeNames:
.DW .Normal
.DW .Fighting
.DW .Flying
.DW .Poison
.DW .Ground
.DW .Rock
.DW .Bird
.DW .Bug
.DW .Ghost

; 11 unused types (REPT loop expanded)
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal
.DW .Normal

.DW .Fire
.DW .Water
.DW .Grass
.DW .Electric
.DW .Psychic
.DW .Ice
.DW .Dragon

.Normal:   db "NORMAL@"
.Fighting: db "FIGHTING@"
.Flying:   db "FLYING@"
.Poison:   db "POISON@"
.Ground:   db "GROUND@"
.Rock:     db "ROCK@"
.Bird:     db "BIRD@"
.Bug:      db "BUG@"
.Ghost:    db "GHOST@"
.Fire:     db "FIRE@"
.Water:    db "WATER@"
.Grass:    db "GRASS@"
.Electric: db "ELECTRIC@"
.Psychic:  db "PSYCHIC@"
.Ice:      db "ICE@"
.Dragon:   db "DRAGON@"
