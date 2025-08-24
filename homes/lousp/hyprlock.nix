let
  theme = builtins.fromJSON (builtins.readFile ./palette.json);
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 3;
        }
      ];

      label = [
        {
          monitor = "";
          position = "0, 80";

          text = "cmd[update:10000] echo \"<span foreground='##${theme.base05}'>$(date +%H:%M)</span>\"";

          font_size = 80;
          font_family = "JetBrainsMono Nerd Font";
        }
      ];

      input-field = [
        {
          size = "300, 50";
          position = "0, -80";

          monitor = "";

          fail_color = "rgba(${theme.base08}FF)";
          inner_color = "rgba(${theme.base02}FF)";
          outer_color = "rgba(${theme.base03}FF)";
          check_color = "rgba(${theme.base0A}FF)";
          dots_text_format = "<span foreground=\"##${theme.base05}\"><i> </i></span>";

          font_family = "JetBrainsMono Nerd Font";

          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 4;
          shadow_passes = 0;

          fail_text = "<span foreground=\"##${theme.base08}\"><i>Sorry, it's not my password</i></span>";
          placeholder_text = "<span foreground=\"##${theme.base05}\"><i>Unlock it</i></span>";
        }
      ];
    };
  };
}
