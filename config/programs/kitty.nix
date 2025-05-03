{lib, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      cursor_trail = 4;
      cursor_trail_start_threshold = 0;

      window_padding_width = 6;
      background_opacity = lib.mkDefault 0.9;
    };
  };
}
