import json

import analyze_incbins
analyze_incbins.scan_for_predefined_labels()

with open('../pokered.sym', 'w') as sym:
    for label in json.load(open('labels.json')):
        sym.write('{0:x}:{1} {2}\n'.format(label['bank_id'], label['local_pointer'][1:], label['label']))
