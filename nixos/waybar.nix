{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["clock" "custom/notification" "custom/weather" ];
        modules-right = ["cava" "pulseaudio" "custom/mem" "cpu" "backlight" "battery" "temperature"  "tray"];

    "hyprland/workspaces"= {
        format= "{icon}";
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
    }; 
    
    "hyprland/window"= {
        format= "{}";
	icon = true;
	icon-size = 24;
        separate-outputs = true;
    };

    "clock" = {
        timezone = "Europe/Madrid";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%a %d %b %H:%M}";
    };

    "custom/weather" = {
          format = " {} ";
          exec = "curl -s 'wttr.in/Tarragona?format=%c%t'";
          interval = 300;
          class = "weather";
    };

    cava= {
        framerate = 30;
        autosens = 1;
        sensetivity = 100;
	bars= 14;
        lower_cutoff_freq= 50;
        higher_cutoff_freq= 10000;
        method= "pulse";
        source= "auto";
        stereo= true;
        reverse= false;
        bar_delimiter= 0;
        monstercat= false;
        waves= false;
        noise_reduction= 0.77;
        input_delay= 2;
        format-icons= ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
    };

    "pulseaudio" = {
        # scroll-step = 1; # %, can be a float
        reverse-scrolling = 1;
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon}  {format_source}";
        format-bluetooth-muted = " {icon}  {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
        };
        on-click = "pavucontrol";
        min-length = 13;
    };

    "custom/mem" = {
        format = "{} ";
        interval = 3;
        exec = "free -h | awk '/Mem:/{printf $3}'";
        tooltip = false;
    };

    "cpu" = {
      interval = 2;
      format = "{usage}% ";
      min-length = 6;
    };

    "temperature" = {
        thermal-zone = 2;
        hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
        critical-threshold = 80;
        format-critical = "{temperatureC}°C {icon}";
        format = "{temperatureC}°C {icon}";
        format-icons = ["" "" "" "" ""];
        tooltip = false;
    };

    "backlight" = {
        device = "intel_backlight";
        format = "{percent}% {icon}";
        format-icons = [""];
        min-length = 7;
    };
	"custom/notification" = {
	    tooltip = false;
	    format = "{} {icon}";
	    format-icons = {
	      notification = "<span foreground='red'><sup></sup></span>";
	      none = "";
	      dnd-notification = "<span foreground='red'><sup></sup></span>";
	      dnd-none = "";
	      inhibited-notification = "<span foreground='red'><sup></sup></span>";
	      inhibited-none = "";
	      dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
	      dnd-inhibited-none = "";
	    };
	    return-type = "json";
	    exec-if = "which swaync-client";
	    exec = "swaync-client -swb";
	    on-click =  "swaync-client -t -sw";
	    on-click-right = "swaync-client -d -sw";
	    escape = true;
	};
    battery = {
        states = {
            warning = 30;
            critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% 󰂄";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
	on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
    };

    tray = {
        icon-size = 16;
        spacing = 0;
    };

      };
    };
  
    style = 
      ''
* {
    border: none;
    border-radius: 0;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: "0xProto";
    font-weight: bold; 
    min-height: 20px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0.2;
}

#window {
    padding-right: 16px;
    padding-left: 8px;
    border-radius: 10px;
    transition: none;
    background: #383c4a;
    color: #ffffff;
}

#workspaces {
    margin-right: 8px;
    border-radius: 10px;
    transition: none;
    background: #383c4a;
}

#workspaces button {
    transition: none;
    color: #7c818c;
    background: transparent;
    padding: 5px;
    font-size: 18px;
}

#workspaces button.persistent {
    color: #7c818c;
    font-size: 12px;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #383c4a;
    background: #7c818c;
}

#workspaces button.active {
    background: #4e5263;
    color: white;
    border-radius: inherit;
}

#keyboard-state {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-pacman {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-mail {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#submap {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#clock {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-weather {
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#cava {
    padding-right: 16px;
    padding-left: 16px;
    margin-right: 8px;
    border-radius: 10px;
    transition: none;
    background: #383c4a;
    color: #ffffff;
}

#pulseaudio {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}

#custom-mem {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#cpu {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#temperature {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#backlight {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#battery {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#battery.charging {
    color: #ffffff;
    background-color: #26A65B;
}

#battery.warning:not(.charging) {
    background-color: #ffbe61;
    color: black;
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#custom-notification {
    padding-left: 16px;
    padding-right: 16px;
    color: #ffffff;
    background: #383c4a;
}

#tray {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}
      '';
  };
}
