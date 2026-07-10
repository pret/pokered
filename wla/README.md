# WLA-DX scaffold

This directory is a parallel WLA-DX reconciliation area. It does not replace the RGBDS source tree.

- `pkrd/` preserves the first-pass split artifacts imported from `wla-dx`.
- `poc/` contains standalone WLA-DX smoke/unit drivers.
- `tools/` contains structural index/check/report scripts.
- `reference/` contains small generated reference reports; the full monolith is local-only and ignored.
- `build/` is generated and ignored.

`make wla-red` (also available as the legacy `wla-rom` alias) assembles and
links the complete 64-bank imported WLA-DX split.
It is the executable migration baseline; the small POC targets only exercise
isolated syntax and data conversions.

`make wla-compare` builds both Red ROMs and requires the WLA-DX baseline to
match the verified RGBDS build byte-for-byte.

`make rgbds-red` builds the temporary RGBDS parity oracle. `make wla-check`
is the aggregate migration gate: it audits all candidates, verifies split and
structured-bank boundaries, builds both Red implementations, and compares the
ROMs byte-for-byte.

`make wla-audit` checks every candidate under `wla/data` for a corresponding
RGBDS source, preserved labels, non-placeholder content, operand widths, and
known RGBDS-only constructs. A candidate is not migration-ready while this
target reports it.

## Structured-bank migration

Bank 42 is the first generated bank replaced by a master-aligned structured
include. `wla/pkrd/bank42.asm` includes `wla/banks/bank42_text.asm`, whose 29
labeled records correspond to RGBDS section `Text 11` / `data/text/text_7.asm`.
Text is emitted natively with WLA-DX `.STRINGMAP` using `wla/pokemon.tbl`, a
checked mirror of `constants/charmap.asm`; control bytes and RAM pointers remain
explicit WLA data. `make wla-compare` proves that the structured boundary is
byte-identical to the verified RGBDS ROM, and `make wla-check-split` guards the
include, label boundary, and charmap synchronization.

Bank 43 replaces RGBDS section `Pokédex Text` with 151 named `.STRINGMAP`
records in `wla/banks/bank43_dex_text.asm`. The include is reproducibly derived
from `data/pokemon/dex_text.asm` by `wla/tools/convert_dex_text.py`; the split
checker enforces its record and bank boundaries, and `wla-check` proves parity.

Bank 44 similarly replaces RGBDS section `Move Names` with 165 terminated
`.STRINGMAP` records generated from `data/moves/names.asm`. Its exact `0x60f`
byte table boundary and remaining bank padding are guarded by the split checker.

Bank 41 is the first complete multi-file text bank: RGBDS section `Text 10` is
generated from its 12 authoritative includes as 221 named WLA text records.
The strict converter supports only the bytecode commands used by this section
and fails on unknown input; its exact `0x2b94` boundary remains parity-checked.

Bank 40 applies the same strict conversion to RGBDS section `Text 9`: 206
named records from 22 sources, including explicit Red selection of the one
VC-conditional message and three-byte BCD money commands. Its `0x2a37` section
boundary and padding are checked before ROM parity.

Bank 39 converts RGBDS section `Text 8` without additional compatibility
commands: 201 records from 28 source includes occupy exactly `0x2aa4` bytes.

Use `../WLA_DX_PORTING.md` for the branch workflow and source-of-truth rules.
