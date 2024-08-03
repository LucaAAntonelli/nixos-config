{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    evince                            # gnome pdf viewer
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    file                              # Show file information 
    fzf                               # fuzzy finder
    gifsicle                          # gif utility
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    jdk8                              # legacy java version for Minecraft
    libreoffice
    nemo-with-extensions             # file manager
    nitch                             # systhem fetch util
    nix-prefetch-github
    prismlauncher                     # minecraft launcher
    ripgrep                           # grep replacement
    soundwireserver                   # pass audio to android phone
    tdf                               # cli pdf viewer
    toipe                             # typing test in the terminal
    valgrind                          # c memory analyzer
    yazi                              # terminal file manager
    yt-dlp-light
    zenity
    winetricks
    wineWowPackages.wayland

    obsidian
    dust
    lshw
    

    # Python
    python3

    bleachbit                         # cache cleaner
    cmatrix
    gparted                           # partition manager
    ffmpeg
    imv                               # image viewer
    killall
    libnotify
	  man-pages					            	  # extra man pages
    mpv                               # video player
    ncdu                              # disk space
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist                          # clipboard manager
    poweralertd
    qalculate-gtk                     # calculator
    unzip
    wget
    xdg-utils
    xxd
    inputs.alejandra.defaultPackage.${system}
  ]);
}
