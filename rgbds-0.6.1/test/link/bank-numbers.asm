section "x",rom0[$0000]
	db bank(r0),bank(r1),bank(r2),bank(r3) ; Should be enough
	db bank(v0),bank(v1)
	db bank(w0),bank(w1),bank(w2),bank(w3),bank(w4),bank(w5),bank(w6),bank(w7)
	db bank(s0),bank(s1),bank(s2),bank(s3) ; Should be enough
	db bank(o0)
	db bank(h0)

section "r0",rom0
r0:
section "r1",romx,bank[1]
r1:
section "r2",romx,bank[2]
r2:
section "r3",romx,bank[3]
r3:

section "v0",vram,bank[0]
v0:
section "v1",vram,bank[1]
v1:

section "s0",sram,bank[0]
s0:
section "s1",sram,bank[1]
s1:
section "s2",sram,bank[2]
s2:
section "s3",sram,bank[3]
s3:

section "w0",wram0
w0:
section "w1",wramx,bank[1]
w1:
section "w2",wramx,bank[2]
w2:
section "w3",wramx,bank[3]
w3:
section "w4",wramx,bank[4]
w4:
section "w5",wramx,bank[5]
w5:
section "w6",wramx,bank[6]
w6:
section "w7",wramx,bank[7]
w7:

section "o0",oam
o0:

section "h0",hram
h0:
