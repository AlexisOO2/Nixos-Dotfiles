{config, pkgs, ...}:
{
  services.clipse = {
  	enable = true;
	systemdTarget = "hyprland-session.target";
  };
}
