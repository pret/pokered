SECTION "test", ROM0

Label:
println SECTION(Label) ; OK

DEF Value EQU 42
println SECTION(Value) ; not OK
