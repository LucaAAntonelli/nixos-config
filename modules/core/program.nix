{ ... }: {
  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.ssh = {
    extraConfig = ''
      Host github.com
      User git
      IdentityFile ~/.ssh/id_ed25519
      IdentitiesOnly yes
    '';
  };
  programs.nix-ld.enable = true;
  programs.kdeconnect.enable = true;
}
