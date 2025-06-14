{config,pkgs,...}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
    	enable = true;
    	plugins = [ "git" "thefuck" "themes" "zoxide" ];
    	theme = "robbyrussell";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      ls = "eza -l --git --no-permissions --no-user --no-filesize --icons --colour=always --git --git-repos";
      lsa = "eza --all --icons --colour=always --git --git-repos -l";
      cat = "bat";
      nrs = ''
      sudo nixos-rebuild switch &&
      sudo cp -r /etc/nixos/packages.nix ~/nixos-dotfiles/nixos/
      sudo cp -r /etc/nixos/home.nix ~/nixos-dotfiles/nixos/
      sudo cp -r /etc/nixos/modules ~/nixos-dotfiles/nixos/modules/
      cd ~/nixos-dotfiles
      git add .
      git commit -m "New Version $(date)"
      git push origin main 
      cd 
      '';
      upb = ''
      cd ~/nixos-dotfiles
      git pull origin main
      sudo cp --update=all nixos/modules/* /etc/nixos/module/s
      sudo cp --update=all nixos/packages.nix /etc/nixos
      sudo cp --update=all nixos/home.nix /etc/nixos
      sudo nixos-rebuild switch
      cd
      '';
    };
  };
}
