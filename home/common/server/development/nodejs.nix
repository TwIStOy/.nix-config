{pkgs, ...}: {
  home.packages = with pkgs.nodePackages; [
    nodejs
    pnpm
    typescript
    typescript-language-server
    prettier # common code formatter
  ];
}
