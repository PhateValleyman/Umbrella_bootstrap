for i in /data/data/com.termux/files/usr/etc/profile.d/*.sh; do
	if [ -r $i ]; then
		. $i
	fi
done
unset i

# Source etc/bash.bashrc and ~/.bashrc also for interactive bash login shells:
if [ "$BASH" ]; then
        if [[ "$-" == *"i"* ]]; then
                if [ -r /data/data/com.termux/files/usr/etc/bash.bashrc ]; then
                        . /data/data/com.termux/files/usr/etc/bash.bashrc
                fi
                if [ -r /data/data/com.termux/files/home/.bashrc ]; then
                        . /data/data/com.termux/files/home/.bashrc
                fi
        fi
fi

alias 'ls'='LC_ALL=C ls -1Ahv --color --show-control-chars --group-directories-first'
alias 'rm'='rm -R'
alias 'wol'='wol FC:F5:28:31:08:B1'
alias 'detach'='su -c sh /data/adb/modules/umbrella_module/detach.sh'
alias 'config'='su -c sh /data/adb/modules/umbrella_module/config.sh'
alias 'wget'='wget --show-progress --continue --tries=10'
alias 'tty-clock'='tty-clock -s -c -x -B -f dd-mm-yyyy'
alias 'gc'='git clone https://github.com/'

GH_TOKEN="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"
export GH_TOKEN

GH_BROWSER="elinks"
export GH_BROWSER

CLICOLOR="1"
export CLICOLOR

DEBUG="1"
export DEBUG

CLICOLOR_FORCE="1"
export CLICOLOR_FORCE

GH_CONFIG_DIR="/data/data/com.termux/files/usr/etc/gh"
export GH_CONFIG_DIR

CONFIG_SITE="/data/data/com.termux/files/usr/etc/config.site"
export CONFIG_SITE

INPUTRC="/data/data/com.termux/files/usr/etc/inputrc"
export INPUTRC

DIALOGRC="/data/data/com.termux/files/usr/etc/dialogrc"
export DIALOGRC

NANORC="/data/data/com.termux/files/usr/etc/nanorc"
export NANORC

DPKG_COLORS="always"
export DPKG_COLORS

DPKG_PAGER="less"
export DPKG_PAGER

PS1='\[\e[39m\]\[\e[39m\]\[\e[0;92m\]\h\[\e[0;1;91m\]$\[\e[0;38;5;190m\]\w\[\e[0;1;96m\]:\[\e[0m\]\[\e[0m\]\[\e[39m\]\[\e[0m\]\[\e[39m\]'
export PS1

CROSS_COMPILER="/data/data/com.termux/files/cross-compiler-armv5l/bin"
export CROSS_COMPILER

GO111MODULE="on"
export GO111MODULE

GOBIN="/data/data/com.termux/files/home/go/bin"
export GOBIN

PATH="/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/sbin:$GOBIN:$CROSS_COMPILER"
export PATH

GOROOT_BOOTSTRAP="/data/data/com.termux/files/home/go"
export GOROOT_BOOTSTRAP

GOPATH="/data/data/com.termux/files/home/go"
export GOPATH

GOMODCACHE="/data/data/com.termux/files/home/go/pkg/mod"
export GOMODCACHE

GOINSECURE="1"
export GOINSECURE

BAT_CONFIG_PATH="/data/data/com.termux/files/usr/etc/bat"
export BAT_CONFIG_PATH

BAT_PAGER=" "
export BAT_PAGER

#PATH='$PATH:$CROSS_COMPILER'
#export PATH

set PERL_READLINE_NOWARN

#-----------------------#
source /data/data/com.termux/files/usr/etc/lscolors.sh
#-----------------------#
