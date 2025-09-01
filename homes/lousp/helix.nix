{
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox_dark_soft";

      editor = {
        line-number = "relative";
        continue-comments = false;
        color-modes = true;
        completion-trigger-len = 1;
        auto-format = true;

        lsp.enable = true;

        shell = [
          "nu"
          "-c"
        ];
      };
    };
  };
}
