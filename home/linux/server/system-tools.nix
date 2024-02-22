{pkgs, ...}: {
  home.packages = with pkgs; [
    strace
    ltrace
    bpftrace
    tcpdump
    lsof
    socat

    pciutils
    usbutils
  ];
}
