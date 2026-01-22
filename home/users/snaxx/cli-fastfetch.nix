{ config, pkgs, ... }:

{ 
  programs.fastfetch = {
    enable = true;
    # symlink fichier fastfetch
  };

  xdg.configFile."fastfetch/config.jsonc".source = ../../../dotfiles/fastfetch/config.jsonc;
}
