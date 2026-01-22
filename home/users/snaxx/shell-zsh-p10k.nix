{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
   

   # plugins
   plugins = [ 
	{
	  name = "powerlevel10k";
	  src = pkgs.zsh-powerlevel10k;
	  file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
	}
  ];


  initContent = ''
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
  '';
 };

 home.file.".p10k.zsh".source = ../../../dotfiles/zsh/.p10k.zsh;
}
