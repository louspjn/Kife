let
  flake = "~/.config/system";
in
{
  home.file.".config/fish/config.fish".text = "
    if status is-interactive
      
      set fish_greeting

      nitch
      zoxide init fish | source

      # Alias
      alias cd='z'
      alias cat='bat'
      alias nvim='nix run github:Jhuan-Nycolas/Nvim'
      alias lvim='nix run ~/Nvim'
      alias hw='nh home switch ${flake}/home-manager'
      alias nw='nh os switch ${flake}/nixos'
      
      # Ls
      alias ls='exa --icons'
      alias l='exa --tree --icons'
      alias lt='exa -all --long --icons'
      alias ll='l --tree --icons'

      # Variaveis
      set -x NIXPKGS_ALLOW_UNFREE 1
    end
  ";
}
