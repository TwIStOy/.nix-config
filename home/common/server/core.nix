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
    (ripgrep.override {withPCRE2 = true;})
    hyperfine
    fd
    skim
    btop
    tokei
    ydict

    curl
    wget
    dig
    expect

    gnugrep
    gnused
    gawk
    jq
    yq-go

    lazygit
    xclip
    tmux
    fswatch
    cachix
  ];

  programs.nix-index.enable = true;
}
