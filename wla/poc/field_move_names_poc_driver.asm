; Structured-port proof of concept for one real master-tree unit:
; data/moves/field_move_names.asm

.INCLUDE "wla/wla-memorymap.asm"

.SECTION "FieldMoveNamesUnit" BANK 1 SLOT 1 FREE
	.INCLUDE "wla/data/moves/field_move_names_reconcile.asm"
.ENDS
