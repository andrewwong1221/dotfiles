if [ -f ~/.localrc ]; then
  . $HOME/.localrc
fi
alias faceroll='cat /dev/urandom'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
