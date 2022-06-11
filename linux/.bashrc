#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'
function je {
    javac -d /tmp "$1.java" && java -cp /tmp "$1"
}

function wifi {
	nmcli radio wifi $1
}

function d {
	if [[ $1 == "up" ]]
	then
		systemctl start docker.socket
	elif [[ $1 == "down" ]]
	then
		systemctl stop docker.socket
	fi
}

function copy {
	xclip -sel clip $1
}

export INPUT="$HOME/input.txt"
export OUTPUT="$HOME/output.txt"
alias output="cat $OUTPUT"

source ~/.bash_completion.d/alacritty
eval "$(starship init bash)"
