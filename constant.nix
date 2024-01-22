rec {
  username = "hawtian";
  userfullname = "Hawtian Wang";
  useremail = "twistoy.wang@gmail.com";

  allSystemAttr = {
    # linux systems
    x64_system = "x86_64-linux";
    aarch64_system = "aarch64-linux";
    #darwin systems
    x64_darwin = "x86_64-darwin";
    aarch64_darwin = "aarch64-darwin";
  };

  allSystems = builtins.attrValues allSystemAttrs;
}
