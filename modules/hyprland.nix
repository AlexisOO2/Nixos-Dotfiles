{config, pkgs,...}:
{
  wayland.systemd.target = "hyprland-session.target";
  wayland.windowManager.hyprland = {
  	enable = true;
	systemd.enable = true;
	xwayland.enable = true;
	systemd.variables = ["--all"];
	plugins = [];

	settings = {
		plugin = {
		
		};
		
		"monitor" = ",highres,auto,1";
		"$terminal" = "alacritty";
		"$fileManager" = "yazi";
		"$menu" = "rofi -show drun -show-icons";
		"$browser" = "firefox";
		exec-once = [
			"systemctl"
			"swaync"
			"blueman-applet"
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
		    gaps_in = 3;
		    gaps_out = 20;

		    border_size = 2;

		    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		    "col.active_border" = "rgba(85287Bff)";
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
			inactive_opacity = "0.95";

		    	shadow = {
				enabled = false;
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
				"workspaces, 1, 1.94, easeInOutCubic, slide"
				"workspacesIn, 1, 1.21, easeInOutCubic, slide"
				"workspacesOut, 1, 1.94, easeInOutCubic, slide"
				"specialWorkspace, 1, 1.94, easeInOutCubic, slidevert"
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
			"$mainMod, E, exec, $terminal -e $fileManager"
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
			"$mainMod, N, exec, swaync-client -t -sw"
			
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
			"noanim,class:(ueberzugpp)"
			"noanim,class:(ueberzugpp)"
		];
	};
  };
}
