#
# devcrate
# Makefile to install terminal base dotfiles
# 

.PHONY: install clean
.DEFAULT: install

# List of dotfile deployment targets
define DOTFILE_TARGETS 
$(HOME)/.config/nvim \
$(HOME)/.config/tmux \
$(HOME)/.tmux.conf \
$(HOME)/.config/zsh \
$(HOME)/.zshrc 
endef

## Targets
# install - (over)writes the dotfiles to their respective locations
install: $(DOTFILE_TARGETS)
# clean - removes dotfiles from their respective locations
clean:
	rm -rf $(DOTFILE_TARGETS)

### Dotfile location mapping targets
## Terminal (Base)
# neovim 
$(HOME)/.config/nvim: ./nvim $(wildcard ./nvim/*)
	cp -af $< $(dir $@)

# tmux
$(HOME)/.tmux.conf: ./tmux/tmux.conf
	cp $< $@

$(HOME)/.config/tmux: ./tmux
	cp -af $< $(dir $@)

# zsh
$(HOME)/.zshrc: ./zsh/zshrc
	cp $< $@

$(HOME)/.config/zsh: ./zsh
	cp -af  $< $@
	
