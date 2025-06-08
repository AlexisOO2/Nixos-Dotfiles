{config, pkgs,...}:


{

  imports = [
	    ./waybar.nix
  ./yazi/yazi.nix
  ];
  home.username = "aiden";
  home.homeDirectory = "/home/aiden";
  home.stateVersion = "25.05"; 

	home.pointerCursor = 
	    let 
	      getFrom = url: hash: name: {
		  gtk.enable = true;
		  x11.enable = true;
		  name = name;
		  size = 148;
		  package = 
		    pkgs.runCommand "moveUp" {} ''
		      mkdir -p $out/share/icons
		      ln -s ${pkgs.fetchzip {
			url = url;
			hash = hash;
		      }} $out/share/icons/${name}
		  '';
		};
	    in
	      getFrom 
		"https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz"
		"sha256-2Fd0OVSCgFZVLRAVo/MxgHp1qK5WUNhKY685XPYrBmk="
		"bibata-cursors";


  programs.zsh.sessionVariables = {
  	EDITOR = "nvim";
  };

  wayland.systemd.target = "hyprland-session.target";
  wayland.windowManager.hyprland = {
  	enable = true;
	systemd.enable = true;
	xwayland.enable = true;
	systemd.variables = ["--all"];
	settings = {
		"monitor" = ",preferred,auto,auto";
		"$terminal" = "alacritty";
		"$fileManager" = "thunar";
		"$menu" = "rofi -show drun -show-icons";
		"$browser" = "firefox";
		exec-once = [
			"systemctl"
			"clipse -listen"
			"nm-applet"
			"waybar"  
			"hyprpaper" 
			"syncthing"
		];
		env = [
		 	"XCURSOR_SIZE,24"
			"HYPRCURSOR_SIZE,24"
		];
		general = {
		    gaps_in = 5;
		    gaps_out = 20;

		    border_size = 2;

		    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
		    "col.inactive_border" = "rgba(595959aa)";

		    # Set to true enable resizing windows by clicking and dragging on borders and gaps
		    resize_on_border = false;

		    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		    allow_tearing = false;

		    layout = "dwindle";
		};

		decoration = {
			rounding = 10;

			# Change transparency of focused and unfocused windows
			active_opacity = "1.0";
			inactive_opacity = "1.0";

		    	shadow = {
				enabled = true;
				range = 4;
				render_power = 3;
				color = "rgba(1a1a1aee)";
			};

			# https://wiki.hyprland.org/Configuring/Variables/#blur
			blur = {
				enabled = true;
				size = 3;
				passes = 1;
				vibrancy = "0.1696";
			};
	     	};
		animations = {
			enabled = "yes, please :)";

		    	# Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
			bezier = [
				"easeOutQuint,0.23,1,0.32,1"
				"easeInOutCubic,0.65,0.05,0.36,1"
				"linear,0,0,1,1"
				"almostLinear,0.5,0.5,0.75,1.0"
				"quick,0.15,0,0.1,1"
			];
			animation = [
				"global, 1, 10, default"
				"border, 1, 5.39, easeOutQuint"
				"windows, 1, 4.79, easeOutQuint"
				"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
				"windowsOut, 1, 1.49, linear, popin 87%"
				"fadeIn, 1, 1.73, almostLinear"
				"fadeOut, 1, 1.46, almostLinear"
				"fade, 1, 3.03, quick"
				"layers, 1, 3.81, easeOutQuint"
				"layersIn, 1, 4, easeOutQuint, fade"
				"layersOut, 1, 1.5, linear, fade"
				"fadeLayersIn, 1, 1.79, almostLinear"
				"fadeLayersOut, 1, 1.39, almostLinear"
				"workspaces, 1, 1.94, almostLinear, fade"
				"workspacesIn, 1, 1.21, almostLinear, fade"
				"workspacesOut, 1, 1.94, almostLinear, fade"
			];
		};
		dwindle = {
		    	pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		    	preserve_split = true; # You probably want this
		};

		master = {
    			new_status = "master";
		};

		misc = {
			force_default_wallpaper = 0;
			disable_hyprland_logo = true;
		};

		input = {
			kb_layout = "es";
			repeat_delay = 200;
			repeat_rate = 35;
			follow_mouse = 1;

			sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

			touchpad = {
				natural_scroll = false;
		    	};
		};
		
		gestures = {
			workspace_swipe = false;
		};
		
		device = {
			name = "epic-mouse-v1";
			sensitivity = "-0.5";
		};

		"$mainMod" = "SUPER";

		bind = [
			"ALT, T, exec, $terminal"
			"$mainMod, Q, killactive,"
			"$mainMod, M, exit,"
			"$mainMod, E, exec, $fileManager"
			"$mainMod, F, togglefloating,"
			"$mainMod, D, exec, $menu"
			"$mainMod, P, pseudo," # dwindle
			"$mainMod, J, togglesplit," # dwindle
			"$mainMod, B, exec, $browser"
			"ALT, tab, exec, rofi -show window"
			"$mainMod, L, exec, hyprlock"
			"$mainMod, R, exec, rofi -show run"
			"$mainMod, O, exec, obsidian"
			"$mainMod, V, exec,  $terminal --class clipse -e 'clipse'"
			"$mainMod, Return, fullscreen"
			"$mainMod, A, pin"
			"$mainMod, S, exec, hyprshot -z -m region -o ~/Pictures/Screenshots/"
			"$mainMod SHIFT, S, exec, hyprshot -z -m output -o ~/Pictures/Screenshots/"

			"$mainMod, left, movefocus, l"
			"$mainMod, right, movefocus, r"
			"$mainMod, up, movefocus, u"
			"$mainMod, down, movefocus, d"
			"$mainMod, 1, workspace, 1"
			"$mainMod, 2, workspace, 2"
			"$mainMod, 3, workspace, 3"
			"$mainMod, 4, workspace, 4"
			"$mainMod, 5, workspace, 5"
			"$mainMod, 6, workspace, 6"
			"$mainMod, 7, workspace, 7"
			"$mainMod, 8, workspace, 8"
			"$mainMod, 9, workspace, 9"
			"$mainMod, 0, workspace, 10"

			"$mainMod SHIFT, 1, movetoworkspace, 1"
			"$mainMod SHIFT, 2, movetoworkspace, 2"
			"$mainMod SHIFT, 3, movetoworkspace, 3"
			"$mainMod SHIFT, 4, movetoworkspace, 4"
			"$mainMod SHIFT, 5, movetoworkspace, 5"
			"$mainMod SHIFT, 6, movetoworkspace, 6"
			"$mainMod SHIFT, 7, movetoworkspace, 7"
			"$mainMod SHIFT, 8, movetoworkspace, 8"
			"$mainMod SHIFT, 9, movetoworkspace, 9"
			"$mainMod SHIFT, 0, movetoworkspace, 10"

			"$mainMod CTRL, 1, movetoworkspacesilent, 1"
			"$mainMod CTRL, 2, movetoworkspacesilent, 2"
			"$mainMod CTRL, 3, movetoworkspacesilent, 3"
			"$mainMod CTRL, 4, movetoworkspacesilent, 4"
			"$mainMod CTRL, 5, movetoworkspacesilent, 5"
			"$mainMod CTRL, 6, movetoworkspacesilent, 6"
			"$mainMod CTRL, 7, movetoworkspacesilent, 7"
			"$mainMod CTRL, 8, movetoworkspacesilent, 8"
			"$mainMod CTRL, 9, movetoworkspacesilent, 9"
			"$mainMod CTRL, 0, movetoworkspacesilent, 10"

			"$mainMod, tab, togglespecialworkspace, magic"
			"$mainMod SHIFT, tab, movetoworkspace, special:magic"

			"$mainMod, mouse_down, workspace, e+1"
			"$mainMod, mouse_up, workspace, e-1"

		];
		bindm = [
			"$mainMod, mouse:272, movewindow"
			"$mainMod, mouse:273, resizewindow"
		];

		bindel = [
			",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
			",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
			",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
			",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
		];

		bindl = [
			", XF86AudioNext, exec, playerctl next"
			", XF86AudioPause, exec, playerctl play-pause"
			", XF86AudioPlay, exec, playerctl play-pause"
			", XF86AudioPrev, exec, playerctl previous"
		];
		
		windowrulev2 = [
			"suppressevent maximize, class:.*"
			"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			"float,class:(clipse)"
			"size 622 652,class:(clipse)"
			"noanim,class:ueberzugpp"
			"noanim,class:ueberzugpp"
		];
	};
  };

  services.clipse = {
  	enable = true;
	systemdTarget = "hyprland-session.target";
  };


  services.hyprpaper = {
  	enable = true;
	settings = {
	  ipc = "on";
	  splash = false;
  	  splash_offset = 2.0;
	  preload = ["~/Pictures/Wallpapers/animeskull.png"];
	  wallpaper = ["DP-2,~/Pictures/Wallpapers/animeskull.png"];
	};
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
    	enable = true;
    	plugins = [ "git" "thefuck" "themes" "zoxide" ];
    	theme = "robbyrussell";
    };
    shellAliases = {
      ls = "eza -l --git --no-permissions --no-user --no-filesize --icons --colour=always --git --git-repos";
      lsa = "eza --all --icons --colour=always --git --git-repos -l";
      cat = "bat";
      nrs = ''
      sudo nixos-rebuild switch &&
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



