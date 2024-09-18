{ ... }: 
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = false;
    dbus.enable = true;
    fstrim.enable = true;
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
