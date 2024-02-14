let
  user = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG92SyvgOOe9pGPGHEY9VbDBWwqaRgm9tg1RJUxlfdCN"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKR85V4/rPx5GRUUI5j+ssL/Mr2ynwMZuPi49yLU7NjJ"
  ];

  # hosts
  poi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIChh+2JjsSms14xR5l8y2zzyCI5ryzEzeuq9N8wsaEqK";
  yukikaze = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8aMFW3F68el/LQyZtONVuEMwJfejRvRdjLTps84f3";

  # collections
  desktop = [
    yukikaze
  ];
  servers = [
    poi
  ];

  # helpers
  mkSecrets = list: list ++ user;
in {
  "frp-server-auth.age".publicKeys = mkSecrets (servers ++ desktop);
}