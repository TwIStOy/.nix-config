{osConfig, ...}: let
  one-password-agent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
in {
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    serverAliveInterval = 10;
    serverAliveCountMax = 60;
    extraOptionOverrides = {
      IdentityAgent = one-password-agent;
    };
    includes = [
      "~/.orbstack/ssh/config"
      "${osConfig.age.secrets.ssh-remote-host-config.path}"
    ];
  };
}
