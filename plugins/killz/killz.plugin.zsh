function killz {
    for arg in $*; do
        psg $arg | tr -s " " | sed 's/^ *//' | cut -f 1 -d " " | xargs -I proc kill -9 proc
    done
}
