# Common configuration for both darwin and nixos

{ username
, userfullname
, ...
} @args: {
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ username ];
  };
}
