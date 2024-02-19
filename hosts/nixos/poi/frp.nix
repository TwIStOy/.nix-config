{
  pkgs-unstable,
  config,
  ...
}: {
  disabledModules = [
    "services/networking/frp.nix"
  ];

  imports = [
    "${pkgs-unstable.path}/nixos/modules/services/networking/frp.nix"
  ];

  environment.etc = {
    "frp/frp-server-auth.toml" = {
      source = config.age.secrets."frp-server-auth.toml".path;
    };
  };

  services.frp = {
    enable = true;
    package = pkgs-unstable.frp;
    role = "client";
    settings = {
      includes = [
        "/etc/frp/frp-server-auth.toml"
      ];
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
