{
  reop = {
    enable = true;
    settings = {
      editor = "nix run github:haskex/Nvim";
      shell = "nu";
      projects = {
        Reop = {
          path = "~/Reop/";
        };

        Nvf = {
          path = "~/nvf";
        };
      };
    };
  };
}
