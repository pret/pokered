#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-19
#spit out some constants

for x in range(1, 51):
    print "W_BOXITEM%.2d       EQU $%s" % (x, ("%.2x" % (0xd539+(x*2))).upper())
    print "W_BOXITEM%.2dQTY    EQU $%s" % (x, ("%.2x" % (0xd539+(x*2)+1)).upper())

