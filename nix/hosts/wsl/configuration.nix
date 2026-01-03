{ config, pkgs, ... }:

{
  system.stateVersion = "25.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  users.users.nixos = {
    name = "nixos";
    home = "/home/nixos";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
