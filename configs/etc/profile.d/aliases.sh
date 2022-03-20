##################################################
######################### Aliases
#alias cp='cp -gR'
#alias mv='mv -g'
#alias dfc='dfc -f'
#alias make='colormake'
#alias apps='cd /i-data/43d6b8c3/appmgr/gsrc'
alias rm='rm -R'
#alias cat='ccat'
alias 'tree'='tree -AC --dirsfirst'
alias nano='$PREFIX/bin/nano'


#alias compile='cd /i-data/43d6b8c3/COMPILER/COMPILER'
#alias compiler="sh /i-data/43d6b8c3/COMPILER/COMPILER/ffp-compiler.sh"
#alias ldconfig='ldconfig /ffp/lib'
#alias setup='nano /ffp/etc/profile'
#alias sources='cd /ffp/home/root/sources'

#alias admin="cd /i-data/md0/admin"
alias ffp="cd /ffp/"
#alias SM-J600FN="cd /i-data/md1/SM-J600FN"
#alias pages="cd /ffp/opt/srv/www/pages"
#alias packages="cd /i-data/43d6b8c3/packages"
#alias sources="cd /i-data/43d6b8c3/SRC"

#alias ls='ls -a -1 --group-directories-first --color=auto'
alias ls='LC_ALL=C ls -1Ahv --color --show-control-chars --group-directories-first'
alias lsp='ls -a -1 --color -d "$PWD"*'
alias ..='cd ..'
alias ...='.. && ..'
alias ....='... && ..'
alias .....='.... && ..'
alias ......='..... && ..'

alias grep='grep --color=always'

alias sshphone='ssh -i ~/.ssh/keypair root@192.168.1.15'
alias sshserver='ssh -i ~/.ssh/keypair root@192.168.1.20'
alias telnetserver='telnet 192.168.1.20'

#alias mail='cat /ffp/etc/msmtp/mail.txt | msmtp --file=/ffp/etc/msmtp/msmtp.conf --read-recipients && echo "E-Mail Send..."'
#alias complete='cat /ffp/etc/msmtp/complete.txt | msmtp --file=/ffp/etc/msmtp/msmtp.conf --read-recipients && echo "E-Mail Send..."'

alias now='date +"%n[%d.%m.%Y]%n[%H:%M:%S]%n"'

#alias sshstart="sh /ffp/start/sshd.sh start"
#alias sshrestart="sh /ffp/start/sshd.sh restart"
#alias sshstop="sh /ffp/start/sshd.sh stop"

#alias telnetstart="sh /ffp/start/telnetd.sh start"
#alias telnetrestart="sh /ffp/start/telnetd.sh restart"
#alias telnetstop="sh /ffp/start/telnetd.sh stop"

#alias reboot='setLED SYS ORANGE FAST_BLINK && setLED HD ORANGE FAST_BLINK && setLED ESATA ORANGE FAST_BLINK && setLED COPY ORANGE FAST_BLINK && clear && echo "NSA320 REBOOTING!!!" && /sbin/reboot'
alias reload='source $PREFIX/etc/profile'
alias setup='nano $PREFIX/etc/profile'
alias config='su -c sh ~/.termux/config.sh'

alias mix='ssh -i ~/.ssh/keypair root@192.168.1.15 "am start com.mixplorer.silver/com.mixplorer.activities.BrowseActivity >> /dev/null 2>&1"' 
alias store='ssh -i ~/.ssh/keypair root@192.168.1.15 "am start com.android.vending >> /dev/null 2>&1"'

##### alias chrome='ssh -i ~/.ssh/keypair root@192.168.1.15 "am start com.android.chrome >> /dev/null 2>&1"'

##################################################
