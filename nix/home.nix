{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    lazygit
    unzip
    ripgrep
    jq
    python3
    gcc
    tree-sitter

    # Development
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

  programs.home-manager.enable = true;

  home.file.".config/nixpkgs/config.nix".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/nix/config.nix";

  home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/shell/.zshrc";

  programs.oh-my-posh.enable = true;
  home.file.".config/oh-my-posh/config.json".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/oh-my-posh/config.json";

  programs.neovim.enable = true;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/neovim";

  programs.tmux.enable = true;
  home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/tmux/.tmux.conf";

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
