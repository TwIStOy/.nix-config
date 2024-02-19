{
  hyperSelf,
  pkgs,
  config,
  username,
  agenix,
  ...
}: let
  ageSecret = {
    file,
    owner ? "root",
    mode ? "400",
  }: {
    file = "${hyperSelf}/secrets/${file}";
    inherit owner mode;
  };
in {
  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default
  ];

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "${config.users.users.${username}.home}/.ssh/id_ed25519"
  ];

  age.secrets = {
    frp-server-auth = ageSecret {
      file = "frp-server-auth.age";
      owner = username;
    };
    atuin-key = ageSecret {
      file = "atuin-key.age";
      owner = username;
    };
    atuin-client-config = ageSecret {
      file = "atuin-client-config.age";
      owner = username;
    };
  };

  environment.etc = {
    "agenix/atuin-client-config.toml" = {
      source = config.age.secrets.atuin-client-config.path;
    };
  };
}
