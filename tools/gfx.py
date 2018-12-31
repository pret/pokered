#!/usr/bin/env python2
# -*- coding: utf-8 -*-

"""Supplementary scripts for graphics conversion."""

import os
import argparse

from pokemontools import gfx, lz


# Graphics with inverted tilemaps that aren't covered by filepath_rules.
pics = [
    'gfx/shrink1',
    'gfx/shrink2',
]

def recursive_read(filename):
    def recurse(filename_):
        lines = []
        for line in open(filename_):
            if 'include "' in line.lower():
                lines += recurse(line.split('"')[1])
            else:
                lines += [line]
        return lines
    lines = recurse(filename)
    return ''.join(lines)

base_stats = None
def get_base_stats():
    global base_stats
    if not base_stats:
        base_stats = recursive_read('data/base_stats.asm')
    return base_stats

def get_pokemon_dimensions(path):
    try:
        byte = bytearray(open(path, 'rb').read())[0]
        width = byte & 0xf
        height = (byte >> 8) & 0xf
        return width, height
    except:
        return None


def get_animation_frames(path=None, w=7, h=7, bitmask_path=None, frame_path=None):
    """Retrieve animation frame tilemaps from generated frame/bitmask data."""
    if not path:
        path = bitmask_path
    if not path:
        path = frame_path
    if not path:
        raise Exception("need at least one of path, bitmask_path or frame_path")

    if not bitmask_path:
        bitmask_path = os.path.join(os.path.split(path)[0], 'bitmask.asm')
    if not frame_path:
        frame_path = os.path.join(os.path.split(path)[0], 'frames.asm')
    bitmask_lines = open(bitmask_path).readlines()
    frame_lines = open(frame_path).readlines()

    bitmask_length = w * h

    bitmasks = []
    bitmask = []
    for line in bitmask_lines:
        if '\tdb ' in line:
            value = line.split('\tdb ')[1].strip().replace('%', '0b')
            value = int(value, 0)
            #print line.strip(), value, len(bitmasks), len(bitmask)
            for bit in xrange(8):
                bitmask += [(value >> bit) & 1]
                if len(bitmask) >= bitmask_length:
                    bitmasks += [bitmask]
                    bitmask = []
                    break
    if bitmask:
        bitmasks += [bitmask]

    frames = []
    frame_labels = []
    i = 0
    for line in frame_lines:
        if '\tdw ' in line:
            frame_labels += [line.split('\tdw ')[1].strip()]
        else:
            for part in line.split():
                part = part.strip()
                if part in frame_labels:
                    frames += [(part, i)]
        i += 1

    results = []

    for label, i in frames:
        result = []

        # get the bitmask and tile ids for each frame
        # don't care if we read past bounds, so just read the rest of the file
        values = []
        for line in frame_lines[i:]:
            if '\tdb ' in line:
                values += line.split('\tdb ')[1].split(';')[0].split(',')

        #print bitmasks
        #print values[0]
        #print int(values[0].replace('$', '0x'), 0)
        bitmask = bitmasks[int(values[0].replace('$', '0x'), 0)]
        tiles = values[1:]
        k = 0
        j = 0
        for bit in bitmask:
            if bit:
                result += [int(tiles[k].replace('$', '0x'), 0)]
                k += 1
            else:
                result += [j]
            j += 1

        results += [result]

    return results

def get_animated_graphics(path, w=7, h=7, bitmask_path=None, frame_path=None):
    frames = get_animation_frames(path, w, h, bitmask_path, frame_path)
    new_path = path.replace('.animated.2bpp', '.2bpp')
    tiles = gfx.get_tiles(bytearray(open(path, 'rb').read()))
    new_tiles = tiles[:w * h]
    for frame in frames:
        for tile in frame:
            new_tiles += [tiles[tile]]
    new_graphic = gfx.connect(new_tiles)
    print new_path, list(new_graphic)
    open(new_path, 'wb').write(bytearray(new_graphic))
    return new_path

def filepath_rules(filepath):
    """Infer attributes of certain graphics by their location in the filesystem."""
    args = {}

    filedir, filename = os.path.split(filepath)
    if filedir.startswith('./'):
        filedir = filedir[2:]

    name, ext = os.path.splitext(filename)
    if ext == '.lz':
        name, ext = os.path.splitext(name)

    pokemon_name = ''

    if 'gfx/pokemon/' in filedir:
        pokemon_name = filedir.split('/')[-1]
        if pokemon_name.startswith('unown_'):
            index = filedir.find(pokemon_name)
            if index != -1:
                filedir = filedir[:index + len('unown')] + filedir[index + len('unown_a'):]
        if name == 'front' or name == 'front.animated':
            args['pal_file'] = os.path.join(filedir, 'normal.pal')
            args['pic'] = True
            args['animate'] = True
        elif name == 'back':
            args['pal_file'] = os.path.join(filedir, 'normal.pal')
            args['pic'] = True

    elif 'gfx/trainers' in filedir:
        args['pic'] = True

    elif os.path.join(filedir, name) in pics:
        args['pic'] = True

    elif filedir == 'gfx/tilesets':
        args['tileset'] = True

    if args.get('pal_file'):
        if os.path.exists(args['pal_file']):
            args['palout'] = args['pal_file']
        else:
            del args['pal_file']

    if args.get('pic'):
        if ext == '.png':
            w, h = gfx.png.Reader(filepath).asRGBA8()[:2]
            w = min(w/8, h/8)
            args['pic_dimensions'] = w, w
        elif ext == '.2bpp':
            if pokemon_name and name == 'front' or name == 'front.animated':
                w, h = get_pokemon_dimensions(filepath.replace(ext, '.dimensions')) or (7, 7)
                args['pic_dimensions'] = w, w
            elif pokemon_name and name == 'back':
                args['pic_dimensions'] = 6, 6
            else:
                args['pic_dimensions'] = 7, 7

    if args.get('tileset'):
        args['width'] = 128
    return args


def to_1bpp(filename, **kwargs):
    name, ext = os.path.splitext(filename)
    if   ext == '.1bpp': pass
    elif ext == '.2bpp': gfx.export_2bpp_to_1bpp(filename, **kwargs)
    elif ext == '.png':  gfx.export_png_to_1bpp(filename, **kwargs)
    elif ext == '.lz':
        decompress(filename, **kwargs)
        to_1bpp(name, **kwargs)

def to_2bpp(filename, **kwargs):
    name, ext = os.path.splitext(filename)
    if   ext == '.1bpp': gfx.export_1bpp_to_2bpp(filename, **kwargs)
    elif ext == '.2bpp': pass
    elif ext == '.png':  gfx.export_png_to_2bpp(filename, **kwargs)
    elif ext == '.lz':
        decompress(filename, **kwargs)
        to_2bpp(name, **kwargs)

def to_png(filename, **kwargs):
    name, ext = os.path.splitext(filename)
    if   ext == '.1bpp': gfx.export_1bpp_to_png(filename, **kwargs)
    elif ext == '.2bpp' and name.endswith('.animated'):
        w, h = kwargs.get('pic_dimensions') or (7, 7)
        new_path = get_animated_graphics(filename, w=w, h=h)
        return to_png(new_path, **kwargs)
    elif ext == '.2bpp': gfx.export_2bpp_to_png(filename, **kwargs)
    elif ext == '.png':  pass
    elif ext == '.lz':
        decompress(filename, **kwargs)
        to_png(name, **kwargs)

def compress(filename, **kwargs):
    data = open(filename, 'rb').read()
    lz_data = lz.Compressed(data).output
    open(filename + '.lz', 'wb').write(bytearray(lz_data))

def decompress(filename, **kwargs):
    lz_data = open(filename, 'rb').read()
    data = lz.Decompressed(lz_data).output
    name, ext = os.path.splitext(filename)
    open(name, 'wb').write(bytearray(data))


methods = {
    '2bpp': to_2bpp,
    '1bpp': to_1bpp,
    'png':  to_png,
    'lz':   compress,
    'unlz': decompress,
}

def main(method_name, filenames=None):
    if filenames is None: filenames = []
    for filename in filenames:
        args = filepath_rules(filename)
        method = methods.get(method_name)
        if method:
            method(filename, **args)

def get_args():
    ap = argparse.ArgumentParser()
    ap.add_argument('method_name')
    ap.add_argument('filenames', nargs='*')
    args = ap.parse_args()
    return args

if __name__ == '__main__':
    main(**get_args().__dict__)
