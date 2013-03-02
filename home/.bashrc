if [ -f ~/.localrc ]; then
  . $HOME/.localrc
fi
alias faceroll='cat /dev/urandom'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
