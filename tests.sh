#!/bin/bash -e


install_emacs24() {
    sudo add-apt-repository ppa:cassou/emacs -y
    sudo apt-get update -y

    sudo apt-get install emacs24 -y
}


test_install_package() {
    emacs --no-init-file -nw \
          buftra.el \
          -f package-install-from-buffer \
          -f kill-emacs
}


main() {
    if [ "$TRAVIS" = "true" ]; then
        install_emacs24
        test_install_package
    fi
}


main
