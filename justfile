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

nvim-clean:
  rm $HOME/.config/nvim/init.lua

nvim-test: nvim-clean
  cp home/common/server/neovim/init.lua $HOME/.config/nvim/init.lua

fmt:
  nix fmt
