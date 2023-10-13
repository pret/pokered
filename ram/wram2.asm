SECTION "GBC WRAM", WRAMX
; wram that can be only used on GBC, switched out with the addresses of section WRAM 1 if 2 is written to rSVBK
; starts at address $d000 just like section WRAM 1
wGBCFullPalBuffer:: ds 128