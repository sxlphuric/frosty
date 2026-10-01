{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    airtame
  ];
}
