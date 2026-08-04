{ pkgs, ... }: {
  # Define user accounts. Don't forget to set a password with ‘passwd’.
  users.users =
    let
      makeUser = description: extraGroups: packages: {
        isNormalUser = true;
        description = description;
        extraGroups = (extraGroups ++ [ "networkmanager" ]);
        packages = packages;
        shell = pkgs.zsh;
      };
    in
    {
      "admin" = (makeUser "John Admin" [ "wheel" ] [ pkgs.wireshark ]);
      "mushroom" = (makeUser "Sulphuric" [ "wheel" ] [ ]); #the big home manager got this
      "tung" = (makeUser "Triple T Sahur" [ ] [ pkgs.supertux ]);
    };

  environment.shells = [ pkgs.zsh ];
}
