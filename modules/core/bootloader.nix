{ pkgs, host, ... }:
{
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = false;
    useOSProber = false;
    extraEntries = builtins.import ./../../hosts/${host}/windows-boot-entry.nix;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
