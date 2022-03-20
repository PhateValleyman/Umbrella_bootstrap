##################################################
######################### FUNCTIONS
#################### fix-shebang
#function fix-shebang(){
#    files=$(ls *.sh *.bash *.pl *.PL)
#    for file in "$files"; do
#        sed -i -E "1 s@^#\!(.*)/[sx]?bin/(.*)@#\!/ffp/bin/\2@" "$(realpath "${file}")"
#    done
#}
##################################################
######################### FUNCTIONS
#################### reboot
#function reboot() {
#    while true; do
#        read -r -p "Do you wish to reboot the system? (Y/N): " answer
#        case $answer in
#            [Yy]* ) reboot; break;;
#            [Nn]* ) exit;;
#            * ) echo "Please answer Y or N.";;
#        esac
#    done
#}
##################################################
######################### FUNCTIONS
#################### configure
#function perl() {
#		if [[ "Makefile.PL" == $2 ]];
#		then
#            if [[ -e /ffp/bin/perl ]]
#                then
#                echo -e "\033]0;Perl $(basename $PWD) \n $@\a"
#                echo -e "\e[0;1;38;5;40m"
#                /ffp/bin/perl "$@"
#                if [[ -e /ffp/bin/colormake ]];
#                then
#                    /ffp/bin/colormake
#                    /ffp/bin/colormake install
#                else
#                    /ffp/bin/make
#                    /ffp/bin/make install
#                fi
#                echo -e "\033]0; \a"
#                echo -e "\e[0m"
#            fi
#        fi
#}
##################################################
######################### FUNCTIONS
#################### configure
function autoreconf() {
	if [[ -e $PREFIX/bin/autoreconf ]]
	then
		echo -e "\033]0;Autoreconf $(basename $PWD)\a"
		echo -e "\e[01;36m"
		$PREFIX/bin/autoreconf "$@"
		echo -e "\033]0; \a"
		echo -e "\e[0m"
	fi
}
##################################################
######################### FUNCTIONS
#################### make
function make() {
	if [[ -e $PREFIX/bin/colormake ]];
	then
		echo -e "\033]0;Making $(basename $PWD)\a"
		$PREFIX/bin/colormake "$@"
		echo -e "\033]0; \a"
    else
		echo -e "\033]0;Making $(basename $PWD)\a"
		$PREFIX/bin/make "$@"
		echo -e "\033]0; \a"
    fi
}
##################################################
######################### FUNCTIONS
#################### pip
#function pip() {
#    if [[ "install" == $2 ]];
#    then
#        echo -e "\033]0;pip install $(basename $PWD) \n $@\a"
#        echo -e "\e[01;35m"
#        /ffp/bin/pip install "$@"
#        echo -e "\033]0; \a"
#        echo -e "\e[0m"
#    fi
#}
#function pip2() {
#    if [[ "install" == $2 ]];
#    then
#        echo -e "\033]0;pip2 install $(basename $PWD) \n $@\a"
#        echo -e "\e[01;35m"
#        /ffp/bin/pip2 install "$@"
#        echo -e "\033]0; \a"
#        echo -e "\e[0m"
#    fi
#}

#function pip3() {
#    if [[ "install" == $2 ]];
#	then
#        echo -e "\033]0;pip3 install $(basename $PWD) \n $@\a"
#        echo -e "\e[01;35m"
#        /ffp/bin/pip3 install "$@"
#        echo -e "\033]0; \a"
#        echo -e "\e[0m"
#    fi
#}
##################################################
######################### FUNCTIONS
#################### diff
function diff() {
	if [[ -e $PREFIX/bin/colordiff ]];
	then
		$PREFIX/bin/colordiff "$@"
    else
		$PREFIX/bin/diff "$@"
    fi
}
##################################################
######################### FUNCTIONS
#################### configure
function configure() {
	if [[ -e $PWD/configure ]]
	then
		echo -e "\033]0;$(basename $PWD) \n $@\a"
		echo -e "\e[01;33m"
		$PWD/configure "$@"
		echo -e "\033]0; \a"
		echo -e "\e[0m"
	fi
}
##################################################
######################### FUNCTIONS
#################### Chrome
function chrome(){
	if [ $# == 1 ]; then
		ssh -i ~/.ssh/keypair root@192.168.1.15 "su -c am start com.android.chrome >> /dev/null 2>&1"
		echo -e "Opening Chrome"
    fi
    if [ $# != 1 ]; then
        SITE="$1"
		ssh -i ~/.ssh/keypair root@192.168.1.15 "su -c am start -a android.intent.action.VIEW -d $SITE >> /dev/null 2>&1"
		echo -e "Opening $SITE"
		SITE=""
    fi
}
##################################################
######################### FUNCTIONS
#################### Upload
function ulozto(){
	url="$1"
	outFile=$(echo $url | cut -d /  -f 5- | tr / _)
	echo -e "\033]0;Uloz.to downloading\a"
        echo -e "Insert URL"
	read -ei "$url" sourceurl
	echo -e "Insert file name"
	read -ei "$outFile" filename
	command curl -# -k -o $filename --connect-timeout 60 -O -L --basic --user Jonas.Ned:24nascr $sourceurl
        echo -e "\033]0;  \a"
}
##################################################
######################### FUNCTIONS
#################### Dowmload SRC
function src(){
	url="$1"
	currdir="$PWD"
	cd /i-data/43d6b8c3/SRC/
	wget $url
	cd $currdir
}
##################################################
######################### FUNCTIONS
#################### WGET CURL Replace
#function wget(){
#    url="$1"
#    curl -k#LJO $url
#}
##################################################
######################### FUNCTIONS
#################### Upload
function upload() {
	read -ei "/sdcard/" phonedir
	echo -en "\033]0;Uploading $1\a"
	echo -e "Uploading $1"
	scp -i ~/.ssh/keypair $1 root@192.168.1.15:$phonedir
	echo -en "\033]0; \a"
}
##################################################
######################### FUNCTIONS
#################### Get
function get() {
	read -ei "/sdcard/Download/$1" phonefile
	echo -en "\033]0;Downloading $1\a"
	echo -e "Downloading $1"
	scp -i ~/.ssh/keypair root@192.168.1.15:$phonefile $PWD
	echo -en "\033]0; \a"
}
##################################################
######################### FUNCTIONS
#################### curl from phone
function sdcard() {
	if [ $# != 1 ]; then
		read -ei "" phonefile
		echo -en "\033]0;Downloading $phonefile\a"
		curl  --progress-bar 192.168.1.15:8080/$phonefile --output $phonefile
		echo -en "\033]0; \a"
	fi
	if [ $# == 1 ]; then
        phonefile="$1"
        echo -en "\033]0;Downloading $phonefile\a"
        curl  --progress-bar 192.168.1.15:8080/$phonefile --output $phonefile
        echo -en "\033]0; \a"
    fi
}
##################################################
######################### FUNCTIONS
#################### Download
function download() {
	url=$1
	filename=$(basename "$url")
	echo -e "Downloading $filename"
	ssh -tt -i ~/.ssh/keypair root@192.168.1.15 wget $url >> /dev/null 2>&1
	echo -e "Uploading $filename to Server"
	scp -i ~/.ssh/keypair root@192.168.1.15:/data/ssh/root/$filename $PWD
	echo -e "Removing $filename from SM-J600FN"
	ssh -tt -i ~/.ssh/keypair root@192.168.1.15 "rm -rf $filename" >> /dev/null 2>&1
	echo -e "Downloading complete"
}
##################################################
######################### FUNCTIONS
#################### Toast
function toasttest {
	read -ei "$1" toasted
    ##### printf -v __ %q "$1"
    ssh -tt -i ~/.ssh/keypair root@192.168.1.15 "toast '$toasted'"
}
##################################################
######################### FUNCTIONS
#################### Title
function title() {
	echo -en "\033]0;$@\a"
	echo -e "Title set to:\n'${Y}$@${N}'"
}
##################################################
######################### FUNCTIONS
#################### Public IP
function public() {
	server_ip="$(curl ifconfig.me 2> /dev/null)"
	echo -e "Public IP:\n'${Y}$server_ip${N}'"
	# printf "Server public ip4 %s\n" $server_ip
}
##################################################
######################### FUNCTIONS
#################### Compiler
function ffpcompiler() {( set -e
    #ledload stop
    stringVar=${PWD##*/}
    arrayVar=(${stringVar//-/ })
    PN=${arrayVar[0]}
    PV=${arrayVar[1]}
    PP=$PWD
    while [[ "$#" -gt 0 ]]
    do
      case $1 in
        conf)
          ##### configure
          ledload down_long
          printf "${V}"
          echo -en "\e]0;Configuring ${PWD##*/}\a"
          read -ei "--prefix=/ffp --sysconfdir=/ffp/etc --with-sysroot=/ffp --with-gnu-ld " cnf
          command `PKG_CONFIG="/ffp/bin/pkg-config" PKG_CONFIG_PATH="/ffp/share/pkgconfig" CC="gcc" CFLAGS="-I/ffp/include -O3" CFLAGS="-L/ffp/lib -Wl,-rpath,/ffp/lib" ./configure $cnf`
          printf "${N}"
          echo -en "\e]0;\a"
          echo -e "Compilation complete"
          ledload stop
          exit 0
          ;;
        make)
          ##### make
          ledload both_long
          printf "${Y}"
          echo -en "\e]0;Making ${PWD##*/}\a"
          colormake
          printf "${N}"
          echo -en "\e]0;\a"
          echo -e "Making complete"
          ledload stop
          exit 0
          ;;
        install)
          ##### install
          ledload both_short
          printf "${G}"
          echo -en "\e]0;Installing ${PWD##*/}\a"
          colormake install
          printf "${N}"
          echo -en "\e]0;\a"
          echo -e "Installing complete"
          ledload stop
          exit 0
          ;;
        make_pkg)
          ##### make package
          ledload up_short
          printf "${Y}"
          echo -en "\e]0;Making package ${PWD##*/}.txz\a"
          mkdir -p $PP/pkg
          colormake DESTDIR=$PP/pkg install
          cd $PP/pkg
          /ffp/sbin/makepkg $PN $PV 1
          mv /tmp/$PN-$PV-arm-1.txz /i-data/43d6b8c3/packages/
          printf "${N}"
          echo -en "\e]0;\a"
          echo -e "Package complete"
          ledload stop
          exit 0
          ;;
      esac
      shift
    done
	##### configure
	ledload down_long
	printf "${V}"
    echo -en "\e]0;Configuring ${PWD##*/}\a"
	read -ei "--prefix=/ffp --sysconfdir=/ffp/etc --with-sysroot=/ffp --with-gnu-ld " cnf
    #read -ei "--prefix=/ffp --sysconfdir=/ffp/etc --disable-static " cnf
	command `PKG_CONFIG="/ffp/bin/pkg-config" PKG_CONFIG_PATH="/ffp/share/pkgconfig"CFLAGS="-I/ffp/include -O3" CFLAGS="-L/ffp/lib -Wl,-rpath,/ffp/lib" ./configure $cnf`
    #command ./configure $cnf
    ledload stop
    ##### make
    ledload both_long
    printf "${Y}"
    echo -en "\e]0;Making ${PWD##*/}\a"
    colormake
    ledload stop
    ##### install
    ledload both_short
    printf "${G}"
    echo -en "\e]0;Installing ${PWD##*/}\a"
    colormake install
    ledload stop
    ##### make package
    ledload up_short
    echo -en "\e]0;Making package ${PWD##*/}.txz\a"
    mkdir -p $PP/pkg
    colormake DESTDIR=$PP/pkg install
    cd $PP/pkg
    /ffp/sbin/makepkg $PN $PV 1
    printf "${N}"
    ledload stop
    ##### post-install
    setLED COPY ORANGE BLINK
    printf "${N}"
    mv /tmp/$PN-$PV-arm-1.txz /i-data/43d6b8c3/packages/
    echo -en "\e]0;\a"
    echo -e "Compilation complete"
    printf "To: Jonas.Ned@outlook.com\nFrom: Jonas.Ned@outlook.com\nSubject:Compilation\n\n $PWD \n\n COMPLETE..." | msmtp Jonas.Ned@outlook.com
    md5
    setLED COPY OFF
    exit 0
)}
##################################################
######################### FUNCTIONS
#################### md5sum
function md5 {
	echo -e "Calculatim md5sum for packages..."
	LOCATION=$PWD
	chmod 755 /i-data/md1/packages/Mijzelf/make_md5sum.sh /i-data/md1/packages/br2/make_md5sum.sh /i-data/md1/packages/uli/make_md5sum.sh /i-data/md1/packages/xxx/make_md5sum.sh
	#echo -e "\033]0;Calculating md5sum\a"
	#cd /i-data/43d6b8c3/packages/
	#chmod 755 make_md5sum.sh
	#sh make_md5sum.sh
	#echo -e "Calculatim md5sum for official..."
	#cd /i-data/43d6b8c3/official/
	#chmod 755 make_md5sum.sh
	#sh make_md5sum.sh
	#echo -e "Calculatim md5sum for ffpbuildenv..."
	cd /i-data/md1/packages/Mijzelf/
	sh make_md5sum.sh
	cd /i-data/md1/packages/br2/
	sh make_md5sum.sh
	cd /i-data/md1/packages/uli/
	sh make_md5sum.sh
	cd /i-data/md1/packages/xxx/
	sh make_md5sum.sh
	#cd /usr/local/zy-pkgs/ffproot/ffp/home/root/last/
	#sh make_md5sum.sh
	cd $LOCATION
	echo -e "md5sum calculated, updating slacker database..."
	slacker -U
	echo -e "Slacker updated"
	echo -e "\033]0; \a"
}
##################################################
######################### FUNCTIONS
#################### Extract
BANNER=$(echo -e "
----------------------------------------
××××××××××     ${C}EXTRACTOR${N}     ×××××××××××
----------------------------------------
××××   ${Y}zip rar bz2 gz tar tbz2 tgz ${N} ××××
×××  ${Y}7z xz ex tar.bz2 tar.gz tar.xz${N}  ×××
----------------------------------------
×××××  extract [${R}path/file_name${N}]  ×××××××
×××××  extract [${R}1.ext${N}] [${R}2.ext${N}]  ××××××××
----------------------------------------
")
SAVEIFS=$IFS
IFS="$(printf '\n\t')"
function extract {
	echo -en "\e]0;Extracting $1$n\a"
	if [ -z "$1" ]; then
    printf "${BANNER}\n"
    else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
               tar xvf "$n"
               ;;
            *.lzma)      
               unlzma ./"$n"
               ;;
            *.bz2)      
               bunzip2 ./"$n"
               ;;
            *.cbr|*.rar)      
               unrar x -ad ./"$n" 
               ;;
            *.gz)              
               gunzip ./"$n"      
               ;;
            *.cbz|*.epub|*.zip)       
               unzip ./"$n"       
               ;;
            *.z)               
               uncompress ./"$n"  
               ;;
            *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
               7z x ./"$n"        
               ;;
            *.xz)              
               unxz ./"$n"        
               ;;
            *.exe)             
               cabextract ./"$n"  
               ;;
            *.cpio)            
               cpio -id < ./"$n"  
               ;;
            *.cba|*.ace)       
               unace x ./"$n"      
               ;;
            *.zpaq)            
               zpaq x ./"$n"      
               ;;
            *.arc)             
               arc e ./"$n"       
               ;;
            *.cso)             
               ciso 0 ./"$n" ./"$n.iso" && \
               extract $n.iso && \rm -f $n 
               ;;
            *)
               printf "\n${BANNER}"
               echo -e "extract: '${C}$n${N}' - ${R}unknown archive method${N}"
               return 1
               ;;
          esac
          printf "\n${BANNER}\n"
          echo -en "\e]0;\a"
          echo -e "\n\t\t${G}FINISH\n${N}\n\t${Y}\t$n\n"
#####          read -ei "$n" newfilename
#####          command cd $(pwd)/$newfilename/
#####          ls
      else
          printf "\n${BANNER}\n"
          echo -e "\n\t'${C}$n${N}' - ${R}DOES NOT EXIST!!!${N}\n"
          return 1
      fi
    done
fi
}
IFS=$SAVEIFS
##################################################
######################### FUNCTIONS
#################### Trap Error
# Custom error handle
handle_error ()
{
    status=$?;
    last_call=$1;
    (( status != 127 )) && return;
    echo -e "${C}'${Y}$last_call${C}'${N} ${R}Not found...${N}";
    return
}
trap 'handle_error "$_"' ERR
##################################################
######################### FUNCTIONS
#################### Command not found
function command_not_found_handle {
	if [ -x $PREFIX/lib/command-not-found ]; then
       $PREFIX/lib/command-not-found -- "$1"
       return $?
    elif [ -x $PREFIX/share/command-not-found/command-not-found ]; then
       $PREFIX/share/command-not-found/command-not-found -- "$1"
       return $?
    else
       return 127
    fi
}
##################################################
######################### FUNCTIONS
#################### Rename
function rename() {
  if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
    command mv "$@"
    return
    fi
  read -ei "$1" newfilename
  command mv -v -- "$1" "$newfilename"
}
##################################################
######################### FUNCTIONS
#################### Dups
remove_dups() {
    local D=${2:-:} path= dir=
    while IFS= read -d$D dir; do
        [[ $path$D =~ .*$D$dir$D.* ]] || path+="$D$dir"
    done <<< "$1$D"
    printf %s "${path#$D}"
}
##################################################
function archive() {
	tempfile=$PREFIX/tmp/archive.tmp
	touch $tempfile
	if [[ -n $1 ]]; then
		folder=$1
		echo -e "$folder" >> $tempfile
	else
		echo -e "Select folder to archive:"
		read -ei "" folder
		echo -e "$folder" >> $tempfile
	fi
	echo -en "\033]0;Archiving $tempfile\a"
	echo -e "Archiving folder ${Y}$tempfile${N}"
	(tar cf - $folder | pv -n -s $(du -sb $folder | awk '{print $1}') | gzip > $folder.tar.gz) 2>&1 | dialog --gauge 'Archiving $(cat $tempfile)...' 7 70 || tar cf - $folder | pv -s $(du -sb $folder | awk '{print $1}') | gzip > $folder.tar.gz || tar cf - $folder | gzip > "$folder.tar.gz" && \
	echo -e "${Y}$folder.tar.gz${N} created..."
	rm -R $tempfile
	chmod 644 $folder.tar.gz
	echo -en "\033]0; \a"
}

##################################################

#  Attaches to the first Detached Screen. Otherwise starts a new Screen.

# Only run if we are not already inside a running screen and only if in an SSH session.
#if [[ -z "${STY}" && ! -z "${SSH_CLIENT}" ]]; then
#  detached_screens=($(screen -ls | grep pts | grep -v Attached))
#
#  for screen in "${detached_screens[@]}"; do
#    if [[ "${screen}" == *".pts"* ]]; then
#      IFS='.pts' read -ra split <<< "${screen}"
#      for id in "${split[@]}"; do
#        first_id="${id}"
#        break
#      done 
#      break
#    fi
#  done

#  screen -R $first_id
#fi

##################################################
function cpv()
{
  local DST=${@: -1}                    # last element
  local SRC=( ${@: 1 : $# - 1} )        # array with rest of elements

  # checks
  type pv &>/dev/null || { echo "install pv first"; return 1; }
  [ $# -lt 2  ]       && { echo "too few args"    ; return 1; }

  # special invocation
  function cpv_rename()
  {
    local SRC="$1"
    local DST="$2"
    local DSTDIR="$( dirname "$DST" )"

    # checks
    if   [ $# -ne 2     ]; then echo "too few args"          ; return 1; fi
    if ! [ -e "$SRC"    ]; then echo "$SRC doesn't exist"    ; return 1; fi
    if   [ -d "$SRC"    ]; then echo "$SRC is a dir"         ; return 1; fi
    if ! [ -d "$DSTDIR" ]; then echo "$DSTDIR does not exist"; return 1; fi

    # actual copy
    echo -e "\n$SRC 🡺  $DST"
    pv   "$SRC" >"$DST"
  }

  # special case for cpv_rename()
  if ! [ -d "$DST" ]; then cpv_rename "$@"; return $?; fi;

  # more checks
  for src in "${SRC[@]}"; do 
    local dst="$DST/$( basename "$src" )"
    if ! [ -e "$src" ]; then echo "$src doesn't exist" ; return 1;
    elif [ -e "$dst" ]; then echo "$dst already exists"; return 1; fi
  done

  # actual copy
  for src in "${SRC[@]}"; do 
    if ! [ -d "$src" ]; then 
      local dst="$DST/$( basename "$src" )"
      echo -e "\n$src 🡺  $dst"
      pv "$src" > "$dst"
    else 
      local dir="$DST/$( basename "$src" )"
      mkdir "$dir" || continue
      local srcs=( $src/* )
      cpv "${srcs[@]}" "$dir";
    fi
  done
  unset cpv_rename
}


##################################################
######################### FUNCTIONS
#################### Spinner
spinner()
{
    local pid=$!
    local delay=0.25
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
