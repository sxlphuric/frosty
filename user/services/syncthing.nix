{config, ...}: {
  age.secrets.syncthing.file = ../../secrets/syncthingPassword.age;
  services.syncthing = {
    # TODO transfer the folder config that is imperatively managed to here
    enable = true;
    guiCredentials = {
      username = "syncthing";
      passwordFile = config.age.secrets.syncthing.path;
    };
    tray.enable = true;
  };
}
