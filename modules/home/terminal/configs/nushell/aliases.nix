{pkgs, ...}: {
  cat = "${pkgs.bat}/bin/bat";

  nixos = "nh os";
  nps = "nh search";
  ncn = "nh clean";

  recorder = "${pkgs.wf-recorder}/bin/wf-recorder";

  l = "ls **/*";

  cd = "z";
}
