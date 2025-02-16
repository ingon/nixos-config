{ pkgs, lib, ... }:
{
  home.username = "niki";
  home.homeDirectory = "/home/niki";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home
  ];
}
