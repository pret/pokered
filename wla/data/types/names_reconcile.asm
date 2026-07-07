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

.Normal:   .DB "NORMAL@"
.Fighting: .DB "FIGHTING@"
.Flying:   .DB "FLYING@"
.Poison:   .DB "POISON@"
.Ground:   .DB "GROUND@"
.Rock:     .DB "ROCK@"
.Bird:     .DB "BIRD@"
.Bug:      .DB "BUG@"
.Ghost:    .DB "GHOST@"
.Fire:     .DB "FIRE@"
.Water:    .DB "WATER@"
.Grass:    .DB "GRASS@"
.Electric: .DB "ELECTRIC@"
.Psychic:  .DB "PSYCHIC@"
.Ice:      .DB "ICE@"
.Dragon:   .DB "DRAGON@"
