{...}: let
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
    ];
    matchBlocks = {
      "dev.work.remote" = {
        user = "hawtian";
        port = 4000;
        hostname = "frp2.twistoy.cn";
        serverAliveInterval = 30;
        serverAliveCountMax = 60;
      };
      "poi.remote" = {
        hostname = "frp2.twistoy.cn";
        port = 4001;
        user = "hawtian";
        forwardAgent = true;
        forwardX11 = true;
        extraOptions = {
          KeepAlive = "yes";
        };
      };
      "agora-jump" = {
        user = "wanghaotian@agora.io";
        hostname = "braum-ssh.agoralab.co";
        port = 20221;
        extraOptions = {
          ControlPath = "~/.ssh/braum-%r@%h:%p";
          PubkeyAcceptedAlgorithms = "+ssh-rsa";
          HostkeyAlgorithms = "+ssh-rsa";
          ControlMaster = "auto";
          ControlPersist = "yes";
        };
      };
    };
  };
}
