{utils, ...}:
with utils.paths; {
  imports = readModules ./.;
}
