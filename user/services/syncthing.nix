{config,...}: {
  age.secrets.syncthing.file = ../../secrets/syncthingPassword.age;
  services.syncthing = {
    enable = true;
    guiCredentials = {
      username = "syncthing";
      passwordFile = config.age.secrets.syncthing.path;
    };
    tray.enable = true;
  };
}
