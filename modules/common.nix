# Common configuration for both darwin and nixos
{
  username,
  userfullname,
  ...
} @ args: {
  users.users.${username} = {
    description = userfullname;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG92SyvgOOe9pGPGHEY9VbDBWwqaRgm9tg1RJUxlfdCN"
    ];
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = [username];
    };
  };
}
