if [[ "$ZSH_PROF" == "true" ]]; then
    if (which zprof > /dev/null 2>&1) ;then
        zprof
    fi
fi
