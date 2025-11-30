{ config, lib, ... }:
let
  cfg = config.ingon.home-modules.git;
in
{
  options.ingon.home-modules.git = {
    enable = lib.mkEnableOption "home-manager git config" // {
      default = true;
    };

    email = lib.mkOption {
      type = lib.types.str;
      default = "sungon@gmail.com";
      description = "git config user.email";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = cfg.email;
          name = "Nikolay Petrov";
        };
        rerere.enabled = true;
        init.defaultBranch = "main";
      };
    };

    programs.diff-so-fancy = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
