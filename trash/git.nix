{ config
, lib
, pkgs
, userfullname
, useremail
, ...
}: {
  home.packages = with pkgs; [
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = userfullname;
    userEmail = useremail;

    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      pull.rebase = false;
    };

    # signing = {
    #   key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG92SyvgOOe9pGPGHEY9VbDBWwqaRgm9tg1RJUxlfdCN";
    #   signByDefault = true;
    # };
  };
}
