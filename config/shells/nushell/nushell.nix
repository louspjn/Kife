{pkgs, ...}: {
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
        c = "clear";

        home = "nh home";
        nixos = "nh os";
        nixpkgs = "nh search";
        nixgbc = "nh clean";

        # Ls Aliases
        l = "ls **/*";
        ll = "l -a";
        la = "ls -a";
      };

      settings = {
        edit_mode = "vi";
        table.mode = "rounded";

        buffer_editor = "nvim";
        show_banner = false;
      };

      extraConfig = ''
        $env.NH_FLAKE = "/home/haskex/nan"
        nitch
      '';
    };
  };
}
