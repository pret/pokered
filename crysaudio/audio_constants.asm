; pitch
; FrequencyTable indexes (see audio/notes.asm)
	const_def 1
	const C_ ; 1
	const C# ; 2
	const D_ ; 3
	const D# ; 4
	const E_ ; 5
	const F_ ; 6
	const F# ; 7
	const G_ ; 8
	const G# ; 9
	const A_ ; a
	const A# ; b
	const B_ ; c

; channel
; ChannelPointers indexes (see audio/engine.asm)
	const_def
	const CHAN1 ; 0
	const CHAN2 ; 1
	const CHAN3 ; 2
	const CHAN4 ; 3
NUM_MUSIC_CHANS EQU const_value
	const CHAN5 ; 4
	const CHAN6 ; 5
	const CHAN7 ; 6
	const CHAN8 ; 7
NUM_NOISE_CHANS EQU const_value - NUM_MUSIC_CHANS
NUM_CHANNELS EQU const_value

Ch1 EQU CHAN1
Ch2 EQU CHAN2
Ch3 EQU CHAN3
Ch4 EQU CHAN4
Ch5 EQU CHAN5
Ch6 EQU CHAN6
Ch7 EQU CHAN7
Ch8 EQU CHAN8

; channel_struct members (see macros/wram.asm)
CHANNEL_MUSIC_ID                    EQUS "(wChannel1MusicID - wChannel1)"
CHANNEL_MUSIC_BANK                  EQUS "(wChannel1MusicBank - wChannel1)"
CHANNEL_FLAGS1                      EQUS "(wChannel1Flags1 - wChannel1)"
CHANNEL_FLAGS2                      EQUS "(wChannel1Flags2 - wChannel1)"
CHANNEL_FLAGS3                      EQUS "(wChannel1Flags3 - wChannel1)"
CHANNEL_MUSIC_ADDRESS               EQUS "(wChannel1MusicAddress - wChannel1)"
CHANNEL_LAST_MUSIC_ADDRESS          EQUS "(wChannel1LastMusicAddress - wChannel1)"
CHANNEL_NOTE_FLAGS                  EQUS "(wChannel1NoteFlags - wChannel1)"
CHANNEL_CONDITION                   EQUS "(wChannel1Condition - wChannel1)"
CHANNEL_DUTY_CYCLE                  EQUS "(wChannel1DutyCycle - wChannel1)"
CHANNEL_VOLUME_ENVELOPE             EQUS "(wChannel1VolumeEnvelope - wChannel1)"
CHANNEL_FREQUENCY                   EQUS "(wChannel1Frequency - wChannel1)"
CHANNEL_PITCH                       EQUS "(wChannel1Pitch - wChannel1)"
CHANNEL_OCTAVE                      EQUS "(wChannel1Octave - wChannel1)"
CHANNEL_TRANSPOSITION               EQUS "(wChannel1Transposition - wChannel1)"
CHANNEL_NOTE_DURATION               EQUS "(wChannel1NoteDuration - wChannel1)"
CHANNEL_FIELD16                     EQUS "(wChannel1Field16 - wChannel1)"
CHANNEL_LOOP_COUNT                  EQUS "(wChannel1LoopCount - wChannel1)"
CHANNEL_TEMPO                       EQUS "(wChannel1Tempo - wChannel1)"
CHANNEL_TRACKS                      EQUS "(wChannel1Tracks - wChannel1)"
CHANNEL_DUTY_CYCLE_PATTERN          EQUS "(wChannel1DutyCyclePattern - wChannel1)"
CHANNEL_VIBRATO_DELAY_COUNT         EQUS "(wChannel1VibratoDelayCount - wChannel1)"
CHANNEL_VIBRATO_DELAY               EQUS "(wChannel1VibratoDelay - wChannel1)"
CHANNEL_VIBRATO_EXTENT              EQUS "(wChannel1VibratoExtent - wChannel1)"
CHANNEL_VIBRATO_RATE                EQUS "(wChannel1VibratoRate - wChannel1)"
CHANNEL_PITCH_SLIDE_TARGET          EQUS "(wChannel1PitchSlideTarget - wChannel1)"
CHANNEL_PITCH_SLIDE_AMOUNT          EQUS "(wChannel1PitchSlideAmount - wChannel1)"
CHANNEL_PITCH_SLIDE_AMOUNT_FRACTION EQUS "(wChannel1PitchSlideAmountFraction - wChannel1)"
CHANNEL_FIELD25                     EQUS "(wChannel1Field25 - wChannel1)"
CHANNEL_PITCH_OFFSET                EQUS "(wChannel1PitchOffset - wChannel1)"
CHANNEL_FIELD29                     EQUS "(wChannel1Field29 - wChannel1)"
CHANNEL_FIELD2A                     EQUS "(wChannel1Field2a - wChannel1)"
CHANNEL_FIELD2C                     EQUS "(wChannel1Field2c - wChannel1)"
CHANNEL_NOTE_LENGTH                 EQUS "(wChannel1NoteLength - wChannel1)"
CHANNEL_FIELD2E                     EQUS "(wChannel1Field2e - wChannel1)"
CHANNEL_FIELD2F                     EQUS "(wChannel1Field2f - wChannel1)"
CHANNEL_FIELD30                     EQUS "(wChannel1Field30 - wChannel1)"
CHANNEL_STRUCT_LENGTH               EQUS "(wChannel2 - wChannel1)"

NOISE_CHAN_F EQU 2 ; bit set in CHAN5-CHAN7

; Flags1
	const_def
	const SOUND_CHANNEL_ON ; 0
	const SOUND_SUBROUTINE ; 1
	const SOUND_LOOPING    ; 2
	const SOUND_SFX        ; 3
	const SOUND_NOISE      ; 4
	const SOUND_REST       ; 5

; Flags2
	const_def
	const SOUND_VIBRATO      ; 0
	const SOUND_PITCH_SLIDE  ; 1
	const SOUND_DUTY_LOOP    ; 2
	const SOUND_UNKN_0B      ; 3
	const SOUND_PITCH_OFFSET ; 4
	const SOUND_UNKN_0D      ; 5
	const SOUND_UNKN_0E      ; 6
	const SOUND_UNKN_0F      ; 7

; Flags3
	const_def
	const SOUND_VIBRATO_DIR     ; 0
	const SOUND_PITCH_SLIDE_DIR ; 1

; NoteFlags
	const_def
	const NOTE_DUTY_OVERRIDE    ; 0
	const NOTE_FREQ_OVERRIDE    ; 1
	const NOTE_UNUSED           ; 2
	const NOTE_PITCH_SWEEP      ; 3
	const NOTE_NOISE_SAMPLING   ; 4
	const NOTE_REST             ; 5
	const NOTE_VIBRATO_OVERRIDE ; 6

; wVolume
VOLUME_SO1_F     EQU 3
VOLUME_SO2_F     EQU 7
VOLUME_SO1_LEVEL EQU %00000111
VOLUME_SO2_LEVEL EQU %01110000
MAX_VOLUME       EQU $77

; wSoundInput
SOUND_INPUT_CH1_F    EQU 0
SOUND_INPUT_CH2_F    EQU 1
SOUND_INPUT_CH3_F    EQU 2
SOUND_INPUT_CH4_F    EQU 3
SOUND_INPUT_GLOBAL_F EQU 7

; wLowHealthAlarm
DANGER_PITCH_F EQU 4
DANGER_ON_F    EQU 7

; wMusicFade
MUSIC_FADE_IN_F EQU 7
