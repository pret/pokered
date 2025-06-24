;******************************************************************************
; Game Boy hardware constant definitions
; https://github.com/gbdev/hardware.inc
;******************************************************************************

; To the extent possible under law, the authors of this work have
; waived all copyright and related or neighboring rights to the work.
; See https://creativecommons.org/publicdomain/zero/1.0/ for details.
; SPDX-License-Identifier: CC0-1.0

; If this file was already included, don't do it again
if !def(HARDWARE_INC)

; Check for the minimum supported RGBDS version
if !def(__RGBDS_MAJOR__) || !def(__RGBDS_MINOR__) || !def(__RGBDS_PATCH__)
    fail "This version of 'hardware.inc' requires RGBDS version 0.5.0 or later"
endc
if __RGBDS_MAJOR__ == 0 && __RGBDS_MINOR__ < 5
    fail "This version of 'hardware.inc' requires RGBDS version 0.5.0 or later."
endc

; Define the include guard and the current hardware.inc version
; (do this after the RGBDS version check since the `def` syntax depends on it)
def HARDWARE_INC equ 1
def HARDWARE_INC_VERSION equs "5.1.0"

; Usage: rev_Check_hardware_inc <min_ver>
; Examples:
;     rev_Check_hardware_inc 1.2.3
;     rev_Check_hardware_inc 1.2   (equivalent to 1.2.0)
;     rev_Check_hardware_inc 1     (equivalent to 1.0.0)
MACRO rev_Check_hardware_inc
    if _NARG == 1 ; Actual invocation by the user
        def hw_inc_cur_ver\@ equs strrpl("{HARDWARE_INC_VERSION}", ".", ",")
        def hw_inc_min_ver\@ equs strrpl("\1", ".", ",")
        rev_Check_hardware_inc {hw_inc_cur_ver\@}, {hw_inc_min_ver\@}, 0, 0
        purge hw_inc_cur_ver\@, hw_inc_min_ver\@
    else ; Recursive invocation
        if \1 != \4 || (\2 < \5 || (\2 == \5 && \3 < \6))
            fail "Version \1.\2.\3 of 'hardware.inc' is incompatible with requested version \4.\5.\6"
        endc
    endc
ENDM


;******************************************************************************
; Memory-mapped registers ($FFxx range)
;******************************************************************************

; -- JOYP / P1 ($FF00) --------------------------------------------------------
; Joypad face buttons
def rJOYP equ $FF00

def B_JOYP_GET_BUTTONS  equ 5 ; 0 = reading buttons     [r/w]
def B_JOYP_GET_CTRL_PAD equ 4 ; 0 = reading Control Pad [r/w]
    def JOYP_GET equ %00_11_0000 ; select which inputs to read from the lower nybble
        def JOYP_GET_BUTTONS  equ %00_01_0000 ; reading A/B/Select/Start buttons
        def JOYP_GET_CTRL_PAD equ %00_10_0000 ; reading Control Pad directions
        def JOYP_GET_NONE     equ %00_11_0000 ; reading nothing

def B_JOYP_START  equ 3 ; 0 = Start is pressed  (if reading buttons)     [ro]
def B_JOYP_SELECT equ 2 ; 0 = Select is pressed (if reading buttons)     [ro]
def B_JOYP_B      equ 1 ; 0 = B is pressed      (if reading buttons)     [ro]
def B_JOYP_A      equ 0 ; 0 = A is pressed      (if reading buttons)     [ro]
def B_JOYP_DOWN   equ 3 ; 0 = Down is pressed   (if reading Control Pad) [ro]
def B_JOYP_UP     equ 2 ; 0 = Up is pressed     (if reading Control Pad) [ro]
def B_JOYP_LEFT   equ 1 ; 0 = Left is pressed   (if reading Control Pad) [ro]
def B_JOYP_RIGHT  equ 0 ; 0 = Right is pressed  (if reading Control Pad) [ro]
    def JOYP_INPUTS equ %0000_1111
    def JOYP_START  equ 1 << B_JOYP_START
    def JOYP_SELECT equ 1 << B_JOYP_SELECT
    def JOYP_B      equ 1 << B_JOYP_B
    def JOYP_A      equ 1 << B_JOYP_A
    def JOYP_DOWN   equ 1 << B_JOYP_DOWN
    def JOYP_UP     equ 1 << B_JOYP_UP
    def JOYP_LEFT   equ 1 << B_JOYP_LEFT
    def JOYP_RIGHT  equ 1 << B_JOYP_RIGHT

; Combined input byte, with Control Pad in high nybble (conventional order)
def B_PAD_DOWN   equ 7
def B_PAD_UP     equ 6
def B_PAD_LEFT   equ 5
def B_PAD_RIGHT  equ 4
def B_PAD_START  equ 3
def B_PAD_SELECT equ 2
def B_PAD_B      equ 1
def B_PAD_A      equ 0
    def PAD_CTRL_PAD equ %1111_0000
    def PAD_BUTTONS  equ %0000_1111
    def PAD_DOWN     equ 1 << B_PAD_DOWN
    def PAD_UP       equ 1 << B_PAD_UP
    def PAD_LEFT     equ 1 << B_PAD_LEFT
    def PAD_RIGHT    equ 1 << B_PAD_RIGHT
    def PAD_START    equ 1 << B_PAD_START
    def PAD_SELECT   equ 1 << B_PAD_SELECT
    def PAD_B        equ 1 << B_PAD_B
    def PAD_A        equ 1 << B_PAD_A


; Combined input byte, with Control Pad in low nybble (swapped order)
def B_PAD_SWAP_START  equ 7
def B_PAD_SWAP_SELECT equ 6
def B_PAD_SWAP_B      equ 5
def B_PAD_SWAP_A      equ 4
def B_PAD_SWAP_DOWN   equ 3
def B_PAD_SWAP_UP     equ 2
def B_PAD_SWAP_LEFT   equ 1
def B_PAD_SWAP_RIGHT  equ 0
    def PAD_SWAP_CTRL_PAD equ %0000_1111
    def PAD_SWAP_BUTTONS  equ %1111_0000
    def PAD_SWAP_START    equ 1 << B_PAD_SWAP_START
    def PAD_SWAP_SELECT   equ 1 << B_PAD_SWAP_SELECT
    def PAD_SWAP_B        equ 1 << B_PAD_SWAP_B
    def PAD_SWAP_A        equ 1 << B_PAD_SWAP_A
    def PAD_SWAP_DOWN     equ 1 << B_PAD_SWAP_DOWN
    def PAD_SWAP_UP       equ 1 << B_PAD_SWAP_UP
    def PAD_SWAP_LEFT     equ 1 << B_PAD_SWAP_LEFT
    def PAD_SWAP_RIGHT    equ 1 << B_PAD_SWAP_RIGHT

; -- SB ($FF01) ---------------------------------------------------------------
; Serial transfer data [r/w]
def rSB equ $FF01

; -- SC ($FF02) ---------------------------------------------------------------
; Serial transfer control
def rSC equ $FF02

def B_SC_START  equ 7 ; reading 1 = transfer in progress, writing 1 = start transfer        [r/w]
def B_SC_SPEED  equ 1 ; (CGB only) 1 = use faster internal clock                            [r/w]
def B_SC_SOURCE equ 0 ; 0 = use external clock ("slave"), 1 = use internal clock ("master") [r/w]
    def SC_START  equ 1 << B_SC_START
    def SC_SPEED  equ 1 << B_SC_SPEED
        def SC_SLOW equ 0 << B_SC_SPEED
        def SC_FAST equ 1 << B_SC_SPEED
    def SC_SOURCE equ 1 << B_SC_SOURCE
        def SC_EXTERNAL equ 0 << B_SC_SOURCE
        def SC_INTERNAL equ 1 << B_SC_SOURCE

; -- $FF03 is unused ----------------------------------------------------------

; -- DIV ($FF04) --------------------------------------------------------------
; Divider register [r/w]
def rDIV equ $FF04

; -- TIMA ($FF05) -------------------------------------------------------------
; Timer counter [r/w]
def rTIMA equ $FF05

; -- TMA ($FF06) --------------------------------------------------------------
; Timer modulo [r/w]
def rTMA equ $FF06

; -- TAC ($FF07) --------------------------------------------------------------
; Timer control
def rTAC equ $FF07

def B_TAC_START equ 2 ; enable incrementing TIMA [r/w]
    def TAC_STOP  equ 0 << B_TAC_START
    def TAC_START equ 1 << B_TAC_START

def TAC_CLOCK equ %000000_11 ; the frequency at which TIMA increments [r/w]
    def TAC_4KHZ   equ %000000_00 ; every 256 M-cycles = ~4 KHz on DMG
    def TAC_262KHZ equ %000000_01 ; every 4 M-cycles = ~262 KHz on DMG
    def TAC_65KHZ  equ %000000_10 ; every 16 M-cycles = ~65 KHz on DMG
    def TAC_16KHZ  equ %000000_11 ; every 64 M-cycles = ~16 KHz on DMG

; -- $FF08-$FF0E are unused ---------------------------------------------------

; -- IF ($FF0F) ---------------------------------------------------------------
; Pending interrupts
def rIF equ $FF0F

def B_IF_JOYPAD equ 4 ; 1 = joypad interrupt is pending [r/w]
def B_IF_SERIAL equ 3 ; 1 = serial interrupt is pending [r/w]
def B_IF_TIMER  equ 2 ; 1 = timer  interrupt is pending [r/w]
def B_IF_STAT   equ 1 ; 1 = STAT   interrupt is pending [r/w]
def B_IF_VBLANK equ 0 ; 1 = VBlank interrupt is pending [r/w]
    def IF_JOYPAD equ 1 << B_IF_JOYPAD
    def IF_SERIAL equ 1 << B_IF_SERIAL
    def IF_TIMER  equ 1 << B_IF_TIMER
    def IF_STAT   equ 1 << B_IF_STAT
    def IF_VBLANK equ 1 << B_IF_VBLANK

; -- AUD1SWEEP / NR10 ($FF10) -------------------------------------------------
; Audio channel 1 sweep
def rAUD1SWEEP equ $FF10

def AUD1SWEEP_TIME equ %0_111_0000 ; how long between sweep iterations
                                   ; (in 128 Hz ticks, ~7.8 ms apart) [r/w]

def B_AUD1SWEEP_DIR equ 3 ; sweep direction [r/w]
    def AUD1SWEEP_DIR equ 1 << B_AUD1SWEEP_DIR
        def AUD1SWEEP_UP   equ 0 << B_AUD1SWEEP_DIR
        def AUD1SWEEP_DOWN equ 1 << B_AUD1SWEEP_DIR

def AUD1SWEEP_SHIFT equ %00000_111 ; how much the period increases/decreases per iteration [r/w]

; -- AUD1LEN / NR11 ($FF11) ---------------------------------------------------
; Audio channel 1 length timer and duty cycle
def rAUD1LEN equ $FF11

def AUD1LEN_DUTY equ %11_000000 ; ratio of time spent high vs. time spent low [r/w]
    def AUD1LEN_DUTY_12_5 equ %00_000000 ; 12.5%
    def AUD1LEN_DUTY_25   equ %01_000000 ; 25%
    def AUD1LEN_DUTY_50   equ %10_000000 ; 50%
    def AUD1LEN_DUTY_75   equ %11_000000 ; 75%

def AUD1LEN_TIMER equ %00_111111 ; initial length timer (0-63) [wo]

; -- AUD1ENV / NR12 ($FF12) ---------------------------------------------------
; Audio channel 1 volume and envelope
def rAUD1ENV equ $FF12

def AUD1ENV_INIT_VOLUME equ %1111_0000 ; initial volume [r/w]

def B_AUD1ENV_DIR equ 3 ; direction of volume envelope [r/w]
    def AUD1ENV_DIR equ 1 << B_AUD1ENV_DIR
        def AUD1ENV_DOWN equ 0 << B_AUD1ENV_DIR
        def AUD1ENV_UP   equ 1 << B_AUD1ENV_DIR

def AUD1ENV_PACE equ %00000_111 ; how long between envelope iterations
                                ; (in 64 Hz ticks, ~15.6 ms apart) [r/w]

; -- AUD1LOW / NR13 ($FF13) ---------------------------------------------------
; Audio channel 1 period (low 8 bits) [r/w]
def rAUD1LOW equ $FF13

; -- AUD1HIGH / NR14 ($FF14) --------------------------------------------------
; Audio channel 1 period (high 3 bits) and control
def rAUD1HIGH equ $FF14

def B_AUD1HIGH_RESTART    equ 7 ; 1 = restart the channel [wo]
def B_AUD1HIGH_LEN_ENABLE equ 6 ; 1 = reset the channel after the length timer expires [r/w]
    def AUD1HIGH_RESTART    equ 1 << B_AUD1HIGH_RESTART
    def AUD1HIGH_LENGTH_OFF equ 0 << B_AUD1HIGH_LEN_ENABLE
    def AUD1HIGH_LENGTH_ON  equ 1 << B_AUD1HIGH_LEN_ENABLE

def AUD1HIGH_PERIOD_HIGH equ %00000_111 ; upper 3 bits of the channel's period [r/w]

; -- $FF15 is unused ----------------------------------------------------------

; -- AUD2LEN / NR21 ($FF16) ---------------------------------------------------
; Audio channel 2 length timer and duty cycle
def rAUD2LEN equ $FF16

def AUD2LEN_DUTY equ %11_000000 ; ratio of time spent high vs. time spent low [r/w]
    def AUD2LEN_DUTY_12_5 equ %00_000000 ; 12.5%
    def AUD2LEN_DUTY_25   equ %01_000000 ; 25%
    def AUD2LEN_DUTY_50   equ %10_000000 ; 50%
    def AUD2LEN_DUTY_75   equ %11_000000 ; 75%

def AUD2LEN_TIMER equ %00_111111 ; initial length timer (0-63) [wo]

; -- AUD2ENV / NR22 ($FF17) ---------------------------------------------------
; Audio channel 2 volume and envelope
def rAUD2ENV equ $FF17

def AUD2ENV_INIT_VOLUME equ %1111_0000 ; initial volume [r/w]

def B_AUD2ENV_DIR equ 3 ; direction of volume envelope [r/w]
    def AUD2ENV_DIR equ 1 << B_AUD2ENV_DIR
        def AUD2ENV_DOWN equ 0 << B_AUD2ENV_DIR
        def AUD2ENV_UP   equ 1 << B_AUD2ENV_DIR

def AUD2ENV_PACE equ %00000_111 ; how long between envelope iterations
                                ; (in 64 Hz ticks, ~15.6 ms apart) [r/w]

; -- AUD2LOW / NR23 ($FF18) ---------------------------------------------------
; Audio channel 2 period (low 8 bits) [r/w]
def rAUD2LOW equ $FF18

; -- AUD2HIGH / NR24 ($FF19) --------------------------------------------------
; Audio channel 2 period (high 3 bits) and control
def rAUD2HIGH equ $FF19

def B_AUD2HIGH_RESTART    equ 7 ; 1 = restart the channel [wo]
def B_AUD2HIGH_LEN_ENABLE equ 6 ; 1 = reset the channel after the length timer expires [r/w]
    def AUD2HIGH_RESTART    equ 1 << B_AUD2HIGH_RESTART
    def AUD2HIGH_LENGTH_OFF equ 0 << B_AUD2HIGH_LEN_ENABLE
    def AUD2HIGH_LENGTH_ON  equ 1 << B_AUD2HIGH_LEN_ENABLE

def AUD2HIGH_PERIOD_HIGH equ %00000_111 ; upper 3 bits of the channel's period [r/w]

; -- AUD3ENA / NR30 ($FF1A) ---------------------------------------------------
; Audio channel 3 enable
def rAUD3ENA equ $FF1A

def B_AUD3ENA_ENABLE equ 7 ; 1 = channel is active [r/w]
    def AUD3ENA_OFF equ 0 << B_AUD3ENA_ENABLE
    def AUD3ENA_ON  equ 1 << B_AUD3ENA_ENABLE

; -- AUD3LEN / NR31 ($FF1B) ---------------------------------------------------
; Audio channel 3 length timer [wo]
def rAUD3LEN equ $FF1B

; -- AUD3LEVEL / NR32 ($FF1C) -------------------------------------------------
; Audio channel 3 volume
def rAUD3LEVEL equ $FF1C

def AUD3LEVEL_VOLUME equ %0_11_00000 ; volume level [r/w]
    def AUD3LEVEL_MUTE equ %0_00_00000 ; 0% (muted)
    def AUD3LEVEL_100  equ %0_01_00000 ; 100%
    def AUD3LEVEL_50   equ %0_10_00000 ; 50%
    def AUD3LEVEL_25   equ %0_11_00000 ; 25%

; -- AUD3LOW / NR33 ($FF1D) ---------------------------------------------------
; Audio channel 3 period (low 8 bits) [r/w]
def rAUD3LOW equ $FF1D

; -- AUD3HIGH / NR34 ($FF1E) --------------------------------------------------
; Audio channel 3 period (high 3 bits) and control
def rAUD3HIGH equ $FF1E

def B_AUD3HIGH_RESTART    equ 7 ; 1 = restart the channel [wo]
def B_AUD3HIGH_LEN_ENABLE equ 6 ; 1 = reset the channel after the length timer expires [r/w]
    def AUD3HIGH_RESTART    equ 1 << B_AUD3HIGH_RESTART
    def AUD3HIGH_LENGTH_OFF equ 0 << B_AUD3HIGH_LEN_ENABLE
    def AUD3HIGH_LENGTH_ON  equ 1 << B_AUD3HIGH_LEN_ENABLE

def AUD3HIGH_PERIOD_HIGH equ %00000_111 ; upper 3 bits of the channel's period [r/w]

; -- $FF1F is unused ----------------------------------------------------------

; -- AUD4LEN / NR41 ($FF20) ---------------------------------------------------
; Audio channel 4 length timer
def rAUD4LEN equ $FF20

def AUD4LEN_TIMER equ %00_111111 ; initial length timer (0-63) [wo]

; -- AUD4ENV / NR42 ($FF21) ---------------------------------------------------
; Audio channel 4 volume and envelope
def rAUD4ENV equ $FF21

def AUD4ENV_INIT_VOLUME equ %1111_0000 ; initial volume [r/w]

def B_AUD4ENV_DIR equ 3 ; direction of volume envelope [r/w]
    def AUD4ENV_DIR equ 1 << B_AUD4ENV_DIR
        def AUD4ENV_DOWN equ 0 << B_AUD4ENV_DIR
        def AUD4ENV_UP   equ 1 << B_AUD4ENV_DIR

def AUD4ENV_PACE equ %00000_111 ; how long between envelope iterations
                                ; (in 64 Hz ticks, ~15.6 ms apart) [r/w]

; -- AUD4POLY / NR43 ($FF22) --------------------------------------------------
; Audio channel 4 period and randomness
def rAUD4POLY equ $FF22

def AUD4POLY_SHIFT equ %1111_0000 ; coarse control of the channel's period [r/w]

def B_AUD4POLY_WIDTH equ 3 ; controls the noise generator (LFSR)'s step width [r/w]
    def AUD4POLY_15STEP equ 0 << B_AUD4POLY_WIDTH
    def AUD4POLY_7STEP  equ 1 << B_AUD4POLY_WIDTH

def AUD4POLY_DIV equ %00000_111 ; fine control of the channel's period [r/w]

; -- AUD4GO / NR44 ($FF23) ----------------------------------------------------
; Audio channel 4 control
def rAUD4GO equ $FF23

def B_AUD4GO_RESTART    equ 7 ; 1 = restart the channel [wo]
def B_AUD4GO_LEN_ENABLE equ 6 ; 1 = reset the channel after the length timer expires [r/w]
    def AUD4GO_RESTART    equ 1 << B_AUD4GO_RESTART
    def AUD4GO_LENGTH_OFF equ 0 << B_AUD4GO_LEN_ENABLE
    def AUD4GO_LENGTH_ON  equ 1 << B_AUD4GO_LEN_ENABLE

; -- AUDVOL / NR50 ($FF24) ----------------------------------------------------
; Audio master volume and VIN mixer
def rAUDVOL equ $FF24

def B_AUDVOL_VIN_LEFT  equ 7 ; 1 = output VIN to left ear (SO2, speaker 2) [r/w]
    def AUDVOL_VIN_LEFT equ 1 << B_AUDVOL_VIN_LEFT

def AUDVOL_LEFT equ %0_111_0000 ; 0 = barely audible, 7 = full volume [r/w]

def B_AUDVOL_VIN_RIGHT equ 3 ; 1 = output VIN to right ear (SO1, speaker 1) [r/w]
    def AUDVOL_VIN_RIGHT equ 1 << B_AUDVOL_VIN_RIGHT

def AUDVOL_RIGHT equ %00000_111 ; 0 = barely audible, 7 = full volume [r/w]

; -- AUDTERM / NR51 ($FF25) ---------------------------------------------------
; Audio channel mixer
def rAUDTERM equ $FF25

def B_AUDTERM_4_LEFT  equ 7 ; 1 = output channel 4 to left  ear [r/w]
def B_AUDTERM_3_LEFT  equ 6 ; 1 = output channel 3 to left  ear [r/w]
def B_AUDTERM_2_LEFT  equ 5 ; 1 = output channel 2 to left  ear [r/w]
def B_AUDTERM_1_LEFT  equ 4 ; 1 = output channel 1 to left  ear [r/w]
def B_AUDTERM_4_RIGHT equ 3 ; 1 = output channel 4 to right ear [r/w]
def B_AUDTERM_3_RIGHT equ 2 ; 1 = output channel 3 to right ear [r/w]
def B_AUDTERM_2_RIGHT equ 1 ; 1 = output channel 2 to right ear [r/w]
def B_AUDTERM_1_RIGHT equ 0 ; 1 = output channel 1 to right ear [r/w]
    def AUDTERM_4_LEFT  equ 1 << B_AUDTERM_4_LEFT
    def AUDTERM_3_LEFT  equ 1 << B_AUDTERM_3_LEFT
    def AUDTERM_2_LEFT  equ 1 << B_AUDTERM_2_LEFT
    def AUDTERM_1_LEFT  equ 1 << B_AUDTERM_1_LEFT
    def AUDTERM_4_RIGHT equ 1 << B_AUDTERM_4_RIGHT
    def AUDTERM_3_RIGHT equ 1 << B_AUDTERM_3_RIGHT
    def AUDTERM_2_RIGHT equ 1 << B_AUDTERM_2_RIGHT
    def AUDTERM_1_RIGHT equ 1 << B_AUDTERM_1_RIGHT

; -- AUDENA / NR52 ($FF26) ----------------------------------------------------
; Audio master enable
def rAUDENA equ $FF26

def B_AUDENA_ENABLE     equ 7 ; 0 = disable the APU (resets all audio registers to 0!) [r/w]
def B_AUDENA_ENABLE_CH4 equ 3 ; 1 = channel 4 is running [ro]
def B_AUDENA_ENABLE_CH3 equ 2 ; 1 = channel 3 is running [ro]
def B_AUDENA_ENABLE_CH2 equ 1 ; 1 = channel 2 is running [ro]
def B_AUDENA_ENABLE_CH1 equ 0 ; 1 = channel 1 is running [ro]
    def AUDENA_OFF     equ 0 << B_AUDENA_ENABLE
    def AUDENA_ON      equ 1 << B_AUDENA_ENABLE
    def AUDENA_CH4_OFF equ 0 << B_AUDENA_ENABLE_CH4
    def AUDENA_CH4_ON  equ 1 << B_AUDENA_ENABLE_CH4
    def AUDENA_CH3_OFF equ 0 << B_AUDENA_ENABLE_CH3
    def AUDENA_CH3_ON  equ 1 << B_AUDENA_ENABLE_CH3
    def AUDENA_CH2_OFF equ 0 << B_AUDENA_ENABLE_CH2
    def AUDENA_CH2_ON  equ 1 << B_AUDENA_ENABLE_CH2
    def AUDENA_CH1_OFF equ 0 << B_AUDENA_ENABLE_CH1
    def AUDENA_CH1_ON  equ 1 << B_AUDENA_ENABLE_CH1

; -- $FF27-$FF2F are unused ---------------------------------------------------

; -- AUD3WAVE ($FF30-$FF3F) ---------------------------------------------------
; Audio channel 3 wave pattern RAM [r/w]
def _AUD3WAVERAM equ $FF30 ; $FF30-$FF3F

def rAUD3WAVE_0 equ $FF30
def rAUD3WAVE_1 equ $FF31
def rAUD3WAVE_2 equ $FF32
def rAUD3WAVE_3 equ $FF33
def rAUD3WAVE_4 equ $FF34
def rAUD3WAVE_5 equ $FF35
def rAUD3WAVE_6 equ $FF36
def rAUD3WAVE_7 equ $FF37
def rAUD3WAVE_8 equ $FF38
def rAUD3WAVE_9 equ $FF39
def rAUD3WAVE_A equ $FF3A
def rAUD3WAVE_B equ $FF3B
def rAUD3WAVE_C equ $FF3C
def rAUD3WAVE_D equ $FF3D
def rAUD3WAVE_E equ $FF3E
def rAUD3WAVE_F equ $FF3F

def AUD3WAVE_SIZE equ 16

; -- LCDC ($FF40) -------------------------------------------------------------
; PPU graphics control
def rLCDC equ $FF40

def B_LCDC_ENABLE   equ 7 ; whether the PPU (and LCD) are turned on          [r/w]
def B_LCDC_WIN_MAP  equ 6 ; which tilemap the Window reads from              [r/w]
def B_LCDC_WINDOW   equ 5 ; whether the Window is enabled                    [r/w]
def B_LCDC_BLOCKS   equ 4 ; which "tile blocks" the BG and Window use        [r/w]
def B_LCDC_BG_MAP   equ 3 ; which tilemap the BG reads from                  [r/w]
def B_LCDC_OBJ_SIZE equ 2 ; how many pixels tall each OBJ is                 [r/w]
def B_LCDC_OBJS     equ 1 ; whether OBJs are enabled                         [r/w]
def B_LCDC_BG       equ 0 ; (DMG only) whether the BG is enabled             [r/w]
def B_LCDC_PRIO     equ 0 ; (CGB only) whether OBJ priority bits are enabled [r/w]
    def LCDC_ENABLE   equ 1 << B_LCDC_ENABLE
        def LCDC_OFF equ 0 << B_LCDC_ENABLE
        def LCDC_ON  equ 1 << B_LCDC_ENABLE
    def LCDC_WIN_MAP  equ 1 << B_LCDC_WIN_MAP
        def LCDC_WIN_9800 equ 0 << B_LCDC_WIN_MAP
        def LCDC_WIN_9C00 equ 1 << B_LCDC_WIN_MAP
    def LCDC_WINDOW   equ 1 << B_LCDC_WINDOW
        def LCDC_WIN_OFF equ 0 << B_LCDC_WINDOW
        def LCDC_WIN_ON  equ 1 << B_LCDC_WINDOW
    def LCDC_BLOCKS   equ 1 << B_LCDC_BLOCKS
        def LCDC_BLOCK21 equ 0 << B_LCDC_BLOCKS
        def LCDC_BLOCK01 equ 1 << B_LCDC_BLOCKS
    def LCDC_BG_MAP   equ 1 << B_LCDC_BG_MAP
        def LCDC_BG_9800 equ 0 << B_LCDC_BG_MAP
        def LCDC_BG_9C00 equ 1 << B_LCDC_BG_MAP
    def LCDC_OBJ_SIZE equ 1 << B_LCDC_OBJ_SIZE
        def LCDC_OBJ_8  equ 0 << B_LCDC_OBJ_SIZE
        def LCDC_OBJ_16 equ 1 << B_LCDC_OBJ_SIZE
    def LCDC_OBJS     equ 1 << B_LCDC_OBJS
        def LCDC_OBJ_OFF equ 0 << B_LCDC_OBJS
        def LCDC_OBJ_ON  equ 1 << B_LCDC_OBJS
    def LCDC_BG       equ 1 << B_LCDC_BG
        def LCDC_BG_OFF equ 0 << B_LCDC_BG
        def LCDC_BG_ON  equ 1 << B_LCDC_BG
    def LCDC_PRIO     equ 1 << B_LCDC_PRIO
        def LCDC_PRIO_OFF equ 0 << B_LCDC_PRIO
        def LCDC_PRIO_ON  equ 1 << B_LCDC_PRIO

; -- STAT ($FF41) -------------------------------------------------------------
; Graphics status and interrupt control
def rSTAT equ $FF41

def B_STAT_LYC    equ 6 ; 1 = LY match triggers the STAT interrupt [r/w]
def B_STAT_MODE_2 equ 5 ; 1 = OAM Scan triggers the PPU interrupt  [r/w]
def B_STAT_MODE_1 equ 4 ; 1 = VBlank triggers the PPU interrupt    [r/w]
def B_STAT_MODE_0 equ 3 ; 1 = HBlank triggers the PPU interrupt    [r/w]
def B_STAT_LYCF   equ 2 ; 1 = LY is currently equal to LYC         [ro]
def B_STAT_BUSY   equ 1 ; 1 = the PPU is currently accessing VRAM  [ro]
    def STAT_LYC    equ 1 << B_STAT_LYC
    def STAT_MODE_2 equ 1 << B_STAT_MODE_2
    def STAT_MODE_1 equ 1 << B_STAT_MODE_1
    def STAT_MODE_0 equ 1 << B_STAT_MODE_0
    def STAT_LYCF   equ 1 << B_STAT_LYCF
    def STAT_BUSY   equ 1 << B_STAT_BUSY

def STAT_MODE equ %000000_11 ; PPU's current status [ro]
    def STAT_HBLANK equ %000000_00 ; waiting after a line's rendering (HBlank)
    def STAT_VBLANK equ %000000_01 ; waiting between frames (VBlank)
    def STAT_OAM    equ %000000_10 ; checking which OBJs will be rendered on this line (OAM scan)
    def STAT_LCD    equ %000000_11 ; pushing pixels to the LCD

; -- SCY ($FF42) --------------------------------------------------------------
; Background Y scroll offset (in pixels) [r/w]
def rSCY equ $FF42

; -- SCX ($FF43) --------------------------------------------------------------
; Background X scroll offset (in pixels) [r/w]
def rSCX equ $FF43

; -- LY ($FF44) ---------------------------------------------------------------
; Y coordinate of the line currently processed by the PPU (0-153) [ro]
def rLY equ $FF44

def LY_VBLANK equ 144 ; 144-153 is the VBlank period

; -- LYC ($FF45) --------------------------------------------------------------
; Value that LY is constantly compared to [r/w]
def rLYC equ $FF45

; -- DMA ($FF46) --------------------------------------------------------------
; OAM DMA start address (high 8 bits) and start [wo]
def rDMA equ $FF46

; -- BGP ($FF47) --------------------------------------------------------------
; (DMG only) Background color mapping [r/w]
def rBGP equ $FF47

def BGP_SGB_TRANSFER equ %11_10_01_00 ; set BGP to this value before SGB VRAM transfer

; -- OBP0 ($FF48) -------------------------------------------------------------
; (DMG only) OBJ color mapping #0 [r/w]
def rOBP0 equ $FF48

; -- OBP1 ($FF49) -------------------------------------------------------------
; (DMG only) OBJ color mapping #1 [r/w]
def rOBP1 equ $FF49

; -- WY ($FF4A) ---------------------------------------------------------------
; Y coordinate of the Window's top-left pixel (0-143) [r/w]
def rWY equ $FF4A

; -- WX ($FF4B) ---------------------------------------------------------------
; X coordinate of the Window's top-left pixel, plus 7 (7-166) [r/w]
def rWX equ $FF4B

def WX_OFS equ 7 ; subtract this to get the actual Window Y coordinate

; -- SYS / KEY0 ($FF4C) -------------------------------------------------------
; (CGB boot ROM only) CPU mode select
def rSYS equ $FF4C

; This is known as the "CPU mode register" in Fig. 11 of this patent:
; https://patents.google.com/patent/US6322447B1/en?oq=US6322447bi
; "OBJ priority mode designating register" in the same patent
; Credit to @mattcurrie for this finding!

def SYS_MODE equ %0000_11_00 ; current system mode [r/w]
    def SYS_CGB  equ %0000_00_00 ; CGB mode
    def SYS_DMG  equ %0000_01_00 ; DMG compatibility mode
    def SYS_PGB1 equ %0000_10_00 ; LCD is driven externally, CPU is stopped
    def SYS_PGB2 equ %0000_11_00 ; LCD is driven externally, CPU is running

; -- SPD / KEY1 ($FF4D) -------------------------------------------------------
; (CGB only) Double-speed mode control
def rSPD equ $FF4D

def B_SPD_DOUBLE  equ 7 ; current clock speed                                  [ro]
def B_SPD_PREPARE equ 0 ; 1 = next `stop` instruction will switch clock speeds [r/w]
    def SPD_SINGLE  equ 0 << B_SPD_DOUBLE
    def SPD_DOUBLE  equ 1 << B_SPD_DOUBLE
    def SPD_PREPARE equ 1 << B_SPD_PREPARE

; -- $FF4E is unused ----------------------------------------------------------

; -- VBK ($FF4F) --------------------------------------------------------------
; (CGB only) VRAM bank number (0 or 1)
def rVBK equ $FF4F

def VBK_BANK equ %0000000_1 ; mapped VRAM bank [r/w]

; -- BANK ($FF50) -------------------------------------------------------------
; (boot ROM only) Boot ROM mapping control
def rBANK equ $FF50

def B_BANK_ON equ 0 ; whether the boot ROM is mapped [wo]
    def BANK_ON  equ 0 << B_BANK_ON
    def BANK_OFF equ 1 << B_BANK_ON

; -- VDMA_SRC_HIGH / HDMA1 ($FF51) --------------------------------------------
; (CGB only) VRAM DMA source address (high 8 bits) [wo]
def rVDMA_SRC_HIGH equ $FF51

; -- VDMA_SRC_LOW / HDMA2 ($FF52) ---------------------------------------------
; (CGB only) VRAM DMA source address (low 8 bits) [wo]
def rVDMA_SRC_LOW equ $FF52

; -- VDMA_DEST_HIGH / HDMA3 ($FF53) -------------------------------------------
; (CGB only) VRAM DMA destination address (high 8 bits) [wo]
def rVDMA_DEST_HIGH equ $FF53

; -- VDMA_DEST_LOW / HDMA3 ($FF54) --------------------------------------------
; (CGB only) VRAM DMA destination address (low 8 bits) [wo]
def rVDMA_DEST_LOW equ $FF54

; -- VDMA_LEN / HDMA5 ($FF55) -------------------------------------------------
; (CGB only) VRAM DMA length, mode, and start
def rVDMA_LEN equ $FF55

def B_VDMA_LEN_MODE equ 7 ; on write: VRAM DMA mode [wo]
    def VDMA_LEN_MODE equ 1 << B_VDMA_LEN_MODE
        def VDMA_LEN_MODE_GENERAL equ 0 << B_VDMA_LEN_MODE ; GDMA (general-purpose)
        def VDMA_LEN_MODE_HBLANK  equ 1 << B_VDMA_LEN_MODE ; HDMA (HBlank)

def B_VDMA_LEN_BUSY equ 7 ; on read: is a VRAM DMA active?
    def VDMA_LEN_BUSY equ 1 << B_VDMA_LEN_BUSY
        def VDMA_LEN_NO  equ 0 << B_VDMA_LEN_BUSY
        def VDMA_LEN_YES equ 1 << B_VDMA_LEN_BUSY

def VDMA_LEN_SIZE equ %0_1111111 ; how many 16-byte blocks (minus 1) to transfer [r/w]

; -- RP ($FF56) ---------------------------------------------------------------
; (CGB only) Infrared communications port
def rRP equ $FF56

def RP_READ equ %11_000000 ; whether the IR read is enabled [r/w]
    def RP_DISABLE equ %00_000000
    def RP_ENABLE  equ %11_000000

def B_RP_DATA_IN equ 1 ; 0 = IR light is being received [ro]
def B_RP_LED_ON  equ 0 ; 1 = IR light is being sent     [r/w]
    def RP_DATA_IN equ 1 << B_RP_DATA_IN
    def RP_LED_ON  equ 1 << B_RP_LED_ON
        def RP_WRITE_LOW  equ 0 << B_RP_LED_ON
        def RP_WRITE_HIGH equ 1 << B_RP_LED_ON

; -- $FF57-$FF67 are unused ---------------------------------------------------

; -- BGPI / BCPS ($FF68) ------------------------------------------------------
; (CGB only) Background palette I/O index
def rBGPI equ $FF68

def B_BGPI_AUTOINC equ 7 ; whether the index field is incremented after each write to BCPD [r/w]
    def BGPI_AUTOINC equ 1 << B_BGPI_AUTOINC

def BGPI_INDEX equ %00_111111 ; the index within Palette RAM accessed via BCPD [r/w]

; -- BGPD / BCPD ($FF69) ------------------------------------------------------
; (CGB only) Background palette I/O access [r/w]
def rBGPD equ $FF69

; -- OBPI / OCPS ($FF6A) ------------------------------------------------------
; (CGB only) OBJ palette I/O index
def rOBPI equ $FF6A

def B_OBPI_AUTOINC equ 7 ; whether the index field is incremented after each write to OBPD [r/w]
    def OBPI_AUTOINC equ 1 << B_OBPI_AUTOINC

def OBPI_INDEX equ %00_111111 ; the index within Palette RAM accessed via OBPD [r/w]

; -- OBPD / OCPD ($FF6B) ------------------------------------------------------
; (CGB only) OBJ palette I/O access [r/w]
def rOBPD equ $FF6B

; -- OPRI ($FF6C) -------------------------------------------------------------
; (CGB boot ROM only) OBJ draw priority mode
def rOPRI equ $FF6C

def B_OPRI_PRIORITY equ 0 ; which drawing priority is used for OBJs [r/w]
    def OPRI_PRIORITY equ 1 << B_OPRI_PRIORITY
        def OPRI_OAM   equ 0 << B_OPRI_PRIORITY ; CGB mode default: earliest OBJ in OAM wins
        def OPRI_COORD equ 1 << B_OPRI_PRIORITY ; DMG mode default: leftmost OBJ wins

; -- $FF6D-$FF6F are unused ---------------------------------------------------

; -- WBK / SVBK ($FF70) -------------------------------------------------------
; (CGB only) WRAM bank number
def rWBK equ $FF70

def WBK_BANK equ %00000_111 ; mapped WRAM bank (0-7) [r/w]

; -- $FF71-$FF75 are unused ---------------------------------------------------

; -- PCM12 ($FF76) ------------------------------------------------------------
; Audio channels 1 and 2 output
def rPCM12 equ $FF76

def PCM12_CH2 equ %1111_0000 ; audio channel 2 output [ro]
def PCM12_CH1 equ %0000_1111 ; audio channel 1 output [ro]

; -- PCM34 ($FF77) ------------------------------------------------------------
; Audio channels 3 and 4 output
def rPCM34 equ $FF77

def PCM34_CH4 equ %1111_0000 ; audio channel 4 output [ro]
def PCM34_CH3 equ %0000_1111 ; audio channel 3 output [ro]

; -- $FF78-$FF7F are unused ---------------------------------------------------

; -- IE ($FFFF) ---------------------------------------------------------------
; Interrupt enable
def rIE equ $FFFF

def B_IE_JOYPAD equ 4 ; 1 = joypad interrupt is enabled [r/w]
def B_IE_SERIAL equ 3 ; 1 = serial interrupt is enabled [r/w]
def B_IE_TIMER  equ 2 ; 1 = timer  interrupt is enabled [r/w]
def B_IE_STAT   equ 1 ; 1 = STAT   interrupt is enabled [r/w]
def B_IE_VBLANK equ 0 ; 1 = VBlank interrupt is enabled [r/w]
    def IE_JOYPAD equ 1 << B_IE_JOYPAD
    def IE_SERIAL equ 1 << B_IE_SERIAL
    def IE_TIMER  equ 1 << B_IE_TIMER
    def IE_STAT   equ 1 << B_IE_STAT
    def IE_VBLANK equ 1 << B_IE_VBLANK


;******************************************************************************
; Cartridge registers (MBC)
;******************************************************************************

; Note that these "registers" are each actually accessible at an entire address range;
; however, one address for each of these ranges is considered the "canonical" one, and
; these addresses are what's provided here.


; ** Common to most MBCs ******************************************************

; -- RAMG ($0000-$1FFF) -------------------------------------------------------
; Whether SRAM can be accessed [wo]
def rRAMG equ $0000

; Common values (not for HuC1 or HuC-3)
def RAMG_SRAM_DISABLE equ $00
def RAMG_SRAM_ENABLE  equ $0A ; some MBCs accept any value whose low nybble is $A

; (HuC-3 only) switch SRAM to map cartridge RAM, RTC, or IR
def RAMG_CART_RAM_RO   equ $00 ; select cartridge RAM [ro]
def RAMG_CART_RAM      equ $0A ; select cartridge RAM [r/w]
def RAMG_RTC_IN        equ $0B ; select RTC command/argument [wo]
    def RAMG_RTC_IN_CMD equ %0_111_0000 ; command
    def RAMG_RTC_IN_ARG equ %0_000_1111 ; argument
def RAMG_RTC_OUT       equ $0C ; select RTC command/response [ro]
    def RAMG_RTC_OUT_CMD    equ %0_111_0000 ; command
    def RAMG_RTC_OUT_RESULT equ %0_000_1111 ; result
def RAMG_RTC_SEMAPHORE equ $0D ; select RTC semaphore [r/w]
def RAMG_IR            equ $0E ; (HuC1 and HuC-3 only) select IR [r/w]

; -- ROMB ($2000-$3FFF) -------------------------------------------------------
; ROM bank number (not for MBC5 or MBC6) [wo]
def rROMB equ $2000

; -- RAMB ($4000-$5FFF) -------------------------------------------------------
; SRAM bank number (not for MBC2, MBC6, or MBC7) [wo]
def rRAMB equ $4000

; (MBC3 only) Special RAM bank numbers that actually map values into RTCREG
def RAMB_RTC_S  equ $08 ; seconds counter (0-59)
def RAMB_RTC_M  equ $09 ; minutes counter (0-59)
def RAMB_RTC_H  equ $0A ; hours counter (0-23)
def RAMB_RTC_DL equ $0B ; days counter, low byte (0-255)
def RAMB_RTC_DH equ $0C ; days counter, high bit and other flags
    def B_RAMB_RTC_DH_CARRY equ 7 ; 1 = days counter overflowed    [wo]
    def B_RAMB_RTC_DH_HALT  equ 6 ; 0 = run timer, 1 = stop timer  [wo]
    def B_RAMB_RTC_DH_HIGH  equ 0 ; days counter, high bit (bit 8) [wo]
        def RAMB_RTC_DH_CARRY equ 1 << B_RAMB_RTC_DH_CARRY
        def RAMB_RTC_DH_HALT  equ 1 << B_RAMB_RTC_DH_HALT
        def RAMB_RTC_DH_HIGH  equ 1 << B_RAMB_RTC_DH_HIGH

def B_RAMB_RUMBLE equ 3 ; (MBC5 and MBC7 only) enable the rumble motor (if any)
    def RAMB_RUMBLE equ 1 << B_RAMB_RUMBLE
        def RAMB_RUMBLE_OFF equ 0 << B_RAMB_RUMBLE
        def RAMB_RUMBLE_ON  equ 1 << B_RAMB_RUMBLE


; ** MBC1 and MMM01 only ******************************************************

; -- BMODE ($6000-$7FFF) ------------------------------------------------------
; Banking mode select [wo]
def rBMODE equ $6000

def BMODE_SIMPLE   equ $00 ; locks ROMB and RAMB to bank 0
def BMODE_ADVANCED equ $01 ; allows bank-switching with RAMB


; ** MBC2 only ****************************************************************

; -- ROM2B ($0000-$3FFF with bit 8 set) ---------------------------------------
; ROM bank number [wo]
def rROM2B equ $2100


; ** MBC3 only ****************************************************************

; -- RTCLATCH ($6000-$7FFF) ---------------------------------------------------
; RTC latch clock data [wo]
def rRTCLATCH equ $6000

; Write $00 then $01 to latch the current time into RTCREG
def RTCLATCH_START  equ $00
def RTCLATCH_FINISH equ $01

; -- RTCREG ($A000-$BFFF) -----------------------------------------------------
; RTC register [r/w]
def rRTCREG equ $A000


; ** MBC5 only ****************************************************************

; -- ROMB0 ($2000-$3FFF) ------------------------------------------------------
; ROM bank number low byte (bits 0-7) [wo]
def rROMB0 equ $2000

; -- ROMB1 ($3000-$3FFF) ------------------------------------------------------
; ROM bank number high bit (bit 8) [wo]
def rROMB1 equ $3000


; ** MBC6 only ****************************************************************

; -- RAMBA ($0400-$07FF) ------------------------------------------------------
; RAM bank A number [wo]
def rRAMBA equ $0400

; -- RAMBB ($0800-$0BFF) ------------------------------------------------------
; RAM bank B number [wo]
def rRAMBB equ $0800

; -- FLASH ($0C00-$0FFF) ------------------------------------------------------
; Whether the flash chip can be accessed [wo]
def rFLASH equ $0C00

; -- FMODE ($1000) ------------------------------------------------------------
; Write mode select for the flash chip
def rFMODE equ $1000

; -- ROMBA ($2000-$27FF) ------------------------------------------------------
; ROM/Flash bank A number [wo]
def rROMBA equ $2000

; -- FLASHA ($2800-$2FFF) -----------------------------------------------------
; ROM/Flash bank A select [wo]
def rFLASHA equ $2800

; -- ROMBB ($3000-$37FF) ------------------------------------------------------
; ROM/Flash bank B number [wo]
def rROMBB equ $3000

; -- FLASHB ($3800-$3FFF) -----------------------------------------------------
; ROM/Flash bank B select [wo]
def rFLASHB equ $3800


; ** MBC7 only ****************************************************************

; -- RAMREG ($4000-$5FFF) -----------------------------------------------------
; Enable RAM register access [wo]
def rRAMREG equ $4000

def RAMREG_ENABLE equ $40

; -- ACCLATCH0 ($Ax0x) --------------------------------------------------------
; Latch accelerometer start [wo]
def rACCLATCH0 equ $A000

def ACCLATCH0_START equ $55

; -- ACCLATCH1 ($Ax1x) --------------------------------------------------------
; Latch accelerometer finish [wo]
def rACCLATCH1 equ $A010

def ACCLATCH1_FINISH equ $AA

; -- ACCELX0 ($Ax2x) ----------------------------------------------------------
; Accelerometer X value low byte [ro]
def rACCELX0 equ $A020

; -- ACCELX1 ($Ax3x) ----------------------------------------------------------
; Accelerometer X value high byte [ro]
def rACCELX1 equ $A030

; -- ACCELY0 ($Ax4x) ----------------------------------------------------------
; Accelerometer Y value low byte [ro]
def rACCELY0 equ $A040

; -- ACCELY1 ($Ax5x) ----------------------------------------------------------
; Accelerometer Y value high byte [ro]
def rACCELY1 equ $A050

; -- EEPROM ($Ax8x) -----------------------------------------------------------
; EEPROM access [r/w]
def rEEPROM equ $A080


; ** HuC1 only ****************************************************************

; -- IRREG ($A000-$BFFF) ------------------------------------------------------
; IR register [r/w]
def rIRREG equ $A000

def IR_LED_OFF equ $C0
def IR_LED_ON  equ $C1


;******************************************************************************
; Screen-related constants
;******************************************************************************

def SCREEN_WIDTH_PX  equ 160 ; width of screen in pixels
def SCREEN_HEIGHT_PX equ 144 ; height of screen in pixels
def SCREEN_WIDTH     equ  20 ; width of screen in bytes
def SCREEN_HEIGHT    equ  18 ; height of screen in bytes
def SCREEN_AREA      equ SCREEN_WIDTH * SCREEN_HEIGHT ; size of screen in bytes

def TILEMAP_WIDTH_PX  equ 256 ; width of tilemap in pixels
def TILEMAP_HEIGHT_PX equ 256 ; height of tilemap in pixels
def TILEMAP_WIDTH     equ  32 ; width of tilemap in bytes
def TILEMAP_HEIGHT    equ  32 ; height of tilemap in bytes
def TILEMAP_AREA      equ TILEMAP_WIDTH * TILEMAP_HEIGHT ; size of tilemap in bytes

def TILE_WIDTH  equ  8 ; width of tile in pixels
def TILE_HEIGHT equ  8 ; height of tile in pixels
def TILE_SIZE   equ 16 ; size of tile in bytes (2 bits/pixel)

def COLOR_SIZE equ 2 ; size of color in bytes (little-endian BGR555)
    def B_COLOR_RED   equ  0 ; bits 4-0
    def B_COLOR_GREEN equ  5 ; bits 9-5
    def B_COLOR_BLUE  equ 10 ; bits 14-10
        def COLOR_RED        equ %000_11111  ; for the low byte
        def COLOR_GREEN_LOW  equ %111_00000  ; for the low byte
        def COLOR_GREEN_HIGH equ %0_00000_11 ; for the high byte
        def COLOR_BLUE       equ %0_11111_00 ; for the high byte
def PAL_COLORS equ 4 ; colors per palette
def PAL_SIZE   equ COLOR_SIZE * PAL_COLORS ; size of palette in bytes

; Tilemaps the BG or Window can read from (controlled by LCDC)
def TILEMAP0 equ $9800 ; $9800-$9BFF
def TILEMAP1 equ $9C00 ; $9C00-$9FFF

; (CGB only) BG tile attribute fields
def B_BG_PRIO  equ 7 ; whether the BG tile colors 1-3 are drawn above OBJs
def B_BG_YFLIP equ 6 ; whether the whole BG tile is flipped vertically
def B_BG_XFLIP equ 5 ; whether the whole BG tile is flipped horizontally
def B_BG_BANK1 equ 3 ; which VRAM bank the BG tile is taken from
def BG_PALETTE equ %00000_111 ; which palette the BG tile uses
    def BG_PRIO  equ 1 << B_BG_PRIO
    def BG_YFLIP equ 1 << B_BG_YFLIP
    def BG_XFLIP equ 1 << B_BG_XFLIP
    def BG_BANK0 equ 0 << B_BG_BANK1
    def BG_BANK1 equ 1 << B_BG_BANK1


;******************************************************************************
; OBJ-related constants
;******************************************************************************

; OAM attribute field offsets
rsreset
def OAMA_Y      rb ; 0
    def OAM_Y_OFS equ 16 ; subtract 16 from what's written to OAM to get the real Y position
def OAMA_X      rb ; 1
    def OAM_X_OFS equ  8 ; subtract 8 from what's written to OAM to get the real X position
def OAMA_TILEID rb ; 2
def OAMA_FLAGS  rb ; 3
    def B_OAM_PRIO  equ 7 ; whether the OBJ is drawn below BG colors 1-3
    def B_OAM_YFLIP equ 6 ; whether the whole OBJ is flipped vertically
    def B_OAM_XFLIP equ 5 ; whether the whole OBJ is flipped horizontally
    def B_OAM_PAL1  equ 4 ; (DMG only) which of the two palettes the OBJ uses
    def B_OAM_BANK1 equ 3 ; (CGB only) which VRAM bank the OBJ takes its tile(s) from
    def OAM_PALETTE equ %00000_111 ; (CGB only) which palette the OBJ uses
        def OAM_PRIO  equ 1 << B_OAM_PRIO
        def OAM_YFLIP equ 1 << B_OAM_YFLIP
        def OAM_XFLIP equ 1 << B_OAM_XFLIP
        def OAM_PAL0  equ 0 << B_OAM_PAL1
        def OAM_PAL1  equ 1 << B_OAM_PAL1
        def OAM_BANK0 equ 0 << B_OAM_BANK1
        def OAM_BANK1 equ 1 << B_OAM_BANK1
def OBJ_SIZE    rb 0 ; size of OBJ in bytes = 4

def OAM_COUNT equ 40 ; how many OBJs there are room for in OAM
def OAM_SIZE  equ OBJ_SIZE * OAM_COUNT


;******************************************************************************
; Interrupt vector addresses
;******************************************************************************

def INT_HANDLER_VBLANK equ $0040 ; VBlank interrupt handler address
def INT_HANDLER_STAT   equ $0048 ; STAT   interrupt handler address
def INT_HANDLER_TIMER  equ $0050 ; timer  interrupt handler address
def INT_HANDLER_SERIAL equ $0058 ; serial interrupt handler address
def INT_HANDLER_JOYPAD equ $0060 ; joypad interrupt handler address


;******************************************************************************
; Boot-up register values
;******************************************************************************

; Register A = CPU type
def BOOTUP_A_DMG equ $01
def BOOTUP_A_CGB equ $11 ; CGB or AGB
def BOOTUP_A_MGB equ $FF
    def BOOTUP_A_SGB  equ BOOTUP_A_DMG
    def BOOTUP_A_SGB2 equ BOOTUP_A_MGB

; Register B = CPU qualifier (if A is BOOTUP_A_CGB)
def B_BOOTUP_B_AGB equ 0
    def BOOTUP_B_CGB equ 0 << B_BOOTUP_B_AGB
    def BOOTUP_B_AGB equ 1 << B_BOOTUP_B_AGB


;******************************************************************************
; Aliases
;******************************************************************************

; Prefer the standard names to these aliases, which may be official but are
; less directly meaningful or human-readable.

def rP1 equ rJOYP

def rNR10 equ rAUD1SWEEP
def rNR11 equ rAUD1LEN
def rNR12 equ rAUD1ENV
def rNR13 equ rAUD1LOW
def rNR14 equ rAUD1HIGH
def rNR21 equ rAUD2LEN
def rNR22 equ rAUD2ENV
def rNR23 equ rAUD2LOW
def rNR24 equ rAUD2HIGH
def rNR30 equ rAUD3ENA
def rNR31 equ rAUD3LEN
def rNR32 equ rAUD3LEVEL
def rNR33 equ rAUD3LOW
def rNR34 equ rAUD3HIGH
def rNR41 equ rAUD4LEN
def rNR42 equ rAUD4ENV
def rNR43 equ rAUD4POLY
def rNR44 equ rAUD4GO
def rNR50 equ rAUDVOL
def rNR51 equ rAUDTERM
def rNR52 equ rAUDENA

def rKEY0 equ rSYS
def rKEY1 equ rSPD

def rHDMA1 equ rVDMA_SRC_HIGH
def rHDMA2 equ rVDMA_SRC_LOW
def rHDMA3 equ rVDMA_DEST_HIGH
def rHDMA4 equ rVDMA_DEST_LOW
def rHDMA5 equ rVDMA_LEN

def rBCPS equ rBGPI
def rBCPD equ rBGPD

def rOCPS equ rOBPI
def rOCPD equ rOBPD

def rSVBK equ rWBK

endc ; HARDWARE_INC
