{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "sungon@gmail.com";
    userName = "Nikolay Petrov";
    diff-so-fancy.enable = true;
    extraConfig = {
      rerere.enabled = true;
      init.defaultBranch = "main";
    };
  };
}
