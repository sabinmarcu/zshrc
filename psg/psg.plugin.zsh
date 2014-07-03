function psg {
    ps ax | grep -i $* | grep -vi "grep"
}
