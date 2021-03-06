setenv EDITOR vim

set -xg GOROOT $HOME/Projects/go
set -xg PATH $GOROOT/bin $PATH
set -xg PATH ~/.local/bin $PATH
alias coveralls="brave-browser ./__coverage__/lcov-report/index.html"
alias twatch="yarn unit --watch --no-coverage"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias l=ls

set fish_color_normal c5c8c6
set fish_color_command b294bb
set fish_color_quote b5bd68
set fish_color_redirection 8abeb7
set fish_color_end c397d8
set fish_color_error cc6666
set fish_color_param c5c8c6
set fish_color_comment 969896
set fish_color_match f0c674
set fish_color_search_match f0c674
set fish_color_operator 8abeb7
set fish_color_escape 8abeb7
set fish_color_cwd b5bd68
