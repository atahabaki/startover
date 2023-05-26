alias l = br --sort-by-type-dirs-first -dpsh -c :pt
alias r = bat
alias v = nvim
alias sv = sudo nvim

alias pq = pacman -Qs
alias pc = sudo pacman -Sc
alias pif = pacman -Sii
alias pcx = sudo pacman -Scc
alias pup = sudo pacman -Syu
alias pin = sudo pacman -S
alias pfd = pacman -Ss
alias pfl = pacman -F
alias prm = sudo pacman -R
alias prmx = sudo pacman -Rns (pacman -Qtdq | str replace -a '\n' ' ' | split row ' ')
alias pfly = sudo pacman -Fy

alias g = git
alias glp = git log --date=relative --graph --decorate --all --pretty=format:"%C(#eba0ac)%h %C(#a6adc8)%cd %C(#f9e2af)[%cn] %C(#cba6f7)%s%C(#f38ba8)%d%Creset"
