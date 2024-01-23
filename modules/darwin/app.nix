{ config
, lib
, pkgs
, ...
}:
{
  environment.systemPackages = with pkgs; [
    git
    gnugrep
    gnutar
  ];

  homebrew = {
    enable = false;

    onActivation = {
      autoUpdate = false;

      cleanup = "zap";
    };

    masApps = { };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
    ];

    brews = [
      "wget"
      "curl"
      "aria2"
      "httpie"

      "gnu-sed"
      "gnu-tar"
    ];

    casks = [
      "eudic"
    ];
  };
}
