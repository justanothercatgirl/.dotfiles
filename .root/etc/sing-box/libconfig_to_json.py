#!/bin/env /pyenv/bin/python3

import argparse
import json
from libconf import load

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

def convert_libconf_to_json(input_file, output_file):
    try:
        with open(input_file, 'r') as f:
            config = load(f)
    except Exception as e:
        print(e)
        print(f"{RED}Error: Could not read input file '{input_file}'.{ENDC}")
        exit(1)

    json_data = _convert_data(config)
  
    try:
        with open(output_file, 'w') as f:
            json.dump(json_data, f, indent=4)
    except Exception as  e:
        print(e)
        print(f"{RED}Error: Could not write to output file '{output_file}'.{ENDC}")
        exit(1)

    print(f"{GREEN}Successfully converted '{input_file}' to '{output_file}'.{ENDC}")


def _convert_data(data):
    if isinstance(data, dict):
        return {key: _convert_data(value) for key, value in data.items()}
    elif isinstance(data, list):
        return [_convert_data(item) for item in data]
    else:
        return data


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert libconfig file to JSON")
    parser.add_argument("i", help="Path to the libconfig file")
    parser.add_argument("o", help="Path to the output JSON file")
    args = parser.parse_args()
    convert_libconf_to_json(args.i, args.o)
