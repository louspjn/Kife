{pkgs, ...}: {
  services = {
    displayManager.sddm = {
      enable = true;

      package = pkgs.kdePackages.sddm;

      extraPackages = [pkgs.sddm-astronaut];
      theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
    };

    printing.enable = true;
  };
}
