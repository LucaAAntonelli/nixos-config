{pkgs, lib, ...}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    prefix = "C-Space"; # Bind prefix to Ctrl+Spacebar
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      sensible
      resurrect
      better-mouse-mode
      gruvbox
      yank
    ];
    extraConfig = ''
      bind '"' split-window -v -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"
    '';
  };
}
