# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ "mem_sleep_default=deep" ];

  boot.initrd.luks.devices."luks-bd375b41-39ba-4d71-97dd-d3e2ead8843f".device = "/dev/disk/by-uuid/bd375b41-39ba-4d71-97dd-d3e2ead8843f";
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/96f223e5-b1c4-49e1-86d5-2f01ed28a1f1";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7A87-238D";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  boot.initrd.luks.devices."luks-f3fa456c-4afe-4c29-bff5-29bf315fb531".device = "/dev/disk/by-uuid/f3fa456c-4afe-4c29-bff5-29bf315fb531";
  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/c0b63467-0334-40a3-ac17-40fe5bf20749";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp170s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}