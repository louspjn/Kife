{
  wheel,
  user,
  name,
}: {
  users.users.${user.name} = {
    isNormalUser = !user.root;
    hashedPassword = user.password;
    description = user.description;
    shell = user.shell;
    extraGroups =
      [
        "networkmanager"
        wheel
      ]
      ++ user.groups or [];
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";

  services.xserver = {
    enable = true;

    xkb = {
      layout = "br";
      variant = "abnt2";
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
