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
    gnumake
    docker
    postgresql_16
    pgadmin4
    tree-sitter
    vscode-langservers-extracted

    # Development
    uv
    nodejs_24
    pnpm
    azure-cli
    azure-storage-azcopy
    terraform
    claude-code

    # LSPs and formatters
    nixd
    nixfmt
    lua-language-server
    stylua
    pyright
    ruff
    prettier
    typescript-language-server
    typescript
    svelte-language-server
  ];

  programs.home-manager.enable = true;

  home.file.".config/nixpkgs/config.nix".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nix/config.nix";

  home.file.".zshrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/shell/.zshrc";

  programs.oh-my-posh.enable = true;
  home.file.".config/oh-my-posh/config.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/oh-my-posh/config.json";

  programs.neovim.enable = true;
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/neovim";

  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    extraConfig = ''
      source-file ~/dotfiles/tmux/.tmux.conf
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Martin Bøge Jørgensen";
      user.email = "martin.boge@live.dk";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
