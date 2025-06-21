{config, pkgs, ...}:
{
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
}
