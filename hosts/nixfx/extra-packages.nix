{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kdiskmark
    kdePackages.keysmith
  ];
}
