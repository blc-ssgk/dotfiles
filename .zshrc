#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# path
## pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/opt/git/bin:$PATH
export PATH=$PATH:./node_modules/.bin
#export PATH=$HOME/.nodenv/bin:$PATH
#eval "$(nodenv init -)"

## anyenv
eval "$(anyenv init -)"

## composer
export PATH=$HOME/.composer/vendor/bin:$PATH

# alias
#alias lsa="ls -la"
#alias ls="ls -GF"
# exa
alias ls='exa --group-directories-first'
alias ll='exa -hal --git --time-style=long-iso --group-directories-first'
# cd
alias cdl="cd ~/Develop"
alias cdlb="cd ~/Develop/balconia"
alias cdle="cd ~/Develop/external"
# zprezto
## git ショートカットを一覧化
alias zgit='bat ~/.zprezto/modules/git/alias.zsh | grep "alias "'
## docker-compose ショートカットを一覧化
alias zdc='bat ~/.zprezto/modules/docker/alias.zsh | grep "docker-compose"'
# vagrant
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant suspend'
alias vres='vagrant resume'
alias vrel='vagrant reload'
alias vrelp='vagrant reload --provision'
alias vprov='vagrant provision'
alias vd='vagrant destroy'
alias vs='vagrant status'
alias vsh='vagrant ssh'
alias vv='vagrant version'

# color
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# spaceship settings
## prompt
SPACESHIP_PROMPT_ORDER=(
  host
  dir
  git
  node
  exec_time
  time
  battery
  line_sep
  exit_code
  char
)
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="["
SPACESHIP_TIME_SUFFIX="]"
SPACESHIP_HOST_SHOW=true
SPACESHIP_DIR_SHOW=true
SPACESHIP_NODE_SHOW=true
SPACESHIP_BATTERY_SHOW=true
SPACESHIP_BATTERY_SYMBOL_CHARGING="⚡️"
SPACESHIP_BATTERY_SYMBOL_DISCHARGING="💀"
SPACESHIP_BATTERY_SYMBOL_FULL="🔋"
SPACESHIP_BATTERY_THRESHOLD=20


# cool-peco
# === cool-peco init ===
FPATH="$FPATH:$HOME/dotfiles/cool-peco"
autoload -Uz cool-peco
cool-peco
# ======================
bindkey '^r' cool-peco-history
alias cps=cool-peco-ps
alias gitc=cool-peco-git-checkout
alias gitl=cool-peco-git-log
alias pecoref="cat ~/.zshrc | grep -i cool-peco"

# history
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# 共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# 余分な空白は詰めて記録
setopt hist_reduce_blanks  

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "marzocchi/zsh-notify"
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
