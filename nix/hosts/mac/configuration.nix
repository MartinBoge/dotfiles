{ config, pkgs, ... }:

{
  system.stateVersion = 6;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  system.primaryUser = "martin";

  users.users.martin = {
    name = "martin";
    home = "/Users/martin";
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    casks = [
      "ghostty"
      "fork"
      "docker-desktop"
      "pgadmin4"
      "font-jetbrains-mono-nerd-font"
      "visual-studio-code"
      "keepingyouawake"
      "slack"
      "spotify"
      "discord"
      "microsoft-edge"
      "microsoft-teams"
      "microsoft-word"
      "microsoft-excel"
      "microsoft-powerpoint"
      "microsoft-outlook"
      "microsoft-azure-storage-explorer"
      "onedrive"
    ];
  };
}
