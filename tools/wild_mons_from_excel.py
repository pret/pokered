import csv
import re
import os
import sys


def main():

    csv_data_dir = "./csv"
    mon_data_dir = "./data/wild/maps/" # Would be nice if this wasn't relative.

    # Iterate over all pokemon data files in the game
    for f_name in sorted(os.listdir(csv_data_dir)):

        # Open csv data file and target data name
        csv_file_name = os.path.realpath(os.path.join(csv_data_dir, f_name))
        if not csv_file_name.split(".")[1] == "csv":
            print("Skipped", csv_file_name)
            continue
        data_file_name = f_name.split(".")[0] + ".asm"
        csv_file = open(csv_file_name, 'r')
        csv_reader = csv.reader(csv_file)
        data_file = open(os.path.join(mon_data_dir,data_file_name), 'w')

        # Add in the assembly label
        assembly_label = next(csv_reader)
        data_file.write(f"{assembly_label[0]}\n")    

        # Add in the encounter rate
        encounter_row = next(csv_reader)
        data_file.write(f"\tdb ${encounter_row[1]}\n")

        # Skip 3 rows, which puts us at the start of where the pokemon lines should be
        for i in range(0, 3):
            next(csv_reader)

        # Iterate over each pokemon in the file, writing it to the CSV
        mon_counter = 0 # Count number of mon in an area
        for row in csv_reader:
            data_file.write(f"\tdb {row[1]},{row[0]}\n")
            mon_counter += 1
        data_file.write("\tdb $00\n")

        # Sanity check that there are exactly 10 pokemon in each area
        assert mon_counter == 10

        # Cleanup
        csv_file.close()
        data_file.close()


if __name__ == "__main__":
    main()
