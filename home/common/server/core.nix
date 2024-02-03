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
  ];

  programs.nix-index.enable = true;
}
