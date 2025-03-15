{
  programs.waybar = {
    enable = true;

    settings = {
      defaultBar = {
        position = "top";
        
        margin-top = 10;

        height = 20;
        width = 1340;

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
          "battery"
          "hyprland/volume"
          "custom/lock"
        ];

        "hyprland/workspaces" = {
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
          type = "battery";
          format = "{capacity}% {icon} | ";
        };

        "custom/lock" = {
          type = "custom";
          format = "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'><path d='M144 144l0 48 160 0 0-48c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192l0-48C80 64.5 144.5 0 224 0s144 64.5 144 144l0 48 16 0c35.3 0 64 28.7 64 64l0 192c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 256c0-35.3 28.7-64 64-64l16 0z'/></svg> ";
          command = "swaylock";
        };
      };
    };

    style = builtins.readFile ../../dotfiles/waybar/style.css;
  };
}
