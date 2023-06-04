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
	if grep -q ${3} ${1}; then
		echo "${3} is already setup"
	else
		echo "writing to ${1}"
		echo -e "\n${2}\n" >> ${1}
		echo "done writing ${1}"
	fi
}

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


### vimrc
SCRIPT="${SCRIPT_DIR}/vimrc"
addf "${HOME}/.vimrc" ":if filereadable(expand(\"${SCRIPT}\")) \n\t:source ${SCRIPT}\n:endif" ${SCRIPT}

### bashrc
SCRIPT="${SCRIPT_DIR}/bashrc"
addf "${HOME}/.bashrc" "if [[ -f ${SCRIPT} ]]; then \n\t source ${SCRIPT} \nfi" ${SCRIPT}

### zshrc
SCRIPT="${SCRIPT_DIR}/bashrc"
addf "${HOME}/.zshrc" "if [[ -f ${SCRIPT} ]]; then \n\t source ${SCRIPT} \nfi" ${SCRIPT}

### tmux.conf
SCRIPT="${SCRIPT_DIR}/tmux.conf"
addf "${HOME}/.tmux.conf" "source-file ${SCRIPT}" ${SCRIPT}




