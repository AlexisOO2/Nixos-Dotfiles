{config, pkgs, ...}:
{
programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = -1.9;
      font.normal = {
        family = "0xProto";
        style = "Regular";
      };
      font.size = 11;
    };
  };
}
