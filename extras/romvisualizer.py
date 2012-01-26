#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-13
import os

changeset_numbers = range(266, 635)

def take_snapshot_image(changeset_number):
    "turn main.asm into an image at a certain version"

    print "reverting main.asm to r" + str(changeset_number)

    #revert the file
    os.system("hg revert ../main.asm -r" + str(changeset_number))

    print "generating the image.."

    #draw the image
    os.system("python romviz.py")

    #move the file
    os.system("mv test.png versions/" + str(changeset_number) + ".png")

for changeset_number in changeset_numbers:
    take_snapshot_image(changeset_number)

