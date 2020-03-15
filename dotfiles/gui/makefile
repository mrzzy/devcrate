#
# devcrate
# Makefile to install gui dotfiles
# 


.PHONY: install clean
.DEFAULT: install

# List of dotfile deployment targets
define DOTFILE_TARGETS 
$(HOME)/.Xresources \
$(HOME)/.config/i3 \
$(HOME)/.config/nitrogen \
$(HOME)/.config/polybar  \
$(HOME)/.config/pulse  
endef

## Targets
# install - (over)writes the dotfiles to their respective locations
install: $(DOTFILE_TARGETS)
# clean - removes dotfiles from their respective locations
clean:
	rm -rf $(DOTFILE_TARGETS)

## Dotfile location mapping targets
# xresources
$(HOME)/.Xresources: Xresources
	cp $< $@

# i3 window manger
$(HOME)/.config/i3: ./i3
	cp -af $< $(dir $@)
# nitrogen
$(HOME)/.config/nitrogen: ./nitrogen
	cp -af $< $(dir $@)
# polybar
$(HOME)/.config/polybar: ./polybar
	cp -af $< $(dir $@)
# pulseaudio
$(HOME)/.config/pulse: ./pulse
	cp -afv $</. $@/
