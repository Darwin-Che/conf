ucs='z4che@linux.student.cs.uwaterloo.ca'
dbcs='z4che@ubuntu2004-002.student.cs.uwaterloo.ca'
cs008='z4che@ubuntu2004-008.student.cs.uwaterloo.ca'

alias g++17='g++ -std=c++17'

alias rm='rm -iR'
if [[ $(uname) = 'Linux' ]] ; then
alias lstemp='cat /sys/class/thermal/thermal_zone*/temp'
fi

SHELLNAME=$(basename ${SHELL})

if [[ ${SHELLNAME} = 'zsh' ]]; then
	NL=$'\n'
	export PS1="${NL}%~${NL}%n %# "
elif [[ ${SHELLNAME} = 'bash' ]]; then
	export PS1="\u:\w $ "
fi

# start the shadowsocks local

# pushd ~/.shadowsocks
# ss-local -c ss.conf -d start & 
# popd

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# For macos : brew install zlib sqlite
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"
# echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.zshrc




