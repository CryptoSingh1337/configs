function je {
    javac -d /tmp "$1.java" && java -cp /tmp "$1"
}

function wifi {
	nmcli radio wifi $1
}

export INPUT="$HOME/input.txt"
export OUTPUT="$HOME/output.txt"
alias output="cat $OUTPUT"

reset-cursor() {
  printf '\033]50;CursorShape=1\x7'
}
export PS1="$(reset-cursor)$PS1"