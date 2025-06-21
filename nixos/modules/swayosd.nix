{config,lib,pkgs, ... }:
{
 services.swayosd = {
 	enable = true;
 	stylePath = "/etc/nixos/modules/swayosd-style.css";
	topMargin = 0.9; 
 };
}
