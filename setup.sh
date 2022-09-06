#!/bin/bash

### helper functions

## touch file if not exists
# param
# file_path
# command to add
function addf() {
	if [[ ! -f ${1} ]]; then
		echo "creating ${1}"
		touch ${1}
	fi
	echo "writing to ${1}"
	echo -e "\n${2}\n" >> ${1}
	echo "done writing ${1}"
}

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


### vimrc
SCRIPT="${SCRIPT_DIR}/vimrc"
addf "${HOME}/.vimrc" ":if filereadable(expand(\"${SCRIPT}\")) \n\t:source ${SCRIPT}\n:endif" 

### bashrc
SCRIPT="${SCRIPT_DIR}/bashrc"
addf "${HOME}/.bashrc" "if [[ -f ${SCRIPT} ]]; then \n\t source ${SCRIPT} \nfi"

### zshrc
SCRIPT="${SCRIPT_DIR}/bashrc"
addf "${HOME}/.zshrc" "if [[ -f ${SCRIPT} ]]; then \n\t source ${SCRIPT} \nfi"





