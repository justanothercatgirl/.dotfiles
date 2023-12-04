#!/bin/bash

set -e

sudo zerotier-one -d

sudo zerotier-one -d
sudo zerotier-cli info

read

sudo zerotier-cli join 8056c2e21c2fbaef 
