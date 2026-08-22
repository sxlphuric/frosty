{ pkgs, ... }:
{
  systemd.user.services.polkit-mate-authentication-agent-1 = {
    description = "polkit-mate-authentication-agent-1";
    wantedBy = [ "niri.service" ];
    wants = [ "niri.service" ];
    after = [ "niri.service" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
