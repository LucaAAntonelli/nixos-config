{...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" "tmux" "bgnotify" ];
    };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
      eval "$(direnv hook zsh)"
      ZSH_TMUX_AUTOSTART=true
    '';
    shellAliases = {

      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      code = "codium";
      icat = "kitten icat";
      dsize = "du -hs";
      findw = "grep -rl";
      pdf = "tdf";
      open = "xdg-open";
      inv = ''fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"''; # open fuzzy finder for neovim with syntax-highlighted preview
      clip = "wl-copy < "; # use with file path to copy file content     
      

      l = "eza --icons  -a --group-directories-first -1"; #EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/nixos-config && codium ~/nixos-config";
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#";
      nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config"; # Upgrade all packages, including flake inputs
      nix-flake-update = "sudo nix flake update ~/nixos-config#"; # Upgrade just the flake inputs
      nix-list = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nix-clean = "nh clean all --keep 5";
      # nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      nix-develop = "nix develop -c $SHELL";
      hm-switch = "home-manager switch --flake ~/nixos-config";
      hm-list = "home-manager generations";
      nix-switch-all = "hm-switch && nix-switch";

      # Git
      ga   = "git add";
      gaa  = "git add --all";
      gs   = "git status";
      gb   = "git branch";
      gm   = "git merge";
      gpl  = "git pull";
      gplo = "git pull origin";
      gps  = "git push";
      gpst = "git push --follow-tags";
      gpso = "git push origin";
      gc   = "git commit";
      gcm  = "git commit -m";
      gcma = "git add --all && git commit -m";
      gtag = "git tag -ma";
      gch  = "git checkout";
      gchb = "git checkout -b";
      gcoe = "git config user.email";
      gcon = "git config user.name";

    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
