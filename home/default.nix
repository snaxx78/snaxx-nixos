{ config, pkgs, inputs, ... }:

{
  # Home Manager base
  home.username = "snaxx";
  home.homeDirectory = "/home/snaxx";
  home.stateVersion = "25.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Packages user
  home.packages = with pkgs; [
    # Terminal utils
    kitty
    starship
    fzf
    zoxide
    eza
    bat
    ripgrep
    tldr
    btop
    htop
    fastfetch
    neofetch

    # Dev
    neovim
    vscode
    gcc
    gnumake
    python3

    # Apps
    discord
    spotify
    obsidian
    vlc
    chromium

    # Hyprland
    waybar
    rofi
    swww
    hyprlock
    hyprpaper
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
    zsh-powerlevel10k
  ];
}
