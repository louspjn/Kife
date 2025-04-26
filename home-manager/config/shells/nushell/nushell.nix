{pkgs, ...}: let
  flake = "~/setup";
in {
  programs = {
    oh-my-posh = {
      enable = true;
      enableNushellIntegration = true;
      useTheme = "robbyrussell";
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    nushell = {
      enable = true;

      shellAliases = {
        # Other Aliases
        cd = "z";
        cat = "${pkgs.bat}/bin/bat";
        nvim = "nix run github:haskex/nvim";
        lvim = "nix run ~/Nvim";
        hw = "nh home switch ${flake}/home-manager";
        nw = "nh os switch ${flake}/nixos";
        c = "clear";

        icon = "grid -i -s '  '";

        # Ls Aliases
        l = "ls **/*";
        ll = "l -a";
        la = "ls -a";
      };

      settings = {
        edit_mode = "vi";
        table.mode = "rounded";

        buffer_editor = "nix run github:haskex/Nvim";
        show_banner = false;
      };

      extraConfig = ''
        source ~/setup/home-manager/hosts/default/shells/nushell/theme.nu
      '';
    };
  };
}
