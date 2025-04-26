{
  programs.waybar = {
    enable = true;

    settings = {
      defaultBar = {
        layer = "top";
        position = "top";
        mode = "dock";
        reload_style_on_change = true;
        gtk-layer-shell = true;

        modules-left = [
          "custom/ws"
          "custom/left1"

          "hyprland/workspaces"
          "custom/right1"

          "custom/paddw"
          "hyprland/window"
        ];

        modules-center = [
          "custom/paddc"
          "custom/left2"
          "custom/cpuinfo"

          "custom/left3"
          "memory"

          "custom/left4"
          "cpu"
          "custom/leftin1"

          "custom/left5"
          "custom/distro"
          "custom/right2"

          "custom/rightin1"
          "idle_inhibitor"
          "clock#time"
          "custom/right3"

          "clock#date"
          "custom/right4"

          "custom/wifi"
          "bluetooth"
          "custom/update"
          "custom/right5"
        ];

        modules-right = [
          "mpris"

          "custom/left6"
          "pulseaudio"

          "custom/left7"
          "backlight"

          "custom/left8"
          "battery"

          "custom/leftin2"
          "custom/power"
        ];

        "custom/ws" = {
          format = " 󰍜 ";
          min-length = 3;
          max-length = 3;
        };

        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace -1";
          on-scroll-down = "hyprctl dispatch workspace +1";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        "hyprland/window" = {
          format = "{}";
          tooltip = false;
          min-length = 5;

          rewrite = {
            "" = "<span foreground='#8aadf4'> </span> Hyprland";

            "~" = "  Terminal";
            "nu" = "  Terminal";
            "kitty" = "  Terminal";

            "tmux(.*)" = "<span foreground='#a6e3a1'> </span> Tmux";

            "(.*)Mozilla Firefox" = "<span foreground='#ed8796'>󰈹 </span> Firefox";
            "(.*) — Mozilla Firefox" = "<span foreground='#ed8796'>󰈹 </span> $1";

            "(.*)Zen Browser" = "<span foreground='#f5a97f'>󰺕 </span> Zen Browser";
            "(.*) — Zen Browser" = "<span foreground='#f5a97f'>󰺕 </span> $1";

            "(.*) - Visual Studio Code" = "<span foreground='#8aadf4'>󰨞 </span> $1";
            "(.*)Visual Studio Code" = "<span foreground='#8aadf4'>󰨞 </span> Visual Studio Code";

            "nvim" = "<span foreground='#a6da95'> </span> Neovim";
            "nvim (.*)" = "<span foreground='#a6da95'> </span> $1";

            "vim" = "<span foreground='#a6da95'> </span> Vim";
            "vim (.*)" = "<span foreground='#a6da95'> </span> $1";

            "(.*)Spotify" = "<span foreground='#a6da95'> </span> Spotify";
            "(.*)Spotify Premium" = "<span foreground='#a6da95'> </span> Spotify Premium";

            "OBS(.*)" = "<span foreground='#a5adcb'> </span> OBS Studio";

            "VLC media player" = "<span foreground='#f5a97f'>󰕼 </span> VLC Media Player";
            "(.*) - VLC media player" = "<span foreground='#f5a97f'>󰕼 </span> $1";

            "(.*) - mpv" = "<span foreground='#c6a0f6'> </span> $1";

            "qView" = "  qView";

            "(.*).jpg" = "  $1.jpg";
            "(.*).png" = "  $1.png";
            "(.*).svg" = "  $1.svg";

            "vesktop" = "<span foreground='#8aadf4'> </span> Discord";

            "• Discord(.*)" = "Discord$1";
            "(.*)Discord(.*)" = "<span foreground='#8aadf4'> </span> $1Discord$2";

            "ONLYOFFICE Desktop Editors" = "<span foreground='#ed8796'> </span> OnlyOffice Desktop";

            "(.*).docx" = "<span foreground='#8aadf4'> </span> $1.docx";
            "(.*).xlsx" = "<span foreground='#a6da95'> </span> $1.xlsx";
            "(.*).pptx" = "<span foreground='#f5a97f'> </span> $1.pptx";
            "(.*).pdf" = "<span foreground='#ed8796'> </span> $1.pdf";
            "Authenticate" = "  Authenticate";
          };
        };

        "custom/cpuinfo" = {
          exec = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/cpu-temp.sh";
          return-type = "json";
          format = "{}";
          interval = 5;
          min-length = 8;
          max-length = 8;
        };

        memory = {
          states = {
            warning = 75;
            critical = 90;
          };

          format = "󰘚 {percentage}%";
          format-critical = "󰀦 {percentage}%";
          tooltip = false;
          interval = 5;
          min-length = 7;
          max-length = 7;
        };

        cpu = {
          format = "󰻠 {usage}%";
          tooltip = false;
          interval = 5;
          min-length = 6;
          max-length = 6;
        };

        "custom/distro" = {
          format = " ";
          tooltip = false;
          on-click = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/window.sh";
        };

        idle_inhibitor = {
          format = "{icon}";

          format-icons = {
            activated = "󰈈 ";
            deactivated = "󰈉 ";
          };

          tooltip-format-activated = "Presentation Mode";
          tooltip-format-deactivated = "Idle Mode";
          start-activated = false;
        };

        "clock#time" = {
          format = "{:%H:%M}";
          tooltip = false;
          min-length = 6;
          max-length = 6;
        };

        "clock#date" = {
          format = "󰨳 {:%m-%d}";
          tooltip-format = "<tt>{calendar}</tt>";

          calendar = {
            mode = "month";
            mode-mon-col = 6;
            on-click-right = "mode";

            format = {
              months = "<span color='#b7bdf8'><b>{}</b></span>";
              weekdays = "<span color='#a5adcb' font='7'>{}</span>";
              today = "<span color='#ed8796'><b>{}</b></span>";
            };
          };

          actions = {
            on-click = "mode";
            on-click-right = "mode";
          };

          min-length = 8;
          max-length = 8;
        };

        "custom/wifi" = {
          exec = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/wifi-status.sh";
          return-type = "json";
          format = "{}";
          on-click = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/wifi-menu.sh";
          on-click-right = "kitty --title '󰤨  Network Manager TUI' bash -c nmtui";
          interval = 1;
          min-length = 1;
          max-length = 1;
        };

        bluetooth = {
          format = "󰂰";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          format-connected-battery = "󰂱";

          tooltip-format = "{num_connections} connected";
          tooltip-format-disabled = "Bluetooth Disabled";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          tooltip-format-enumerate-connected-battery = ":: {device_alias}: 󱊣 {device_battery_percentage}%";

          on-click = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/bluetooth-menu.sh";
          on-click-right = "kitty --title '󰂯  Bluetooth TUI' bash -c bluetui";
          interval = 1;
          min-length = 1;
          max-length = 1;
        };

        "custom/update" = {
          exec = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/system-update.sh";
          return-type = "json";
          format = "{}";
          on-click = "hyprctl dispatch exec '~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/system-update.sh up'";
          interval = 30;
          min-length = 1;
          max-length = 1;
        };

        mpris = {
          format = "{player_icon} {title} - {artist}";
          format-paused = "{status_icon} {title} - {artist}";

          player-icons = {
            default = "󰝚 ";
            spotify = "<span foreground='#a6da95'>󰓇 </span>";
            firefox = "<span foreground='#ed8796'>󰗃 </span>";
          };
          status-icons = {
            paused = "<span color='#b7bdf8'>\u200A\u200A󰏤\u2009\u2009</span>";
          };

          tooltip-format = "Playing: {title} - {artist}";
          tooltip-format-paused = "Paused: {title} - {artist}";
          min-length = 5;
          max-length = 35;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";

          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
            headphone = "󰋋";
            headset = "󰋋";
          };

          tooltip-format = "Device: {desc}";
          on-click = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/volume-control.sh -o m";
          on-scroll-up = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/volume-control.sh -o i";
          on-scroll-down = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/volume-control.sh -o d";
          min-length = 6;
          max-length = 6;
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          tooltip = false;
          on-scroll-up = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/brightness-control.sh -o i";
          on-scroll-down = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/brightness-control.sh -o d";
          min-length = 6;
          max-length = 6;
        };

        battery = {
          states = {
            warning = 20;
            critical = 10;
          };

          format = "{icon} {capacity}%";
          format-icons = ["󰂎" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-charging = " {capacity}%";

          tooltip-format = "Discharging: {time}";
          tooltip-format-charging = "Charging: {time}";
          interval = 1;
          min-length = 6;
          max-length = 6;
        };

        "custom/power" = {
          format = " ";
          tooltip = false;
          on-click = "~/setup/home-manager/hosts/hyprland/modules/scripts/waybar/power-menu.sh";
        };

        "custom/paddw" = {
          format = " ";
          tooltip = false;
        };

        "custom/paddc" = {
          format = " ";
          tooltip = false;
        };

        "custom/left1" = {
          format = "";
          tooltip = false;
        };
        "custom/left2" = {
          format = "";
          tooltip = false;
        };
        "custom/left3" = {
          format = "";
          tooltip = false;
        };
        "custom/left4" = {
          format = "";
          tooltip = false;
        };
        "custom/left5" = {
          format = "";
          tooltip = false;
        };
        "custom/left6" = {
          format = "";
          tooltip = false;
        };
        "custom/left7" = {
          format = "";
          tooltip = false;
        };
        "custom/left8" = {
          format = "";
          tooltip = false;
        };

        "custom/right1" = {
          format = "";
          tooltip = false;
        };
        "custom/right2" = {
          format = "";
          tooltip = false;
        };
        "custom/right3" = {
          format = "";
          tooltip = false;
        };
        "custom/right4" = {
          format = "";
          tooltip = false;
        };
        "custom/right5" = {
          format = "";
          tooltip = false;
        };

        "custom/leftin1" = {
          format = "";
          tooltip = false;
        };
        "custom/leftin2" = {
          format = "";
          tooltip = false;
        };

        "custom/rightin1" = {
          format = "";
          tooltip = false;
        };
      };
    };

    style = ''
      /* Catppuccin Macchiato */

      @define-color rosewater       #f4dbd6;
      @define-color flamingo        #f0c6c6;
      @define-color pink            #f5bde6;
      @define-color mauve           #c6a0f6;
      @define-color red             #ed8796;
      @define-color maroon          #ee99a0;
      @define-color peach           #f5a97f;
      @define-color yellow          #eed49f;
      @define-color green           #a6da95;
      @define-color teal            #8bd5ca;
      @define-color sky             #91d7e3;
      @define-color sapphire        #7dc4e4;
      @define-color blue            #8aadf4;
      @define-color lavender        #b7bdf8;
      @define-color text            #cad3f5;
      @define-color subtext1        #b8c0e0;
      @define-color subtext0        #a5adcb;
      @define-color overlay2        #939ab7;
      @define-color overlay1        #8087a2;
      @define-color overlay0        #6e738d;
      @define-color surface2        #5b6078;
      @define-color surface1        #494d64;
      @define-color surface0        #363a4f;
      @define-color base            #24273a;
      @define-color mantle          #1e2030;
      @define-color crust           #181926;

      @define-color white           #ffffff;
      @define-color black           #000000;

      /*
        bg - background
        fg - foreground
        br - border
      */

      /* Main Colors */

      @define-color shadow          shade(@crust, 0.5);
      @define-color main-fg         @text;
      @define-color main-bg         @crust;
      @define-color main-br         @text;

      @define-color active-bg       @overlay2;
      @define-color active-fg       @crust;

      @define-color hover-bg        @surface0;
      @define-color hover-fg        alpha(@text, 0.75);

      /* Module Colors */

      @define-color module-fg       @text;
      @define-color workspaces      @mantle;

      @define-color cpuinfo         @mantle;
      @define-color memory          @base;
      @define-color cpu             @surface0;
      @define-color distro-fg       @black;
      @define-color distro-bg       @overlay2;
      @define-color time            @surface0;
      @define-color date            @base;
      @define-color tray            @mantle;

      @define-color pulseaudio      @mantle;
      @define-color backlight       @base;
      @define-color battery         @surface0;
      @define-color power           @overlay2;

      /* State Colors */

      @define-color warning         @yellow;
      @define-color critical        @red;
      @define-color charging        @text;

      * {
        min-height: 27px;
        border: none;
        margin: 0;
        padding: 0;
      }

      /* ----------------------------------------------------- MAIN BACKGROUND --- */

      window#waybar > box {
        background: @main-bg;
        margin: 2px;
      }

      /* --------------------------------------------------------- DROP SHADOW --- */

      window#waybar {
        background: @shadow;
      }

      /* ------------------------------------------------------------ TOOLTIPS --- */

      tooltip {
        background: @main-bg;
        border: 1.5px solid @main-br;
        border-radius: 8px;
      }

      tooltip label {
        color: @main-fg;
        margin: -1.5px 3px;
      }

      /* ---------------------------------------- WORKSPACE BUTTONS and LABELS --- */

      #workspaces button {
        color: @module-fg;
        border-radius: 8px;
        box-shadow: none;
        margin: 2px 0;
        padding: 0 2px;
        transition: none;
      }

      #workspaces button:hover {
        color: @hover-fg;
        background: @hover-bg;
        text-shadow: none;
      }

      #workspaces button.active {
        color: @active-fg;
        background: @active-bg;
        text-shadow: 0 0 2px rgba(0, 0, 0, 0.6);
        box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.4);
        margin: 2px;
        padding: 0 6px;
      }

      /* ------------------------------------------------------------- GENERAL --- */

      #custom-ws,
      #workspaces,
      #window,
      #custom-cpuinfo,
      #memory,
      #cpu,
      #idle_inhibitor,
      #clock,
      #custom-wifi,
      #bluetooth,
      #custom-update,
      #mpris,
      #pulseaudio,
      #backlight,
      #battery,
      #custom-power {
        opacity: 1;
        color: @module-fg;
        padding: 0 4px;
      }

      #custom-left1,
      #custom-left2,
      #custom-left3,
      #custom-left4,
      #custom-left5,
      #custom-left6,
      #custom-left7,
      #custom-left8 {
        margin-bottom: 0;
        text-shadow: -2px 0 2px rgba(0, 0, 0, 0.5);
      }

      #custom-right1,
      #custom-right2,
      #custom-right3,
      #custom-right4,
      #custom-right5 {
        margin-bottom: 0;
        padding-right: 3px;
        text-shadow: 2px 0 2px rgba(0, 0, 0, 0.5);
      }

      /* ------------------------------------------------------------- MODULES --- */

      /* --------------------------------------------------------- window icon --- */

      #custom-ws {
        background: @main-bg;
      }

      #custom-ws:hover {
        color: @hover-fg;
      }

      /* ---------------------------------------------------------- workspaces --- */

      #custom-left1 {
        color: @workspaces;
        background: @main-bg;
        margin-bottom: 0;
        padding-left: 2px;
      }

      #workspaces {
        background: @workspaces;
      }

      #custom-right1 {
        color: @workspaces;
        background: @main-bg;
        text-shadow: 3px 0 2px rgba(0, 0, 0, 0.4);
        margin-bottom: 0;
      }

      /* --------------------------------------------------------- temperature --- */

      #custom-paddc {
        padding-right: 22px;
      }

      #custom-left2 {
        color: @cpuinfo;
        background: @main-bg;
        padding-left: 3px;
      }

      #custom-cpuinfo {
        background: @cpuinfo;
        padding: 0 0 0 1px;
      }

      /* -------------------------------------------------------------- memory --- */

      #custom-left3 {
        color: @memory;
        background: @cpuinfo;
        padding-left: 3px;
      }

      #memory {
        background: @memory;
        padding: 0 0 0 1px;
      }

      #memory.warning {
        color: @warning;
      }

      #memory.critical {
        color: @critical;
      }

      /* ----------------------------------------------------------------- cpu --- */

      #custom-left4 {
        color: @cpu;
        background: @memory;
        padding-left: 3px;
      }

      #cpu {
        background: @cpu;
      }

      #custom-leftin1 {
        color: @cpu;
        margin-bottom: -1px;
      }

      /* --------------------------------------------------------- distro icon --- */

      #custom-left5 {
        color: @distro-bg;
        background: @main-bg;
        text-shadow: none;
        margin-bottom: -2px;
        padding-left: 3px;
      }

      #custom-distro {
        color: @distro-fg;
        background: @distro-bg;
        margin: 0 -1px -2px 0;
        padding: 0 0 0 3px;
        text-shadow: 0 0 1.5px rgba(0, 0, 0, 1);
      }

      #custom-right2 {
        color: @distro-bg;
        background: @main-bg;
        text-shadow: none;
        margin-bottom: -2px;
      }

      /* ---------------------------------------------------------------- time --- */

      #custom-rightin1 {
        color: @time;
        margin-bottom: -1px;
      }

      #idle_inhibitor {
        background: @time;
        padding: 0 0 0 7px;
      }

      #idle_inhibitor:hover {
        color: @hover-fg;
      }

      #clock.time {
        background: @time;
        margin-left: -2px;
        padding: 0 3px 0 0;
      }

      #custom-right3 {
        color: @time;
        background: @date;
      }

      /* ---------------------------------------------------------------- date --- */

      #clock.date {
        background: @date;
      }

      #clock.date:hover {
        color: @hover-fg;
      }

      #custom-right4 {
        color: @date;
        background: @tray;
      }

      /* ---------------------------------------------------------------- tray --- */

      #custom-wifi {
        background: @tray;
        padding: 0 8px 0 5px;
      }

      #custom-wifi:hover {
        color: @hover-fg;
      }

      #bluetooth {
        background: @tray;
        padding-right: 5px;
      }

      #bluetooth:hover {
        color: @hover-fg;
      }

      #custom-update {
        padding-right: 8px;
        background: @tray;
      }

      #custom-update:hover {
        color: @hover-fg;
      }

      #custom-right5 {
        color: @tray;
        background: @main-bg;
      }

      /* ---------------------------------------------------------- media info --- */

      #mpris {
        background: @main-bg;
        padding: 0 8px 0;
      }

      #mpris:hover {
        color: @hover-fg;
      }

      /*
          output device
      */

      #custom-left6 {
        color: @pulseaudio;
        background: @main-bg;
        padding-left: 3px;
      }

      #pulseaudio {
        background: @pulseaudio;
      }

      #pulseaudio:hover {
        color: @hover-fg;
      }

      /* ---------------------------------------------------------- brightness --- */

      #custom-left7 {
        color: @backlight;
        background: @pulseaudio;
        padding-left: 2px;
      }

      #backlight {
        background: @backlight;
      }

      /* ------------------------------------------------------------- battery --- */

      #custom-left8 {
        color: @battery;
        background: @backlight;
        padding-left: 2px;
      }

      #battery {
        color: @module-fg;
        background: @battery;
      }

      #battery.warning {
        color: @warning;
      }

      #battery.critical {
        color: @critical;
      }

      #battery.charging {
        color: @charging;
      }

      /* -------------------------------------------------------- power button --- */

      #custom-leftin2 {
        color: @battery;
        background: @main-bg;
        margin-bottom: -1px;
      }

      #custom-power {
        color: @main-bg;
        background: @power;
        text-shadow: 0 0 2px rgba(0, 0, 0, 0.6);
        box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.6);
        border-radius: 10px;
        margin: 2px 4px 2px 0;
        padding: 0 6px 0 9px;
      }

      #custom-power:hover {
        color: @hover-fg;
        background: @hover-bg;
        text-shadow: none;
        box-shadow: none;
      }

      /* ---------------------------------------------------------- FONT SIZES --- */

      /*
          NOTE: Be careful when changing font sizes, as they
          can affect alignment.

          Try adjusting whole numbers first, then refine with
          decimals.

          If you increase or decrease a value, make the same
          change to all properties in this section to keep
          the layout consistent.
      */

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
        font-weight: bold;
      }

      tooltip label,
      #window label,
      #mpris {
        font-weight: normal;
      }

      /* ----------------------------------------------- left and right arrows --- */

      #custom-left1,
      #custom-left2,
      #custom-left3,
      #custom-left4,
      #custom-left5,
      #custom-left6,
      #custom-left7,
      #custom-left8,
      #custom-right1,
      #custom-right2,
      #custom-right3,
      #custom-right4,
      #custom-right5 {
        font-size: 14.68px;
      }

      /* ---------------------------------------------- left and right inverse --- */

      #custom-leftin1,
      #custom-leftin2,
      #custom-rightin1 {
        font-size: 15.5px;
      }

      /* -------------------------------------------------------------- distro --- */

      #custom-distro {
        font-size: 14.6px;
      }

      #custom-left5,
      #custom-right2 {
        font-size: 15.68px;
      }

      /*
          Adjust these properties as well to keep the design
          consistent.
      */

      #workspaces button {
        border-radius: 8px;
        padding: 0 2px;
      }

      #workspaces button.active {
        padding: 0 6px;
      }

      #custom-power {
        border-radius: 10px;
        padding: 0 6px 0 9px;
      }
    '';
  };
}
