{
  programs.waybar = {
    enable = true;

    settings = {
      defaultBar = {
        position = "top";
        
        margin-top = 10;
        margin-left = 12;
        margin-right = 12;

        height = 20;

        modules-left = [
          "hyprland/workspaces"
          "custom/separator"
          "hyprland/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "network"
          "battery"
          "custom/separator"
          "custom/lock"
        ];

        "hyprland/workspaces" = {
          all-outputs = true;
          type = "workspaces";
          format = "{name}";
        };

        "custom/separator" = {
          format = " | ";
          toltip = false;
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 30;
          toltip = false;
        };

        "clock" = {
          type = "clock";
          format = "{:%I:%M %p}";
          toltip = false;
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "  {essid} ({signalStrength}%) ";
          format-disconnected = "  Disconnected!";
          max-length = 50;
        };

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 8;
          };

          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        "custom/lock" = {
          type = "custom";
          format = "  ";
          on-click = "hyprlock";
          toltip = false;
        };
      };
    };

    style = builtins.readFile ./waybarStyle.css;
  };
}
