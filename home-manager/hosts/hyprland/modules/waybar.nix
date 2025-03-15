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
          "hyprland/network"
          "hyprland/volume"
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
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 30;
        };

        "clock" = {
          type = "clock";
          format = "{:%I:%M %p}";
        };

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
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
          command = "hyprlock";
        };
      };
    };

    style = builtins.readFile ./waybarStyle.css;
  };
}
