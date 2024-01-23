darwin: commit
  nix build .#darwinConfigurations.yamato.system \
    --extra-experimental-features 'nix-command flakes'
  ./result/sw/bin/darwin-rebuild switch --flake .#yamato

darwin-debug:
  nix build .#darwinConfigurations.yamato.system \
    --extra-experimental-features 'nix-command flakes'
  ./result/sw/bin/darwin-rebuild switch --flake .#yamato --show-trace --verbose

commit:
  git add --all
  git commit -m '...'
