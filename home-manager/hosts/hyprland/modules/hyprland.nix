{
 #    exec = pkill waybar; waybar & hyprpaper
 #
 #    monitor = eDP-1, preferred, auto, 1
 #    monitor = HDMI-A-1, 1920x1080, 0x0, 1
 #
 #    general {
 #      gaps_in = 5
 #      gaps_out = 15
 #
 #      border_size = 2
 #
 #      col.active_border = rgba(33ccffee)
 #      col.inactive_border = rgba(595959aa)
 #
 #      resize_on_border = false
 #
 #      allow_tearing = false
 #
 #      layout = dwindle
 #    }
 #
 #    decoration {
 #        rounding = 8
 #
 #        active_opacity = 1.0
 #        inactive_opacity = 1.0
 #
 #        shadow {
 #          enabled = true
 #          range = 4
 #          render_power = 3
 #          color = rgba(1a1a1aee)
 #        }
 #
 #        blur {
 #          enabled = true
 #          size = 3
 #          passes = 1
 #
 #          vibrancy = 0.1696
 #        }
 #    }
 #
 #    animations {
 #        enabled = yes, please :)
 #
 #        bezier = easeOutQuint,0.23,1,0.32,1
 #        bezier = easeInOutCubic,0.65,0.05,0.36,1
 #        bezier = linear,0,0,1,1
 #        bezier = almostLinear,0.5,0.5,0.75,1.0
 #        bezier = quick,0.15,0,0.1,1
 #
 #        animation = global, 1, 10, default
 #        animation = border, 1, 5.39, easeOutQuint
 #        animation = windows, 1, 4.79, easeOutQuint
 #        animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
 #        animation = windowsOut, 1, 1.49, linear, popin 87%
 #        animation = fadeIn, 1, 1.73, almostLinear
 #        animation = fadeOut, 1, 1.46, almostLinear
 #        animation = fade, 1, 3.03, quick
 #        animation = layers, 1, 3.81, easeOutQuint
 #        animation = layersIn, 1, 4, easeOutQuint, fade
 #        animation = layersOut, 1, 1.5, linear, fade
 #        animation = fadeLayersIn, 1, 1.79, almostLinear
 #        animation = fadeLayersOut, 1, 1.39, almostLinear
 #        animation = workspaces, 1, 1.94, almostLinear, fade
 #        animation = workspacesIn, 1, 1.21, almostLinear, fade
 #        animation = workspacesOut, 1, 1.94, almostLinear, fade
 #    }
 #
 #    dwindle {
 #        pseudotile = true
 #        preserve_split = true
 #    }
 #
 #    master {
 #        new_status = master
 #    }
 #
 #    misc {
 #        force_default_wallpaper = 0
 #        disable_hyprland_logo = true
 #    }
 #
 #    input {
 #      kb_layout = br
 #      kb_variant = abnt2
 #
 #      follow_mouse = 1
 #
 #      sensitivity = 0
 #
 #      touchpad {
 #        natural_scroll = false
 #      }
 #    }
 #
 #    gestures {
 #      workspace_swipe = false
 #    }
 #
 #    device {
 #        name = epic-mouse-v1
 #        sensitivity = -0.5
 #    }
 #
 #
 #    bindm = $mainMod, mouse:272, movewindow
 #    bindm = $mainMod, mouse:273, resizewindow
 #
 #    bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
 #    bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
 #    bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
 #    bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
 #    bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
 #    bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-
 #
 #    bindl = , XF86AudioNext, exec, playerctl next
 #    bindl = , XF86AudioPause, exec, playerctl play-pause
 #    bindl = , XF86AudioPlay, exec, playerctl play-pause
 #    bindl = , XF86AudioPrev, exec, playerctl previous
 #
 #    windowrulev2 = suppressevent maximize, class:.*
 #    windowrulev2 =  nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0

  wayland.windowManager.hyprland.setings = {
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "wofi --show drun";
    "$mainMod" = "SUPER";
    "$browser" = "firefox";

    bind = [
      "$mainMod, B, exec, $terminal"
      "$mainMod, Q, killactive,"
      "$mainMod+Shift, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, Space, exec, $menu"
      "$mainMod, P, pseudo,"
      "$mainMod, J, togglesplit,"
      "$mainMod, C, exec, $browser"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-"
      "$mainMod, M, exec, wlogout"
      "$mainMod, L, exec, hyprlock"
    ]
      ++ (
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };
}
