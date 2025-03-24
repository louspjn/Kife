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
        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
      };
    };
  };
}
