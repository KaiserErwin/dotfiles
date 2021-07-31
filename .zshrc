export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/kaisererwin/.deno/bin:$PATH"

if [[ $USER != "root" ]]; then
	# Rust
	. "$HOME/.cargo/env"
	# Deno
	fpath=(~/.zsh $fpath)
	autoload -Uz compinit
	compinit -u
fi

export ZSH="/home/kaisererwin/.oh-my-zsh"

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Don't resolve symbolic links in z
_Z_NO_RESOLVE_SYMLINKS="true"

# Colorize settings
ZSH_COLORIZE_TOOL=chroma

# Nice ones: arduino friendly paraiso-dark solarized-dark solarized-dark256 vim
ZSH_COLORIZE_STYLE=vim
ZSH_DISABLE_COMPFIX=true

plugins=(
	git
	sudo
	npm
	yarn
	deno
	colorize
	github
	zsh-syntax-highlighting
	zsh-autosuggestions
	git-prompt
)

# -------------| Plugins |--------------
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-sudo/sudo.plugin.zsh

# -------------| Alias |----------------

# ----| Commands |----
alias vi="nvim $1"
alias mk="mkdir $1"
alias zathura="nohup zathura $1"
alias ls="exa --group-directories-first --icons"
alias cat="bat --style=plain --paging=never"
alias tree="exa -T --icons"
alias grep="grep --color=auto"
alias ng="npm init -y && git init"
alias nd="npm i -D $1"
alias ns="npm i $1"

#-----| Configs |----#
alias sx='nvim ~/.config/sxhkd/sxhkdrc'
alias bs='nvim ~/.config/bspwm/bspwmrc'

# ----| Directory |----
alias dow="cd $HOME/Descargas"
alias doc="cd $HOME/Documentos"
alias img="CD $HOME/Imágenes"
alias dev="cd $HOME/Workspaces/"
alias js="cd $HOME/Workspaces/JavaScript"


