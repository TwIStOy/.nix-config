{myUtils, ...}:
with myUtils.paths; {
  imports = readModules ./.;
}
