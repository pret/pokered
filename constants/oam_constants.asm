; OAM flags used by this game
OAMFLAG_ENDOFDATA   EQU %00000001 ; pseudo OAM flag, only used by game logic
OAMFLAG_CANBEMASKED EQU %00000010 ; pseudo OAM flag, only used by game logic
OAMFLAG_VFLIPPED    EQU %00100000 ; OAM flag flips the sprite vertically.
; Used for making left facing sprites face right and to alternate between left and right foot animation when walking up or down

; OAM attribute flags
OAM_HFLIP EQU %00100000 ; horizontal flip
OAM_VFLIP EQU %01000000 ; vertical flip
