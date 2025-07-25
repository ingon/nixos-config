{ pkgs, lib, ... }:
{
  home.username = "niki";
  home.homeDirectory = "/home/niki";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # configuration follows
  home.packages = [
    pkgs.unstable.dropbox
    pkgs.synology-drive-client
    pkgs.opvaultfx
    pkgs.authenticator
  ];

  imports = [
    ../../modules/home
  ];

  ingon.home-modules.neovim.enableVimgo = true;
  ingon.home-modules.helix.package = pkgs.unstable.helix;
  ingon.home-modules.helix.enableGo = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      monospace-font-name = "MesloLGM Nerd Font Mono 10";
      color-scheme = "prefer-dark";
      scaling-factor = lib.gvariant.mkUint32 2;
      show-battery-percentage = true;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
      night-light-temperature = lib.gvariant.mkUint32 3700;
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

  services.syncthing.enable = true;
  programs.keepassxc.enable = true;
}
