{
  hyperSelf,
  lib,
  config,
  username,
  ...
}: let
  ageSecret = {
    file,
    owner ? "root",
    group ? "root",
    mode ? "400",
  }: {
    file = "${hyperSelf}/secrets/${file}";
    inherit owner group mode;
  };
in {
  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "${config.users.users.${username}}/.ssh/id_ed25519"
  ];

  age.secrets = {
    frp-server-auth = ageSecret {
      file = "frp-server-auth.age";
      owner = username;
      group = "users";
    };
  };
}
