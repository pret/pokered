X = 42
PRINTLN "{X}"
PRINTLN "{x:X}"
PRINTLN "{X:X}"
PRINTLN "{d:X}"
PRINTLN "{b:X}"

Y equ 1337
PRINTLN "{b:Y}"

rsreset
R rb 0
PRINTLN "{d:R}"

S equs "You can't format me!"
PRINTLN "{X:S}"

SECTION "Test", ROM0
Label:
PRINTLN "{x:Label}"
PRINTLN "{x:@}"
