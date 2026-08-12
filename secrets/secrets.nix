let
  mushroom-nixfx = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7ExyVU1Cg47jCjSy/YdanXqitFSb+e462m6yBWRT2R mushroom@nixfx";
  mushroom-mushroom-machine = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/db7MER7cs7Ic6Frkn9BAgmzCed2CSHlXmvzlvFjpj mushroom@nixfx";
  users = [mushroom-nixfx mushroom-mushroom-machine];
in {
  "syncthingPassword.age".publicKeys = users;
}
