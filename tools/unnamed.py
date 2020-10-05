#!/usr/bin/env python3

from sys import stderr, exit
from subprocess import Popen, PIPE
from struct import unpack, calcsize
from enum import Enum

class symtype(Enum):
    LOCAL = 0
    IMPORT = 1
    EXPORT = 2

def unpack_file(fmt, file):
    size = calcsize(fmt)
    return unpack(fmt, file.read(size))

def read_string(file):
    buf = bytearray()
    while True:
        b = file.read(1)
        if b is None or b == b'\0':
            return buf.decode()
        else:
            buf += b


# Fix broken pipe when using `head`
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL)

import argparse
parser = argparse.ArgumentParser(description="Parse the symfile to find unnamed symbols")
parser.add_argument('symfile', type=argparse.FileType('r'), help="the list of symbols")
parser.add_argument('-r', '--rootdir', type=str, help="scan the output files to obtain a list of files with unnamed symbols (NOTE: will rebuild objects as necessary)")
parser.add_argument('-l', '--list', type=int, default=0, help="output this many of each file's unnamed symbols (NOTE: requires -r)")
args = parser.parse_args()

# Get list of object files
objects = None
if args.rootdir:
    for line in Popen(["make", "-C", args.rootdir, "-s", "-p", "DEBUG=1"],
            stdout=PIPE).stdout.read().decode().split("\n"):
        if line.startswith("pokered_obj := "):
            objects = line[15:].strip().split()
            break
    else:
        print("Error: Object files not found!", file=stderr)
        exit(1)

# Scan all unnamed symbols from the symfile
symbols_total = 0
symbols = set()
for line in args.symfile:
    line = line.split(";")[0].strip()
    split = line.split(" ")
    if len(split) < 2:
        continue

    symbols_total += 1

    symbol = " ".join(split[1:]).strip()
    if symbol[-3:].lower() == split[0][-3:].lower():
        symbols.add(symbol)

# If no object files were provided, just print what we know and exit
print("Unnamed pokered symbols: %d (%.2f%% complete)" % (len(symbols),
        (symbols_total - len(symbols)) / symbols_total * 100))
if not objects:
    for sym in symbols:
        print(sym)
    exit()

# Count the amount of symbols in each file
files = {}
for objfile in objects:
    f = open(objfile, "rb")
    obj_ver = None

    magic = unpack_file("4s", f)[0]
    if magic == b'RGB6':
        obj_ver = 6
    elif magic == b'RGB9':
        obj_ver = 10 + unpack_file("<I", f)[0]

    if obj_ver not in [6, 10, 11, 12, 13, 15]:
        print("Error: File '%s' is of an unknown format." % objfile, file=stderr)
        exit(1)

    num_symbols = unpack_file("<II", f)[0]
    for x in range(num_symbols):
        sym_name = read_string(f)
        sym_type = symtype(unpack_file("<B", f)[0] & 0x7f)
        if sym_type == symtype.IMPORT:
            continue
        sym_filename = read_string(f)
        unpack_file("<III", f)
        if sym_name not in symbols:
            continue

        if sym_filename not in files:
            files[sym_filename] = []
        files[sym_filename].append(sym_name)

# Sort the files, the one with the most amount of symbols first
files = sorted(((f, files[f]) for f in files), key=lambda x: len(x[1]), reverse=True)
for f in files:
    filename, unnamed = f
    sym_list = ', '.join(unnamed[:args.list])
    print("%s: %d%s" % (filename, len(unnamed), ': ' + sym_list if sym_list else ''))
