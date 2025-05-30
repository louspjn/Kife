{pkgs, ...}: {
  cat = "${pkgs.bat}/bin/bat";

  nixos = "nh os";
  nps = "nh search";

  recorder = "${pkgs.wf-recorder}/bin/wf-recorder";

  l = "ls **/*";

  matrix = "${pkgs.cmatrix}/bin/cmatrix -C blue -m";

  cd = "z";
}
