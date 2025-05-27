{pkgs, ...}: {
  cat = "${pkgs.bat}/bin/bat";

  # nixos = "nh os";
  # nps = "nh search";
  # ncn = "nh clean";

  recorder = "${pkgs.wf-recorder}/bin/wf-recorder";

  l = "ls **/*";

  matrix = "${pkgs.cmatrix}/bin/cmatrix -C blue -m";

  cd = "z";
}
