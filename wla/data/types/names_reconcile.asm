; Reconciled from master RGBDS source: data/types/names.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; Type name pointers and string labels
TypeNames:
; table_width is RGBDS-only; dropped.
; REPT UNUSED_TYPES_END - UNUSED_TYPES expanded to explicit .DW entries.
; assert_table_length is RGBDS-only; dropped. Validation by direct count.

.DW .Normal
.DW .Fighting
.DW .Flying
.DW .Poison
.DW .Ground
.DW .Rock
.DW .Bird
.DW .Bug
.DW .Ghost

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
.Fire:     .DB "FIRE@"
.Water:    .DB "WATER@"
.Grass:    .DB "GRASS@"
.Electric: .DB "ELECTRIC@"
.Psychic:  .DB "PSYCHIC@"
.Ice:      .DB "ICE@"
.Ground:   .DB "GROUND@"
.Rock:     .DB "ROCK@"
.Bird:     .DB "BIRD@"
.Bug:      .DB "BUG@"
.Ghost:    .DB "GHOST@"
.Dragon:   .DB "DRAGON@"
