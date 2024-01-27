{...}: {
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Include ~/.orbstack/ssh/config

      Host *
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

      Host github.com
          Hostname github.com
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

      Host jump
          User wanghaotian@agora.io
          HostName braum-ssh.agoralab.co
          Port 20221
          ControlMaster auto
          ControlPersist 1440m # Keep connection for 24hours
          ControlPath ~/.ssh/braum-%r@%h:%p
          PubkeyAcceptedAlgorithms +ssh-rsa
          HostkeyAlgorithms +ssh-rsa
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
          TcpKeepAlive yes
          ServerAliveInterval 30
          ServerAliveCountMax 60

        Host dev
          HostName frp2.twistoy.cn
          Port 4000
          User hawtian
          ServerAliveInterval 300
          ServerAliveCountMax 2
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}
