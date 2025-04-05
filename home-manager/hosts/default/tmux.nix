{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    shell = "${pkgs.fish}/bin/fish";
    plugins = [
      pkgs.tmuxPlugins.nord
    ];
  };
}
