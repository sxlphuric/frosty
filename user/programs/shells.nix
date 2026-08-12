{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fastfetch
    '';
    functions = {
      run = "nix run nixpkgs#$argv[1] -- $argv[2..-1]";
      shell = ''
        set NIX_SHELL_CMD "nix shell"
        for i in $argv
          set NIX_SHELL_CMD "$NIX_SHELL_CMD nixpkgs#$i"
        end
        eval $NIX_SHELL_CMD
        set -e NIX_SHELL_CMD
      '';
    };
  };
  programs.zsh = {
    enable = true;
    siteFunctions = {
      run = ''
        local cmd=(nix run "nixpkgs#$1" --)
        shift
        cmd+=("$@")
        "${"$"}{cmd[@]}"
      '';
      shell = ''
        local cmd=(nix shell)
        for i in "$@"; do
          cmd+=("nixpkgs#$i")
        done
        "${"$"}{cmd[@]}"
      '';
    };
  };
}
