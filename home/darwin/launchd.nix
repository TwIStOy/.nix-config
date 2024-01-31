{...}: {
  launchd.agents = {
    pbcopy = {
      config = {
        label = "localhost.pbcopy";
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
  };
}
