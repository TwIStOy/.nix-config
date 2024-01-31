{
  programs.kitty.settings.font_size = 22;

  programs.ssh = {
    matchBlocks = {
      "dev.work.local" = {
        hostname = "192.168.50.253";
        user = "hawtian";
        forwardAgent = true;
        forwardX11 = true;
        remoteForwards = [
          {
            bind.port = 2224;
            host.address = "127.0.0.1";
            host.port = 2224;
          }
          {
            bind.port = 2225;
            host.address = "127.0.0.1";
            host.port = 2225;
          }
        ];
        extraOptions = {
          KeepAlive = "yes";
        };
      };
      "dev.work.local.simple" = {
        hostname = "192.168.50.253";
        user = "hawtian";
        forwardAgent = true;
        extraOptions = {
          KeepAlive = "yes";
        };
      };
      "poi.remote" = {
        hostname = "frp2.twistoy.cn";
        port = 4001;
        user = "hawtian";
        forwardAgent = true;
        forwardX11 = true;
        extraOptions = {
          KeepAlive = "yes";
          TCPKeepAlive = "yes";
        };
      };
    };
  };
}
