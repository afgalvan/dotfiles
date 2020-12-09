install:
	sudo apt update
	sudo apt-get install curl
	sudo apt install git
	sudo apt install zsh
	sudo apt install screenfetch
	sudo apt install cmatrix
	sudo apt install htop
	sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sudo chsh -s $(which zsh)
	sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	sudo apt install tmux
	sudo git clone https://github.com/gpakosz/.tmux.git ~/.tmux
	sudo cp .tmux.conf.local ~/.tmux/
	cd
	ln -s -f .tmux/.tmux.conf
	cp ~/.tmux/.tmux.conf.local ~/
	curl https://sh.rustup.rs -sSf | sh
	source $HOME/.cargo/env
	cargo install --git https://github.com/zkat/exa
	cargo install bat
	sudo apt update
	sudo apt upgrade