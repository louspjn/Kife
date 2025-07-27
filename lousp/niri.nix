{ pkgs, config, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      binds = with config.lib.niri.actions;
      let
        sh = spawn "sh" "-c";
      in
      {
        "Super+Return".action.spawn = "kitty";
        "Super+Space".action.spawn = ["wofi" "--show" "drun"];
        "Super+C".action.spawn = "firefox";
        "Super+D".action.spawn = "equibop";
        "Super+Q".action = close-window;

        "Super+H".action = focus-column-left;
        "Super+J".action = focus-workspace-down;
        "Super+K".action = focus-workspace-up;
        "Super+L".action = focus-column-right;

        "Super+W".action = toggle-overview;

        "Super+Shift+S".action = sh "${pkgs.grim}/bin/grim -g (${pkgs.slurp}/bin/slurp)";
        "Super+Shift+R".action = sh "${pkgs.wf-recorder}/bin/wf-recorder";
        "Super+Tab".action.spawn = ["niriswitcherctl" "show" "--workspaces"];
      };

      input.keyboard.xkb = {
        layout = "br";
        variant = "abnt2";
      };

      cursor = {
        theme = "rose-pine-hyprcursor";
        size = 10;
      };

      layout = {
        focus-ring.enable = false;
      };

      window-rules = [
        {
          open-maximized = true;
          geometry-corner-radius = {
            bottom-left = 40.0;
            bottom-right = 40.0;

            top-left = 40.0;
            top-right = 40.0;
          };
        }
      ];

      spawn-at-startup = [
        { command = [ "waybar" ]; }
        { command = [ "dunst" ]; }
        { command = [ "swww-daemon" ]; }
        { command = [ "niriswitcher" ]; }
      ];
    };
  };
}
