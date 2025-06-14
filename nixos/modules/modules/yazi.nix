{config,lib,pkgs, ... }:
{
  programs.yazi = {
  	enable = true;
	initLua = ''
		require("starship"):setup()
		require("git"):setup()
		require("full-border"):setup()
	'';
	settings = {
		plugin = {
		      prepend_fetchers = [
		      	#{id = "git"; name = "*"; run = "git";}
			#{id = "git"; name = "*/"; run = "git";}
		      ];
		      prepend_previewers = [
		        #{name = "*.md"; run = "glow";}
		      ];
		};
		open = {
		#	rules = [
		#	  {mime = "video/*"; use = "play";}
		#	];

		};

		opener = {
		#	play = [
		#	  {run = '''haruna' "$@"''; orphan = true; for = "unix";}
		#	];
		};
	};
	theme = {
	  flavor = {
		dark = "catppuccin-macchiato";
		light = "cattppuccin-macchiato";
	  };

	};
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
