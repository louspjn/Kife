{
  programs.waybar = {
    enable = true;

    settings.main = {
      layer = "top";
      position = "top";

      height = 30;
      margin = "14px 14px 0px 14px";

      modules-left = ["custom/logo" "hyprland/window"];
      modules-center = ["hyprland/workspaces"];
      modules-right = ["network" "clock" "battery"];

      "custom/logo" = {
        format = " ";
        on-click = "hyprlock";
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

      "network" = {
        format-wifi = " ";
        format-disconnected = " ";

        tooltip-format-wifi = "{essid} ({signalStrength}%)  ";
        tooltip-format-disconnected = "Disconnected  ";
      };

      "clock" = {
        format = "{:%I:%M %p}";
        interval = 5;
        tooltip-format = "<tt>{calendar}</tt>";
        calendar = {
          format = {
            today = "<span><b>{}</b></span>";
          };
        };
      };

      "battery" = {
        interval = 30;

        states = {
          "good" = 75;
          "warning" = 10;
          "critical" = 5;
        };

        format = "{capacity}% {icon}";
        format-charging = "{capacity}% 󰂄";
        format-plugged = "{capacity}% 󰂄";
        format-alt = "{time} {icon}";
        format-icons = [
          "󰁻"
          "󰁼"
          "󰁾"
          "󰂀"
          "󰂂"
          "󰁹"
        ];
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;

        padding: 2px 3px;

        font-weight: 600;
      }

      window#waybar {
        border-radius: 100px;
      }

      #workspaces button {
        border-radius: 6px;
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
      }

      #clock {
        margin: 0px 8px;
      }

      #custom-logo {
        margin-left: 10px;
      }

      #battery {
        margin-right: 10px;
      }
    '';
  };
}
