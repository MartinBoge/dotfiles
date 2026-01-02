{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    git
    lazygit
    unzip
    ripgrep
    python3
    gcc
    tree-sitter

    # Development
    neovim
    uv
    nodejs_24

    # LSPs and formatters
    nixd
    nixfmt
    lua-language-server
    stylua
    pyright
    ruff
  ];

  programs.git = {
    enable = true;
    userName = "Martin Bøge Jørgensen";
    userEmail = "martin.boge@live.dk";

    extraConfig = { init.defaultBranch = "main"; };
  };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/neovim";

  programs.home-manager.enable = true;
}
