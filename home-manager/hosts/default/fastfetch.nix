{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        #source = "~/.config/system/home-manager/hosts/images/NixOS-Fastfetch.png";

        width = 30;
        height = 12;
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator = "  ";
      };
      modules = [
        {
          type = "datetime";
          key = "Date";
          format = "{1}-{3}-{11}";
        }
        {
          type = "datetime";
          key = "Time";
          format = "{14}:{17}:{20}";
        }
        "break"
        "player"
        "media"
      ];
    };
  };
}
