{pkgs, ...}: {
  nixos = "nh os";
  nps = "nh search";

  recorder = "${pkgs.wf-recorder}/bin/wf-recorder";
  print = "${pkgs.grim}/bin/grim -g (${pkgs.slurp}/bin/slurp)";

  l = "ls **/*";
  cd = "z";

  hs = "hx";
  zj = "zellij";
  code = "zellij";
  cat = "${pkgs.bat}/bin/bat";
  read = "cat";

  matrix = "${pkgs.cmatrix}/bin/cmatrix -C blue -m";
}
