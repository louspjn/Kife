{ config, pkgs, ... }:

{
  home.file = {
    ".config/i3/config".source = ../../dotfiles/i3/config;

    ".config/i3/modules/autostart.conf".source = ../../dotfiles/i3/modules/autostart.conf

    ".config/i3/modules/variables.conf".source = ../../dotfiles/i3/modules/variables.conf

    ".config/i3/modules/pulseaudio.conf".source = ../../dotfiles/i3/modules/pulseaudio.conf

    ".config/i3/modules/windows.conf".source = ../../dotfiles/i3/modules/windows.conf
    
    ".config/i3/modules/binds.conf".source = ../../dotfiles/i3/modules/binds.conf

    ".config/i3/modules/modes.conf".source = ../../dotfiles/i3/modules/modes.conf
  };
}
