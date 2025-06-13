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
      sudo cp -r /etc/nixos/ ~/nixos-dotfiles &&
      cd ~/nixos-dotfiles
      git add .
      git commit -m "New Version $(date)"
      git push origin main 
      cd 
      '';
      upb = ''
      cd ~/nixos-dotfiles
      git pull origin main
      sudo cp -r ./nixos/modules/ /etc/nixos/
      sudo cp ./nixos/packages.nix /etc/nixos
      sudo cp ./nixos/home.nix /etc/nixos
      cd
      '';
    };
  };
}
