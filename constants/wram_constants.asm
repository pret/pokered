
SPRITEBUFFERSIZE EQU 7*7 * 8 ; 7 * 7 (tiles) * 8 (bytes per tile)

; Overload wGrassMons
wSerialEnemyDataBlock EQU $d893 ; wGrassMons + 11

; Overload enemy party data
W_WATERRATE EQU $d8a4 ; wEnemyMon1Species
W_WATERMONS EQU $d8a5 ; wEnemyMon1Species + 1

