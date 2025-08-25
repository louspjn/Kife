{
  config,
  pkgs,
  ...
}: let
  workspaceBinds = num:
    builtins.concatLists (
      builtins.genList (
        wsnumber: let
          ws = wsnumber + 1;
        in [
          "SUPER, code:1${toString wsnumber}, workspace, ${toString ws}"
          "SUPER Shift, code:1${toString wsnumber}, movetoworkspace, ${toString ws}"
        ]
      )
      num
    );

  generateBindsFromList = {
    mod,
    cmd,
    opts,
  }:
    map (
      bind: "${mod}, ${builtins.elemAt bind 0}, ${cmd}, ${builtins.elemAt bind 1}"
    )
    opts;

  resizeactive = opts:
    generateBindsFromList {
      mod = "ALT";
      cmd = "resizeactive";
      opts = opts;
    };

  swapwindow = opts:
    generateBindsFromList {
      mod = "SUPER Shift";
      cmd = "swapwindow";
      opts = opts;
    };

  exec = opts:
    generateBindsFromList {
      mod = "SUPER";
      cmd = "exec";
      opts = opts;
    };

  movefocus = opts:
    generateBindsFromList {
      mod = "SUPER";
      cmd = "movefocus";
      opts = opts;
    };

  dir = "~/Images/Screenshots/";
  screenshotname = "$(date +%Y-%m-%d_%H-%M-%S).png";
  grimblast = "${pkgs.grimblast}/bin/grimblast";
  print = pkgs.writeShellScriptBin "print" "mkdir ${dir}; ${grimblast} copysave area ${dir}${screenshotname}";
in {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec = [
        "waypaper --folder ~/Alix/assets/wallpapers --restore"
        "pkill waybar; waybar"
      ];

      monitor = [
        "eDP-1, preferred, 1920x0, 1"
        "HDMI-A-1, 1920x1080, 0x0, 1"
      ];

      binde = resizeactive [
        ["H" "-20 0"]
        ["J" "0 20"]
        ["K" "0 -20"]
        ["L" "20 0"]
      ];

      bind = builtins.concatLists [
        [
          "SUPER, Q, killactive"
          "SUPER, P, pseudo,"
          "SUPER, F, togglefloating,"
          ", Print, exec, ${print}/bin/print"
        ]
        (exec [
          ["Return" "alacritty"]
          ["E" "nautilus"]
          ["B" "waypaper"]
          ["Space" "wofi --show drun"]
          ["T" "hyprlock"]
        ])
        (movefocus [
          ["H" "l"]
          ["J" "d"]
          ["K" "u"]
          ["L" "r"]
        ])
        (swapwindow [
          ["H" "l"]
          ["J" "d"]
          ["K" "u"]
          ["L" "r"]
        ])
        (workspaceBinds 9)
      ];

      general = {
        gaps_in = 10;
        gaps_out = 20;

        border_size = 0;

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = let
        opacity = 0.8;
      in {
        rounding = 8;

        active_opacity = opacity;
        inactive_opacity = opacity;

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
          "linear,0,0,1,1"
          "smoothElastic, 1, -0.3, 0.3, 1.5"
        ];

        animation = [
          "windows, 1, 1.38, easeOutQuint"
          "windowsIn, 1, 3.1, easeOutQuint, gnomed"
          "windowsOut, 1, 1.49, easeOutQuint, gnomed"
          "layersIn, 1, 4, easeOutQuint, gnomed"
          "layersOut, 1, 1.5, linear, gnomed"
          "workspacesIn, 1, 3, smoothElastic, slide"
          "workspacesOut, 1, 3, smoothElastic, slide"
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
        "float, title:Bluetooth Devices"
      ];

      env = let
        cursor = config.stylix.cursor;
      in [
        "HYPRCURSOR_THEME, ${cursor.name}"
        "HYPRCURSOR_SIZE, ${builtins.toString cursor.size}"
      ];
    };
  };
}
