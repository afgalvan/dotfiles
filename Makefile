install:
	sudo apt install git
	sudo apt install screenfetch
	sudo apt install cmatrix
	sudo apt install htop
	sudo apt install neovim
	sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	sudo apt install tmux
	sudo git clone https://github.com/gpakosz/.tmux.git ~/.tmux
	sudo cp .tmux.conf.local ~/.tmux/
	cd
	ln -s -f .tmux/.tmux.conf
	cp ~/.tmux/.tmux.conf.local ~/
	cargo install exa
	cargo install bat
	sudo apt update
	sudo apt upgrade
