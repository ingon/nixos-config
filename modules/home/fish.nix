{ ... }:
{
  programs.fish = {
    enable = true;
    # preferAbbrs = true; // home-manager master
    shellAbbrs = {
      l = "eza --long";
      la = "eza --long --all";
      gs = "git status";
      gd = "git diff";
      gds = "git diff --staged";
      gl = "git switch -";
      gp = "git pull";
      gpf = "git push -u origin HEAD --force-with-lease";
    };
  };
}
