#!/bin/bash

cd "$(dirname "$0")"

PATHJOY=$(pwd)

source ${PATHJOY}/generate_logs_file.sh
source ${PATHJOY}/generate_html_file.sh
source ${PATHJOY}/cronfig.sh