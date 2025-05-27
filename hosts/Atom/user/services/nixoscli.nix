{
  services.nixos-cli = {
    enable = true;

    config = {
      general = {
        config_location = "~/Quantum";
        use_nvd = true;
      };

      apply = {
        ignore_dirty_tree = true;
      };
    };
  };
}
