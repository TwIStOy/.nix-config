{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    neofetch

    rsync
    tldr

    zip
    xz
    unzip
    p7zip

    just
  ];
}
