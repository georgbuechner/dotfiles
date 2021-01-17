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

pull_xmodmap:
	cp ~/.Xmodmap files/Xmodmap

push_i3:
	cp files/i3/config ~/.i3/config 

push_nvim:
	cp files/config/nvim/init.vim ~/.config/nvim/init.vim 

push_kitty:
	cp files/config/kitty/kitty.conf ~/.config/kitty/kitty.conf 

push_zathura:
	cp files/config/zathura/zathurarc ~/.config/zathura/zathurarc 

push_dmenu:
	cp files/dmenurc ~/.dmenurc 

push_xmodmap:
	cp files/Xmodmap ~/.Xmodmap

pull:
	make pull_i3
	make pull_kitty
	make pull_nvim
	make pull_zathura
	make pull_dmenu
	make push_xmodmap

push:
	make push_i3
	make push_kitty
	make push_nvim
	make push_zathura
	make push_dmenu
	make push_xmodmap
