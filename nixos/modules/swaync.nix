{config,pkgs,...}:
{
  services.swaync = {
    enable = true;
    settings = {
	    positionX = "center";
	    positionY = "top";
	    layer = "overlay";
	    control-center-layer = "top";
	    layer-shell = true;
	    cssPriority = "application";
	    control-center-margin-top = 20;
	    control-center-margin-bottom = 0;
	    control-center-margin-right = 0;
	    control-center-margin-left = 0;
	    notification-2fa-action = true;
	    notification-inline-replies = false;
	    notification-icon-size = 64;
	    notification-body-image-height = 120;
	    notification-body-image-width = 200;
	    fit-to-screen = false;
     };
    style = ''
	:root {
	  --cc-bg: rgba(46, 46, 46, 0.7);

	  --noti-border-color: rgba(133, 40, 123, 1);
	  --noti-bg: 48, 48, 48;
	  --noti-bg-alpha: 0.8;
	  --noti-bg-darker: rgb(38, 38, 38);
	  --noti-bg-hover: rgb(56, 56, 56);
	  --noti-bg-focus: rgba(68, 68, 68, 0.6);
	  --noti-close-bg: rgb(78, 78, 78);
	  --noti-close-bg-hover: rgb(94, 94, 94);

	  --text-color: rgb(255, 255, 255);
	  --text-color-disabled: rgb(150, 150, 150);

	  --bg-selected: rgb(0, 128, 255);
	}

    '';
   };
}

