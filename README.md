# My ZSHRC

This is my personal ZSHRC configuration to be used with oh-my-zh.

## Installation

To install, just clone this repository, overlapping the existing plugins folder in the custom area, and link the zshrc.

    $ cd ~ZSH_CUSTOM
    $ mv plugins plugins.old
    $ git clone http://github.com/sabinmarcu/zshrc.git plugins
    $ cd plugins
    $ ln -s ~/.zshrc ~ZSH_CUSTOM/plugins/zshrc

Alternatively, you can make your own little local zshrc and use it afterwards.

    $ cd ~
    $ vim .zshrc.local

And it will get loaded automatically. This is only if you don't want to fork me. 

I do recommend you fork me if you want to improve this thing. Have fun with it
