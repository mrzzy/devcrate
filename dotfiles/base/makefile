#
# devcrate
# Makefile to install terminal base dotfiles
#

# command aliases
MKDIR:=mkdir -p
RM:=rm -rf

# file / directory variables
CONFIG_DIR:=$(HOME)/.config

# List of dotfile deployment targets
define DOTFILE_TARGETS
$(CONFIG_DIR)/nvim \
$(CONFIG_DIR)/nvim_plugin \
$(CONFIG_DIR)/tmux \
$(HOME)/.tmux.conf \
$(CONFIG_DIR)/zsh \
$(HOME)/.zshrc \
$(HOME)/.gnupg/gpg-agent.conf
endef

.PHONY: install clean $(DOTFILE_TARGETS) # force recopy: ignore modification time
.DEFAULT: install

## Targets
# install - (over)writes the dotfiles to their respective locations
install: $(DOTFILE_TARGETS)
# clean - removes dotfiles from their respective locations
clean:
	$(RM) $(DOTFILE_TARGETS)

### Dotfile location mapping targets
## Terminal (Base)
$(CONFIG_DIR):
	$(MKDIR) $@

# neovim
$(CONFIG_DIR)/nvim: ./nvim $(wildcard ./nvim/*) $(CONFIG_DIR)
	cp -rf $< $(dir $@)

$(CONFIG_DIR)/nvim_plugin: ./nvim/plugin $(CONFIG_DIR)
	cp -Trf $< $@

# tmux
$(HOME)/.tmux.conf: ./tmux/tmux.conf
	cp $< $@

$(CONFIG_DIR)/tmux: ./tmux $(CONFIG_DIR)
	cp -rf $< $(dir $@)

# zsh
$(HOME)/.zshrc: ./zsh/zshrc
	cp $< $@

$(CONFIG_DIR)/zsh: ./zsh $(CONFIG_DIR)
	cp -rf  $< $(dir $@)

# gpg
$(HOME)/.gnupg:
	$(MKDIR) $@

$(HOME)/.gnupg/gpg-agent.conf: gpg/gpg-agent.conf $(HOME)/.gnupg
	cp $< $@
