{
  programs.helix = {
    enable = true;

    settings = {
      theme = "nord";
      editor = {
        color-modes = true;
        mouse = false;
        auto-save.after-delay = {
          enable = true;
          timeout = 100;
        };
      };
    };
  };
}
