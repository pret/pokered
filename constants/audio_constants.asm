; HW sound channel register base addresses
HW_CH1_BASE EQU (rNR10 % $100)
HW_CH2_BASE EQU ((rNR21 % $100) - 1)
HW_CH3_BASE EQU (rNR30 % $100)
HW_CH4_BASE EQU ((rNR41 % $100) - 1)

; HW sound channel enable bit masks
HW_CH1_ENABLE_MASK EQU %00010001
HW_CH2_ENABLE_MASK EQU %00100010
HW_CH3_ENABLE_MASK EQU %01000100
HW_CH4_ENABLE_MASK EQU %10001000

; HW sound channel disable bit masks
HW_CH1_DISABLE_MASK EQU (~HW_CH1_ENABLE_MASK & $ff)
HW_CH2_DISABLE_MASK EQU (~HW_CH2_ENABLE_MASK & $ff)
HW_CH3_DISABLE_MASK EQU (~HW_CH3_ENABLE_MASK & $ff)
HW_CH4_DISABLE_MASK EQU (~HW_CH4_ENABLE_MASK & $ff)

REG_DUTY_SOUND_LEN  EQU 1
REG_VOLUME_ENVELOPE EQU 2
REG_FREQUENCY_LO    EQU 3

MAX_SFX_ID_1 EQUS "SFX_SAFARI_ZONE_PA"
MAX_SFX_ID_2 EQUS "SFX_SILPH_SCOPE"
MAX_SFX_ID_3 EQUS "SFX_SHOOTING_STAR"

NOISE_INSTRUMENTS_START EQUS "SFX_NOISE_INSTRUMENT01"
NOISE_INSTRUMENTS_END   EQUS "SFX_NOISE_INSTRUMENT19 + 1"

CRY_SFX_START EQUS "SFX_CRY_00"
CRY_SFX_END   EQUS "SFX_CRY_25 + 3"

BATTLE_SFX_START EQUS "SFX_PECK"
BATTLE_SFX_END   EQUS "SFX_SILPH_SCOPE + 1"

; wChannelFlags1 constants
BIT_PERFECT_PITCH          EQU 0 ; controlled by toggle_perfect_pitch command
BIT_SOUND_CALL             EQU 1 ; if in sound call
BIT_NOISE_OR_SFX           EQU 2 ; if channel is the music noise channel or an SFX channel
BIT_VIBRATO_DIRECTION      EQU 3 ; if the pitch is above or below normal (cycles)
BIT_PITCH_SLIDE_ON         EQU 4 ; if pitch slide is active
BIT_PITCH_SLIDE_DECREASING EQU 5 ; if the pitch slide frequency is decreasing (instead of increasing)
BIT_ROTATE_DUTY_CYCLE      EQU 6 ; if rotating duty cycle

; wChannelFlags2 constant (only has one flag)
BIT_EXECUTE_MUSIC EQU 0 ; if in execute music
