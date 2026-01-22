{ config, pkgs, inputs, ... }:

{
  # Home Manager base
  home.username = "snaxx";
  home.homeDirectory = "/home/snaxx";
  home.stateVersion = "25.11";

  imports = [
    ./shell-zsh-p10k.nix
    ./terminal-kitty.nix
    ./cli-fastfetch.nix
    ./desktop-hyprland.nix
  ];

  programs.git.enable = true;

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
  xdg.enable = true;

  # Packages user
  home.packages = with pkgs; [
    # Terminal utils
    kitty
    fzf
    zoxide
    eza
    bat
    ripgrep
    tldr
    btop
    htop
    fastfetch

    # Dev
    neovim
    vscode
    gcc
    gnumake
    python3

    # Apps
    deezer-enhanced

    # Hyprland
    swww
    hyprlock
    hyprpaper
    hypridle
    brightnessctl
    playerctl
    pamixer
    networkmanagerapplet
    blueman
    grim
    slurp
    wl-clipboard	

    # Archives
    unzip
    zip
    p7zip

    # Network
    nmap
    netcat-gnu
    tcpdump
    tshark

    # Zsh plugins
    zsh-you-should-use
    zsh-completions
  ];
}
