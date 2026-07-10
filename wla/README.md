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

Use `../WLA_DX_PORTING.md` for the branch workflow and source-of-truth rules.
