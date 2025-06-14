{config, pkgs, ...}:
{
  programs.rofi = {
    enable = true;
    font = "0xProto";
    terminal = "alacritty";
    theme = "material";
  };
}
