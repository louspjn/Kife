{
  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      theme = "gruvbox_dark_soft";

      editor = {
        line-number = "relative";
        continue-comments = false;
        color-modes = true;
      };
    };
  };
}
