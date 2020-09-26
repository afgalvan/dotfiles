shell:
	sudo apt update
	sudo apt install zsh
	sudo apt install screenfetch
	sudo apt install cmatrix
	sudo apt install htop
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	chsh -s $(which zsh)
	sudo apt install tmux
	source-file ~/.tmux.conf.local
	source-file ~/.zshrc

overwrite:
	cp /home/andres/Documents/Programming/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
	/home/andres/Documents/Programming/dotfiles/.zshrc ~/
