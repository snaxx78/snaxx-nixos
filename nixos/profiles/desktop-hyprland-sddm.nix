{ config, pkgs, lib, ... }:

let
  catppuccinTheme = pkgs.catppuccin-sddm.override {
    flavor = "mocha";
    accent = "mauve";
  };
in
{
  # Display Manager SDDM + thème Catppuccin
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;

    # IMPORTANT : le dossier réel dans nixpkgs est catppuccin-mocha-mauve
    theme = "${catppuccinTheme}/share/sddm/themes/catppuccin-mocha-mauve";

    # Il faut embarquer le thème dans le système
    extraPackages = [ catppuccinTheme ];
  };

  # Clavier AZERTY
  services.xserver = {
    enable = true;
    xkb.layout = "fr";
  };
  console.keyMap = "fr";

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
