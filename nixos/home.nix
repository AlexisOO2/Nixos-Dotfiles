{config, pkgs,...}:


{
  home.username = "aiden";
  home.homeDirectory = "/home/aiden";
  home.stateVersion = "24.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza -l --git --no-permissions --no-user --no-filesize --icons --colour=always --git --git-repos";
      lsa = "eza --all --icons --colour=always --git --git-repos -l";
      cat = "bat";
      nrs = "sudo nixos-rebuild switch";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font.normal = {
        family = "0xProto";
        style = "Regular";
      };
      font.size = 12;
    };
  };
  programs.rofi = {
    enable = true;
    font = "0xProto";
    terminal = "alacritty";
    theme = "/nix/store/1jqlhlvjsc1cs0vy3sxyd8jx4dai1f42-rofi-1.7.5/share/rofi/themes/Arc-Dark.rasi"; 
  };
}



