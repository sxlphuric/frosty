This is where secrets (passwords, api keys, etc.) are stored.

To use secrets, you need to first update the ssh key in `secrets.nix` to your own **public** key, which has been generated with `ssh-keygen`.

To create a new secret (or recreate the existing ones), run `agenix -e <name>.age`.

This is how to use a secret in configuration

```nix
age.secrets.<name> = {
  file = "./secrets/<filename>.age";
  owner = "<owner>"; # Only in NixOS config! (not Home Manager)
  group = "<group>"; # Only in NixOS config! (not Home Manager)
  mode = "<chmod mode>"; 
}
services.someService = {
  auth = {
    username = "<username>";
    password = config.age.secrets.<name>.path;
  }
}
```

You can also set a specific path in the system:

```nix
age.secrets.name = {
  file = "./secrets/<filename>.age";
  path = "<path>"; # This is where the credential will end up after it is generated
  owner = "<owner>"; # Only in NixOS config! (not Home Manager)
  group = "<group>"; # Only in NixOS config! (not Home Manager)
  mode = "<chmod mode>"; 
}
```
