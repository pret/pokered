; Pokemon Red variant of data/events/prizes.asm.
PrizeDifferentMenuPtrs:
.DW PrizeMenuMon1Entries, PrizeMenuMon1Cost
.DW PrizeMenuMon2Entries, PrizeMenuMon2Cost
.DW PrizeMenuTMsEntries, PrizeMenuTMsCost

NoThanksText:
.DB "NO THANKS@"

PrizeMenuMon1Entries:
.DB ABRA, CLEFAIRY, NIDORINA, "@"

PrizeMenuMon1Cost:
.DB $01, $80
.DB $05, $00
.DB $12, $00
.DB "@"

PrizeMenuMon2Entries:
.DB DRATINI, SCYTHER, PORYGON, "@"

PrizeMenuMon2Cost:
.DB $28, $00
.DB $55, $00
.DB $99, $99
.DB "@"

PrizeMenuTMsEntries:
.DB TM_DRAGON_RAGE, TM_HYPER_BEAM, TM_SUBSTITUTE, "@"

PrizeMenuTMsCost:
.DB $33, $00
.DB $55, $00
.DB $77, $00
.DB "@"
