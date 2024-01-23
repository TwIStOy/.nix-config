{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    neofetch

    rsync
    tldr

    zip
    sz
    unzip
    p7zip

    just
  ];
}
