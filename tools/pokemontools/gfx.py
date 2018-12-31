# -*- coding: utf-8 -*-

import os
import sys
import png
from math import sqrt, floor, ceil
import argparse
import operator

from lz import Compressed, Decompressed


def split(list_, interval):
    """
    Split a list by length.
    """
    for i in xrange(0, len(list_), interval):
        j = min(i + interval, len(list_))
        yield list_[i:j]


def hex_dump(data, length=0x10):
    """
    just use hexdump -C
    """
    margin = len('%x' % len(data))
    output = []
    address = 0
    for line in split(data, length):
        output += [
            hex(address)[2:].zfill(margin) +
            ' | ' +
            ' '.join('%.2x' % byte for byte in line)
        ]
        address += length
    return '\n'.join(output)


def get_tiles(image):
    """
    Split a 2bpp image into 8x8 tiles.
    """
    return list(split(image, 0x10))

def connect(tiles):
    """
    Combine 8x8 tiles into a 2bpp image.
    """
    return [byte for tile in tiles for byte in tile]

def transpose(tiles, width=None):
    """
    Transpose a tile arrangement along line y=-x.

      00 01 02 03 04 05     00 06 0c 12 18 1e
      06 07 08 09 0a 0b     01 07 0d 13 19 1f
      0c 0d 0e 0f 10 11 <-> 02 08 0e 14 1a 20
      12 13 14 15 16 17     03 09 0f 15 1b 21
      18 19 1a 1b 1c 1d     04 0a 10 16 1c 22
      1e 1f 20 21 22 23     05 0b 11 17 1d 23

      00 01 02 03     00 04 08
      04 05 06 07 <-> 01 05 09
      08 09 0a 0b     02 06 0a
                      03 07 0b
    """
    if width == None:
        width = int(sqrt(len(tiles))) # assume square image
    tiles = sorted(enumerate(tiles), key= lambda (i, tile): i % width)
    return [tile for i, tile in tiles]

def transpose_tiles(image, width=None):
    return connect(transpose(get_tiles(image), width))

def interleave(tiles, width):
    """
      00 01 02 03 04 05     00 02 04 06 08 0a
      06 07 08 09 0a 0b     01 03 05 07 09 0b
      0c 0d 0e 0f 10 11 --> 0c 0e 10 12 14 16
      12 13 14 15 16 17     0d 0f 11 13 15 17
      18 19 1a 1b 1c 1d     18 1a 1c 1e 20 22
      1e 1f 20 21 22 23     19 1b 1d 1f 21 23
    """
    interleaved = []
    left, right = split(tiles[::2], width), split(tiles[1::2], width)
    for l, r in zip(left, right):
        interleaved += l + r
    return interleaved

def deinterleave(tiles, width):
    """
      00 02 04 06 08 0a     00 01 02 03 04 05 
      01 03 05 07 09 0b     06 07 08 09 0a 0b
      0c 0e 10 12 14 16 --> 0c 0d 0e 0f 10 11
      0d 0f 11 13 15 17     12 13 14 15 16 17
      18 1a 1c 1e 20 22     18 19 1a 1b 1c 1d
      19 1b 1d 1f 21 23     1e 1f 20 21 22 23
    """
    deinterleaved = []
    rows = list(split(tiles, width))
    for left, right in zip(rows[::2], rows[1::2]):
        for l, r in zip(left, right):
            deinterleaved += [l, r]
    return deinterleaved

def interleave_tiles(image, width):
    return connect(interleave(get_tiles(image), width))

def deinterleave_tiles(image, width):
    return connect(deinterleave(get_tiles(image), width))


def condense_image_to_map(image, pic=0):
    """
    Reduce an image of adjacent frames to an image containing a base frame and any unrepeated tiles.
    Returns the new image and the corresponding tilemap used to reconstruct the input image.

    If <pic> is 0, ignore the concept of frames. This behavior might be better off as another function.
    """
    tiles = get_tiles(image)
    new_tiles, tilemap = condense_tiles_to_map(tiles, pic)
    new_image = connect(new_tiles)
    return new_image, tilemap

def condense_tiles_to_map(tiles, pic=0):
    """
    Reduce a sequence of tiles representing adjacent frames to a base frame and any unrepeated tiles.
    Returns the new tiles and the corresponding tilemap used to reconstruct the input tile sequence.

    If <pic> is 0, ignore the concept of frames. This behavior might be better off as another function.
    """

    # Leave the first frame intact for pics.
    new_tiles = tiles[:pic]
    tilemap   = range(pic)

    for i, tile in enumerate(tiles[pic:]):
        if tile not in new_tiles:
            new_tiles.append(tile)

        if pic:
            # Match the first frame exactly where possible.
            # This reduces the space needed to replace tiles in pic animations.
            # For example, if a tile is repeated twice in the first frame,
            # but at the same relative index as the second tile, use the second index.
            # When creating a bitmask later, the second index would not require a replacement, but the first index would have.
            pic_i = i % pic
            if tile == new_tiles[pic_i]:
                tilemap.append(pic_i)
            else:
                tilemap.append(new_tiles.index(tile))
        else:
            tilemap.append(new_tiles.index(tile))
    return new_tiles, tilemap

def test_condense_tiles_to_map():
    test = condense_tiles_to_map(list('abcadbae'))
    if test != (list('abcde'), [0, 1, 2, 0, 3, 1, 0, 4]):
        raise Exception(test)
    test = condense_tiles_to_map(list('abcadbae'), 2)
    if test != (list('abcde'), [0, 1, 2, 0, 3, 1, 0, 4]):
        raise Exception(test)
    test = condense_tiles_to_map(list('abcadbae'), 4)
    if test != (list('abcade'), [0, 1, 2, 3, 4, 1, 0, 5]):
        raise Exception(test)
    test = condense_tiles_to_map(list('abcadbea'), 4)
    if test != (list('abcade'), [0, 1, 2, 3, 4, 1, 5, 3]):
        raise Exception(test)


def to_file(filename, data):
    """
    Apparently open(filename, 'wb').write(bytearray(data)) won't work.
    """
    file = open(filename, 'wb')
    for byte in data:
        file.write('%c' % byte)
    file.close()


def decompress_file(filein, fileout=None):
    image = bytearray(open(filein).read())
    de = Decompressed(image)

    if fileout == None:
        fileout = os.path.splitext(filein)[0]
    to_file(fileout, de.output)


def compress_file(filein, fileout=None):
    image = bytearray(open(filein).read())
    lz = Compressed(image)

    if fileout == None:
        fileout = filein + '.lz'
    to_file(fileout, lz.output)


def bin_to_rgb(word):
    red   = word & 0b11111
    word >>= 5
    green = word & 0b11111
    word >>= 5
    blue  = word & 0b11111
    return (red, green, blue)

def convert_binary_pal_to_text_by_filename(filename):
    pal = bytearray(open(filename).read())
    return convert_binary_pal_to_text(pal)

def convert_binary_pal_to_text(pal):
    output = ''
    words = [hi * 0x100 + lo for lo, hi in zip(pal[::2], pal[1::2])]
    for word in words:
        red, green, blue = ['%.2d' % c for c in bin_to_rgb(word)]
        output += '\tRGB ' + ', '.join((red, green, blue))
        output += '\n'
    return output

def read_rgb_macros(lines):
    colors = []
    for line in lines:
        macro = line.split(" ")[0].strip()
        if macro == 'RGB':
            params = ' '.join(line.split(" ")[1:]).split(',')
            red, green, blue = [int(v) for v in params]
            colors += [[red, green, blue]]
    return colors


def rewrite_binary_pals_to_text(filenames):
    for filename in filenames:
        pal_text = convert_binary_pal_to_text_by_filename(filename)
        with open(filename, 'w') as out:
            out.write(pal_text)


def flatten(planar):
    """
    Flatten planar 2bpp image data into a quaternary pixel map.
    """
    strips = []
    for bottom, top in split(planar, 2):
        bottom = bottom
        top = top
        strip = []
        for i in xrange(7,-1,-1):
            color = (
                (bottom >> i & 1) +
                (top *2 >> i & 2)
            )
            strip += [color]
        strips += strip
    return strips

def to_lines(image, width):
    """
    Convert a tiled quaternary pixel map to lines of quaternary pixels.
    """
    tile_width = 8
    tile_height = 8
    num_columns = width / tile_width
    height = len(image) / width

    lines = []
    for cur_line in xrange(height):
        tile_row = cur_line / tile_height
        line = []
        for column in xrange(num_columns):
            anchor = (
                num_columns * tile_row * tile_width * tile_height +
                column * tile_width * tile_height +
                cur_line % tile_height * tile_width
            )
            line += image[anchor : anchor + tile_width]
        lines += [line]
    return lines


def dmg2rgb(word):
    """
    For PNGs.
    """
    def shift(value):
        while True:
            yield value & (2**5 - 1)
            value >>= 5
    word = shift(word)
    # distribution is less even w/ << 3
    red, green, blue = [int(color * 8.25) for color in [word.next() for _ in xrange(3)]]
    alpha = 255
    return (red, green, blue, alpha)


def rgb_to_dmg(color):
    """
    For PNGs.
    """
    word =  (color['r'] / 8)
    word += (color['g'] / 8) << 5
    word += (color['b'] / 8) << 10
    return word


def pal_to_png(filename):
    """
    Interpret a .pal file as a png palette.
    """
    with open(filename) as rgbs:
        colors = read_rgb_macros(rgbs.readlines())
    a = 255
    palette = []
    for color in colors:
        # even distribution over 000-255
        r, g, b = [int(hue * 8.25) for hue in color]
        palette += [(r, g, b, a)]
    white = (255,255,255,255)
    black = (000,000,000,255)
    if white not in palette and len(palette) < 4:
        palette = [white] + palette
    if black not in palette and len(palette) < 4:
        palette = palette + [black]
    return palette


def png_to_rgb(palette):
    """
    Convert a png palette to rgb macros.
    """
    output = ''
    for color in palette:
        r, g, b = [color[c] / 8 for c in 'rgb']
        output += '\tRGB ' + ', '.join(['%.2d' % hue for hue in (r, g, b)])
        output += '\n'
    return output


def read_filename_arguments(filename):
    """
    Infer graphics conversion arguments given a filename.

    Arguments are separated with '.'.
    """
    parsed_arguments = {}

    int_arguments = {
        'w': 'width',
        'h': 'height',
        't': 'tile_padding',
    }
    arguments = os.path.splitext(filename)[0].lstrip('.').split('.')[1:]
    for argument in arguments:

        # Check for integer arguments first (i.e. "w128").
        arg   = argument[0]
        param = argument[1:]
        if param.isdigit():
            arg = int_arguments.get(arg, False)
            if arg:
                parsed_arguments[arg] = int(param)

        elif argument == 'arrange':
            parsed_arguments['norepeat'] = True
            parsed_arguments['tilemap']  = True

        # Pic dimensions (i.e. "6x6").
        elif 'x' in argument and any(map(str.isdigit, argument)):
            w, h = argument.split('x')
            if w.isdigit() and h.isdigit():
                parsed_arguments['pic_dimensions'] = (int(w), int(h))

        else:
            parsed_arguments[argument] = True

    return parsed_arguments


def export_2bpp_to_png(filein, fileout=None, pal_file=None, height=0, width=0, tile_padding=0, pic_dimensions=None, **kwargs):

    if fileout == None:
        fileout = os.path.splitext(filein)[0] + '.png'

    image = open(filein, 'rb').read()

    arguments = {
        'width': width,
        'height': height,
        'pal_file': pal_file,
        'tile_padding': tile_padding,
        'pic_dimensions': pic_dimensions,
    }
    arguments.update(read_filename_arguments(filein))

    if pal_file == None:
        if os.path.exists(os.path.splitext(fileout)[0]+'.pal'):
            arguments['pal_file'] = os.path.splitext(fileout)[0]+'.pal'

    result = convert_2bpp_to_png(image, **arguments)
    width, height, palette, greyscale, bitdepth, px_map = result

    w = png.Writer(
        width,
        height,
        palette=palette,
        compression=9,
        greyscale=greyscale,
        bitdepth=bitdepth
    )
    with open(fileout, 'wb') as f:
        w.write(f, px_map)


def convert_2bpp_to_png(image, **kwargs):
    """
    Convert a planar 2bpp graphic to png.
    """

    image = bytearray(image)

    pad_color = bytearray([0])

    width          = kwargs.get('width', 0)
    height         = kwargs.get('height', 0)
    tile_padding   = kwargs.get('tile_padding', 0)
    pic_dimensions = kwargs.get('pic_dimensions', None)
    pal_file       = kwargs.get('pal_file', None)
    interleave     = kwargs.get('interleave', False)

    # Width must be specified to interleave.
    if interleave and width:
        image = interleave_tiles(image, width / 8)

    # Pad the image by a given number of tiles if asked.
    image += pad_color * 0x10 * tile_padding

    # Some images are transposed in blocks.
    if pic_dimensions:
        w, h  = pic_dimensions
        if not width: width = w * 8

        pic_length = w * h * 0x10

        trailing = len(image) % pic_length

        pic = []
        for i in xrange(0, len(image) - trailing, pic_length):
            pic += transpose_tiles(image[i:i+pic_length], h)
        image = bytearray(pic) + image[len(image) - trailing:]

        # Pad out trailing lines.
        image += pad_color * 0x10 * ((w - (len(image) / 0x10) % h) % w)

    def px_length(img):
        return len(img) * 4
    def tile_length(img):
        return len(img) * 4 / (8*8)

    if width and height:
        tile_width = width / 8
        more_tile_padding = (tile_width - (tile_length(image) % tile_width or tile_width))
        image += pad_color * 0x10 * more_tile_padding

    elif width and not height:
        tile_width = width / 8
        more_tile_padding = (tile_width - (tile_length(image) % tile_width or tile_width))
        image += pad_color * 0x10 * more_tile_padding
        height = px_length(image) / width

    elif height and not width:
        tile_height = height / 8
        more_tile_padding = (tile_height - (tile_length(image) % tile_height or tile_height))
        image += pad_color * 0x10 * more_tile_padding
        width = px_length(image) / height

    # at least one dimension should be given
    if width * height != px_length(image):
        # look for possible combos of width/height that would form a rectangle
        matches = []
        # Height need not be divisible by 8, but width must.
        # See pokered gfx/minimize_pic.1bpp.
        for w in range(8, px_length(image) / 2 + 1, 8):
            h = px_length(image) / w
            if w * h == px_length(image):
                matches += [(w, h)]
        # go for the most square image
        if len(matches):
            width, height = sorted(matches, key= lambda (w, h): (h % 8 != 0, w + h))[0] # favor height
        else:
            raise Exception, 'Image can\'t be divided into tiles (%d px)!' % (px_length(image))

    # convert tiles to lines
    lines = to_lines(flatten(image), width)

    if pal_file == None:
        palette   = None
        greyscale = True
        bitdepth  = 2
        px_map    = [[3 - pixel for pixel in line] for line in lines]

    else: # gbc color
        palette   = pal_to_png(pal_file)
        greyscale = False
        bitdepth  = 8
        px_map    = [[pixel for pixel in line] for line in lines]

    return width, height, palette, greyscale, bitdepth, px_map


def get_pic_animation(tmap, w, h):
    """
    Generate pic animation data from a combined tilemap of each frame.
    """
    frame_text = ''
    bitmask_text = ''

    frames = list(split(tmap, w * h))
    base = frames.pop(0)
    bitmasks = []

    for i in xrange(len(frames)):
        frame_text += '\tdw .frame{}\n'.format(i + 1)

    for i, frame in enumerate(frames):
        bitmask = map(operator.ne, frame, base)
        if bitmask not in bitmasks:
            bitmasks.append(bitmask)
        which_bitmask = bitmasks.index(bitmask)

        mask = iter(bitmask)
        masked_frame = filter(lambda _: mask.next(), frame)

        frame_text += '.frame{}\n'.format(i + 1)
        frame_text += '\tdb ${:02x} ; bitmask\n'.format(which_bitmask)
        if masked_frame:
            frame_text += '\tdb {}\n'.format(', '.join(
                map('${:02x}'.format, masked_frame)
            ))

    for i, bitmask in enumerate(bitmasks):
        bitmask_text += '; {}\n'.format(i)
        for byte in split(bitmask, 8):
            byte = int(''.join(map(int.__repr__, reversed(byte))), 2)
            bitmask_text += '\tdb %{:08b}\n'.format(byte)

    return frame_text, bitmask_text


def export_png_to_2bpp(filein, fileout=None, palout=None, **kwargs):

    arguments = {
        'tile_padding': 0,
        'pic_dimensions': None,
        'animate': False,
        'stupid_bitmask_hack': [],
    }
    arguments.update(kwargs)
    arguments.update(read_filename_arguments(filein))

    image, arguments = png_to_2bpp(filein, **arguments)

    if fileout == None:
        fileout = os.path.splitext(filein)[0] + '.2bpp'
    to_file(fileout, image)

    tmap = arguments.get('tmap')

    if tmap != None and arguments['animate'] and arguments['pic_dimensions']:
        # Generate pic animation data.
        frame_text, bitmask_text = get_pic_animation(tmap, *arguments['pic_dimensions'])

        frames_path = os.path.join(os.path.split(fileout)[0], 'frames.asm')
        with open(frames_path, 'w') as out:
            out.write(frame_text)

        bitmask_path = os.path.join(os.path.split(fileout)[0], 'bitmask.asm')

        # The following Pokemon have a bitmask dummied out.
        for exception in arguments['stupid_bitmask_hack']:
           if exception in bitmask_path:
                bitmasks = bitmask_text.split(';')
                bitmasks[-1] = bitmasks[-1].replace('1', '0')
                bitmask_text = ';'.join(bitmasks)

        with open(bitmask_path, 'w') as out:
            out.write(bitmask_text)

    elif tmap != None and arguments.get('tilemap', False):
        tilemap_path = os.path.splitext(fileout)[0] + '.tilemap'
        to_file(tilemap_path, tmap)

    palette = arguments.get('palette')
    if palout == None:
        palout = os.path.splitext(fileout)[0] + '.pal'
    export_palette(palette, palout)


def get_image_padding(width, height, wstep=8, hstep=8):

    padding = {
        'left':   0,
        'right':  0,
        'top':    0,
        'bottom': 0,
    }

    if width % wstep and width >= wstep:
       pad = float(width % wstep) / 2
       padding['left']   = int(ceil(pad))
       padding['right']  = int(floor(pad))

    if height % hstep and height >= hstep:
       pad = float(height % hstep) / 2
       padding['top']    = int(ceil(pad))
       padding['bottom'] = int(floor(pad))

    return padding


def png_to_2bpp(filein, **kwargs):
    """
    Convert a png image to planar 2bpp.
    """

    arguments = {
        'tile_padding': 0,
        'pic_dimensions': False,
        'interleave': False,
        'norepeat': False,
        'tilemap': False,
    }
    arguments.update(kwargs)

    if type(filein) is str:
        filein = open(filein)

    assert type(filein) is file

    width, height, rgba, info = png.Reader(filein).asRGBA8()

    # png.Reader returns flat pixel data. Nested is easier to work with
    len_px  = len('rgba')
    image   = []
    palette = []
    for line in rgba:
        newline = []
        for px in xrange(0, len(line), len_px):
            color = dict(zip('rgba', line[px:px+len_px]))
            if color not in palette:
                if len(palette) < 4:
                    palette += [color]
                else:
                    # TODO Find the nearest match
                    print 'WARNING: %s: Color %s truncated to' % (filein, color),
                    color = sorted(palette, key=lambda x: sum(x.values()))[0]
                    print color
            newline += [color]
        image += [newline]

    assert len(palette) <= 4, '%s: palette should be 4 colors, is really %d (%s)' % (filein, len(palette), palette)

    # Pad out smaller palettes with greyscale colors
    greyscale = {
        'black': { 'r': 0x00, 'g': 0x00, 'b': 0x00, 'a': 0xff },
        'grey':  { 'r': 0x55, 'g': 0x55, 'b': 0x55, 'a': 0xff },
        'gray':  { 'r': 0xaa, 'g': 0xaa, 'b': 0xaa, 'a': 0xff },
        'white': { 'r': 0xff, 'g': 0xff, 'b': 0xff, 'a': 0xff },
    }
    preference = 'white', 'black', 'grey', 'gray'
    for hue in map(greyscale.get, preference):
        if len(palette) >= 4:
            break
        if hue not in palette:
            palette += [hue]

    palette.sort(key=lambda x: sum(x.values()))

    # Game Boy palette order
    palette.reverse()

    # Map pixels to quaternary color ids
    padding = get_image_padding(width, height)
    width += padding['left'] + padding['right']
    height += padding['top'] + padding['bottom']
    pad = bytearray([0])

    qmap = []
    qmap += pad * width * padding['top']
    for line in image:
        qmap += pad * padding['left']
        for color in line:
            qmap += [palette.index(color)]
        qmap += pad * padding['right']
    qmap += pad * width * padding['bottom']

    # Graphics are stored in tiles instead of lines
    tile_width  = 8
    tile_height = 8
    num_columns = max(width, tile_width) / tile_width
    num_rows = max(height, tile_height) / tile_height
    image = []

    for row in xrange(num_rows):
        for column in xrange(num_columns):

            # Split it up into strips to convert to planar data
            for strip in xrange(min(tile_height, height)):
                anchor = (
                    row * num_columns * tile_width * tile_height +
                    column * tile_width +
                    strip * width
                )
                line = qmap[anchor : anchor + tile_width]
                bottom, top = 0, 0
                for bit, quad in enumerate(line):
                    bottom += (quad & 1) << (7 - bit)
                    top += (quad /2 & 1) << (7 - bit)
                image += [bottom, top]

    dim = arguments['pic_dimensions']
    if dim:
        if type(dim) in (tuple, list):
            w, h = dim
        else:
            # infer dimensions based on width.
            w = width / tile_width
            h = height / tile_height
            if h % w == 0:
                h = w

        tiles = get_tiles(image)
        pic_length = w * h
        tile_width = width / 8
        trailing = len(tiles) % pic_length
        new_image = []
        for block in xrange(len(tiles) / pic_length):
            offset = (h * tile_width) * ((block * w) / tile_width) + ((block * w) % tile_width)
            pic = []
            for row in xrange(h):
                index = offset + (row * tile_width)
                pic += tiles[index:index + w]
            new_image += transpose(pic, w)
        new_image += tiles[len(tiles) - trailing:]
        image = connect(new_image)

    # Remove any tile padding used to make the png rectangular.
    image = image[:len(image) - arguments['tile_padding'] * 0x10]

    tmap = None

    if arguments['interleave']:
        image = deinterleave_tiles(image, num_columns)

    if arguments['pic_dimensions']:
        image, tmap = condense_image_to_map(image, w * h)
    elif arguments['norepeat']:
        image, tmap = condense_image_to_map(image)
        if not arguments['tilemap']:
            tmap = None

    arguments.update({ 'palette': palette, 'tmap': tmap, })

    return image, arguments


def export_palette(palette, filename):
    """
    Export a palette from png to rgb macros in a .pal file.
    """

    if os.path.exists(filename):

        # Pic palettes are 2 colors (black/white are added later).
        with open(filename) as rgbs:
            colors = read_rgb_macros(rgbs.readlines())

        if len(colors) == 2:
            palette = palette[1:3]

        text = png_to_rgb(palette)
        with open(filename, 'w') as out:
            out.write(text)


def png_to_lz(filein):

    name = os.path.splitext(filein)[0]

    export_png_to_2bpp(filein)
    image = open(name+'.2bpp', 'rb').read()
    to_file(name+'.2bpp'+'.lz', Compressed(image).output)


def convert_2bpp_to_1bpp(data):
    """
    Convert planar 2bpp image data to 1bpp. Assume images are two colors.
    """
    return data[::2]

def convert_1bpp_to_2bpp(data):
    """
    Convert 1bpp image data to planar 2bpp (black/white).
    """
    output = []
    for i in data:
        output += [i, i]
    return output


def export_2bpp_to_1bpp(filename):
    name, extension = os.path.splitext(filename)
    image = open(filename, 'rb').read()
    image = convert_2bpp_to_1bpp(image)
    to_file(name + '.1bpp', image)

def export_1bpp_to_2bpp(filename):
    name, extension = os.path.splitext(filename)
    image = open(filename, 'rb').read()
    image = convert_1bpp_to_2bpp(image)
    to_file(name + '.2bpp', image)


def export_1bpp_to_png(filename, fileout=None):

    if fileout == None:
        fileout = os.path.splitext(filename)[0] + '.png'

    arguments = read_filename_arguments(filename)

    image = open(filename, 'rb').read()
    image = convert_1bpp_to_2bpp(image)

    result = convert_2bpp_to_png(image, **arguments)
    width, height, palette, greyscale, bitdepth, px_map = result

    w = png.Writer(width, height, palette=palette, compression=9, greyscale=greyscale, bitdepth=bitdepth)
    with open(fileout, 'wb') as f:
        w.write(f, px_map)


def export_png_to_1bpp(filename, fileout=None):

    if fileout == None:
        fileout = os.path.splitext(filename)[0] + '.1bpp'

    arguments = read_filename_arguments(filename)
    image = png_to_1bpp(filename, **arguments)

    to_file(fileout, image)

def png_to_1bpp(filename, **kwargs):
    image, kwargs = png_to_2bpp(filename, **kwargs)
    return convert_2bpp_to_1bpp(image)


def convert_to_2bpp(filenames=[]):
    for filename in filenames:
        filename, name, extension = try_decompress(filename)
        if extension == '.1bpp':
            export_1bpp_to_2bpp(filename)
        elif extension == '.2bpp':
            pass
        elif extension == '.png':
            export_png_to_2bpp(filename)
        else:
            raise Exception, "Don't know how to convert {} to 2bpp!".format(filename)

def convert_to_1bpp(filenames=[]):
    for filename in filenames:
        filename, name, extension = try_decompress(filename)
        if extension == '.1bpp':
            pass
        elif extension == '.2bpp':
            export_2bpp_to_1bpp(filename)
        elif extension == '.png':
            export_png_to_1bpp(filename)
        else:
            raise Exception, "Don't know how to convert {} to 1bpp!".format(filename)

def convert_to_png(filenames=[]):
    for filename in filenames:
        filename, name, extension = try_decompress(filename)
        if extension == '.1bpp':
            export_1bpp_to_png(filename)
        elif extension == '.2bpp':
            export_2bpp_to_png(filename)
        elif extension == '.png':
            pass
        else:
            raise Exception, "Don't know how to convert {} to png!".format(filename)

def compress(filenames=[]):
    for filename in filenames:
        data = open(filename, 'rb').read()
        lz_data = Compressed(data).output
        to_file(filename + '.lz', lz_data)

def decompress(filenames=[]):
    for filename in filenames:
        name, extension = os.path.splitext(filename)
        lz_data = open(filename, 'rb').read()
        data = Decompressed(lz_data).output
        to_file(name, data)

def try_decompress(filename):
    """
    Try to decompress a graphic when determining the filetype.
    This skips the manual unlz step when attempting
    to convert lz-compressed graphics to png.
    """
    name, extension = os.path.splitext(filename)
    if extension == '.lz':
        decompress([filename])
        filename = name
        name, extension = os.path.splitext(filename)
    return filename, name, extension


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('mode')
    ap.add_argument('filenames', nargs='*')
    args = ap.parse_args()

    method = {
        '2bpp': convert_to_2bpp,
        '1bpp': convert_to_1bpp,
        'png':  convert_to_png,
        'lz':   compress,
        'unlz': decompress,
    }.get(args.mode, None)

    if method == None:
        raise Exception, "Unknown conversion method!"

    method(args.filenames)

if __name__ == "__main__":
    main()
