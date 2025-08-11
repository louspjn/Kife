{
  config,
  pkgs,
  ...
}: let
  workspacelimit = 9;
  workspacebinds = (
    builtins.concatLists (
      builtins.genList (
        i: let
          ws = i + 1;
        in [
          "SUPER, code:1${toString i}, workspace, ${toString ws}"
          "SUPER SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ]
      )
      workspacelimit
    )
  );

  grimblast = "${pkgs.grimblast}/bin/grimblast";

  print = pkgs.writeShellScriptBin "print" "${grimblast} copysave area ~/Images/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    settings = {
      exec = [
        "waypaper --folder ~/SagittariusOS/assets/wallpapers --restore"
        "pkill waybar; waybar"
      ];

      monitor = [
        "eDP-1, preferred, 1920x0, 1"
        "HDMI-A-1, 1920x1080, 0x0, 1"
      ];

      binde = [
        "CTRL, H, moveactive, -20 0"
        "CTRL, J, moveactive, 0 20"
        "CTRL, K, moveactive, 0 -20"
        "CTRL, L, moveactive, 20 0"

        "ALT, H, resizeactive, -20 0"
        "ALT, J, resizeactive, 0 20"
        "ALT, K, resizeactive, 0 -20"
        "ALT, L, resizeactive, 20 0"
      ];

      bind =
        [
          "SUPER, Return, exec, alacritty"
          "SUPER, B, exec, waypaper"
          "SUPER, Q, killactive"
          "SUPER, Space, exec, wofi --show drun"

          "SUPER, P, pseudo,"
          "SUPER, F, togglefloating,"

          "SUPER, H, movefocus, l"
          "SUPER, J, movefocus, d"
          "SUPER, K, movefocus, u"
          "SUPER, L, movefocus, r"

          "SUPER Shift, H, swapwindow, l"
          "SUPER Shift, J, swapwindow, d"
          "SUPER Shift, K, swapwindow, u"
          "SUPER Shift, L, swapwindow, r"

          ", Print, exec, ${print}/bin/print"
        ]
        ++ workspacebinds;

      general = {
        gaps_in = 10;
        gaps_out = 20;

        border_size = 0;

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 8;

        active_opacity = 0.9;
        inactive_opacity = 0.9;

        blur = {
          enabled = true;
          size = 5;
          passes = 2;

          vibrancy = 0.2604;
        };
      };

      animations = {
        enabled = "yes, please :)";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = false;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "br";
        kb_variant = "abnt2";

        follow_mouse = 1;

        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      windowrule = [
        "float, title:Waypaper"
      ];

      env = [
        "HYPRCURSOR_THEME, ${config.stylix.cursor.name}"
        "HYPRCURSOR_SIZE, ${builtins.toString config.stylix.cursor.size}"
      ];
    };
  };
}
