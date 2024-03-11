{pkgs, ...}: {
  home.packages = with pkgs; [
    # Others
    taplo # TOML language server / formatter / validator

    protobuf

    gitmoji-cli # pretty git commit messages
  ];
}
