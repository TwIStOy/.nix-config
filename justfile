set shell := ["bash", "-uc"]

alias ya := yamato
alias yu := yukikaze

host := `hostname -s`
system := if os() == "macos" { "macos" } else { "nixos" }

default:
  @echo "System: {{system}}, Host: {{host}}"
  @{{just_executable()}} {{host}}

yamato use_nom="yes" details="no": (_macos_rebuild "yamato" use_nom details)

yukikaze use_nom="yes" details="no": (_macos_rebuild "yukikaze" use_nom details)

poi use_nom="yes" details="no": (_nixos_rebuild "poi" use_nom details)

_macos_rebuild hostname use_nom="yes" details="no":
  @{{ if use_nom == "yes" { "nom" } else { "nix" } }} build .#darwinConfigurations.{{hostname}}.system --extra-experimental-features 'nix-command flakes'
  @./result/sw/bin/darwin-rebuild switch --flake .#{{hostname}} {{ if details != "no" { "--show-trace" } else { "" } }}

_nixos_rebuild hostname use_nom="yes" details="no":
  {{ if use_nom == "yes" { "nom" } else { "nix" } }} build .#nixosConfigurations.{{hostname}}.config.system.build.toplevel {{ if details != "no" { "--show-trace --verbose" } else { "" } }} 
  @sudo nixos-rebuild switch --flake .#{{hostname}}

up:
  @nix flake update

push: commit
  @git push

commit:
  -@git add --all
  -@git commit -m '...'

gc:
  # garbage collect all unused nix store entries
  @sudo nix store gc --debug
  @sudo nix-collect-garbage --delete-old

nvim-clean:
  -@rm $HOME/.config/nvim/init.lua

nvim-test: nvim-clean
  @ln -s $HOME/.config/nvim/init-user.lua $HOME/.config/nvim/init.lua

fmt:
  @nix fmt
