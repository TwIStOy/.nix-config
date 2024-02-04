# Common configuration for both darwin and nixos
{
  username,
  userfullname,
  ...
} @ args: {
  users.users.${username} = {
    description = userfullname;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG92SyvgOOe9pGPGHEY9VbDBWwqaRgm9tg1RJUxlfdCN MainSSH"
    ];
  };

  nixpkgs.overlays = [
    args.neovim-nightly-overlay.overlay
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = [username];

    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://twistoy.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "twistoy.cachix.org-1:74RMpK2e+jG514O3MC6KiTb9eJi4pddEnN5h6PBP0aY="
    ];
    builders-use-substitutes = true;
  };
}
