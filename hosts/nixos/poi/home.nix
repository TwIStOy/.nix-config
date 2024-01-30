{...}
: {
  programs.ssh = {
    extraConfig = ''
    Host github.com
        ProxyCommand nc -X connect -x 192.168.50.226:8889 %h %p
    '';
  };
}
