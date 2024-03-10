#!/bin/env /pyenv/bin/python3 

import argparse
import json
import libconf

ENDC = "\033[0m"
BOLD = "\033[1m"
UNDERLINE = "\033[4m"
BLACK = "\033[30m"
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
MAGENTA = "\033[35m"
CYAN = "\033[36m"
WHITE = "\033[37m"
BG_BLACK = "\033[40m"
BG_RED = "\033[41m"
BG_GREEN = "\033[42m"
BG_YELLOW = "\033[43m"
BG_BLUE = "\033[44m"
BG_MAGENTA = "\033[45m"
BG_CYAN = "\033[46m"
BG_WHITE = "\033[47m"

def json_to_libconfig(json_file, libconfig_file):
    try:
        with open(json_file, 'r') as f:
            data = json.load(f)
        converted_data = convert_data(data)
    except Exception as e:
        print(e)
        print(f"{RED}Error: Could not read input file '{json_file}'.{ENDC}")
        exit(1)

    try:
        with open(libconfig_file, 'w') as f:
            f.write(libconf.dumps(converted_data))
    except Exception as e:
        print(converted_data)
        print(e)
        print(f"{RED}Error: Could not write to output file '{libconfig_file}'.{ENDC}")
        exit(1)

def convert_data(data):
    if isinstance(data, dict):
        return {key: convert_data(value) for key, value in data.items()}
    elif isinstance(data, list):
        return tuple([convert_data(item) for item in data])
    else:
        return data

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert json to libconfig")
    parser.add_argument("i", help="JSON file to be converted")
    parser.add_argument("o", help="output file location")
    args = parser.parse_args()
    json_file = args.i
    libconfig_file = args.o
    json_to_libconfig(json_file, libconfig_file)
    print(f"{GREEN}Converted JSON to libconfig: {libconfig_file}{ENDC}")
