{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "MesloLGM Nerd Font Mono";
        size = 10;
        # offset.y = 2;
      };

      colors.primary = {
        background = "#121212";
        foreground = "#d3d7cf";
      };

      colors.normal = {
        black = "#2e3436";
        red = "#cc0000";
        green = "#4e9a06";
        yellow = "#c4a000";
        blue = "#3465a4";
        magenta = "#75507b";
        cyan = "#06989a";
        white = "#d3d7cf";
      };

      colors.bright = {
        black = "#555754";
        red = "#ef2929";
        green = "#8ae234";
        yellow = "#fce94f";
        blue = "#729fcf";
        magenta = "#ad7fa8";
        cyan = "#34e2e2";
        white = "#eeeeec";
      };
    };
  };
}
