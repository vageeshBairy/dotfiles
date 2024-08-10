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
alias y yazi
command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -gx TERMINAL kitty
set -gx BROWSER firefox
set -gx VISUAL nvim
set -gx GIT_EDITOR nvim
set -gx VIDEO mpv
set -gx IMAGE imv
set -gx COLORTERM truecolor
set -gx OPENER xdg-open
set -gx WM Hyprland
set -gx LAUNCHER tofi
set -gx PAGER most

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

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

set MANPATH /usr/local/man /usr/local/share/man /usr/share/man 
set MANPATH $HOME/.sdkman/candidates/java/current/man $MANPATH
set MANPATH $NPM_PACKAGES/share/man $MANPATH

source (dirname (status --current-filename))/config-linux.fish

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
if test -e $HOME/.cache/wal/colors.fish
    source $HOME/.cache/wal/colors.fish
    setsid cat $HOME/.cache/wal/sequences
end

fish_add_path (find "$HOME/.sdkman/candidates/gradle/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/java/current/bin" -maxdepth 0)
fish_add_path (find "$HOME/.sdkman/candidates/kotlin/current/bin" -maxdepth 0)

fzf --fish | source
zoxide init fish | source

bind \cf tmux_sessionizer

function vi_mode
    set fish_bind_mode default
    commandline -f repaint-mode
end

starship init fish | source
# oh-my-posh init fish --config $HOME/.config/oh-my-posh/oh-my-posh.toml | source
