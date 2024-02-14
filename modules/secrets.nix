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
  };
}
