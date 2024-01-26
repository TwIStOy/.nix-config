ya:
  nix build .#darwinConfigurations.yamato.system \
    --extra-experimental-features 'nix-command flakes'
  ./result/sw/bin/darwin-rebuild switch --flake .#yamato

yu:
  nix build .#darwinConfigurations.yukikaze.system \
    --extra-experimental-features 'nix-command flakes'
  ./result/sw/bin/darwin-rebuild switch --flake .#yukikaze --show-trace

poi:
  sudo nixos-rebuild switch --flake .#poi --show-trace --verbose

reload-skhd:
  launchctl kickstart -k "gui/501/org.nixos.skhd"

up:
  nix flake update

push:
  git add --all
  git commit -m '...'
  git push

gc:
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old

fmt:
  nix fmt
