{config,lib,pkgs, ... }:
{

programs.tmux = {
	enable = true;
	mouse = true;
	prefix = "º";
	clock24 = true;
	keyMode = "vi";
	baseIndex = 1;
	terminal = "screen-256color";
	plugins = with pkgs; [
		tmuxPlugins.tokyo-night-tmux
		tmuxPlugins.vim-tmux-navigator
		tmuxPlugins.yank
		tmuxPlugins.tmux-which-key
	];
	extraConfig = ''
		set -g @plugin 'joshmedeski/tmux-nerd-font-window-name'
	'';
};




}
