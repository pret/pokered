# -*- coding: utf-8 -*-
"""
Pokemon Crystal data de/compression.
"""

"""
A rundown of Pokemon Crystal's compression scheme:

Control commands occupy bits 5-7.
Bits 0-4 serve as the first parameter <n> for each command.
"""
lz_commands = {
    'literal':   0, # n values for n bytes
    'iterate':   1, # one value for n bytes
    'alternate': 2, # alternate two values for n bytes
    'blank':     3, # zero for n bytes
}

"""
Repeater commands repeat any data that was just decompressed.
They take an additional signed parameter <s> to mark a relative starting point.
These wrap around (positive from the start, negative from the current position).
"""
lz_commands.update({
    'repeat':    4, # n bytes starting from s
    'flip':      5, # n bytes in reverse bit order starting from s
    'reverse':   6, # n bytes backwards starting from s
})

"""
The long command is used when 5 bits aren't enough. Bits 2-4 contain a new control code.
Bits 0-1 are appended to a new byte as 8-9, allowing a 10-bit parameter.
"""
lz_commands.update({
    'long':      7, # n is now 10 bits for a new control code
})
max_length = 1 << 10 # can't go higher than 10 bits
lowmax     = 1 <<  5 # standard 5-bit param

"""
If 0xff is encountered instead of a command, decompression ends.
"""
lz_end = 0xff


bit_flipped = [
    sum(((byte >> i) & 1) << (7 - i) for i in xrange(8))
    for byte in xrange(0x100)
]


class Compressed:

    """
    Usage:
        lz = Compressed(data).output
    or
        lz = Compressed().compress(data)
    or
        c = Compressed()
        c.data = data
        lz = c.compress()

    There are some issues with reproducing the target compressor.
    Some notes are listed here:
        - the criteria for detecting a lookback is inconsistent
            - sometimes lookbacks that are mostly 0s are pruned, sometimes not
        - target appears to skip ahead if it can use a lookback soon, stopping the current command short or in some cases truncating it with literals.
            - this has been implemented, but the specifics are unknown
        - self.min_scores: It's unknown if blank's minimum score should be 1 or 2. Most likely it's 1, with some other hack to account for edge cases.
            - may be related to the above
        - target does not appear to compress backwards
    """

    def __init__(self, *args, **kwargs):

        self.min_scores = {
            'blank':     1,
            'iterate':   2,
            'alternate': 3,
            'repeat':    3,
            'reverse':   3,
            'flip':      3,
        }

        self.preference = [
            'repeat',
            'blank',
            'flip',
            'reverse',
            'iterate',
            'alternate',
            #'literal',
        ]

        self.lookback_methods = 'repeat', 'reverse', 'flip'

        self.__dict__.update({
            'data': None,
            'commands': lz_commands,
            'debug': False,
            'literal_only': False,
        })

        self.arg_names = 'data', 'commands', 'debug', 'literal_only'

        self.__dict__.update(kwargs)
        self.__dict__.update(dict(zip(self.arg_names, args)))

        if self.data is not None:
            self.compress()

    def compress(self, data=None):
        if data is not None:
            self.data = data

        self.data = list(bytearray(self.data))

        self.indexes = {}
        self.lookbacks = {}
        for method in self.lookback_methods:
            self.lookbacks[method] = {}

        self.address = 0
        self.end     = len(self.data)
        self.output  = []
        self.literal = None

        while self.address < self.end:

            if self.score():
                self.do_literal()
                self.do_winner()

            else:
                if self.literal == None:
                    self.literal = self.address
                self.address += 1

        self.do_literal()

        self.output += [lz_end]
        return self.output

    def reset_scores(self):
        self.scores = {}
        self.offsets = {}
        self.helpers = {}
        for method in self.min_scores.iterkeys():
            self.scores[method] = 0

    def bit_flip(self, byte):
        return bit_flipped[byte]

    def do_literal(self):
        if self.literal != None:
            length = abs(self.address - self.literal)
            start  = min(self.literal, self.address + 1)
            self.helpers['literal'] = self.data[start:start+length]
            self.do_cmd('literal', length)
            self.literal = None

    def score(self):
        self.reset_scores()

        map(self.score_literal, ['iterate', 'alternate', 'blank'])

        for method in self.lookback_methods:
            self.scores[method], self.offsets[method] = self.find_lookback(method, self.address)

        self.stop_short()

        return any(
            score
          > self.min_scores[method] + int(score > lowmax)
            for method, score in self.scores.iteritems()
        )

    def stop_short(self):
        """
        If a lookback is close, reduce the scores of other commands.
        """
        best_method, best_score = max(
            self.scores.items(),
            key = lambda x: (
                x[1],
                -self.preference.index(x[0])
            )
        )
        for method in self.lookback_methods:
            min_score = self.min_scores[method]
            for address in xrange(self.address+1, self.address+best_score):
                length, index = self.find_lookback(method, address)
                if length > max(min_score, best_score):
                    # BUG: lookbacks can reduce themselves. This appears to be a bug in the target also.
                    for m, score in self.scores.items():
                        self.scores[m] = min(score, address - self.address)


    def read(self, address=None):
        if address is None:
            address = self.address
        if 0 <= address < len(self.data):
            return self.data[address]
        return None

    def find_all_lookbacks(self):
        for method in self.lookback_methods:
            for address, byte in enumerate(self.data):
                self.find_lookback(method, address)

    def find_lookback(self, method, address=None):
        """Temporarily stubbed, because the real function doesn't run in polynomial time."""
	return 0, None

    def broken_find_lookback(self, method, address=None):
        if address is None:
            address = self.address

        existing = self.lookbacks.get(method, {}).get(address)
        if existing != None:
            return existing

        lookback = 0, None

        # Better to not carelessly optimize at the moment.
        """
        if address < 2:
            return lookback
        """

        byte = self.read(address)
        if byte is None:
            return lookback

        direction, mutate = {
            'repeat':  ( 1, int),
            'reverse': (-1, int),
            'flip':    ( 1, self.bit_flip),
        }[method]

        # Doesn't seem to help
        """
        if mutate == self.bit_flip:
            if byte == 0:
                self.lookbacks[method][address] = lookback
                return lookback
        """

        data_len = len(self.data)
        is_two_byte_index = lambda index: int(index < address - 0x7f)

        for index in self.get_indexes(mutate(byte)):

            if index >= address:
                break

            old_length, old_index = lookback
            if direction == 1:
                if old_length > data_len - index: break
            else:
                if old_length > index: continue

            if self.read(index) in [None]: continue

            length = 1 # we know there's at least one match, or we wouldn't be checking this index
            while 1:
                this_byte = self.read(address + length)
                that_byte = self.read(index + length * direction)
                if that_byte == None or this_byte != mutate(that_byte):
                    break
                length += 1

            score = length - is_two_byte_index(index)
            old_score = old_length - is_two_byte_index(old_index)
            if score >= old_score or (score == old_score and length > old_length):
                # XXX maybe avoid two-byte indexes when possible
                if score >= lookback[0] - is_two_byte_index(lookback[1]):
                    lookback = length, index

        self.lookbacks[method][address] = lookback
        return lookback

    def get_indexes(self, byte):
        if not self.indexes.has_key(byte):
            self.indexes[byte] = []
            index = -1
            while 1:
                try:
                    index = self.data.index(byte, index + 1)
                except ValueError:
                    break
                self.indexes[byte].append(index)
        return self.indexes[byte]

    def score_literal(self, method):
        address = self.address

        compare = {
            'blank': [0],
            'iterate': [self.read(address)],
            'alternate': [self.read(address), self.read(address + 1)],
        }[method]

        # XXX may or may not be correct
        if method == 'alternate' and compare[0] == 0:
            return

        length = 0
        while self.read(address + length) == compare[length % len(compare)]:
            length += 1

        self.scores[method] = length
        self.helpers[method] = compare

    def do_winner(self):
        winners = filter(
            lambda (method, score):
                score
              > self.min_scores[method] + int(score > lowmax),
            self.scores.iteritems()
        )
        winners.sort(
            key = lambda (method, score): (
                -(score - self.min_scores[method] - int(score > lowmax)),
                self.preference.index(method)
            )
        )
        winner, score = winners[0]

        length = min(score, max_length)
        self.do_cmd(winner, length)
        self.address += length

    def do_cmd(self, cmd, length):
        start_address = self.address

        cmd_length = length - 1

        output = []

        if length > lowmax:
            output.append(
                (self.commands['long'] << 5)
              + (self.commands[cmd] << 2)
              + (cmd_length >> 8)
            )
            output.append(
                cmd_length & 0xff
            )
        else:
            output.append(
                (self.commands[cmd] << 5)
              + cmd_length
            )

        self.helpers['blank'] = [] # quick hack
        output += self.helpers.get(cmd, [])

        if cmd in self.lookback_methods:
            offset = self.offsets[cmd]
            # Negative offsets are one byte.
            # Positive offsets are two.
            if 0 < start_address - offset - 1 <= 0x7f:
                offset = (start_address - offset - 1) | 0x80
                output += [offset]
            else:
                output += [offset / 0x100, offset % 0x100] # big endian

        if self.debug:
            print ' '.join(map(str, [
                  cmd, length, '\t',
                  ' '.join(map('{:02x}'.format, output)),
                  self.data[start_address:start_address+length] if cmd in self.lookback_methods else '',
            ]))

        self.output += output



class Decompressed:
    """
    Interpret and decompress lz-compressed data, usually 2bpp.
    """

    """
    Usage:
        data = Decompressed(lz).output
    or
        data = Decompressed().decompress(lz)
    or
        d = Decompressed()
        d.lz = lz
        data = d.decompress()

    To decompress from offset 0x80000 in a rom:
        data = Decompressed(rom, start=0x80000).output
    """

    lz = None
    start = 0
    commands = lz_commands
    debug = False

    arg_names = 'lz', 'start', 'commands', 'debug'

    def __init__(self, *args, **kwargs):
        self.__dict__.update(dict(zip(self.arg_names, args)))
        self.__dict__.update(kwargs)

        self.command_names = dict(map(reversed, self.commands.items()))
        self.address = self.start

        if self.lz is not None:
            self.decompress()

        if self.debug: print self.command_list()


    def command_list(self):
        """
        Print a list of commands that were used. Useful for debugging.
        """

        text = ''

        output_address = 0
        for name, attrs in self.used_commands:
            length     = attrs['length']
            address    = attrs['address']
            offset     = attrs['offset']
            direction  = attrs['direction']

            text += '{2:03x} {0}: {1}'.format(name, length, output_address)
            text += '\t' + ' '.join(
                '{:02x}'.format(int(byte))
                for byte in self.lz[ address : address + attrs['cmd_length'] ]
            )

            if offset is not None:
                repeated_data = self.output[ offset : offset + length * direction : direction ]
                if name == 'flip':
                    repeated_data = map(bit_flipped.__getitem__, repeated_data)
                text += ' [' + ' '.join(map('{:02x}'.format, repeated_data)) + ']'

            text += '\n'
            output_address += length

        return text


    def decompress(self, lz=None):

        if lz is not None:
            self.lz = lz

        self.lz = bytearray(self.lz)

        self.used_commands = []
        self.output = []

        while 1:

            cmd_address = self.address
            self.offset = None
            self.direction = None

            if (self.byte == lz_end):
                self.next()
                break

            self.cmd = (self.byte & 0b11100000) >> 5

            if self.cmd_name == 'long':
                # 10-bit length
                self.cmd = (self.byte & 0b00011100) >> 2
                self.length = (self.next() & 0b00000011) * 0x100
                self.length += self.next() + 1
            else:
                # 5-bit length
                self.length = (self.next() & 0b00011111) + 1

            self.__class__.__dict__[self.cmd_name](self)

            self.used_commands += [(
                self.cmd_name,
                {
                    'length':     self.length,
                    'address':    cmd_address,
                    'offset':     self.offset,
                    'cmd_length': self.address - cmd_address,
                    'direction':  self.direction,
                }
            )]

        # Keep track of the data we just decompressed.
        self.compressed_data = self.lz[self.start : self.address]


    @property
    def byte(self):
        return self.lz[ self.address ]

    def next(self):
        byte = self.byte
        self.address += 1
        return byte

    @property
    def cmd_name(self):
        return self.command_names.get(self.cmd)


    def get_offset(self):

        if self.byte >= 0x80: # negative
            # negative
            offset = self.next() & 0x7f
            offset = len(self.output) - offset - 1
        else:
            # positive
            offset =  self.next() * 0x100
            offset += self.next()

        self.offset = offset


    def literal(self):
        """
        Copy data directly.
        """
        self.output  += self.lz[ self.address : self.address + self.length ]
        self.address += self.length

    def iterate(self):
        """
        Write one byte repeatedly.
        """
        self.output += [self.next()] * self.length

    def alternate(self):
        """
        Write alternating bytes.
        """
        alts = [self.next(), self.next()]
        self.output += [ alts[x & 1] for x in xrange(self.length) ]

    def blank(self):
        """
        Write zeros.
        """
        self.output += [0] * self.length

    def flip(self):
        """
        Repeat flipped bytes from output.

        Example: 11100100 -> 00100111
        """
        self._repeat(table=bit_flipped)

    def reverse(self):
        """
        Repeat reversed bytes from output.
        """
        self._repeat(direction=-1)

    def repeat(self):
        """
        Repeat bytes from output.
        """
        self._repeat()

    def _repeat(self, direction=1, table=None):
        self.get_offset()
        self.direction = direction
        # Note: appends must be one at a time (this way, repeats can draw from themselves if required)
        for i in xrange(self.length):
            byte = self.output[ self.offset + i * direction ]
            self.output.append( table[byte] if table else byte )
