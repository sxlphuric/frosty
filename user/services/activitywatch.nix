{
  pkgs,
  lib,
  ...
}: {
  systemd.user.services.aw-server-rust = {
    Unit = {
      Description = "activitywatch server";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = [(lib.getExe pkgs.aw-server-rust)];
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };

  systemd.user.services.awatcher = {
    Unit = {
      Description = "awatcher for activitywatch";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target" "aw-server-rust.service"];
      Requires = ["aw-server-rust.service"];
    };
    Service = {
      ExecStart = [(lib.getExe pkgs.awatcher)];
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
