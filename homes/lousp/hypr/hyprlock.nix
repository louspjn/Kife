let
  theme = builtins.fromJSON (builtins.readFile ./palette.json);
in {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 160;
          on-timeout = "notify-send \"System\" \"Are you okay? I'll lock your screen in 20 seconds\"";
        }
        {
          timeout = 180;
          on-timeout = "hyprlock";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

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
          position = "0, 130";

          text = "cmd[update:10000] echo \"<span foreground='##${theme.base05}'>$(date +%H:%M)</span>\"";

          font_size = 80;
          font_family = "JetBrainsMono Nerd Font";
        }

        {
          monitor = "";
          position = "0, 10";

          text = "cmd[] echo \"<span foreground='##${theme.base05}'>$(hyprctl splash)</span>\"";

          font_size = 14;
          font_family = "JetBrainsMono Nerd Font";
        }
      ];

      input-field = [
        {
          size = "300, 50";
          position = "0, -100";

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
