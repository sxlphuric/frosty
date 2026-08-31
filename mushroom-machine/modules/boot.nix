{
  pkgs,
  lib,
  ...
}: let
  plymouth-theme-chromeos = pkgs.stdenvNoCC.mkDerivation {
    pname = "plymouth-theme-chromeos";
    version = "acf6d2f";

    src = pkgs.fetchFromGitHub {
      owner = "e9x";
      repo = "plymouth-theme-chromeos";
      rev = "acf6d2fcb1b89aeb34d018a4817642dee9c278c5";
      hash = "sha256-7MN5/T8SDzusg+JvP59up+Vbq7/AjoR1dRdxNibXHUM=";
    };

    postPatch = ''
      # Remove not needed files
      rm README.md LICENSE
    '';

    dontBuild = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/plymouth/themes/chromeos
      cp chromeos/* $out/share/plymouth/themes/chromeos
      find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
      runHook postInstall
    '';
  };
in {
  boot = {
    loader = {
      efi.canTouchEfiVariables = false;
      timeout = 0;
      systemd-boot = {
        enable = true;
        edk2-uefi-shell.enable = true;
        editor = false;
        configurationLimit = 50;
      };
    };
    plymouth = {
      theme = "chromeos";
      themePackages = [plymouth-theme-chromeos];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
