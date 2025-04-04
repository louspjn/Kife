self: super: {
  alacritty = super.alacritty.overrideAttrs (prev: {
    src = super.fetchFromGitHub {
      owner = "GregTheMadMonk";
      repo = "alacritty-smooth-cursor";
      rev = "smooth-cursor";
      sha256 = "063nbp1by0db6f0dxgdsdpg0z3m6aq92wg4cp6ds7i0rns564wby";
    };
  });
}
