{
  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      # format: "remote:type/appid/arch/branch:commit"
      # or just "stable" or "master" or.... just look it up (instead of "branch:commit")
      "flathub:app/org.vinegarhq.Sober/x86_64/master"
    ];
  };
}
