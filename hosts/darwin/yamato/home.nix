{
  programs.kitty.settings.font_size = 22;

  programs.ssh = {
    extraConfig = ''
      Host dev4
          Hostname 192.168.50.253
          user hawtian
          ForwardAgent yes
          KeepAlive yes
          TCPKeepAlive yes
          ServerAliveInterval 30
          ForwardX11 yes
          RemoteForward 2224 127.0.0.1:2224
          RemoteForward 2225 127.0.0.1:2225
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      Host dev4.simple
          Hostname 192.168.50.253
          user hawtian
          KeepAlive yes
          TCPKeepAlive yes
          ServerAliveInterval 30
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}
