{pkgs, ...}: {
  home.packages = with pkgs; [
    strace
    ltrace
    bpftrace
    tcpdump
    lsof

    pciutils
    usbutils
  ];
}
