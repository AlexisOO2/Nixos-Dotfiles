# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];
  
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.aiden = import ./home.nix;
  
  hardware.xpadneo.enable = true;
  hardware.xone.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver = {
  	enable = true;
  	windowManager.qtile.enable = true;
	displayManager.sddm ={
		enable = true;
		wayland.enable = true;
		package = pkgs.plasma5Packages.sddm;
	};
	displayManager.sessionCommands = ''
		xwallpaper --zoom ~/Pictures/Wallpapers/animeskull.png
		xset r rate 200 35 &
	'';
  	#videoDrivers = [ "amdgpu" ];
  	xkb.layout = "es";

  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.picom = {
  	enable = true;
  	backend = "glx";
	fade = true;
  };
   
  programs.zsh.enable = true;
  
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  networking.hostName = "nixos-aiden"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true; 

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];



  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services.blueman.enable = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aiden = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;



 nixpkgs.config.allowUnfree = true; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
 environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   git
   alacritty
   btop
   gedit
   brave
   syncthing
   syncthing-tray
   gcc
   rofi-wayland
   amdgpu_top
   #amdvlk
   nvtopPackages.full
   #amdenc
   steam
   neofetch
   obsidian
   lutris
   heroic
   gnumake
   fzf
   eza
   bat
   vscodium
   spotify
   pwvucontrol
   gparted
   ferium
   discord
   appimage-run
   python312Packages.pip
   nodejs_23
   cargo
   ripgrep
   lazygit
   neovim
   qbittorrent
   goverlay
   mangohud
   mesa-demos
   vulkan-tools
   vkbasalt
   build2
   mesa
   yazi
   swi-prolog
   ghc
   tldr
   shotcut
   haruna 
   libsForQt5.full
   unzip
   kissat
   xwallpaper
   protonup-qt
   bluez
   bluez-alsa
   linuxKernel.packages.linux_zen.xpadneo
   linuxKernel.packages.linux_xanmod_latest.xone
   tmux
   blender
   godot_4
   androidStudioPackages.dev
   xfce.thunar
   dunst
   hyprpaper
   waybar
   networkmanagerapplet
   hyprwall
   hyprlock
   cava
   playerctl
   zsh-syntax-highlighting
   zsh-autosuggestions
   starship
   thefuck
   usbutils
   udiskie
   udisks
   gvfs
   rclone
   hyprshot
   teamviewer
   openrgb
];
 
  fonts.packages = with pkgs; [
  	_0xproto
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

