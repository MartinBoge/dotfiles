{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    lazygit
    unzip
    ripgrep
    jq
    tmux
    python3
    gcc
    tree-sitter
    oh-my-posh

    # Development
    neovim
    uv
    nodejs_24
    pnpm
    azure-cli
    azure-storage-azcopy
    terraform
    libpq
    claude-code

    # LSPs and formatters
    nixd
    nixfmt
    lua-language-server
    stylua
    pyright
    ruff
  ];

  home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/shell/.zshrc";

  home.file.".config/oh-my-posh/config.json".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/oh-my-posh/config.json";

  home.file.".config/nixpkgs/config.nix".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/nix/config.nix";

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/neovim";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Martin Bøge Jørgensen";
    userEmail = "martin.boge@live.dk";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
