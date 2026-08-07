; data format for "trainer" macro that appears in map scripts with basic trainer encounters
; see \macros\scripts\maps.asm
rsreset
DEF TRAINER_EVENT_BIT_OFFSET          rb
DEF TRAINER_VIEW_RANGE_OFFSET         rb
DEF TRAINER_EVENT_POINTER_OFFSET      rw
DEF TRAINER_BEFORE_TEXT_OFFSET        rw
DEF TRAINER_AFTER_TEXT_OFFSET         rw
DEF TRAINER_END_TEXT_OFFSET           rw
DEF TRAINER_LOST_TEXT_UNUSED_OFFSET   rw
DEF TRAINER_STRUCT_SIZE EQU _RS
