{ pkgs, config, ... }:

{
    system.fsPackages = [ pkgs.bindfs ];
    fileSystems = let
        mkRoSymBind = path: {
        device = path;
        fsType = "fuse.bindfs";
        options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
        };
        aggregatedIcons = pkgs.buildEnv {
        name = "system-icons";
        paths = with pkgs; [
            gnome-themes-extra
        ];
        pathsToLink = [ "/share/icons" ];
        };
        aggregatedFonts = pkgs.buildEnv {
        name = "system-fonts";
        paths = config.fonts.packages;
        pathsToLink = [ "/share/fonts" ];
        };
    in {
        "/usr/share/icons" = mkRoSymBind "${aggregatedIcons}/share/icons";
        "/usr/local/share/fonts" = mkRoSymBind "${aggregatedFonts}/share/fonts";
    };

    fonts = {
        fontDir.enable = true;
        packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.noto
        sn-pro
        ];
    };

}
