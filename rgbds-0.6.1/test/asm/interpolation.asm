SECTION "Test", ROM0

NAME equs "ITEM"
FMT equs "d"
ZERO_NUM equ 0
ZERO_STR equs "0"
; Defines INDEX as 100
INDEX = 1{ZERO_STR}{{FMT}:ZERO_NUM}
; Defines ITEM_100 as "\"hundredth\""
{NAME}_{d:INDEX} equs "\"hundredth\""
; Prints "ITEM_100 is hundredth"
PRINTLN STRCAT("{NAME}_{d:INDEX}", " is ", {NAME}_{d:INDEX})
; Purges ITEM_100
PURGE {NAME}_{d:INDEX}
ASSERT !DEF({NAME}_{d:INDEX})
