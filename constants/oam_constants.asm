; OAM flags used by this game
OAMFLAG_ENDOFDATA   EQU %00000001 ; pseudo OAM flag, only used by game logic
OAMFLAG_CANBEMASKED EQU %00000010 ; pseudo OAM flag, only used by game logic

; OAM attribute flags
OAM_PALETTE   EQU %111
OAM_TILE_BANK EQU 3
OAM_OBP_NUM   EQU 4 ; Non CGB Mode Only
OAM_X_FLIP    EQU 5
OAM_Y_FLIP    EQU 6
OAM_PRIORITY  EQU 7 ; 0: OBJ above BG, 1: OBJ behind BG (colors 1-3)

; OAM attribute masks
OAM_OBP1      EQU 1 << OAM_OBP_NUM  ; OBJ palette 1
OAM_HFLIP     EQU 1 << OAM_X_FLIP   ; horizontal flip
OAM_VFLIP     EQU 1 << OAM_Y_FLIP   ; vertical flip
OAM_BEHIND_BG EQU 1 << OAM_PRIORITY ; behind bg (except color 0)
