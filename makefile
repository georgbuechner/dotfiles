pull_i3:
	cp ~/.i3/config files/i3/config

pull_nvim:
	cp ~/.config/nvim/init.vim files/config/nvim/init.vim

pull_kitty:
	cp ~/.config/kitty/kitty.conf files/config/kitty/kitty.conf

pull_zathura:
	cp ~/.config/zathura/zathurarc files/config/zathura/zathurarc

pull_dmenu:
	cp ~/.dmenurc files/dmenurc

pull:
	make pull_i3
	make pull_kitty
	make pull_nvim
	make pull_zathura
	make pull_dmenu
