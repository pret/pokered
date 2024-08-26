
: ; Outside of section

SECTION "Anonymous label errors test", ROM0

	db :-- ; Reference goes too far back

; Uncomment this if you're a badass with a *lot* of RAM
; REPT 2147483647
; :
; ENDR
; REPT 2147483647
; :
; ENDR
; 	db :+ ; OK
; 	db :++ ; Reference goes too far

:: ; Syntax error, can't export this
