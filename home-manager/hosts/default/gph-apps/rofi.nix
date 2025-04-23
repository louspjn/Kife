{
  xdg.configFile = {
    "rofi/theme.rasi".text = ''
      /* Catppuccin Macchiato */

      * {
        rosewater:      #f4dbd6;
        flamingo:       #f0c6c6;
        pink:           #f5bde6;
        mauve:          #c6a0f6;
        red:            #ed8796;
        maroon:         #ee99a0;
        peach:          #f5a97f;
        yellow:         #eed49f;
        green:          #a6da95;
        teal:           #8bd5ca;
        sky:            #91d7e3;
        sapphire:       #7dc4e4;
        blue:           #8aadf4;
        lavender:       #b7bdf8;
        text:           #cad3f5;
        subtext1:       #b8c0e0;
        subtext0:       #a5adcb;
        overlay2:       #939ab7;
        overlay1:       #8087a2;
        overlay0:       #6e738d;
        surface2:       #5b6078;
        surface1:       #494d64;
        surface0:       #363a4f;
        base:           #24273a;
        mantle:         #1e2030;
        crust:          #181926;
      }

      /*
        bg - background
        fg - foreground
        br - border
      */

      * {
        main-bg:        @crust;
        main-fg:        @text;
        main-br:        @overlay2;
        input-bg:       @mantle;
        select-bg:      @overlay2;
        select-fg:      @crust;
      }
    '';

    "rofi/bluetooth-menu.rasi".text = ''
      /* Bluetooth menu */

      @theme "~/.config/rofi/theme.rasi"

      configuration {
        font:                     "JetBrainsMono Nerd Font 8";
      }

      /* Window */

      window {
        location:                 north;
        anchor:                   south;
        y-offset:                 3px;
        width:                    240px;
        border:                   3px;
        border-radius:            10px;
        border-color:             @main-br;
        background-color:         @main-bg;
        children:                 [ mainbox ];
      }

      mainbox {
        spacing:                  0;
        background-color:         @main-br;
        text-color:               @main-fg;
        children:                 [ textbox-custom, listview, inputbar ];
      }

      textbox-custom {
        font:                     "JetBrainsMono Nerd Font Bold 8";
        horizontal-align:         0.5;
        padding:                  1px 0;
        expand:                   false;
        background-color:         @select-bg;
        text-color:               @select-fg;
        expand:                   false;
        content:                  "󰂴  Bluetooth";
      }

      /* Input */

      inputbar {
        margin:                   -32px 6px 6px;
        border-radius:            6px;
        spacing:                  inherit;
        background-color:         @input-bg;
        text-color:               inherit;
        children:                 [ prompt, entry ];
      }
      prompt {
        padding:                  6px 6px 6px 12px;
        background-color:         inherit;
        text-color:               inherit;
      }
      entry {
        placeholder:              "Search";
        padding:                  6px 0;
        cursor:                   text;
        background-color:         inherit;
        text-color:               inherit;
      }

      /* List */

      listview {
        border:                   2px 0 0 0;
        border-radius:            8px;
        border-color:             @main-br;
        lines:                    6;
        fixed-height:             false;
        dynamic:                  false;
        cycle:                    false;
        margin:                   0 0 -2px;
        padding:                  6px 6px 40px;
        background-color:         @main-bg;
      }

      element {
        padding:                  6px;
        cursor:                   pointer;
        background-color:         inherit;
        text-color:               @main-fg;
      }
      element selected active,
      element selected normal {
        border-radius:            6px;
        background-color:         @select-bg;
        text-color:               @select-fg;
      }
      element-text {
        padding:                  0 6px;
        cursor:                   inherit;
        background-color:         inherit;
        text-color:               inherit;
      }
    '';

    "rofi/power-menu.rasi".text = ''
      /* Power menu */

      @theme "~/.config/rofi/theme.rasi"

      configuration {
        font:                     "JetBrainsMono Nerd Font 8";
      }

      /* Window */

      window {
        location:                 center;
        anchor:                   center;
        x-offset:                 -3px;
        y-offset:                 3px;
        width:                    150px;
        border:                   3px;
        border-radius:            10px;
        border-color:             @main-br;
        background-color:         @main-bg;
        children:                 [ mainbox ];
      }

      mainbox {
        spacing:                  0;
        background-color:         @main-br;
        text-color:               @main-fg;
        children:                 [ textbox-custom, listview ];
      }

      textbox-custom {
        font:                     "JetBrainsMono Nerd Font Bold 8";
        horizontal-align:         0.5;
        padding:                  1px 0;
        expand:                   false;
        background-color:         @select-bg;
        text-color:               @select-fg;
        expand:                   false;
        content:                  "  Power";
      }

      /* List */

      listview {
        border:                   2px 0 0 0;
        border-radius:            8px;
        border-color:             @main-br;
        lines:                    6;
        padding:                  6px;
        background-color:         @main-bg;
      }

      element {
        padding:                  6px;
        cursor:                   pointer;
        background-color:         inherit;
        text-color:               @main-fg;
      }
      element selected.normal {
        border-radius:            6px;
        background-color:         @select-bg;
        text-color:               @select-fg;
      }
      element-text {
        padding:                  0 6px;
        cursor:                   inherit;
        background-color:         inherit;
        text-color:               inherit;
      }
    '';

    "rofi/wifi-menu.rasi".text = ''
      /* WiFi menu */

      @theme "~/.config/rofi/theme.rasi"

      configuration {
        font:                     "JetBrainsMono Nerd Font 8";
      }

      /* Window */

      window {
        location:                 center;
        anchor:                   center;
        y-offset:                 3px;
        width:                    240px;
        border:                   3px;
        border-radius:            10px;
        border-color:             @main-br;
        background-color:         @main-bg;
        children:                 [ mainbox ];
      }

      mainbox {
        spacing:                  0;
        background-color:         @main-br;
        text-color:               @main-fg;
        children:                 [ textbox-custom, listview, inputbar ];
      }

      textbox-custom {
        font:                     "JetBrainsMono Nerd Font Bold 8";
        horizontal-align:         0.5;
        padding:                  1px 0;
        expand:                   false;
        background-color:         @select-bg;
        text-color:               @select-fg;
        expand:                   false;
        content:                  "󰖩  Wi-Fi";
      }

      /* Input */

      inputbar {
        margin:                   -32px 6px 6px;
        border-radius:            6px;
        spacing:                  inherit;
        background-color:         @input-bg;
        text-color:               inherit;
        children:                 [ prompt, entry ];
      }
      prompt {
        padding:                  6px 6px 6px 12px;
        background-color:         inherit;
        text-color:               inherit;
      }
      entry {
        placeholder:              "Search";
        padding:                  6px 0;
        cursor:                   text;
        background-color:         inherit;
        text-color:               inherit;
      }

      /* List */

      listview {
        border:                   2px 0 0 0;
        border-radius:            8px;
        border-color:             @main-br;
        lines:                    6;
        fixed-height:             false;
        dynamic:                  false;
        cycle:                    false;
        margin:                   0 0 -2px;
        padding:                  6px 6px 40px;
        background-color:         @main-bg;
      }

      element {
        padding:                  6px;
        cursor:                   pointer;
        background-color:         inherit;
        text-color:               @main-fg;
      }
      element selected active,
      element selected normal {
        border-radius:            6px;
        background-color:         @select-bg;
        text-color:               @select-fg;
      }
      element-text {
        padding:                  0 6px;
        cursor:                   inherit;
        background-color:         inherit;
        text-color:               inherit;
      }
    '';

    "rofi/window.rasi".text = ''
      /* Window menu */

      @theme "~/.config/rofi/theme.rasi"

      configuration {
        font:                     "JetBrainsMono Nerd Font 9.5";
      }

      /* Window */

      window {
        location:                 center;
        anchor:                   center;
        y-offset:                 3px;
        width:                    240px;
        border:                   3px;
        border-radius:            10px;
        border-color:             @main-br;
        background-color:         @main-bg;
        children:                 [ mainbox ];
      }

      mainbox {
        spacing:                  0;
        background-color:         @main-br;
        text-color:               @main-fg;
        children:                 [ textbox-custom, listview, inputbar ];
      }

      textbox-custom {
        font:                     "JetBrainsMono Nerd Font Bold 9.5";
        horizontal-align:         0.5;
        padding:                  1px 0;
        expand:                   false;
        background-color:         @select-bg;
        text-color:               @select-fg;
        expand:                   false;
        content:                  "  Launch";
      }

      /* Input */

      inputbar {
        margin:                   -32px 6px 6px;
        border-radius:            6px;
        spacing:                  inherit;
        background-color:         @input-bg;
        text-color:               inherit;
        children:                 [ prompt, entry ];
      }
      prompt {
        padding:                  6px 6px 6px 12px;
        background-color:         inherit;
        text-color:               inherit;
      }
      entry {
        placeholder:              "Search";
        padding:                  6px 0;
        cursor:                   text;
        background-color:         inherit;
        text-color:               inherit;
      }

      /* List */

      listview {
        border:                   2px 0 0 0;
        border-radius:            8px;
        border-color:             @main-br;
        lines:                    6;
        fixed-height:             false;
        dynamic:                  false;
        cycle:                    false;
        margin:                   0 0 -2px;
        padding:                  6px 6px 40px;
        background-color:         @main-bg;
      }

      element {
        padding:                  6px;
        cursor:                   pointer;
        background-color:         inherit;
        text-color:               @main-fg;
      }
      element selected active,
      element selected normal {
        border-radius:            6px;
        background-color:         @select-bg;
        text-color:               @select-fg;
      }
      element-text {
        padding:                  0 6px;
        cursor:                   inherit;
        background-color:         inherit;
        text-color:               inherit;
      }
    '';
  };
}
