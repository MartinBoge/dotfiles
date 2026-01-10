{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  programs.ghostty = {
    enable = true;
    package = pkgs.emptyDirectory // {
      meta.mainProgram = "ghostty";
    };

    settings = {
      background = "#282828";
      foreground = "#d4d4d4";
    };
  };
}
