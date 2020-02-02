# Autocompletion for helm3.
#
# Copy from kubectl : https://github.com/pstadler

if [ $commands[helm3] ]; then
  source <(helm3 completion zsh)
fi
