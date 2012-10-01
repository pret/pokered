#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-09
import extract_maps
import os
import json
from copy import copy, deepcopy
from pretty_map_headers import random_hash, map_name_cleaner
from ctypes import c_int8
import sys
spacing = "	"

temp_opt_table = [
  [ "ADC A", 0x8f, 0 ],
  [ "ADC B", 0x88, 0 ],
  [ "ADC C", 0x89, 0 ],
  [ "ADC D", 0x8a, 0 ],
  [ "ADC E", 0x8b, 0 ],
  [ "ADC H", 0x8c, 0 ],
  [ "ADC [HL]", 0x8e, 0 ],
  [ "ADC L", 0x8d, 0 ],
  [ "ADC x", 0xce, 1 ],
  [ "ADD A", 0x87, 0 ],
  [ "ADD B", 0x80, 0 ],
  [ "ADD C", 0x81, 0 ],
  [ "ADD D", 0x82, 0 ],
  [ "ADD E", 0x83, 0 ],
  [ "ADD H", 0x84, 0 ],
  [ "ADD [HL]", 0x86, 0 ],
  [ "ADD HL, BC", 0x9, 0 ],
  [ "ADD HL, DE", 0x19, 0 ],
  [ "ADD HL, HL", 0x29, 0 ],
  [ "ADD HL, SP", 0x39, 0 ],
  [ "ADD L", 0x85, 0 ],
  [ "ADD SP, x", 0xe8, 1 ],
  [ "ADD x", 0xc6, 1 ],
  [ "AND A", 0xa7, 0 ],
  [ "AND B", 0xa0, 0 ],
  [ "AND C", 0xa1, 0 ],
  [ "AND D", 0xa2, 0 ],
  [ "AND E", 0xa3, 0 ],
  [ "AND H", 0xa4, 0 ],
  [ "AND [HL]", 0xa6, 0 ],
  [ "AND L", 0xa5, 0 ],
  [ "AND x", 0xe6, 1 ],
  [ "BIT 0, A", 0x47cb, 3 ],
  [ "BIT 0, B", 0x40cb, 3 ],
  [ "BIT 0, C", 0x41cb, 3 ],
  [ "BIT 0, D", 0x42cb, 3 ],
  [ "BIT 0, E", 0x43cb, 3 ],
  [ "BIT 0, H", 0x44cb, 3 ],
  [ "BIT 0, [HL]", 0x46cb, 3 ],
  [ "BIT 0, L", 0x45cb, 3 ],
  [ "BIT 1, A", 0x4fcb, 3 ],
  [ "BIT 1, B", 0x48cb, 3 ],
  [ "BIT 1, C", 0x49cb, 3 ],
  [ "BIT 1, D", 0x4acb, 3 ],
  [ "BIT 1, E", 0x4bcb, 3 ],
  [ "BIT 1, H", 0x4ccb, 3 ],
  [ "BIT 1, [HL]", 0x4ecb, 3 ],
  [ "BIT 1, L", 0x4dcb, 3 ],
  [ "BIT 2, A", 0x57cb, 3 ],
  [ "BIT 2, B", 0x50cb, 3 ],
  [ "BIT 2, C", 0x51cb, 3 ],
  [ "BIT 2, D", 0x52cb, 3 ],
  [ "BIT 2, E", 0x53cb, 3 ],
  [ "BIT 2, H", 0x54cb, 3 ],
  [ "BIT 2, [HL]", 0x56cb, 3 ],
  [ "BIT 2, L", 0x55cb, 3 ],
  [ "BIT 3, A", 0x5fcb, 3 ],
  [ "BIT 3, B", 0x58cb, 3 ],
  [ "BIT 3, C", 0x59cb, 3 ],
  [ "BIT 3, D", 0x5acb, 3 ],
  [ "BIT 3, E", 0x5bcb, 3 ],
  [ "BIT 3, H", 0x5ccb, 3 ],
  [ "BIT 3, [HL]", 0x5ecb, 3 ],
  [ "BIT 3, L", 0x5dcb, 3 ],
  [ "BIT 4, A", 0x67cb, 3 ],
  [ "BIT 4, B", 0x60cb, 3 ],
  [ "BIT 4, C", 0x61cb, 3 ],
  [ "BIT 4, D", 0x62cb, 3 ],
  [ "BIT 4, E", 0x63cb, 3 ],
  [ "BIT 4, H", 0x64cb, 3 ],
  [ "BIT 4, [HL]", 0x66cb, 3 ],
  [ "BIT 4, L", 0x65cb, 3 ],
  [ "BIT 5, A", 0x6fcb, 3 ],
  [ "BIT 5, B", 0x68cb, 3 ],
  [ "BIT 5, C", 0x69cb, 3 ],
  [ "BIT 5, D", 0x6acb, 3 ],
  [ "BIT 5, E", 0x6bcb, 3 ],
  [ "BIT 5, H", 0x6ccb, 3 ],
  [ "BIT 5, [HL]", 0x6ecb, 3 ],
  [ "BIT 5, L", 0x6dcb, 3 ],
  [ "BIT 6, A", 0x77cb, 3 ],
  [ "BIT 6, B", 0x70cb, 3 ],
  [ "BIT 6, C", 0x71cb, 3 ],
  [ "BIT 6, D", 0x72cb, 3 ],
  [ "BIT 6, E", 0x73cb, 3 ],
  [ "BIT 6, H", 0x74cb, 3 ],
  [ "BIT 6, [HL]", 0x76cb, 3 ],
  [ "BIT 6, L", 0x75cb, 3 ],
  [ "BIT 7, A", 0x7fcb, 3 ],
  [ "BIT 7, B", 0x78cb, 3 ],
  [ "BIT 7, C", 0x79cb, 3 ],
  [ "BIT 7, D", 0x7acb, 3 ],
  [ "BIT 7, E", 0x7bcb, 3 ],
  [ "BIT 7, H", 0x7ccb, 3 ],
  [ "BIT 7, [HL]", 0x7ecb, 3 ],
  [ "BIT 7, L", 0x7dcb, 3 ],
  [ "CALL C, ?", 0xdc, 2 ],
  [ "CALL NC, ?", 0xd4, 2 ],
  [ "CALL NZ, ?", 0xc4, 2 ],
  [ "CALL Z, ?", 0xcc, 2 ],
  [ "CALL ?", 0xcd, 2 ],
  [ "CCF", 0x3f, 0 ],
  [ "CP A", 0xbf, 0 ],
  [ "CP B", 0xb8, 0 ],
  [ "CP C", 0xb9, 0 ],
  [ "CP D", 0xba, 0 ],
  [ "CP E", 0xbb, 0 ],
  [ "CP H", 0xbc, 0 ],
  [ "CP [HL]", 0xbe, 0 ],
  [ "CPL", 0x2f, 0 ],
  [ "CP L", 0xbd, 0 ],
  [ "CP x", 0xfe, 1 ],
  [ "DAA", 0x27, 0 ],
  [ "DEBUG", 0xed, 0 ],
  [ "DEC A", 0x3d, 0 ],
  [ "DEC B", 0x5, 0 ],
  [ "DEC BC", 0xb, 0 ],
  [ "DEC C", 0xd, 0 ],
  [ "DEC D", 0x15, 0 ],
  [ "DEC DE", 0x1b, 0 ],
  [ "DEC E", 0x1d, 0 ],
  [ "DEC H", 0x25, 0 ],
  [ "DEC HL", 0x2b, 0 ],
  [ "DEC [HL]", 0x35, 0 ],
  [ "DEC L", 0x2d, 0 ],
  [ "DEC SP", 0x3b, 0 ],
  [ "DI", 0xf3, 0 ],
  [ "EI", 0xfb, 0 ],
  [ "HALT", 0x76, 0 ],
  [ "INC A", 0x3c, 0 ],
  [ "INC B", 0x4, 0 ],
  [ "INC BC", 0x3, 0 ],
  [ "INC C", 0xc, 0 ],
  [ "INC D", 0x14, 0 ],
  [ "INC DE", 0x13, 0 ],
  [ "INC E", 0x1c, 0 ],
  [ "INC H", 0x24, 0 ],
  [ "INC HL", 0x23, 0 ],
  [ "INC [HL]", 0x34, 0 ],
  [ "INC L", 0x2c, 0 ],
  [ "INC SP", 0x33, 0 ],
  [ "JP C, ?", 0xda, 2 ],
  [ "JP HL", 0xe9, 0 ],
  [ "JP NC, ?", 0xd2, 2 ],
  [ "JP NZ, ?", 0xc2, 2 ],
  [ "JP Z, ?", 0xca, 2 ],
  [ "JP ?", 0xc3, 2 ],
  [ "JR C, x", 0x38, 1 ],
  [ "JR NC, x", 0x30, 1 ],
  [ "JR NZ, x", 0x20, 1 ],
  [ "JR Z, x", 0x28, 1 ],
  [ "JR x", 0x18, 1 ],
  [ "LD A, A", 0x7f, 0 ],
  [ "LD A, B", 0x78, 0 ],
  [ "LD A, C", 0x79, 0 ],
  [ "LD A, D", 0x7a, 0 ],
  [ "LD A, E", 0x7b, 0 ],
  [ "LD A, H", 0x7c, 0 ],
  [ "LD A, L", 0x7d, 0 ],
  [ "LD A, [$FF00+C]", 0xf2, 0 ],
  [ "LD A, [$FF00+x]", 0xf0, 1 ],
#  [ "LDH A, [x]", 0xf0, 1 ], #rgbds has trouble with this one?
  [ "LD A, [BC]", 0xa, 0 ],
  [ "LD A, [DE]", 0x1a, 0 ],
#  [ "LD A, [HL+]", 0x2a, 0 ],
#  [ "LD A, [HL-]", 0x3a, 0 ],
  [ "LD A, [HL]", 0x7e, 0 ],
  [ "LD A, [HLD]", 0x3a, 0 ],
  [ "LD A, [HLI]", 0x2a, 0 ],
  [ "LD A, [?]", 0xfa, 2 ],
  [ "LD A, x", 0x3e, 1 ],
  [ "LD B, A", 0x47, 0 ],
  [ "LD B, B", 0x40, 0 ],
  [ "LD B, C", 0x41, 0 ],
  [ "LD [BC], A", 0x2, 0 ],
  [ "LD B, D", 0x42, 0 ],
  [ "LD B, E", 0x43, 0 ],
  [ "LD B, H", 0x44, 0 ],
  [ "LD B, [HL]", 0x46, 0 ],
  [ "LD B, L", 0x45, 0 ],
  [ "LD B, x", 0x6, 1 ],
  [ "LD C, A", 0x4f, 0 ],
  [ "LD C, B", 0x48, 0 ],
  [ "LD C, C", 0x49, 0 ],
  [ "LD C, D", 0x4a, 0 ],
  [ "LD C, E", 0x4b, 0 ],
  [ "LD C, H", 0x4c, 0 ],
  [ "LD C, [HL]", 0x4e, 0 ],
  [ "LD C, L", 0x4d, 0 ],
  [ "LD C, x", 0xe, 1 ],
  [ "LD D, A", 0x57, 0 ],
#  [ "LDD A, [HL]", 0x3a, 0 ],
  [ "LD D, B", 0x50, 0 ],
  [ "LD D, C", 0x51, 0 ],
  [ "LD D, D", 0x52, 0 ],
  [ "LD D, E", 0x53, 0 ],
  [ "LD [DE], A", 0x12, 0 ],
  [ "LD D, H", 0x54, 0 ],
  [ "LD D, [HL]", 0x56, 0 ],
#  [ "LDD [HL], A", 0x32, 0 ],
  [ "LD D, L", 0x55, 0 ],
  [ "LD D, x", 0x16, 1 ],
  [ "LD E, A", 0x5f, 0 ],
  [ "LD E, B", 0x58, 0 ],
  [ "LD E, C", 0x59, 0 ],
  [ "LD E, D", 0x5a, 0 ],
  [ "LD E, E", 0x5b, 0 ],
  [ "LD E, H", 0x5c, 0 ],
  [ "LD E, [HL]", 0x5e, 0 ],
  [ "LD E, L", 0x5d, 0 ],
  [ "LD E, x", 0x1e, 1 ],
  [ "LD [$FF00+C], A", 0xe2, 0 ],
  [ "LD [$FF00+x], A", 0xe0, 1 ],
#  [ "LDH [x], A", 0xe0, 1 ],
  [ "LD H, A", 0x67, 0 ],
  [ "LD H, B", 0x60, 0 ],
  [ "LD H, C", 0x61, 0 ],
  [ "LD H, D", 0x62, 0 ],
  [ "LD H, E", 0x63, 0 ],
  [ "LD H, H", 0x64, 0 ],
  [ "LD H, [HL]", 0x66, 0 ],
  [ "LD H, L", 0x65, 0 ],
#  [ "LD [HL+], A", 0x22, 0 ],
#  [ "LD [HL-], A", 0x32, 0 ],
  [ "LD [HL], A", 0x77, 0 ],
  [ "LD [HL], B", 0x70, 0 ],
  [ "LD [HL], C", 0x71, 0 ],
  [ "LD [HL], D", 0x72, 0 ],
  [ "LD [HLD], A", 0x32, 0 ],
  [ "LD [HL], E", 0x73, 0 ],
  [ "LD [HL], H", 0x74, 0 ],
  [ "LD [HLI], A", 0x22, 0 ],
  [ "LD [HL], L", 0x75, 0 ],
  [ "LD HL, SP+x", 0xf8, 1 ],
  [ "LD [HL], x", 0x36, 1 ],
  [ "LD H, x", 0x26, 1 ],
#  [ "LDI A, [HL]", 0x2a, 0 ],
#  [ "LDI [HL], A", 0x22, 0 ],
  [ "LD L, A", 0x6f, 0 ],
  [ "LD L, B", 0x68, 0 ],
  [ "LD L, C", 0x69, 0 ],
  [ "LD L, D", 0x6a, 0 ],
  [ "LD L, E", 0x6b, 0 ],
  [ "LD L, H", 0x6c, 0 ],
  [ "LD L, [HL]", 0x6e, 0 ],
  [ "LD L, L", 0x6d, 0 ],
  [ "LD L, x", 0x2e, 1 ],
#  [ "LD PC, HL", 0xe9, 0 ], #prefer jp [hl]
  [ "LD SP, HL", 0xf9, 0 ],
  [ "LD BC, ?", 0x1, 2 ],
  [ "LD DE, ?", 0x11, 2 ],
  [ "LD HL, ?", 0x21, 2 ],
  [ "LD SP, ?", 0x31, 2 ],
#  [ "LD [?], SP", 0x8, 2 ],
  [ "LD [?], A", 0xea, 2 ],
  [ "NOP", 0x0, 0 ],
  [ "OR A", 0xb7, 0 ],
  [ "OR B", 0xb0, 0 ],
  [ "OR C", 0xb1, 0 ],
  [ "OR D", 0xb2, 0 ],
  [ "OR E", 0xb3, 0 ],
  [ "OR H", 0xb4, 0 ],
  [ "OR [HL]", 0xb6, 0 ],
  [ "OR L", 0xb5, 0 ],
  [ "OR x", 0xf6, 1 ],
  [ "POP AF", 0xf1, 0 ],
  [ "POP BC", 0xc1, 0 ],
  [ "POP DE", 0xd1, 0 ],
  [ "POP HL", 0xe1, 0 ],
  [ "PUSH AF", 0xf5, 0 ],
  [ "PUSH BC", 0xc5, 0 ],
  [ "PUSH DE", 0xd5, 0 ],
  [ "PUSH HL", 0xe5, 0 ],
  [ "RES 0, A", 0x87cb, 3 ],
  [ "RES 0, B", 0x80cb, 3 ],
  [ "RES 0, C", 0x81cb, 3 ],
  [ "RES 0, D", 0x82cb, 3 ],
  [ "RES 0, E", 0x83cb, 3 ],
  [ "RES 0, H", 0x84cb, 3 ],
  [ "RES 0, [HL]", 0x86cb, 3 ],
  [ "RES 0, L", 0x85cb, 3 ],
  [ "RES 1, A", 0x8fcb, 3 ],
  [ "RES 1, B", 0x88cb, 3 ],
  [ "RES 1, C", 0x89cb, 3 ],
  [ "RES 1, D", 0x8acb, 3 ],
  [ "RES 1, E", 0x8bcb, 3 ],
  [ "RES 1, H", 0x8ccb, 3 ],
  [ "RES 1, [HL]", 0x8ecb, 3 ],
  [ "RES 1, L", 0x8dcb, 3 ],
  [ "RES 2, A", 0x97cb, 3 ],
  [ "RES 2, B", 0x90cb, 3 ],
  [ "RES 2, C", 0x91cb, 3 ],
  [ "RES 2, D", 0x92cb, 3 ],
  [ "RES 2, E", 0x93cb, 3 ],
  [ "RES 2, H", 0x94cb, 3 ],
  [ "RES 2, [HL]", 0x96cb, 3 ],
  [ "RES 2, L", 0x95cb, 3 ],
  [ "RES 3, A", 0x9fcb, 3 ],
  [ "RES 3, B", 0x98cb, 3 ],
  [ "RES 3, C", 0x99cb, 3 ],
  [ "RES 3, D", 0x9acb, 3 ],
  [ "RES 3, E", 0x9bcb, 3 ],
  [ "RES 3, H", 0x9ccb, 3 ],
  [ "RES 3, [HL]", 0x9ecb, 3 ],
  [ "RES 3, L", 0x9dcb, 3 ],
  [ "RES 4, A", 0xa7cb, 3 ],
  [ "RES 4, B", 0xa0cb, 3 ],
  [ "RES 4, C", 0xa1cb, 3 ],
  [ "RES 4, D", 0xa2cb, 3 ],
  [ "RES 4, E", 0xa3cb, 3 ],
  [ "RES 4, H", 0xa4cb, 3 ],
  [ "RES 4, [HL]", 0xa6cb, 3 ],
  [ "RES 4, L", 0xa5cb, 3 ],
  [ "RES 5, A", 0xafcb, 3 ],
  [ "RES 5, B", 0xa8cb, 3 ],
  [ "RES 5, C", 0xa9cb, 3 ],
  [ "RES 5, D", 0xaacb, 3 ],
  [ "RES 5, E", 0xabcb, 3 ],
  [ "RES 5, H", 0xaccb, 3 ],
  [ "RES 5, [HL]", 0xaecb, 3 ],
  [ "RES 5, L", 0xadcb, 3 ],
  [ "RES 6, A", 0xb7cb, 3 ],
  [ "RES 6, B", 0xb0cb, 3 ],
  [ "RES 6, C", 0xb1cb, 3 ],
  [ "RES 6, D", 0xb2cb, 3 ],
  [ "RES 6, E", 0xb3cb, 3 ],
  [ "RES 6, H", 0xb4cb, 3 ],
  [ "RES 6, [HL]", 0xb6cb, 3 ],
  [ "RES 6, L", 0xb5cb, 3 ],
  [ "RES 7, A", 0xbfcb, 3 ],
  [ "RES 7, B", 0xb8cb, 3 ],
  [ "RES 7, C", 0xb9cb, 3 ],
  [ "RES 7, D", 0xbacb, 3 ],
  [ "RES 7, E", 0xbbcb, 3 ],
  [ "RES 7, H", 0xbccb, 3 ],
  [ "RES 7, [HL]", 0xbecb, 3 ],
  [ "RES 7, L", 0xbdcb, 3 ],
  [ "RETI", 0xd9, 0 ],
  [ "RET C", 0xd8, 0 ],
  [ "RET NC", 0xd0, 0 ],
  [ "RET NZ", 0xc0, 0 ],
  [ "RET Z", 0xc8, 0 ],
  [ "RET", 0xc9, 0 ],
  [ "RLA", 0x17, 0 ],
  [ "RL A", 0x17cb, 3 ],
  [ "RL B", 0x10cb, 3 ],
  [ "RL C", 0x11cb, 3 ],
  [ "RLCA", 0x7, 0 ],
  [ "RLC A", 0x7cb, 3 ],
  [ "RLC B", 0xcb, 3 ],
  [ "RLC C", 0x1cb, 3 ],
  [ "RLC D", 0x2cb, 3 ],
  [ "RLC E", 0x3cb, 3 ],
  [ "RLC H", 0x4cb, 3 ],
  [ "RLC [HL]", 0x6cb, 3 ],
  [ "RLC L", 0x5cb, 3 ],
  [ "RL D", 0x12cb, 3 ],
  [ "RL E", 0x13cb, 3 ],
  [ "RL H", 0x14cb, 3 ],
  [ "RL [HL]", 0x16cb, 3 ],
  [ "RL L", 0x15cb, 3 ],
  [ "RRA", 0x1f, 0 ],
  [ "RR A", 0x1fcb, 3 ],
  [ "RR B", 0x18cb, 3 ],
  [ "RR C", 0x19cb, 3 ],
  [ "RRCA", 0xf, 0 ],
  [ "RRC A", 0xfcb, 3 ],
  [ "RRC B", 0x8cb, 3 ],
  [ "RRC C", 0x9cb, 3 ],
  [ "RRC D", 0xacb, 3 ],
  [ "RRC E", 0xbcb, 3 ],
  [ "RRC H", 0xccb, 3 ],
  [ "RRC [HL]", 0xecb, 3 ],
  [ "RRC L", 0xdcb, 3 ],
  [ "RR D", 0x1acb, 3 ],
  [ "RR E", 0x1bcb, 3 ],
  [ "RR H", 0x1ccb, 3 ],
  [ "RR [HL]", 0x1ecb, 3 ],
  [ "RR L", 0x1dcb, 3 ],
  [ "RST $0", 0xc7, 0 ],
  [ "RST $10", 0xd7, 0 ],
  [ "RST $18", 0xdf, 0 ],
  [ "RST $20", 0xe7, 0 ],
  [ "RST $28", 0xef, 0 ],
  [ "RST $30", 0xf7, 0 ],
  [ "RST $38", 0xff, 0 ],
  [ "RST $8", 0xcf, 0 ],
  [ "SBC A", 0x9f, 0 ],
  [ "SBC B", 0x98, 0 ],
  [ "SBC C", 0x99, 0 ],
  [ "SBC D", 0x9a, 0 ],
  [ "SBC E", 0x9b, 0 ],
  [ "SBC H", 0x9c, 0 ],
  [ "SBC [HL]", 0x9e, 0 ],
  [ "SBC L", 0x9d, 0 ],
  [ "SBC x", 0xde, 1 ],
  [ "SCF", 0x37, 0 ],
  [ "SET 0, A", 0xc7cb, 3 ],
  [ "SET 0, B", 0xc0cb, 3 ],
  [ "SET 0, C", 0xc1cb, 3 ],
  [ "SET 0, D", 0xc2cb, 3 ],
  [ "SET 0, E", 0xc3cb, 3 ],
  [ "SET 0, H", 0xc4cb, 3 ],
  [ "SET 0, [HL]", 0xc6cb, 3 ],
  [ "SET 0, L", 0xc5cb, 3 ],
  [ "SET 1, A", 0xcfcb, 3 ],
  [ "SET 1, B", 0xc8cb, 3 ],
  [ "SET 1, C", 0xc9cb, 3 ],
  [ "SET 1, D", 0xcacb, 3 ],
  [ "SET 1, E", 0xcbcb, 3 ],
  [ "SET 1, H", 0xcccb, 3 ],
  [ "SET 1, [HL]", 0xcecb, 3 ],
  [ "SET 1, L", 0xcdcb, 3 ],
  [ "SET 2, A", 0xd7cb, 3 ],
  [ "SET 2, B", 0xd0cb, 3 ],
  [ "SET 2, C", 0xd1cb, 3 ],
  [ "SET 2, D", 0xd2cb, 3 ],
  [ "SET 2, E", 0xd3cb, 3 ],
  [ "SET 2, H", 0xd4cb, 3 ],
  [ "SET 2, [HL]", 0xd6cb, 3 ],
  [ "SET 2, L", 0xd5cb, 3 ],
  [ "SET 3, A", 0xdfcb, 3 ],
  [ "SET 3, B", 0xd8cb, 3 ],
  [ "SET 3, C", 0xd9cb, 3 ],
  [ "SET 3, D", 0xdacb, 3 ],
  [ "SET 3, E", 0xdbcb, 3 ],
  [ "SET 3, H", 0xdccb, 3 ],
  [ "SET 3, [HL]", 0xdecb, 3 ],
  [ "SET 3, L", 0xddcb, 3 ],
  [ "SET 4, A", 0xe7cb, 3 ],
  [ "SET 4, B", 0xe0cb, 3 ],
  [ "SET 4, C", 0xe1cb, 3 ],
  [ "SET 4, D", 0xe2cb, 3 ],
  [ "SET 4, E", 0xe3cb, 3 ],
  [ "SET 4, H", 0xe4cb, 3 ],
  [ "SET 4, [HL]", 0xe6cb, 3 ],
  [ "SET 4, L", 0xe5cb, 3 ],
  [ "SET 5, A", 0xefcb, 3 ],
  [ "SET 5, B", 0xe8cb, 3 ],
  [ "SET 5, C", 0xe9cb, 3 ],
  [ "SET 5, D", 0xeacb, 3 ],
  [ "SET 5, E", 0xebcb, 3 ],
  [ "SET 5, H", 0xeccb, 3 ],
  [ "SET 5, [HL]", 0xeecb, 3 ],
  [ "SET 5, L", 0xedcb, 3 ],
  [ "SET 6, A", 0xf7cb, 3 ],
  [ "SET 6, B", 0xf0cb, 3 ],
  [ "SET 6, C", 0xf1cb, 3 ],
  [ "SET 6, D", 0xf2cb, 3 ],
  [ "SET 6, E", 0xf3cb, 3 ],
  [ "SET 6, H", 0xf4cb, 3 ],
  [ "SET 6, [HL]", 0xf6cb, 3 ],
  [ "SET 6, L", 0xf5cb, 3 ],
  [ "SET 7, A", 0xffcb, 3 ],
  [ "SET 7, B", 0xf8cb, 3 ],
  [ "SET 7, C", 0xf9cb, 3 ],
  [ "SET 7, D", 0xfacb, 3 ],
  [ "SET 7, E", 0xfbcb, 3 ],
  [ "SET 7, H", 0xfccb, 3 ],
  [ "SET 7, [HL]", 0xfecb, 3 ],
  [ "SET 7, L", 0xfdcb, 3 ],
  [ "SLA A", 0x27cb, 3 ],
  [ "SLA B", 0x20cb, 3 ],
  [ "SLA C", 0x21cb, 3 ],
  [ "SLA D", 0x22cb, 3 ],
  [ "SLA E", 0x23cb, 3 ],
  [ "SLA H", 0x24cb, 3 ],
  [ "SLA [HL]", 0x26cb, 3 ],
  [ "SLA L", 0x25cb, 3 ],
  [ "SRA A", 0x2fcb, 3 ],
  [ "SRA B", 0x28cb, 3 ],
  [ "SRA C", 0x29cb, 3 ],
  [ "SRA D", 0x2acb, 3 ],
  [ "SRA E", 0x2bcb, 3 ],
  [ "SRA H", 0x2ccb, 3 ],
  [ "SRA [HL]", 0x2ecb, 3 ],
  [ "SRA L", 0x2dcb, 3 ],
  [ "SRL A", 0x3fcb, 3 ],
  [ "SRL B", 0x38cb, 3 ],
  [ "SRL C", 0x39cb, 3 ],
  [ "SRL D", 0x3acb, 3 ],
  [ "SRL E", 0x3bcb, 3 ],
  [ "SRL H", 0x3ccb, 3 ],
  [ "SRL [HL]", 0x3ecb, 3 ],
  [ "SRL L", 0x3dcb, 3 ],
  [ "STOP", 0x10, 0 ],
  [ "SUB A", 0x97, 0 ],
  [ "SUB B", 0x90, 0 ],
  [ "SUB C", 0x91, 0 ],
  [ "SUB D", 0x92, 0 ],
  [ "SUB E", 0x93, 0 ],
  [ "SUB H", 0x94, 0 ],
  [ "SUB [HL]", 0x96, 0 ],
  [ "SUB L", 0x95, 0 ],
  [ "SUB x", 0xd6, 1 ],
  [ "SWAP A", 0x37cb, 3 ],
  [ "SWAP B", 0x30cb, 3 ],
  [ "SWAP C", 0x31cb, 3 ],
  [ "SWAP D", 0x32cb, 3 ],
  [ "SWAP E", 0x33cb, 3 ],
  [ "SWAP H", 0x34cb, 3 ],
  [ "SWAP [HL]", 0x36cb, 3 ],
  [ "SWAP L", 0x35cb, 3 ],
  [ "XOR A", 0xaf, 0 ],
  [ "XOR B", 0xa8, 0 ],
  [ "XOR C", 0xa9, 0 ],
  [ "XOR D", 0xaa, 0 ],
  [ "XOR E", 0xab, 0 ],
  [ "XOR H", 0xac, 0 ],
  [ "XOR [HL]", 0xae, 0 ],
  [ "XOR L", 0xad, 0 ],
  [ "XOR x", 0xee, 1 ],
  [ "E", 0x100, -1 ],
]

#find conflicts
conflict_table = {}
for line in temp_opt_table:
    if line[1] in conflict_table.keys():
        print "CONFLICT: " + line[0] + " ($" + hex(line[1])[2:] + ") .... " + conflict_table[line[1]]
    else:
        conflict_table[line[1]] = line[0]

#construct real opt_table
opt_table = {}
for line in temp_opt_table:
    opt_table[line[1]] = [line[0], line[2]]
del temp_opt_table
del line

end_08_scripts_with = [
0xe9, #jp hl
#0xc3, #jp
##0x18, #jr
0xc9, #ret
###0xda, 0xe9, 0xd2, 0xc2, 0xca, 0xc3, 0x38, 0x30, 0x20, 0x28, 0x18, 0xd8, 0xd0, 0xc0, 0xc8, 0xc9
]
relative_jumps = [0x38, 0x30, 0x20, 0x28, 0x18, 0xc3, 0xda, 0xc2] 
relative_unconditional_jumps = [0xc3, 0x18]

#TODO: replace call and a pointer with call and a label
call_commands = [0xdc, 0xd4, 0xc4, 0xcc, 0xcd]


all_labels = {}

def load_labels(filename="labels.json"):
    global all_labels
    if os.path.exists(filename):
        all_labels = json.loads(open(filename, "r").read())
    else:
        print "You must run analyze_incbins.scan_for_predefined_labels() to create \"labels.json\". Trying..."
        import analyze_incbins
        analyze_incbins.scan_for_predefined_labels()
load_labels()

def find_label(local_address, bank_id=0):
    global all_labels
    #keep an integer
    if type(local_address) == str:
        local_address1 = int(local_address.replace("$", "0x"), 16)
    else: local_address1 = local_address

    #turn local_address into a string
    if type(local_address) == str:
        if "0x" in local_address: local_address = local_address.replace("0x", "$")
        elif not "$" in local_address: local_address = "$" + local_address
    if type(local_address) == int:
        local_address = "$%.x" % (local_address)
    local_address = local_address.upper()

    for label_entry in all_labels:
        if label_entry["local_pointer"].upper() == local_address:
            if label_entry["bank_id"] == bank_id or (local_address1 < 0x8000 and (label_entry["bank_id"] == 0 or label_entry["bank_id"] == 1)):
                return label_entry["label"]
    return None

def random_asm_label():
    return ".ASM_" + random_hash()

def asm_label(address):
    # why using a random value when you can use the eff. address?
    return ".ASM_" + hex(address)[2:]

def output_bank_opcodes(original_offset, max_byte_count=0x4000):
    #fs = current_address
    #b = bank_byte
    #in = input_data  -- extract_maps.rom
    #bank_size = byte_count
    #i = offset
    #ad = end_address
    #a, oa = current_byte_number

    bank_id = 0
    if original_offset > 0x8000:
        bank_id = original_offset / 0x4000
    print "bank id is: " + str(bank_id)

    last_hl_address = None #for when we're scanning the main map script
    last_a_address = None
    used_3d97 = False

    rom = extract_maps.rom
    offset = original_offset
    current_byte_number = 0 #start from the beginning

    #we don't actually have an end address, but we'll just say $4000
    end_address = original_offset + max_byte_count

    byte_labels = {}

    output = ""
    keep_reading = True
    while offset <= end_address and keep_reading:
        current_byte = ord(extract_maps.rom[offset])
        is_data = False
        maybe_byte = current_byte

        #first check if this byte already has a label
        #if it does, use the label
        #if not, generate a new label
        if offset in byte_labels.keys():
            line_label = byte_labels[offset]["name"]
            byte_labels[offset]["usage"] += 1
        else:
            line_label = asm_label(offset)
            byte_labels[offset] = {}
            byte_labels[offset]["name"] = line_label
            byte_labels[offset]["usage"] = 0
        byte_labels[offset]["definition"] = True
        output += line_label.lower() + "\n" #" ; " + hex(offset) + "\n"

        #find out if there's a two byte key like this
        temp_maybe = maybe_byte
        temp_maybe += ( ord(rom[offset+1]) << 8)
        if temp_maybe in opt_table.keys() and ord(rom[offset+1])!=0:
            opstr = opt_table[temp_maybe][0].lower()

            if "x" in opstr:
                for x in range(0, opstr.count("x")):
                    insertion = ord(rom[offset + 1])
                    insertion = "$" + hex(insertion)[2:]

                    opstr = opstr[:opstr.find("x")].lower() + insertion + opstr[opstr.find("x")+1:].lower()

                    current_byte += 1
                    offset += 1
            if "?" in opstr:
                for y in range(0, opstr.count("?")):
                    byte1 = ord(rom[offset + 1])
                    byte2 = ord(rom[offset + 2])

                    number = byte1
                    number += byte2 << 8;

                    insertion = "$%.4x" % (number)

                    opstr = opstr[:opstr.find("?")].lower() + insertion + opstr[opstr.find("?")+1:].lower()

                    current_byte_number += 2
                    offset += 2

            output += spacing + opstr #+ " ; " + hex(offset)
            output += "\n"

            current_byte_number += 2
            offset += 2
        elif maybe_byte in opt_table.keys():
            op_code = opt_table[maybe_byte]
            op_code_type = op_code[1]
            op_code_byte = maybe_byte

            #type = -1 when it's the E op
            #if op_code_type != -1:
            if   op_code_type == 0 and ord(rom[offset]) == op_code_byte:
                op_str = op_code[0].lower()

                output += spacing + op_code[0].lower() #+ " ; " + hex(offset)
                output += "\n"

                offset += 1
                current_byte_number += 1
            elif op_code_type == 1 and ord(rom[offset]) == op_code_byte:
                oplen = len(op_code[0])
                opstr = copy(op_code[0])
                xes = op_code[0].count("x")
                include_comment = False
                for x in range(0, xes):
                    insertion = ord(rom[offset + 1])
                    insertion = "$" + hex(insertion)[2:]

                    if current_byte == 0x18 or current_byte==0x20 or current_byte in relative_jumps: #jr or jr nz
                        #generate a label for the byte we're jumping to
                        target_address = offset + 2 + c_int8(ord(rom[offset + 1])).value
                        if target_address in byte_labels.keys():
                            byte_labels[target_address]["usage"] = 1 + byte_labels[target_address]["usage"]
                            line_label2 = byte_labels[target_address]["name"]
                        else:
                            line_label2 = asm_label(target_address)
                            byte_labels[target_address] = {}
                            byte_labels[target_address]["name"] = line_label2
                            byte_labels[target_address]["usage"] = 1
                            byte_labels[target_address]["definition"] = False

                        insertion = line_label2.lower()
                        include_comment = True
                    elif current_byte == 0x3e:
                        last_a_address = ord(rom[offset + 1])

                    opstr = opstr[:opstr.find("x")].lower() + insertion + opstr[opstr.find("x")+1:].lower()
                    output += spacing + opstr
                    if include_comment:
                        output += " ; " + hex(offset)
                        if current_byte in relative_jumps:
                            output += " $" + hex(ord(rom[offset + 1]))[2:]
                    output += "\n"

                    current_byte_number += 1
                    offset += 1
                    insertion = ""

                current_byte_number += 1
                offset += 1
                include_comment = False
            elif op_code_type == 2 and ord(rom[offset]) == op_code_byte:
                oplen = len(op_code[0])
                opstr = copy(op_code[0])
                qes = op_code[0].count("?")
                for x in range(0, qes):
                    byte1 = ord(rom[offset + 1])
                    byte2 = ord(rom[offset + 2])

                    number = byte1
                    number += byte2 << 8;

                    insertion = "$%.4x" % (number)
                    if maybe_byte in call_commands or current_byte in relative_unconditional_jumps or current_byte in relative_jumps:
                        result = find_label(insertion, bank_id)
                        if result != None:
                            insertion = result

                    opstr = opstr[:opstr.find("?")].lower() + insertion + opstr[opstr.find("?")+1:].lower()
                    output += spacing + opstr #+ " ; " + hex(offset)
                    output += "\n"

                    current_byte_number += 2
                    offset += 2

                current_byte_number += 1
                offset += 1

                if current_byte == 0x21:
                    last_hl_address = byte1 + (byte2 << 8)
                if current_byte == 0xcd:
                    if number == 0x3d97: used_3d97 = True

                #duck out if this is jp $24d7
                if current_byte == 0xc3 or current_byte in relative_unconditional_jumps:
                    if current_byte == 0xc3:
                        if number == 0x3d97: used_3d97 = True
                    #if number == 0x24d7: #jp
                    if not has_outstanding_labels(byte_labels) or all_outstanding_labels_are_reverse(byte_labels, offset):
                        keep_reading = False
                        is_data = False
                        break
            else:
                is_data = True

            #stop reading at a jump, relative jump or return
            if current_byte in end_08_scripts_with:
                if not has_outstanding_labels(byte_labels) and all_outstanding_labels_are_reverse(byte_labels, offset):
                    keep_reading = False
                    is_data = False #cleanup
                    break
                else:
                    is_data = False
                    keep_reading = True
            else:
                is_data = False
                keep_reading = True
        else:
#        if is_data and keep_reading:
            output += spacing + "db $" + hex(ord(rom[offset]))[2:] #+ " ; " + hex(offset)
            output += "\n"
            offset += 1
            current_byte_number += 1
        #else the while loop would have spit out the opcode

        #these two are done prior
        #offset += 1
        #current_byte_number += 1

    #clean up unused labels
    for label_line in byte_labels.keys():
        address = label_line
        label_line = byte_labels[label_line]
        if label_line["usage"] == 0:
            output = output.replace((label_line["name"] + "\n").lower(), "")

    #add the offset of the final location
    output += "; " + hex(offset)

    return (output, offset, last_hl_address, last_a_address, used_3d97)

def has_outstanding_labels(byte_labels):
    """
    if a label is used once, it means it has to be called or specified later
    """
    for label_line in byte_labels.keys():
        real_line = byte_labels[label_line]
        if real_line["definition"] == False: return True
    return False

def all_outstanding_labels_are_reverse(byte_labels, offset):
    for label_id in byte_labels.keys():
        line = byte_labels[label_id] # label_id is also the address
        if line["definition"] == False:
            if not label_id < offset: return False
    return True

def text_asm_pretty_printer(label, address_of_08, include_08=True):
    """returns (output, end_address)"""
    output = label + ": ; " + hex(address_of_08) + "\n"
    if include_08:
        output += spacing + "db $08 ; asm\n"
        results = output_bank_opcodes(address_of_08 + 1)
    else:
        results = output_bank_opcodes(address_of_08)
    output += results[0]
    end_address = results[1]

    return (output, end_address)

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    #0x18f96 is PalletTownText1
    #0x19B5D is BluesHouseText1
    print output_bank_opcodes(int(sys.argv[1], 16))[0]
