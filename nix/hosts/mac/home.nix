{ config, pkgs, ... }:

let
  colors = builtins.fromJSON (builtins.readFile ../../../colors.json);
in
{
  home.stateVersion = "25.05";

  programs.ghostty = {
    enable = true;
    package = pkgs.emptyDirectory // {
      meta.mainProgram = "ghostty";
    };

    settings = {
      background = colors.bg;
      foreground = colors.fg;
    };
  };
}
