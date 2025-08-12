{
  name,
  user,
  keyboard,
  locale,
  wheel,
}:
{
  users.users.${user.name} = {
    isNormalUser = !user.root;
    hashedPassword = user.password;
    description = user.description;
    shell = user.shell;
    extraGroups = [
      "networkmanager"
      wheel
    ]
    ++ user.groups or [ ];
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = locale;

  services.xserver = {
    enable = true;

    xkb = {
      layout = keyboard.layout;
      variant = keyboard.variant;
    };
  };

  console.useXkbConfig = true;

  networking = {
    hostName = name;
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = "25.05";
}
