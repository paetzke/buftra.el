#!/bin/bash -e


install_emacs24() {
    sudo add-apt-repository ppa:cassou/emacs -y
    sudo apt-get update -y
    sudo apt-get install emacs24 -y
}


test_01() {
    echo $FUNCNAME
    emacs --no-init-file -nw \
          --load buftra.el \
          -f kill-emacs
}


main() {
    if [ "$TRAVIS" = "true" ]; then
        install_emacs24
    fi

    test_01
}


main
