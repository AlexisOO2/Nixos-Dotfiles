{config,lib,pkgs, ... }:
{
  programs.yazi = {
  	enable = true;
	plugins = {
	   git = pkgs.yaziPlugins.git;
	   sudo = pkgs.yaziPlugins.sudo;
	   ouch = pkgs.yaziPlugins.ouch;
	   glow = pkgs.yaziPlugins.glow;
	   diff = pkgs.yaziPlugins.diff;
	   rsync = pkgs.yaziPlugins.rsync;
	   mount = pkgs.yaziPlugins.mount;
	   duckdb = pkgs.yaziPlugins.duckdb;
	   yatline = pkgs.yaziPlugins.yatline;
	   restore = pkgs.yaziPlugins.restore;
	   starship = pkgs.yaziPlugins.starship;
	   projects = pkgs.yaziPlugins.projects;
	   full-border = pkgs.yaziPlugins.full-border;
	};
	
	flavors = {
	   catppuccin-macchiato = ./catppuccin-macchiato.yazi;
	};
  };
}
