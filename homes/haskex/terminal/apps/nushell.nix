{pkgs,...}: {
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
  };

  terminal.shells.nushell = {
    enable = true;

    useDefaultConfig = true;

    aliases = {
      cd = "z";
      cat = "${pkgs.bat}/bin/bat";
      c = "clear";

      nixos = "nh os";
      nps = "nh search";
      ncn = "nh clean";

      l = "ls **/*";
      ll = "l -a";
      la = "ls -a";
    };

    extraConfig = "nitch";

    nhFlake = "/home/haskex/nan";
  };
}
