{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch

    rsync
    tldr

    zip
    xz
    unzip
    p7zip

    just
    delta
    zoxide
    eza
    (ripgrep.override {withPCRE2 = true;})
    hyperfine

    curl
    wget

    gnugrep
    gnused
    gawk
    jq
    yq-go

    lazygit
  ];

  programs.nix-index.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
