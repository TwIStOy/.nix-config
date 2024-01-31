{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    gnugrep
    gnutar
    fish
  ];

  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
    pkgs.fish
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;

      # cleanup = "zap";
      cleanup = "none";
    };

    masApps = {};

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
      "osx-cross/avr"
      "osx-cross/arm"
      "qmk/qmk"
    ];

    brews = [
      "wget"
      "curl"
      "aria2"
      "httpie"

      "gnu-sed"
      "gnu-tar"
      "jq"
    ];

    casks = [
      "1password-cli"
      "iina"
      "arc"
      "google-chrome"
      "visual-studio-code"
      "telegram"
      "discord"
      "karabiner-elements"
      "jetbrains-toolbox"
    ];
  };
}
