function __dt_sessions
    set -l dir $DT_DIR
    test -z "$dir"; and set dir $HOME/.dtach
    for f in $dir/*.dtach
        test -e "$f"; and basename "$f" .dtach
    end
end
complete -c dt -f -a '(__dt_sessions)'
