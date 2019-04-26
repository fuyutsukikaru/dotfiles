# User configuration
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/local/git/bin:"
# export MANPATH="/usr/local/man:$MANPATH"
export CLICOLOR=1;

# Antibody plugins
source <(antibody init)
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
DISABLE_AUTO_UPDATE=true
antibody bundle robbyrussell/oh-my-zsh
antibody bundle robbyrussell/oh-my-zsh folder:plugins/common-aliases
antibody bundle "
  robbyrussell/oh-my-zsh path:plugins/git
"

antibody bundle mafredri/zsh-async
#antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
#antibody bundle zsh-users/zsh-history-substring-search

#antibody bundle akz92/clean
antibody bundle andrepolischuk/min
antibody bundle zsh-users/zsh-syntax-highlighting

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

export HISTSIZE=1000
export SAVEHIST=1000

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --border'
export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || rg --files --no-ignore --hidden --follow --glob "!.git/*") 2> /dev/null'
