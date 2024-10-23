{ config, pkgs, ... }:
{
  home.username = "niki";
  home.homeDirectory = "/home/niki";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # configuration follows
  home.packages = with pkgs; [
    ripgrep
    fd
    bat
    jq
    pkgs.unstable.dropbox
    synology-drive-client
  ];

  imports = [
    ../../home/eza.nix
    ../../home/fish.nix
    ../../home/git.nix
    ../../home/helix.nix
    ../../home/alacritty.nix
    ../../home/neovim.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      monospace-font-name = "MesloLGM Nerd Font Mono 10";
    };
  };

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
