{pkgs, ...}: {
  home.packages = with pkgs.nodePackages; [
    nodejs
    yarn
    pnpm
    typescript
    typescript-language-server
    prettier # common code formatter
  ];
}
