#!/bin/bash
set -e
[[ ${DEBUG} == true ]] && set -x

#set -x

# Including configurations
. config.sh


docker stats --all

################################################################################
