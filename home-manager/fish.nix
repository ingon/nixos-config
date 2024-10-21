{ ... }:
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      l = "eza --long";
      la = "eza --long --all";
      gs = "git status";
      gd = "git diff";
      gds = "git diff --staged";
      gl = "git checkout -";
      gp = "git pull";
      gpf = "git push -u origin HEAD --force-with-lease";
    };
  };
}
