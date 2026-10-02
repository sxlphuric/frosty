{
  description = "Plymouth theme for ChromeOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    packages =
      builtins.mapAttrs (system: pkgs: {
        plymouth-theme-chromeos = pkgs.stdenvNoCC.mkDerivation {
          pname = "plymouth-theme-chromeos";
          version = "8e274a0";

          src = pkgs.fetchFromGitHub {
            owner = "sxlphuric";
            repo = "plymouth-theme-chromeos";
            rev = "8e274a0f14d15088a0e55004e255b4b1bb270edc";
            hash = "sha256-wQMEwIgYdhCgjphtxpwXMXnYrUUTSTSuoPe9miAexZo=";
          };

          postPatch = ''
            # Remove not needed files
            rm README.md
          '';

          dontBuild = true;

          installPhase = ''
            runHook preInstall
            mkdir -p $out/share/plymouth/themes/chromeos
            cp * $out/share/plymouth/themes/chromeos
            find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
            runHook postInstall
          '';
        };

        default = inputs.self.packages.${system}.plymouth-theme-chromeos;
      })
      inputs.nixpkgs.legacyPackages;
  };
}
