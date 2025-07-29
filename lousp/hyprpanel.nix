{
  programs.hyprpanel = {
    enable = true;
    
    settings = {
      layout = {
        bar.layouts = {
          "0" = {
            left = [ "dashboard" "workspaces" ];
            middle = [ "media" ];
            right = [ "volume" "systray" "notifications" ];
          };
        };
      };

      bar = {
        launcher.autoDetectIcon = true;
        workspaces.show_icons = true;
      };

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };

        dashboard = {
          directories.enabled = false;
          stats.enable_gpu = true;
        };

        weather.unit = "metric";
      };

      theme = {
        bar.transparent = false;

        font = {
          name = "JetBrains Mono Nerd Font";
          size = "13px";
        };
      };
    };
  };
}
