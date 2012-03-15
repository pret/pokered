#author: Bryan Bishop <kanzure@gmail.com>
#date: 2011-01-04
#purpose: insert labels into map headers
import sys

asm = None
asm_lines = []
def load_asm():
    global asm, asm_lines
    asm = open("../pokered.asm", "r").read()
    asm_lines = asm.split("\n")

def find_with_start_of_line(name):
    global asm_lines
    for line in asm_lines:
        if len(line) > len(name) and ": " in line:
            if line[:len(name)] == name: return True
    return False

def process_lines():
    global asm, asm_lines
    for line in asm_lines:
        if not "_h:" in line: continue #skip
        index = asm_lines.index(line)
        name = line.split("_h:")[0]

        if "Blocks" in asm_lines[index+3]: continue #skip, already done
        #if not (str(name + "Blocks:") in asm): continue #skip, no block label found
        if not find_with_start_of_line(name + "Blocks:"): continue #skip

        orig_line = asm_lines[index+3]
        fixed_line = orig_line.split(",")
        fixed_line[0] = "    dw " + name + "Blocks"
        fixed_line = ",".join(fixed_line)

        asm_lines[index+3] = fixed_line

if __name__ == "__main__":
    load_asm()
    process_lines()
    sys.stdout.write("\n".join(asm_lines))
