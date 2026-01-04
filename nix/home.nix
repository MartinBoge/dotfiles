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
    terminal = "screen-256color";
    prefix = "C-a";
    mouse = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
      continuum
      {
        plugin = pkgs.tmuxPlugins.power-theme;
        extraConfig = ''
          set -g @tmux_power_theme 'default'
        '';
      }
    ];

    extraConfig = ''
      # Custom keybindings
      unbind %
      bind | split-window -h

      unbind '"'
      bind - split-window -v

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"

      # Copy mode
      bind -T copy-mode-vi 'v' send -X begin-selection
      unbind -T copy-mode-vi MouseDragEnd1Pane

      ${
        if pkgs.stdenv.isDarwin then
          ''
            bind -T copy-mode-vi 'y' send-keys -X copy-pipe 'pbcopy'
          ''
        else
          ''
            bind -T copy-mode-vi 'y' send -X copy-selection
          ''
      }

      # Plugin settings
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
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
