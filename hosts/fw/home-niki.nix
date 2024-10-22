{ config, pkgs, ... }:
{
  home.username = "niki";
  home.homeDirectory = "/home/niki";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # configuration follows
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
    pkgs.unstable.dropbox
    ripgrep
    synology-drive-client
  ];

  imports = [
    ../../home/eza.nix
    ../../home/fish.nix
    ../../home/git.nix
    ../../home/helix.nix
    ../../home/alacritty.nix
  ];

  systemd.user.services.dropbox = {
    Unit = {
      Description = "Dropbox service";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = "${pkgs.unstable.dropbox}/bin/dropbox";
      Restart = "on-failure";
    };
  };
}
