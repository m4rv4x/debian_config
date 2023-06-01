sudo apt install zsh-autosuggestions zsh-syntax-highlighting

# Set up the prompt

setopt autocd              # change directory just by typing its name                       
setopt correct            # auto correct mistakes                                          
setopt interactivecomments # allow comments in interactive mode                             
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=esetopt nonomatch           # hide error message if there is no match for the pattern        
setopt notify              # report the status of background jobs immediately               
setopt numericglobsort     # sort filenames numerically when it makes sense                 
setopt promptsubst         # enable command substitution in prompt                          
setopt histignorealldups   # ignore duplicates in history                                  
setopt nohup               # prevent hangups when exiting shell                             

prompt adam2

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# enable color support of ls, less and man, and also add handy aliases                      
if [ -x /usr/bin/dircolors ]; then                                                          
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"   
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions 
                                                                                            
    #alias dir='dir --color=auto'                                                           
    #alias vdir='vdir --color=auto'                                                         
                                                                                            
    alias grep='grep --color=auto'                                                          
    alias fgrep='fgrep --color=auto'                                                        
    alias egrep='egrep --color=auto'                                                        
    alias diff='diff --color=auto'                                                          
    alias ip='ip --color=auto'                                                              
                                                                                            
    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink                                    
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold                                     
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink                               
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video                            
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video                            
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline                                
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline                                
                                                                                            
    # Take advantage of $LS_COLORS for completion as well                                   
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"                                 
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'        
fi                                                                                          
                                                                                            
# some m4rv4x custom
alias nano="micro"
export VISUAL=micro                                                                         
export EDITOR=micro
alias la='exa -a --color=always --group-directories-first --icons'                                                                            
alias ll='exa -al --color=always --group-directories-first --icons'
alias ls='exa --color=always --group-directories-first --icons'
alias update="sudo apt update && sudo apt upgrade"
alias diskusage="sudo ncdu"
