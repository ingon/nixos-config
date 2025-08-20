{ pkgs, config, lib, ... }:
let
  cfg = config.ingon.home-modules.helix;
in
{
  options.ingon.home-modules.helix = {
    enable = lib.mkEnableOption "home-manager helix config" // {
      default = true;
    };

    package = lib.mkPackageOption pkgs "helix" { };

    enableGo = lib.mkEnableOption "add gopls to support go repos";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nixd
      nixpkgs-fmt
    ] ++ lib.optionals cfg.enableGo [ go gopls ];

    programs.helix = {
      enable = true;
      package = cfg.package;
      defaultEditor = true;
      languages = {
        language-server.nixd = {
          command = "nixd";
          config.nixd.formatting.command = [ "nixpkgs-fmt" ];
        };
        language = [{
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
        }];
      };
      settings = {
        theme = "molokai-niki";
        editor = {
          true-color = true;
          end-of-line-diagnostics = "hint";
          statusline = {
            center = [ "file-type" "file-encoding" "version-control" ];
            right = [ "diagnostics" "selections" "register" "position-percentage" "position" "file-encoding" ];
          };
          cursor-shape = {
            insert = "bar";
          };
          lsp = {
            display-messages = true;
            # display-inlay-hints = true;
          };
          inline-diagnostics = {
            cursor-line = "warning";
          };
        };
        keys.normal = {
          C-s = ":w";
          "0" = "goto_line_start";
          "$" = "goto_line_end_newline";
          esc = [ "collapse_selection" "keep_primary_selection" ];
          space.i = ":toggle lsp.display-inlay-hints";
          "-" = "move_next_sub_word_end";
          "_" = "move_prev_sub_word_start";
        };
        keys.select = {
          "0" = "goto_line_start";
          "$" = "goto_line_end_newline";
          space.i = ":toggle lsp.display-inlay-hints";
          "-" = "extend_next_sub_word_end";
          "_" = "extend_prev_sub_word_start";
        };
      };
      themes = {
        "molokai-niki" = {
          "inherits" = "molokai";
          "error" = { fg = "#f48771"; modifiers = [ "bold" ]; };
          "warning" = { fg = "#cca700"; modifiers = [ "bold" ]; };
          "info" = { fg = "#75beff"; modifiers = [ "bold" ]; };
          "hint" = { fg = "#eeeeb3"; modifiers = [ "bold" ]; };
        };
      };
    };
  };
}
