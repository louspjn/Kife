{
  manager = {
    linemode = "size";
    sort_by = "natural";
    mouse_events = [];
  };

  preview = {
    wrap = "yes";
    max_width = 1800;
    max_height = 1800;
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
