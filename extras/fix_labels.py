#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-27
#fix trainer header labels to not suck so much
import analyze_incbins

def replace_trainer_header_labels(debug=False):
    """trainer header labels could be better"""
    asm = analyze_incbins.asm
    if debug: print str(type(asm))
    single_asm = "\n".join(asm)
    current_map_name = "asdjkl;"
    line_id = 0
    trainer_header_counter = 1

    for line in asm:
        trainer_header_base = current_map_name + "TrainerHeader"
        trainer_header_name = trainer_header_base + str(trainer_header_counter)

        #we've found a TrainerHeaders thing
        if "TrainerHeaders:" in line:
            current_map_name = line.split("TrainerHeaders")[0]
            if line[0:len(current_map_name)] == current_map_name:
                trainer_header_counter = 1

        #replace a trainer header label
        elif "TrainerHeader_" in line and line[0:14] == "TrainerHeader_":
            temp = line.split("TrainerHeader_")[1]
            temp = temp.split(": ;")[0]
            
            old_label = "TrainerHeader_" + temp
            new_label = current_map_name + "TH" + str(trainer_header_counter) #trainer_header_name
            single_asm = single_asm.replace(old_label + ":", new_label + ":")
            single_asm = single_asm.replace(old_label + "\n", new_label + "\n")
            if debug: print "old_label = " + old_label
            if debug: print "new_label = " + new_label

            trainer_header_counter += 1
        
        elif trainer_header_base in line and line[0:len(trainer_header_base)] == trainer_header_base and (line[len(trainer_header_base)+1:len(trainer_header_base)+2] == ":" or line[len(trainer_header_base)+2:len(trainer_header_base)+3] == ":"):
            if line[len(trainer_header_base)+1:len(trainer_header_base)+2] == ":":
                trainer_header_counter = int(line[len(trainer_header_base):len(trainer_header_base)+1])
            elif line[len(trainer_header_base)+2:len(trainer_header_base)+3] == ":":
                trainer_header_counter = int(line[len(trainer_header_base):len(trainer_header_base)+2])
            trainer_header_name = trainer_header_base + str(trainer_header_counter)

        #replace a text label
        elif " TextBeforeBattle" in line and not current_map_name in line:
            old_label = line.split("dw ")[1].split(" ;")[0]
            new_label = current_map_name + "B4BattleTxt" + str(trainer_header_counter) #trainer_header_name + "BeforeBattleText"
            single_asm = single_asm.replace(old_label + ":", new_label + ":")
            single_asm = single_asm.replace(old_label + "\n", new_label + "\n")
            single_asm = single_asm.replace(old_label + " ;", new_label + " ;")
            if debug: print "old_label = " + old_label
            if debug: print "new_label = " + new_label
        #replace a text label
        elif " TextAfterBattle" in line and not current_map_name in line:
            old_label = line.split("dw ")[1].split(" ;")[0]
            new_label = current_map_name + "AfterBattleTxt" + str(trainer_header_counter) #trainer_header_name + "AfterBattleText"
            single_asm = single_asm.replace(old_label + ":", new_label + ":")
            single_asm = single_asm.replace(old_label + "\n", new_label + "\n")
            single_asm = single_asm.replace(old_label + " ;", new_label + " ;")
            if debug: print "old_label = " + old_label
            if debug: print "new_label = " + new_label
        #replace a text label
        elif " TextEndBattle" in line and not current_map_name in line:
            old_label = line.split("dw ")[1].split(" ;")[0]
            new_label = current_map_name + "EndBattleTxt" + str(trainer_header_counter) #trainer_header_name + "EndBattleText"
            single_asm = single_asm.replace(old_label + ":", new_label + ":")
            single_asm = single_asm.replace(old_label + "\n", new_label + "\n")
            single_asm = single_asm.replace(old_label + " ;", new_label + " ;")
            if debug: print "old_label = " + old_label
            if debug: print "new_label = " + new_label

        line_id += 1

    print single_asm

if __name__ == "__main__":
    analyze_incbins.load_asm()

    replace_trainer_header_labels()
    
