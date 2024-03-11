{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        mouseEvents = true;
        nerdFontsVersion = "3";
        border = "single";
      };
      notARepository = "skip";
      git = {
        parseEmoji = true;
      };
    };
  };
}
