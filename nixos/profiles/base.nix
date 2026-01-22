{ config, pkgs, lib, ... }:

{
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Network
  networking.networkmanager.enable = true;

  # Timezone & Locale
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.extraLocaleSettings = {
	LC_ADDRESS = "fr_FR.UTF-8";
	LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
  };

  console.keyMap = "fr";

  # Shells
  programs.zsh.enable = true;

  # Base pkgs
  environment.systemPackages = with pkgs; [
	neovim git wget curl obsidian discord firefox
  ];
}
