; Some functions like IsInArray use value $FF as a list terminator.
DEF FF_TERMINATED_CONST EQU $FF - 1

; Tileset IDs values are limited by the fact that the function LoadTilesetHeader (engine/overworld/tilesets.asm) multiply the ID by 8 before taking carry into account.
; Hence any value bigger than 31 would overflow.
; Note : even without this limitation, would be FF_TERMINATED_CONST
DEF TILESET_CONST_LIMIT EQU $FF / 8

; Pokemons and trainers share ID values, trainer values start at 200, making 199 the last pokemon ID value available.
; Note : even without this limitation, would be FF_TERMINATED_CONST
DEF POKEMON_CONST_LIMIT EQU 200 - 1

; Trainer constant value is limited by its matching OPP_* ID which start at 200.
; Opp_* constants are also FF_TERMINATED_CONST
DEF TRAINER_CONST_LIMIT EQU FF_TERMINATED_CONST - (POKEMON_CONST_LIMIT + 1)

