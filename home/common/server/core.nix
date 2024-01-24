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

  # Atuin replaces your existing shell history with a SQLite database,
  # and records additional context for your commands.
  # Additionally, it provides optional and fully encrypted
  # synchronisation of your history between machines, via an Atuin server.
  atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
}
