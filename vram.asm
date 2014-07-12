vChars0 EQU $8000
vChars1 EQU $8800
vChars2 EQU $9000
vBGMap0 EQU $9800
vBGMap1 EQU $9c00

; Battle/Menu
vSprites  EQU vChars0
vFont     EQU vChars1
vFrontPic EQU vChars2
vBackPic  EQU vFrontPic + 7 * 7 * $10

; Overworld
vNPCSprites  EQU vChars0
vNPCSprites2 EQU vChars1
vTileset     EQU vChars2

; Title
vTitleLogo  EQU vChars1
vTitleLogo2 EQU vFrontPic + 7 * 7 * $10

