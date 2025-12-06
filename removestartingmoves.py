import os

TARGET_DIR = "data/pokemon/base_stats"
NEW_LINE = "    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets\n"

for filename in os.listdir(TARGET_DIR):
    if not filename.endswith(".asm"):
        continue

    path = os.path.join(TARGET_DIR, filename)

    # Read file
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    # If file is too short, skip to avoid breaking anything
    if len(lines) < 13:
        print(f"Skipped {filename} (not enough lines)")
        continue

    # Backup original
    with open(path + ".bak", "w", encoding="utf-8") as backup:
        backup.writelines(lines)

    # Replace 13th line (index 12)
    lines[12] = NEW_LINE

    # Write file back
    with open(path, "w", encoding="utf-8") as f:
        f.writelines(lines)

    print(f"Updated {filename}")