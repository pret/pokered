; OAM flags used by this game
OAMFLAG_ENDOFDATA   EQU %00000001 ; pseudo OAM flag, only used by game logic
OAMFLAG_CANBEMASKED EQU %00000010 ; pseudo OAM flag, only used by game logic
OAMFLAG_VFLIPPED    EQU %00100000 ; OAM flag flips the sprite vertically.
; Used for making left facing sprites face right and to alternate between left and right foot animation when walking up or down

; OAM attribute flags
OAM_PALETTE   EQU %111
OAM_TILE_BANK EQU 3
OAM_OBP_NUM   EQU 4 ; Non CGB Mode Only
OAM_X_FLIP    EQU 5
OAM_Y_FLIP    EQU 6
OAM_PRIORITY  EQU 7 ; 0: OBJ above BG, 1: OBJ behind BG (colors 1-3)

; OAM attribute masks
OAM_HFLIP     EQU 1 << OAM_X_FLIP ; horizontal flip
OAM_VFLIP     EQU 1 << OAM_Y_FLIP ; vertical flip
OAM_BEHIND_BG EQU 1 << OAM_PRIORITY ; behind bg (except color 0)
