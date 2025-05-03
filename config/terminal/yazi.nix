{
  programs.yazi = {
    enable = true;

    settings = {
      manager = {
        linemode = "size";
        show_hidden = true;
        sort_by = "natural";
        mouse_events = [];
      };

      preview = {
        wrap = "yes";
        max_width = 1500;
        max_height = 1500;
      };

      input = {
        cursor_blink = true;
      };

      opener = {
        edit = [
          {
            run = "nNvim -- \"$@\"";
            desc = "$EDITOR";
            block = true;
          }
          {
            run = "code \"$@\"";
            orphan = true;
          }
        ];
      };
    };
  };
}
