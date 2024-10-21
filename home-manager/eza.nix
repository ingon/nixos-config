{ ... }:
{
  programs.eza = {
    enable = true;
    extraOptions = [
      "--header"
      "--group"
      "--git"
      "--time-style=long-iso"
    ];
  };
}
