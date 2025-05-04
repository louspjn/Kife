{
  programs.waybar = {
    enable = true;

    settings = {
      main = {
        layer = "top";
        position = "top";

        height = 30;

        modules-left = ["custom/logo" "hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["clock" "custom/lock"];

        "custom/logo" = {
          format = " ";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = " ";
            default = " ";
          };
          persistent-workspaces = {
            "1" = ["eDP-1"];
            "*" = [2 3 4 5 6];
          };
        };
      };
    };
  };
}
