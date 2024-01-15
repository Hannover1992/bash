#!/bin/bash
# _              
#| | _____ _   _ 
#| |/ / _ \ | | |
#|   <  __/ |_| |
#|_|\_\___|\__, |
#          |___/ 
#

source /home/uczen/bash/keys.sh



#!/bin/bash
# source /home/uczen/bash/bashrc.sh
# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export SHELL=/bin/bash
export TERM=xterm
export TERM=xterm
export PATH="$HOME/bin:$PATH"

function get_hostname {
  export SHORTNAME=${HOSTNAME%%.*}
}

function git_branch() { 
  gitbranch=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'); 
}

function user_color {
  id | grep "root" > /dev/null
  RETVAL=$?
  if [[ $RETVAL == 0 ]]; then
    usercolor="[0;31m";
  else
    usercolor="[0;32m";
  fi
}

function settitle() {
  u=${USERNAME}
  h="$u@${HOSTNAME}"
  echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
#eval `dircolors ~/.dir_colors`

# Set prompt and window title
inputcolor='[0;37m'
cwdcolor='[0;34m'
host_name='[1;31m'
branchcolor='[0;36m'
user_color
PROMPT_COMMAND='settitle; git_branch; get_hostname; history -a;'
PS1='\n\[\e${cwdcolor}\][${PWD}]\[\e${branchcolor}\]${gitbranch}\n\[\e${usercolor}\][\u]\[\e${host_name}\][${SHORTNAME}]\[\e${inputcolor}\] $ '
export PS1

# Aliases
alias ls='ls -l --color'
alias grep='grep -n --color'

alias vim='/opt/neovim/bin/nvim'
alias tor='/opt/tor-browser/start-tor-browser.desktop'

export EDITOR='/opt/neovim/bin/nvim'


monitor_2k(){
xrandr --output HDMI-1-0 --mode 2560x1440 --primary --output eDP-1 --mode 1920x1080 --left-of HDMI-1-0
}


monitor_4k(){
	xrandr --output eDP-1 --mode 1920x1080 --primary --output HDMI-1-0 --mode 3840x2160 --rate 60 --right-of eDP-1
}

2_mon(){
	xrandr --output eDP-1 --mode 1920x1080 --primary --output HDMI-1-0 --mode 2048x1080 --right-of eDP-1
}

1k(){
	xrandr --output eDP-1 --mode 1920x1080
	xrandr --output HDMI-1-0 --off
}




alias cli="xclip -sel cli"



pic() {
    if [ -z "$1" ]
    then
        scrot -s ./Screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png
    else
        scrot -s ./"$1".png
    fi
    convert $filepath ${filepath%.png}.jpg
}


#setxkbmap -option ctrl:swapcaps
# xmodmap -e "keycode 121 = Up"
# xmodmap -e "keycode 171 = Down"
# xmodmap -e "keycode 122 = Right"
# xmodmap -e "keycode 172 = Left"




#alias pycharm="sh /opt/pycharm-2023.1.1/bin/pycharm.sh" 
#alias clion="sh /opt/clion-*/bin/clion.sh"
#alias sony="/usr/local/bin/sony.sh"
#alias tor="/opt/tor-browser/Browser/start-tor-browser"
#

#solarized
#eval `dircolors /home/uczen/.dir_colors/dircolors`
#export TERM=xterm-256color
#export TERMINFO=/usr/share/terminfo





                      


#
#       _           
#__   _(_)_ __ ___  
#\ \ / / | '_ ` _ \ 
# \ V /| | | | | | |
#  \_/ |_|_| |_| |_|
#                   

set relativenumber
set number



#export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
#export TERM=screen-256color       # for a tmux -2 session (also for screen)
#export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session
#
#
wall(){
	xwinwrap -b -fs -sp -nf -ov -- mpv -wid WID --loop=inf --no-audio --no-osc --no-osd-bar --panscan=1.0 --no-input-default-bindings --input-conf=/dev/null --title="xwinwrapbg" /home/uczen/.wallpaper/master.mp4 -quiet --no-stop-screensaver --no-border --geometry=1920x1080+0+0 --autofit=1920x1080 --fullscreen
}

wall_4k(){
    xwinwrap -b -fs -sp -nf -ov -- mpv -wid WID --loop=inf --no-audio --no-osc --no-osd-bar --panscan=1.0 --no-input-default-bindings --input-conf=/dev/null --title="xwinwrapbg" /home/uczen/.wallpaper/master2.mp4 -quiet --no-stop-screensaver --no-border --geometry=3840x2160+1920+0 # Setting wallpaper for the 1080p monitor
    # xwinwrap -b -fs -sp -nf -ov -- mpv -wid WID --loop=inf --no-audio --no-osc --no-osd-bar --panscan=1.0 --no-input-default-bindings --input-conf=/dev/null --title="xwinwrapbg" /home/uczen/.wallpaper/master2.mp4 -quiet --no-stop-screensaver --no-border --geometry=3840x2160+1920+0 --autofit=3840x2160 --fullscreen # Setting wallpaper for the 1080p monitor

}


wall(){
    xwinwrap -b -fs -sp -nf -ov -- mpv -wid WID --loop=inf --no-audio --no-osc --no-osd-bar --panscan=1.0 --no-input-default-bindings --input-conf=/dev/null --title="xwinwrapbg" /home/uczen/.wallpaper/master.mp4 -quiet --no-stop-screensaver --no-border --geometry=1920x1080+0+0 --autofit=1920x1080 --fullscreen
}

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
#
export TERM=st-256color

alias rcat='find . -type f -exec sh -c "cat {} | tee -a output.txt" \;'


source filename.sh


# Load Angular CLI autocompletion.
#source <(ng completion script)



export PATH=$PATH:/opt/Discord




alias r="ranger"
alias d="mkdir"



##export programme
#export PATH=/opt/pycharm-*/bin:$PATH
#
###systemC installation
#export CXX=g++
#export SYSTEMC_HOME=/opt/systemc-2.3.4/
#export LD_LIBRARY_PATH=/opt/systemc-2.3.4/lib-linux64:$LD_LIBRARY_PATH
###ams
##SYSTEMC_AMS_HOME=/usr/local/systemc-ams-2.3
#export SYSTEMC_AMS_HOME=/usr/local/systemc-ams-2.3
#export LD_LIBRARY_PATH=${SYSTEMC_AMS_HOME}/lib-linux64:${LD_LIBRARY_PATH}
#

# export PKG_CONFIG_PATH=/opt/SystemC/systemc-2.3.4/lib-linux64/pkgconfig/
# export LD_LIBRARY_PATH=/opt/SystemC/systemc-2.3.4/lib-linux64:$LD_LIBRARY_PATH
# export SYSTEMC_HOME=/opt/SystemC/systemc-2.3.4/


# SystemC environment variables
export SYSTEMC_HOME=/opt/SystemC/systemc-2.3.4
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SYSTEMC_HOME/lib-linux64

# SystemC-AMS environment variables
export SYSTEMC_AMS_HOME=/opt/SystemC/systemc-ams-2.3.4
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SYSTEMC_AMS_HOME/lib-linux64
#
#
# export SYSTEMC_AMS_HOME=/opt/systemc-ams-2.3.4
# export LD_LIBRARY_PATH=${SYSTEMC_AMS_HOME}/lib-linux64:${LD_LIBRARY_PATH}

#export LD_LIBRARY_PATH=/usr/local/systemc-2.3.3/lib-linux64:/usr/local/systemc-ams-2.3.4/lib-linux64:$LD_LIBRARY_PATH


#
#
#export SYSTEMC_PATH=/usr/local/systemc-2.3.3/
#export SYSTEMC_AMS_PATH=/usr/local/systemc-ams-2.3
#export TARGET_ARCH=linux64
#
#export OPENSSL_ROOT_DIR=/usr/local/opt/openssl
#export PATH=$PATH:/opt/node-v18.16.0-linux-x64/bin

# export SYSTEMC_HOME=/usr/local/systemc
# export LD_LIBRARY_PATH=$SYSTEMC_HOME/lib-linux64
# export CPLUS_INCLUDE_PATH=$SYSTEMC_HOME/include
#

export NODEJS_HOME=/usr/local/lib/nodejs/node-v20.9.0/bin
export PATH=$NODEJS_HOME:$PATH

alias tor=" cd /opt/tor-browser/ && ./start-tor-browser.desktop"
alias p="python3"


# #vim wiki
# let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'default', 'ext': '.wiki'}]
# let g:vimwiki_key_mappings = {'all_maps': 1}
#
alias v="vim"
