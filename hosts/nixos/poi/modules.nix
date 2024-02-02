{
  secrets-hawtian,
  pkgs-unstable,
  ...
}: let
  hostname = "poi";

  frp-secrets = builtins.fromJSON (builtins.readFile "${secrets-hawtian}/frp-secret.json");
in {
  disabledModules = [
    "services/networking/frp.nix"
  ];

  imports = [
    ./hardware-configuration.nix
    "${pkgs-unstable.path}/nixos/modules/services/networking/frp.nix"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  networking.proxy.default = "http://192.168.50.217:8888";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

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
          remotePort = 4000;
        }
      ];
    };
  };

  system.stateVersion = "23.11";
}
