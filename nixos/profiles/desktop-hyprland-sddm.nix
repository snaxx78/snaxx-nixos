{ config, pkgs, lib, ... }:

{
  # Display Manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Lien vers la session Hyprland pour SDDM
  environment.etc."sddm/wayland-sessions/hyprland.desktop".source = 
    "${pkgs.hyprland}/share/wayland-sessions/hyprland.desktop";

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
