{
  programs.waybar = {
    enable = true;

    settings = {
      main = {
        layer = "top";
        position = "top";

        height = 30;

        modules-left = ["hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = [];
      };
    };
  };
}
