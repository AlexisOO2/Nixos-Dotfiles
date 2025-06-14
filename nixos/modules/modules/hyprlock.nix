{config, pkgs, ...}:
{
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
