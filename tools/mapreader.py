# -*- coding: utf-8 -*-

# A library for parsing the pokered.map file output by rgbds.

import re

class MapReader:

    # {'ROM Bank': { 0: { 'sections': [ { 'beg': 1234,
    #                                     'end': 5678,
    #                                     'name': 'Section001',
    #                                     'symbols': [ { 'symbol': 'Function1234',
    #                                                    'address: 1234,
    #                                                  },
    #                                                ]
    #                                   },
    #                                  ],
    #                     'used': 1234,
    #                     'slack': 4567,
    #                   },
    #               },
    #  'OAM': { 'sections': [ { 'beg': 1234,
    #                           'end': 5678,
    #                           'name': 'Section002',
    #                           'symbols': [ { 'symbol': 'Data1234',
    #                                          'address: 1234,
    #                                        },
    #                                      ]
    #                         },
    #                        ],
    #           'used': 1234,
    #           'slack': 4567,
    #         },
    # }
    #
    bank_data = {}

    bank_types = {
        'HRAM'     : { 'size': 0x80,   'banked': False, },
        'OAM'      : { 'size': 0xA0,   'banked': False, },
        'ROM0 bank': { 'size': 0x4000, 'banked': True,  },
        'ROMX bank': { 'size': 0x4000, 'banked': True,  },
        'SRAM bank': { 'size': 0x2000, 'banked': True,  },
        'VRAM bank': { 'size': 0x1000, 'banked': True,  },
        'WRAM bank': { 'size': 0x2000, 'banked': True,  },
    }

    # FSM states
    INIT, BANK, SECTION = range(3)

    # $506D-$519A ($012E bytes) ["Type Matchups"]
    section_header_regex = re.compile('\$([0-9A-Fa-f]{4})-\$([0-9A-Fa-f]{4}) \(.*\) \["(.*)"\]')
    # $506D = TypeMatchups
    section_data_regex = re.compile('\$([0-9A-Fa-f]{4}) = (.*)')
    # $3ED2 bytes
    slack_regex = re.compile('\$([0-9A-Fa-f]{4}) bytes?')

    def __init__(self, *args, **kwargs):
        self.__dict__.update(kwargs)

    def _parse_init(self, line):

        line = line.split(':', 1)[0]
        parts = line.split(' #', 1)

        if (parts[0] in self.bank_types):
            self._cur_bank_name = parts[0]
            self._cur_bank_type = self.bank_types[self._cur_bank_name]
            if (self._cur_bank_type['banked'] and len(parts) > 1):
                parts[1] = parts[1].split(':', 1)[0]
                parts[1] = parts[1].split(' ', 1)[0]
                self._cur_bank = int(parts[1], 10)
            if self._cur_bank_name not in self.bank_data:
                self.bank_data[self._cur_bank_name] = {}
            if self._cur_bank_type['banked']:
                if self._cur_bank not in self.bank_data[self._cur_bank_name]:
                    self.bank_data[self._cur_bank_name][self._cur_bank] = {}
                self._cur_data = self.bank_data[self._cur_bank_name][self._cur_bank]
            else:
                self._cur_data = self.bank_data[self._cur_bank_name]

            if ({} == self._cur_data):
                self._cur_data['sections'] = []
                self._cur_data['used'] = 0
                self._cur_data['slack'] = self._cur_bank_type['size']
            return True

        return False

    def _parse_section_header(self, header):

        section_data = self.section_header_regex.match(header)
        if section_data is not None:
            beg = int(section_data.group(1), 16)
            end = int(section_data.group(2), 16)
            name = section_data.group(3)
            self._cur_section = {'beg': beg, 'end': end, 'name': name, 'symbols': []}
            self._cur_data['sections'].append(self._cur_section)
            return True
        return False

    def _parse_slack(self, data):

        slack_data = self.slack_regex.match(data)
        slack_bytes = int(slack_data.group(1), 16)
        self._cur_data['slack'] = slack_bytes

        used_bytes = 0

        for s in self._cur_data['sections']:
            used_bytes += s['end'] - s['beg'] + 1

        self._cur_data['used'] = used_bytes

    def read_map_data(self, map):

        if type(map) is str:
            map = map.split('\n')

        self._state = MapReader.INIT
        self._cur_bank_name = ''
        self._cur_bank_type = {}
        self._cur_bank = 0
        self._cur_data = {}

        for line in map:

            line = line.rstrip()
            if (MapReader.INIT == self._state):

                if (self._parse_init(line)):
                    self._state = MapReader.BANK

            elif (MapReader.BANK == self._state or MapReader.SECTION == self._state):

                if ('' == line):
                    self._state = MapReader.INIT
                else:

                    line = line.lstrip()
                    parts = line.split(': ', 1)

                    if (MapReader.SECTION == self._state):
                        section_data = self.section_data_regex.match(parts[0])
                        if section_data is not None:
                            address = int(section_data.group(1), 16)
                            name = section_data.group(2)
                            self._cur_section['symbols'].append({'name': name, 'address': address})
                            continue

                    if ('SECTION' == parts[0]):
                        if (self._parse_section_header(parts[1])):
                            self._state = MapReader.SECTION
                    elif ('SLACK' == parts[0]):
                        self._parse_slack(parts[1])
                        self._state = MapReader.INIT
                    elif ('EMPTY' == parts[0]):
                        self._cur_data = {'sections': [], 'used': 0, 'slack': self._cur_bank_type['size']}
                        self._state = MapReader.INIT

            else:
                pass

        for k, v in self.bank_data.items():
            if (self.bank_types[k]['banked']):
                for _, vv in v.items():
                    vv['sections'].sort(key=lambda x: x['beg'])
                    for vvv in vv['sections']:
                        vvv['symbols'].sort(key=lambda x: x['address'])
            else:
                v['sections'].sort(key=lambda x: x['beg'])
                for vv in v['sections']:
                        vv['symbols'].sort(key=lambda x: x['address'])
