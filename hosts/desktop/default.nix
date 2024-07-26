{ pkgs, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  powerManagement.cpuFreqGovernor = "performance";

  # Possible fix for desktop: Specify NVIDIA driver
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.finegrained = false;

    nvidiaSettings = true;
  };
}