{ lib, inputs, ... }: 
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      
      directory = {
        format = "[ ](bold #89b4fa)[ $path ]($style)";
        style = "bold #b4befe";
      };

      character = {
        success_symbol = "[ ](bold #89b4fa)[ ➜](bold green)";
        error_symbol = "[ ](bold #89b4fa)[ ➜](bold red)";
      };

      cmd_duration = {
        format = "[󰔛 $duration]($style)";
        disabled = false;
        style = "bg:none fg:#f9e2af";
        show_notifications = false;
        min_time_to_notify = 60000;
      };

      nix_shell = {
        disabled = false;
        impure_msg = "";
        symbol = "";
        format = "[$symbol$state]($style) ";
      };

      shlvl = {
        disabled = false;
        symbol = "λ ";
      };

      palette = "gruvbox-dark";
    } // builtins.fromTOML (builtins.readFile "${inputs.gruvbox-starship}/starship.toml");
  };
}
