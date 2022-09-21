fpath=(~/.zsh-completions $fpath)        #pathの追加
autoload -U compinit && compinit       #補完機能の強化
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'       # 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*:default' menu select=2   #補完でリストを色つけ

autoload -Uz colors && colors       # 色を使用出来るようにする
export LS_COLORS="${LS_COLORS}:di=38;2;139;168;255"  #dirのcolor変更

export LANG=ja_JP.UTF-8       # 日本語を使用
setopt IGNOREEOF       # Ctrl+Dでログアウトしてしまうことを防ぐ
setopt auto_cd       # cdコマンドを省略して、ディレクトリ名のみの入力で移動
DIRSTACKSIZE=20     #pushdで保存しておく数
setopt auto_pushd       # "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt pushd_ignore_dups    #同じcommandはpushdしない
zstyle ':completion:*:cd:*' ignore-parents parent pwd    #補完で親からのcurrent directoryは除く
setopt correct       # コマンドミスを修正
setopt no_beep        # beep を無効にする
unsetopt bg_nice
# bindkey -v        #keybindをvimにする
bindkey -d        #keybindをdefaultにする
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'        #単語の一部として扱われる文字セットを指定(デフォルトのセットから/を除去)
chpwd() { ls --color=auto }       #cdしたら自動でls

#エイリアス
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias llh='ls -lh'
alias rm='rm -i'
# alias ..='cd ..'
alias c='clear'
alias less='less -S -R'
alias lessr='(){src-hilite-lesspipe.sh $1 | less}'
# export MYDMEL="/data2/matsuoka/works/dmel"
export MYAMPHIOXUS="/data2/matsuoka/works/amphioxus"
export MYTOKUDAIA="/data2/matsuoka/works/Tokudaia"
# export MYSC="/data2/matsuoka/works/dmel/myscript"
export MYSCRT="/scratch/matsuoka"
export MYTOOLS="/data2/matsuoka/works/amphioxus/mytools"
export TOOLS="/data2/matsuoka/tools"
export MOCHIMARU="/data2/mochimaru/works/Tokudaia"
# alias cdd="cd $MYDMEL"
alias cds="cd $MYSCRT"
alias cda="cd $MYAMPHIOXUS"
alias cdt="cd $MYTOKUDAIA"
alias cdto="cd $TOOLS"
alias cdm="cd $MOCHIMARU"


#プロンプトの表示(themeでpureを使うための設定)
if [[ $HOSTNAME =~ green[3-9] ]]; then
    prompt=$'\n%F{242}%n@%m%f %F{green}%~%f\n%F{green}❯%f '
else
    fpath+=("$HOME/.zsh/pure")
    autoload -U promptinit; promptinit
    prompt pure
    zstyle :prompt:pure:user color green        #change the user color
    zstyle :prompt:pure:host color green        #change the host color
fi

#zshでcondaを使うとhost名がバグることへの一時的な対処(https://github.com/conda/conda/issues/7031)
HOSTNAME="$(hostname)"  # Conda clobbers HOST, so we save the real hostname into another variable.
precmd() {
    OLDHOST="${HOST}"
    HOST="${HOSTNAME}"
}
preexec() {
    HOST="${OLDHOST}"
}

###ヒストリー関連###
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000000
setopt share_history       # ヒストリの共有の有効化
setopt hist_ignore_space       # 先頭にスペースのあるコマンドは記録しない
setopt hist_ignore_dups       # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_all_dups       # ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
function history-all { history -E 1 }       #history-all で全履歴を表示

#####プラグインの設定#####
if [[ ! $HOSTNAME =~ green[3-9] ]]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh       # zsh-syntax-highlighting(プラグイン)
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh       #zsh-autosuggestionsを使うための設定
fi


#環境変数TMUXでtmuxの利用の有無を判定し、利用している場合はパスの結合を行わない
if [[ -z $TMUX ]]; then
    #tmuxを使うためのpath
    export DIR="$HOME/local"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DIR/lib
    export PATH=$HOME/local/bin:$PATH
fi

#python path
export PATH="/data2/matsuoka/tools/Python-3.9.4:$PATH"
export PATH="/data2/matsuoka/tools/Python-3.9.4/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/data2/matsuoka/tools/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/data2/matsuoka/tools/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/data2/matsuoka/tools/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/data2/matsuoka/tools/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



####Toolのpath####
export PATH="/data2/matsuoka/bin:$PATH"     #linkへのpath

export PATH="/data2/matsuoka/tools/gcc-9.3.0/bin:$PATH"       #c++
export CPATH="/data2/matsuoka/tools/boost_1_75_0/include:$CPATH"       #boost
export LIBRARY_PATH="/data2/matsuoka/tools/boost_1_75_0/lib:$LIBRARY_PATH"       #boost
export LD_LIBRARY_PATH="/data2/matsuoka/tools/gcc-9.3.0/lib64:/data2/matsuoka/tools/boost_1_75_0/lib:$LD_LIBRARY_PATH"      #c++
export PYTHONPATH="${PYTHONPATH}:/data2/matsuoka/works/amphioxus/mytools/python_module"       # pythonのモジュール追加
export PATH="/data2/matsuoka/tools/git-2.21.0/bin:$PATH"       #gitのpath
export PATH="/data2/matsuoka/tools/cmake-3.17.3/bin:$PATH"       #cmake


####bioinfoのtool####
#blast-2.3.0+
# export PATH="/data2/matsuoka/tools/ncbi-blast-2.3.0+/bin:$PATH"

#augustus_3.3.3
# export PATH="/data2/matsuoka/tools/Augustus_3.3.3/bin:$PATH"

#purge_dupsのpath
# export PATH=$PATH:/data2/matsuoka/tools/purge_dups/scripts

# BUSCOのpath
# export BUSCO_CONFIG_FILE=/path/to/config.ini

# merquryを使うためのmerylのpath
export PATH="$PATH:/data2/matsuoka/tools/meryl-1.0/Linux-amd64/bin"
# merquryの推奨設定
export MERQURY=/data2/matsuoka/tools/merqury

#vcftools
export PATH="$PATH:/data2/matsuoka/tools/vcftools/bin"
export PERL5LIB="/data2/matsuoka/tools/vcftools/src/perl:$PERL5LIB"

#ucscのアライメントツール群のpath
export PATH="$PATH:/data2/matsuoka/tools/ucsc/bin:/data2/matsuoka/tools/ucsc/scripts"
#lastz
export PATH="$PATH:/data2/matsuoka/tools/lastz/lastz-distrib/bin"

#repeatmasker
# export PATH=/data1/common/Repeat/RepeatMasker407:$PATH

#dotPlotly
# export PATH="$PATH:/data2/matsuoka/tools/dotPlotly"

#sonLibのための設定
# PYTHONPATH="/data2/matsuoka/tools:${PYTHONPATH}"

#perlのモジュールを使うための設定
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$PATH:$HOME/perl5/bin;
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;

#SNAPの設定
export ZOE=/data2/matsuoka/tools/SNAP/Zoe
export PATH="$PATH:/data2/matsuoka/tools/SNAP"

#augusutusの設定
# export PATH=$PATH:/data2/matsuoka/tools/Augustus_3.3.3/scripts
# export PATH=/data2/matsuoka/tools/Augustus_3.3.3/bin:$PATH
# export AUGUSTUS_CONFIG_PATH=/data2/matsuoka/tools/Augustus_3.3.3/config

# #rmblastの設定
# export PATH=$PATH:/data2/matsuoka/tools/rmblast-2.10.0/bin

#spaln2.3.3の設定
# export PATH="/data2/matsuoka/tools/spaln2.3.3f.linux64/bin:$PATH"
# export ALN_TAB=/data2/matsuoka/tools/spaln2.3.3f.linux64/table
# export ALN_DBS=/data2/matsuoka/tools/spaln2.3.3f.linux64/seqdb

#pamlのpath
export PATH=$PATH:/data2/matsuoka/tools/paml4.9j/bin

#inparanoidのpath
export PATH=$PATH:/data2/matsuoka/tools/inparanoid4

#bat commandの設定
export PATH="/home/hori/.cargo/bin:$PATH"
PAGER="my-pager --foo='complex argument'"
if command -v bat >/dev/null ; then
    BAT_PATH=/home/hori/.cargo/bin/bat
    function bat() {
        if [ -t 1 ] ; then
            $BAT_PATH --color always --style full --paging never $* -p \
                | less --tabs 4 -RF
        else
            $BAT_PATH $*
        fi
    }
fi