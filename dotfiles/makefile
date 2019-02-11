#
# dotfiles/makefile
# devcrate
# Makefile to install dotfiles
# 

.PHONY: install clean
.DEFAULT: install

# List of dotfile deployment targets
define DOTFILE_TARGETS 
$(HOME)/.config/init.vim \
$(HOME)/.tmux.conf \
$(HOME)/.zshrc
endef

## Targets
# install - (over)writes the dotfiles to their respective locations
install: $(DOTFILE_TARGETS)

# clean - removes dotfiles from their respective locations
clean:
	rm -rf $(DOTFILE_TARGETS)

## Dotfile location mapping targets
$(HOME)/.config/init.vim: init.vim
	cp $< $@

$(HOME)/.tmux.conf: tmux.conf
	cp $< $@

$(HOME)/.zshrc: zshrc
	cp $< $@
