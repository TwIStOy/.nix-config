{ mylib, ... }:

{
  imports = mylib.scanPaths ./.;
}
