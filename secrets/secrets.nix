let
  mushroom-nixfx = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7ExyVU1Cg47jCjSy/YdanXqitFSb+e462m6yBWRT2R mushroom@nixfx";
  mushroom-mushroom-machine = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDZhiA6zP7O/C+Zhis4QYRBZ2l9Ig7MQ0900G1CnelAL mushroom@mushroom-machine";
  users = [mushroom-nixfx mushroom-mushroom-machine];
in {
  "syncthingPassword.age".publicKeys = users;
}
