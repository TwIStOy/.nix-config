_: {
  launchd.agents = {
    pbcopy = {
      enable = true;
      config = {
        ProgramArguments = [
          "/usr/bin/pbcopy"
        ];
        inetdCompatibility = {Wait = false;};
        Sockets = {
          Listeners = {
            SockServiceName = "2224";
            SockNodeName = "127.0.0.1";
          };
        };
      };
    };
    pbpaste = {
      enable = true;
      config = {
        ProgramArguments = [
          "/bin/sh"
          "-c"
          "LC_CTYPE=en_US.UTF-8 pbpaste"
        ];
        inetdCompatibility = {Wait = false;};
        Sockets = {
          Listeners = {
            SockServiceName = "2225";
            SockNodeName = "127.0.0.1";
          };
        };
      };
    };
  };
}
