{
  programs.kitty.settings.font_size = 18;

  programs.ssh = {
    extraConfig = ''
      Host poi
        Hostname 192.168.50.226
        user hawtian
        ForwardAgent yes
        KeepAlive yes
        TCPKeepAlive yes
        ServerAliveInterval 30
        ForwardX11 yes
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}
