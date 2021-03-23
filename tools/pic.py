#!/usr/bin/env python2
# -*- coding: utf-8 -*-

"""
A library for use with compressed monster and trainer pics in pokered.
"""
from __future__ import absolute_import
from __future__ import division

import os
import sys
import argparse
from math import sqrt

from pokemontools import gfx


def bitflip(x, n):
    r = 0
    while n:
        r = (r << 1) | (x & 1)
        x >>= 1
        n -= 1
    return r


class Decompressor:
    """
    pokered pic decompression.

    Ported to python 2.7 from the python 3 code at https://github.com/magical/pokemon-sprites-rby.
    """

    table1 = [(2 << i) - 1 for i in range(16)]
    table2 = [
        [0x0, 0x1, 0x3, 0x2, 0x7, 0x6, 0x4, 0x5, 0xf, 0xe, 0xc, 0xd, 0x8, 0x9, 0xb, 0xa],
        [0xf, 0xe, 0xc, 0xd, 0x8, 0x9, 0xb, 0xa, 0x0, 0x1, 0x3, 0x2, 0x7, 0x6, 0x4, 0x5], # prev ^ 0xf
        [0x0, 0x8, 0xc, 0x4, 0xe, 0x6, 0x2, 0xa, 0xf, 0x7, 0x3, 0xb, 0x1, 0x9, 0xd, 0x5],
        [0xf, 0x7, 0x3, 0xb, 0x1, 0x9, 0xd, 0x5, 0x0, 0x8, 0xc, 0x4, 0xe, 0x6, 0x2, 0xa], # prev ^ 0xf
    ]
    table3 = [bitflip(i, 4) for i in range(16)]

    tilesize = 8


    def __init__(self, f, mirror=False, planar=True):
        self.bs = fbitstream(f)
        self.mirror = mirror
        self.planar = planar
        self.data = None

    def decompress(self):
        rams = [[], []]

        self.sizex  = self._readint(4) * self.tilesize
        self.sizey  = self._readint(4)

        self.size = self.sizex * self.sizey

        self.ramorder = self._readbit()

        r1 = self.ramorder
        r2 = self.ramorder ^ 1

        self._fillram(rams[r1])
        mode = self._readbit()
        if mode:
            mode += self._readbit()
        self._fillram(rams[r2])

        rams[0] = bytearray(bitgroups_to_bytes(rams[0]))
        rams[1] = bytearray(bitgroups_to_bytes(rams[1]))

        if mode == 0:
            self._decode(rams[0])
            self._decode(rams[1])
        elif mode == 1:
            self._decode(rams[r1])
            self._xor(rams[r1], rams[r2])
        elif mode == 2:
            self._decode(rams[r2], mirror=False)
            self._decode(rams[r1])
            self._xor(rams[r1], rams[r2])
        else:
            raise Exception("Invalid deinterlace mode!")

        data = []
        if self.planar:
            for a, b in zip(rams[0], rams[1]):
                data += [a, b]
            self.data = bytearray(data)
        else:
            for a, b in zip(bitstream(rams[0]), bitstream(rams[1])):
                data.append(a | (b << 1))
            self.data = bitgroups_to_bytes(data)

    def _fillram(self, ram):
        mode = ['rle', 'data'][self._readbit()]
        size = self.size * 4
        while len(ram) < size:
            if mode == 'rle':
                self._read_rle_chunk(ram)
                mode = 'data'
            elif mode == 'data':
                self._read_data_chunk(ram, size)
                mode = 'rle'
        if len(ram) > size:
            #ram = ram[:size]
            raise ValueError(size, len(ram))

        ram[:] = self._deinterlace_bitgroups(ram)

    def _read_rle_chunk(self, ram):

        i = 0
        while self._readbit():
            i += 1

        n = self.table1[i]
        a = self._readint(i + 1)
        n += a

        for i in range(n):
            ram.append(0)

    def _read_data_chunk(self, ram, size):
        while 1:
            bitgroup = self._readint(2)
            if bitgroup == 0:
                break
            ram.append(bitgroup)

            if size <= len(ram):
                break

    def _decode(self, ram, mirror=None):
        if mirror is None:
            mirror = self.mirror

        for x in range(self.sizex):
            bit = 0
            for y in range(self.sizey):
                i = y * self.sizex + x
                a = (ram[i] >> 4) & 0xf
                b = ram[i] & 0xf

                a = self.table2[bit][a]
                bit = a & 1
                if mirror:
                    a = self.table3[a]

                b = self.table2[bit][b]
                bit = b & 1
                if mirror:
                    b = self.table3[b]

                ram[i] = (a << 4) | b

    def _xor(self, ram1, ram2, mirror=None):
        if mirror is None:
            mirror = self.mirror

        for i in range(len(ram2)):
            if mirror:
                a = (ram2[i] >> 4) & 0xf
                b = ram2[i] & 0xf
                a = self.table3[a]
                b = self.table3[b]
                ram2[i] = (a << 4) | b

            ram2[i] ^= ram1[i]

    def _deinterlace_bitgroups(self, bits):
        l = []
        for y in range(self.sizey):
            for x in range(self.sizex):
                i = 4 * y * self.sizex + x
                for j in range(4):
                    l.append(bits[i])
                    i += self.sizex
        return l


    def _readbit(self):
        return next(self.bs)

    def _readint(self, count):
        return readint(self.bs, count)


def fbitstream(f):
    while 1:
        char = f.read(1)
        if not char:
            break
        byte = ord(char)

        for i in range(7, -1, -1):
            yield (byte >> i) & 1

def bitstream(b):
    for byte in b:
        for i in range(7, -1, -1):
            yield (byte >> i) & 1

def readint(bs, count):
    n = 0
    while count:
        n <<= 1
        n |= next(bs)
        count -= 1
    return n

def bitgroups_to_bytes(bits):
    l = []
    for i in range(0, len(bits) - 3, 4):
        n = ((bits[i + 0] << 6)
           | (bits[i + 1] << 4)
           | (bits[i + 2] << 2)
           | (bits[i + 3] << 0))
        l.append(n)
    return bytearray(l)


def bytes_to_bits(bytelist):
    return list(bitstream(bytelist))


class Compressor:
    """
    pokered pic compression.

    Adapted from stag019's C compressor.
    """

    table1 = [(2 << i) - 1 for i in range(16)]
    table2 = [
        [0x0, 0x1, 0x3, 0x2, 0x6, 0x7, 0x5, 0x4, 0xc, 0xd, 0xf, 0xe, 0xa, 0xb, 0x9, 0x8],
        [0x8, 0x9, 0xb, 0xa, 0xe, 0xf, 0xd, 0xc, 0x4, 0x5, 0x7, 0x6, 0x2, 0x3, 0x1, 0x0], # reverse
    ]
    table3 = [bitflip(i, 4) for i in range(16)]

    def __init__(self, image, width=None, height=None):
        self.image = bytearray(image)
        self.size = len(self.image)

        planar_tile = 8 * 8 // 4
        tile_size = self.size // planar_tile
        if   height    and not width:  width  = tile_size // height
        elif width     and not height: height = tile_size // width
        elif not width and not height: width = height = int(sqrt(tile_size))
        self.width, self.height = width, height

    def compress(self):
        """
        Compress the image five times (twice for each mode, except 0)
        and use the smallest one (in bits).
        """
        rams = [[],[]]
        datas = []

        for mode in range(3):

            # Order is redundant for mode 0.

            # While this seems like an optimization,
            # it's actually required for 1:1 compression
            # to the original compressed pics.

            # This appears to be the algorithm
            # that Game Freak's compressor used.

            # Using order 0 instead of 1 breaks this feature.

            for order in range(2):
                if mode == 0 and order == 0:
                    continue
                for i in range(2):
                    rams[i] = self.image[i::2]
                self._interpret_compress(rams, mode, order)
                datas += [(self.data[:], int(self.which_bit))]

        # Pick the smallest pic, measured in bits.
        datas = sorted(datas, key=lambda data_bit: (len(data_bit[0]), -data_bit[1]))
        self.data, self.which_bit = datas[0]

    def _interpret_compress(self, rams, mode, order):
        self.data = []
        self.which_bit = 0

        r1 = order
        r2 = order ^ 1

        if mode == 0:
            self._encode(rams[1])
            self._encode(rams[0])
        elif mode == 1:
            self._xor(rams[r1], rams[r2])
            self._encode(rams[r1])
        elif mode == 2:
            self._xor(rams[r1], rams[r2])
            self._encode(rams[r1])
            self._encode(rams[r2], mirror=False)
        else:
            raise Exception('invalid interlace mode!')

        self._writeint(self.height, 4)
        self._writeint(self.width,  4)

        self._writebit(order)

        self._fillram(rams[r1])
        if mode == 0:
            self._writebit(0)
        else:
            self._writebit(1)
            self._writebit(mode - 1)
        self._fillram(rams[r2])

    def _fillram(self, ram):
        rle = 0
        nums = 0
        bitgroups = []

        for x in range(self.width):
            for bit in range(0, 8, 2):
                byte = x * self.height * 8
                for y in range(self.height * 8):
                    bitgroup = (ram[byte] >> (6 - bit)) & 3
                    if bitgroup == 0:
                        if rle == 0:
                            self._writebit(0)
                        elif rle == 1:
                            nums += 1
                        else:
                            self._data_packet(bitgroups)
                            self._writebit(0)
                            self._writebit(0)
                        rle = 1
                        bitgroups = []
                    else:
                        if rle == 0:
                            self._writebit(1)
                        elif rle == 1:
                            self._rle(nums)
                        rle = -1
                        bitgroups += [bitgroup]
                        nums = 0
                    byte += 1

        if rle == 1:
            self._rle(nums)
        else:
            self._data_packet(bitgroups)

    def _data_packet(self, bitgroups):
        for bitgroup in bitgroups:
            self._writebit((bitgroup >> 1) & 1)
            self._writebit((bitgroup >> 0) & 1)

    def _rle(self, nums):
        nums += 1

        # Get the previous power of 2.
        # Deriving the bitcount from that seems to be
        # faster on average than using the lookup table.
        v = nums
        v += 1
        v |= v >> 1
        v |= v >> 2
        v |= v >> 4
        v |= v >> 8
        v |= v >> 16
        v -= v >> 1
        v -= 1
        number = nums - v

        bitcount = -1
        while v:
            v >>= 1
            bitcount += 1

        for j in range(bitcount):
            self._writebit(1)
        self._writebit(0)
        for j in range(bitcount, -1, -1):
            self._writebit((number >> j) & 1)

    def _encode(self, ram, mirror=None):
        a = b = 0
        for i in range(len(ram)):
            j = i // self.height
            j += i % self.height * self.width * 8
            if i % self.height == 0:
                b = 0

            a = (ram[j] >> 4) & 0xf
            table = b & 1
            code_1 = self.table2[table][a]

            b = ram[j] & 0xf
            table = a & 1
            code_2 = self.table2[table][b]

            ram[j] = (code_1 << 4) | code_2

    def _xor(self, ram1, ram2):
        for i in range(len(ram2)):
            ram2[i] ^= ram1[i]

    def _writebit(self, bit):
        self.which_bit -= 1
        if self.which_bit == -1:
            self.which_bit = 7
            self.data += [0]
        if bit: self.data[-1] |= bit << self.which_bit

    def _writeint(self, num, size=None):
        bits = []
        if size:
            for i in range(size):
                bits += [num & 1]
                num >>= 1
        else:
            while num > 0:
                bits += [num & 1]
                num >>= 1
        for bit in reversed(bits):
            self._writebit(bit)


def decompress(f, offset=None, mirror=False):
    """
    Decompress a pic given a file object. Return a planar 2bpp image.

    Optional: offset (for roms).
    """
    if offset is not None:
        f.seek(offset)
    dcmp = Decompressor(f, mirror=mirror)
    dcmp.decompress()
    return dcmp.data


def compress(f):
    """
    Compress a planar 2bpp into a pic.
    """
    comp = Compressor(f)
    comp.compress()
    return comp.data


def decompress_file(filename):
    """
    Decompress a pic given a filename.
    Export the resulting planar 2bpp image to
    """
    pic = open(filename, 'rb')
    image = decompress(pic)
    image = gfx.transpose_tiles(image)
    image = bytearray(image)
    output_filename = os.path.splitext(filename)[0] + '.2bpp'
    with open(output_filename, 'wb') as out:
        out.write(image)

def compress_file(filename):
    image = open(filename, 'rb').read()
    image = gfx.transpose_tiles(image)
    pic = compress(image)
    pic = bytearray(pic)
    output_filename = os.path.splitext(filename)[0] + '.pic'
    with open(output_filename, 'wb') as out:
        out.write(pic)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('mode')
    ap.add_argument('filenames', nargs='*')
    args = ap.parse_args()

    for filename in args.filenames:
        if args.mode == 'decompress':
            decompress_file(filename)
        elif args.mode == 'compress':
            compress_file(filename)

if __name__ == '__main__':
    main()

