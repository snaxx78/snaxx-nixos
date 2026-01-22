{ config, pkgs, lib, ... }:
{
  # Display Manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # FIX CRITIQUE : Configuration PAM pour SDDM
  security.pam.services.sddm.enableGnomeKeyring = lib.mkForce false;
  security.pam.services.sddm-greeter.enableGnomeKeyring = lib.mkForce false;
  
  # Permettre à SDDM d'accéder au shadow password
  users.users.sddm.group = "sddm";
  users.groups.sddm = {};

  # XDG Portal pour Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
