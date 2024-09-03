<h1 align="center">
    <img src="./.github/assets/logo/nixos-logo.png  " width="100px" /> 
    <br>
        LucaAAntonelli's Flakes 
    <br>
        <img src="./.github/assets/palette/gruvbox-pallet.png" width="600px" /> <br>
    <div align="center">
        <p></p>
      <div align="center">
         <a href="https://github.com/LucaAAntonelli/nixos-config/stargazers">
            <img src="https://img.shields.io/github/stars/LucaAAntonelli/nixos-config?color=FABD2F&labelColor=282828&style=for-the-badge&logo=starship&logoColor=FABD2F">
         </a>
         <a href="https://github.com/LucaAAntonelli/nixos-config/">
            <img src="https://img.shields.io/github/repo-size/LucaAAntonelli/nixos-config?color=B16286&labelColor=282828&style=for-the-badge&logo=github&logoColor=B16286">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=282828&logo=NixOS&logoColor=458588&color=458588">
         </a>
         <a href="https://github.com/LucaAAntonelli/nixos-config/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=282828&colorB=98971A&logo=unlicense&logoColor=98971A&"/>
         </a>
      </div>
      <br>
    </div>
</h1>

### 🖼️ Gallery
<p align="center">
   <img src="./.github/assets/screenshots/1.png" /> <br>
   <img src="./.github/assets/screenshots/2.png" /> <br>
   <img src="./.github/assets/screenshots/3.png" /> <br>
   <img src="./.github/assets/screenshots/4.png" /> <br>
    Screenshots last updated <b>September 3rd, 2024</b>
</p>


# 🗃️ Overview

This is my NixOS configuration, based on [FrostPhoenix's amazing config](https://github.com/FrostPhoenix/nixos-config)

### :asterisk: Main Differences
- Home-Manager is installed as a standalone
- The config includes NeoVim, configured with [NixVim](https://github.com/nix-community/nixvim)
- The color scheme is Gruvbox-Dark
There are other minor differences, mainly small changes like installed packages and extensions.

### 📚 Layout

-   [flake.nix](flake.nix) base of the configuration
-   [hosts](hosts) 🌳 per-host configurations that contain machine specific configurations
    - [desktop](hosts/desktop/) 🖥️ Desktop specific configuration
    - [laptop](hosts/laptop/) 💻 Laptop specific configuration
-   [modules](modules) 🍱 modularized NixOS configurations
    -   [core](modules/core/) ⚙️ Core NixOS configuration
    -   [homes](modules/home/) 🏠 my [Home-Manager](https://github.com/nix-community/home-manager) config
-   [wallpapers](wallpapers/) 🌄 wallpaper and lock screen images

### 📓 Components
|                             | NixOS + Hyprland                                                                              |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Window Manager**          | [Hyprland][Hyprland] |
| **Bar**                     | [Waybar][Waybar] |
| **Application Launcher**    | [fuzzel][fuzzel] |
| **Notification Daemon**     | [swaync][swaync] |
| **Terminal Emulator**       | [Kitty][Kitty] |
| **Shell**                   | [zsh][zsh] + [oh-my-zsh][oh-my-zsh] + [Starship][Starship] |
| **Text Editor**             | [VSCodium][VSCodium] + [Neovim][Neovim] |
| **network management tool** | [NetworkManager][NetworkManager] + [network-manager-applet][network-manager-applet] |
| **System resource monitor** | [Btop][Btop] |
| **File Manager**            | [nemo][nemo] + [yazi][yazi] |
| **Fonts**                   | [Nerd fonts][Nerd fonts] |
| **Color Scheme**            | [Gruvbox-Dark][Gruvbox-Dark] |
| **Cursor**                  | [Nordzy-cursors][Nordzy-cursors] |
| **Icons**                   | [Gruvbox-Icons][Gruvbox-Icons] + [Gruvbox-Icons-Plus][Gruvbox-Icons-Plus] |
| **Lockscreen**              | [Swaylock-effects][Swaylock-effects] |
| **Image Viewer**            | [imv][imv] |
| **Media Player**            | [mpv][mpv] |
| **Music Player**            | [audacious][audacious] |
| **Screenshot Software**     | [grimblast][grimblast] |
| **Screen Recording**        | [wf-recorder][wf-recorder] |
| **Clipboard**               | [wl-clip-persist][wl-clip-persist] |
| **Color Picker**            | [hyprpicker][hyprpicker] |
| **Notes**                   | [Obsidian][obsidian] |

### 📝 Shell aliases

<details>
<summary>
Utils (EXPAND)
</summary>

- ```c```     $\rightarrow$ ```clear```
- ```cd```    $\rightarrow$ ```z```
- ```tt```    $\rightarrow$ ```gtrash put```
- ```vim```   $\rightarrow$ ```nvim```
- ```cat```   $\rightarrow$ ```bat```
- ```nano```  $\rightarrow$ ```micro```
- ```icat```  $\rightarrow$ ```kitten icat```
- ```dsize``` $\rightarrow$ ```du -hs```
- ```findw``` $\rightarrow$ ```grep -rl```
- ```l```     $\rightarrow$ ```eza --icons  -a --group-directories-first -1```
- ```ll```    $\rightarrow$ ```eza --icons  -a --group-directories-first -1 --no-user --long```
- ```tree```  $\rightarrow$ ```eza --icons --tree --group-directories-first```
- ```inv```   $\rightarrow$ ```fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"```
- ```clip```  $\rightarrow$ ```wl-copy < ```
</details>

<details>
<summary>
Nixos (EXPAND)
</summary>

> ${host} is either `desktop` or `laptop`

- ```cdnix```            $\rightarrow$ ```cd ~/nixos-config && codium ~/nixos-config```
- ```nix-switch```       $\rightarrow$ ```sudo nixos-rebuild switch --flake ~/nixos-config#${host}```
- ```nix-switchu```      $\rightarrow$ ```sudo nixos-rebuild switch --upgrade --flake ~/nixos-config#${host}```
- ```nix-flake-update``` $\rightarrow$ ```sudo nix flake update ~/nixos-config#```
- ```nix-clean```        $\rightarrow$ ```nh clean all --keep 5```
- ```nix-list```         $\rightarrow$ ```sudo nix-env --list-generations --profile /nix/var/nix/profiles/system```
- ```hm-switch```        $\rightarrow$ ```home-manager switch --flake ~/nixos-config```
- ```hm-list```          $\rightarrow$ ```home-manager generations```
- ```nix-switch-all```   $\rightarrow$ ```hm-switch && nix-switch```
- ```nix-develop```      $\rightarrow$ ```nix develop -c $SHELL```
</details>

<details>
<summary>
Git (EXPAND)
</summary>

- ```ga```   $\rightarrow$ ```git add```
- ```gaa```  $\rightarrow$ ```git add --all```
- ```gs```   $\rightarrow$ ```git status```
- ```gb```   $\rightarrow$ ```git branch```
- ```gm```   $\rightarrow$ ```git merge```
- ```gpl```  $\rightarrow$ ```git pull```
- ```gplo``` $\rightarrow$ ```git pull origin```
- ```gps```  $\rightarrow$ ```git push```
- ```gpso``` $\rightarrow$ ```git push origin```
- ```gc```   $\rightarrow$ ```git commit```
- ```gcm```  $\rightarrow$ ```git commit -m```
- ```gch```  $\rightarrow$ ```git checkout```
- ```gchb``` $\rightarrow$ ```git checkout -b```
- ```gcoe``` $\rightarrow$ ```git config user.email```
- ```gcon``` $\rightarrow$ ```git config user.name```
</details>

### 🛠️ Scripts

All the scripts are in ```modules/home/scripts/scripts/``` and are exported as packages in ```modules/home/scripts/default.nix```

<details>
<summary>
extract.sh 
</summary>

**Description:** This script extracts ```tar.gz``` archives in the current directory.

**Usage:** ```extract <archive_file>```
</details>

<details>
<summary>
compress.sh 
</summary>

**Description:** This script compresses a file or a folder into a ```tar.gz``` archives which is created in the current directory with the name of the chosen file or folder. 

**Usage:** ```compress <file>``` or ```compress <folder>```
</details>

<details>
<summary>
toggle_blur.sh 
</summary>

**Description:** This script toggles the Hyprland blur effect. If the blur is currently enabled, it will be disabled, and if it's disabled, it will be turned on. 

**Usage:** ```toggle_blur```
</details>

<details>
<summary>
toggle_oppacity.sh 
</summary>

**Description:** This script toggles the Hyperland oppacity effect. If the oppacity is currently set to 0.90, it will be set to 1, and if it's set to 1, it will be set to 0.90. 

**Usage:** ```toggle_oppacity```
</details>

<details>
<summary>
maxfetch.sh 
</summary>

**Description:** This script is a modified version of the [jobcmax/maxfetch][maxfetch] script.

**Usage:** ```maxfetch```
</details>

<details>
<summary>
music.sh 
</summary>

**Description:** This script is for managing Audacious (music player). If Audacious is currently running, it will be killed (stopping the music); otherwise, it will start Audacious in the 8th workspace and resume the music. 

**Usage:** ```music```
</details>

<details>
<summary>
runbg.sh 
</summary>

**Description:** This script runs a provided command along with its arguments and detaches it from the terminal. Handy for launching apps from the command line without blocking it. 

**Usage:** ```runbg <command> <arg1> <arg2> <...>```
</details>

### ⌨️ Keybinds

View all keybinds by pressing ```$mainMod F1``` and wallpaper picker by pressing ```$mainMod w```. By default ```$mainMod``` is the ```SUPER``` key. 

<details>
<summary>
Keybindings 
</summary>

- ```bind = $mainMod, Return, exec, kitty```
- ```bind = ALT, Return, exec, kitty --title float_kitty```
- ```bind = $mainMod SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'```
- ```bind = $mainMod, B, exec, firefox```
- ```bind = $mainMod, Q, killactive,```
- ```bind = $mainMod, F, fullscreen, 0```
- ```bind = $mainMod SHIFT, F, fullscreen, 1```
- ```bind = $mainMod, Space, togglefloating,```
- ```bind = $mainMod, D, exec, fuzzel```
- ```bind = $mainMod, Escape, exec, swaylock```
- ```bind = $mainMod SHIFT, Escape, exec, shutdown-script```
- ```bind = $mainMod, P, pseudo,```
- ```bind = $mainMod, J, togglesplit,```
- ```bind = $mainMod, E, exec, nemo```
- ```bind = $mainMod SHIFT, B, exec, pkill -SIGUSR1 .waybar-wrapped```
- ```bind = $mainMod, C ,exec, hyprpicker -a```
- ```bind = $mainMod, W,exec, wallpaper-picker```
</details>

<details>
<summary>
Screenshot 
</summary>

- ```bind = $mainMod, Print, exec, grimblast --notify --cursor save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png```
- ```bind = ,Print, exec, grimblast --notify --cursor  copy area```
</details>

<details>
<summary>
Switch window focus 
</summary>

- ```bind = $mainMod, left, movefocus, l```
- ```bind = $mainMod, right, movefocus, r```
- ```bind = $mainMod, up, movefocus, u```
- ```bind = $mainMod, down, movefocus, d```
</details>

<details>
<summary>
Switch workspace 
</summary>

- ```bind = $mainMod, 1, workspace, 1```
- ```bind = $mainMod, 2, workspace, 2```
- ```bind = $mainMod, 3, workspace, 3```
- ```bind = $mainMod, 4, workspace, 4```
- ```bind = $mainMod, 5, workspace, 5```
- ```bind = $mainMod, 6, workspace, 6```
- ```bind = $mainMod, 7, workspace, 7```
- ```bind = $mainMod, 8, workspace, 8```
- ```bind = $mainMod, 9, workspace, 9```
- ```bind = $mainMod, 0, workspace, 10```
</details>

<details>
<summary>
Switch window to workspace 
</summary>

- ```bind = $mainMod SHIFT, 1, movetoworkspace, 1```
- ```bind = $mainMod SHIFT, 2, movetoworkspace, 2```
- ```bind = $mainMod SHIFT, 3, movetoworkspace, 3```
- ```bind = $mainMod SHIFT, 4, movetoworkspace, 4```
- ```bind = $mainMod SHIFT, 5, movetoworkspace, 5```
- ```bind = $mainMod SHIFT, 6, movetoworkspace, 6```
- ```bind = $mainMod SHIFT, 7, movetoworkspace, 7```
- ```bind = $mainMod SHIFT, 8, movetoworkspace, 8```
- ```bind = $mainMod SHIFT, 9, movetoworkspace, 9```
- ```bind = $mainMod SHIFT, 0, movetoworkspace, 10```
- ```bind = $mainMod CTRL, c, movetoworkspace, empty```
</details>

<details>
<summary>
Window control 
</summary>

- ```bind = $mainMod SHIFT, left, movewindow, l```
- ```bind = $mainMod SHIFT, right, movewindow, r```
- ```bind = $mainMod SHIFT, up, movewindow, u```
- ```bind = $mainMod SHIFT, down, movewindow, d```
- ```bind = $mainMod CTRL, left, resizeactive, -80 0```
- ```bind = $mainMod CTRL, right, resizeactive, 80 0```
- ```bind = $mainMod CTRL, up, resizeactive, 0 -80```
- ```bind = $mainMod CTRL, down, resizeactive, 0 80```
- ```bind = $mainMod ALT, left, moveactive,  -80 0```
- ```bind = $mainMod ALT, right, moveactive, 80 0```
- ```bind = $mainMod ALT, up, moveactive, 0 -80```
- ```bind = $mainMod ALT, down, moveactive, 0 80```
</details>

<details>
<summary>
Media and volume controls 
</summary>
   
- ```bind = ,XF86AudioRaiseVolume,exec, pamixer -i 2```
- ```bind = ,XF86AudioLowerVolume,exec, pamixer -d 2```
- ```bind = ,XF86AudioMute,exec, pamixer -t```
- ```bind = ,XF86AudioPlay,exec, playerctl play-pause```
- ```bind = ,XF86AudioNext,exec, playerctl next```
- ```bind = ,XF86AudioPrev,exec, playerctl previous```
- ```bind = , XF86AudioStop, exec, playerctl stop```
- ```bind = $mainMod, mouse_down, workspace, e-1```
- ```bind = $mainMod, mouse_up, workspace, e+1```
</details>

<details>
<summary>
Mouse binding 
</summary>

- ```bindm = $mainMod, mouse:272, movewindow```
- ```bindm = $mainMod, mouse:273, resizewindow```
</details>

# 🚀 Installation 

> **⚠️ Use this configuration at your own risk! ⚠️** <br>
> Applying custom configurations, especially those related to your operating system, can have unexpected consequences and may interfere with your system's normal behavior. While I have tested these configurations on my own setup, there is no guarantee that they will work flawlessly on all systems. <br>
> **I am not responsible for any issues that may arise from using this configuration.**

> It is highly recommended to review the configuration contents and make necessary modifications to customize it to your needs before attempting the installation.

1. **Install NixOs**

   First install NixOS using any [graphical ISO image](https://nixos.org/download.html#nixos-iso). 
   > Only been tested using the Gnome graphical installer and choosing the ```No desktop``` option durring instalation.

2. **Clone the repo**

   ```
   nix-shell -p git
   git clone https://github.com/LucaAAntonelli/nixos-config
   cd nixos-config
   ```
3. **Install script**

   > First make sure to read the install script, it isn't long
   
   Execute and follow the installation script :
   ```
   ./install.sh
   ```
   > You will need to change the git account yourself in ./modules/home/git.nix
   ```
      programs.git = {
         ...
         userName = "LucaAAntonelli";
         userEmail = "luca.antonelli@gmx.ch";
         ...
      };
   ```
4. **Reboot**

   After rebooting, you'll be greeted by swaylock prompting for your password, with the wallpaper in the background.

5. **Manual config**

   Even though I use home manager, there is still a little bit of manual configuration to do:
      - Enable Discord theme (in Discord settings under VENCORD > Themes).
      - Configure the browser (for now, all browser configuration is done manually).
      - Set appearance of Obsidian:
        - Set the interface and text fonts to "SN Pro"
        - Set the monospace font to "JetBrainsMonoNL Nerd Fonts"
    

6. **Removing OSprober**

   OSprober is a tool that scans drives for alternative boot options. You need this in case you are running a dual boot setup, i.e. if you're using multiple operating sstems on one device. The problem with OSprober is that it runs _every time_ you rebuild the system. Here's the alternative: 
   1. Run OSprober once and reboot your system, ensuring that the boot entries actually work
   2. Set `boot.loader.grub.useOSprober = false;`
   3. Navigate to `/boot/grub/grub.cfg` and copy any non-NixOS entry
   4. Add the entries into `boot.loader.grub.extraEntries` as a single string


### Install script walkthrough

A brief walkthrough of what the install script does.

1. **Get username**

   You will receive a prompt to enter your username, with a confirmation check.

2. **Set username**

   The script will replace all occurancies of the default usename ```CURRENT_USERNAME``` by the given one stored in ```$username```

3. Create basic directories

   The following directories will be created:
   - ```~/Music```
   - ```~/Documents```
   - ```~/Pictures/wallpapers/others```

4. Copy the wallpapers

   Then the wallpapers will be copied into ```~/Pictures/wallpapers/others``` which is the folder in which the ```wallpaper-picker.sh``` script will be looking for them.

5. Get the hardware configuration

   It will also automatically copy the hardware configuration from ```/etc/nixos/hardware-configuration.nix``` to ```./hosts/nixos/hardware-configuration.nix``` so that the hardware configuration used is yours and not the default one.

6. Choose a host (desktop / laptop)

   Now you will need to choose the host you want. It depend on whether you are using a desktop or laptop.

7. Build the system

   Lastly, it will build the system, which includes both the flake config and home-manager config.

# 👥 Credits

Other dotfiles that I learned / copy from:

- Nix Flakes
  - [nomadics9/NixOS-Flake](https://github.com/nomadics9/NixOS-Flake): This is where I start my nixos / hyprland journey.
  - [samiulbasirfahim/Flakes](https://github.com/samiulbasirfahim/Flakes): General flake / files structure
  - [justinlime/dotfiles](https://github.com/justinlime/dotfiles): Mainly waybar (old design)
  - [skiletro/nixfiles](https://github.com/skiletro/nixfiles): Vscodium config (that prevent it to crash)
  - [fufexan/dotfiles](https://github.com/fufexan/dotfiles)

- README
  - [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
  - [NotAShelf/nyx](https://github.com/NotAShelf/nyx)
  - [sioodmy/dotfiles](https://github.com/sioodmy/dotfiles)
  - [Ruixi-rebirth/flakes](https://github.com/Ruixi-rebirth/flakes)





<!-- end of page, send back to the top -->

<div align="right">
  <a href="#readme">Back to the Top</a>
</div>

<!-- Links -->
[Gruvbox-Dark]: https://github.com/morhetz/gruvbox
[Gruvbox-Icons-Plus]:https://github.com/SylEleuth/gruvbox-plus-icon-pack
[Gruvbox-Icons]:https://www.opencode.net/adhe/gruvboxplasma
[obsidian]: https://obsidian.md
[Hyprland]: https://github.com/hyprwm/Hyprland
[Kitty]: https://github.com/kovidgoyal/kitty
[Starship]: https://github.com/starship/starship
[Waybar]: https://github.com/Alexays/Waybar
[fuzzel]: https://codeberg.org/dnkl/fuzzel>
[Btop]: https://github.com/aristocratos/btop
[nemo]: https://github.com/linuxmint/nemo
[yazi]: https://github.com/sxyazi/yazi
[zsh]: https://ohmyz.sh/
[oh-my-zsh]: https://ohmyz.sh/
[Swaylock-effects]: https://github.com/mortie/swaylock-effects
[audacious]: https://audacious-media-player.org/
[mpv]: https://github.com/mpv-player/mpv
[VSCodium]:https://vscodium.com/
[Neovim]: https://github.com/neovim/neovim
[grimblast]: https://github.com/hyprwm/contrib
[imv]: https://sr.ht/~exec64/imv/
[swaync]: https://github.com/ErikReider/SwayNotificationCenter
[Nerd fonts]: https://github.com/ryanoasis/nerd-fonts
[NetworkManager]: https://wiki.gnome.org/Projects/NetworkManager
[network-manager-applet]: https://gitlab.gnome.org/GNOME/network-manager-applet/
[wl-clip-persist]: https://github.com/Linus789/wl-clip-persist
[wf-recorder]: https://github.com/ammen99/wf-recorder
[hyprpicker]: https://github.com/hyprwm/hyprpicker
[Nordzy-cursors]: https://github.com/alvatip/Nordzy-cursors
[maxfetch]: https://github.com/jobcmax/maxfetch
