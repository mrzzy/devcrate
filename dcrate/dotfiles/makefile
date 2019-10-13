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
$(HOME)/.config/tmux \
$(HOME)/.tmux.conf \
$(HOME)/.config/zsh \
$(HOME)/.zshrc \
$(HOME)/.Xresources
endef

## Targets
# install - (over)writes the dotfiles to their respective locations
install: $(DOTFILE_TARGETS)
# clean - removes dotfiles from their respective locations
clean:
	rm -rf $(DOTFILE_TARGETS)

### Dotfile location mapping targets
## Terminal (Core)
# neovim 
$(HOME)/.config/nvim: core/nvim $(wildcard core/nvim/*)
	cp -af $< $(dir $@)

# tmux
$(HOME)/.tmux.conf: core/tmux/tmux.conf
	cp $< $@

$(HOME)/.config/tmux: core/tmux
	cp -af $< $(dir $@)

# zsh
$(HOME)/.zshrc: core/zsh/zshrc
	cp $< $@

$(HOME)/.config/zsh: core/zsh
	cp -af  $< $@
	
## Gui
$(HOME)/.Xresources: gui/Xresources
	cp $< $@
