{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      trusted-users = [ "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc.automatic = true;
    optimise.automatic = true;
  };

  security.sudo.wheelNeedsPassword = false;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  programs.git.enable = true;

  programs.direnv.enable = true;

  services.fwupd.enable = true;
}
