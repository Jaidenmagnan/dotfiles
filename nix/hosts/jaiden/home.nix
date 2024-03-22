{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jaiden";
  home.homeDirectory = "/home/jaiden";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config = { allowUnfree = true;};

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    neofetch
    kitty
    neovim
    spotify-tui
    webcord
    firefox
    spotify
    rofi-wayland
    ranger
    thefuck
    zsh
    zsh-autocomplete
    zsh-autosuggestions

    cava
    nitch
    tty-clock
    lxappearance
    whitesur-gtk-theme

    ncmpcpp


    vscode.fhs
    steam

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
    fira-code
    fira-code-symbols
    jetbrains-mono
    iosevka

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jaiden/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;
   initExtra = ''
   setopt NO_CASE_GLOB
   zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*      r:|=*' 'l:|=* r:|=*'
   '';

  oh-my-zsh = {
	enable = true;
	plugins = ["git" "thefuck" ];
	theme = "robbyrussell";
  };

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake .";
  };
  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";
};

  programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhs;
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    yzhang.markdown-all-in-one
    zhuangtongfa.material-theme
    ms-python.python
    ms-vscode.cpptools

  ]

  ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "Mountain";
        publisher = "MrAirport";
        version = "0.0.1";
        sha256 = "33fef0006171dec6ab4f4184c1fda41d45885a1c0f19f64ea8a8e7eca7080395";
      }
	];

  userSettings = {
    "editor.fontFamily"= "'JetBrains Mono SemiBold'";
    "editor.fontSize" = 14;
    "window.titleBarStyle" = "custom";
    "workbench.iconTheme" = "Material";
    "workbench.colorTheme" = "Mountain";
  };
};

}
