{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    git
    vim

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
    fd
    skim
    btop
    tokei

    curl
    wget

    gnugrep
    gnused
    gawk
    jq
    yq-go

    lazygit
    xclip
    tmux
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

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
