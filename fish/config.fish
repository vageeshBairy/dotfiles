set fish_greeting ""

set -gx TERM xterm-256color

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "eza -lah"
alias lla "ll -A"
alias g git
alias cl clear
alias v nvim
alias h helix
command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -gx TERMINAL footclient
set -gx BROWSER firefox
set -gx VISUAL nvim
set -gx GIT_EDITOR nvim
set -gx VIDEO mpv
set -gx IMAGE sxiv
set -gx COLORTERM truecolor
set -gx OPENER xdg-open
set -gx WM Hyprland
set -gx LAUNCHER tofi

set -gx PATH /bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.local/bin/scripts $PATH

#Flutter PATH
set FLUTTER_ROOT "$HOME/Android/flutter"
set DART_LANGUAGE_SERVER "$HOME/.pub-cache"

#Chrome PATH
set CHROME_EXECUTABLE /opt/google/chrome/google-chrome

#NodeJS
set NPM_PACKAGES "$HOME/.local/bin/npm-packages"

# Path
set -gx PATH $PATH $NPM_PACKAGES/bin $FLUTTER_ROOT/bin $DART_LANGUAGE_SERVER

set MANPATH $NPM_PACKAGES/share/man $MANPATH

source (dirname (status --current-filename))/config-linux.fish

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
if test -e $HOME/.cache/wal/colors.fish
    source $HOME/.cache/wal/colors.fish
    cat $HOME/.cache/wal/sequences &
end

fish_add_path (find "$HOME/.sdkman/candidates/gradle/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/java/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/kotlin/current/bin" -maxdepth 0)

fzf --fish | source
zoxide init fish | source

bind \cf tmux_sessionizer

starship init fish | source
# oh-my-posh init fish --config $HOME/.config/oh-my-posh/oh-my-posh.toml | source