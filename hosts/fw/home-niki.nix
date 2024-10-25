{ pkgs, lib, ... }:
{
  home.username = "niki";
  home.homeDirectory = "/home/niki";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # configuration follows
  home.packages = with pkgs; [
    pkgs.unstable.dropbox
    synology-drive-client
  ];

  imports = [
    ../../home
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      monospace-font-name = "MesloLGM Nerd Font Mono 10";
      color-scheme = "prefer-dark";
      scaling-factor = lib.gvariant.mkUint32 2;
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
