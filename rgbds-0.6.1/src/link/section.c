/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2019, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "link/main.h"
#include "link/section.h"

#include "error.h"
#include "hashmap.h"
#include "linkdefs.h"

HashMap sections;

struct ForEachArg {
	void (*callback)(struct Section *section, void *arg);
	void *arg;
};

static void forEach(void *section, void *arg)
{
	struct ForEachArg *callbackArg = (struct ForEachArg *)arg;

	callbackArg->callback((struct Section *)section, callbackArg->arg);
}

void sect_ForEach(void (*callback)(struct Section *, void *), void *arg)
{
	struct ForEachArg callbackArg = { .callback = callback, .arg = arg};

	hash_ForEach(sections, forEach, &callbackArg);
}

static void checkSectUnionCompat(struct Section *target, struct Section *other)
{
	if (other->isAddressFixed) {
		if (target->isAddressFixed) {
			if (target->org != other->org)
				errx("Section \"%s\" is defined with conflicting addresses $%04"
				     PRIx16 " and $%04" PRIx16,
				     other->name, target->org, other->org);
		} else if (target->isAlignFixed) {
			if ((other->org - target->alignOfs) & target->alignMask)
				errx("Section \"%s\" is defined with conflicting %d-byte alignment (offset %"
				     PRIu16 ") and address $%04" PRIx16,
				     other->name, target->alignMask + 1,
				     target->alignOfs, other->org);
		}
		target->isAddressFixed = true;
		target->org = other->org;

	} else if (other->isAlignFixed) {
		if (target->isAddressFixed) {
			if ((target->org - other->alignOfs) & other->alignMask)
				errx("Section \"%s\" is defined with conflicting address $%04"
				     PRIx16 " and %d-byte alignment (offset %" PRIu16 ")",
				     other->name, target->org,
				     other->alignMask + 1, other->alignOfs);
		} else if (target->isAlignFixed
			&& (other->alignMask & target->alignOfs)
				 != (target->alignMask & other->alignOfs)) {
			errx("Section \"%s\" is defined with conflicting %d-byte alignment (offset %"
			     PRIu16 ") and %d-byte alignment (offset %" PRIu16 ")",
			     other->name, target->alignMask + 1, target->alignOfs,
			     other->alignMask + 1, other->alignOfs);
		} else if (!target->isAlignFixed || (other->alignMask > target->alignMask)) {
			target->isAlignFixed = true;
			target->alignMask = other->alignMask;
		}
	}
}

static void checkFragmentCompat(struct Section *target, struct Section *other)
{
	if (other->isAddressFixed) {
		uint16_t org = other->org - target->size;

		if (target->isAddressFixed) {
			if (target->org != org)
				errx("Section \"%s\" is defined with conflicting addresses $%04"
				     PRIx16 " and $%04" PRIx16,
				     other->name, target->org, other->org);

		} else if (target->isAlignFixed) {
			if ((org - target->alignOfs) & target->alignMask)
				errx("Section \"%s\" is defined with conflicting %d-byte alignment (offset %"
				     PRIu16 ") and address $%04" PRIx16,
				     other->name, target->alignMask + 1,
				     target->alignOfs, other->org);
		}
		target->isAddressFixed = true;
		target->org = org;

	} else if (other->isAlignFixed) {
		int32_t ofs = (other->alignOfs - target->size) % (other->alignMask + 1);

		if (ofs < 0)
			ofs += other->alignMask + 1;

		if (target->isAddressFixed) {
			if ((target->org - ofs) & other->alignMask)
				errx("Section \"%s\" is defined with conflicting address $%04"
				     PRIx16 " and %d-byte alignment (offset %" PRIu16 ")",
				     other->name, target->org,
				     other->alignMask + 1, other->alignOfs);

		} else if (target->isAlignFixed
			&& (other->alignMask & target->alignOfs) != (target->alignMask & ofs)) {
			errx("Section \"%s\" is defined with conflicting %d-byte alignment (offset %"
			     PRIu16 ") and %d-byte alignment (offset %" PRIu16 ")",
			     other->name, target->alignMask + 1, target->alignOfs,
			     other->alignMask + 1, other->alignOfs);

		} else if (!target->isAlignFixed || (other->alignMask > target->alignMask)) {
			target->isAlignFixed = true;
			target->alignMask = other->alignMask;
			target->alignOfs = ofs;
		}
	}
}

static void mergeSections(struct Section *target, struct Section *other, enum SectionModifier mod)
{
	// Common checks

	if (target->type != other->type)
		errx("Section \"%s\" is defined with conflicting types %s and %s",
		     other->name, sectionTypeInfo[target->type].name, sectionTypeInfo[other->type].name);

	if (other->isBankFixed) {
		if (!target->isBankFixed) {
			target->isBankFixed = true;
			target->bank = other->bank;
		} else if (target->bank != other->bank) {
			errx("Section \"%s\" is defined with conflicting banks %" PRIu32 " and %"
			     PRIu32, other->name, target->bank, other->bank);
		}
	}

	switch (mod) {
	case SECTION_UNION:
		checkSectUnionCompat(target, other);
		if (other->size > target->size)
			target->size = other->size;
		break;

	case SECTION_FRAGMENT:
		checkFragmentCompat(target, other);
		// Append `other` to `target`
		// Note that the order in which fragments are stored in the `nextu` list does not
		// really matter, only that offsets are properly computed
		other->offset = target->size;
		target->size += other->size;
		// Normally we'd check that `sect_HasData`, but SDCC areas may be `_INVALID` here
		// Note that if either fragment has data (= a non-NULL `data` pointer), then it's
		// assumed that both fragments "have data", and thus should either have a non-NULL
		// `data` pointer, or a size of 0.
		if (other->data) {
			if (target->data) {
				// Ensure we're not allocating 0 bytes
				target->data = realloc(target->data,
						       sizeof(*target->data) * target->size + 1);
				if (!target->data)
					errx("Failed to concatenate \"%s\"'s fragments", target->name);
				memcpy(&target->data[other->offset], other->data, other->size);
			} else {
				assert(target->size == other->size); // It has been increased just above
				target->data = other->data;
				other->data = NULL; // Prevent a double free()
			}
			// Adjust patches' PC offsets
			for (uint32_t patchID = 0; patchID < other->nbPatches; patchID++)
				other->patches[patchID].pcOffset += other->offset;
		} else if (target->data) {
			assert(other->size == 0);
		}
		break;

	case SECTION_NORMAL:
		unreachable_();
	}

	other->nextu = target->nextu;
	target->nextu = other;
}

void sect_AddSection(struct Section *section)
{
	// Check if the section already exists
	struct Section *other = hash_GetElement(sections, section->name);

	if (other) {
		if (section->modifier != other->modifier)
			errx("Section \"%s\" defined as %s and %s", section->name,
			     sectionModNames[section->modifier], sectionModNames[other->modifier]);
		else if (section->modifier == SECTION_NORMAL)
			errx("Section name \"%s\" is already in use", section->name);
		else
			mergeSections(other, section, section->modifier);
	} else if (section->modifier == SECTION_UNION && sect_HasData(section->type)) {
		errx("Section \"%s\" is of type %s, which cannot be unionized",
		     section->name, sectionTypeInfo[section->type].name);
	} else {
		// If not, add it
		hash_AddElement(sections, section->name, section);
	}
}

struct Section *sect_GetSection(char const *name)
{
	return (struct Section *)hash_GetElement(sections, name);
}

void sect_CleanupSections(void)
{
	hash_EmptyMap(sections);
}

static void doSanityChecks(struct Section *section, void *ptr)
{
	(void)ptr;

	// Sanity check the section's type

	if (section->type < 0 || section->type >= SECTTYPE_INVALID) {
		error(NULL, 0, "Section \"%s\" has an invalid type", section->name);
		return;
	}

	if (is32kMode && section->type == SECTTYPE_ROMX) {
		if (section->isBankFixed && section->bank != 1)
			error(NULL, 0, "%s: ROMX sections must be in bank 1 (if any) with option -t",
			     section->name);
		else
			section->type = SECTTYPE_ROM0;
	}
	if (isWRA0Mode && section->type == SECTTYPE_WRAMX) {
		if (section->isBankFixed && section->bank != 1)
			error(NULL, 0, "%s: WRAMX sections must be in bank 1 with options -w or -d",
			     section->name);
		else
			section->type = SECTTYPE_WRAMX;
	}
	if (isDmgMode && section->type == SECTTYPE_VRAM && section->bank == 1)
		error(NULL, 0, "%s: VRAM bank 1 can't be used with option -d",
		     section->name);

	// Check if alignment is reasonable, this is important to avoid UB
	// An alignment of zero is equivalent to no alignment, basically
	if (section->isAlignFixed && section->alignMask == 0)
		section->isAlignFixed = false;

	// Too large an alignment may not be satisfiable
	if (section->isAlignFixed && (section->alignMask & sectionTypeInfo[section->type].startAddr))
		error(NULL, 0, "%s: %s sections cannot be aligned to $%04x bytes",
		     section->name, sectionTypeInfo[section->type].name, section->alignMask + 1);

	uint32_t minbank = sectionTypeInfo[section->type].firstBank, maxbank = sectionTypeInfo[section->type].lastBank;

	if (section->isBankFixed && section->bank < minbank && section->bank > maxbank)
		error(NULL, 0, minbank == maxbank
			? "Cannot place section \"%s\" in bank %" PRIu32 ", it must be %" PRIu32
			: "Cannot place section \"%s\" in bank %" PRIu32 ", it must be between %" PRIu32 " and %" PRIu32,
		     section->name, section->bank, minbank, maxbank);

	// Check if section has a chance to be placed
	if (section->size > sectionTypeInfo[section->type].size)
		error(NULL, 0, "Section \"%s\" is bigger than the max size for that type: %#" PRIx16 " > %#" PRIx16,
		     section->name, section->size, sectionTypeInfo[section->type].size);

	// Translate loose constraints to strong ones when they're equivalent

	if (minbank == maxbank) {
		section->bank = minbank;
		section->isBankFixed = true;
	}

	if (section->isAddressFixed) {
		// It doesn't make sense to have both org and alignment set
		if (section->isAlignFixed) {
			if ((section->org & section->alignMask) != section->alignOfs)
				error(NULL, 0, "Section \"%s\"'s fixed address doesn't match its alignment",
				     section->name);
			section->isAlignFixed = false;
		}

		// Ensure the target address is valid
		if (section->org < sectionTypeInfo[section->type].startAddr
		 || section->org > endaddr(section->type))
			error(NULL, 0, "Section \"%s\"'s fixed address %#" PRIx16 " is outside of range [%#"
			     PRIx16 "; %#" PRIx16 "]", section->name, section->org,
			     sectionTypeInfo[section->type].startAddr, endaddr(section->type));

		if (section->org + section->size > endaddr(section->type) + 1)
			error(NULL, 0, "Section \"%s\"'s end address %#x is greater than last address %#x",
			     section->name, section->org + section->size,
			     endaddr(section->type) + 1);
	}

#undef fail
}

void sect_DoSanityChecks(void)
{
	sect_ForEach(doSanityChecks, NULL);
}
