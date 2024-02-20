{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    git
    vim

    rsync
    tealdeer

    zip
    xz
    unzip
    p7zip

    just
    delta
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

    xclip
    fswatch
  ];

  programs.nix-index.enable = true;
}
