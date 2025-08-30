{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;

    settings = {
      add_newline = false;
      scan_timeout = 10;

      format = builtins.concatStringsSep "" [
        "$directory"
        "$nix_shell"
        "$rust"
        "$lua"
        "$haskell"
        "$nodejs"
        "$git_branch"
        "$git_status\n$character"
      ];

      rust = {
        format = "via [ $version](bold orange) ";
        version_format = "v$raw";
        detect_extensions = ["rs"];
        detect_files = ["Cargo.toml"];
      };

      nix_shell = {
        disabled = false;
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
        format = "via [ $name](bold blue) ";
      };

      haskell = {
        disabled = false;
        format = "via [󰲒 $version](bold purple)";
      };

      lua = {
        format = "via [󰢱 $version](bold blue) ";
      };

      nodejs = {
        format = "via [󰎙 $version](bold green) ";
      };

      git_branch = {
        symbol = "";
        style = "bold red";
      };

      git_status.disabled = false;

      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
    };
  };
}
