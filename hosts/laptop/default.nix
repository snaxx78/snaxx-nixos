{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../nixos/profiles/base.nix
    ../../nixos/profiles/desktop-hyprland-sddm.nix
    ../../nixos/profiles/docker.nix
    ../../nixos/profiles/wireshark.nix
];

# Machine specific : boot + hostname
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "nixos";

# User
users.users.snaxx = {
  isNormalUser = true;
  description = "Snaxx";
  extraGroups = [ "networkmanager" "wheel" "docker" "wireshark" ];
  shell = pkgs.zsh;
 };

 system.stateVersion = "25.11";
}
