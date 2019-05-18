#
# dotfiles/makefile
# devcrate
# Makefile to install dotfiles
# 

.PHONY: install clean
.DEFAULT: install

# List of dotfile deployment targets
define DOTFILE_TARGETS 
$(HOME)/.config/nvim \
$(HOME)/.tmux.conf \
$(HOME)/.zshrc \
$(HOME)/.config/i3/config \
$(HOME)/.Xresources
endef

## Targets
# install - (over)writes the dotfiles to their respective locations
install: $(DOTFILE_TARGETS)
# clean - removes dotfiles from their respective locations
clean:
	rm -rf $(DOTFILE_TARGETS)

## Dotfile location mapping targets
$(HOME)/.config/nvim: core/nvim 
	cp -af $< $(dir $@)

$(HOME)/.tmux.conf: core/tmux.conf
	cp $< $@

$(HOME)/.zshrc: core/zshrc
	cp $< $@
	
$(HOME)/.Xresources: gui/Xresources
	cp $< $@

