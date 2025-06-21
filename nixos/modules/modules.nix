{config, pkgs, ...}:
{
  imports = [
    	./alacritty.nix
	./clipse.nix
	./hyprland.nix
	./hyprlock.nix
	./hyprpaper.nix
	#./hyprpanel.nix
	./rofi.nix
	./starship.nix
	./tmux.nix
	./yazi.nix
	./zsh.nix
  ];

}
