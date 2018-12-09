#!/bin/bash 
echo '

Hello World

    1. Copy and paste one of the commands into the terminal.
Change the information to match your computer.
    2. Make this file executable. 
chmod -x cli.text
    3. Edit the file to comment out this echo command.
Type "#" to front of echo on the second line.
    4. Uncomment one of the commands. 
Remove #$> from front of the command.
    5. Run this files as an executable.
./cli.sh
    6. somethingcool.jpg
Type command.
    7. Profit!
'
<<COMMENT1
#######################################################################
# This is a project to learn the fun of the command line interface.   #
#######################################################################
####################################################
#            Draft  http://ix.io/yaV               #
####################################################

    ▬▬▬▬▬▬▬▬▬▬ஜ۩☆۩ஜ▬▬▬▬▬▬▬▬▬
  ☆☆command☆☆line☆☆interface☆☆ 
    ▬▬▬▬▬▬▬▬▬▬ஜ۩☆۩ஜ▬▬▬▬▬▬▬▬▬﻿

███████████████
█   clicool   █
███████████████

COMMENT1
############################################################
#                     Command-Line Linux:                  #
############################################################
## Compiled by sflaptop@gmail.com
###########################################################
#                   Table Of Contents                     #
###########################################################
## 
#$   Information
#$   Setup
#$   Networking
#$   Use
#$      Sound
#$      Video
#$   bash info
#$       Pipes
#$      .bashrc
#$          Settings
#$          Functions
#$          Aliases
#$   Framebuffer
#$   DANGER
#$   Python Stuff 
#$   Extra Characters
#$   GUI Control
#$   Unsorted
#$
#$
#$
#$
## 
###########################################################
#               END Table Of Contents                     #
###########################################################
## 
## 
## 
########################################################## 
#                     Information                        #
########################################################## 
## Computer information:
$> sudo dmidecode | grep -A4 'Base Board'
$> cat /proc/cpuinfo | egrep "model name|MHz"
$> cat /proc/cpuinfo
$> cat /proc/meminfo                                ## RAM info
$> dbus-uuidgen                                     ## Outputs machine ID
$> lspci                                            ## List devices on the pci bus 
$> lsusb                                            ## List devices on the usb bus 
$> sudo blkid                                       ## List harddrive uuid
$> lsblk -f                                         ## List the partitions, -f Output info about filesystems.
$> lscpu                                            ## List cpu info
$> lshw                                             ## List hardware info
$> vmstat -s                                        ## RAM info
$> lstopo                                           ## Draw machine architecture
$> dmesg                                            ## Examine or control the kernel ring buffer
$> sudo iotop -o                                    ## Shows what files are accessing hard drive
$> lsmod                                            ## List loaded modules
$> lsof                                             ## List open files 
$> lsof -n                                          ## List open files 
$> pstree                                           ## Tree view of processes 
$> top                                              ## Show running processes
$> iotop                                            ## Show i/o of data to and from harddrives
$> initctl list                                     ## List all services
$> env                                              ## List Environmental variables
$> shopt                                            ## Shell Options, Change the setting of each shell option: help shopt
$> who -r                                           ## Current run level
$> mount | column -t                                ## List mounted files system in columns
$> echo $DISPLAY                                    ## Display tty in use, :0.0 is first available tty7, :1.0 second available tty8 or tty9, if remote X then :IPaddress:0
$> xdpyinfo                                         ## Info about current X server display
$> xwininfo                                         ## Info about whatever window is click after command is run
$> du -h --max-depth=1                              ## Show size of sub-folders within the current directory
$> history                                          ## List commands which have run in terminal
$> stat filename.typ                                ## Get information about file or directory
$> cat /proc/loadavg                                ## Average system load
$> cat /proc/meminfo                                ## Memory info
$> dpkg -S boing.wav                                ## See what package a file belong to
$> cat /proc/sys/vm/swappiness                      ## Check how much swapping data RAM to swap partition, 1-100; 1-preferRAM to 100-preferDisk 
$> uname -p                                         ## 32 bits or 64 bits? 
$> inxi -F                                          ## Outputs an assortment of system information# Get full from half remembered commands
$> apropos <part_rember> | less                     ## Searches through man pages
$> apt-show-versions                                ## Show version of installed applications
$> dpkg -l | grep '^i' | awk '{print $2}' | sort    ## Print sorted list of all installed packages (Debian)  
##==========================================
## System files
$> cat /etc/group                                   ## Show available groups and members of groups
$> cat /etc/fstab                                   ## Show file system table mounted at startup
##==========================================
## System logs
$> cat /var/log/syslog                              ## Try other log files auth.log 
$> tail -n 20 /var/log/syslog                       ## Read last 20 entries in system logs
$> watch -d tail /var/log/syslog                    ## Watch system logs
## Show all logs in /var/log
$> find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f
##==========================================
## Check the status of services
$> service --status-all
##==========================================
## Show installed but unused linux headers, image, or modules
$> dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'                                         
##==========================================
## Show drive names next to their full serial number (and disk info)
$> find /dev/disk/by-id -type l -printf "%l\t%f\n" | cut -b7- | sort
##==========================================
## List files and directories in present directory
$> tree -i -L 1
##==========================================
## Files and directories by size
$> du -sk ./* | sort -n | awk 'BEGIN{ pref[1]="K"; pref[2]="M"; pref[3]="G";} { total = total + $1; x = $1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf("%g%s\t%s\n",int(x*10)/10,pref[y],$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf("Total: %g%s\n",int(total*10)/10,pref[y]); }'
##==========================================
## Resource Monitoring system in one line
## DISK : disk space, MEM: memory ( mem , swap, Total) ,CPU : all information about cpu activity, LOAD : load average
$> echo "DISK:";df  -Pl | grep -v "Filesystem" | awk '{print $5,$6}' ; echo "MEM:" ; free -mto | awk '{ print $1,$2,$3,$4 }'; echo "CPU:"; top -b -d1 -n1 | grep Cpu |  awk '{print $2,$3,$4,$5,$6,$7,$8,$9}';echo "LOAD:"; cat /proc/loadavg
##==========================================
## http://danielmiessler.com/study/lsof/
## lsof is the Linux/Unix command with the most switches. It has so many it has to use both pluses and minuses.
## Show all connections with -i
$> lsof -i
## Pointing to a file shows what's interacting with that file
$> lsof /var/log/syslog
## Show what a given user has open using -u
$> lsof -u USERNAME
## You can also use the -t with -u to kill everything a user has open
$> kill -9 `lsof -t -u USERNAME`
##==========================================
## print the directory structure from the current directory in tree format. 
$> tree
$> find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
##==========================================
## Print sorted list of all installed packages (Debian)
$> dpkg -l | grep '^i' | awk '{print $2}' | sort
##==========================================
## List of most used commands
$> history | sed 's/sudo//g'| awk '{print $2}'|sort|uniq -c|sort -rn|head -30|awk '!max{max=$1;}{r="";i=s=100*$1/max;while(i-->0)r=r"#";printf "%50s %5d %s %s",$2,$1,r,"\n";}'
##==========================================
## Get creation date of a file on ext2-3-4 fs
## Return the creation date of a file on ext2, 3, 4 filesystems, because stat command wont show it.
$> debugfs -R  "stat <$(stat --printf=%i filename)>" /dev/sdaX | grep crtime
##==========================================
## du with colored bar graph with reversed order to put the focus in the big ones.
$> du -x --max-depth=1|sort -rn|awk -F / -v c=$COLUMNS 'NR==1{t=$1} NR>1{r=int($1/t*c+.5); b="\033[1;31m"; for (i=0; i<r; i++) b=b"#"; printf " %5.2f%% %s\033[0m %s\n", $1/t*100, b, $2}'|tac
##==========================================
## Show gui display dimensions
$> xdpyinfo | grep dimensions
##==========================================
## Get the size of all the directories in current directory (Sorted Human Readable)
$> du -sh */
##==========================================
## Running info on network and disks
$> sudo apt-get install dstat
$> dstat
##==========================================
## Show current colors set for displaying different file types
$> eval $(echo "rs:global default;fi:normal file;di:directory;ln:symbolic link;pi:named pipe;so:socket;do:door;bd:block device;cd:character device;or:orphan symlink;mi:missing file;su:set uid;sg:set gid;tw:sticky other writable;ow:other writable;st:sticky;ex:executable;"|sed -e 's/:/="/g; s/\;/"\n/g') && { IFS=:; for i in $LS_COLORS; do echo -e "\e[${i#*=}m$( x=${i%=*}; [ "${!x}" ] && echo "${!x}" || echo "$x" )\e[m"; done; }
##==========================================
##==========================================
##  ########################################################## 
##  #                    END Info                            #
##  ########################################################## 
##  
## 
##   
##  ########################################################## 
##  #                       Setup                            #
##  ##########################################################
##========================================== 
## See .bashrc at end of file
##==========================================
### Apple Air 2013  
## Network controller: Broadcom Corporation BCM4360 802.11ac Wireless Network Adapter. https://askubuntu.com/questions/55868/installing-broadcom-wireless-drivers
## Can use gui driver manager
## or
$> sudo apt-get install bcmwl-kernel-source 
## Could need firmware installer as well.
$> sudo apt-get install firmware-b43-installer
$> sudo apt-get install --reinstall bcmwl-kernel-source
## In some particular cases, after installing the firmware-b43-installer you need to remove the b43 module.
#> sudo modprobe -r b43
#> sudo modprobe b43    
#> sudo rfkill unblock all 
##----------------------------------------------
## Multimedia controller: Broadcom Corporation 720p FaceTime HD Camera
## https://gist.github.com/Stono/990ea9f0b3c41606c292f00382d421bf
## https://github.com/patjak/bcwc_pcie/wiki/Get-Started#get-started-on-debian
## https://karlstoney.com/2017/02/27/facetimehd-camera-on-linux/
## Firmware extraction
## Download the driver (zip version) and extract it by following these steps:
## Clone the git repository with 
$> git clone https://github.com/patjak/bcwc_pcie.git
## Change to the firmware directory with 
$> cd bcwc_pcie/firmware
## Dependencies for make are curl, xzcat and cpio
##     Under bcwc_pcie/firmware type $ make and then as root type # make install
##     Result should be like:
$> make
#> Dowloading the driver, please wait...
#>Found matching hash from OS X, El Capitan 10.11.2
#> ==> Extracting firmware...
#> --> Decompressing the firmware using gzip...
#> --> Deleting temporary files...
#> --> Extracted firmware version 1.43.2
$> make install
#> -->Copying firmware into '/usr/lib/firmware/facetimehd'
##----------------------------------------------
##==========================================
## Drop into command line only environment
$> sudo service mdm stop
## To get back into the gui
$> sudo service mdm start
##==========================================
## Command line only login
## Change /etc/default/grub
$> sudo sed -i 's:quiet splash:quiet text:' /etc/default/grub
$> sudo update-grub
$> sudo reboot
## To start the gui
$> sudo service mdm start
## To drop out of the gui back to commandline.
$> sudo service mdm stop
##------------------------------------------
## Auto Login to X, reverse above
$> sudo sed -i 's:quiet splash:quiet text:' /etc/default/grub
$> sudo update-grub
$> sudo reboot
##==========================================
## Update ppa repository
$> sudo add-apt-repository ppa:<repository-name> 
$> sudo apt-get update
##==========================================
## Remove a PPA from the source list in terminal:
## Remove the PPA from sources list where these PPAs are stored. PPAs are store in the form of PPA_Name.list. Use the following command to see all the PPAs added in your system:
$> sudo ls /etc/apt/sources.list.d
## Look for your desire PPA here and then remove the PPA using the following command:
$> sudo rm -i /etc/apt/sources.list.d/PPA_Name.list
##==========================================
## Export $PATH
$> export PATH=$PATH:/path/to/bin 
$> sudo apt-get update
##==========================================
##  Replace /etc/hosts with adblocking hosts file 
$> wget http://ix.io/1K6b
%> sudo cp /etc/hosts /etc/hosts.default
$> sudo cp 1K6b /etc/hosts
##==========================================
## Software to have fun in command line
$> sudo apt-get install tmux                         ## ctrl+b then after press; % for vertical split, " for horizontal split, arrows to move curser, x to close
$> sudo apt-get install gpm                          ## command line mouse; sudo /etc/init.d/gpm start
$> sudo apt-get install mc                           ## ncurses file browser editor
$> sudo apt-get install lynx-cur                     ## Web browser
$> sudo apt-get install elinks                       ## ncurses web browser,'o' OptionsManager>Document>Browsing>DocumentMetaRefresh>Change to "0"
$> sudo apt-get install wget                         ## Download files URLs from a text file one url per line -i dl.txt
$> sudo apt-get install cmus                         ## ncurses Music player :add ~/Music, 1-player, 7-help, c-pause, b-next, s-shuffle
$> sudo apt-get install cclive                       ## Download youtube videos  cclive <URL>
$> sudo apt-get install mplayer                      ## Media Player with codecs -vo caca for ascii
$> sudo apt-get install vlc                          ## Media Player with codecs cvlc
$> sudo apt-get install caca-utils                   ## image to ascii cacaview
$> sudo apt-get install iotop                        ## Process viewer
$> sudo apt-get install curl                         ## Web data transfer
$> sudo apt-get install netcat                       ## Netcat gives nc concatenates web sockets
$> sudo apt-get install sc                           ## Spreadsheet <text, =number, =formula, =@sum(C44:C47), P file.sc, "S tblstyle=0" "T filename.cln"
$> sudo apt-get install youtube-dl                   ## Download youtube videos
$> sudo apt-get install quvi                         ## Media Stream Downloader
$> sudo apt-get install mpg123                       ## mp3 player
$> sudo apt-get install ogg123                       ## ogg player
$> sudo apt-get install imagemagick                  ## Image manipulator
$> sudo apt-get install iotop                        ## harddrive i/o
$> sudo apt-get install fbi                          ## Framebuffer image viewer for tty login only, NO X gui running
$> sudo apt-get install fbterm                       ## Framebuffer terminal
$> sudo apt-get install w3m w3m-img                  ## Web browser with images. B back, U url, q quit, 
$> sudo apt-get install flac                         ## flac codecs
$> sudo apt-get install lame                         ## mp3 codecs
$> sudo apt-get install 
$> wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest_cli.py
##-----------------------------------------
## Install oneliner for a few command line tools
$> sudo apt-get install mc cmus gpm elinks imagemagick iotop caca-utils mplayer arp-scan nmap curl dstat finger surfraw w3m w3m-img at sc youtube-dl vlc tmux fbi fbterm build-essential hexcurse lynx-cur espeak mpg123 netcat
##-----------------------------------------
## Install ssh server
$> sudo apt-get install openssh-server openssh-client openssh-sftp-server
##-----------------------------------------
## Install sublime
$> sudo apt-get install sublime-text
## 
##==========================================
## Install ffmpeg
$> sudo add-apt-repository ppa:mc3man/trusty-media
$> sudo apt-get update
$> sudo apt-get install ffmpeg
##------------------------------------------
##==========================================
## Change caplock to another backspace;
$> setxkbmap -option caps:backspace
##==========================================
## Favorite nerdy, name friendly, date format %Y=year %m=month %d=day - %H=hour %M=minute %S=seconds, %F:YYYY-MM-DD, %T-HH:MM:SS, %N-NanoSeconds
$> date +"%Y%m%d-%H:%M"
$> date +"%Y%m%d-%H:%M:%S"
$> date "+%F %H:%M.%S"
$> date +%F.%T
## Take a nanosecond timestamp: YYYY-MM-DD HH:MM:SS.NNNNNNNNN
$> date "+%F %T.%N"
##==========================================
## If you have a AMD or Nvidia graphics card and can not see/boot.
## During boot hold down the left shift key to get the GRUB boot menu to show.
## Press the 'e' key to edit the boot parameters. Add the boot parameters;
$> quite splash $vt_handoff nomodeset xforcevesa
## Then put in correct driver for you card
##==========================================
## Search for software to download from configured repositories
## Shows available packages
$> apt-cache search <searchterm>
## Shows package origin
$> apt-cache policy <searchterm>
##==========================================
$> dd if=/dev/hda of=/mbr.backup bs=512 count=1       ## Backs up MBR Master Boot Record
$> dd if=/mbr.backup of=/dev/hda bs=512 count=1       ## Restores MBR Master Boot Record
##==========================================
$> tail -f /var/log/syslog                            ## monitors messages
##==========================================
## Current color settings
$> dircolors --print-database
##==========================================
## Show current color profile of file type in color.
$> eval $(echo "rs:global default;fi:normal file;di:directory;ln:symbolic link;pi:named pipe;so:socket;do:door;bd:block device;cd:character device;or:orphan symlink;mi:missing file;su:set uid;sg:set gid;tw:sticky other writable;ow:other writable;st:sticky;ex:executable;"|sed -e 's/:/="/g; s/\;/"\n/g') && { IFS=:; for i in $LS_COLORS; do echo -e "\e[${i#*=}m$( x=${i%=*}; [ "${!x}" ] && echo "${!x}" || echo "$x" )\e[m"; done; }
##==========================================
## Change terminal prompt;
$> export PS1="\e[0;32m\u@\h \w> \e[m"
## 0;32 green
##==========================================
## Try out new colors in mc, with -S skins from,
$> ls /usr/share/mc/skins
$> mc -S gotar
## Get 256 colors and use 256 color skins
$> export TERM=xterm-256color # BREAKS mc in non gui tty logins
$> mc -S sand256
## or with long color picks
$> mc --colors normal=green,default:selected=brightmagenta,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default
## or yellow
$> mc --colors normal=yellow,default:selected=brightmagenta,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default
## or blue
$> mc --colors normal=lightgray,blue:normal=blue,default:selected=white,brightblue:marked=yellow,default:markselect=yellow,gray:directory=brightblue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default
## or dark
$> mc --colors normal=black,white:selected=white,black:marked=blue,white:markselect=black,white:errors=red,white:input=black,white:reverse=white,black:gauge=black,white:directory=black,white:executable=gray,white:stalledlink=lightgray,white:special=gray,white:core=red,white: 
## or by changing ~/.config/mc/ini
## Make the colors permanent
$> sed -i 's/base_color=/base_color=green,default:selected=brightmagenta,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default' ~/.config/mc/ini
## 
$> sed -i 's/base_color=/base_color=lightgray,blue:normal=blue,default:selected=white,brightblue:marked=yellow,default:markselect=yellow,gray:directory=brightblue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default/' ~/.config/mc/ini
## Undo the above change
$> sed -i 's/base_color=lightgray,blue:normal=blue,default:selected=white,brightblue:marked=yellow,default:markselect=yellow,gray:directory=brightblue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default/base_color=/' ~/.config/mc/ini
## Or in mcedit hold shift to highlight to copy, middle click to paste
$> sudo mcedit ~/.config/mc/ini
## Change [Colors] section to this;
#$ [Colors]
#$ base_color=lightgray,blue:normal=blue,default:selected=white,brightblue:marked=yellow,default:markselect=yellow,gray:directory=brightblue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default
##==========================================
## Put a console clock in top right corner
$> while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
##==========================================
## Turn off LCD
$> xset dpms force standby
$> xset dpms force off
##==========================================
## Backs up MBR Master Boot Record
$> dd if=/dev/sda of=/home/YOURUSERNAME/mbr.backup bs=512 count=1
## Restores MBR Master Boot Record
$> dd if=/home/YOURUSERNAME/mbr.backup of=/dev/sda bs=512 count=1
##==========================================
## Add a user
$> sudo adduser USER_NANE
## Delete a user
$> sudo deluser USER_NAME
## Change user password
$> sudo passwd USER_NAME
## Changes user fullname, office number, office extension, and home phone number information.
$> sudo chfn USER_NAME
## Display user information
$> finger USER_NAME
## Temporarily prevent a user from logging in
$> sudo usermod -L USER_NAME
## Revoke the operation above
$> sudo usermod -U USER_NAME
## Add a user to admin group
$> sudo usermod -G admin -a USER_NAME
##==========================================
## Set apt source
$> sudo software-properties-gtk
$> sudo software-properties-kde
## Display the packages which are not installed but have remained residual config
$> dpkg -l | awk '/^rc/ {print $2}' 
## Add a PPA repository:
$> sudo add-apt-repository ppa:PPA-REPOSITORY-NAME
## Display a list of files. The files are installed from a given package.
$> dpkg -L PACKAGE_NAME
## Display a list of packages. The packages installed a given file.
$> dpkg -S FILE_NAME
## Display a list of packages. The name of packages matches given regex pattern.
$> apt-cache search REG_EXPRESSION
## Display a list of packages. The packages provide a given file.
$> apt-file search FILE_NAME
## Display a list of packages. The given package depends on the list of packages.
$> apt-cache depends PACKAGE_NAME
## Display a list of packages. These packages depend on the given package.
$> apt-cache rdepends PACKAGE_NAME
## Prompt for a disk to be inserted and then add the disc to the source list.
$> sudo apt-cdrom add
## Install the newest versions of all packages currently installed on the system.
$> sudo apt-get upgrade
## Delete residual package configuration files.
$> dpkg -l | grep ^rc | awk '{print $2}' | sudo xargs dpkg -P
## Automatically install necessary files for './configure ; make ; make install'
$> sudo auto-apt run ./configure
## Save the list of packages currently installed on your system.
$> dpkg --get-selections | grep -v deinstall > SOME_FILE
## Then use the file to restore packages. 
$> dpkg --set-selections < SOME_FILE ; sudo dselect
## After running "sudo apt-get install", "*.deb" files are stored in 
$> cat /var/cache/apt/archives
## You can clean this directory by:
$> sudo apt-get clean
## Display URL for a given package
$> sudo apt-get -qq --print-uris install PACKAGE_NAME
## Display some statistics about the apt cache
$> apt-cache stats
## Display all package name
$> apt-cache pkgnames
## Display some information of a given package
$> apt-cache show PACKAGE_NAME
$> apt-cache showpkg  PACKAGE_NAME
##==========================================
##==========================================
## LAMP Web Server 
$> sudo apt-get install apache2 mysql-server mysql-client php5 libapache2-mod-php5 php5-cli
$> sudo /etc/init.d/apache2 restart
$> gksudo gedit /etc/mysql/my.cnf
$> sudo /usr/bin/mysqladmin -u root -h localhost password 'RootPassword'
$> sudo /usr/bin/mysqladmin -u YOURUSERNAME -h localhost password 'YourPassword'
$> sudo /usr/bin/mysqladmin -u YOURUSERNAME -h 127.0.0.1 password 'YourPassword'
$> sudo /etc/init.d/mysql restart
$> mysql -u root -h localhost -p
$> /usr/bin/mysqladmin -u root -h localhost password 'new-password'
$> mysql -u YOURUSERNAME -p
##==========================================
## WordPress
$> wget http://wordpress.org/latest.tar.gz
# Download WordPress, modify wp-config.php, set permissions
$> function install_wp {
$>   wget http://wordpress.org/latest.tar.gz
$>   tar xzvf latest.tar.gz
$>   cp -rf wordpress/** ./
$>   rm -R wordpress
$>   cp wp-config-sample.php wp-config.php
$>   sed -i "s/database_name_here/$dbname/g" wp-config.php
$>   sed -i "s/username_here/$dbuser/g" wp-config.php
$>   sed -i "s/password_here/$dbpass/g" wp-config.php
$>   wget -O wp.keys https://api.wordpress.org/secret-key/1.1/salt/
$>   sed -i '/#@-/r wp.keys' wp-config.php
$>   sed -i "/#@+/,/#@-/d" wp-config.php
$>   mkdir wp-content/uploads
$>   find . -type d -exec chmod 755 {} \;
$>   find . -type f -exec chmod 644 {} \;
$>   chown -R :www-data wp-content/uploads
$>   chown -R $USER:www-data *
$>   chmod 640 wp-config.php
$>   rm -f latest.tar.gz
$>   rm -f wp-install.sh
$>   rm -f wp.keys
$> }
##==========================================
##==========================================
## Configuration files and what they do
$@ /etc/profile                         ## System wide environment variables for all users
$@ /etc/fstab                           ## Drives and their associated mount points. Edit this file to add cdroms, DOS partitions and drives at startup.
$@ /etc/rc.d/rc.local                   ## Bash script that is executed at the end of login process
$@ /etc/hostname                        ## Conatains full hostname
$@ /etc/cron.*                          ## There are 4 directories that automatically execute all scripts within the directory at intervals of hour, day, week or month
$@ /etc/hosts                           ## List of know host names and IP addresses on the machine.
$@ /etc/httpd/conf                      ## Paramters for the Apache web server
$@ /etc/inittab                         ## Specifies the run level that the machine should boot into
$@ /etc/resolv.conf                     ## Defines IP addresses of DNS servers
$@ /etc/smb.conf                        ## Config file for the SAMBA server. Allows file and print sharing with Microsoft clients
$@ /etc/X11/XF86Config                  ## Config file for XWindows
$@ ~/.xinitrc                           ## Defines the windows manager loaded by X
$@ /etc/modules                         ## Kernel modules loaded at boot
$@ /etc/lsb-release                     ## Distribution release information
$@ /etc/bash.bashrc                     ## System wide bashrc
$@ /etc/default/grub                    ## Configuration file, run update-grub after editing
$@ /etc/X11/                            ## Config file for XWindows
##==========================================
##  ##########################################################
##  #                   END Setup                            #
##  ##########################################################
##  
##  
##  
##  ####################################################
##  #                   Networking                     #
##  ####################################################
##==========================================
## Find out what networking devices you have
$> ifconfig -a
$> lshw -C network
## Turn on and off networking device
$> sudo ifconfig <interface> down
$> sudo dhclient -r <interface>
$> sudo ifconfig <interface> up
## Scan wifi Example;<interface>=wlan1
$> iwlist wlan1 scan
$> iwlist wlan1 scan | grep -E 'ESSID|Cell'
## Connect to a wifi network
$> sudo iwconfig <interface> essid "<ESSID_IN_QUOTES>"
$> sudo iwconfig <interface> key '<wifipassword>'
$> sudo iwconfig <interface> mode Managed
$> sudo iwconfig <interface> channel <same channel number as router>
$> sudo dhclient <interface>
$> sudo iwconfig wlan1 essid 'My Network' AP '00:00:FF:DD:43:78' channel 7 key s:'Mykey'
## Display your local IP address
$> ip addr | grep 'inet '
## Display only your local IP address
$> ifconfig wlan1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'
## Display your outside IP address
$> nslookup myip.opendns.com resolver1.opendns.com
## Display your gateway IP address
$> ip route show | grep -i 'default via'| awk '{print $3 }'
## Scan for other hosts on network
$> sudo arp-scan --interface=<interface> --localnet
## Find open ports
$> sudo nmap -sT -O <host>
## Display NetBIOS name of a given IP address
$> nmblookup -A IP_ADDRESS
## Scan Subnet for IP and MAC addresses
$> nmap -sP 192.168.1.0/24
## Display hostname
$> hostname
##==========================================
## Get wifi working
$> sudo iw dev
$> sudo ip link show wlan0
$> sudo ip link set wlan0 up
$> sudo ip link show wlan0
$> sudo iw wlan0 link
$> sudo dhclient -r 
$> sudo service networking restart
$> sudo iw wlan0 link
$> sudo iw wlan0 scan
$> sudo iw wlan0 scan | grep SSID
$> sudo route show
$> sudo ip route show
##==========================================
## Ping
$> ping -c 3 192.168.1.1     ## Ping router
$> ping -c 3 8.8.8.8         ## Ping DNS
$> ping -c 3 yahoo.com       ## Ping with URL
##==========================================
## Get your external IP address
$> echo $(wget http://ipecho.net/plain -q -O -)
## or
## Get your public IP address from the web
$> curl ifconfig.me
## Display your outside IP address
$> nslookup myip.opendns.com resolver1.opendns.com
## Display your outside IP address information
$> curl ifconfig.co/all.json
##==========================================
## Secure shell to other computers;
$> ssh user@host
## Key stored at
$> cat ~/.ssh/known_hosts
## To clear the key
$> ssh-keygen -R hostname
## To clear all keys
$> > ~/.ssh/known_hosts
##==========================================
## Network monitor with a graph
$> slurm -i <interface (wlan1, eth0 etc)>
##==========================================
## netstat is cool
$> netstat -i                       ## --interfaces, Display a table of all network interfaces.
$> netstat -l                       ## --listening, Show only listening sockets (These are omitted by default)
$> netstat -s                       ## --statistics, Display summary statistics for each protocol.
$> netstat -tunpl                   ## --tcp, --udp, --numeric IP, -p PID/Program name, --listening
$> netstat -np | grep -v ^unix      ## --numeric IP, -p PID and name of the program
##==========================================
## Determine if a port is open
$> : </dev/tcp/127.0.0.1/80
## For times when netcat isnt available. Will throw a Connection refused message if a port is closed.
## Scriptable: 'openport port#' exp. 'openport 80'
$> function openport() { (: </dev/tcp/127.0.0.1/$1) &>/dev/null && echo "OPEN" || echo "CLOSED" ; }
##==========================================
## Map the web. Where is the server you are looking at?
$> nmap yahoo.com
##==========================================
$> ssh -N -L2001:localhost:80 somemachine
## http://localhost:2001/
## start a tunnel from some machine's port 80 to your local port 2001
## now you can acces the website by going to
## http://localhost:2001/
##==========================================
## Running info on network and disks:
$> sudo apt-get install dstat
$> dstat
##==========================================
## set up network
## cat /ect
$> ifconfig eth0 up 192.168.whatever.yourIP netmask 255.255.255.whatever
$> route add gw 209.11.225
## or whatever your gateway is.
$> cat /ect/resolv.conf
## edit nameserver to set DNS
##==========================================
## Show Your Network Connections
## Show all connections with -i
$> lsof -i
##==========================================
## Password sniffer:
$> tcpdump port http or port ftp or port smtp or port imap or port pop3 -l -A | egrep -i 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user ' --color=auto --line-buffered -B20
## Traffic piped through grep;
$> sudo tcpdump -n -A | grep -e '<String or IP>'
##==========================================
## Use 3 threads to download some big file;
$> axel -a -n 3 http://somelink-to-download/
##==========================================
## Share file through http 8088 port
$> nc -v -l 8088 < file.ext
$> function share8088 () { nc -v -l 8088 < $1 ; }
##==========================================
## In case you need to test some CGI scripts this does the job. It also has the functionality of a http server.
$> python2 -m CGIHTTPServer 
##==========================================
## mtr Trace Route
$> mtr www.google.com
##==========================================
## Mount Windows fileshare on a domain from bash
$> mount -t cifs -o username=SlackerMojo,domain=WORKGROUP,rw //192.168.1.24/f /mnt/storage
##==========================================
$> ss      #List all TCP
$> dig     #DNS lookup utility
##==========================================
## find all active IP addresses in a network
$> nmap -sP 192.168.0.*
##==========================================
## Open http server at current location:
$> python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"
##==========================================
## Linux / UNIX one liner to ping all hosts on the LAN
$> for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done
$> alias lanip='for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done'
##==========================================
## Chat with other users on the same netork;
$> sudo apt-get install ytalk
## Both parties run talk <user-you-want-to-talk-to>@<host-IP-or-name> #on both
$> talk user@host
##==========================================
## Disable Samba from listening on the samba ports:
$> sudo ufw deny Samba
## To disable the samba server from running:
$> sudo service smbd stop
$> sudo service nmbd stop
## To prevent Samba server from starting on boot:
$> sudo mv /etc/init/nmbd.conf /etc/init/nmbd.conf.stop
$> sudo mv /etc/init/smbd.conf /etc/init/smbd.conf.stop
## Undo
$> sudo mv /etc/init/nmbd.conf.stop /etc/init/nmbd.conf
$> sudo mv /etc/init/smbd.conf.stop /etc/init/smbd.conf
##---------------------------------------------
## Disable the Samba services I think. To do so, run these commands:
$> sudo stop nmbd
$> echo manual | sudo tee -a /etc/init/nmbd.override
$> sudo stop smbd
$> echo manual | sudo tee -a /etc/init/smbd.override
## The first command stops the service currently running, until next reboot. The second command changes the configuration so that it wont be started upon next reboot.
##==========================================
######################################################
###               END Networking                     #
######################################################
##
##
##
#########################################################
###                          Use                        #
#########################################################
##==========================================
## Suspend computer
$> dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend
##==========================================
## Power off computer
$> sudo poweroff
##==========================================
## Reboot computer
$> sudo reboot
##==========================================
## Check battery
$> upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"
##==========================================
## Turn off the laptop display
$> xset dpms force off
##==========================================
##==========================================
##  
## #############################################
## #               Multimedia                  #
## #############################################
##==========================================
## If you want to cut an AVI file to extract a portion.(require mencoder)
$> mencoder your_file.avi -ss 1:24:12 -endpos 29 -ovc copy -oac copy -noskip -skiplimit 1 -ofps 25 -mc 0 -o extract.avi
## This gives us an excerpt from a film starting 1H: 24m: 12s, duration is 29 seconds with the synchronization of sound and picture preserved.
##==========================================
## Play streaming music on command line. Awesome!!!! 
## List available stations.
## Look for the list of stations here: http://pub7.di.fm Or here: https://goo.gl/pdhhpQ
$> w3m -dump http://pub7.di.fm/ | grep 'Mount Point' | grep 'aac ' | sed 's/Mount Point \///g' | sed 's/ Login//g'
$> mplayer http://pub7.di.fm/di_ambient_aac?1 -user-agent "AudioAddict-di/3.2.0.3240 Android/5.1"
## Play streaming media find media at  http://pub7.di.fm/ use as argument the string after Mount Point /
## Some favorite stations: di_bigbeat_aac, di_breaks_aac, di_classictrance_aac, di_jungle_aac, 
$> function streamfm() { mplayer http://pub7.di.fm/$1?1 -user-agent "AudioAddict-di/3.2.0.3240 Android/5.1" ; }
## This commands does just two things: fakes user agent (the one was taken from recent Android app) and sends the (possibly) listener ID (it can be any - I put "1" here because it works like a charm - after the name of stream ?1 as you can see).
##==========================================
## Record desktop:
## Record the desktop to animated gif image with cursor showing for 20 seconds;
$> sudo apt-get install byzanz
$> byzanz-record --duration=20 --cursor desktoprecord.gif
## or
## Record the desktop to .mpg with cursor
$> ffmpeg -f x11grab -s 1440x900 -r 25 -i :0.0 -qscale -0 output.mpg
##==========================================
## Take audio notes with datestamp YYYYMMDD-HHMMSS
$> arecord -D plughw:0,0 -f cd -c 1 -t wav -d 0 -q -r 16000 | flac - -s -f --best --sample-rate 16000 -o audio$(date +"%Y%m%d-%H%M%S").flac
## ..which does a high quality, wave type recording and pipes it into the flac encoder, which outputs ./test.flac
## or just a wav file;
$> arecord -D plughw:0,0 -f cd -c 1 -t wav -d 0 -q -r 16000 audio$(date +"%Y%m%d-%H%M%S").wav
##==========================================
## Make a 10sec gif from a video starting at 45sec
$> ffmpeg -v warning -ss 45 -t 10 -i test.mp4 -vf scale=300:-1 -gifflags +transdiff -y test.gif
##==========================================
## Turn a .wav to .mp3
## with ffmpeg
$> ffmpeg -i test2.wav test2.mp3
## with lame
$> 
##==========================================
## mp4 to mpeg for dvd creation
$> avconv -i FILE.mp4 -f dvd -c:v:0 mpeg2video -s 720x576 -r 25 -g 15 -b:v:0 8000000 -maxrate:v:0 8000000 -minrate:v:0 8000000 -bufsize:v:0 1835008 -packetsize 2048 -muxrate 10080000 -b:a 192000 -ar 48000 -c:a:0 ac3 -map 0:v -map 0:a FILE.mpeg
##==========================================
## ASCII webcam live stream video using mplayer
$> mplayer -tv driver=v4l2:gain=1:width=640:height=480:device=/dev/video0:fps=10:outfmt=rgb16 -vo aa tv://
##==========================================
##==========================================
##  
##  
## #############################################
## #                  Video                    #
## #############################################
##==========================================
##==========================================
##    
##  
## #############################################
## #                    Web                    #
## #############################################
##==========================================
## Download entire directory -r without climbing the directory tree -np.
$> wget -r -c -np -e robots=off --random-wait --limit-rate=80k <URL>
##==========================================
##  
##  ###########################################
##  #                 Text                    #
##  ###########################################
##==========================================
##==========================================
## Create and start writing a file. Commit with cntl+d.
$> cat > test.txt
##==========================================
##  ###########################################
##  #                Files                    #
##  ###########################################
##==========================================
##==========================================
## Run every script in folder
$> run-parts --report /path/to/folderfullofcommands
##==========================================
## Copy -u only newer and updated files, -R recursively, -v verbose, -i interactive
$> cp -uRvi /path/to/source/copy /path/to/desination
##==========================================
## Backup a dirctory -a archive mode preserves all, -v verbose
$> rsync -av /src/foo /dest
## or
$> rsync -av /src/foo /dest/foo/
##------------------------------------------
## Backup to remote server 192.168.0.101, -e ssh protocol, showing progress of transfer
$> rsync -avze ssh --human-readable --progress /local/files/ USER_NAME@192.168.0.101:/remote/files
##------------------------------------------
## Backup include files and directory only which starts with ‘R’ exclude all other files and directory 
##-a archive, -v verbose -z compress, -e ssh protocol, -h --human-readable ,
$> rsync -avze --human-readable  --progress ssh --include 'R*' --exclude '*' /local/files/ USER_NAME@192.168.0.101:/remote/files
##------------------------------------------
## Backup only include files smaller than 2mb
$> rsync -avzhe ssh --max-size='2000k' /local/files/ USER_NAME@192.168.0.100:/remote/files
##==========================================
## Replace text in a line containing a pattern
$> sed '/PATTERN/ { s/ORIGINAL/REPLACEMENT/; }'
$>? sed '/PATTERN/ { s/ORIGINAL/REPLACEMENT/; }'
##==========================================
## Replace all instances of "A" with "B" in file "source" saved as file "destination"
$> xxd -p source | fold -w2 | paste -sd' ' | sed "s/A/B/g" | xxd -p -r > destination
##==========================================
##------------------------------------------
##= Spreadsheets =
##------------------------------------------
## sc is a command line spreadsheet
$> sc
##    Enter data into cells
#$ "<text"                              ## Enters left justified text.
#$ ">text"                              ## Enters right justified text.
#$ "=number"                            ## Enters a number
#$ "=formula"                           ## Enters a formula. 
#$ "=H2"                                ## Make equal to another cell in this case H2
#$ "=@sum(C44:C47)"                     ## Enters sum
#$ "gB13                                ## go to cell B13.
#$ "E"                                  ## Edit string value
#$ "5ir"                                ## go to cell A5, insert five more rows before row 5 formulas will autofix
#$ "5ic"                                ## go to cell A5, insert five more columns before column 5 formulas will autofix
#$ "ma (mb, mc and so on)               ## “mark” cell as a (or b, or c and so on) to copy it.
#$ "ca (cb, cc and so on)               ## copy contents previously marked with ma.
## "^t-C"                               ## Ctrl-T and C for color screen
#$ "P filename.sc"                      ## outputs to filename.sc
#$ "M filename.sc"                      ## merge current data into previously saved content
#$ "S tblstyle=0" "T filename.cln"      ## output colon-separated file to filename.cln formulas are not preserved
## "q"                                  ## quit
##------------------------------------------
## Copy sc cln output to csv, formulas are not preserved
$> cat filename.cln | sed 's/:/,/g' > filename.csv
##------------------------------------------
## Convert .sc to .csv ?WORKING?
$> ssconvert test5.sc file5.csv
##------------------------------------------
## Show formated csv
$> cat test5.csv | sed '1s/^/a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,aa,bb\n/' | column -s , -tn | nl -v 0
## Convert csv and sc, Numbering starts at A0 for sc and A1 for everything else, so formulas are messed up on translation
## Show formulas
$> cat test5.csv | sed -e '1i,,,,,,,' | psc -k -d, | sc
## Evaluate formulas
$> cat test5.csv | sed -e '1i,,,,,,,' |sed -e 's/=sum/@sum/g' -e 's/=SUM/@SUM/g' | psc -k -d, | sed -e 's/\"@SUM(/@SUM(/' -e 's/)"/)/' | sed '/@SUM/ { s/rightstring/let/; }' | sed -e '/= "=/s/rightstring/let/' -e '/= "=/s/"//g' | sed 's/= =/= /g' | sc
## Make a function csv-evaluate
$> function csvev() { cat $1 | sed -e '1i,,,,,,,' |sed -e 's/=sum/@sum/g' -e 's/=SUM/@SUM/g' | psc -k -d, | sed -e 's/\"@SUM(/@SUM(/' -e 's/)"/)/' | sed '/@SUM/ { s/rightstring/let/; }' | sed -e '/= "=/s/rightstring/let/' -e '/= "=/s/"//g' | sed 's/= =/= /g' | sc ;}
##==========================================
## Work with comma seperated list spreadsheets .csv
## display a tab separated file in columns
$> cat <file>.csv | column -t
## drop first column of output by piping to this
$> cat <file>.csv | column -t | awk '{for(i=2;i<=NF;i++) printf("%s%s",$i,(i!=NF)?OFS:ORS)}'
## or
$> cat <file>.csv |awk '{ $1="";print}'
##==========================================
## Work with comma seperated list spreadsheets .csv
## View spreadsheet, display a comma separated file in columns, with row numbers and column letters, can add more letters for bigger sheets, less -S no wrap
$> cat <file>.csv | sed '1s/^/a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,aa,bb\n/' | column -s , -tn | nl -v 0 | less -S
## csv can have formulas.
#$ name,amount1,amount2,total
#$ bank1,100,200,=SUM(B2:C2)
#$ bank2,10,20,=SUM(B3:C3)
#$ ,,,=SUM(D2:D3)
## Open in libre-calc, save with formulas showing, Save as... check filters, save with formulas
## Evaluate formulas in command line
$> function csvev () { cat $1 | sed -e '1i,,,,,,,' | sed -e 's/=sum/@sum/g' -e 's/=SUM/@SUM/g' | psc -k -d, | sed -e 's/\"@SUM(/@SUM(/' -e 's/)"/)/' | sed '/@SUM/ { s/rightstring/let/; }' | sed -e '/= "=/s/rightstring/let/' -e '/= "=/s/"//g' | sed 's/= =/= /g' | sc ;}
##------------------------------------------
## Shorter
$> function csvev () { cat $1 | sed -e '1i,,,,,,,' -e 's/=sum/@sum/g' -e 's/=SUM/@SUM/g' | psc -k -d, | sed -e 's/\"@SUM(/@SUM(/' -e 's/)"/)/' -e '/@SUM/ { s/rightstring/let/; }' -e '/= "=/s/rightstring/let/' -e '/= "=/s/"//g' -e 's/= =/= /g' | sc ;}
##==========================================
## Play White noise from urandom
$> aplay -c 2 -f S16_LE -r 44100 /dev/urandom
##==========================================
## List files newest first
$> ls -lt --time=atime
##==========================================
## Find and replace specific characters in a single line in multiple files with sed
$> for f in `ls`; do sed -i '/MATCHING STRING/ { s/ORIGINAL/REPLACEMENT/; }' ${f} ; done
##==========================================
## Create an animation we use the ffmpeg convert command
$> convert -delay 50 frame1.gif frame2.gif frame3.gif -loop 0 animated.gif
## Create an animated gif of 3 frames with 50 ms delay between them looping indefinitely.
## Vary delay between the images, specify the delay before each separate frame
$> convert -delay 50 frame1.gif -delay 100 frame2.gif -delay 150 frame3.gif -loop 0 animated.gif
## Add a pause between each loop
$> convert -delay 50 frame1.gif -delay 100 frame2.gif -delay 150 frame3.gif -loop 0 -pause 200 animated.gif
## Convert we can combine 2 animated gifs
$> convert anim1.gif anim2.gif combined.gif
##==========================================
## To encrypt a file with openssl
## Works on OS X, Linux, anywhere with OpenSSL installed:
$> openssl des3 -salt -in infile.txt -out encryptedfile
## To decrypt the file:
$> openssl des3 -d -salt -in encryptedfile -out normalfile.txt
##------------------------------------------
## Hide archive in image file.
$> cat archive.zip >> image.gif
#Rename add .zip to end of file.
$> mv image.gif image.gif.zip
## Open in archive peogram.
##------------------------------------------
## Hide a rar archive inside a png image file and then retrieve the files from this image.
$> cat picture.png archive.rar > hidden_archive_in_pic.png
## Rename add .rar to end of file. Open in archive peogram.
##------------------------------------------
## Make a encrypted file inside a gif image
$> tar -zcvf stuff.tgz ./stuff
$> openssl des3 -salt -in stuff.tgz -out encryptedstuff
$> zip encryptedstuff.zip encryptedstuff
$> cat encryptedstuff.zip >> pic.gif
## Take it back out again
$> mv pic.gif encryptedstuff.zip
$> uzip encryptedstuff.zip
$> openssl -d des3 -salt -out stuff.tgz -in encryptedstuff
$> tar -zxvf stuff.tgz
##==========================================
## Extract public key from private
## This will extract the public key that is stored in the private key using openssl
$> openssl rsa -in key.priv -pubout > key.pub
##==========================================
## find directories on your machine that are taking up greater than 1G
$> du -h -d 1 | ack '\d+\.?\d+G' | sort -hr
##==========================================
## Check gmail without showing password in script
$> curl -u youremail@gmail.com --silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if //; print "$2\n" if /<(title|name)>(.*)<\/\1>/;'
##------------------------------------------
## ???Check your unread Gmail from the command line, security alert run command with leading space to avoid password being added to .bash_history
$> curl -u username:password --silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
##------------------------------------------
## Email from commandline; NOT WORKING IN GMAIL ANY MORE
## $> echo "Hope this works" | mail -s "Working?" mail@gmail.com
##------------------------------------------
## Mail contents of apple.txt as a message to nobody@december.com, subject line "subject,"
$> mail -s "subject" nobody@december.com < apple.txt
## message "City Hall 1pm" to nobody@december.com with the subject line "meeting today"
$> echo "City Hall 1pm" | mail -s "meeting today" nobody@december.com
##==========================================
## Grep through files in the dirctory -R recursive, .
$> grep -RnsI --color=auto "seach term"
##==========================================
## Place a filename at the beginning of the line and input redirect with < to make it easier to edit the search at the end of the command.
$> </var/log/syslog grep foo
$> </var/log/syslog grep bar
##==========================================
## Make your own locate type search using find and grep.
## Make the database, takes a while.
$> sudo find / > ~/.database
## then search using grep
$> cat .database | grep 'term'
## or
$> grep 'term' .database
##==========================================
## multiple command output into a single program:
$> diff -u <(ls -c1 dir_1) <(ls -c1 dir_2)
## Will show you a diff of files in the root of dir_1 and dir_2
##==========================================
## Display line numbers a text file like $> cat -n text.txt
$> nl text.txt
##==========================================
## Get big .bash_history file. Put in .bashrc for permanent
$> export HISTFILESIZE='10000'
$> export HISTSIZE='5000'
##==========================================
## Mount VDI file (VirtualBox Disk Image) partition
$> sudo mount -t auto -o ro,loop,uid=user,gid=group,umask=0777,fmask=0777,offset=0x$(hd -n 1000000  /home/eakinc/.VirtualBox/HardDisks/XP.vdi | grep "eb 52 90 4e 54 46 53" | cut -c 1-8) /home/eakinc/.VirtualBox/HardDisks/XP.vdi /media/vdi
##==========================================
## Change the extension of these files from .txt to .md
$> mmv "*.txt" "#1.md"
##==========================================
## Share the current tree over the web
$> python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"
## Want to show something on your machine to someone over the web? Don't copy it or upload it somewhere. Just run "webshare" and the current directory and everything beneath it will be served from a new web server listening on port 8000. When your pal is finished, hit control-c.
## Found at www.shell-fu.org/lister.php?id=54
##==========================================
## download a torrent
$> btdownloadheadless --display_interval 5 --spew 1 torrentfile.torrent
##==========================================
## Output a video in ASCII format
$> mplayer -vo caca 'video_filename.ext'
##==========================================
## Pay video in freamebuffer in tty login without GUI
$> sudo chmod 777 /dev/fb0
$> mplayer -vo fbdev2 -fs FILENAME.avi
## Set video size to screen size
$> mplayer -vo fbdev2 -fs -zoom -x 1024 -y 768 FILENAME.mp4
##==========================================
## Screencasting with mplayer webcam window:
$> sudo apt-get install mplayer
$> mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop | ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4
##==========================================
## Create a script of the last executed command
$> cat > script.sh
## #! /bin/bash 
## cnt+d to commit
$> echo "!!" >> script.sh
$> chmod 755 script.sh
##==========================================
## Searches for searchterm in manuals
$> man options -k or -f searchterm  
##==========================================
## /etc/cron.daily
##==========================================
$> find /home -name "*.iso"  ## Finds all iso in home dir
##==========================================
$> file *                    ## Shows file types of listed files
##==========================================
$> mkdir -p /path/to/dir     ## make whole dir path
##==========================================
$> grep-i                    ## case insensitive,
$> fgrep                     ## searches through multiple files
##==========================================
$> ps a                      ## all TTY
$> ps -u eakinc              ## processes started by eakinc
$> ps aux                    ## show all processes for all users
$> ps -C processesname       ## processes of name
$> pstree                    ## make tree of processes
$> top                       ## shows processes
##==========================================
## Random number between 1 and 100.
$> shuf -i 1-100 -n 1
##==========================================
## To find and replace a string of text in a file:
$> sed -i ’s/orginal text/new text/g’ filename.txt
## or
$> <filename.txt sed -i ’s/orginal text/new text/g’
## or favorite but uses two commands
$> cat filename.txt | sed -i ’s/orginal text/new text/g’
##------------------------------------------
## appends to top of file
$> cat file.txt | sed '1s/^/YOURTEXT\n/'
## write it to file
$> sed -i '1s/^/YOURTEXT\n/' file.txt
## append to bottom of file
$> echo 'YOURTEXT' >> file.txt
##==========================================
## Create Animated GIF in Linux from Command Line
$> sudo apt-get install imagemagick
## If needed, date/name files in a numbered or sequential order. The manor in which they appear listed in your directory is the order they will appear in the animated GIF!
## Next, resize your .jpg images to a smaller size, such as 640×480 by using the following command:
$> mogrify -resize 640x480 *.jpg
## And finally, issue the command below to create an animated gif of your jpg images.ease the delay time for a longer transition between images. Tack loop 0 will loop your GIF indefinitely. Tack loop 3 would loop three times, for example.
$> convert -delay 20 -loop 0 *.jpg myimage.gif
##==========================================
## Add files to iso image.
$> mount -o loop /tmp/linux-install.iso /media/iso
$> cp /media/iso/* /mnt/test
## Add and change any file you need to. Then make CD.
$> mkisofs -o ../your-new.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V “Your Disk Name Here” .
##==========================================
## Will show you a diff of files in the root of dir_1 and dir_2
$> diff -u <(ls -c1 dir_1) <(ls -c1 dir_2)
##==========================================
## pull out the MP3 from an FLV
$> mplayer -dumpaudio "xyz-5.flv" -dumpfile "decent_filename.mp3"
##==========================================
## Alphabetize and remove one of any duplicates in a list
$> sort test.txt | uniq  > test_sort-uniq.txt
##==========================================
## From a PNG of text OCR to editable text.
$> gocr -i ImageOfText.png > EditableText.txt
##==========================================
## Look up attached scanners.
$> scanimage -L
##==========================================
## Screenshot
$> import -window root -delay 40 ~/Pictures/screenshot`date +"%Y%m%d-%H:%M.%S"`.png
## Can make a launcher to run it.
##==========================================
## Find stuff
## General form 
$> find START_DIRECTORY -name SEARCH_TERM -print
## ex. Find all txt files in everyone's home directory, write to a file, and display in less.
$> find /home --name "*.txt" -print > find.list ; cat find.list | less
##==========================================
## Check your current swappiness setting on a scale of 0-100:
$> cat /proc/sys/vm/swappiness
## The result will probably be 60.
##==========================================
## Convert to Kindle .mobi, because amazon can't read epub like everything else does.
$> ebook-convert "ebook.epub" "ebook.mobi"
##==========================================
## Execute a command without saving it in the history
## Prepending one or more spaces to your command won't be saved in history
## Useful for pr0n or passwords on the commandline.
$> <space>command
##==========================================
## Send notification to username at display.
## First ssh into computer you are trying to reach
$> ssh USER@192.168.1.11 
## Find username and display.
$> who 
## Display or speak message on the recipents computer.
$> DISPLAY=:0 sudo -u username notify-send 'Subject.' 'This is my message.'
$> DISPLAY=:0 sudo -u username espeak 'This is my message.'
##==========================================
## Color ascii video from webcam;
$> mplayer -tv driver=v4l2:gain=1:width=640:height=480:device=/dev/video0:fps=10:outfmt=rgb16 -vo caca tv://
##==========================================
## https://rg3.github.io/youtube-dl/
## Youtube;
## Download video files from a bunch of sites (here is a list https://rg3.github.io/youtube-dl/supportedsites.html).
## The options say: base filename on title, ignores errors and continue partial downloads. Also, stores some metadata into a .json file plz.
## Paste youtube users and playlists for extra fun.
$> youtube-dl -tci --write-info-json "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
## youtube-dl Download and play videos from youtube in linux;
$> sudo youtube-dl -U #update latest youtube api changes.
$> youtube-dl --get-filename -o "%(title)s.%(ext)s" RICeErc0ni8
## Patsy Cline - Walkin' After Midnight.mp4
$> youtube-dl -o "%(title)s.%(ext)s" RICeErc0ni8
## cclive Youtube downloader, play audio from youtube, --exec '<command>' executes a command mplayer after downloading video, 
##             %f  .. Full path to the downloaded media file
##             %n  .. Name of the downloaded media file
##             %t  .. Unfiltered media title
$> cclive http://www.youtube.com/watch?v=mbnYFz5DO1U --exec 'mplayer -vo null "%n"'
$> mplayer "test.mp4"
$> mplayer -vo null "test.mp4"                                 ## audio only
$> mplayer -vo caca "test.mp4"                                 ## ascii video
$> mplayer -vo fbdev2 -fs -zoom -x 1024 -y 768 "test.mp4"      ## full video in frambuffer (adjust zoom to screen size)
##-------------------------------------
## Streams youtube-dl video to mplayer.
#$> syt 'youtube.com/link' 'anotherlinkto.video'
$> syt() { pipe=`mktemp -u`; mkfifo -m 600 "$pipe" && for i in "$@"; do youtube-dl -qo "$pipe" "$i" & mplayer "$pipe" || break; done; rm -f "$pipe"; }
##-------------------------------------
## Streams cclive youtube video to mplayer.
#$> ytmp() { pipe=`mktemp -u`; mkfifo -m 600 "$pipe" && for i in "$@"; do cclive "$pipe" "$i" & mplayer "$pipe" || break; done; rm -f "$pipe"; }
##-------------------------------------
## youtube-dl play
$> youtube-dl -x RICeErc0ni8 | mplayer -vo caca
##-------------------------------------
## Get playlist for Livestream on YouTube 
$> youtube-dl --list-formats <URL>; youtube-dl -f <STREAM_ID> -g <URL>
##-------------------------------------
## Get playlist for Livestream on YouTube 
$> youtube-dl -f 43 -i [URL OF MAIN CHANNEL WITH ALL VIDEOS]
##-------------------------------------
##
##==========================================
## multiple command output into a single program:
$> diff -u <(ls -c1 dir_1) <(ls -c1 dir_2)
## Will show you a diff of files in the root of dir_1 and dir_2
##==========================================
## Listen on localhost:80, forward to localhost:81 and log both sides of the conversation to outflow, automatically restarting if the connection dies. 
$> mknod backpipe p; while nc -l -p 80 0<backpipe | tee -a inflow | nc localhost 81 | tee -a outflow 1>backpipe; do echo \"restarting\"; done
##==========================================
## If you already have your scanner working on your own system, you may come across times where you want to scan something from another computer on your network. Rather than fiddling around with USB cables, you can share the scanner over the network and use your scanner from any computer.
##    This guide assumes the scanner is working and plugged into an Ubuntu system.
$> sudo apt-get install sane-utils
##    Open a terminal and run the following command to open the configuration file in a text editor:
$> sudo gedit /etc/default/saned
##    Change "RUN=no" to "RUN=yes"
$> sudo gedit /etc/sane.d/saned.conf
##    Find the section that looks like this:
##    ## Access list# A list of host names, IP addresses or IP subnets (CIDR notation) that # are permitted to use local SANE devices. IPv6 addresses must be enclosed
##    # in brackets, and should always be specified in their compressed form.
##    # The hostname matching is not case-sensitive.
##    #scan-client.somedomain.firm
##    #192.168.0.1
##    192.168.1.0/24
##    #[2001:7a8:185e::42:12]
##    #[2001:7a8:185e::42:12]/64
##    Add your own internal IP address in place of the section in bold. Don't forget the /24.
##    Save and close the file
##    Add the "saned" user to the "lp" group so it can use the scanner:
$> sudo adduser saned lp
##    Restart the sane daemon:
##    sudo service saned restartYou should now be able to access the scanner over the network.
##==========================================
## Convert mkv to mp4 without reencoding
$> ffmpeg -i in.mkv -vcodec copy -acodec copy out.mp4
##------------------------------------------
## Convert mkv to mp4 without reencoding
$> avconv -i  *.mkv -c:v copy -c:a copy ouput.mp4
##==========================================
## Convert avi to mp4 with HandBrakeCLI
$> HandBrakeCLI -i "{}".avi -o "{}".mp4
##==========================================
## Convert matroska mkv video files to mp4 by changing container without reencoding.
$> function mkv2mp4() { ffmpeg -i "$1" -vcodec copy -acodec copy "$1".mp4 ; }
##==========================================
## Convert matroska mkv video files to mp4 by changing container without reencoding.
$> avconv -i  *.mkv -c:v copy -c:a copy ouput.mp4
##==========================================
## Convert video files to mp4 by changing container without reencoding. Useage: 2mp4 *.mkv
$> function 2mp4() { avconv -i  "$1" -c:v copy -c:a copy "$1".mp4 ; }
##==========================================
## Transcode both video and audio of video files to mp4 by changing container and reencoding. Long process. Useage: 2mp4 *.avi
$> function trans2mp4() { avconv -i  "$1" -c:v libx264 -c:a mp3 "$1".mp4 ; }
##=========================================
## Temporarily restart an init script
$> sudo /etc/init.d/SCRIPT_NAME restart
## Temporarily stop an init script
$> sudo /etc/init.d/SCRIPT_NAME stop
##==========================================
## Display all '.txt' file
$> find . -name '*.txt'
##==========================================
## motto of Ailurus
## Give a man a fish and he can eat for a day; but if you teach him how to fish, he'll eat for a lifetime.
## Information
$> lsb_release -is                                            ## Display Linux distributors ID
$> lsb_release -rs                                            ## Display Linux release number
$> lsb_release -cs                                            ## Display Linux code name
$> uname -m                                                   ## Display machine hardware name
$> lspci                                                      ## List all PCI devices, such as display card and ethernet card
$> lsmod                                                      ## Display a list of modules in the Linux Kernel
$> lsusb -v                                                   ## List USB devices
$> sudo ethtool eth0                                          ## Display the status of ethernet card
$> sudo lshw                                                  ## List hardware
$> sudo fdisk -l                                              ## List harddisk partitions
$> sudo hdparm -I /dev/sda                                    ## Display SATA harddisk parameters
$> df -h                                                      ## Display disk space usage
$> du -bsh FOLDER_NAME                                        ## Display file/folder space usage
$> free                                                       ## Display amount of free and used memory
$> ps -e                                                      ## Display processes
$> pstree                                                     ## Display a tree of processes
$> top                                                        ## Display processes dynamically
$> cal                                                        ## Displays a calendar
$> lsof -p PROCESS_ID                                         ## List files which are opened by a given process
$> lsof -c PROCESS_NAME                                       ## List files which are opened by a given process
$> lsof FILE_NAME                                             ## List processes which opened a given file
## Use
$> less FILE_NAME                                             ## Read a long file
$> grep REG_EXP FILE_NAME                                     ## Print lines matching a pattern
$> grep -lr REG_EXP PATHNAME                                  ## Display a list of file name. The files contain a given string.
$> find . -name '*.txt'                                       ## Display all '.txt' file
$> touch file_name_1 file_name_2                              ## Create two empty files
$> mkdir -p /tmp/a/b/c/d/e                                    ## Create directory. Create parent directories as needed.
$> cd                                                         ## Change working directory to the home folder
$> cd -                                                       ## Change working directory to the previous working directory
$> ls -a                                                      ## Display hidden files
$> cp -a SOURCE_DIRECTORY DEST_DIRECTORY                      ## Copy directory. Preserve links, file mode, ownership, timestamps
$> file FILE_NAME                                             ## Determine file type
$> tail -n 6 FILE_NAME                                        ## Output the last 6 lines
$> scp -rp FILE_NAME USERNAME@HOST:DEST_PATH                  ## Copy files via SSH
$> rename 's/.rm$/.rmvb/' *                                   ## Rename '*.rm' files to '*.rmvb' files
$> rename 'tr/A-Z/a-z/' *                                     ## Change the file name to lowercase
$> ls -d */.                                                  ## Display subdirectories in current directory
$> ls . | wc -w                                               ## Display the number of files in current directory
$> gunzip FILE_NAME.gz                                        ## Extract "*.gz" file
$> tar zxf FILE_NAME.tar.gz                                   ## Extract "*.tar.gz" file
$> tar jxf FILE_NAME.tar.bz2                                  ## Extract "*.tar.bz2" file
$> tar czf FILE_NAME.tar.gz FILE1 FILE2 FILE3                 ## Do compression
$> tar cjf FILE_NAME.tar.bz2 FILE1 FILE2 FILE3
$> sudo ntpdate ntp.ubuntu.com                                ## Set the date and time via NTP
$> watch -d free                                              ## Continuously monitor the memory usage
$> w3m -dump_head http://example.com                          ## Display HTTP HEAD response
$> nl FILE_NAME                                               ## Display file content with line number
$> sudo rkhunter --checkall                                   ## Eliminate Rootkit
$> du -bsh $HOME                                              ## Total size of home folder
$> find $HOME/.thumbnails/ -type f -atime +7 -exec rm {} \;   ## $HOME/.thumbnails/ directory is a cache dir containing thumbnail pictures of picture files you've previously looked at.. You can delete the files in the .thumbnails directory that have not been accessed for seven days, to free disk space.
$> gnome-screenshot -d 10                                     ## Capture screen after 10 seconds
$> gnome-screenshot -wd 10                                    ## Capture current window after 10 seconds
$> convmv -r -f gbk -t utf8 --notest FILE_NAME                ## Convert the file name from GBK to UTF8
$> iconv -f gbk -t utf8 FILE_NAME                             ## Convert the file content from GBK to UTF8
$> find . -name '*.mp3' -execdir mid3iconv -e GBK {} \;       ## Convert tags in '*.mp3' from GBK to UTF8
##Networking
$> sudo hostname new_name                                     ## Change hostname
$> sudo pppoeconf                                             ## Configure an ADSL connection
$> sudo pon                                                   ## Starts up ADSL connections
$> sudo poff                                                  ## Shuts down ADSL connections
$> arping IP_ADDRESS                                          ## Display MAC of a given IP address
$> nmblookup -A IP_ADDRESS                                    ## Display NetBIOS name of a given IP address
$> ifconfig -a                                                ## Display IP address and MAC
$> netstat -rn                                                ## Display route
$> sudo ifconfig eth0 hw ether 00:11:22:33:44:55              ## Set MAC of ethernet interface
$> whois example.com                                          ## Display information of a domain name
$> tracepath example.com                                      ## Display the network path to a given host
$> sudo dhclient                                              ## Request an IP address from DHCP server
$> lsof -i :80                                                ## List processes which are using port 80
## Maintainance
$> echo 3 > /proc/sys/vm/drop_caches                          ## Reclaim memory which stores pagecache, dentries and inodes
$> sudo kill -9 PROCESS_ID                                    ## Terminate a process with a given process id
$> sudo killall PROCESS_NAME                                  ## Terminate all processes with a given name
$> sudo /etc/init.d/SCRIPT_NAME restart                       ## Temporarily restart an init script
$> sudo /etc/init.d/SCRIPT_NAME stop                          ## Temporarily stop an init script
$> sudo adduser USER_NAME                                     ## Add a user
$> sudo deluser USER_NAME                                     ## Delete a user
$> sudo passwd USER_NAME                                      ## Change user password
$> sudo chfn USER_NAME                                        ## Changes user fullname, office number, office extension, and home phone number information.
$> finger USER_NAME                                           ## Display user information
$> sudo usermod -L USER_NAME                                  ## Temporarily prevent a user from logging in
$> sudo usermod -U USER_NAME                                  ## Revoke the operation above
$> sudo usermod -G admin -a USER_NAME                         ## Add a user to admin group
$> export http_proxy=http://PROXY.DOMAIN.NAME:PORT            ## Set the HTTP proxy
$> im-switch -c                                               ## Choose the input method for X Window
$> sudo halt                                                  ## Poweroff your os but does not power down
$> sudo shutdown -h now
$> sudo reboot                                                ## Reboot your computer
$> sudo shutdown -r now
##==========================================
## Change Process priority
## renice NEW_PRIORITY `pgrep NAME_OF_PROCESS`
$> renice 5  `pgrep firefox`
##         renice -5 `pgrep wine-server'
##               high <------------------> low
## NEW_PRIORITY = -19, -18, -17 [...] 18, 19, 20
##==========================================
## Clear Bash history
$> history -c
##==========================================
## Listen on localhost:80, forward to localhost:81 and log both sides of the conversation to outflow, automatically restarting if the connection dies.
$> mknod backpipe p; while nc -l -p 80 0<backpipe | tee -a inflow | nc localhost 81 | tee -a outflow 1>backpipe; do echo \"restarting\"; done 
##==========================================
## Pointing to a file shows what's interacting with that file
$> lsof /var/log/syslog
## or
$> lsof /var/log/messages
##==========================================
## Show what a given user has open using -u
$> lsof -u daniel
## You can also use the -t with -u to kill everything a user has open
$> kill -9 `lsof -t -u daniel`
##==========================================
## Can remove stuff i don't need and take things from loading up on startup.
## ie. if you do not have bluetooth, are not blind and need brail, find other stuff you do not need.
$> sudo apt-get remove bluetooth brltty
## etc and add stuff that may not be there which are useful for customisation.
## and customise away. e.g. i take out stuff like gwibber and telepathy and put in emesene, thunderbird, firefox, transmission etc sysv-rc-conf and take out ppd-dns and stuff used for dial-up, and sudo apt-get remove modemmanager while you're at it - it loads at startup and most have no need for it.
##==========================================
## binary clock
$> perl -e 'for(;;sleep 1){printf"\r"."%.4b "x6,split"",`date +%H%M%S`}'
##==========================================
## Compare a remote file with a local file
$> test "$(md5sum /local/file | cut -d' ' -f1)" == "$(ssh root@xen -- md5sum /remote/file | cut -d' ' -f1)" && echo "Match" || echo "Differ"
##==========================================
## Streams youtube-dl video to mplayer.
## syt 'youtube.com/link' 'anotherlinkto.video'
$> syt() { pipe=`mktemp -u`; mkfifo -m 600 "$pipe" && for i in "$@"; do youtube-dl -qo "$pipe" "$i" & mplayer "$pipe" || break; done; rm -f "$pipe"; }
##==========================================
## Convert an mp3 and add to it a img
$> lame -v 2 -b 192 --ti /path/to/file.jpg audio.mp3 new-audio.mp3
##==========================================
## Rename file to same name plus datestamp of last modification.
$> FILENAME=nohup.out
$> mv -iv $FILENAME{,.$(stat -c %Z $FILENAME)}
##==========================================
## slow down/speed up video file
$> mencoder -speed 2 -o output.avi -ovc lavc -oac mp3lame input.avi
##==========================================
## In case you need to test some CGI scripts this does the job. It also has the functionality of a http server.
$> python2 -m CGIHTTPServer 
##==========================================
## rename all images in folder with prefix of date and time from exif data
$> for i in `ls` ; do date=$(identify -format %[exif:DateTime] $i); date=${date//:/-}; date=${date// /_}; mv $i ${date}__$i; done
##==========================================
## convert png images to jpg and optimize them
$> ls *.png | cut -d . -f 1 | xargs -L1 -i convert -strip -interlace Plane -quality 80 {}.png {}.jpg
##==========================================
## Convert pdf to jpg
$> convert -density 300 -quality 100 mozilla.pdf page_%04d.jpg
##------------------------------------------
## Convert jpg to pdf
$> convert *.jpg output.pdf
$> convert page1.jpg page2.jpg +compress file.pdf
$> convert -rotate 90 page\*.jpg +compress file.pdf
##==========================================
## Change caps lock to backspace (Works on Ubuntu 14.04)
$> setxkbmap -option caps:backspace
##==========================================
## Speak out fortunes
$> fortune | espeak -s 135
##==========================================
## Null a file with sudo
$> sudo bash -c "> /var/log/httpd/access_log"
##==========================================
## Mount a VMware virtual disk (.vmdk) file on a Linux box
## This does not require you to know the partition offset, kpartx will find all partitions in the image and create loopback devices for them automatically. This works for all types of images (dd of hard drives, img, etc) not just vmkd. You can also activate LVM volumes in the image by running
$> vgchange -a y
## and then you can mount the LV inside the image.
## To unmount the image, umount the partition/LV, deactivate the VG for the image
$> vgchange -a n <volume_group>
## then run
$> kpartx -dv <image-flad.vmdk>
## to remove the partition mappings.
$> kpartx -av <image-flat.vmdk>; mount -o /dev/mapper/loop0p1 /mnt/vmdk
##==========================================
## Mount a VirtualBox VDI image
$> sudo apt-get install qemu-kvm
## Load the nbd kernel module. network block device module
$> modprobe nbd
$> qemu-nbd -c /dev/nbd0 <vdi-file>
## That command will expose the entire image as a block device named /dev/nbd0, and the partitions within it as subdevices. For example, the first partition in the image will appear as /dev/nbd0p1.
## Now you could, for instance, run cfdisk on the block device, but you will most likely want to mount an individual partition.
##  “max_part” parameter for nbd kernel module can be set to 0, for this to work, one has to do “modprobe nbd max_part=16” 
$> mount /dev/nbd0p1 /mnt
##------------------------------------------
## When you’re done, unmount the filesystem and shut down the qemu-nbd service.
$> umount /mnt
$> qemu-nbd -d /dev/nbd0## 
##==========================================
## make image semi-transparent
$> convert input.png -alpha set -channel A -fx 0.5 output.png
##==========================================
## Sync the existing directory structure to destination, without transferring any files
$> rsync -av -f"+ */" -f"- *" [source] [dest]
##==========================================
## Display disks by id, UUID and HW path
$> sudo blkid
##==========================================
## Convert mp4 to mp3 in a directory
## Good for when you download youtube videos and want the mp3 for your mp3 player.
$> for a in $(find . -maxdepth 1 -name "*.mp4" -type f -printf "%f\n" | rev | cut -d '.' -f2- | rev | sort -u); do if [ ! -f "$a.mp3" ]; then  avconv -i "$a."* -vn  -ab 128 "$a.mp3"; fi done
##==========================================
## Install ffmpeg
$> sudo apt-add-repository ppa:samrog131/ppa
$> sudo apt-get update
$> sudo apt-get install ffmpeg-real
## Next, to make FFmpeg 2.6.0 work, create the below symlink:
$> sudo ln -sf /opt/ffmpeg/bin/ffmpeg /usr/bin/ffmpeg
## 
## ???Capture Audio/video???
$> mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop | ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4
##==========================================
## Convert a .ogv recording (eg from recordmydesktop in Gnome/Linux) into a .wmv (eg for playback in Windows)
$> ffmpeg -i input.ogv -qscale 0 output.wmv # convert .ogv to .wmv
##==========================================
## View online pdf documents in cli
## Probably will not work very well with scanned documents.
$> curl 'LINK' | pdftotext - - | less
##==========================================
## Print machine's ipv4 addresses
$> ifconfig | grep "inet addr" |  sed 's/.*inet \(.*\)$/\1/' | tail -n +2
##==========================================
## Convert PDF to JPG
## Without the bashisms and sed dependency. Substitutions quoted so that filenames with whitespace will be handled correctly.
$> for file in *.pdf; do convert -verbose -colorspace RGB -resize 800 -interlace none -density 300 -quality 80 "$file" "${file//.pdf/.jpg}"; done
##==========================================
## Search google.com on your terminal, Mac OSX friendly version of google function
$> function google { Q="$@";GOOG_URL='https://www.google.com/search?tbs=li:1&q=';AGENT="Mozilla/4.0";stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}");echo "$stream" | grep -o "href=\"/url[^\&]*&amp;" | sed 's/href=".url.q=\([^\&]*\).*/\1/';}
##------------------------------------------
## Search open directories;
$> inurl:(htm|html|php|shtml|3bb|aspx) intitle:"index of" +(mov|mp3|mp4|wma|flac|mp4|m4v|avi) YOURSEARCHTERM
##==========================================
## Don't search history by grepping ~/.bash_history, or repeatedly hitting the up arrow, instead use CTRL+r (or '/' in vi-mode) for search-as-you type. You can immediately run the command by pressing Enter.
$> CTRL+r 
##==========================================
## Convert virtually any video into a DVD-valid MPEG2 stream
$> mencoder -oac lavc -ovc lavc -of mpeg -mpegopts format=dvd -vf  displayscale=720:480,harddup -srate 48000 -af lavcresample=48000 -lavcopts codec=mpeg2video:vrc_buf_size=1835:vrc_maxrate=9800:vbitrate=5000:keyint=18:aspect=16/9:acodec=ac3:abitrate=192 -ofps 30000/1001 -o output.mpg input.extension
## Options you might want to change:
## scale: 720:480 for NTSC, 720:576 for PAL
## ofps: 30000/1001 for NTSC, 25 for PAL
## aspect: 16/9 or 4/3 depending on your video
##==========================================
## Record a screencast as an mpeg
## Use the command below to record a screencast and save it as an mpeg:
$> ffmpeg -f x11grab -s 800x600 -i :0.0 /tmp/screencast.mpg
##==========================================
## ???WORKING???Create a script of the last executed command
#$> echo -e "#!/bin/bash" & echo "!!" > script.sh
##==========================================
## Search for a string inside all files in the current directory
$> grep -RnsI --color=auto <pattern> *
##==========================================
## Beyond grep
$> sudo apt-get install ack-grep
##  _   /|
##  \'o.O'
##  =(___)=
##    U    ack!
$> ack-grep <pattern>
##==========================================
## Draw a cow with a speach bubble, saying something.
$> cowsay "$(uname) is cool"
##  ______________
## < Linux is cool >
##  --------------
##         \   ^__^
##          \  (oo)\_______
##             (__)\       )\/\
##                 ||----w |
##                 ||     ||
##------------------------------------------
## Show all cows installed
$> for i in /usr/share/cowsay/cows/*.cow; do cowsay -f $i "$i"; done
## Random cow says fortune
$> fortune | cowsay -f $(ls /usr/share/cowsay/cows/| sed 's/ /\n/g' | sed -e '/^$/d'| shuf -n1)
##==========================================
## Simple stopwatch
$> time read
$> <ctrl-d>
##==========================================
## Command line music player
$> sudo apt-get insatll cmus
$> cmus
## :add ~/Downloads/Music
## 1-player, 7-help, c-pause, b-next, s-shuffle
##==========================================
## Convert directory of videos to MP4 in parallel
## install Handbrake from http://handbrake.fr/
$> for INPUT in *.avi ; do echo "${INPUT%.avi}" ; done | xargs -i -P9  HandBrakeCLI -i "{}".avi -o "{}".mp4
## The first three bits ("for INPUT...done |") lists the AVI files in the current directory, then uses a Bash function to strip off the suffix. It then sends each video file name to the next part.
## The next part of the command (| xargs ...) runs our converter in parallel. The "-i" flag says take each input (video file name) and stick it in the "{}" parts of the xargs command. The parallel option lets us run up to 9 commands at the same time ("-P9").
## The last part (HandBrakeCLI -i "{}".avi -o "{}".mp4) converts a single video to MP4 format. The two open-close curly braces are replaced with xargs, once per input video file. The first run through will be "HandBrakeCLI -i "input1".avi -o "input1".mp4", next will be "HandBrakeCLI -i "input2".avi -o "input2".mp4", etc.
## Limitations
## Converting videos in parallel is confusing as Handbrake overwrites the status for every file -- ignore the screen.
##==========================================
## ??create a set of backed up .txt files with the current date added at the end of the file:
## ls *txt | sed "s/.*/cp & &.$(date "+%Y%m%d")/"
##==========================================
## Selective content replace on files. For example to replace '<?' with '<?php' in all PHP files:
$> find . -name '*.php' -exec sed -ie 's#<?#<?php#' {} \;
##==========================================
## Mass-renaming files using find and sed:(this example will rename all .php3 files to .php)
$> find -name "*.php3" | sed 's/\(.*\).php3$/mv "&" "\1.php"/' | sh
##==========================================
## multiple command output into a single program:
$> diff -u <(ls -c1 dir_1) <(ls -c1 dir_2)      
## Will show you a diff of files in the root of dir_1 and dir_2
##==========================================
## Burn DVD
$> wodim -eject -tao  speed=2 dev=/dev/sr1 -v -data myiso.iso
$> growisofs -dvd-compat -Z /dev/sr1=myiso.iso
##==========================================
##  Make a contact sheet montage of set of images
$>  montage -verbose  -background '#000000' -fill 'gray' -define jpeg:size=600x600 -geometry 600x600+2+2 photoname_{125304..130339}_HDR.jpg contactsheetmontage.jpg
##==========================================
##  Video editing
$>  videnctool -compose --file=vid1.avi --start=00:00:30:12 --end=00:01:45:00 --file=vid2.avi --start=00:05:00:00 --end=00:07:12:25 --file=mypicture.png --duration=00:00:02:00 --file=vid3.avi --start=00:02:00:00 --end=00:02:45:10 --output=editedvid.avi
##==========================================
##  Get a qrcode for a given string from qrenco.de
$>  echo "YourStringHere" | curl -F-=\<- qrenco.de
##==========================================
## Weather forcast
## San Francisco Mexico
$>  curl wttr.in/"san francisco" 
## San Francisco USA
$>  curl wttr.in/"94114"
##==========================================
#######################################################
#                      END Use                        #
#######################################################
##
##
##
###################################################################
#                          BASH                                   #
###################################################################
## 
##==========================================
## Make changes in .bashrc immediately available 
$> builtin exec bash
$> bashrc-reload() { builtin exec bash ; }
##==========================================
## Bash regular expressions
$@ if list; then list; [ elif list; then list; ] ... [ else list; ] fi
$@ while list; do list; done
$@ until list; do list; done
$@ test 
$@ for name [ in word ] ; do list ; done
$@ for (( expr1 ; expr2 ; expr3 )) ; do list ; done
$@ ( expression )               ## Returns  the  value  of  expression.  This may be used to override the normal precedence of operators.
$@ ! expression                 ## True if expression is false.
$@ -d                           ## look for directory test if it is a directory
$@ -f                           ## look for file test if it is a file
$@ -e                           ## checks for existance
$@ -z -n                        ## is null, is not null
$@ -r -w -x                     ## checks for read write execute permissions
$@ -eq                          ## equality test
$@ -ge -le                      ## greater, less than or equal test
$@ ||                           ## previous expression false
$@ &&                           ## previous expression true
$@ expression1 && expression2   ## True if both expression1 and expression2 are true.
$@ expression1 || expression2   ## True if either expression1 or expression2 is true.
##==========================================
## Selected Bash Keystrokes
$@ Ctrl-U                       ## Cuts everything to the left
$@ Ctrl-W                       ## Cuts the word to the left
$@ Ctrl-Y                       ## Paste the last thing to be cut
$@ Ctrl-A                       ## Go to beginning of line
$@ Ctrl-E                       ## Go to end of line
$@ Ctrl-T                       ## Reverses the position of the character the cursor is on with the previous character
$@ Ctrl-R                       ## Search history
##==========================================
## History
$@ !$                           ## Matches last string of previous command
$@ !!                           ## Matches previous command
$@ !10                          ## Matches 10 commands ago
##==========================================
## regex
##  $@ .[{()\*+?|^$             ## Special characters 
##==========================================
## Clear terminal
$> clear                                   ## Scrolls up till can not see current text
$> reset                                   ## Resets the terminal and removes all text
$> echo -ne '\033c'                        ## Removes all text
##==========================================
## Brace expansion.
$> echo \"{These,words,are,quoted}\"   # " prefix and suffix
# "These" "words" "are" "quoted"
$> cat {file1,file2,file3} > combined_file
# Concatenates the files file1, file2, and file3 into combined_file.
$> cp file22.{txt,backup}
# Copies "file22.txt" to "file22.backup" 
###################################################################
#                      END BASH                                   #
###################################################################
##
##
##
#########################################################
#                    Cool | Pipes                       #
#########################################################
##------------------------------------------
## Removes unsorted duplicate lines
$> | awk '!x[$0]++'
##------------------------------------------
## Remove duplicate lines whilst keeping empty lines and order
$> | awk '!NF || !seen[$0]++'
##------------------------------------------
## Drop first column of output by piping to this
$> | awk '{for(i=2;i<=NF;i++) printf("%s%s",$i,(i!=NF)?OFS:ORS)}'
## or
$> | awk '{ $1="";print}'
##------------------------------------------
## Strips everything before the ":" character.
$> | awk -F\: '{print $2}'
##------------------------------------------
## Replaces spaces with new lines 
$> | sed 's/ /\n/g'
##------------------------------------------
## Replaces new lines with spaces
$> | tr '\n' ' '
##------------------------------------------
## Insert 5 blank spaces at beginning of each line (make page offset)
$> | sed 's/^/     /'
##------------------------------------------
## Substitute "foo" with "bar" ONLY for lines which contain "baz"
$> | sed '/baz/s/foo/bar/g'
##------------------------------------------
## Substitute "foo" with "bar" EXCEPT for lines which contain "baz"
$> | sed '/baz/!s/foo/bar/g'
##------------------------------------------
## Strip off everything before http on each line
$> | grep -o "http.\+" 
##------------------------------------------
## Add a line of commas above the top line
$> | sed '1s/^/,,,,,,,\n/'
##------------------------------------------
## Grep AND ".*", OR "\|", NOT "-v"
$> | grep 'THIS' | grep 'THAT'      ## AND
$> | grep -E 'THIS.*THAT'           ## AND
$> | grep 'THIS\|THAT'              ## OR
$> | grep -E 'THIS|THAT'            ## OR 
$> | grep 'THIS'| grep -v 'THAT'    ## NOT
##------------------------------------------
## Strip everything but the second field on each line
#> man cut # remove sections from each line of files, -d --delimiter=DELIM, -f --fields=LIST
$> | cut -d ' ' -f 2
##------------------------------------------
## Remove blank lines, nothing between ^ beginning and $ end of line, delete ^to$
$> | sed -e '/^$/d'
##------------------------------------------
## Remove blank lines even with spaces or tabs
$> | sed '/^\s*$/d'
##------------------------------------------
## Change case
$> | tr [:upper:] [:lower:]
## or a range
$> | tr a-z A-Z
##------------------------------------------
## Display a Block of Text between Two Strings
$> | awk '/start-pattern/,/stop-pattern/'
##------------------------------------------
## Delete block of text between patterns
$> | sed '/start-pattern/,/stop-pattern/d'
##------------------------------------------
## Remove quotes "
$> | tr -d '"'
##------------------------------------------
## Display last line
$> | sed -n '$p'
##------------------------------------------
## Enable progress output, shows progress of a long process
$> | awk 'NR%1000==0{print NR>"/dev/stderr"}{print}'
##------------------------------------------
## Scrape for IP addresses
$> | grep -Eoa "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"  | grep -Ev "^0|\.0[0-9]|^10\.|^127\.|^169\.|^172\.(1[6-9]|2[0-9]|3[01])|^191.168.|^2(2[4-9]|3[0-9])|^2(4[0-9]|5[0-5])" | grep -v 255
##------------------------------------------
## Remove blank lines even with spaces or tabs
$> | sed '/^\s*$/d'
##------------------------------------------
## Remove duplicate lines whilst keeping empty lines and order
$> | awk '!NF || !seen[$0]++'
##------------------------------------------
## Not quite a pipe function but, appends to top of file
$> | sed '1s/^/YOURTEXT\n/'
##------------------------------------------
## Embed next line on the end of current line using sed (where X is the current line)
## N: On the current line, sed will display it on pattern space, plus a \n (new line); but s/\n//: Will get rid of new line displayed on pattern space, joining the current lines end with the start of the next line
$> | sed 'X{N;s/\n//;}' 
##------------------------------------------   
# Comment out all lines in a file beginning with string
$> | sed 's/^\(somestring\)/#\1/'
##------------------------------------------ 
# Comment out specified line of a file
$> | sed '<Your_line_number_here>s/\(.*\)/#\1/'
##------------------------------------------ 
## Delete trailing white space (spaces, tabs)
$> | awk '{sub(/[ \t]*$/, "");print}'
##------------------------------------------ 
## Delete leading white space
$> | awk '{sub(/^[ \t]+/, ""); print}'
##------------------------------------------
## Add some ++++ at the beginning of matching lines regexp
$> | awk '/regexp/{sub(/^/, "++++"); print;next;}{print}' 
##------------------------------------------ 
## Print only lines of less than 80 characters
$> | awk 'length < 80'
##------------------------------------------ 
## Shuffle lines
$> | perl -MList::Util=shuffle -e 'print shuffle <>;'
## or
$> | shuf
##------------------------------------------ 
## Print it out to default printer
$> | lp
##------------------------------------------
## Remove whitespace
## Remove leading whitespace
$> | sed 's/^[ \t]*//'
## Remove trailing whitespace from each line
$> | sed 's/[ \t]*$//'
## Remove leading whitespace from file
$> | awk '!d && NF {sub(/^[[:blank:]]*/,""); d=1} d'
## Remove blank lines from end of file
$> | awk '/^[[:space:]]*$/{p++;next} {for(i=0;i<p;i++){printf "\n"}; p=0; print}'
##------------------------------------------
## Reverse order of lines
$> | sed '1!G;h;$!d'
##------------------------------------------
## Remove \r (carriage return) in a file
$> | sed -i 's/\r//g'
##------------------------------------------
## Convert line to no spaces line with first letter capital
## Convert "this is a sentence to work with" to "ThisIsASentenceToWorkWith"
$> | sed -e 's/^./\U&/' -e 's/ ./\U&/g'  -e 's/ //g'
##========================================== 
##------------------------------------------ 
##------------------------------------------ 
##------------------------------------------ 
##------------------------------------------ 
#########################################################
#                END Cool | Pipes                       #
#########################################################
##
##
##
###########################################################
#                    .bashrc                              #
###########################################################
# /etc/profile.d/best_bash_history.sh
# Save 5,000 lines of history in memory
$> HISTSIZE=10000
# Save 2,000,000 lines of history to disk (will have to grep ~/.bash_history for full listing)
$> HISTFILESIZE=2000000
# Append to history instead of overwrite
$> shopt -s histappend
# Ignore redundant or space commands
$> HISTCONTROL=ignoreboth
# Ignore more
$> HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
# Set time format
$> HISTTIMEFORMAT='%F %T '
# Multiple commands on one line show up as a single line
$> shopt -s cmdhist
# Append new history lines, clear the history list, re-read the history list, print prompt.
$> export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
##==========================================
##  Copy the next section between <<COMMENT1 and COMMENT1 to .bashrc to get a new set of functions and aliases.
<<COMMENT1
###########################################################
#                    .bashrc                              #
###########################################################
###########################################
#                Settings                 #
########################################### 
## If not running interactively, don't do anything
case $- in *i*) ;; *) return;; esac
### Shell Options, Change the setting of each shell option: help shopt
## Append to the history file, don't overwrite it
shopt -s histappend
## Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
## Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"##
## Cool colors, but mc will not work in tty logins
#export TERM=xterm-256color
## Colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
## Enable color support
if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)";  fi
## ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
## Enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then if [ -f /usr/share/bash-completion/bash_completion ]; then . /usr/share/bash-completion/bash_completion; elif [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi; fi
## Use CapLock as second backspace
setxkbmap -option caps:backspace
##
##############
#   Prompt   #
##############
## set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then debian_chroot=$(cat /etc/debian_chroot); fi
## set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in xterm|xterm-color|*-256color) color_prompt=yes;; esac
## uncomment for a colored prompt, if the terminal has the capability.
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then color_prompt=yes; else color_prompt=;     fi; fi
if [ "$color_prompt" = yes ]; then if [[ ${EUID} == 0 ]] ; then PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '; else PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '; fi; else PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '; fi
unset color_prompt force_color_prompt
## If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"; ;; *) ;; esac
##
###############
#   History   #
###############
## Increase the size of the .bash_history file
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
#export HISTFILESIZE='10000'
#export HISTSIZE='5000'
## append to the history file, don't overwrite it
shopt -s histappend
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
# Ignore more
HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
# Set time format
#HISTTIMEFORMAT='%F %T '
##
###########################################
#                Functions                #
###########################################
## Remove $> from each line
##==========================================
# Make changes in .bashrc immediately available 
bashrc-reload() { builtin exec bash ; }
##==========================================
#######
# box #
#######
## Create box of characters around given string 
function box() { t="$1xxxx";c=${2:-#}; echo ${t//?/$c}; echo "$c $1 $c"; echo ${t//?/$c}; }
## Usage, box 'string' character (optional character default is "#") box '   Peace   ' "☮"
##==========================================
## Create a Terminal Calculator, calc 2+2 4 , calc "sqrt(2)" 1.41421356237309504880
function calc() { echo "${1}"|bc -l; }
##==========================================
## search google from cli
function google() { Q="$@";GOOG_URL='https://www.google.com/search?tbs=li:1&q=';AGENT="Mozilla/4.0";stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}");echo "$stream" | grep -o "href=\"/url[^\&]*&amp;" | sed 's/href=".url.q=\([^\&]*\).*/\1/' | sed 's/%3Fv%3D/?v=/';}
##==========================================
## search youtube from cli
function googleyoutube() { Q="$@";GOOG_URL='https://www.google.com/search?tbs=li:1&q=site:youtube.com+';AGENT="Mozilla/4.0";stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}");echo "$stream" | grep -o "href=\"/url[^\&]*&amp;" | sed 's/href=".url.q=\([^\&]*\).*/\1/' | sed 's/%3Fv%3D/?v=/';}
##==========================================
## ???????rip audio from video ??????NOT WORKING??????
### ("$1" for output file & "$2" for input file)
function audioextract() { mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile "$1" "$2" ; }
##==========================================
## Get definition from etymonline.com.
function def() { for term in "$@"; do url="etymonline.com/index.php?term=$term"; curl -s $url | grep "<dd " | sed -e 's/<a[^>]*>\([^<]*\)<[^>]*>/:\1:/g' -e 's/<[^>]*>//g' | fold -sw `[ $COLUMNS -lt 80 ] && echo $COLUMNS || echo 79 `; echo; done; }
##==========================================
## Rip a file with handbrake and good options
function rip() { handbrake -i /dev/dvd -o ${HOME}/${1}.mp4 -L -U -F -f mp4 -e x264 -b 4000 -B 192 ; }
##==========================================
## A function to find a file in the pwd downward32s
function fn() { find . -iname "*$1*" -print; }
##==========================================
## Streams youtube-dl video to mplayer.
## syt 'youtube.com/link' 'anotherlinkto.video'
function syt() { pipe=`mktemp -u`; mkfifo -m 600 "$pipe" && for i in "$@"; do youtube-dl -qo "$pipe" "$i" & mplayer "$pipe" || break; done; rm -f "$pipe"; }
##==========================================
## swap 2 filenames around
function swapname() { local TMPFILE=tmp.$$; mv "$1" $TMPFILE; mv "$2" "$1"; mv $TMPFILE "$2"; }
##==========================================
## Suspend to RAM low power
function suspendnow() { dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend; }
##==========================================
## Display a formated comma seperated spreadsheet .csv for easy viewing.
function sheet() { cat "$1" | sed '1s/^/a,b,c,d,e,f,g,h,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,aa,bb\n/' | column -s , -tn | nl -v 0 ; }
##==========================================
## ls -l with octal permissions
function lso() { ls -l ${1} | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g' ; }
##==========================================
## cd then ls
function cdls() { cd ${1} && ls -h --color=always --group-directories-first ; }
##==========================================
## Search and play youtube videos directly to terminal (no X needed) $> youtubeplay 'Stairway to heaven - Led Zeppelin'. mplayer is pauseable and can skip ahead
function youtubeplay() { youtube-dl -q --max-downloads 1 --no-playlist --default-search ${2:-ytsearch} "$1" -o - | mplayer -vo null /dev/fd/3 3<&0 </dev/tty; }
##==========================================
##Streams youtube-dl video to mplayer.
##syt 'youtube.com/link' 'anotherlinkto.video'
function syt() { pipe=`mktemp -u`; mkfifo -m 600 "$pipe" && for i in "$@"; do youtube-dl -qo "$pipe" "$i" & mplayer "$pipe" || break; done; rm -f "$pipe"; }
##------------------------------------------
## Play in ascii mode: syt-caca 'youtube.com/link' 'anotherlinkto.video'
function syt-caca() { pipe=`mktemp -u`; mkfifo -m 600 "$pipe" && for i in "$@"; do youtube-dl -qo "$pipe" "$i" & mplayer -vo caca "$pipe" || break; done; rm -f "$pipe"; }
##==========================================
# Add an alias to .bashrc
function bashrc() { echo "alias $1='$2'" >> .bashrc ; }
##==========================================
## Evaluate the formulas in a csv spreadsheet.
function csvev() { cat $1 | sed -e '1i,,,,,,,' |sed -e 's/=sum/@sum/g' -e 's/=SUM/@SUM/g' | psc -k -d, | sed -e 's/\"@SUM(/@SUM(/' -e 's/)"/)/' | sed '/@SUM/ { s/rightstring/let/; }' | sed -e '/= "=/s/rightstring/let/' -e '/= "=/s/"//g' | sed 's/= =/= /g' | sc ; }
##==========================================
## List contents of directory by size.
function dusize () { du -sk ./* | sort -n | awk 'BEGIN{ pref[1]="K"; pref[2]="M"; pref[3]="G";} { total = total + $1; x = $1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf("%g%s\t%s\n",int(x*10)/10,pref[y],$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf("Total: %g%s\n",int(total*10)/10,pref[y]); }' ; }
##==========================================
## Get thge weather. Usage 'weather zipcode'. Example 'weather 94114' outputs 'San Francisco, CA | 54.9 degrees F | Overcast'.
#function weather() { curl -s "http://www.wunderground.com/q/zmw:$1.1.99999" | grep "og:title" | cut -d\" -f4 | sed 's/&deg;/ degrees F/'; }
##------------------------------------------
function weather() { curl wttr.in/"$1"; }
##==========================================
## Share file through http 8088 port. Usage: sharefile "FILENAME".
function sharefile() { nc -v -l 8088 < $2 ; }
##==========================================
## Share file through your choice of http port. Usage: sharefile port "FILENAME".
function shareport() { nc -v -l $1 < $2 ; }
##==========================================
## Share current directory through http 8000
function webshare() { python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"; }
##==========================================
## Randow cow says fortune
function fortunecow() { fortune | cowsay -f $(ls /usr/share/cowsay/cows/| sed 's/ /\n/g' | sed -e '/^$/d'| shuf -n1) ; }
##==========================================
## Randow rainbow cow says fortune slowly
function fortunecowlolcat() { fortune | cowsay -f $(ls /usr/share/cowsay/cows/| sed 's/ /\n/g' | sed -e '/^$/d'| shuf -n1) | lolcat -a ; }
##==========================================
## Randow rainbow cow says Corporate BS slowly
function corpcow() { curl -s http://cbsg.sourceforge.net/cgi-bin/live | grep -Eo '^<li>.*</li>' | sed s,\</\\?li\>,,g | shuf -n 1 | cowsay -f $(ls /usr/share/cowsay/cows/| sed 's/ /\n/g' | sed -e '/^$/d'| shuf -n1) | lolcat -a ; }
##==========================================
## Handy Extract Program
function extract() { if [ -f $1 ] ; then case $1 in *.tar.bz2) tar xvjf $1 ;; *.tar.gz) tar xvzf $1 ;; *.bz2) bunzip2 $1 ;; *.rar) unrar x $1 ;; *.gz) gunzip $1 ;; *.tar) tar xvf $1 ;; *.tbz2) tar xvjf $1 ;; *.tgz) tar xvzf $1 ;; *.zip) unzip $1 ;; *.Z) uncompress $1 ;; *.7z) 7z x $1 ;; *) echo "'$1' cannot be extracted via >extract<" ;; esac; else echo "'$1' is not a valid file"; fi; }
##==========================================
## Get IP address information
function ipinfo() { echo "InternalIP" ; ifconfig | grep 'inet ' | grep -v 127.0 | awk '{print $2 }' | sed 's/addr://' ; echo "RouterIP" ; ip route show | grep -i 'default via'| awk '{print $3 }' ; echo "ExternalIP" ; curl ifconfig.co ; }
##==========================================
## Transform Mint Linux 17/18 icons to create any color
function iconcolors() { cp -r /usr/share/icons/Mint-X-Aqua ~/.icons/Mint-X-$1-$2 ; cd ~/.icons/Mint-X-$1-$2 ; grep -ri -l "#a7c6df" | xargs sed -i -e 's/"opacity:0/"opacity:1/g' -e "s/0b5a7d/888889/g" -e "s/a7c6df/$2/g" -e "s/308fba/$1/g" ; }
##==========================================
## Convert matroska mkv video files to mp4 by changing container without reencoding.
function mkv2mp4() { ffmpeg -i "$1" -vcodec copy -acodec copy "$1".mp4 ; }
##==========================================
## Convert video files to mp4 by changing container without reencoding. Useage: copy2mp4 *.mkv
function copy2mp4() { avconv -i  "$1" -c:v copy -c:a copy "$1".mp4 ; }
##==========================================
## Convert video files to mp4 reencoding sound to mp3. Useage: copy2mp4 *.mkv
function copy2mp4mp3() { avconv -i  "$1" -c:v copy -c:a mp3 "$1".mp4 ; }
##==========================================
## Transcode video files to mp4 by changing container and reencoding. Long process. Useage: transcode2mp4 *.avi
function transcode2mp4() { avconv -i  "$1" -c:v libx264 -c:a mp3 "$1".mp4 ; }
##=========================================
## Convert mkv video files to mp4 by changing container without reencoding.
#function 2mp4() { avconv -i *.mkv -c:v copy -c:a copy movie_$(date +%F.%T).mp4 ; }
##==========================================
## Convert video files to mp4 by changing container without reencoding
#function 2mp4() { avconv -i {*.mkv,*.avi} -c:v copy -c:a copy movie_$(date +%F.%T).mp4 ; }
##==========================================
## Set and unset proxy settings.[<proxy-scheme>://]<proxy-host>[:<proxy-port>] Usage: setproxy 173.255.233.249:8888
## Some good proxies https://www.socks-proxy.net/, https://free-proxy-list.net/
function setproxy() { export {http,https,ftp}_proxy="$1" ; }
function unsetproxy() { unset {http,https,ftp}_proxy ; }
##=========================================
## ix, command line patebin
## Examples:
##     ix hello.txt              # paste file (name/ext will be set).
##     echo Hello world. | ix    # read from STDIN (won't set name/ext).t
##     ix -n 1 self_destruct.txt # paste will be deleted after one read.
##     ix -i ID hello.txt        # replace ID, if you have permission.
##     ix -d ID
function ix() { local opts; local OPTIND; [ -f "$HOME/.netrc" ] && opts='-n'; while getopts ":hd:i:n:" x; do case $x in h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;; d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;; i) opts="$opts -X PUT"; local id="$OPTARG";; n) opts="$opts -F read:1=$OPTARG";; esac; done; shift $(($OPTIND - 1)); [ -t 0 ] && { local filename="$1"; shift; [ "$filename" ] && { curl $opts -F f:1=@"$filename" $* ix.io/$id; return; } ; echo "^C to cancel, ^D to send."; } ; curl $opts -F f:1='<-' $* ix.io/$id; }
##==========================================
## Define a bash function to interactively pick a subdirectory to cd into 
function cdb() { select dir in $(find -type d -name "$1" -not -path '*/\.*' -prune); do cd "${dir}" && break; done }
##==========================================
## Find the package that installed a command
function whatinstalled() { which "$@" | xargs -r readlink -f | xargs -r dpkg -S ;}
##==========================================
## Play streaming media, find media at https://goo.gl/pdhhpQ or http://pub7.di.fm/ use as argument the string after Mount Point /
## Some favorite stations: di_bigbeat_aac.flv, di_bigbeat_aacplus, di_breaks_aacplus, di_classictrance_aacplus,
## Usage: streamfm bigbeat
function streamfmls() { w3m -dump http://pub7.di.fm/ | grep 'Mount Point' | grep 'aac ' | sed 's/Mount Point \///g' | sed -e 's/ Login//g' -e 's/di_//g' -e 's/_aac//g' ; }
function streamfm() { mplayer http://pub7.di.fm/di_$1_aac?1 -user-agent "AudioAddict-di/3.2.0.3240 Android/5.1" ; }
##==========================================
## Not working. Unexpected token '(' Do Not Know Why
## Get fully qualified domain names (FQDNs) for IP address with failure and multiple detection.
#function fqdns() { NAME=$(nslookup $1 | sed -n 's/.*arpa.*name = \(.*\)/\1/p'); test -z "$NAME" &&NAME="NO_NAME"; echo "$NAME" ; }
##==========================================
## cleanly list available wireless networks (using iwlist)
function wifiscan() { iwlist $(ifconfig | grep wlan | awk '{print $1 }') scan | sed -ne 's#^[[:space:]]*\(Quality=\|Encryption key:\|ESSID:\)#\1#p' -e 's#^[[:space:]]*\(Mode:.*\)$#\1\n#p' ; }
##==========================================
## Lookup on IMDB Internet Movie Database
function imdb() { w3m -dump "http://www.imdb.com/find?s=all&q="${@}"&x=0&y=0" & }
##==========================================
function showdiff() { wdiff -n -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m' $1 $2 ; }
##==========================================
## Single use vnc-over-ssh connection Usage: sshvnc user@your.ip.add.ress
function sshvnc() { ssh -f -L 5900:localhost:5900 $1 "x11vnc -safer -localhost -nopw -once -display :0" ; vinagre localhost:5900 ; }
##==========================================
## Search through .doc files
function docgrep() { find -name '*.doc' | while read -r file; do catdoc "$file" | grep -l --label="$file" "$1"; done ; }
##==========================================
## Convert diff output to HTML ins/del. Usage: diffhtml file1.txt file2.txt
function diff2html() { diff $1 $2 | grep -E '^(<|>)' | sed 's:^< \(.*\):<del style="color\:red; text-decoration\: none">- \1</del><br>:' | sed 's:^> \(.*\):<ins ## style="color\:green; text-decoration\: none">+ \1</ins><br>:' ; }
##==========================================
## Get a qrcode for a given string. Usage: qrcode "your string or URL"
function qrcode() { echo $1 | curl -F-=\<- qrenco.de ; }
##==========================================
## Search through .doc files
function docsearch() { find -name '*.doc' | while read -r file; do catdoc "$file" | grep -l --label="$file" "$1"; done ; }
##==========================================
##
###########################################
#                Aliases                  #
###########################################
## Use 'echo "alias name='app -a'" >> .bashrc' to add new lines to .bashrc
##
### ls - list directory contents
## Ignore alias by putting backslash before command '\ls'
alias ls='ls -CFh --color=always --group-directories-first '
#alias ls='ls -h --color=always'
#alias ll='ls -l'
#alias la='ls -A'
alias lst='ls -lt --time=atime'                                                    
## Converts the symbolic permissions to octal (ie: numbers) when using 'ls -l': Use function instead.
#alias lso="ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'"
##
### grep - print lines matching a pattern
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
##
### mc - Midnight Commander
alias mcc='mc --colors normal=green,default:selected=brightmagenta,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default'
alias mce='mcedit --colors normal=green,default:selected=brightmagenta,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default'
alias mcg='mc -S gotar'
alias mceg='mcedit -S gotar'
#alias mcedit='mcedit -S gotar'
##
### DOS centric aliases
alias dir="ls -l"
alias ipconfig="ifconfig"
#alias del="rm -iv"
alias del="rm -rfiv"
alias copy="cp -piv"
alias ver="uname -a"
alias mem="free -h"
alias move="mv -iv"
alias rename="mv -iv"
alias type="cat"
alias C:="echo 'No C drive in Linux. Go to your home directory with the command: cd'"
##
alias startx='sudo service mdm start'
alias stopx='sudo service mdm stop'
#alias ..='cd ..'
#alias mv='mv -iv'
alias rm_='rm -iv'
alias ping='ping -c 5'
alias :q='exit'
## Change owner of files in your home folder to you.
alias chownhome='sudo chown -R $USER:$USER ~/'
## disable annoying line wrapping in nano
alias nano='nano -W -m'  
## Only show button events for xev
alias xevs="xev | grep 'keycode\|button'"  
#alias cim='vim'
#alias back='cd $OLDPWD' # use "cd -"
alias root='sudo su'
#alias runlevel='sudo /sbin/init'
alias grep='grep --color=auto'
alias df='df -hT'
#alias gvim='gvim -geom 84x26'
#alias start='dbus-launch startx'
alias ..='cd ..'
## Install a app
alias install='sudo apt-get install'
alias mplay='mplayer -vo caca'
alias cdd='cdls'
alias mplayerfb='mplayer -vo fbdev -fs'
alias asciiplay='mplayer -vo caca'
alias upowersuspend='dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend'
alias sleepnow='upowersuspend'
alias gyt='googleyoutube'
alias battery='upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"'
alias cornerclock='while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &'
alias clr='echo -ne "\033c"'
alias share='sharefile'
alias lanip='for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done'
#alias lssize='stat -c'\%s \%n' **\/* | sort -n'
## Records voice until you stop talking.
alias vrecord='sox -t alsa default ./recording_$(date +%F.%T).flac silence 1 0.1 5% 1 1.0 5%'
## Screenshot of chosen area after 5 seconds.
alias shotarea='sleep 5 && import -frame -strip -quality 75 "$HOME/$(date +%F.%T).png"'
## Displays file types in color. Prints warning messages first. Needs fixing, but works after warnings.
alias filecolors='eval $(echo "rs:global default;fi:normal file;di:directory;ln:symbolic link;pi:named pipe;so:socket;do:door;bd:block device;cd:character device;or:orphan symlink;mi:missing file;su:set uid;sg:set gid;tw:sticky other writable;ow:other writable;st:sticky;ex:executable;"|sed -e 's/:/="/g; s/\;/"\n/g') && { IFS=:; for i in $LS_COLORS; do echo -e "\e[${i#*=}m$( x=${i%=*}; [ "${!x}" ] && echo "${!x}" || echo "$x" )\e[m"; done; }'
## If text fits on single screen it will just display the text and quit so you do not have to press q to quit.
alias less='less -F'
## Search for apps faster
alias apts='apt-cache search'
## List bash alias defined in .bash_profile or .bashrc
alias showallaliases='compgen -A alias'
## List bash functions defined in .bash_profile or .bashrc
alias showallfunctions='compgen -A function'
## show installed but unused linux headers, image, or modules
alias unusedkernels="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'"                                           
## Remove and replace /etc/hosts to block and unblock ad websites
## Block
alias hoston='sudo cat /etc/hosts.big.sort.uniq > /etc/hosts'
## Unblock
alias hostoff='sudo cat /etc/hosts.default > /etc/hosts'
## List computers on network
alias netlist='nmap -sn 192.168.1.0/24'
###########################################################
#                    END .bashrc                          #
###########################################################
#########################
#     added by echo     #
#########################
COMMENT1
##########################
#     More functions     #
##########################
##==========================================
# Get fully qualified domain names (FQDNs) for IP address with failure and multiple detection
$> NAME=$(nslookup $IP | sed -n 's/.*arpa.*name = \(.*\)/\1/p'); test -z "$NAME" &&NAME="NO_NAME"; echo "$NAME"
##------------------------------------------
# Get fully qualified domain names (FQDNs) for IP address with failure and multiple detection
$> fuction fqdns() { NAME=$(nslookup $1 | sed -n 's/.*arpa.*name = \(.*\)/\1/p'); test -z "$NAME" &&NAME="NO_NAME"; echo "$NAME" ; }
##==========================================
## geolocate a given IP address
$> function ip2loc() { wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g'; }
##==========================================
## cleanly list available wireless networks (using iwlist). Usage: wifiscan wlan0
$> function wifiscan() { iwlist $1 scan | sed -ne 's#^[[:space:]]*\(Quality=\|Encryption key:\|ESSID:\)#\1#p' -e 's#^[[:space:]]*\(Mode:.*\)$#\1\n#p' ; }
##==========================================
## Show all strings (ASCII & Unicode) in a file	
$> function allStrings() { cat "$1" | tr -d "\0" | strings ; }
##==========================================
## Find all videos under current directory using MIME a.k.a not using extension
$> function findvid() { find ./ -type f -print0 | xargs -0 file -iNf - | grep ": video/" | cut -d: -f1 ; }
##==========================================
# Temporarily add to PATH	
$> function apath() { if [ $# -lt 1 ] || [ $# -gt 2 ]; then echo "Temporarily add to PATH"; echo "usage: apath [dir]"; else PATH=$1:$PATH; fi; }
##==========================================
## grep by paragraph instead of by line
$> function grepp() { [ $# -eq 1 ] && perl -00ne "print if /$1/i" || perl -00ne "print if /$1/i" < "$2";}
##==========================================
## Convert temperatures
$> function F2C() { echo "($1-32)/1.8" | bc ; }
$> function C2F() { echo "($1*1.8)+32" | bc ; }
##==========================================
## ruler that stretches across the terminal
$> function ruler() { for s in '....^....|' '1234567890'; do w=${#s}; str=$( for (( i=1; $i<=$(( ($COLUMNS + $w) / $w )) ; i=$i+1 )); do echo -n $s; done ); str=$(echo $str | cut -c -$COLUMNS) ; echo $str; done; }
##==========================================
## Backup a file with a date-time stamp	
## Usage "bu filename.txt"
$> function bu() { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }
##==========================================
## Delete function
$> function del() { mv "$@" "/${HOME}/.local/share/Trash/files/" ; }
##==========================================
## turns the display off and will stay off until this command is run again or cancelled, even after key/cursor is touched
$> function display-offed() { LF=/tmp/screen-lock; if [ -f $LF ]; then /bin/rm $LF; else touch $LF; sleep .5; while [ -f  $LF ]; do xset dpms force off; sleep 2; done; fi ; }
##==========================================
## view someone's twitter stream from terminal
$> function grabtweets() { curl -s "twitter.com/$1" | sed -ne '/entry-content/{s/<[^>]*>//g;s/^[ \t]*//;p}'; }
##==========================================
## Resizing an image	
## USAGE: image_resize "percentage of image resize" "input image" "output image"
$> function image_resize() { convert -sample "$1"%x"$1"% "$2" "$3" ; }
##==========================================
## Using PIPEs, Execute a command, convert output to .png file, upload file to imgur.com, then returning the address of the .png.
$> function imgur() { convert label:@- png:-|curl -F "image=@-" -F "key=1913b4ac473c692372d108209958fd15" http://api.imgur.com/2/upload.xml|grep -E -o "<original>(.)*</original>" | grep -E -o "http://i.imgur.com/[^<]*" ; }
##==========================================
## Convert the first letter into lowercase letters
$> function lcfirst() { if [ -n "$1" ]; then perl -e 'print lcfirst('$1')'; else cat - | perl -ne 'print lcfirst($_)'; fi; }
##==========================================
## Lookup on IMDB Internet Movie Database
$> function imdb() { w3m -dump "http://www.imdb.com/find?s=all&q="${@}"&x=0&y=0" & }
##==========================================
## NOT WORKING
## ThePirateBay.org torrent search	
$> function piratebay() { lynx -dump https://proxyspotting.in/s/?q=$1&page=0&orderby=99|awk '/TPB.torrent$/ {print $2}' ; }
##==========================================
## Screenshot of chosen area
$> function shot() { sleep 5 ; import -frame -strip -quality 75 "$HOME/$(date +%s).png" ; }
$> alias shotarea='sleep 5 ; import -frame -strip -quality 75 "$HOME/$(date +%s).png"'
##==========================================
## Create an easy to pronounce temporary shortened URL from shoutkey.com
$> function shoutkey() { curl -s "http://shoutkey.com/new?url=$1" | sed -n 's/\<h1\>/\&/p' | sed 's/<[^>]*>//g;/</N;//b' ; }
##==========================================
$> function showdiff() { wdiff -n -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m' $1 $2 ; }
##==========================================
## Search and play youtube videos directly to terminal (no X needed) ytmp 'Stairway to heaven - Led Zeppelin' mplayer is pauseable and can skip ahead
$> function ytmp() { youtube-dl -q --max-downloads 1 --no-playlist --default-search ${2:-ytsearch} "$1" -o - | mplayer -vo null /dev/fd/3 3<&0 </dev/tty; }
##==========================================
## Randomly run command
$> function ran() { [ $((RANDOM%100)) -lt "$1" ] && shift && "$@"; }
## Randomly decide whether to run a command, or fail.
## Useful for testing purposes.
## Usage: ran PERCENTAGE COMMAND [ARGS]
## Note: In this version the percentage is required.
## This is like @sesom42 and @snipertylers commands but in a USABLE form.
## e.g. In your complicated shell script, put "ran 99" before a crucial component.
## Now, it will fail 1% of the time allowing you to test the failure code-path.
##==========================================
## Play online music videos in terminal
$> function pvl() { (for i in "$@"; do youtube-dl -q --max-downloads 1 --no-playlist "$i" -o - | mplayer -vo null /dev/fd/3 3<&0 </dev/tty; sleep .5; done); }015-
## pvl 'link1' 'link2' 'link3'
## Play Youtube, Vimeo, etc links without visual elements.
## Great for music videos when you just want the audio.
## You can control mplayer with this!
## Hit Ctrl-C twice to exit (if youre playing multiple files)
##==========================================
## Make changes in .bashrc immediately available
$> function bashrc-reload() { builtin exec bash ; }
##==========================================
## Find the package that installed a command 
$> function whatinstalled() { which "$@" | xargs -r readlink -f | xargs -r dpkg -S ;}
##==========================================
$> function phase() { while :; do for n in E4 F#4 B4 C#5 D5 F#4 E4 C#5 B4 F#4 D5 C#5; do /usr/bin/play -qn synth $1 pluck $n; done; echo -n "[$1]"; done; }; phase 0.13 & phase 0.131 &
## The Piano Phase piece, by Steve Reich is a minimalist composition which is played on two pianos played at slightly different tempos, a task thats very difficult to accomplish by human players. The auditive effects produced by the cell displacement produce beautiful patterns. See https://en.wikipedia.org/wiki/Piano_Phase . My rendered version: https://ydor.org/SteveReich/piano_phase.mp3
## Requires sox to be installed on the system.
## There are multiple videos on youtube showing different approaches and experiences to this interpretation. There is also a synthesized version.
## Even if Bash can behave as a powerful pianist, a simple threaded version leaves full room to several time glitches and even negative displacements, the same issues that human pianists experience when playing the piece. The older the computer, the better the chaos added to the result due to the CPU load. Apparently thats the reason Steve Reich composes pieces such as this.
## Without further ado, please give a warm welcome to the Bash minimalist player on synthesized two-threaded pianos. Please turn off your cellphones.
##==========================================
$> function Zscrypt(){ [ -n "$1" ]&&{ echo '. <(echo "$(tail -n+2 $0|base64 -d|mcrypt -dq)"); exit;'>$1.scrypt;cat $1|mcrypt|base64 >>$1.scrypt;chmod +x $1.scrypt;};}
## Bash scripts encryption and passphrase-protection
## This function will encrypt a bash script and will only execute it after providing the passphrase. Requires mcrypt to be installed on the system.
## cat hello
## #!/bin/bash
## case "$1" in
## ""|-h) echo "This is the fantastic Hello World. Try this:" $(basename $0) "[entity]" ;;
## moon) echo Good night. ;;
## sun) echo Good morning. ;;
## world) echo "Hello, world!" ;;
## *) echo Hi, $@. ;;
## esac
## scrypt hello
## Enter the passphrase (maximum of 512 characters)
## Please use a combination of upper and lower case letters and numbers.
## Enter passphrase:
## Enter passphrase:
## Stdin was encrypted.
## cat hello.scrypt
## . <(echo "$(/usr/bin/tail -n+2 $0|base64 -d|mcrypt -dq)");exit;
## AG0DQHJpam5kYWVsLTEyOAAgAGNiYwBtY3J5cHQtc2hhMQAV34412aaE8sRzQPQzi09YaNQPedBz
## aGExAARvB6A/HYValW4txoCFmrlp57lmvhKBbM4p+OUiZcCxr6Y+Mm7ogg3Y14pHi0CrfT70Tubq
## 9g8/kNJrQr7W/ogHpVuOOdD0YfuRatrV7W2+OlNQ63KX780g4qTHrTqNnyLp8sF5RQ7GwxyZ0Oti
## kROtVIU4g4+QAtn/k/e7h7yt4404VF1zzCYRSw20wmJz1o/Z0XO7E/DFBr5Bau7bWjnF7CRVtims
## HGrDwv1miTtAcyB9PknymDxhSyjDUdNhqXGBIioUgqjX1CKgedtO0hQp050MiQd3I6HacpSrVUIW
## kuuS+BtMrxHDy+48Mh1hidV5JQFP7LP5k+yAVLpeHd2m2eIT1rjVE/Bp2cQVkpODzXcWQDUAswUd
## vulvj/kWDQ==
## ./hello
## This is the fantastic Hello World. Try this: hello [entity]
## ./hello.scrypt
## Enter passphrase:
## This is the fantastic Hello World. Try this: hello.scrypt [entity]
## ./hello world
## Hello, world!
## ./hello.scrypt world
## Enter passphrase:
## Hello, world!
##==========================================
## Recording SSH sessions in a log file. The -a option appends the output to the end of file instead of writing over it.
$> ssh -l USER HOST | tee -a /path/to/file
$> function sshlog () { \ssh $@ 2>&1 | tee -a $(date +%Y%m%d).log; }
## You can also create an alias in ~/.bashrc to record your session when using ssh:
$> alias ssh=sshlog
##==========================================
## Search through .doc files
$> function docsearch() { find -name '*.doc' | while read -r file; do catdoc "$file" | grep -l --label="$file" "$1"; done ; }
##==========================================
## Convert diff output to HTML ins/del. Usage: diffhtml file1.txt file2.txt
$> function diffhtml() { diff $1 $2 | grep -E '^(<|>)' | sed 's:^< \(.*\):<del style="color\:red; text-decoration\: none">- \1</del><br>:' | sed 's:^> \(.*\):<ins ## style="color\:green; text-decoration\: none">+ \1</ins><br>:'
##==========================================
## Display headlines from current news.  First get a apiKey from newsapi.org. 
$> function getnews () { curl https://newsapi.org/v2/top-headlines -s -G -d sources=$1 -d apiKey=noapikeyforyou | jq '.articles[] | .title'; }
## or
$> function getnews () { curl https://newsapi.org/v2/top-headlines -s -G -d sources=$1 -d apiKey=YourAPIKeyNumber | jq -r '.articles[] | .title, .url, ""' ; }
##------------------------------------------
$> function startmyday () {
$>  echo "Good morning."
$>  echo "\nUpdating Homebrew..."
$>  brew update && brew upgrade
$>  echo "\nThe weather right now:"
$>  ansiweather
$>  echo "\nNews from the BBC:"
$>  getnews bbc-news
$>  echo "\nNews from the Washington Post:"
$>  getnews the-washington-post
$>  echo "\nNews from Hacker News:"
$>  getnews hacker-news
$>}
##==========================================
$> function startmyday () {echo "Good morning.";   echo "\nUpdating Homebrew...";   brew update && brew upgrade;   echo "\nThe weather right now:";   ansiweather;   echo "\nNews from the BBC:";   getnews bbc-news;   echo "\nNews from the Washington Post:";   getnews the-washington-post;   echo "\nNews from Hacker News:";   getnews hacker-news; }
##==========================================
# /etc/profile.d/best_bash_history.sh
# Save 5,000 lines of history in memory
$> HISTSIZE=10000
# Save 2,000,000 lines of history to disk (will have to grep ~/.bash_history for full listing)
$> HISTFILESIZE=2000000
# Append to history instead of overwrite
$> shopt -s histappend
# Ignore redundant or space commands
$> HISTCONTROL=ignoreboth
# Ignore more
$> HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
# Set time format
$> HISTTIMEFORMAT='%F %T '
# Multiple commands on one line show up as a single line
$> shopt -s cmdhist
# Append new history lines, clear the history list, re-read the history list, print prompt.
$> export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
##==========================================
##==========================================
###########################################################
#                    END .bashrc                          #
###########################################################
##
##
##
##############################
#        Framebuffer         #
##############################
##------------------------------------------
##==========================================
$> sudo apt-get install fbi                          ## Framebuffer image viewer for tty login only, NO X gui running
$> sudo apt-get install fbterm                       ## Framebuffer terminal
##==========================================
## Watch video without X gui server, using framebuffer
$> sudo chmod 777 /dev/fb0
$> mplayer -vo fbdev2 -fs -zoom -x 1024 -y 768 FILENAME.avi
##------------------------------------------
## Look at photos in framebuffer without starting X
$> fbi 
## specify the framebuffer device, which should be:
$> fbi -d /dev/fb0 [...]
## Using ssh, try:
$> fbi -T 1 [...]
##------------------------------------------
## Framebuffer terminal
$> fbterm
##------------------------------------------
## Pay video in freamebuffer in tty login without GUI
$> sudo chmod 777 /dev/fb0
$> mplayer -vo fbdev2 -fs FILENAME.avi
## Set video size to screen size
$> mplayer -vo fbdev2 -fs -zoom -x 1024 -y 768 FILENAME.mp4
##==========================================
## view videos using OMXPlayer:
$> omxplayer -o hdmi video.h264
##==========================================
##==========================================
##==========================================
##==========================================
##==========================================
##==========================================
##############################
#      END Framebuffer       #
##############################
##
##
##
#################################################### 
#                    DANGER                        #
#################################################### 
## 
## bash fork bomb crashes a computer
## $> :(){ :|:& };:
##  Explanation
##  :()        #defines a function called : (accepts no arguments)
##  { :|:& };  #This is the function: It calls the function itself and pipes the output to the same function ":" and puts the process in the background. (Recursive invocation) with ; it ends the function definition
##  :          #Calls the function and creates havoc.
##==========================================
## rm remove delete ALL files
## $> rm -fr * # system32
## 
##==========================================
## Command-line russian roulette
## $> [ $[ $RANDOM % 6 ] = 0 ] && rm -rf --no-preserve-root / || echo "Click"
##==========================================
## https://www.tomshardware.com/news/x86-hidden-god-mode,37582.html
## Some x86 CPUs, VIA C3 Nehemiah chips made in 2003, have hidden backdoors that let you seize root by sending a command to an undocumented RISC core that manages the main CPU,
## The command -- ".byte 0x0f, 0x3f" in Linux -- "isn't supposed to exist, doesn't have a name, and gives you root right away," Domas said, adding that he calls it "God Mode." 
## $> .byte 0x0f, 0x3f
##==========================================
##==========================================
#################################################### 
#                   END DANGER                     #
#################################################### 
## 
## 
## 
#################################################
#               Python Stuff                    #
#################################################
##==========================================
<<COMMENT1
python stuff

triple quotes
"""
Multiple
lines
printed
"""

Escape What it does.
\\ Backslash (\)
\' Single- quote (')
\" Double- quote (")
\a ASCII bell (BEL)
\b ASCII backspace (BS)
\f ASCII formfeed (FF)
\n ASCII linefeed (LF)
\N{name} Character named name in the Unicode database (Unicode only)
\r ASCII carriage return (CR)
\t ASCII horizontal tab (TAB)
\uxxxx Character with 16- bit hex value xxxx (Unicode only)
\Uxxxxxxxx Character with 32- bit hex value xxxxxxxx (Unicode only)
\v ASCII vertical tab (VT)
\ooo Character with octal value oo
\xhh Character with hex value hh

COMMENT1
#################################################
#           END Python Stuff                    #
#################################################
## 
## 
## 
##################################################
#               Extra Characters                 #
##################################################
## GUI 
## Use accented characters like ë, ï, é, etc, which do not have dedicated keys on a qwerty layout.
## To enable this feature go to the keyboard preferences (menu > "Settings" > "Keyboard").
## Then, go to the tab "Layouts" and press the "Layout Options..." key at the bottom. Under "Compose key position" you can enable the compose key of your liking (which is [Alt Gr] aka "Right Alt" for me).
## A handy way under Linux is to use a "compose key" ([Alt Gr] on my setup), which allows you to compose accented characters by entering the accent (umlaut, accent grave, ...) and the unaccented character separately.
##
#$> é   [Alt Gr] ['] [e]
#$> è   [Alt Gr] [`] [e]
#$> ü   [Alt Gr] ["] [u]
#$> ô   [Alt Gr] [^] [o]
#$> ç   [Alt Gr] [,] [c]
#$> ñ   [Alt Gr] [~] [n]
#$> å   [Alt Gr] [o] [a]
#$> æ   [Alt Gr] [a] [e]
#$> Œ   [Alt Gr] [O] [E]
#$> ø   [Alt Gr] [/] [o]
#$> ß   [Alt Gr] [s] [s]
#$> î   [Alt Gr] [^] [i]
#$> â   [Alt Gr] [^] [a]
##
##==========================================
<<COMMENT1
Extra Characters to cut and paste
✿ ☺ ☻ ☹ ☼ ☂ ☃ ⌇ ⚛ ⌨ ✆ ☎ ⌘ ⌥ ⇧ ↩ ✞ ✡ ☭ ← → ↑ ↓ ➫ ⬇ ⬆ ☜ ☞ ☝ ☟ ✍ ✎ ✌ ☮ 
✔ ★ ☆ ♺ ⚑ ⚐ ✉ ✄ ⌲ ✈ ♦ ♣ ♠ ♥ ❤ ♡ ♪ ♩ ♫ ♬ ♯ ♀ ♂ ⚤ ⚥ ⚢ ⚣ ❑ ❒ ◈ ◐ ◑ ✖ ∞ 
« » ‹ › “ ” ‘ ’ „ ‚ – — | ⁄ \ [ ] { } § ¶ ¡ ¿ ‽ ⁂ ※ ± × ~ ≈ ÷ ≠ π †
‡ ¥ € $ ¢ £ ß © ® @ ™ ° ‰ … · • ● 
૱ ꠸ ┯ ┰ ┱ ┲ ❗ ► ◄ Ă ă 0 1 2 3 4 5 6 7 8 9 Ǖ ǖ Ꞁ ¤ ­ Ð ¢ ℥ Ω ℧ K ℶ ℷ ℸ ⅇ ⅊ 
⚌ ⚍ ⚎ ⚏ ⚭ ⚮ ⌀ ⏑ ⏒ ⏓ ⏔ ⏕ ⏖ ⏗ ⏘ ⏙ ⏠ ⏡ ⏦
ᶀ ᶁ ᶂ ᶃ ᶄ ᶆ ᶇ ᶈ ᶉ ᶊ ᶋ ᶌ ᶍ ᶎ ᶏ ᶐ ᶑ ᶒ ᶓ ᶔ ᶕ ᶖ ᶗ ᶘ ᶙ ᶚ ᶸ ᵯ ᵰ ᵴ ᵶ ᵹ ᵼ ᵽ ᵾ ᵿ ⁁ ⁊⸜ ⸝ ¶ ¥ £ 
⅕ ⅙ ⅛ ⅔ ⅖ ⅗ ⅘ ⅜ ⅚ ⅐ ⅝ ↉ ⅓ ⅑ ⅒ ⅞ 
← ↑ → ↓ ↔ ↕ ↖ ↗ ↘ ↙ ↚ ↛ ↜ ↝ ↞ ↟ ↠ ↡ ↢ ↣ ↤ ↥ ↦ ↧ ↨ ↩ ↪ ↫ ↬ ↭ ↮ 
↯ ↰ ↱ ↲ ↳ ↴ ↵ ↶ ↷ ↸ ↹ ↺ ↻ ↼ ↽ ↾ ↿ ⇀ ⇁ ⇂ ⇃ ⇄ ⇅ ⇆ ⇇ ⇈ ⇉ ⇊ ⇋ ⇌ ⇍
⇎ ⇏ ⇐ ⇑ ⇒ ⇓ ⇔ ⇕ ⇖ ⇗ ⇘ ⇙ ⇚ ⇛ ⇜ ⇝ ⇞ ⇟ ⇠ ⇡ ⇢ ⇣ ⇤ ⇥ 
⇦ ⇨ ⇩ ⇪ ⇧ ⇫ ⇬ ⇭ ⇮ ⇯ ⇰ ⇱ ⇲ ⇳ ⇴ ⇵ ⇶ ⇷ ⇸ ⇹ ⇺ ⇻ ⇼ ⇽ ⇾ ⇿ ⟰ ⟱ ⟲ ⟳ ⟴
⟵ ⟶ ⟷ ⟸ ⟹ ⟺ ⟻ ⟼ ⟽ ⟾ ⟿ ⤀ ⤁ ⤂ ⤃ ⤄ ⤅ ⤆ ⤇ ⤈ ⤉ ⤊ ⤋ ⤌ ⤍ ⤎ ⤏ ⤐ ⤑ 
⤒ ⤓ ⤔ ⤕ ⤖ ⤗ ⤘ ⤙ ⤚ ⤛ ⤜ ⤝ ⤞ ⤟ ⤠ ⤡ ⤢ ⤣ ⤤ ⤥ ⤦ ⤧ ⤨ ⤩ ⤪ ⤫ ⤬ ⤭ ⤮ ⤯ ⤰ ⤱ ⤲
⤳ ⤴ ⤵ ⤶ ⤷ ⤸ ⤹ ⤺ ⤻ ⤼ ⤽ ⤾ ⤿ ⥀ ⥁ ⥂ ⥃ ⥄ ⥅ ⥆ ⥇ ⥈ ⥉
⥊ ⥋ ⥌ ⥍ ⥎ ⥏ ⥐ ⥑ ⥒ ⥓ ⥔ ⥕ ⥖ ⥗ ⥘ ⥙ ⥚ ⥛ ⥜ ⥝ ⥞ ⥟ ⥠ ⥡ ⥢ ⥣ ⥤ ⥥ ⥦ ⥧ ⥨ ⥩ ⥪ ⥫ ⥬ ⥭
⥮ ⥯ ⥰ ⥱ ⥲ ⥳ ⥴ ⥵ ⥶ ⥷ ⥸ ⥹ ⥺ ⥻ ⥼ ⥽ ⥾ ⥿ 
➔ ➘ ➙ ➚ ➛ ➜ ➝ ➞ ➝ ➞ ➟ ➠ ➡ ➢ ➣ ➤ ➥ ➦ ➧ ➨ ➩ ➩ ➪ ➫ ➬ ➭ ➮ ➯ ➱ ➲ ➳ ➴ ➵ ➶ ➷ ➸ ➹ ➺ ➻ ➼ ➽ ➾ 
⬀ ⬁ ⬂ ⬃ ⬄ ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬌ ⬍ ⬎ ⬏ ⬐ ⬑ ☇ ☈ ⏎ ⍃ ⍄ ⍅ ⍆ ⍇ ⍈ ⍐ ⍗ ⍌ ⍓ ⍍ ⍔ ⍏ ⍖ ♾ ⎌ ☊ ☋ ☌ ☍
⌃ ⌄ ⌤ ⌅ ⌆ ⌇ ⚋ ⚊ ⌌ ⌍ ⌎ ⌏ ⌐ ⌑ ⌔ ⌕ ⌗ ⌙ ⌢ ⌣ ⌯ ⌬ ⌭ ⌮ ⌖ ⌰ ⌱ ⌲ ⌳
⌴ ⌵ ⌶ ⌷ ⌸ ⌹ ⌺ ⌻ ⌼ ⍯ ⍰ ⌽ ⌾ ⌿ ⍀ ⍁ ⍂ ⍉ ⍊ ⍋ ⍎ ⍏ ⍑ ⍒ ⍕ ⍖ ⍘ ⍙ ⍚ ⍛ ⍜ ⍝ ⍞ ⍠ ⍟
⍡ ⍢ ⍣ ⍤ ⍥ ⍨ ⍩ ⍦ ⍧ ⍬ ⍿ ⍪ ⍮ ⍫ ⍱ ⍲ ⍭ ⍳ ⍴ ⍵ ⍶ ⍷ ⍸ ⍹ ⍺ ⍼ ⍽ ⍾ ⎀ ⎁ ⎂ ⎃ ⎄ ⎅
⎆ ⎉ ⎊ ⎋ ⎍ ⎎ ⎏ ⎐ ⎑ ⎒ ⎓ ⎔ ⎕ ⏣ ⌓ ⏥ ⏢ ⎖ ⎲ ⎳ ⎴ ⎵ ⎶ ⎸ ⎹ ⎺ ⎻ ⎼ ⎽ ⎾ ⎿
⏀ ⏁ ⏂ ⏃ ⏄ ⏅ ⏆ ⏇ ⏈ ⏉ ⏉ ⏋ ⏌ ⏍ ⏐ ⏤ ⏚ ⏛ Ⓝ ℰ ⓦ !       ⌘ « » ‹ ›
‘ ’ “ ” „ ‚ ❝ ❞ £ ¥ € $ ¢ ¬ ¶ @ § ® © ™ ° × π ± √ ‰ Ω ∞ ≈ ÷ ~ ≠ 
¹ ² ³ ½ ¼ ¾ ‐ – — | ⁄ \ [ ] { } † ‡ … · • ● ⌥ ⌃ ⇧ ↩ ¡ ¿ ‽ ⁂ ∴ ∵ ◊ ※ ← → ↑ ↓ 
☜ ☞ ☝ ☟ ✔ ★ ☆ ♺ ☼ ☂ ☺ ☹ ☃ ✉ ✿ ✄ ✈ ✌ ✎ ♠ ♦ ♣ ♥ ♪ ♫ ♯ ♀ ♂ α ß 
Á á À à Å å Ä ä Æ æ Ç ç É é È è Ê ê Í í Ì ì Î î Ñ ñ Ó ó Ò ò Ô ô Ö ö Ø ø Ú ú Ù ù Ü ü Ž ž ₳ 
฿ ￠ € ₡ ¢ ₢ ₵ ₫ ￡ £ ₤ ₣ ƒ ₲ ₭ ₥ ₦ ₱ ＄ $ ₮ ₩ ￦ ¥ ￥ ₴ ₰
~ ƻ Ƽ ƽ ¹ ¸ ¬ ¨ ɂ ǁ ¯ Ɂ ǂ ¡ ´ ° ꟾ ¦ } { | . , · ] ) [ / _ \ ¿ º §  * - + ( 
! & % $ ¼ ¾ ½ ¶ © ® @ ẟ Ɀ  Ȿ ^ ꜠ ꜡ ỻ  = : ; < ꞌ Ꞌ ꞊ ꞁ ꞈ ꞉ > ? ÷ ℾ ℿ ℔ ℩ ℉ ⅀ ℈
þ ð Þ µ ª ꝋ ꜿ Ꜿ ⱽ ⱺ ⱹ ⱷ ⱶ Ⱶ ⱴ ⱱ Ɒ ⱦ ȶ ȴ ȣ Ȣ ȡ ȝ Ȝ ț ȋ Ȋ ȉ Ȉ ǯ Ǯ ǃ ǀ ƿ ƾ ƺ ƹ Ƹ Ʒ 
Ʋ ư ƪ ƣ Ƣ Ɵ ƛ Ɩ ƕ ƍ ſ ỽ ⸀ ⸁ ⸂ ⸃ ⸄ ⸅ ⸆ ⸇ ⸈ ⸉ ⸊ ⸋ ⸌ ⸍ ⸎ ⸏ ⸐ ⸑ ⸒ ⸔ ⸕ 
▲ ▼ ◀ ▶ ◢ ◣ ◥ ◤ △ ▽ ◿ ◺ ◹ ◸ ▴ ▾ ◂ ▸ ▵ ▿ ◃ ▹ ◁ ▷ ◅ ▻ ◬ ⟁ ⧋ ⧊ ⊿ ∆ ∇ ◭ ◮ ⧩ ⧨ ⌔ ⟐ ◇ ◆ ◈ ⬖ ⬗ ⬘ ⬙
⬠ ⬡ ⎔ ⋄ ◊ ⧫ ⬢ ⬣ ▰ ▪ ◼ ▮ ◾ ▗ ▖ ■ ∎ ▃ ▄ ▅ ▆ ▇ █ ▌ ▐ ▍ ▎ ▉ ▊ ▋ ❘ ❙ ❚ ▀ ▘ ▝ ▙ ▚ ▛ ▜ ▟ ▞ ░ ▒ ▓ ▂ ▁ ▬ ▔ 
▫ ▯ ▭ ▱ ◽ □ ◻ ▢ ⊞ ⊡ ⊟ ⊠ ▣ ▤ ▥ ▦ ⬚ ▧ ▨ ▩ ⬓ ◧ ⬒ ◨ ◩ ◪ ⬔ ⬕ ❏ ❐ ❑ ❒ ⧈ ◰ ◱ ◳ ◲ ◫ ⧇ ⧅ ⧄ ⍁ ⍂ ⟡ ⧉ ⚬ ○ ⚪
◌ ◍ ◎ ◯ ❍ ◉ ⦾ ⊙ ⦿ ⊜ ⊖ ⊘ ⊚ ⊛ ⊝ ● ⚫ ⦁ ◐ ◑ ◒ ◓ ◔ ◕ ⦶ ⦸ ◵ ◴ ◶ ◷ ⊕ ⊗ ⦇ ⦈ ⦉ ⦊
❨ ❩ ⸨ ⸩ ◖ ◗ ❪ ❫ ❮ ❯ ❬ ❭ ❰ ❱ ⊏ ⊐ ⊑ ⊒ ◘ ◙ ◚ ◛ ◜ ◝ ◞ ◟ ◠ ◡ ⋒ ⋓ ⋐ ⋑ ╰ ╮ ╭ ╯ ⌒ ╳ ✕ ╱ ╲ ⧸ ⧹
⌓ ◦ ❖ ✖ ✚ ✜ ⧓ ⧗ ⧑ ⧒ ⧖ _ ⚊ ╴ ╼ ╾ ‐ ⁃ ‑ ‒ - – ⎯ — ― ╶ ╺ ╸ ─ ━ ┄ ┅ ┈ ┉ ╌ ╍ ═ ≣ ≡ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
╵ ╷ ╹ ╻ │ ▕ ▏ ┃ ┆ ┇ ┊ ╎ ┋ ╿ ╽ ┌ ┍ ┎ ┏ ┐ ┑ ┒ ┓ └ ┕ ┖ ┗ ┘ ┙ ┚ ┛ ├ ┝ ┞ ┟ ┠ ┡ ┢ ┣ ┤ ┥ ┦ ┧ ┨ ┩ ┪ ┫ 
┬ ┭ ┮ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻ ┼ ┽ ┾ ┿ ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ╏ ║ ╔ ╒ ╓ ╕ ╖ ╗ ╚ ╘ ╙ ╛ ╜ ╝ ╞ ╟ ╠ ╡ ╢ ╣ 
╤ ╥ ╦ ╧ ╨ ╩ ╪ ╫ ╬ ⌞ ⌟ ⌜ ⌝ ⌊ ⌋ ⌉ ⌈ ⌋ ₯ ἀ ἁ ἂ ἃ ἄ ἅ ἆ ἇ Ἀ Ἁ Ἂ Ἃ Ἄ Ἅ Ἆ Ἇ ἐ ἑ ἒ ἓ ἔ ἕ Ἐ Ἑ Ἒ Ἓ Ἔ Ἕ 
ἠ ἡ ἢ ἣ ἤ ἥ ἦ ἧ Ἠ Ἡ Ἢ Ἣ Ἤ Ἥ Ἦ Ἧ ἰ ἱ ἲ ἳ ἴ ἵ ἶ ἷ Ἰ Ἱ Ἲ Ἳ Ἴ Ἵ Ἶ Ἷ ὀ ὁ ὂ ὃ ὄ ὅ Ὀ Ὁ Ὂ Ὃ Ὄ Ὅ
ὐ ὑ ὒ ὓ ὔ ὕ ὖ ὗ Ὑ Ὓ Ὕ Ὗ ὠ ὡ ὢ ὣ ὤ ὥ ὦ ὧ Ὠ Ὡ Ὢ Ὣ Ὤ Ὥ Ὦ Ὧ ὰ ά ὲ έ ὴ ή ὶ ί ὸ ό ὺ ύ ὼ ώ
ᾀ ᾁ ᾂ ᾃ ᾄ ᾅ ᾆ ᾇ ᾈ ᾉ ᾊ ᾋ ᾌ ᾍ ᾎ ᾏ ᾐ ᾑ ᾒ ᾓ ᾔ ᾕ ᾖ ᾗ ᾘ ᾙ ᾚ ᾛ ᾜ ᾝ ᾞ ᾟ ᾠ ᾡ ᾢ ᾣ ᾤ ᾥ ᾦ ᾧ
ᾨ ᾩ ᾪ ᾫ ᾬ ᾭ ᾮ ᾯ ᾰ ᾱ ᾲ ᾳ ᾴ ᾶ ᾷ Ᾰ Ᾱ Ὰ Ά ᾼ ᾽ ι ᾿ ῀ ῁ ῂ ῃ ῄ ῆ ῇ Ὲ Έ Ὴ Ή ῌ ῍ ῎ ῏
ῐ ῑ ῒ ΐ ῖ ῗ Ῐ Ῑ Ὶ Ί ῝ ῞ ῟ ῠ ῡ ῢ ΰ ῤ ῥ ῦ ῧ Ῠ Ῡ Ὺ Ύ Ῥ ῭ ΅ ` ῲ ῳ ῴ ῶ ῷ Ὸ Ό Ὼ Ώ ῼ ´ ῾
Ͱ ͱ Ͳ ͳ ʹ ͵ Ͷ ͷ ͺ ͻ ͼ ͽ ; ΄ ΅
Ά · Έ Ή Ί Ό Ύ Ώ ΐ Α Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω 
Ϊ Ϋ ά έ ή ί ΰ α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ ς σ τ υ φ χ ψ ω ϊ ϋ ό ύ ώ ϐ ϑ ϒ ϓ ϔ
ϕ ϖ ϗ Ϙ ϙ Ϛ ϛ Ϝ ϝ Ϟ ϟ Ϡ ϡ Ϣ ϣ Ϥ ϥ Ϧ ϧ Ϩ ϩ Ϫ ϫ Ϭ ϭ Ϯ ϯ ϰ ϱ ϲ ϳ ϴ ϵ ϶ Ϸ ϸ Ϲ Ϻ ϻ ϼ Ͻ Ͼ Ͽ
Ⓐ ⓐ ⒜ A a Ạ ạ Ả ả Ḁ ḁ Â Ã Ǎ ǎ Ấ ấ Ầ ầ Ẩ ẩ Ȃ ȃ Ẫ ẫ Ậ ậ À Á Ắ ắ Ằ ằ Ẳ ẳ Ẵ ẵ Ặ ặ Ā ā
Ą ą Ǟ Ȁ ȁ Å Ǻ ǻ Ä ä ǟ Ǡ ǡ â á å ã à ẚ Ȧ ȧ Ⱥ Å ⱥ Æ æ Ǽ Ǣ ǣ Ɐ Ꜳ ꜳ Ꜹ Ꜻ Ɑ ꜹ ꜻ ª ℀ ⅍ ℁ 
Ⓑ ⓑ ⒝ B b Ḃ ḃ Ḅ ḅ Ḇ ḇ Ɓ Ƀ ƀ ƃ Ƃ Ƅ ƅ ℬ 
Ⓒ ⓒ ⒞ C c Ḉ ḉ Ć ć Ĉ ĉ Ċ ċ Č č Ç ç Ƈ ƈ Ȼ ȼ ℂ ℃ ℭ Ɔ ℅ ℆ ℄ Ꜿ ꜿ
Ⓓ ⓓ ⒟ D d Ḋ ḋ Ḍ ḍ Ḏ ḏ Ḑ ḑ Ḓ ḓ Ď ď Ɗ Ƌ ƌ Ɖ Đ đ ȡ ⅅ ⅆ Ǳ ǲ ǳ Ǆ ǅ ǆ ȸ 
Ⓔ ⓔ ⒠ E e Ḕ ḕ Ḗ ḗ Ḙ ḙ Ḛ ḛ Ḝ ḝ Ẹ ẹ Ẻ ẻ Ế ế Ẽ ẽ Ề ề Ể ể Ễ ễ Ệ ệ Ē ē Ĕ ĕ Ė 
ė Ę ę Ě ě È è É é Ê ê Ë ë Ȅ ȅ Ȩ ȩ Ȇ ȇ Ǝ ⱸ Ɇ ℇ ℯ ℮ Ɛ ℰ Ə ǝ ⱻ ɇ 
Ⓕ ⓕ ⒡ F f Ḟ ḟ Ƒ ƒ ꜰ Ⅎ ⅎ ꟻ ℱ ℻ 
Ⓖ ⓖ ⒢ G g Ɠ Ḡ ḡ Ĝ ĝ Ğ ğ Ġ ġ Ģ ģ Ǥ ǥ Ǧ ǧ Ǵ ℊ ⅁ ǵ
Ⓗ ⓗ ⒣ H h Ḣ ḣ Ḥ ḥ Ḧ ḧ Ḩ ḩ Ḫ ḫ ẖ Ĥ ĥ Ȟ ȟ Ħ ħ Ⱨ ⱨ Ꜧ ℍ Ƕ ℏ ℎ ℋ ℌ ꜧ
Ⓘ ⓘ ⒤ I i Ḭ ḭ Ḯ ḯ Ĳ ĳ ì í î ï Ì Í Î Ï Ĩ ĩ Ī ī Ĭ ĭ Į į ı Ɨ ƚ Ỻ Ǐ ǐ ⅈ ⅉ ℹ
Ⓙ ⓙ ⒥ J j Ĵ ĵ ȷ ⱼ Ɉ ɉ ǰ ℑ ℐ 
Ⓚ ⓚ ⒦ K k Ḱ ḱ Ḳ ḳ Ḵ ḵ Ķ ķ Ƙ ƙ Ꝁ ꝁ Ꝃ ꝃ Ꝅ ꝅ Ǩ ǩ Ⱪ ⱪ ĸ 
Ⓛ ⓛ ⒧ L l Ḷ ḷ Ḹ ḹ Ḻ ḻ Ḽ ḽ Ĺ ĺ Ļ ļ Ľ İ ľ Ŀ ŀ Ł ł Ỉ ỉ Ị ị Ƚ Ⱡ Ꝉ ꝉ ⱡ Ɫ ꞁ ℒ Ǉ ǈ ǉ ⅃ ⅂ ℓ ȉ Ȉ Ȋ ȋ 
Ⓜ ⓜ ⒨ M m Ḿ ḿ Ṁ ṁ Ṃ ṃ ꟿ ꟽ Ɱ Ʃ Ɯ ℳ 
Ⓝ ⓝ ⒩ N n Ṅ ṅ Ṇ ṇ Ṉ ṉ Ṋ ṋ Ń ń Ņ ņ Ň ň Ǹ ǹ Ŋ Ɲ ñ ŉ Ñ Ƞ ƞ ŋ Ǌ ǋ ǌ ȵ ℕ №   
Ⓞ ⓞ O o Ṍ ṍ Ṏ ṏ Ṑ ṑ Ṓ ṓ Ȫ ȫ Ȭ ȭ Ȯ ȯ Ȱ ȱ Ǫ ǫ Ǭ ǭ Ọ ọ Ỏ ỏ Ố ố Ồ ồ Ổ ổ Ỗ ỗ Ộ ộ Ớ ớ Ờ ờ Ở ở 
Ỡ ỡ Ợ ợ Ơ ơ Ō ō Ŏ ŏ Ő ő Ò Ó Ô Õ Ö Ǒ Ȍ ȍ Ȏ ȏ Œ œ Ø Ǿ Ꝋ ǽ ǿ ℴ ⍥ ⍤ ⒪ ò ó ô õ ö ǒ ø Ꝏ ꝏ 
Ⓟ ⓟ ⒫ ℗ P p Ṕ ṕ Ṗ ṗ Ƥ ƥ Ᵽ ℙ Ƿ ꟼ ℘ 
Ⓠ ⓠ ⒬ Q q Ɋ ɋ ℚ ℺ ȹ 
Ⓡ ⓡ ⒭ R r Ŕ ŕ Ŗ ŗ Ř ř Ṙ ṙ Ṛ ṛ Ṝ ṝ Ṟ ṟ Ȑ ȑ Ȓ ȓ ɍ Ɍ Ʀ Ɽ ℞ Ꝛ ꝛ ℜ ℛ ℟ ℝ 
Ⓢ ⓢ ⒮ S s Ṡ ṡ Ṣ ṣ Ṥ ṥ Ṧ ṧ Ṩ ṩ Ś ś Ŝ ŝ Ş ş Š š Ș ș ȿ ꜱ Ƨ ƨ ẞ ß ẛ ẜ ẝ ℠ 
Ⓣ ⓣ ⒯ T t Ṫ ṫ Ṭ ṭ Ṯ ṯ Ṱ ṱ Ţ ţ Ť ť Ŧ ŧ Ƭ Ʈ ẗ Ț Ⱦ ƫ ƭ ț ⱦ ȶ ℡ ™ 
Ⓤ ⓤ ⒰ U u Ṳ ṳ Ṵ ṵ Ṷ ṷ Ṹ ṹ Ṻ ṻ Ụ Ủ ủ Ứ Ừ ụ ứ Ử ử ừ ữ Ữ Ự ự Ũ ũ Ū ū Ŭ ŭ Ů ů 
Ű ű Ǚ ǚ Ǘ ǘ Ǜ ǜ Ų ų Ǔ ǔ Ȕ ȕ Û û Ȗ ȗ Ù ù Ü ü Ư ú Ʉ ư Ʋ Ʊ 
Ⓥ ⓥ ⒱ V v Ṽ ṽ Ṿ ṿ Ỽ Ʌ ℣ ⱱ ⱴ ⱽ 
Ⓦ ⓦ ⒲ W w Ẁ ẁ Ẃ ẃ Ẅ ẅ Ẇ ẇ Ẉ ẉ Ŵ ŵ ẘ Ⱳ ⱳ 
Ⓧ ⓧ ⒳ X x Ẋ ẋ Ẍ ẍ ℵ × 
Ⓨ ⓨ ⒴ y Y Ẏ ẏ Ỿ ỿ ẙ Ỳ ỳ Ỵ ỵ Ỷ ỷ Ỹ ỹ Ŷ ŷ Ƴ ƴ Ÿ ÿ Ý ý Ɏ ɏ Ȳ Ɣ ⅄ ȳ ℽ 
Ⓩ ⓩ ⒵ Z z Ẑ ẑ Ẓ ẓ Ẕ ẕ Ź ź Ż ż Ž ž Ȥ ȥ Ⱬ ⱬ Ƶ ƶ ɀ ℨ ℤ
⟀ ⟁ ⟂ ⟃ ⟄ ⟇ ⟈ ⟉ ⟊ ⟐ ⟑ ⟒ ⟓ ⟔ ⟕ ⟖ ⟗ ⟘ ⟙ ⟚ ⟛ ⟜ ⟝ ⟞ ⟟ ⟠ ⟡ ⟢ ⟣ ⟤ ⟥ ⟦ ⟧ ⟨ ⟩ ⟪ ⟫ ⦀ ⦁ ⦂ ⦃ ⦄ ⦅ ⦆
⦇ ⦈ ⦉ ⦊ ⦋ ⦌ ⦍ ⦎ ⦏ ⦐ ⦑ ⦒ ⦓ ⦔ ⦕ ⦖ ⦗ ⦘ ⦙ ⦚ ⦛ ⦜ ⦝ ⦞ ⦟ ⦠ ⦡ ⦢ ⦣ ⦤ ⦥ ⦦ ⦧ ⦨ ⦩ ⦪ ⦫ ⦬ ⦭ ⦮ ⦯ 
⦰ ⦱ ⦲ ⦳ ⦴ ⦵ ⦶ ⦷ ⦸ ⦹ ⦺ ⦻ ⦼ ⦽ ⦾ ⦿ ⧀ ⧁ ⧂ ⧃ ⧄ ⧅ ⧆ ⧇ ⧈ ⧉ ⧊ ⧋ ⧌ ⧍ ⧎ ⧏ ⧐ ⧑ ⧒ ⧓ ⧔ ⧕ ⧖ ⧗ 
⧘ ⧙ ⧚ ⧛ ⧜ ⧝ ⧞ ⧟ ⧡ ⧢ ⧣ ⧤ ⧥ ⧦ ⧧ ⧨ ⧩ ⧪ ⧫ ⧬ ⧭ ⧮ ⧯ ⧰ ⧱ ⧲ ⧳ ⧴ ⧵ ⧶ ⧷ ⧸ ⧹ ⧺ ⧻ 
⧼ ⧽ ⧾ ⧿ ∀ ∁ ∂ ∃ ∄ ∅ ∆ ∇ ∈ ∉ ∊ ∋ ∌ ∍ ∎ ∏ ∐ ∑ − ∓ ∔ ∕ ∖ ∗ ∘ ∙ √ ∛ ∜ ∝ ∞
∟ ∠ ∡ ∢ ∣ ∤ ∥ ∦ ∧ ∨ ∩ ∪ ∫ ∬ ∭ ∮ ∯ ∰ ∱ ∲ ∳ ∴ ∵ ∶ ∷
∸ ∹ ∺ ∻ ∼ ∽ ∾ ∿ ≀ ≁ ≂ ≃ ≄ ≅ ≆ ≇ ≈ ≉ ≊ ≋ ≌ ≍ ≎ ≏ ≐ ≑ ≒ ≓ ≔ ≕ ≖ ≗ ≘ ≙ ≚ ≛ ≜ ≝ ≞ ≟ ≠ ≡ ≢ ≣ ≤ ≥ ≦ ≧ ≨ ≩ 
≪ ≫ ≬ ≭ ≮ ≯ ≰ ≱ ≲ ≳ ≴ ≵ ≶ ≷ ≸ ≹ ≺ ≻ ≼ ≽ ≾ ≿ ⊀ ⊁ ⊂ ⊃ ⊄ ⊅ ⊆ ⊇ ⊈ ⊉ ⊊ ⊋ ⊌ ⊍ ⊎ ⊏ ⊐ ⊑ ⊒ ⊓ ⊔
⊕ ⊖ ⊗ ⊘ ⊙ ⊚ ⊛ ⊜ ⊝ ⊞ ⊟ ⊠ ⊡ ⊢ ⊣ ⊤ ⊥ ⊦ ⊧ ⊨ ⊩ ⊪ ⊫ ⊬ ⊭ ⊮ ⊯ ⊰ ⊱ ⊲ ⊳ ⊴ ⊵ ⊶ ⊷ ⊸ ⊹ ⊺ ⊻ ⊼ ⊽ ⊾ ⊿ ⋀ ⋁ ⋂ ⋃ ⋄
⋅ ⋆ ⋇ ⋈ ⋉ ⋊ ⋋ ⋌ ⋍ ⋎ ⋏ ⋐ ⋑ ⋒ ⋓ ⋔ ⋕ ⋖ ⋗ ⋘ ⋙ ⋚ ⋛ ⋜ ⋝ ⋞ ⋟ ⋠ ⋡ ⋢ ⋣ ⋤ ⋥ ⋦ ⋧ ⋨ ⋩ ⋪ ⋫ ⋬ ⋭ ⋮ ⋯ ⋰ ⋱ 
⋲ ⋳ ⋴ ⋵ ⋶ ⋷ ⋸ ⋹ ⋺ ⋻ ⋼ ⋽ ⋾ ⋿ ✕ ✖ ✚ ◀ ▶ ❝ ❞ ★ ☆ ☼ ☂ ☺ ☹ ✄ ✈ ✌ ✎ ♪ ♫ ☀ ☁ ☔ ⚡ ❆ ☽ ☾ ✆ ✔ ☯ ☮ ☠ ⚑ ☬ 
✄ ✏ ♰ ✡ ✰ ✺ ⚤ ⚢ ⚣ ♕ ♛ ♚ ♬ ⓐ ⓑ ⓒ ⓓ ↺ ↻ ⇖ ⇗ ⇘ ⇙ ⟵ ⟷ ⟶ ⤴ ⤵ ⤶ ⤷ ➫ ➬ € ₤ ＄ ₩ ₪ ⟁ ⟐ ◆ ⎔ ░ ▢ ⊡ ▩ ⟡ ◎
◵ ⊗ ❖ Ω β Φ Σ Ξ ⟁ ⦻ ⧉ ⧭ ⧴ ∞ ≌ ⊕ ⋍ ⋰ ⋱ ✖ ⓵ ⓶ ⓷ ⓸ ⓹ ⓺ ⓻ ⓼ ⓽ ⓾ ᴕ ⸨ ⸩ ❪ ❫ ⓵ ⓶ ⓷ ⓸ ⓹ ⓺ ⓻ ⓼ ⓽ ⓾ 
⒈ ⒉ ⒊ ⒋ ⒌ ⒍ ⒎ ⒏ ⒐ ⒑ ⒒ ⒓ ⒔ ⒕ ⒖ ⒗ ⒘ ⒙ ⒚ ⒛ 
⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ➀ ➁ ➂ ➃ ➄ ➅ ➆ ➇ ➈ ➉ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳
⓿ ❶ ❷ ❸ ❹ ❺ ❻ ❼ ❽ ❾ ❿ ➊ ➋ ➌ ➍ ➎ ➏ ➐ ➑ ➒ ➓ ⓫ ⓬ ⓭ ⓮ ⓯ ⓰ ⓱ ⓲ ⓳ ⓴ 
⑴ ⑵ ⑶ ⑷ ⑸ ⑹ ⑺ ⑻ ⑼ ⑽ ⑾ ⑿ ⒀ ⒁ ⒂ ⒃ ⒄ ⒅ ⒆ ⒇
ᶅ ᶛ ᶜ ᶝ ᶞ ᶟ ᶠ ᶡ ᶢ ᶣ ᶤ ᶥ ᶦ ᶧ ᶨ ᶩ ᶪ ᶫ ᶬ ᶭ ᶮ ᶯ ᶰ ᶱ ᶲ ᶳ ᶴ ᶵ ᶶ ᶷ ᶹ ᶺ ᶻ ᶼ ᶽ ᶾ ᶿ 
ᴀ ᴁ ᴂ ᴃ ᴄ ᴅ ᴆ ᴇ ᴈ ᴉ ᴊ ᴋ ᴌ ᴍ ᴎ ᴏ ᴐ ᴑ ᴒ ᴓ ᴔ ᴕ ᴖ ᴗ ᴘ ᴙ ᴚ ᴛ ᴜ ᴝ ᴞ ᴟ ᴠ ᴡ ᴢ ᴣ ᴤ ᴥ ᴦ ᴧ ᴨ ᴩ ᴪ ᴫ 
ᴬ ᴭ ᴮ ᴯ ᴰ ᴱ ᴲ ᴳ ᴴ ᴵ ᴶ ᴷ ᴸ ᴹ ᴺ ᴻ ᴼ ᴽ ᴾ ᴿ ᵀ ᵁ ᵂ ᵃ ᵄ ᵅ ᵆ ᵇ ᵈ ᵉ ᵊ ᵋ ᵌ ᵍ ᵎ ᵏ ᵐ ᵑ ᵒ ᵓ ᵔ ᵕ ᵖ ᵗ ᵘ ᵙ ᵚ ᵛ ᵜ
ᵝ ᵞ ᵟ ᵠ ᵡ ᵢ ᵣ ᵤ ᵥ ᵦ ᵧ ᵨ ᵩ ᵪ ᵫ ᵬ ᵭ ᵮ ᵱ ᵲ ᵳ ᵵ ᵷ ᵸ ᵺ ᵻ ᷋ ᷌ ᷍ ᷎ ᷏ ᷓ ᷔ ᷕ ᷖ ᷗ ᷘ ᷙ ᷛ ᷜ ᷝ ᷞ ᷟ ᷠ ᷡ ᷢ ᷣ ᷤ ᷥ ᷦ ‘ ’ ‛ ‚ “ ” „ ‟ « » ‹ › Ꞌ  < > @
‧ ¨ ․ ꞉ : ⁚ ⁝ ⁞ ‥ … ⁖ ⸪ ⸬ ⸫ ⸭ ⁛ ⁘ ⁙ ⁏ ; ⦂ ⁃ ‐ ‑ ‒ - – ⎯ — ― _ ⁓ ⸛ ⸞ ⸟ ⸯ ¬ / \ ⁄ \ ⁄ | ⎜ ¦ ‖ ‗ † ‡ 
· • ⸰ ° ‣ ⁒ % ‰ ‱ & ⅋ § ÷ + ± = ꞊ ′ ″ ‴ ⁗ ‵ ‶ ‷ ‸ * ⁑ ⁎ ⁕ ※ ⁜ ⁂ ! ‼ ¡ ? ¿ ⸮ ⁇ ⁉ ⁈ ‽ ⸘ ¼ ½ ¾ 
² ³ © ® ™ ℠ ℻ ℅ ℁ ⅍ ℄ ¶ ⁋ ❡ ⁌ ⁍ ⸖ ⸗ ⸚ ⸓ 
( ) [ ] { } ⸨ ⸩ ❨ ❩ ❪ ❫ ⸦ ⸧ ❬ ❭ ❮ ❯ ❰ ❱ ❴ ❵ ❲ ❳ ⦗ ⦘ ⁅ ⁆ 〈 〉 ⏜ ⏝ ⏞ ⏟ ⸡ ⸠ ⸢ ⸣ ⸤ ⸥ 
⎡ ⎤ ⎣ ⎦ ⎨ ⎬ ⌠ ⌡ ⎛ ⎠ ⎝ ⎞ ⁀ ⁔ ‿ ⁐ ‾ ⎟ ⎢ ⎥ ⎪ ꞁ ⎮ ⎧ ⎫ ⎩ ⎭ ⎰ ⎱ ✈ ☀ ☼ ☁ ☂ ☔ ⚡ ❄ ❅ ❆ ☃ 
☉ ☄ ★ ☆ ☽ ☾ ⌛ ⌚ ☇ ☈ ⌂ ⌁ ⏧ ✆ ☎ ☏ ☑ ✓ ✔ ⎷ ⍻
✖ ✗ ✘ ☒ ✕ ☓ ☕ ♿ ✌ ☚ ☛ ☜ ☝ ☞ ☟ ☹ ☺ ☻ ☯ ⚘ ☮ ✝ ⚰ ⚱ ⚠ ☠ ☢ ⚔ ⚓ ⎈ ⚒ ⚑ ⚐ ☡ ❂ ⚕ ⚖ ⚗ ✇ ☣ ⚙ ☤ ⚚ ⚛ ⚜ ☥ ☦ ☧ ☨ ☩ 
† ☪ ☯ ☫ ☬ ☭ ✁ ✂ ✃ ✄ ✍ ✎ ✏ ✐  ✑ ✒ ✉ ✙ ✚ ✜ ✛ ♰ ♱ ✞ ✟ ✠ ✡ ☸ ✢ ✣ ✤ ✥ ✦ ✧ ✩ ✪ ✫ ✬ ✭ ✮ ✯ ✰ ✲ ✱ ✳ ✴ ✵ ✶ ✷ ✸ 
✹ ✺ ✻ ✼ ✽ ✾ ❀ ✿ ❁ ❃ ❇ ❈ ❉ ❊ ❋ ⁕ ☘ ❦ ❧ ☙ ❢ ❣ ♀ ♂ ⚲ ⚢ ⚣ ⚤ ⚥ ⚦ ⚧ ⚨ ⚩ ☿ ♁ ⚯ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟ ☖ 
☗ ♠ ♣ ♦ ♥ ❤ ❥ ♡ ♢ ♤ ♧ ⚀ ⚁ ⚂ ⚃ ⚄ ⚅ ⚇ ⚆ ⚈ ⚉ ♨ ♩ ♪ ♫ ♬ ♭ ♮ ♯ ⌨ ⏏ ⎗ ⎘ ⎙ ⎚ ⌥ ⎇ ⌘ ⌦ ⌫ ⌧ ♲ ♳ ♴ ♵ ♶ ♷ ♸ ♹
♺ ♻ ♼ ♽ ⁌ ⁍ ⎌ ⌇ ⌲ ⍝ ⍟ ⍣ ⍤ ⍥ ⍨ ⍩ ⎋ ♃ ♄ ♅ ♆ ♇ ♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ♓ ⏚ ⏛
┊ ○ ● ⚠ ✡ ° 😎 😘 😂  ￼  😆
⌽⌇ ⌍ ⌎⎌ ⌏ ⌐ ⌑ ⌔
⌙ ⌢ ⌣ ⌯ ⌬
⍙
𓆏
ᛉ卐


COMMENT1
###################################################
###          END Extra Characters                 #
################################################### 
##
##
##
###################################################
###                GUI Control                    #
###################################################
## 
##==========================================
## GUI
## Get name of running Window Manager
$> wmctrl -m | grep Name: | awk '{print $2}'
##==========================================
## GUI
## Manually Pause/Unpause Firefox Process with POSIX-Signals
$> killall -STOP -m firefox
## Continue with:
$> killall -CONT -m firefox
## Suspends all Firefox Threads. Results in Zero CPU load.  Useful when having 100+ Tabs open and you temporarily need the power elsewhere.
## Be careful - might produce RACE CONDITIONS or LOCKUPS in other processes or FF itself.
##==========================================
## GUI
## Edit the Gimp launcher file to disable the splash screen
$> printf '%s\n' ',s/^Exec=[^ ]*/& -s/' w q | ed /usr/share/applications/gimp.desktop
## sed is designed for editing streams - editing files is what ed is for! You can get consistent behavior on any UNIX platform with the above one-liner.
## The printf command sends a series of editing commands to ed, each separated by a newline. In this case, the substitution command ,s/^Exec=[^ ]*/& -s/ is nearly the same as in sed, appending a space and a -s to the line starting with Exec=. The only difference is the comma at the beginning designating the lines to operate on. This is shorthand for 1,$, which tells ed to apply the command to the first through the last lines (i.e., the entire file). w tells ed to write the file, and q to quit.
##==========================================
## GUI
## Backup all files under home directory to a USB drive with zenity gui
$> DIR1=$(zenity --entry --text "Enter first directory to sync.") && DIR2=$(zenity --entry --text "Enter second directory to sync.") && rsync -avu $DIR1 $DIR2 && rsync -avu $DIR2 $DIR1  && notify-send  "Syncing" "The files are syncing." && zenity --info "Finished sync."
##==========================================
## GUI
## List firefox addons
$> jshon -e addons -a -e defaultLocale -e name -u < ~/.mozilla/firefox/*.[dD]efault/extensions.json
##==========================================
## Remove link/shortcut icon overlays in mint linux
## Get rid of shortcut/symlink/symbolic-link arrows from on top of desktop icons.
$> sudo cp emblem-symbolic-link-tranparent.png /usr/share/icons/Mint-X/emblems/16/emblem-symbolic-link.png
$> sudo cp emblem-symbolic-link-tranparent.png /usr/share/icons/Mint-X/emblems/22/emblem-symbolic-link.png
$> sudo cp emblem-symbolic-link-tranparent.png /usr/share/icons/Mint-X/emblems/24/emblem-symbolic-link.png
$> sudo cp emblem-symbolic-link-tranparent.png /usr/share/icons/Mint-X/emblems/32/emblem-symbolic-link.png
$> sudo cp emblem-symbolic-link-tranparent.png /usr/share/icons/Mint-X/emblems/48/emblem-symbolic-link.png
$> sudo gtk-update-icon-cache /usr/share/icons/Mint-X
##==========================================
## Create new Mint-X-White and Mint-X-LtBlue icon themes
$> mkdir ~/.icons && \
$> cp -r /usr/share/icons/Mint-X-Aqua ~/.icons/Mint-X-LtBlue && \
$> cd ~/.icons/Mint-X-LtBlue && \
$> grep -ri -l "#a7c6df" ~/.icons/Mint-X-LtBlue | xargs sed -i -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' -e 's/path6127" style="opacity:0.4/path6127" style="opacity:1/g' && \
$> grep -ri -l "#a7c6df" ~/.icons/Mint-X-LtBlue | xargs sed -i -e 's/a7c6df/ffffff/g' -e 's/308fba/cce8ff/g' && \
$> cp -r /usr/share/icons/Mint-X-Aqua ~/.icons/Mint-X-White && \
$> cd ~/.icons/Mint-X-White && \
$> grep -ri -l "#a7c6df" ~/.icons/Mint-X-White | xargs sed -i -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' -e 's/path6127" style="opacity:0.4/path6127" style="opacity:1/g'  && \
$> grep -ri -l "#a7c6df" ~/.icons/Mint-X-White | xargs sed -i -e 's/a7c6df/f7f7f7/g' -e 's/308fba/f7f7f8/g'
##------------------------------------------
## Make LtBlue Theme
## Make home .icons folder to put new icon themes in and copy over Mint-X icons to alter
$> mkdir ~/.icons && \
$> cp -r /usr/share/icons/Mint-X ~/.icons/Mint-X-LtBlue && \
$> cd ~/.icons/Mint-X-LtBlue && \
## Change folder icon edges to opaque
$> grep -ri -l "#a7c6df" ~/.icons/Mint-X-LtBlue | xargs sed -i \
## for opaque "outline"
$> -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' \
## for opaque "outline" on Documents folder
$> -e 's/path3369-1-3" style="opacity:0.3/path3369-1-3" style="opacity:1/g' \
## for darker "shadow"
$> -e 's/path6127" style="opacity:0.4/path6127" style="opacity:1/g'  
## Change color to LtBlue #cce8ff
$> grep -ri -l "#a7c6df" ~/.icons/Mint-X-LtBlue | xargs sed -i -e 's/a7c6df/ffffff/g' -e 's/308fba/cce8ff/g' && \
##==========================================
## Make home .icons folder to put new icon themes in and copy over Mint-X icons to alter
$> mkdir ~/.icons && \
$> cp -r /usr/share/icons/Mint-X ~/.icons/Mint-X-White && \
$> cd ~/.icons/Mint-X-White && \
## Change folder icon edges to opaque
$> grep -ri -l "#a7c6df" ~/.icons/Mint-X-White | xargs sed -i \
## folder outline 
$> -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' \
## folder outline folder-documents.svg
$> -e 's/path3369-1-3" style="opacity:0.3/path3369-1-3" style="opacity:1/g' \
## folder outline folder-music.svg
$> -e 's/path3369-7-50" style="opacity:0.3/path3369-7-50" style="opacity:1/g' \
## folder outline folder-recent.svg
$> -e 's/path3369-7-3" style="opacity:0.3/path3369-7-3" style="opacity:1/g' \
## folder outline folder-drag-accept.svg
$> -e 's/path3369-8-9" style="opacity:0.3/path3369-8-9" style="opacity:1/g' \
## folder outline folder-drag-accept.svg
$> -e 's/path3369-7-1" style="opacity:0.3/path3369-7-1" style="opacity:1/g' \
## Dark shadow
$> -e 's/path6127" style="opacity:0.4/path6127" style="opacity:1/g'  \
## Change color to the color you like, LtBlue #cce8ff
$> -e "s/5e8048/888889/g" -e "s/4a6438/000001/g" \
$> -e "s/aacb7d/$2/g" -e "s/709937/$1/g" ;
##------------------------------------------
## Make any color icons in Mint17x from Mint-X-Aqua. Usage iconcolor HexForYour1stColor HexForYour2ndColor i.e. f7f7f9 bb55bb for Lavender & White
$> function iconcolors () {
$> 	cp -r /usr/share/icons/Mint-X-Aqua ~/.icons/Mint-X-$1-$2 ;
$>     cd ~/.icons/Mint-X-$1-$2 ;
$>     grep -ri -l "#a7c6df" | xargs sed -i \
$>     -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' \
$>     -e 's/path3369-1-3" style="opacity:0.3/path3369-1-3" style="opacity:1/g' \
$>     -e 's/path3369-7-50" style="opacity:0.3/path3369-7-50" style="opacity:1/g' \
$>     -e 's/path3369-7-3" style="opacity:0.3/path3369-7-3" style="opacity:1/g' \
$>     -e 's/path3369-8-9" style="opacity:0.3/path3369-8-9" style="opacity:1/g' \
$>     -e 's/path3369-7-1" style="opacity:0.3/path3369-7-1" style="opacity:1/g' ;
$>     grep -ri -l "#a7c6df" | xargs sed -i -e "s/a7c6df/$2/g" -e "s/308fba/$1/g" ;
$> }
##------------------------------------------
## Make any color icons in Mint17x from the full Mint-X icon set. Usage: iconcolor HexForYour1stColor HexForYour2ndColor i.e. bb55bb f7f7f9 for Lavender & White
$> function iconcolors () {
$> 	cp -r /usr/share/icons/Mint-X ~/.icons/Mint-X-$1-$2 ;
$>     cd ~/.icons/Mint-X-$1-$2 ;
$>     grep -ri -l "#aacb7d" | xargs sed -i \
$>     -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' \
$>     -e 's/path3369-1-3" style="opacity:0.3/path3369-1-3" style="opacity:1/g' \
$>     -e 's/path3369-7-50" style="opacity:0.3/path3369-7-50" style="opacity:1/g' \
$>     -e 's/path3369-7-3" style="opacity:0.3/path3369-7-3" style="opacity:1/g' \
$>     -e 's/path3369-8-9" style="opacity:0.3/path3369-8-9" style="opacity:1/g' \
$>     -e 's/path3369-7-1" style="opacity:0.3/path3369-7-1" style="opacity:1/g' ;
$>     grep -ri -l "#aacb7d" | xargs sed -i -e "s/5e8048/888889/g" -e "s/4a6438/000001/g" ;
$>     grep -ri -l "#aacb7d" | xargs sed -i -e "s/aacb7d/$2/g" -e "s/709937/$1/g" ;
$> }
##------------------------------------------
## Transform Mint Linux 17 icons to create any color
$> function iconcolors () { cp -r /usr/share/icons/Mint-X-Aqua ~/.icons/Mint-X-$1-$2 ; cd ~/.icons/Mint-X-$1-$2 ; grep -ri -l "#a7c6df" | xargs sed -i -e 's/"opacity:0/"opacity:1/g' -e "s/0b5a7d/888889/g" -e "s/a7c6df/$2/g" -e "s/308fba/$1/g" ; }
##------------------------------------------
## Make any color icons from Mint-X-Aqua. Usage: iconcolor HexForYour1stColor HexForYour2ndColor i.e. bb55bb f7f7f9 for Lavender & White
$> function iconcolorMint-X-Aqua () {
$> 	cp -r /usr/share/icons/Mint-X-Aqua ~/.icons/Mint-X-$1-$2 ;
$>     cd ~/.icons/Mint-X-$1-$2 ;
$>     grep -ri -l "#a7c6df" | xargs sed -i \
$>     -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' \
$>     -e 's/path3369-1-3" style="opacity:0.3/path3369-1-3" style="opacity:1/g' \
$>     -e 's/path3369-7-50" style="opacity:0.3/path3369-7-50" style="opacity:1/g' \
$>     -e 's/path3369-7-3" style="opacity:0.3/path3369-7-3" style="opacity:1/g' \
$>     -e 's/path3369-8-9" style="opacity:0.3/path3369-8-9" style="opacity:1/g' \
$>     -e 's/path3369-7-1" style="opacity:0.3/path3369-7-1" style="opacity:1/g' \
$>     -e 's/path6127" style="opacity:0.4/path6127" style="opacity:1/g'  ;
$>     grep -ri -l "#a7c6df" | xargs sed -i -e "s/0b5a7d/888889/g" ;
$>     grep -ri -l "#a7c6df" | xargs sed -i -e "s/a7c6df/$2/g" -e "s/308fba/$1/g" ;
$> }
##------------------------------------------
## Make any color icons in Mint17x from the full Mint-X icon set. Usage: iconcolor HexForYour1stColor HexForYour2ndColor i.e. bb55bb f7f7f9 for Lavender & White
$> function iconcolorsMint-X () {
$> 	cp -r /usr/share/icons/Mint-X ~/.icons/Mint-X-$1-$2 ;
$>     cd ~/.icons/Mint-X-$1-$2 ;
$>     grep -ri -l "#aacb7d" | xargs sed -i \
$>     -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' \
$>     -e 's/path3369-1-3" style="opacity:0.3/path3369-1-3" style="opacity:1/g' \
$>     -e 's/path3369-7-50" style="opacity:0.3/path3369-7-50" style="opacity:1/g' \
$>     -e 's/path3369-7-3" style="opacity:0.3/path3369-7-3" style="opacity:1/g' \
$>     -e 's/path3369-8-9" style="opacity:0.3/path3369-8-9" style="opacity:1/g' \
$>     -e 's/path3369-7-1" style="opacity:0.3/path3369-7-1" style="opacity:1/g' \
$>     -e 's/path6127" style="opacity:0.4/path6127" style="opacity:1/g' ;
$>     grep -ri -l "#aacb7d" | xargs sed -i -e "s/5e8048/888889/g" -e "s/4a6438/000001/g" ;
$>     grep -ri -l "#aacb7d" | xargs sed -i -e "s/aacb7d/$2/g" -e "s/709937/$1/g" ;
$> }
##------------------------------------------
## Change the shortcut/symlink/symbolic-link arrows from on top of desktop icons. USAGE: symbolic-link-gnome /path/to/your.png
$> function symbolic-link-gnome { 
$> sudo cp $1 /usr/share/icons/gnome/16x16/emblem/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/gnome/22x22/emblem/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/gnome/24x24/emblem/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/gnome/32x32/emblem/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/gnome/48x48/emblem/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/gnome/256x256/emblem/emblem-symbolic-link.png ;
$> sudo gtk-update-icon-cache /usr/share/icons/gnome ;
$> }
##------------------------------------------
## Change the shortcut/symlink/symbolic-link arrows from on top of desktop icons. USAGE: symbolic-link /path/to/your.png
$> function symbolic-link { 
$> sudo cp $1 /usr/share/icons/Mint-X/emblems/16/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/Mint-X/emblems/22/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/Mint-X/emblems/24/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/Mint-X/emblems/32/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/Mint-X/emblems/48/emblem-symbolic-link.png ;
$> sudo cp $1 /usr/share/icons/Mint-X/emblems/96/emblem-symbolic-link.png ;
$> sudo gtk-update-icon-cache /usr/share/icons/Mint-X ;
$> }
$> 
##------------------------------------------
##------------------------------------------
## Make any color icons in Mint17x from the full Mint-X icon set. Usage: iconcolor HexForYour1stColor HexForYour2ndColor i.e. bb55bb f7f7f9 for Lavender & White
$> function iconcolorsMint-X () {
$> 	cp -r /usr/share/icons/Mint-X ~/.icons/Mint-X-$1-$2 ;
$>     cd ~/.icons/Mint-X-$1-$2 ;
$>     grep -ri -l "#aacb7d" | xargs sed -i \
$>     -e 's/path3369-7" style="opacity:0.3/path3369-7" style="opacity:1/g' \
$>     -e 's/path3369-1-3" style="opacity:0.3/path3369-1-3" style="opacity:1/g' \
$>     -e 's/path3369-7-50" style="opacity:0.3/path3369-7-50" style="opacity:1/g' \
$>     -e 's/path3369-7-3" style="opacity:0.3/path3369-7-3" style="opacity:1/g' \
$>     -e 's/path3369-8-9" style="opacity:0.3/path3369-8-9" style="opacity:1/g' \
$>     -e 's/path3369-7-1" style="opacity:0.3/path3369-7-1" style="opacity:1/g' \
$>     -e 's/path6127" style="opacity:0.4/path6127" style="opacity:1/g' ;
$>     grep -ri -l "#aacb7d" | xargs sed -i -e "s/5e8048/888889/g" -e "s/4a6438/000001/g" ;
$>     grep -ri -l "#aacb7d" | xargs sed -i -e "s/aacb7d/$2/g" -e "s/709937/$1/g" ;
$> }
##------------------------------------------
$> function iconcolors () { cp -r /usr/share/icons/Mint-X-Aqua ~/.icons/Mint-X-$1-$2 ; cd ~/.icons/Mint-X-$1-$2 ; grep -ri -l "#a7c6df" | xargs sed -i -e 's/"opacity:0/"opacity:1/g' -e "s/0b5a7d/888889/g" -e "s/a7c6df/$2/g" -e "s/308fba/$1/g" ; }
##------------------------------------------
$> function iconcolors () { cp -r /usr/share/icons/Mint-X      ~/.icons/Mint-X-$1-$2 ; cd ~/.icons/Mint-X-$1-$2 ; grep -ri -l "#aacb7d" | xargs sed -i -e 's/"opacity:0/"opacity:1/g' -e "s/5e8048/888889/g" -e "s/aacb7d/$2/g" -e "s/709937/$1/g" ; }
##==========================================
#!/bin/sh
# Merge all files in two directories of your choice
$> zenity --question --title="Direcrory sync program" --text="Press Yes to pick directories to sync."
$> DIR1=$(zenity --file-selection --directory --title="Select first directory to sync")
$> DIR1=$(echo $DIR1/)
$> DIR2=$(zenity --file-selection --directory --title="Select second directory to sync")
$> DIR2=$(echo $DIR2/)
$> notify-send "Syncing" "The files are syncing."
$> rsync -avu $DIR1 $DIR2 | tee SYNC1.txt
$> rsync -avu $DIR2 $DIR1 | tee -a SYNC1.txt
$> # SYNC1=$(cat SYNC1.txt)
$> # SYNC2=$(cat SYNC2.txt)
$> zenity --text-info --title="Finished sync." --filename=SYNC1.txt
##==========================================
## Add an "alert" alias to notify for long running commands. Ex: sleep 10; alert
$> alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
##==========================================
## firefox nightly
$> sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
$> sudo apt-get update
$> sudo apt-get install firefox-trunk 
##==========================================
## https://software.opensuse.org/download.html?project=home:stevenpusser&package=palemoon
## palemoon browser
$> sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/stevenpusser/xUbuntu_14.04/ /' > /etc/apt/sources.list.d/palemoon.list"
$> sudo apt-get update
$> sudo apt-get install palemoon
##==========================================
## Get your Firefox bookmarks
$> sqlite3 ~/.mozilla/firefox/*.[dD]efault/places.sqlite "SELECT strftime('%d.%m.%Y %H:%M:%S', dateAdded/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_bookmarks WHERE moz_places.id = moz_bookmarks.fk ORDER BY dateAdded;"
## Extracts yours bookmarks out of sqlite with the format:
## dateAdded|url
##==========================================
## Show Firefox Addons 
$> jshon -e addons -a -e defaultLocale -e name -u < ~/.mozilla/firefox/*.[dD]efault/extensions.json
##==========================================
## Install dconf-editor, run it, in left column go to path org > nemo > desktop and untick the option "use-desktop-grid" and you can freely resize icons on desktop.
$> sudo apt-get install dconf-editor
##==========================================
## Disable updates for installed Chrome plugins
## This will allow you to ensure you don't get nagged by updates and also protects you from watering hole attacks! Please be sure to make sure your plugins don't have any security issues! Backups are manifext.jason.bak credit @Jay https://chat.counterpoint.info
$> find / -iname "manifest.json" -exec sed 's/\"update_url\": \"http/\"update_url\": \"hxxp/g' -i.bak '{}' \;
##==========================================
## Convert libreoffice files : .odt .odg and other to .pdf
## Find and Convert all libre office files to PDF without libreoffice GUI Show Sample Output
$> find /home/foo/Documents/ -type f -iname "*.odt" -exec libreoffice --headless --convert-to pdf '{}' \;
##==========================================

##==========================================

###################################################
###            END GUI Control                    #
###################################################
##
##
## 
##################################################### 
###                   UNSORTED                      #
##################################################### 
## 
##==========================================
## Replace all instances of "A" with "B" in file "source" saved as file "destination"
$> xxd -p source | fold -w2 | paste -sd' ' | sed "s/A/B/g" | xxd -p -r > destination
##==========================================
## Play White noise from urandom
$> aplay -c 2 -f S16_LE -r 44100 /dev/urandom
##==========================================
## List files newest first
$> ls -lt --time=atime
##==========================================
## Find and replace specific characters in a single line in multiple files with sed
$> for f in `ls`; do sed -i '/MATCHING STRING/ { s/ORIGINAL/REPLACEMENT/; }' ${f} ; done
##==========================================
## mp4 to mpeg for dvd creation
$> avconv -i FILE.mp4 -f dvd -c:v:0 mpeg2video -s 720x576 -r 25 -g 15 -b:v:0 8000000 -maxrate:v:0 8000000 -minrate:v:0 8000000 -bufsize:v:0 1835008 -packetsize 2048 -muxrate 10080000 -b:a 192000 -ar 48000 -c:a:0 ac3 -map 0:v -map 0:a FILE.mpeg
##==========================================
## Show drive names next to their full serial number (and disk info)
$> find /dev/disk/by-id -type l -printf "%l\t%f\n" | cut -b7- | sort
##==========================================
## Add a file to a .tar ball.
$> tar -rvf archive.tar file.txt
##==========================================
## Change partition label
## EXT linux filesystem
## Get present label
$> sudo e2label /dev/sdb1
## linux file system type ext/ext3/ext4 partition
$> sudo e2label /dev/sdb1 NEWLABEL
##------------------------------------------
## NTFS Microsoft Windows filesystem
## NTFS partitions, use ntfslabel from the ntfs-3g package. 128 characters maximum characters in label
## Check the current label
$> sudo ntfslabel /dev/sdb1
## Change to new label
$> sudo ntfslabel /dev/sdb1 NEWLABEL
##------------------------------------------
## FAT FAT32 DOS filesystem
## FAT partitions the tool to use is "mlabel"
## Check the current label, mlabel is part of the mtools-package
$> sudo mlabel -i /dev/sdb1 ::
## Change to new label
$> sudo mlabel -i /dev/sdb1 ::NEWLABEL
##==========================================
## Search the internet 
$> man surfraw # -elvi list of search engines, -dump, 
$> sudo mcedit /etc/xdg/surfraw/conf
## man
$> surfraw google -results=100 -dump PATTERN
##==========================================
## Setup a transmission bittorent server
$> sudo apt-get install  transmission-gtk transmission-remote-cli transmission-daemon transmission-common transmission
## Add user debian-transmission to your group to access directories
$> sudo usermod -a -G debian-transmission USERNAME
## Fix settings to match computer 
$> sudo nano /etc/transmission-daemon/settings.json
## Modify parameters, download-dir, incomplete-dir, rpc-username, rpc-password
$> sudo service transmission-daemon reload  # start/stop/reload
## Go to http://localhost:9091
## ~/.config/transmission-daemon
##==========================================
## Make mc always display non-blue background
$> echo "alias mc='mc -S gotan'" >> .bashrc
##==========================================
## Upgrade youtube-dl
$> $ youtube-dl --version
#> 2014.02.17
$> sudo mv /usr/bin/youtube-dl /usr/bin/youtube-dl.old
$> sudo curl href=https://yt-dl.org/downloads/latest/youtube-dl -o /usr/bin/youtube-dl
$> sudo chmod 755 /usr/bin/youtube-dl
$ $ youtube-dl --version
#> 2015.12.13
##------------------------------------------
## Upgrade youtube-dl
$> $ youtube-dl --version
#> 2014.02.17
$> sudo mv /usr/bin/youtube-dl /usr/bin/youtube-dl.old
## Change date to most recent
$> cd /usr/bin/ && sudo wget github.com/rg3/youtube-dl/releases/download/2017.07.15/youtube-dl
$> $ youtube-dl --version
#> 2017.07.15
##==========================================
## How to upgrade from Linux Mint 17 Qiana to Linux Mint 17.1 Rebecca
$> sudo apt-get update
$> sudo apt-get upgrade
$> sudo apt-get dist-upgrade
## First, backup to official sources, just in case, if something unexpected happens
$> sudo cp /etc/apt/sources.list.d/official-package-repositories.list /etc/apt/sources.list.d/official-package-repositories.list.bak
## Next, replace old name (qiana) with new name (rebecca), in the sources file. Instead of doing this by hand, taking the lines one by one, I will be using this sed oneliner:
$> sudo sed -i 's/qiana/rebecca/g' /etc/apt/sources.list.d/official-package-repositories.list
## Now, in order to finish the upgrade process, we have to update the local repository index and perform a regular system upgrade
$> sudo apt-get update
$> sudo apt-get dist-upgrade
## Revert the changes, only if the upgrade process does not finalize successfully
## Replace the modified sources list with the backup
#$> sudo rm /etc/apt/sources.list.d/official-package-repositories.list
#$> sudo mv /etc/apt/sources.list.d/official-package-repositories.list.bak /etc/apt/sources.list.d/official-package-repositories.list
## Upgrade the repository index and perform a system upgrade
#$> sudo apt-get update
#$> sudo apt-get dist-upgrade
##==========================================
## Move all located items to folder
$> locate -0 -i *barthes* | xargs -0 mv -t ~/'Books/Barthes, Roland'
##==========================================
## Upgrade to new distribution
$> sudo cp /etc/apt/sources.list.d/official-package-repositories.list /etc/apt/sources.list.d/official-package-repositories.list.qiana.bak
$> sudo cp /etc/apt/sources.list.d/official-package-repositories.list /etc/apt/sources.list.d/official-package-repositories.list.rebecca.bak
$> sudo sed -i 's/qiana/rebecca/g' /etc/apt/sources.list.d/official-package-repositories.list
$> sudo sed -i 's/rebecca/rafaela/g' /etc/apt/sources.list.d/official-package-repositories.list
$> sudo sed -i 's/rafaela/rosa/g' /etc/apt/sources.list.d/official-package-repositories.list
$> sudo apt-get update
$> sudo apt-get dist-upgrade
$> sudo sed -i 's/rebecca/rosa/g' /etc/apt/sources.list.d/official-package-repositories.list
##==========================================
## Copy files to and from server over ssh with scp - secure copy
$> scp USER@192.168.1.11:/tmp/shot.png ~/
##==========================================
## Convert SWF to video
## This will dump a raw BGRA pixel stream and WAV which must then be converted to video:
$> ffmpeg -f rawvideo -c:v rawvideo -s 1280x720 -r 12 -pix_fmt bgra -i "${i%.*}".bgra -c:v libx264 -preset veryslow -qp 0 -movflags +faststart -i "${i%.*}".wav -c:a libfdk_aac -b:a 384k "${i%.*}".mp4 ; rm "${i%.*}".bgra "${i%.*}".wav
## Our example generates an x264/720p/12fps/AAC best-quality MP4.
## To get dump-gnash, first install the build-dependencies for gnash (this step is OS-specific). Then:
$> git clone http://git.savannah.gnu.org/r/gnash.git ; cd gnash ; ./autogen.sh ; ./configure --enable-renderer=agg --enable-gui=dump --disable-menus --enable-media=ffmpeg --disable-jemalloc ; make
$> i=in.swf; dump-gnash -1 -j 1280 -k 720 -D "${i%.*}".bgra@12 -A "${i%.*}".wav "${i}"
## Count the number of pages of all PDFs in current directory and all subdirs, recursively
$> find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{print $1,$2}'
##==========================================
## List all files modified by a command
$> D="$(date "+%F %T.%N")"; [COMMAND]; find . -newermt "$D"
## Often you run a command, but afterwards youre not quite sure what it did.
## By adding this prefix/suffix around [COMMAND], you can list any files that were modified.
## Take a nanosecond timestamp: YYYY-MM-DD HH:MM:SS.NNNNNNNNN
$> date "+%F %T.%N"
## Find any files that have been modified since that timestamp:
$> find . -newermt "$D"
## This command currently only searches below the current directory.
## If you want to look elsewhere change the find parameter, e.g.
$> find /var/log . -newermt "$D" 
##==========================================
## Monitor all DNS queries made by Firefox
$> NSPR_LOG_MODULES=nsHostResolver:5 NSPR_LOG_FILE=/tmp/log.txt firefox
##==========================================
## Rolling upgrades via aptitude
$> sudo sh -c "aptitude update; aptitude -DrVWZ full-upgrade; aptitude autoclean; exit"
##==========================================
## Monitor Ebay for cheap things with shipping
## The ebay URL is the search query copied from the browser (here searching for bed stuff). The regex is for crap that should not be shown. Important is "Pickup only", which filters away all the things that cannot be shipped (a filter that cannot be done on Ebays webpage).
## It will output the title and url for all matching items, for all pages of the search result.
$> xidel --quiet 'http://www.ebay.com/sch/Beds-Bed-Frames-/175758/i.html?_from=R40&_sac=1&_sop=15&_nkw=bed' -e 'css(".lvresult")[not(matches(., "Pickup only|BUILDING PLANS \(ONLY\)|PARTS LIST"))]/css(".lvtitle")/(.||": "||a/@href)'  -f 'css("a.gspr.next")'
##==========================================
## Keep a log of the active windows
## This logs the titles of the active windows, thus you can monitor what you have done during which times. (it is not hard to also log the executable name, but then it is gets too long)
$> while true; do (echo -n $(date  +"%F %T"):\ ; xwininfo -id $(xprop -root|grep "ACTIVE_WINDOW("|cut -d\  -f 5) | grep "Window id" | cut -d\" -f 2 ) >> logfile; sleep 60; done
##==========================================
## Run a command multiple times with different subcommands
## Its nice to be able to use the command 
$> ls program.{h,c,cpp} 
## This expands to 
$> ls program.h program.c program.cpp
## Note: This is a text expansion, not a shell wildcard type expansion that looks at matching file names to calculate the expansion. More details at http://www.linuxjournal.com/content/bash-brace-expansion
## I often run multiple commands (like apt-get) one after the other with different subcommands. Just for fun this wraps the whole thing into a single line that uses brace expansion.
$> echo apt-get\ {update,-y\ upgrade}\ \&\& true | sudo bash
##==========================================
## Check how far along (in %) your program is in a file
$> F=bigdata.xz; lsof -o0 -o -Fo $F | awk -Ft -v s=$(stat -c %s $F) '/^o/{printf("%d%%\n", 100*$2/s)}'
## Imagine youve started a long-running process that involves piping data, but you forgot to add the progress-bar option to a command.
$> xz -dc bigdata.xz | complicated-processing-program > summary
## This command uses lsof to see how much data xz has read from the file.
$> lsof -o0 -o -Fo FILENAME
## Display offsets (-o), in decimal (-o0), in parseable form (-Fo)
## This will output something like:
## p12607
## f3
## o0t45187072
## Process id (p), File Descriptor (f), Offset (o)
## We stat the file to get its size
$> stat -c %s FILENAME
## Then we plug the values into awk.
## Split the line at the letter t: -Ft
## Define a variable for the files size: -s=$(stat...)
## Only work on the offset line: /^o/
## Note this command was tested using the Linux version of lsof.
## Because it uses lsofs batch option (-F) it may be portable.
##------------------------------------------
$> f=bigdata.xz; calc "round($(lsof -o0 -o "$f"|awk '{o=substr($7,3)}END{print o}')/$(stat -c %s "$f")*100)"
## Check how far along (in %) your program is in a file
## Say youre started 
$> xzcat bigdata.xz | complicated-processing-program >summary
## an hour ago, and you of course forgot to 
## enable progress output
$> | awk 'NR%1000==0{print NR>"/dev/stderr"}{print}'
## in the pipeline but its too late for that now). 
## But you really want some idea of how far along your program is. Then you can run the above command to see how many % along xzcat is in reading the file.
## Note that this is for the GNU/Linux version of lsof; the one found on e.g. Darwin has slightly different output so the awk part may need some tweaks.
##==========================================
## Monitors battery usage (rate of energy charge/discharge)
$> while cat energy_now; do sleep 1; done |awk -v F=$(cat energy_full) -v C=60 'NR==1{P=B=$1;p=100/F} {d=$1-P; if(d!=0&&d*D<=0){D=d;n=1;A[0]=B=P}; if(n>0){r=g=($1-B)/n;if(n>C){r=($1-A[n%C])/C}}; A[n++%C]=P=$1; printf "%3d %+09.5f %+09.5f\n", p*$1, p*g, p*r}'
## Needs to be run in a battery sysfs dir, eg. /sys/class/power_supply/BAT0
## Displays the battery's current charge and the rate per-second at which energy is {dis,}charging. All values are displayed as percentages of "full" charge.
## The first column is the current charge. The second is the rate of change averaged over the entire lifetime of the command (or since the AC cable was {un,}plugged), and the third column is the rate of change averaged over the last minute (controlled by the C=60 variable passed to awk).
## The sample output captures a scenario where I ran 'yes' in another terminal to max out a CPU. My battery was at 76% charge and you can see the energy drain starts to rise above 0.01% per-second as the cpu starts working and the fan kicks in etc. While idle it was more like 0.005% per-second.
## I tried to use this to estimate the remaining battery life/time until fully charged, but found it to be pretty useless... As my battery gets more charged it starts to charge slower, which meant the estimate was always wrong. Not sure if that's common for batteries or not.
##==========================================
## Get simple weather info from wunderground.com with a zip code 94110 San Francisco
$> curl -s "http://www.wunderground.com/q/zmw:94110.1.99999" | grep "og:title" | cut -d\" -f4 | sed 's/&deg;/ degrees F/'
##==========================================
## list files recursively by size
$> stat -c'%s %n' **/* | sort -n
##==========================================
## Print all open regular files sorted by the number of file handles open to each.
$> find /proc/*/fd -xtype f -printf "%l\n" | grep -P '^/(?!dev|proc|sys)' | sort | uniq -c | sort -n
## List all open files of all processes.
## find /proc/*/fd
## Look through the /proc file descriptors
## -xtype f
## list only symlinks to file
## -printf "%l\n"
## print the symlink target
## grep -P '^/(?!dev|proc|sys)'
## ignore files from /dev /proc or /sys
## sort | uniq -c | sort -n
## count the results
## Many processes will create and immediately delete temporary files.
## These can the filtered out by adding:
$> ... | grep -v " (deleted)$" | ... 
$> lsof -a -d 1-99 -Fn / | grep ^n | cut -b2- | sort | uniq -c | sort -n
$> sudo lsof | egrep 'w.+REG' | awk '{print $10}' | sort | uniq -c | sort -n
##==========================================
## Read and write to TCP or UDP sockets with common bash tools
$> exec 5<>/dev/tcp/time.nist.gov/13; cat <&5 & cat >&5; exec 5>&-
## Ever needed to test firewalls but didnt have netcat, telnet or even FTP?
## Enter /dev/tcp, your new best friend. /dev/tcp/(hostname)/(port) is a bash builtin that bash can use to open connections to TCP and UDP ports.
## This one-liner opens a connection on a port to a server and lets you read and write to it from the terminal.
## How it works:
## First, exec sets up a redirect for /dev/tcp/$server/$port to file descriptor 5.
## Then, as per some excellent feedback from @flatcap, we launch a redirect from file descriptor 5 to STDOUT and send that to the background (which is what causes the PID to be printed when the commands are run), and then redirect STDIN to file descriptor 5 with the second cat.
## Finally, when the second cat dies (the connection is closed), we clean up the file descriptor with 'exec 5>&-'.
## It can be used to test FTP, HTTP, NTP, or can connect to netcat listening on a port (makes for a simple chat client!)
## Replace /tcp/ with /udp/ to use UDP instead.
##==========================================
## Sort Apache access.log by date and time
$> sort -s -b -t' ' -k 4.9,4.12n -k 4.5,4.7M -k 4.2,4.3n -k 4.14,4.15n -k 4.17,4.18n -k 4.20,4.21n access.log*
## Sort Apache access logs by date and time using sort key field feature
##==========================================
## ???????????
## Prepend text to a file 
#$> echo "text to prepend" | cat - file
##==========================================
## SSH connection through host in the middle; with key redirection
$> ssh -o "ProxyCommand ssh user@reachable_host -W %h:%p" user@unreacheable_host
## This command uses the reachable_host as a proxy; redirecting your request to the unreachable_host.
## The main advantage is that you need only one ssh key. You copy the public part to both servers and you can access the unreachable_host without a ## problem.
## Also, you can put this on ~/.ssh/config to access the unreachable_host directly:
## # config
## unreachable_host
## ProxyCommand ssh user@reachable_host -W %h:%p
## and, then, just ssh user@unreachable_host.
##==========================================
## Convert diff output to HTML ins/del
$> diff a.txt b.txt | grep -E '^(<|>)' | sed 's:^< \(.*\):<del style="color\:red; text-decoration\: none">- \1</del><br>:' | sed 's:^> \(.*\):<ins ## style="color\:green; text-decoration\: none">+ \1</ins><br>:'
##==========================================
## Fast command-line directory browsing
$> cdls() { if [[ $1 != "" ]] ; then cd $1; ls; else ls; fi };
## Not really alternative, just giving a different behavior listing current directory if no directory given.
##==========================================
## A sorted summary of disk usage including hidden files and folders
$> du -hs .[^.]* * | sort -h
## Same result as with 'du -ks .[^.]* * | sort -n' but with size outputs in human readable format (e.g., 1K 234M 2G)
##==========================================
## Wait for file to stop changing
$> echo FileName | perl -nlE'sleep 1 while time-(stat)[10]<10' && echo DONE
## perl version of "Wait for file to stop changing"
## When "FileName" has not been changed for last 10 seconds, then print "DONE"
## "10" in "(stat)[10]" means ctime.
## One have other options like atime, mtime and others. http://perldoc.perl.org/functions/stat.html
##==========================================
## Wait for file to stop changing
$> while [ $(( $(date +%s) - $(stat -c %Y FILENAME) )) -lt 10 ]; do sleep 1; done; echo DONE
## This loop will finish if a file hasnt changed in the last 10 seconds.
## It checks the files modification timestamp against the clock.
## If 10 seconds have elapsed without any change to the file, then the loop ends.
## This script will give a false positive if theres a 10 second delay between updates,
## e.g. due to network congestion
## How does it work?
## 'date +%s' gives the current time in seconds
## 'stat -c %Y' gives the files last modification time in seconds
## '$(( ))' is bashs way of doing maths
## '[ X -lt 10 ]' tests the result is Less Than 10
## otherwise sleep for 1 second and repeat
## Note: Clever as this script is, inotify is smarter.
##==========================================
## List the size (in human readable form) of all sub folders from the current location
$> du -sk -- * | sort -n | perl -pe '@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:$1." ".$SI[((length $2)/3)]."\t":e'
## Tested on MacOS and GNU/Linux.
## It works in dirs containing files starting with '-'.
## It runs 'du' only once.
## It sorts according to size.
## It treats 1K=1000 (and not 1024)
##==========================================
## Get magnet link from URL 
$> curl -s http://host.net/url.html | grep magnet | sed -r 's/.*(magnet:[^"]*).*/\1/g'
$> function magnetlink () { curl -s $1 | grep magnet | sed -r 's/.*(magnet:[^"]*).*/\1/g' ; }
##==========================================
## Bare Metal IRC Client
$> nik=clf$RANDOM;sr=irc.efnet.org;expect -c "set timeout -1;spawn nc $sr 6666;set send_human {.1 .2 1 .2 1};expect AUTH*\n ;send -h \"user $nik * * :$nik ## commandlinefu\nnick $nik\n\"; interact -o -re (PING.:)(.*\$) {send \"PONG :\$interact_out(2,string)\"}"
## Uses the extremely cool utilities netcat and expect.
## "expect" logs in & monitors for server PING checks.
## When a PING is received it sends the PONG needed to stay connected.
## IRC commands to try: HELP, TIME, MOTD, JOIN and PRIVMSG
## The "/" in front of IRC commands are not needed, e.g. type JOIN #mygroup
## Learn about expect: http://tldp.org/LDP/LGNET/issue48/fisher.html
## The sample output shows snippets from an actual IRC session.
## Please click UP button if you like it!
##==========================================
## Remove duplicate lines whilst keeping empty lines and order
$> awk '!NF || !seen[$0]++'
##==========================================
## dynamically list open files for a given process name 
$> lsof -i -n -P | grep -e "$(ps aux | grep node | grep -v grep | awk -F' ' '{print $2}' | xargs | awk -F' ' '{str = $1; for(i = 2; i < NF; i++) {str = str "\\|" $i} print str}')"
##==========================================
## Secure netcat chat - SSH
$> ssh hostname nc -l 9876
## client:
$> nc localhost 9876 ip -o -4 a s | awk -F'[ /]+' '$2!~/lo/{print $4}'
##==========================================
## set create time using file name for files pulled from android camera
$> find . -type f -exec echo -n "touch -t \`echo " \; -exec echo -n {} \; -exec echo -n " | sed -E ## 's/.*([[:digit:]]{8})_([[:digit:]]{4})([[:digit:]]{2}).*/\1\2.\3/g'\` " \; -exec echo {} \; | sh 
##==========================================
## Rename file to same name plus datestamp.
$> mv -iv $FILENAME{,.$('date +%F_%T' $FILENAME)}
## FILENAME=nohup.out
$> mv -iv $FILENAME{,.$(stat -c %Y $FILENAME)}
##==========================================
## Rename file to same name plus datestamp of last modification.
$> mv -iv $FILENAME{,.$(stat -c %Z $FILENAME)}
## FILENAME=nohup.out
$> mv -iv $FILENAME{,.$(stat -c %Y $FILENAME)}
$> mv -iv $FILENAME{,.$(stat -c %y $FILENAME | awk '{print $1}')}
## Rename file to same name plus datestamp of last modification.
## Note that the -i will not help in a script. Proper error checking is required.
##==========================================
## rename all files with "?" char in name
$> find . -type f -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
## replace all "?" characters in filename to underscore
##==========================================
## rename all dirs with "?" char in name
$> find . -type d -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
## rename all dirs with "?" char in name, leave spaces and () in place
##==========================================
## Count the number of pages of all PDFs in current directory and all subdirs, recursively
$> find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{print $1,$2}'
## using awk, changed the line given by sucotronic in command #11733 to print the first and second columns
##==========================================
## slow down/speed up video file 
$> mencoder -speed 2 -o output.avi -ovc lavc -oac mp3lame input.avi
##==========================================
## starts a CGI web server
$> python2 -m CGIHTTPServer
## In case you need to test some CGI scripts this does the job. It also has the functionality of a http server.
## Enjoy!
##==========================================
## Regex to reliably search a file for valid IP addresses (and external IP addresses)
$> | grep -Eoa "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][## 0-9]|[01]?[0-9][0-9]?)\b"
## Command returns valid IP addresses. Append the following regex to additionally filter out NAT and reserved IP addresses
## | grep -Ev "^0|\.0[0-9]|^10\.|^127\.|^169\.|^172\.(1[6-9]|2[0-9]|3[01])|^191.168.|^2(2[4-9]|3[0-9])|^2(4[0-9]|5[0-5])"
## ifconfig
## | grep -Eoa "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][## 0-9]|[01]?[0-9][0-9]?)\b"| grep -Ev "^0|\.0[0-9]|^10\.|^127\.|^169\.|^172\.(1[6-9]|2[0-9]|3[01])|^191.168.|^2(2[4-9]|3[0-9])|^2(4[0-9]|5[0-5])" | grep -## v 255
##==========================================
## dumb?
## Get all URL With Extension from File 
$> cat File.txt | grep -io 'http://www.acme.com/a/files/.*.pdf'| uniq
##==========================================
## rename all images in folder with prefix of date and time from exif data
$> jhead -n%Y-%m-%d_%H-%M-%S__%f *.JPG
## jhead is required
##==========================================
## rename all images in folder with prefix of date and time from exif data
$> for i in `ls` ; do date=$(identify -format %[exif:DateTime] $i); date=${date//:/-}; date=${date// /_}; mv $i ${date}__$i; done
## imagemagick is required
$> for i in * ; do date=$(identify -format %[exif:DateTime] $i); date=${date//:/-}; date=${date// /_}; mv $i ${date}__$i; done
##==========================================
## Print the IPv4 address of a given interface 
$> ip a s eth0 | sed -nr 's!.*inet ([^/]+)/.*!\1!p'
##==========================================
## convert png images to jpg and optimize them
$> ls *.png | cut -d . -f 1 | xargs -L1 -i convert -strip -interlace Plane -quality 80 {}.png {}.jpg
## Comments (0) | Add to favourites | Report as malicious | Submit alternative | Report as a duplicate
$> find . -name *.png | xargs optipng -nc -nb -o7 -full
## optimize all png images 
##==========================================
## List all groups 
$> cut -d: -f1 /etc/group | sort
##==========================================
## repeated=separate
## Find Duplicate Files (based on size first, then MD5 hash)
$> find -not -empty -type f -printf "%-30s'\t\"%h/%f\"\n" | sort -rn -t$'\t' | uniq -w30 -D | cut -f 2 -d $'\t' | xargs md5sum | sort | uniq -w32 --all-
## Finds duplicates based on MD5 sum. Compares only files with the same size. Performance improvements on:
$> find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-
## repeated=separate
## The new version takes around 3 seconds where the old version took around 17 minutes. The bottle neck in the old command was the second find. It ## searches for the files with the specified file size. The new version keeps the file path and size from the beginning.
##==========================================
## Mount a VMware virtual disk (.vmdk) file on a Linux box
$> kpartx -av <image-flat.vmdk>; mount -o /dev/mapper/loop0p1 /mnt/vmdk
## This does not require you to know the partition offset, kpartx will find all partitions in the image and create loopback devices for them automatically. This works for all types of images (dd of hard drives, img, etc) not just vmkd. You can also activate LVM volumes in the image by running
$> vgchange -a y
## and then you can mount the LV inside the image.
## To unmount the image, umount the partition/LV, deactivate the VG for the image
$> vgchange -a n <volume_group>
## then run
$> kpartx -dv <image-flad.vmdk> 
## to remove the partition mappings.
##==========================================
## Rename many files in directories and subdirectories
$> find . -type d -print0 | while read -d $'\0' dir; do cd "$dir"; echo " process $dir"; find . -maxdepth 1 -name "*.ogg.mp3" -exec rename 's/.ogg.mp3/.mp3/' {} \; ; cd -; done
## Rename many files in directories and subdirectories
##==========================================
## Convert all flac files in dir to mp3 320kbps using ffmpeg
$> for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done;
## It loops through all files in current directory that have flac extension and converts them to mp3 files with bitrate of 320kpbs using ffmpeg and default codec.
##==========================================
##  Ban all IPs that attempted to access phpmyadmin on your site
$> grep "phpmyadmin" $path_to_access.log | grep -Po "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" | sort | uniq | xargs -I% sudo iptables -A INPUT -s % -j DROP 
##  Cheap security bash one-liner to ban all IPs that are probably doing automated attacks.
##  Make sure your IP isnt listed before piping through iptables drop!!
##  This will first find all lines in $path_to_access.log that have phpmyadmin in them, then grep out the ip address from the start of the line,then sort and unique them,then add a rule to drop them in iptables
##  Again, just edit in echo % at the end instead of the iptables command to make sure your IP isnt in there. Dont inadvertently ban your access to the server!
##  Limitations: You may need to change the grep part of the command if youre on mac or any system that doesnt have grep -P. Im not sure if all systems start with xargs, so that might need to be installed too.
##=========================================
## Work with android devices
## Get vendor ID
$> lsusb
## Bus 001 Device 008: ID 0e8d:201d MediaTek Inc.
$> lsusb | grep "YourDevice" | awk '{print $6}' | sed 's/://' | awk '{print $1}'
## OR BETTER
$> find -L /sys/bus/usb/devices -maxdepth 2 -path "*/modalias" -printf "%h\t" -exec cat {} \; | awk -F: '/icFFisc42ip0/ {print $1}' | xargs -i cat {}/idVendor | awk '{print"0x"$1}'
## Install software
$> sudo apt-get install android-tools-adb android-tools-fastboot
## Add udev rule as root
$> su
$> echo 'SUBSYSTEM=="usb", SYSFS{idVendor}=="0e8d", MODE="0666", GROUP="plugdev"' >> /etc/udev/rules.d/71-android.rule
## Add vendor ID to ~/.android/adb_usb.ini
## in this case 0x0e8d
$> echo "0x0e8d" >> ~/.android/adb_usb.ini
## or
$> find -L /sys/bus/usb/devices -maxdepth 2 -path "*/modalias" -printf "%h\t" -exec cat {} \; | awk -F: '/icFFisc42ip0/ {print $1}' | xargs -i cat {}/idVendor | awk '{print"0x"$1}' | sort -u >> ~/.android/adb_usb.ini
## Start adb
$> sudo adb kill-server
$> sudo /etc/init.d/udev restart
$> sudo adb start-server
$> sudo adb devices
## Should list your device
##------------------------------------------
## Use adb to communicate with the device
$> adb shell
##------------------------------------------
$> lsusb | grep "YourDevice" | awk '{print $6}' | sed 's/://' | awk '{print $1}'
$> lsusb | grep "MediaTek" | awk '{print $6}' | sed 's/://' | awk '{print $1}'
##------------------------------------------
$> lsusb | awk '{print $8}'
##------------------------------------------
## Take screenshot of Android device using adb and save to filesystem
$> adb shell screencap -p | sed 's/\r$//' > FILENAME.PNG
##------------------------------------------
$> function idVendor () { find -L /sys/bus/usb/devices -maxdepth 2 -path "*/modalias" -printf "%h\t" -exec cat {} \; | awk -F: '/icFFisc42ip0/ {print $1}' | xargs -i cat {}/idVendor | awk '{print"0x"$1}' ; }
##==========================================
## WordPress
$> wget http://wordpress.org/latest.tar.gz
# Download WordPress, modify wp-config.php, set permissions
$> function install_wp {
$>   wget http://wordpress.org/latest.tar.gz
$>   tar xzvf latest.tar.gz
$>   cp -rf wordpress/** ./
$>   rm -R wordpress
$>   cp wp-config-sample.php wp-config.php
$>   sed -i "s/database_name_here/$dbname/g" wp-config.php
$>  sed -i "s/username_here/$dbuser/g" wp-config.php
$>   sed -i "s/password_here/$dbpass/g" wp-config.php
$>   wget -O wp.keys https://api.wordpress.org/secret-key/1.1/salt/
$>   sed -i '/#@-/r wp.keys' wp-config.php
$>   sed -i "/#@+/,/#@-/d" wp-config.php
$>   mkdir wp-content/uploads
$>   find . -type d -exec chmod 755 {} \;
$>   find . -type f -exec chmod 644 {} \;
$>   chown -R :www-data wp-content/uploads
$>   chown -R $USER:www-data *
$>   chmod 640 wp-config.php
$>   rm -f latest.tar.gz
$>   rm -f wp-install.sh
$>   rm -f wp.keys
$> }
$> 
$> chown -R eakinc:www-data *
##==========================================
$> echo "https://www.google.com/maps/place/$(exiftool -ee -p '$gpslatitude, $gpslongitude' -c "%d?%d'%.2f"\" image.jpg 2> /dev/null | sed -e "s/ //g")"
## Generate a Google maps URL for GPS location data from digital photo
## This command uses the "exiftool" command which is available here: http://www.sno.phy.queensu.ca/~phil/exiftool/
##==========================================
$> rsync -a --delete empty-dir/ target-dir/
## Optimal way of deleting huge numbers of files
## This command works by rsyncing the target directory (containing the files you want to delete) with an empty directory. The '--delete' switch instructs rsync to remove files that are not present in the source directory. Since there are no files there, all the files will be deleted.
## Im not clear on why its faster than find -delete, but it is.
## Benchmarks here: https://web.archive.org/web/20130929001850/http://linuxnote.net/jianingy/en/linux/a-fast-way-to-remove-huge-number-of-files.html
##==========================================
$> "SELECT strftime('%d.%m.%Y %H:%M:%S', dateAdded/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_bookmarks WHERE moz_places.id = moz_bookmarks.fk ORDER BY dateAdded;"; done
## get all bookmarks from all profiles from firefox
$> for i in $(ls /home/marco/.mozilla/firefox/*\.*/places.sqlite); do sqlite3 $i "SELECT strftime('%d.%m.%Y %H:%M:%S', dateAdded/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_bookmarks WHERE moz_places.id = moz_bookmarks.fk ORDER BY dateAdded;"; done
##==========================================
## Show running services (using systemctl)
$> command systemctl --no-page --no-legend --plain -t service --state=running
##==========================================
$> echo Which way up? | flip.pl | cowsay | tac | sed -e "s,/,+,g" -e "s,\\\,/,g" -e "s,+,\\\,g" -e "s,_,-,g" -e "s,\^,v,g"
## Inverted cowsay
## Its quite fun to invert text using "flip.pl" (ref: http://ubuntuforums.org/showthread.php?t=2078323 ).
## Slightly more challenging is to flip a whole "cowsay". :-)
##==========================================
$> ASN=32934; for s in $(whois -H -h riswhois.ripe.net -- -F -K -i $ASN | grep -v "^$" | grep -v "^%" | awk '{ print $2 }' ); do echo " blocking $s"; sudo iptables -A INPUT -s $s -j REJECT &> /dev/null || sudo ip6tables -A INPUT -s $s -j REJECT; done
## Block all FaceBook traffic
##==========================================
## Embed next line on the end of current line using sed (where X is the current line)
## Convert all flac files in dir to mp3 320kbps using ffmpeg
$> $ for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done;
##==========================================
$> sed 'X{N;s/\n//;}' file.txt 
## Embed next line on the end of current line using sed (where X is the current line)
## N: On the current line, sed will display it on pattern space, plus a \n (new line); but s/\n//: Will get rid of new line displayed on pattern space, joining the current lines end with the start of the next line
##==========================================
$> sudo mount -o remount,rw / && sudo cp /etc/hosts /etc/hosts.old && wget http://winhelp2002.mvps.org/hosts.txt && cp /etc/hosts ~/ && cat hosts.txt >> hosts && sudo cp hosts /etc/hosts
## Ad blocking on Ubuntu phone/tablet with hosts file
## Will append lines to the hosts file to do some basic ad blocking.
##==========================================
$> echo "https://www.google.com/maps/place/$(exiftool -ee -p '$gpslatitude, $gpslongitude' -c "%d?%d'%.2f"\" image.jpg 2> /dev/null | sed -e "s/ //g")"
## Generate a Google maps URL for GPS location data from digital photo
## This command uses the "exiftool" command which is available here: http://www.sno.phy.queensu.ca/~phil/exiftool/
##==========================================
## To play on chromecast
$> avconv -i inputfile.avi  -c:v libx264 -c:a libfdk_aac outputfile.mp4
$> avconv -i inputfile.mkv  -c:v copy -c:a copy outputfile.mp4
##==========================================
# Create a test html file
$> echo "<html><body>This is a test</body></html>" > /var/www/html/index.html
##==========================================
# Remove whitespace
# Remove leading whitespace
$> sed 's/^[ \t]*//' tmp > tmp2
# Remove trailing whitespace from each line
$> sed 's/[ \t]*$//' tmp2 > tmp3
# Remove leading whitespace from file
$> awk '!d && NF {sub(/^[[:blank:]]*/,""); d=1} d' tmp4 > tmp5
# Remove blank lines from end of file
$> awk '/^[[:space:]]*$/{p++;next} {for(i=0;i<p;i++){printf "\n"}; p=0; print}' tmp5 > tmp6
##==========================================
# Searches for text in all files in the current folder
$> greptext ()
$> {
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
$> 	grep -iIHrn --color=always "$1" . | less -r
$> }
##==========================================
## 
$> videnctool -compose --file=vid1.avi --start=00:00:30:12 --end=00:01:45:00 --file=vid2.avi --start=00:05:00:00 --end=00:07:12:25 --file=mypicture.png --duration=00:00:02:00 --file=vid3.avi --start=00:02:00:00 --end=00:02:45:10 --output=editedvid.avi
$> videnctool -compose --file=vid1.avi --start=00:00:01:12 --end=00:01:45:00 --output=editedvid.avi
##==========================================
$> ffmpeg -i input-file.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output-file.webm
##==========================================
## Cut out a part starting at 00:01:30 into the original file with a 5 seconds length and that it shouldnt be reencoded (if you want to re-encode it youll have to replace copy with audio and video codecs, for a list of available audio codecs issue mencoder -oac help, for a list of available video codecs issue mencoder -ovc help), then you issue:
## mencoder
$> mencoder -ss 00:30:00 -endpos 00:00:05 -oac copy -ovc copy originalfile -o newfile
## Youll have to replace orginalfile and newfile with actual file names, the later is the name of the file that is created to hold the cut out part.
## ffmpeg
## Cut out a part starting at 00:0:30 into the original file with a 5 seconds length and that it shouldnt be re-encoded (if you want to re-encode it youll have to replace copy with audio and video codecs, for a list of available codecs issue ffmpeg -formats -E), then you issue:
$> ffmpeg -ss 00:00:30 -i orginalfile -t 00:00:05 -vcodec copy -acodec copy newfile
## Replace orginalfile and newfile with actual file names, the later is the name of the file that is created to hold the cut out part.
##==========================================
$> mencoder -ss 00:30:00 -endpos 00:00:05 -oac copy -ovc copy 
##==========================================
## use FFmpeg cut mp4 video without re-encoding
## Example:
$> ffmpeg -i source.mp4 -ss 00:00:05 -t 00:00:10 -c copy cut_video.mp4
## use FFmpeg cut mp4 video with re-encoding
## Example:
$> ffmpeg -i source.mp4 -ss 00:00:05 -t 00:00:10 -async 1 -strict -2 cut_video.mp4
##==========================================
## Launch remote awesome session on Dual monitor
$> Xephyr -keybd ephyr,,,xkbmodel=evdev,xkblayout=it -listen tcp -ac -reset -output VGA1 :5
## from xfce session to avoid keyboard shortcut clashing
## start xephyr in VGA1 monitor:
$> Xephyr -keybd ephyr,,,xkbmodel=evdev,xkblayout=it -listen tcp -ac -reset -output VGA1 :5
## then start an xterm locally
$> export DISPLAY=:5.0
## xterm
## and remote ssh (no X fw needed if local tcp with access disablesd (-tcp -ac) => UNSECURE!!!
$> ssh remote-host
$> export DISPLAY=notebook:5.0
$> xrdb -merge ~/.Xresources
$> xterm -geometry 132x50-0+0
## start awesome
$> dbus-launch $(which awesome)
$> dex -a -e Awesome
##==========================================
## Simple Video Surveillance by email
$> while true ; do fswebcam -d /dev/video0 -r 1280x1024 -F 15 - | uuencode $(date +\%Y\%m\%d\%H\%M).jpeg | mail -s "Video surveillance" me@gmail.com ; sleep 300 ; done
## This takes a picture (with the web cam) every 5 minutes, and send the picture to your e-mail.
## Some systems support
## mail -a "References: "
## so that all video surveillance emails are grouped in a single email thread.
## To keep your inbox clean, it is still possible to filter and move to trash video surveillance emails (and restore these emails only if you really get robbed!)
## For instance with Gmail, emails sent to me+trash@gmail.com can be filtered with "Matches: DeliveredTo:me+trash@gmail.com"
##==========================================
##  ix is a paste website to host files usable by commandline
# Examples:
#     ix hello.txt              # paste file (name/ext will be set).
#     echo Hello world. | ix    # read from STDIN (won't set name/ext).
#     ix -n 1 self_destruct.txt # paste will be deleted after one read.
#     ix -i ID hello.txt        # replace ID, if you have permission.
#     ix -d ID
# This file at http://ix.io/yaV
#$> ix() {
#$>     local opts
#$>     local OPTIND
#$>     [ -f "$HOME/.netrc" ] && opts='-n'
#$>     while getopts ":hd:i:n:" x; do
#$>         case $x in
#$>             h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
#$>             d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
#$>             i) opts="$opts -X PUT"; local id="$OPTARG";;
#$>             n) opts="$opts -F read:1=$OPTARG";;
#$>         esac
#$>     done
#$>     shift $(($OPTIND - 1))
#$>     [ -t 0 ] && {
#$>         local filename="$1"
#$>         shift
#$>         [ "$filename" ] && {
#$>             curl $opts -F f:1=@"$filename" $* ix.io/$id
#$>             return
#$>         }
#$>         echo "^C to cancel, ^D to send."
#$>     }
#$>     curl $opts -F f:1='<-' $* ix.io/$id
#$> }
##------------------------------------------
$> ix() { local opts; local OPTIND; [ -f "$HOME/.netrc" ] && opts='-n'; while getopts ":hd:i:n:" x; do  case $x in  h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;  d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;  i) opts="$opts -X PUT"; local id="$OPTARG";;  n) opts="$opts -F read:1=$OPTARG";;  esac; done; shift $(($OPTIND - 1)); [ -t 0 ] && {  local filename="$1";  shift;  [ "$filename" ] && {  curl $opts -F f:1=@"$filename" $* ix.io/$id;  return;  };  echo "^C to cancel, ^D to send."; }; curl $opts -F f:1='<-' $* ix.io/$id; }
##==========================================
$>  sshfs name@server:/path/to/folder /path/to/mount/point
##  Mount folder/filesystem through SSH
##  Install SSHFS from http://fuse.sourceforge.net/sshfs.html
##  Will allow you to mount a folder securely over a network.
##==========================================
## Clear filesystem memory cache
$> sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
## Found here: http://ubuntuforums.org/showthread.php?t=589975
##==========================================
##==========================================
## Get a qrcode for a given string from qrenco.de
$> echo "http://commandlinefu.com" | curl -F-=\<- qrenco.de
##==========================================
$> ffmpeg -i input.flv -vf scale=320:-1 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - output.gif
## convert video to gif by ffmpeg and imagemagick
## you can use any common video format. if you dont need to change the size of gif output, just remove `-vf scale=320:-1`
## btw, 320:-1 means width is 320px and height would be set automatically
##==========================================
$> sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
## Disable sleep mode via cli and systemd (Centos, Debian Ubuntu?)
## This causes computer to never power off or go into sleep mode. Disables sleep mode linux.
##==========================================
$> pmset -g batt | awk '/^ /{print $5}'
## Display minutes remaining on Macbook battery
## Remaining battery time is displayed in minutes
##==========================================
$> printf "%x\n" $(seq 0 255) | xargs -n1 -IH echo -ne \\xH > test.dat
## Generate binary sequence data 
##==========================================
$> videospeed() { vname="$1"; speedc="$2"; vs=$(python3 -c "print(1/$speedc)"); aspeed=$(python3 -c "print(1*$speedc)"); ffmpeg -i "$vname" -filter:a "atempo=$aspeed" -filter:v "setpts=$vs*PTS" "${3:-converted_$1}"; }
## Speed up or slow down video (and audio)
## videospeed video_filename speedchange newfilename
## videospeed foo.mp4 0.5 foo_slow.mp4
## Range of 0.5 (50%) - 2.0 (200%) is valid.
##==========================================
## Mac OSX
## Move a folder and merge it with another folder
$> gcp -r -l source/ destination/
## This will move a folder and merge it with another folder which may contain duplicates. Technically its just creating hardlinks of everything in the folder, and after its done, delete the source (with rm -r source/ ) to complete the move. This is much faster than, for example, using rsync to merge folders which would actually copy the entire contents and so for a lot of files would take much longer.
## This uses macutils gcp port of cp so it can be used on osx/MacOS. If using in linux or some unix where cp includes the ability to create links with -l you can just use cp instead of gcp.
##==========================================
$> tr -d '\r' < YourTextFile.txt | tr '\n' ' '
## Join lines and separate with spaces
## Read vmargs.txt, which is a text file that could either be DOS-style (\r\n) or UNIX-style (\n) line endings and join the lines with a space separator. Can this be shortened/made more elegant?
##==========================================
$> ls -lart | lolcat -a
## Slow down the screen output of a command
## (example above is the 'ls' command with reduced output speed)
##==========================================
$> id <username> | sed s/' '/'\n'/g | sed s/,/',\n '/g | sed s/'('/' ('/g | sed s/uid/' uid'/g | sed s/gid/' gid'/g | sed s/=/' = '/g
## Pretty-print user/group info for a given user 
##==========================================
## Random news story dumped to terminal
$> w3m -dump `lynx -dump -listonly "http://news.google.com" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep -v "google.com" | sort -R | uniq | head -n1`
## or
$> links -dump $( a=( $( lynx -dump -listonly "http://news.google.com" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep -v "google.com" | sort | uniq ) ) ; amax=${#a[@]} ; n=$(( `date '+%s'` % $amax )) ; echo ${a[n]} )
## or
$> links -dump `lynx -dump -listonly "http://news.google.com" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep -v "google.com" | sort -R | uniq | head -n1`
##==========================================
$> less -X YourTextFile.txt
## Do not clear the screen after viewing a file with less 
##==========================================
$> echo "https://www.google.com/maps/place/$(exiftool -ee -p '$gpslatitude, $gpslongitude' -c "%d?%d'%.2f"\" image.jpg 2> /dev/null | sed -e "s/ //g")"
# Generate a Google maps URL for GPS location data from digital photo
# This command uses the "exiftool" command which is available here: http://www.sno.phy.queensu.ca/~phil/exiftool/
# NB, there should be a degree symbol right after the first "%d" NOT a question mark.
# For some unknown reason, commandlinefu is not able to handle degree symbol correctly ("?")?
##==========================================
$> rsync -a --delete empty-dir/ target-dir/
## Optimal way of deleting huge numbers of files
## This command works by rsyncing the target directory (containing the files you want to delete) with an empty directory. The '--delete' switch instructs rsync to remove files that are not present in the source directory. Since there are no files there, all the files will be deleted.
## I'm not clear on why it's faster than 'find -delete', but it is.
## Benchmarks here: https://web.archive.org/web/20130929001850/http://linuxnote.net/jianingy/en/linux/a-fast-way-to-remove-huge-number-of-files.html
##==========================================
$> tree -isafF /var|grep -v "/$"|tr '[]' ' '|sort -k1nr|head
## Find top 10 largest files in /var directory (subdirectories and hidden files included )
## Should work even when very large files exist.
##==========================================
$> du -a /var | sort -n -r | head -n 10
## Find top 10 largest files 
##==========================================
$> echo "$USER"|rev | espeak
## Your name backwards 
##==========================================
## Make changes in .bashrc immediately available 
$> bashrc-reload() { builtin exec bash ; }
##==========================================
## Show running services (using systemctl) 
$> command systemctl --no-page --no-legend --plain -t service --state=running
# or
$> systemctl --no-page -t service -a --state running --no-legend
##==========================================
## Play streaming music on command line. Awesome!!!!
$> mplayer http://pub7.di.fm/di_ambient_aac?1 -user-agent "AudioAddict-di/3.2.0.3240 Android/5.1"
## This commands does just two things: fakes user agent (the one was taken from recent Android app) and sends the (possibly) listener ID (it can be any - I put "1" here because it works like a charm - after the name of stream ?1 as you can see).
## Look for the list of stations here: http://pub7.di.fm
## Or here: https://goo.gl/pdhhpQ
##==========================================
$> ffmpeg -i input.flv -vf scale=320:-1 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - output.gif
## convert video to gif by ffmpeg and imagemagick
## you can use any common video format. if you dont need to change the size of gif output, just remove `-vf scale=320:-1`
## btw, 320:-1 means width is 320px and height would be set automatically
##==========================================
$> for y in {1..12}; do for x in {1..12}; do echo -n "| $x*$y=$((y*x)) "; done; echo; done|column -t
## Multiplication table The multiplication table for math study
##==========================================
$> bashrc-reload() { builtin exec bash ; }
# Make changes in .bashrc immediately available 
##==========================================
## Block all FaceBook traffic 
$> ASN=32934; for s in $(whois -H -h riswhois.ripe.net -- -F -K -i $ASN | grep -v "^$" | grep -v "^%" | awk '{ print $2 }' ); do echo " blocking $s"; sudo iptables -A INPUT -s $s -j REJECT &> /dev/null || sudo ip6tables -A INPUT -s $s -j REJECT; done
##==========================================
$> ss -t -o state established '( dport = :443 || dport = :80 )' | grep -Po '([0-9a-z:.]*)(?=:http[s])' | sort -u|netcat whois.cymru.com 43|grep -v "AS Name"|sort -t'|' -k3
## Lookup autonomous systems of all outgoing http/s traffic
## Using GNU Grep with perl regexp (works on newer Ubuntus)
## or
$> ss -t -o state established '( dport = :443 || dport = :80 )'|grep tcp|awk '{ print $5 }'|sed s/:http[s]*//g|sort -u|netcat whois.cymru.com 43|grep -v "AS Name"|sort -t'|' -k3
# Lookup autonomous systems of all outgoing http/s traffic 
##==========================================
$> for i in *.flac; do flac -d -c "${i}" |lame -h --preset 196 --ta "Artist Here" --tl "Disc Title Here" --add-id3v2 - "./MP3/$i.mp3"; done
## Transcode original FLAC files to downsampled MP3 files in exclusive folder 
##==========================================
$> transfer() { basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile"|xsel --clipboard;xsel --clipboard ; }
## access to the internet(http://transfer.sh)
## This is an alias utilizing the transfer.sh service to make sharing files easier from the command line. transfer.sh uses xsel to copy the resulting URL to the clipboard.
$> transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" |xsel --clipboard; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" |xsel --clipboard ; fi; xsel --clipboard; }
##==========================================
$> get_iplayer --type=radio --channel "Radio 4 Extra" | grep : | awk '{ if ( NR > 1 ) { print } }'|sed 's/:.*//' |sed '$ d' > pidlist && while read p; do get_iplayer --get --fields=pid $p; done <pidlist && rm pidlist
## grab all m4a file from bbc radio 4 extra for some easy audio ebbok listening
## use get_iplay to download all listed content from http://www.bbc.co.uk/radio4extra run every night to make sure no episodes are missed
##==========================================
$> netstat -np | grep -v ^unix
## Examine processes generating traffic on your website
## I often have to google this so I put it here for quick reference.
##==========================================
## Replace all spaces with underscore in all files in current folder 
$> rename 's/ /_/g' *
##==========================================
# Take screenshot of Android device using adb and save to filesystem 
$> adb shell screencap -p | sed 's/\r$//' > FILENAME.PNG
##==========================================
$> weather() { curl -s "http://www.wunderground.com/q/zmw:$1.1.99999" | grep "og:title" | cut -d\" -f4 | sed 's/&deg;/ degrees F/'; }
## Get simple weather info from a zip code 
##==========================================
## List all the currently loaded old kernel packages, that is other than the active one
$> dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'
##==========================================
$> net rpc shutdown -I ipAddressOfWindowsPC -U username%password
## Shutdown a Windows machine from Linux
## This will issue a shutdown command to the Windows machine. username must be an administrator on the Windows machine. Requires samba-common package installed. Other relevant commands are:
## net rpc shutdown -r : reboot the Windows machine
## net rpc abortshutdown : abort shutdown of the Windows machine
## Type:
## net rpc
## to show all relevant commands
##==========================================
## Mount folder/filesystem through SSH
$> sshfs name@server:/path/to/folder /path/to/mount/point
##==========================================
## Display a block of text with AWK 
$> awk '/start_pattern/,/stop_pattern/' file.txt
##==========================================
## NOT WORKING
## save command output to png image NOT WORKING
$> ifconfig | convert label:@- ip.png
##==========================================
$> vim -x <FILENAME>
## Add Password Protection to a file your editing with vim.
## While I love gpg and truecrypt theres some times when you just want to edit a file and not worry about keys or having to deal needing extra software on hand. Thus, you can use vim encrypted file format.
## For more info on vim encrypted files visit: http://www.vim.org/htmldoc/editing.html#encryption
##==========================================
## NO LONGER WORKS
## Google Translate.  NO LONGER WORKS
$> translate (){ wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2|${3:-en}" | sed 's/.*"translatedText":"\([^"]*\)".*}/\1\n/'; }
## Google Translate.  Usage: translate <phrase> <source-language> <output-language>
## Example: translate hello en es
## See this for a list of language codes: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
##==========================================
$> ESC *
## Inserts the results of an autocompletion in the command line
## Pressing ESC then * will insert in the command line the results of the autocompletion.
## It is hard to explain but if you look the sample output or do
$> echo ESC *
## you will understand quickly.
## - Hold ESC does the same thing as tab tab
## - 'ESC .' inserts the last argument of last command (can be done many times in order to get the last argument of all previous commands)
##==========================================
## replace spaces in filenames with underscores
$> rename 'y/ /_/' *
## This command will replace all the spaces in all the filenames of the current directory with underscores. There are other commands that do this here, but this one is the easiest and shortest
##==========================================
$> readom dev=/dev/scd0 f=/path/to/image.iso
## Create a CD/DVD ISO image from disk.
## Many like to use 'dd' for creating CD/DVD iso images. This is bad. Very bad. The reason this is, is 'dd' does not have any built-in error checking. So, you dont know if you got all the bits or not. As such, it is not the right tool for the job. Instead, 'reaom' (read optical media) from the wodim package is what you should be using. It has built-in error checking. Similarly, if you want to burn your newly creating ISO, stay away from 'dd', and use:
## wodim -v -eject /path/to/image.iso 
##==========================================
## intercept stdout/stderr of another process 
$> strace -ff -e trace=write -e write=1,2 -p SOME_PID
##==========================================
## Create a pdf version of a manpage
$> man -t manpage | ps2pdf - filename.pdf
##==========================================
## Edit a file on a remote host using vim 
$> vim scp:[email protected]//path/to/somefile
##==========================================
## Graph # of connections for each hosts.
$> netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'
## Written for linux, the real example is how to produce ascii text graphs based on a numeric value (anything where uniq -c is useful is a good candidate).
##==========================================
## Record a screencast and convert it to an mpeg. Grab X11 input and create an MPEG at 25 fps with the resolution 800x600
$> ffmpeg -f x11grab -r 25 -s 800x600 -i :0.0 /tmp/outputFile.mpg
##==========================================
## Show numerical values for each of the 256 colors in bash
$> for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
## Same as http://www.commandlinefu.com/commands/view/5876, but for bash.
## This will show a numerical value for each of the 256 colors in bash. Everything in the command is a bash builtin, so it should run on any platform where bash is installed. Prints one color per line. If someone is interested in formatting the output, paste the alternative.
##==========================================
## Remove security limitations from PDF documents using ghostscript
$> gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=OUTPUT.pdf -c .setpdfwrite -f INPUT.pdf
## Remove security from PDF document using this very simple command on Linux and OSX. You need ghostscript for this baby to work.
##==========================================
## Search commandlinefu.com from the command line using the API. Usage: cmdfu hello world
$> cmdfu (){ curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; }
##==========================================
## Download all images from a site
$> wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" http://example.com/images
## This recursively downloads all images from a given website to your /tmp directory. The -nH and -nd switches disable downloading of the directory structure.
##==========================================
## Compare two directory trees.
$> diff <(cd dir1 && find | sort) <(cd dir2 && find | sort)
##==========================================
## Quick access to ASCII code of a key 
$> showkey -a
##==========================================
$> find . -type f -newermt "2010-01-01" ! -newermt "2010-06-01"
## Find files in a specific date range - in this case, the first half of last year.
## -newermt = modification time of the file is more recent than this date
## GNU find allows any date specfication that GNU date would accept, e.g.
$> find . -type f -newermt "3 years ago" ! -newermt "2 years ago"
## or
$> find . -type f -newermt "last monday" 
##==========================================
## Block known dirty hosts from reaching your machine
$> wget -qO - http://infiltrated.net/blacklisted | awk '!/#|[a-z]/&&/./{print "iptables -A INPUT -s "$1" -j DROP"}'
## Blacklisted is a compiled list of all known dirty hosts (botnets, spammers, bruteforcers, etc.) which is updated on an hourly basis. This command will get the list and create the rules for you, if you want them automatically blocked, append |sh to the end of the command line. Its a more practical solution to block all and allow in specifics however, there are many who dont or cant do this which is where this script will come in handy. For those using ipfw, a quick fix would be {print add deny ip from "$1" to any}. Posted in the sample output are the top two entries. Be advised the blacklisted file itself filters out RFC1918 addresses (10.x.x.x, 172.16-31.x.x, 192.168.x.x) however, it is advisable you check/parse the list before you implement the rules
##==========================================
## Python version 3: Serve current directory tree at http://$HOSTNAME:8000/
$> python -m http.server
## In Python version 3, the module was merged into http.server. Gentlemen, change your aliases.
##==========================================
$> echo $(sudo lshw -businfo | grep -B 1 -m 1 $(df "/path/to/file" | tail -1 | awk '{print $1}' | cut -c 6-8) | head -n 1 | awk '{print $1}' | cut -c 5- | tr ":" "-") | sudo tee /sys/bus/usb/drivers/usb/unbind
## Given a file path, unplug the USB device on which the file is located (the file must be on an USB device !)
## Apply this command (using the file path of anything on your device) and it will simulate the unplug of this device.
## If you just want the port, just type :
$> echo $(sudo lshw -businfo | grep -B 1 -m 1 $(df "/path/to/file" | tail -1 | awk '{print $1}' | cut -c 6-8) | head -n 1 | awk '{print $1}' | cut -c 5- | tr ":" "-")
##==========================================
## Remove blank lines from a file using grep and save output to new file 
$> grep . filename > newfilename
##==========================================
## Get the IP of the host your coming from when logged in remotely. 
$> echo ${SSH_CLIENT%% *}
##==========================================
## find all file larger than 500M 
$> find / -type f -size +500M
##==========================================
## Intersection between two files 
$> grep -Fx -f file1 file2
## Differences between two files 
$> grep -v -Fx -f file1 file2
##==========================================
$> bc <<< 'obase=60;299'
## Convert seconds into minutes and seconds
## This is a very simple way to input a large number of seconds and get a more useful value in minutes and seconds. Avoids useless use of echo.
##==========================================
## Create banner from output
$> figlet
##==========================================
$> grep -rl oldstring . | xargs sed -i -e 's/oldstring/newstring/'
## recursive search and replace old with new string, inside files
## recursively traverse the directory structure from . down, look for string "oldstring" in all files, and replace it with "newstring", wherever found
## or
$> grep -rl oldstring . | xargs perl -pi~ -e 's/oldstring/newstring' 
##==========================================
## NOT WORKING
## Download Youtube video with wget!
#wget http://www.youtube.com/watch?v=dQw4w9WgXcQ -qO- | sed -n "/fmt_url_map/{s/[\'\"\]/\n/g;p}" | sed -n '/^fmt_url_map/,/videoplayback/p' | sed -e :a -e '$q;N;5,$D;ba' | tr -d '\n' | sed -e 's/\(.*\),\(.\)\{1,3\}/\1/' | wget -i - -O surprise.flv
##==========================================
## Sort the size usage of a directory tree by gigabytes, kilobytes, megabytes, then bytes.
$> du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'
##==========================================
## Convert PNG to GIF
$> for file in *.png; do convert "$file" "$(basename $file .png).gif"; done
##==========================================
## Paste hardware list (hwls) in html format into pastehtml.com directly from console and return URI.
$> listhw () { curl -s -S --data-urlencode "txt=$(sudo lshw -html)" "http://pastehtml.com/upload/create?input_type=html&result=address";echo;}
##==========================================
## Recursive Search and Replace
$> perl -pi -e 's/<what to find>/<what to replace it with>/g' 'grep -Rl <what to find> /<dir>/*'
##==========================================
# Replace spaces in a filename with hyphens
$> rename 's/ /-/g' *
##==========================================
# Console clock
$> watch -t -n1 'date "+%r %F %A"'
##==========================================
# mix video and audio
$> ffmpeg -i video.mp4 -i audio.mp3 -vcodec copy -acodec copy -map 0.0:0 -map 1.0:1mix.mp4
##==========================================
# remove newlines from specific lines in a file using sed
$> sed -i '/pattern/N; s/\n//' filename
##==========================================
## NOT WORKING
## Get sunrise and sunset times
$> l=12765843;curl -s http://weather.yahooapis.com/forecastrss?w=$lgrep astronomyawk -F\" '{print $2 "\n" $4;}'
##==========================================
# Replicate a directory structure dropping the files
$> find . -type d -exec mkdir -p $DESTDIR/{} \;
##==========================================
## Find video encoded with h264
$> find -type f -exec bash -c 'if ffmpeg -i "{}" 2>&1 | grep -qi h264 ; then echo "{}"; fi' \;
##==========================================
## List the number and type of active network connections 
$> netstat -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c
##==========================================
## Gives warning then requires the user to press enter key before executing the command.
$> echo "Your_Warning_Here" ; read -p "Press [enter] to continue..." ; Your_Command_here
$> echo "This will list contents. Press cntl-c to cancel, or" ; read -p "Press [enter] to continue..." ; ls
## Or require any key to be pressed.
$> echo "Your_Warning_Here" ; read -rsn 1 -p "Press any key to continue..." ; Your_Command_here
## If using a pipe | get input
$> read -rsn 1 -p "Press any key to continue..." < /dev/tty
##  Use a Countdown to cancel
$> printf 'WARNING: You are about to do something stupid.\n'
$> printf 'Press a key within 5 seconds to cancel.'
$> if ! read -rsn 1 -t 5
$> then something_stupid
$> fi
##==========================================
## Speed up launch of firefox. Compress information DBs of firefox to speed up the launch of browser.
$> find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
##==========================================
## Perform a branching conditional
$> true && { echo success;} || { echo failed; }
## This will perform one of two blocks of code, depending on the condition of the first. Essentially is a bash terniary operator.
## To tell if a machine is up:
$> ping -c1 machine { echo succes;} || { echo failed; }
## Because of the bash { } block operators, you can have multiple commands
$> ping -c1 machine && { echo success;log-timestamp.sh }|| { echo failed; email-admin.sh; }
##==========================================
## Recover a deleted file
$> grep -a -B 25 -A 100 'some string in the file' /dev/sda1 > results.txt
## grep searches through a file and prints out all the lines that match some pattern. Here, the pattern is some string that is known to be in the deleted file. The more specific this string can be, the better. The file being searched by grep (/dev/sda1) is the partition of the hard drive the deleted file used to reside in. The ?-a? flag tells grep to treat the hard drive partition, which is actually a binary file, as text. Since recovering the entire file would be nice instead of just the lines that are already known, context control is used. The flags ?-B 25 -A 100? tell grep to print out 25 lines before a match and 100 lines after a match. Be conservative with estimates on these numbers to ensure the entire file is included (when in doubt, guess bigger numbers). Excess data is easy to trim out of results, but if you find yourself with a truncated or incomplete file, you need to do this all over again. Finally, the ?> results.txt? instructs the computer to store the output of grep in a file called results.txt.
## Source: http://spin.atomicobject.com/2010/08/18/undelete?utm_source=y-combinator&utm_medium=social-media&utm_campaign=technical
##==========================================
## convert filenames in current directory to lowercase
$> rename 'y/A-Z/a-z/' *
##==========================================
## Cut out a piece of film from a file. Choose an arbitrary length and starting time.
$> ffmpeg -vcodec copy -acodec copy -i orginalfile.mp4 -ss 00:01:30 -t 0:0:20 newfile.mp4
## -vcodec, you choose what video codec the new file should be encoded with. 
## List all available video and audio encoders and file formats.
$> ffmpeg -formats E
## copy, you choose the video encoder that just copies the file.
## -acodec, you choose what audio codec the new file should be encoded with.
## copy, you choose the audio encoder that just copies the file.
## -i originalfile, you provide the filename of the original file to ffmpeg
## -ss 00:01:30, you choose the starting time on the original file in this case 1 min and 30 seconds into the film
## -t 0:0:20, you choose the length of the new film newfile, you choose the name of the file created.
## Here is more information of how to use ffmpeg: http://www.ffmpeg.org/ffmpeg-doc.html
##==========================================
## List all available video and audio encoders and file formats.
$> ffmpeg -formats E
##==========================================
## Generate a 4 random word password, better than one obfuscated word
$> cat /usr/share/dict/words | grep -v "'s" | shuf -n4 | tr -d '\n' && echo
$> echo 'New xkcd Password:' ; cat /usr/share/dict/words | grep -v "'s" | shuf -n4 | tr -d '\n' && echo
$> shuf -n4 /usr/share/dict/words | tr -d '\n'  # This includes possessive nouns
## http://xkcd.com/936/
##==========================================
## Play "foo.mpg" in your terminal using ASCII characters
$> mplayer -vo aa foo.mpg
##==========================================
## Setup, Files, Info, Networking, Text, Multimedia
## Suspend to ram
$> dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend
##==========================================
## Files, Text,
## Comment out all lines in a file beginning with string
$> sed -i 's/^\(somestring\)/#\1/' somefile.cfg
$> | sed 's/^\(somestring\)/#\1/'
##==========================================
## Multimedia
## SoX recording audio and trimming silence. Awesome!!!
$> sox -t alsa default ./recording.flac silence 1 0.1 5% 1 2.0 5%
## Records audio from your mic in FLAC (Free Lossless Audio Codec) format, starts only after it detects at least 0.1 seconds of noise and stops after 2 second of silence. You can adjust the percent values (sensitivity) to best fit your microphone and voice (0.1% if you have a great quality mic, higher if you dont, 0% does not trim anything).
## Useful for speech recognition in conjunction with my previous command titled 'Google voice recognition "API"' (http://www.commandlinefu.com/commands/view/8043/google-voice-recognition-api).
##==========================================
## Multimedia
## Record audio from microphone or sound input from the console
$> sox -t ossdsp -w -s -r 44100 -c 2 /dev/dsp -t raw - | lame -x -m s - File.mp3
##==========================================
## Voice to text. NOT WORKING??? Google Changed Things :(
$> wget -q -U "Mozilla/5.0" --post-file recording.flac --header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium"
## Google voice recognition "API"
## The FLAC audio must be encoded at 16000Hz sampling rate (SoX is your friend).
## Outputs a short JSON string, the actual speech is in the hypotheses->utterance, the accuracy is stored in hypotheses->confidence (ranging from 0 to 1).
##==========================================
## Files, Text,
## Recurse and print matching lines (GNU grep):
$> grep -r -- "$search" . 
##==========================================
## Networking,
## Single use vnc-over-ssh connection
$> ssh -f -L 5900:localhost:5900 user@your.ssh.server "x11vnc -safer -localhost -nopw -once -display :0"; vinagre localhost:5900
## SSH into a machine
## Tunnels VNC port to your local computer ("-L 5900:localhost:5900")
## Runs a single use vnc server ("x11vnc -safer -localhost -nopw -once -display :0")
## Goes into the background ("-f")
## Runs VNC viewer on the local computer connecting to the remote machine via the newly created SSH tunnel ("vinagre localhost:5900")
## Sometimes need to run 'ssh -f -L 5900:localhost:5900 user@your.ssh.server "x11vnc -safer -localhost -nopw -once -display :0"; vinagre localhost:5900' as is without putting in the host name.
##==========================================
## Info,
## Limit the cpu usage of a process
$> sudo cpulimit -p pid -l 50
## This will limit the average amount of CPU it consumes.
##==========================================
## Single Line Twitter-Tracker
$> WRDS="word1 word2 wordN"; while [ 1 ];do curl -s http://twitter.com/statuses/public_timeline.rss grep '<description>' cut -d '>' -f 2 cut -d '<' -f 1 > .twitt.tmp && for word in $WRDS;do grep --color=auto -i $word .twtt.tmp;done;sleep 300;done
## Ssh functions			
#$> function slak()
#$> {
#$>     if [ $# -lt 2 ]; then
#$>         echo "add public key to securelink server"
#$>         echo "usage: skak [accountname] [sl port]"
#$>     else
#$>         cat /Volumes/Library/ssh/id_rsa-$1.pub | ssh -q lila@localhost -p $2 "if [ ! -d ~/.ssh/ ] ; then mkdir ~/.ssh ; fi ; chmod 700 ~/.ssh/ ; cat - >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys"
#$>     fi
#$> }
#$> 
#$> function slssh()
#$> {
#$>     if [ $# -lt 1 ]; then
#$>         echo "connect to securelink ssh session"
#$>         echo "usage slssh [port#]"
#$>         echo "ssh -p \$1 localhost"
#$>     else
#$>         ssh -p $1 localhost
#$>     fi
#$> }
#$> 
#$> function slpg()
#$> {
#$>     if [ $# -lt 1 ]; then
#$>         echo "create securelink ssh tunnel for postgres"
#$>         echo "usage: slpg [port#]"
#$>         echo "ssh -N localhost -L 2345/localhost/5432 -p \$1"
#$>     else
#$>         ssh -N localhost -L 2345/localhost/5432 -p $1
#$>     fi
#$> }
#$> 
#$> function sshmysql()
#$> {
#$> # bind MySQL hostport to forward remote MySQL connection to localhost
#$> ssh -L 13306:127.0.0.1:3306 -N $* &
#$> }
#$> 
#$> function sshpg()
#$> {
#$>     if [ $# -lt 1 ]; then
#$>         echo "create ssh tunnel for postgres"
#$>         echo "usage: sshpg username@server"
#$>         echo "ssh -N \$1 -L 2345/localhost/5432"
#$>     else
#$>         ssh -N $1 -L 2345/localhost/5432
#$>     fi
#$> }
#$> 
#$> function sshpg2()
#$> {
#$>     if [ $# -lt 1 ]; then
#$>         echo "create ssh tunnel for postgres"
#$>         echo "usage: sshpg username@server"
#$>         echo "ssh -N \$1 -L \$2/localhost/5432"
#$>     else
#$>         ssh -N $1 -L $2/localhost/5432
#$>     fi
#$> }
##==========================================
##################################################
# Spellchecking					 #
##################################################
###### I-Spell @ work: ENGLISH
# requires ispell: sudo apt-get install ispell
#$> function spell()
#$> {
#$>     local CHATTO
#$>     if [ $# -ne 1 ]; then
#$>         echo -e "\033[1;32mUSAGE: \033[33mis word_to_check\033[0m"
#$>     else
#$>         CHATTO=$( echo $* | awk '{print $1}' )
#$>         shift
#$>         echo -e "----------------------------------------------------->\n"
#$>         echo $CHATTO | ispell -a -m -B |grep -v "@"
#$>         echo -e "----------------------------------------------------->"
#$>     fi
#$> }
###### Google spell checker
$> function spellcheck() { typeset y=$@;curl -sd "<spellrequest><text>$y</text></spellrequest>" https://www.google.com/tbproxy/spell|sed -n '/s="[0-9]"/{s/<[^>]*>/ /g;s/\t/ /g;s/ *\(.*\)/Suggestions: \1\n/g;p}'|tee >(grep -Eq '.*'||echo -e "OK");}
###### spell checks either a Web page URL or a file
# requires ispell: sudo apt-get install ispell
#$> function webspell()
#$> {
#$> okaywords="$HOME/.okaywords"
#$> tempout="/tmp/webspell.$$"
#$> trap "/bin/rm -f $tempout" 0
#$> if [ $# -eq 0 ] ; then
#$>   echo "Usage: webspell file|URL" >&2;
#$> fi
#$> for filename
#$> do
#$>   if [ ! -f "$filename" -a "$(echo $filename|cut -c1-7)" != "http://" ] ; then
#$>      continue;      # picked up directory in '*' listing
#$>   fi
#$>   lynx -dump $filename | tr ' ' '\n' | sort -u | \
#$>     grep -vE "(^[^a-z]|')" | \
#$>     # adjust the following line to produce just a list of misspelled words
#$>     ispell -a | awk '/^\&/ { print $2 }' | \
#$>     sort -u > $tempout
#$>   if [ -r $okaywords ] ; then
#$>     # if you have an okaywords file, screen okay words out
#$>     grep -vif $okaywords < $tempout > ${tempout}.2
#$>     mv ${tempout}.2 $tempout
#$>   fi
#$>   if [ -s $tempout ] ; then
#$>     echo "Probable spelling errors: ${filename}"
#$>     echo '-------' ; cat $tempout ; echo '========='
#$>     cat $tempout | paste - - - -  | sed 's/^/  /'
#$>   fi
#$> done
#$> }
##==========================================
##==========================================
## Files, Networking,
## ix, command line patebin
## Examples:
##     ix hello.txt              # paste file (name/ext will be set).
##     echo Hello world. | ix    # read from STDIN (won't set name/ext).t
##     ix -n 1 self_destruct.txt # paste will be deleted after one read.
##     ix -i ID hello.txt        # replace ID, if you have permission.
##     ix -d ID
$> ix() { local opts; local OPTIND; [ -f "$HOME/.netrc" ] && opts='-n'; while getopts ":hd:i:n:" x; do case $x in h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;; d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;; i) opts="$opts -X PUT"; local id="$OPTARG";; n) opts="$opts -F read:1=$OPTARG";; esac; done; shift $(($OPTIND - 1)); [ -t 0 ] && { local filename="$1"; shift; [ "$filename" ] && { curl $opts -F f:1=@"$filename" $* ix.io/$id; return; } ; echo "^C to cancel, ^D to send."; } ; curl $opts -F f:1='<-' $* ix.io/$id; }
##==========================================
## Files, Networking,
## sprunge(1)
## NAME
##     sprunge: command line pastebin.
## SYNOPSIS
##     <command> | curl -F 'sprunge=<-' http://sprunge.us
## DESCRIPTION
##     add ?<lang> to resulting url for line numbers and syntax highlighting
##     use this form to paste from a browser
## EXAMPLES
##     ~$ cat bin/ching | curl -F 'sprunge=<-' http://sprunge.us
##        http://sprunge.us/aXZI
##     ~$ firefox http://sprunge.us/aXZI?py#n-7
## SEE ALSO
##     http://github.com/rupa/sprunge
## Posts a file to sprunge.us and copies the related url to the clipboard
$> function sprunge() { curl -s -F "sprunge=@$1" http://sprunge.us | xclip -selection clipboard && xclip -selection clipboard -o; }
##==========================================
## Files, Text,
## Create simple text file from command line or script (EOF is just a token, can be any word)
#$> cat > file.txt << EOF
$> {your text here}
$> {your text here}
$> EOF
##==========================================
## Files, Networking, 
## Share a file between two computers
## receiver 
$> nc -l 5566 > data-dump.sql
## sender   
$> nc <receiver-ip-address> 5566 < data-dump.sql
##------------------------------------------
## Share a BIG file between two computers and show progress bar
## receiver 
$> nc -l 5566 > big-file.iso
## sender   
$> pv big-file.iso | nc <receiver-ip-address> 5566
##------------------------------------------
## Transfer a folder between two computers
## receiver 
$> nc -l 5566 | tar -zxv
## sender   
$> tar -zcv <folder> | nc -w1 <receiver-ip-address> 5566
##==========================================
## Files, Info, Networking,
## Compare a remote file with a local file
$> ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
##==========================================
## Files, Info,
## Check which process is modifying a certain directory or file
$> auditctl -w /path/to/directory -p war
### see results with:
$> ausearch -f /path/to/directory
##==========================================
##------------------------------------------
#< Files, Info, Networking, Text, Multimedia
##------------------------------------------
##==========================================
## Networking,
## Internet Relay Chat irc
$> sudo apt-get install ircii
## Nickname
##>  /nick
## Add server
## List Channels
##>   /list
## Join Channel
##>   /join #channelname
##>   /j
## Private convo
##>   /msg
##>   /m
##------------------------------------------
##==========================================
#< Networking,
## Displays the quantity of connections to port 80 on a per IP basis
$> clear;while x=0; do clear;date;echo "";echo "  [Count] | [IP ADDR]";echo "-------------------";netstat -np|grep :80|grep -v LISTEN|awk '{print $5}'|cut -d: -f1|uniq -c; sleep 5;done
## Uses an infinite loop to display output from netstat, reformatted with grep, awk, and cut piped into uniq to provide the count. Complete with a pretty header. Polls every 5 seconds
##==========================================
#< Files, Info, Text,
## Show 10 Largest Open Files
$> lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB" " " $9 " " $1 }' | sort -n -u | tail
## Show the largest 10 currently open files, the size of those files in Megabytes, and the name of the process holding the file open.
##==========================================
## Ban all IPs that attempted to access phpmyadmin on your site
$> grep "phpmyadmin" $path_to_access.log | grep -Po "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" | sort | uniq | xargs -I% sudo iptables -A INPUT -s % -j DROP
##==========================================
## Create a thumbnail from the first page of a PDF file
$>  convert -thumbnail x80 file.pdf[0] thumb.png
## thumbnail x80 means create a thumbnail image of height 80 pixels, the width will be automatically chosen to make the image proportional. The [0] is to create a thumbnail for the first page only, without that a thumbnail image would be created for each page in the pdf file
## or all PDF files in a directory tree:
$> find /path/to/dir -name '*.pdf' -exec convert -thumbnail x80 {}[0] {}-thumb.png \;
##==========================================
## Send an http POST to a website with a file input field
$> curl -L -v -F "value=@myfile" "http://domain.tld/whatever.php"
##==========================================
## Convert all flac files in dir to mp3 320kbps using ffmpeg
$> for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done;
##==========================================
## Open Windows internet shortcut (*.url) files in firefox
$> grep -i url='*' file.url | cut -b 5- | xargs firefox
##==========================================
## Remove all at jobs
$> atq | sed 's_\([0-9]\{1,8\}\).*_\1_g' | xargs atrm
##==========================================
## Random text generator
$> tr -dc a-z1-4 </dev/urandom | tr 1-2 ' \n' | awk 'length==0 || length>50' | tr 3-4 ' ' | sed 's/^ *//' | cat -s | fmt
##==========================================
## Download a file from a webserver with telnet
$> (echo 'GET /'; echo; sleep 1; ) | telnet www.google.com 80
##==========================================
##Create a transparent image of given dimensions
$> convert -size 100x100 xc:none transparency.png
##==========================================
## Insert lines from one text file to another one
$>  $ awk 'NR % 10 == 1 {getline f2 < "file1"; print f2} 1' file2 | cat -n
##==========================================
## Get streamed FLV from Chrome with lsof
$> export psid=$(pgrep -f libflashplayer.so); cp /proc/$psid/fd/$(lsof -p $psid | grep eleted | awk {' print $4 '} | sed -e "s/[a-z]//g") saved.flv
## first get the process id of the chome browser process which runs the flashplayer export it to a variable to be used later. Then we get in subshell the filedescriptor which is marked deleted and construct the /proc path for the in memory fileimage and copy it to the file named saved.flv
##==========================================
## Rename all files in a directory to upper case
$> for i in *; do mv "$i" "${i^^}"; done
## Rename all items in a directory to lower case
$> for i in *; do mv "$i" "${i,,}"; done
## or
$> paste <(ls) <(ls | tr A-Z a-z) | while read OLD NEW; do echo mv -v $OLD $NEW; done
##==========================================
## Remove EXIF data such as orientation from images
$> convert -strip orig.jpg stripped.jpg
## or
$> mogrify -strip /path/to/image.jpg
##==========================================
## Recording SSH sessions
$> ssh -l USER HOST | tee -a /path/to/file
## The -a option appends the output to the end of file instead of writing over it.
## You can also create an alias in ~/.bashrc to record your session when using ssh:
$> function sshlog () { \ssh $@ 2>&1 | tee -a $(date +%Y%m%d).log; }
$> alias ssh=sshlog
##==========================================
## Clear the swap space forcing everything back to main memory in Linux
$> sudo swapoff -a; sudo swapon -a
##==========================================
## Redirection operator to override the noclobber option
$> some_command >| output.txt
## Normally the > operator overwrites the target file.
## If the noclobber option is set (using: set -o noclobber), the > operator will fail if the target file exists.
## The >| overrides the noclobber setting and overwrites the target file.
## If the noclobber option is not set, then >| is equivalent to >, naturally.
##==========================================
## Convert a list of terms in slug format to capitalized words
$> sed -e 's/^./\U&/' -e 's/_./\U&/g' -e 's/_/ /g' /path/to/input
## The goal here is to take an input like this:
## police_station
## post_office
## real_estate_agency
## ... and convert it to an output like this:
## Police Station
## Post Office
## Real Estate Agency
##     -e ... the sed command can take several -e parameters, which will be executed one by one when processing each line in the input
##     The s/// command is a pattern replacement, and has the general format s/pattern/replacement/flags
##     s/^./\U&/ - replace the first letter of the line with uppercase version of the letter: \U means convert to uppercase, & is the matched string
##     s/_/ /g - replace all underscores with spaces
##     Input to sed can come from a list of files, or input redirection with <, or from a pipe.
##------------------------------------------
##  Convert line to no spaces line with first letter capital
##  Convert "this is a sentence to work with" to "ThisIsASentenceToWorkWith"
$> | sed -e 's/^./\U&/' -e 's/ ./\U&/g'  -e 's/ //g'
##==========================================
## Create or mount an encrypted directory using encfs
$> encfs -i 5 $PWD/raw $PWD/content
## The first time you run this, it will create an encrypted directory raw in the current working directory, and mount it on directory content in the same directory. It will ask a couple of questions:
#> Create directory "raw" ? -- answer "y"
#> Create directory "content" ? -- answer "y"
#> Choose configuration mode -- press enter, or "p" for paranoia mode
## The content directory will be visible and editable only by your user, and all the files you put inside will be saved encrypted under raw. The encrypted data is only visible when raw is mounted somewhere.
## The -i 5 means the content directory will be automatically unmounted after being idle for 5 minutes.
## You can manually unmount with umount ./content in Linux, and fusermount -u ./content in Mac OS.
## To mount raw again, simply re-run the same command. This time it will only ask for the password.
## encfs is not a standard command/package. Major Linux distros have it in their repos, on Mac OS you can install using ports. (sudo port install encfs)
##==========================================
## Expire a users password immediately
$> chage -d 0 USERNAME
##==========================================
## Resize an image proportionally to some specified width or height. 31x 
$> convert -geometry x400 path/to/image.gif
## Replace image
$> mogrify -geometry x400 path/to/image.gif
##==========================================
## Find the target path a symlink is pointing to
$> readlink a_symbolic_link_to_somewhere
##==========================================
Read the first line from a file and put it in a variable
$>  read -r line < file
##==========================================
## Double-space a file.
$> awk '1; { print "" }'
##------------------------------------------
## Another way to double-space a file.
$> awk 'BEGIN { ORS="\n\n" }; 1'
##------------------------------------------
## Double-space a file so that no more than one blank line appears between lines of text.
$> awk 'NF { print $0 "\n" }'
##------------------------------------------
## Number only non-blank lines in files.
$> awk 'NF { $0=++a " :" $0 }; { print }'
##------------------------------------------

##------------------------------------------

##------------------------------------------

##------------------------------------------

##------------------------------------------

##------------------------------------------

##==========================================
## Search through .doc files
$> function docsearch() { find -name '*.doc' | while read -r file; do catdoc "$file" | grep -l --label="$file" "$1"; done ; }
## or ?
$> function docsearch() { find -name \*.doc -exec sh -c "catdoc '{}' | grep -q '$1' && echo {}" \; }
##==========================================
##==========================================
## Search through .doc and .docx files
#!/bin/bash
$> echo -e "\n"
## Welcome to scandocs. This will search .doc AND .docx files in this directory for a given string. \n
## Type in the text string you want to find... \n
## read response
$> find . -name "*.doc" | 
$> while read i; do catdoc "$i" | 
$> grep --color=auto -iH --label="$i" "$response"; done
$> find . -name "*.docx" | 
$> while read i; do docx2txt < "$i" | 
$> grep --color=auto -iH --label="$i" "$response"; done
##------------------------------------------
$> find -name '*.doc' | while read -r file; do unoconv --format html "$file" | grep -l --label="$file" 
##==========================================
## modified to get rid of autogenerated subs (who the hell needs them, unnecessary clutter) + formatted to get the highest quality MP4 video every time. plug the link to the channel you want to download in on the end and away you go
$> youtube-dl -f 43 -i https://www.youtube.com/user/MillennialWoes/videos
##------------------------------------------
$> youtube-dl --no-check-certificate --all-subs --no-mtime --no-overwrite --download-archive .archive --write-description --write-info-json --write-annotations --write-thumbnail --write-all-thumbnails --write-sub -f bestvideo[ext=mp4]+22,bestvideo[ext=mp4]+140 -o "%(upload_date)s - %(title)s [%(id)s].%(ext)s" https://www.youtube.com/user/MillionDollarExtreme
##==========================================
## Change owner of file moved to your home folder.
$> alias chownhome='sudo chown -R $USER:$USER ~/'
##==========================================
## Get a qrcode for a given string 
$> echo "YourStringHere" | curl -F-=\<- qrenco.de
$> function qrcode() { echo "$1" | curl -F-=\<- qrenco.de ; }
##==========================================
## Bash scripts encryption and passphrase-protection
## This function will encrypt a bash script and will only execute it after providing the passphrase. Requires mcrypt to be installed on the system.
$>  scrypt(){ [ -n "$1" ]&&{ echo '. <(echo "$(tail -n+2 $0|base64 -d|mcrypt -dq)"); exit;'>$1.scrypt;cat $1|mcrypt|base64 >>$1.scrypt;chmod +x $1.scrypt;};}
$> cat hello
#!/bin/bash
#> case "$1" in
#> ""|-h) echo "This is the fantastic Hello World. Try this:" $(basename $0) "[entity]" ;;
#> moon) echo Good night. ;;
#> sun) echo Good morning. ;;
#> world) echo "Hello, world!" ;;
#> *) echo Hi, $@. ;;
#> esac
$> scrypt hello
#> Enter the passphrase (maximum of 512 characters)
#> Please use a combination of upper and lower case letters and numbers.
#> Enter passphrase:
#> Enter passphrase:
#> Stdin was encrypted.
$> cat hello.scrypt
#> . <(echo "$(/usr/bin/tail -n+2 $0|base64 -d|mcrypt -dq)");exit;
#> AG0DQHJpam5kYWVsLTEyOAAgAGNiYwBtY3J5cHQtc2hhMQAV34412aaE8sRzQPQzi09YaNQPedBzaGExAARvB6A/HYValW4txoCFmrlp57lmvhKBbM4p+OUiZcCxr6Y+Mm7ogg3Y14pHi0CrfT70Tubq9g8/kNJrQr7W/ogHpVuOOdD0YfuRatrV7W2+OlNQ63KX780g4qTHrTqNnyLp8sF5RQ7GwxyZ0OtikROtVIU4g4+QAtn/k/e7h7yt4404VF1zzCYRSw20wmJz1o/Z0XO7E/DFBr5Bau7bWjnF7CRVtimsHGrDwv1miTtAcyB9PknymDxhSyjDUdNhqXGBIioUgqjX1CKgedtO0hQp050MiQd3I6HacpSrVUIWkuuS+BtMrxHDy+48Mh1hidV5JQFP7LP5k+yAVLpeHd2m2eIT1rjVE/Bp2cQVkpODzXcWQDUAswUdvulvj/kWDQ==
$> ./hello
#> This is the fantastic Hello World. Try this: hello [entity]
$> ./hello.scrypt
#> Enter passphrase:
#> This is the fantastic Hello World. Try this: hello.scrypt [entity]
$> ./hello world
#> Hello, world!
$> ./hello.scrypt world
#> Enter passphrase:
#> Hello, world!
##==========================================
## Remove old kernels 
$> dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p' | xargs sudo apt-get -y purge
##==========================================
## Update twitter via curl 
$> curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
##==========================================
## Convert MP3s & an image to MP4 videos using ffmpeg
$> for name in *.mp3; do ffmpeg -loop 1 -i imagename.jpg -i "$name" -shortest -c:v libx264 -preset ultrafast -c:a copy "${name%.*}.mp4"; done
##==========================================
## Calculates the number of physical cores considering HyperThreading in AWK
## Check whether hyperthreading is enabled or not. a better solution as nproc should work on all OS with awk Show Sample Output
$> awk -F: '/^core id/ && !P[$2] { CORES++; P[$2]=1 }; /^physical id/ && !N[$2] { CPUs++; N[$2]=1 }; END { print CPUs*CORES }' /proc/cpuinfo
##==========================================
## Determines latest pdf file in ~/Downloads directory
$> ls -tr ~/Downloads/*.pdf|tail -1
##==========================================
## find with high precission (nanoseconds 1/1,000,000,000s) the last changed file.
## this is good for variables if you have many script created files and if you want to know which one is the last created/changed one..
$> find . -type f -print0 | xargs -0 stat -c '%y %n' | sort -n -k 1,1 -k 2,1 | awk 'END{print $NF}'
##==========================================
## Lower jpg quality
$> find -type f -name '*.jpg' -exec mogrify -quality 70% '{}' \;
##==========================================
## Using graphicsmagick, over an image transform the white color to transparent background
$> gm convert source.png -transparent white result.png
##==========================================
## Convert CMYK PSD (Photoshop) file to RGBA
## In case you have a PSD file with CMYK attribute and you need a working image
$> convert <input.psd> -channel RGBA -alpha Set -colorspace rgb <output.png>
##==========================================
## List available upgrades from apt without upgrading the system
$> apt list --upgradable
##==========================================
## Open any file or directory from shell as if clicking double click by mouse
## This command will take an action on the file same as the action gnome was to take.. for example doing this to a jpg file will open the image in image viewer , doing this to a pdf file will open the file in document viewer... it can be used to open a directory as nautilus will do... you might need to add this to an alias since you may use it alot, such as : alias o='gvfs-open'
$> gvfs-open FILE.Ext
##==========================================
## Directory listing and serve folder on port 8000
## Create an index.html containing links of the current folder and serve on the local network Show Sample Output
$> tree -H '.' -L 1 > index.html && php -S `hostname -I | cut -d' ' -`:8000
##==========================================
## Sort subdirectories by size
$> du -h --max-depth=1 | sort -hr
##==========================================
## To rotate all PDF pages clockwise:
$> pdftk in.pdf cat 1-endeast output out.pdf
##==========================================
## Set all CPU cores CPU frequency scaling governor to maximum performance
$> echo performance |sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
##==========================================
## sed replace in all files of directory
$> find ./ -type f -exec sed -i -e 's/apple/orange/g' {} \;
##==========================================
## Have a youtube account? Want to upload random noise to youtube to waste their disk space?
## Example: https://www.youtube.com/watch?v=nFwciRbwNxw [Embed]
## Save this post as `Dockerfile`, then run `docker build -t youtubewaster FOLDER_OF_DOCKERFILE`, then run `docker run --rm youtubewaster YOUR_YOUTUBE_STREAM_KEY`
$> FROM alpine
$> RUN apk add --no-cache bash ffmpeg openssl
$> RUN echo '#!/bin/bash' > /bin/stream.bash && \
$> echo 'if [ $# -ne 1 ]; then echo provide your youtube stream key; exit 1; fi' >> /bin/stream.bash && \
$> echo 'openssl enc -aes-128-ctr -pass file:<(dd if=/dev/urandom bs=128 count=1 2>/dev/null |base64) -nosalt </dev/zero |ffmpeg -vcodec rawvideo -f rawvideo -pixel_format 0rgb -r 30 -s 256x144 -i - -f lavfi -i anullsrc -flags +global_header -vcodec h264 -pix_fmt yuv420p -profile:v baseline -r 30 -qscale 3 -g 25 -vb 2500k -acodec mp3 -f flv "rtmp://a.rtmp.youtube.com/live2/$1"' >> /bin/stream.bash && \
$> chmod +x /bin/stream.bash
$> ENTRYPOINT ["/bin/stream.bash"]
##==========================================
## How to use netcat
## Before starting to explore some netcat commands its important to know that if you are binding to well-known ports (0-1023) with nc, you need root privilege. Otherwise, you can run nc as a normal user.
## 1. Test if a particular TCP port of a remote host is open
$> nc -vn 192.168.40.146 2424
## Output if the 2424 port on remote server is closed
#$> nc: connect to 192.168.40.146 port 2424 (tcp) failed: Connection refused
## Output if the port on remote server is opened (e.g. 22 port)
#$> Connection to 192.168.40.146 22 port [tcp/*] succeeded!
## SSH-2.0-OpenSSH_7.6p1 Ubuntu-4
##------------------------------------------
## 2. Perform TCP port scanning against a remote host
## The command below will check the ports from 20 to 25 on the remote host and print the result.
$> nc -vnz -w 1 192.168.40.146 20-25
## Output will look like this
## nc: connect to 192.168.40.146 port 20 (tcp) failed: Connection refused
## nc: connect to 192.168.40.146 port 21 (tcp) failed: Connection refused
## Connection to 192.168.40.146 22 port [tcp/*] succeeded!
## nc: connect to 192.168.40.146 port 23 (tcp) failed: Connection refused
## nc: connect to 192.168.40.146 port 24 (tcp) failed: Connection refused
## nc: connect to 192.168.40.146 port 25 (tcp) failed: Connection refused
##------------------------------------------
## 3. Perform UDP port scanning against a remote host
$> nc -vnzu 192.168.40.146 1-65535
## Output will show only the ports which allow udp connections.
## Connection to 192.168.40.146 2424 port [udp/*] succeeded!
## Connection to 192.168.40.146 12354 port [udp/*] succeeded!
##------------------------------------------
## 4. Send a test UDP packet to a remote host
$> echo -n "udp test" | nc -u -w1 192.168.40.146 2424
## The command above will send a test UDP packet with 1 second timeout to a remote host at port 2424
##------------------------------------------
## 5. Copy a file (e.g., test.txt) from one host to another
## On the receiver host (192.168.40.146 in my case) run:
$> nc -lp 2424 > test.txt
## On the sender host (192.168.40.144) run the following command:
$> nc 192.168.40.146 2424 < test.txt
## This will copy test.txt file from sender host to receiver host via 2424 port. make sure to allow incoming connections on 2424 port on the receiver host.
##------------------------------------------
## 6. Transfer a whole directory (including its content) from one host to another
## On the receiver host run:
$> nc -l 2424 | tar xvf -
## On the sender host run the following command:
$> tar cvf - /path/to/dir | nc 192.168.40.146 2424
##------------------------------------------
## 7. Create a compressed backup of hard drive (e.g., /dev/sdc) on a remote host
## On the remote host run:
$> nc -lp 2424 | sudo dd of=/path/to/image.img.gz
## On the local host run the following command:
$> dd if=/dev/sdc | gzip -c | nc 192.168.40.146 2424
##------------------------------------------
## 8. Restore a hard drive (e.g. /dev/sdc) from a compressed disk image stored in a remote host
## On the local host run:
$> nc -lp 2424 | gunzip -c | sudo dd of=/dev/sdc
## On the remote host run the following command:
$> cat /path/to/image.img.gz | nc 192.168.40.144 2424
##------------------------------------------
## 9. Run insecure online chat between two hosts
## On one host (e.g. 192.168.40.144) run the command below:
$> nc -lp 2424
## On another host (e.g. 192.168.40.146) run the following command:
$> nc 192.168.40.144 2424
## After running these commands, anything typed in both terminals will be seen on both host machines.
##------------------------------------------
## 10. Run a web server with a static web page
## Run the command below on local host (e.g. 192.168.40.144) to start a web server that serves test.html on port 80. Note that you must run with sudo privileges as 80 is in range of well known ports (1-1023)
$> while true; do sudo nc -lp 80 < test.html; done
## Now open http://192.168.40.144/test.html from another host to access it.
##------------------------------------------
## 11. Listen on a TCP port using IPv6 address
## You can use the following command to allow nc use IPv6 address when listening on a TCP port.
$> nc -6 -l 2424
## Check if it works with the command below
$> sudo netstat -nap | grep 2424
## Output will look like this
$> tcp6 0 0 :::2424 :::* LISTEN 15665/nc
##------------------------------------------
## 12. Stream a video file from a server for client to watch the streamed video using video player (e.g., mplayer)
## On a video server (192.168.40.144)
$> cat sample_video.avi | nc -l 2424
## On a client host (192.168.40.146):
$> nc 192.168.40.144 2424 | mplayer -vo x11 -cache 3000 -
##==========================================
## To ssh to the server myserver:
$> alias myserver="ssh user@my_server_ip"
##==========================================
## Batch resize images in folder
$> for file in *.jpg; do convert $file -resize 600 sm-$file; done
##==========================================
## Convert hex data to binary with a bash function (requires bash v4+ for the @^^ lowercase hex demangling)
## Use this function with bash version 4+ to convert arbitrary hexadecimal sequences to binary. If you dont have bash 4+ then modify the lowercase to uppercase demangling statement s=${@^^} to set s equal to the uppercase hex input or the bc command throws an input parser error. Show Sample Output
$> hex2bin () { s=${@^^}; for i in $(seq 0 1 $((${#s}-1))); do printf "%04s" `printf "ibase=16; obase=2; ${s:$i:1};\n" | bc` ; done; printf "\n"; }
##==========================================
## Disable suspend on lid close until current shell exits
## Useful for running long commands with the laptop lid closed and screen off. Also see Gnome extension Caffeine. https://extensions.gnome.org/extension/517/caffeine/
$> exec systemd-inhibit --what=handle-lid-switch --mode=block bash
##==========================================
## function to compute what percentage of X is Y? Where percent/100 = X/Y => percent=100*X/Y
## This function make it easy to compute X/Y as a percentage. The name "wpoxiy" is an acronym of "what percentage of X is Y" Show Sample Output
$> function wpoxiy () { echo $(bc <<< "scale=2; y=${1}; x=${2}; percent=x*100/y; percent")"%"; }
##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================


##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================

##==========================================












