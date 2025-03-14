{ pkgs, ... }:

{
  stylix = {
    base16Scheme = "./Stylix/nord.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };
}
