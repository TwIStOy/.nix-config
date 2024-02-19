{osConfig, ...}: {
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  xdg.configFile."atuin/config.toml" = {
    source = osConfig.age.secrets.atuin-client-config.path;
  };
}
