; Minimal WLA-DX smoke test for the structured port branch.
; It intentionally does not include or replace any RGBDS source files.

.INCLUDE "wla/wla-memorymap.asm"
.INCLUDE "wla/macros_compat.asm"

.SECTION "Header" BANK 0 SLOT 0 ORGA $0100
  nop
  jp Start
  .DSB $4C, $00
.ENDS

.SECTION "StartCode" BANK 0 SLOT 0 ORGA $0150
Start:
  di
Forever:
  jr Forever
.ENDS

.SECTION "Bank1Smoke" BANK 1 SLOT 1 FREE
  .DB $42
.ENDS
