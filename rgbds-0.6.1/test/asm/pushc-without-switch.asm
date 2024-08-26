; Triggering a charmap realloc while the charmap has been pushed onto the stack used
; to induce a use-after-free.
pushc
charmap "000000000000000000000000000000000",12
popc
charmap "000000000000000000000000000000000",34
