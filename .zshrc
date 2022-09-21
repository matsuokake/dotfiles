# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#nodebrewを使うためのpathを通す
export PATH=$HOME/.nodebrew/current/bin:$PATH
# Customize to your needs...
#補完を強力にするzsh-completionsにpathを通す
fpath=(/usr/local/share/zsh-completions $fpath)

# 補完機能の強化
autoload -Uz compinit
compinit
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF
# 日本語を使用
export LANG=ja_JP.UTF-8
# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd
# "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd
#cdと同時にls
chpwd() { ls }
# コマンドミスを修正
setopt correct
# 色を使用出来るようにする
autoload -Uz colors
colors
# beep を無効にする
setopt no_beep
#vimのkeybindにする
# bindkey -v
bindkey -e

#エイリアス
alias la='ls -a'
alias rm='rm -i'
alias c='clear'

#プロンプトの表示(themeでpureを使うための設定)
autoload -U promptinit; promptinit
prompt pure

#ヒストリー関連
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# ヒストリの共有の有効化
setopt share_history
# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
# ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

#ntfyの設定
# eval "$(ntfy shell-integration)"

#javaのversion指定
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/Users/matsuoka/tools:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
