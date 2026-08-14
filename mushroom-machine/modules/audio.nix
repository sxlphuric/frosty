{inputs, pkgs, ...}:{
  environment = {
    systemPackages = [pkgs.sof-firmware];
    sessionVariables.ALSA_CONFIG_UCM2 = "${inputs.cb-ucm-conf-src}/ucm2";
  };
    boot.extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=3
    '';
  services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        extraConfig = {
          "51-increase-headroom" = {
            "monitor.alsa.rules" = [
              {
                matches = [
                  {
                    "node.name" = "alsa_output.*";
                  }
                ];
                actions.update-props."api.alsa.headroom" = "2048";
              }
            ];
          };
        };
      };
    };
}
