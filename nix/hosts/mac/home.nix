{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  programs.ghostty = {
    enable = true;
    package = pkgs.emptyDirectory // {
      meta.mainProgram = "ghostty";
    };

    settings = {
      background = "#101828";
      foreground = "#f9fafb";
    };
  };
}
