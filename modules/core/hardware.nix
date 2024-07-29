{ pkgs, ... }:
{  
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  hardware.enableRedistributableFirmware = true;

  hardware.opengl.enable = true;
}
