{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    exegol
  ];
}
