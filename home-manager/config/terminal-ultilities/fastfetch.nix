{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "~/setup/home-manager/hosts/images/NixOS-Fastfetch.png";

        width = 30;
        height = 12;
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        separator = "    ";
      };
      modules = [
        {
          type = "custom";
          format = "┌─────────────────Sofware Info──────────────────┐";
        }

        {
          type = "os";
          key = "  ";
        }

        {
          type = "command";
          text = "whoami";
          format = "{1} - Jhuan";
          key = "  ";
        }

        {
          type = "wm";
          key = "  ";
        }

        {
          type = "shell";
          key = "  ";
        }

        {
          type = "terminal";
          key = "  ";
        }

        {
          type = "terminalfont";
          key = "  ";
        }

        {
          type = "packages";
          key = "  ";
        }

        {
          type = "custom";
          format = "├─────────────────Hardware Info─────────────────┤";
        }

        {
          type = "battery";
          key = "  ";
        }

        {
          type = "cpu";
          key = "  ";
        }

        {
          type = "physicalmemory";
          key = "  ";
        }

        {
          type = "custom";
          format = "└───────────────────────────────────────────────┘";
        }

        {
          type = "colors";
          paddingLeft = 16;
          symbol = "circle";
        }
      ];
    };
  };
}
