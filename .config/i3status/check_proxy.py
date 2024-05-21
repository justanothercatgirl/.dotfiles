#!/usr/bin/env /usr/bin/python3

import os
import json
import requests 

def check_proxy():
    return os.getenv("PROXY_ON_JCG") != None or os.getenv("HTTP_PROXY") != None or os.getenv("HTTPS_PROXY") != None

def extract_address():
 return os.getenv("HTTPS_PROXY")[8:-5]

def get_public_ip():
 return requests.get("https://api.ipify.org/").text

if __name__ == "__main__":
 if check_proxy():
  output_string = {
   "full_text": f"󰒒 {extract_address()}",
   "color": "#00FF00",
  }
 else:
  output_string = {
   "full_text": f"󰒒 N/A",
   "color": "#FF0000",
  }
 print(json.dumps(output_string))
