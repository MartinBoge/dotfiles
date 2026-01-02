{ config, pkgs, ... }:

{
  system.stateVersion = 6;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
