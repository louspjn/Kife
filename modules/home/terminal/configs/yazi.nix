{
  mgr  = {
    linemode = "size";
    sort_by = "natural";
    mouse_events = [];
  };

  preview = {
    wrap = "yes";
    max_width = 3600;
    max_height = 3600;
  };

  input = {
    cursor_blink = true;
  };

  opener = {
    edit = [
      {
        run = "hx -- \"$@\"";
        desc = "$EDITOR";
        block = true;
      }
    ];
  };
}
