{lib,...}: {
  options.update_outofspace = lib.mkOption {
     type = lib.types.bool;
     default = false;
     description = "delete the chud packages to save space when udpating nixpkgs if necessary";
   };
}
