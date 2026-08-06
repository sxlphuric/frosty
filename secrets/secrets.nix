let
  mushroom = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7ExyVU1Cg47jCjSy/YdanXqitFSb+e462m6yBWRT2R mushroom@nixfx";
  users = [mushroom];
in {
  "syncthingPassword.age".publicKeys = [mushroom];
}
