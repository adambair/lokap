Compile Vim with Ruby, Lua, Python, cscope, and TrueColor

Truecolor allows for all the colors. You know, like gvim, but in the terminal.
Make sure you have terminal that supports true color (iTerm2 nightly / compiled)
Also make sure you have a terminal multiplexer that supports it (tmux, compiled)
Unite.vim is optimized for Lua

NOTE: Use fzf instead of unite.vim; it's fast as hell and works everywhere ala unix philosophy
Lua required to speed up unite.vim according to it's creator ShougoMatsu:
https://www.reddit.com/r/vim/comments/1fpti5/unitevim_the_plugin_you_didnt_know_you_need/cad9aod
http://cl.ly/3j3E0d0O3B1k/Image%202016-02-16%20at%209.47.27%20PM.png


./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-termtruecolor \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
            --enable-pythoninterp \
            --enable-python3interp \
            --enable-cscope \
            --enable-fail-if-missing \
            --enable-largefile \
            --with-lua-prefix=/usr/local

