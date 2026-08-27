{pkgs, ...}: {
  home.packages = with pkgs; [
    equibop
    osu-lazer-bin
  ];
}
