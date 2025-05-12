{config, pkgs,...}:


{

  imports = [
	    ./waybar.nix
  ./yazi/yazi.nix
  ];
  home.username = "aiden";
  home.homeDirectory = "/home/aiden";
  home.stateVersion = "24.11";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
    	enable = true;
    	plugins = [ "git" "thefuck" "themes" ];
    	theme = "robbyrussell";
    };
    shellAliases = {
      ls = "eza -l --git --no-permissions --no-user --no-filesize --icons --colour=always --git --git-repos";
      lsa = "eza --all --icons --colour=always --git --git-repos -l";
      cat = "bat";
      nrs = "sudo nixos-rebuild switch";
      gucb = ''
      sudo cp -r /etc/nixos/ ~/nixos-dotfiles &&
      sudo cp -r .config/alacritty ~/nixos-dotfiles &&
      sudo cp -r .config/qtile ~/nixos-dotfiles &&
      sudo cp -r .config/hypr ~/nixos-dotfiles
      cd ~/nixos-dotfiles
      git add .
      git commit -m "New Version $(date)"
      git push origin main 
      cd 
      '';
    };
  };
  
  programs.starship = {
     enable = true; 
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
  programs.hyprlock = { 
    enable = true;
    settings = {
      general = {
    	disable_loading_bar = true;
    	grace = 60;
    	hide_cursor = true;
    	no_fade_in = false;
      };

      background = [
    	{
      	path = "~/Pictures/Wallpapers/animeskull.png";
      	blur_passes = 1;
      	blur_size = 1;
    	}
      ];

      input-field = [
    	{
      	size = "200, 50";
      	position = "0, -80";
      	monitor = "";
      	dots_center = true;
      	fade_on_empty = false;
      	font_color = "rgb(202, 211, 245)";
      	inner_color = "rgb(91, 96, 120)";
      	outer_color = "rgb(24, 25, 38)";
      	outline_thickness = 5;
      	placeholder_text = "Password:";
      	shadow_passes = 2;
    	}
      ];
      # Day-Month-Date
      label = [{
        text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
        color = "rgba(216, 222, 233, 0.70)";
        font_size = 25;
        font_family = "0xProto";
        position = "0, 350";
        halign = "center";
        valign = "center";
	}
	{
        text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
        color = "rgba(216, 222, 233, 0.70)";
        font_size = 120;
        font_family = "0xProto";
        position = "0, 250";
        halign = "center";
        valign = "center";
        }
      ];

      image = [{ 
    	path = "~/Pictures/profile.jpg";
    	border_size = 2;
    	border_color = "rgba(255, 255, 255, .65)";
    	size = 130;
    	rounding = -1;
   	rotate = 0;
    	reload_time = -1;
    	position = "0, 40";
    	halign = "center";
    	valign = "center";
      	}
      ];
    };
  };
}



