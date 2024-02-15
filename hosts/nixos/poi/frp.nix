{
  secrets-hawtian,
  pkgs-unstable,
  ...
}: let
  frp-secrets = builtins.fromJSON (builtins.readFile "${secrets-hawtian}/frp-secret.json");
in {
  disabledModules = [
    "services/networking/frp.nix"
  ];

  imports = [
    "${pkgs-unstable.path}/nixos/modules/services/networking/frp.nix"
  ];

  services.frp = {
    enable = true;
    package = pkgs-unstable.frp;
    role = "client";
    settings = {
      inherit (frp-secrets) serverAddr serverPort auth;
      proxies = [
        {
          name = "poi-host-ssh";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 22;
          remotePort = 4002;
        }
        {
          name = "poi-ssh-p2p";
          type = "xtcp";
          secretKey = "hawtian";
          localIP = "127.0.0.1";
          localPort = 22;
        }
      ];
    };
  };
}
