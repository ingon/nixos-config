{ config, lib, ... }:
let
  cfg = config.ingon.home-modules.git;
in
{
  options.ingon.home-modules.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "home-manager git config";
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
      userEmail = cfg.email;
      userName = "Nikolay Petrov";
      diff-so-fancy.enable = true;
      extraConfig = {
        rerere.enabled = true;
        init.defaultBranch = "main";
      };
    };
  };
}
