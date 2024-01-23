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

    zoxide
  ];

  programs.nix-index.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
    };
  };
}
