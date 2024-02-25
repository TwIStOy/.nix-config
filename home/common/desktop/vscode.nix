{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;

    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
    ];

    userSettings = {};
  };
}
