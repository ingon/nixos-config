{ pkgs, config, lib, ... }:
let
  cfg = config.ingon.home-modules.helix;
in
{
  options.ingon.home-modules.helix = {
    enable = lib.mkEnableOption "home-manager helix config" // {
      default = true;
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.helix;
      defaultText = lib.literalExpression "pkgs.helix";
      example = lib.literalExpression "pkgs.evil-helix";
      description = "The package to use for helix.";
    };

    enableGo = lib.mkEnableOption "add gopls to support go repos";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nil
      nixpkgs-fmt
    ] ++ lib.optionals cfg.enableGo [ go gopls ];

    programs.helix = {
      enable = true;
      package = cfg.package;
      defaultEditor = true;
      languages = {
        language-server.nil = {
          command = "nil";
          config.nil.formatting.command = [ "nixpkgs-fmt" ];
        };
        language = [{
          name = "nix";
          auto-format = true;
        }];
      };
      settings = {
        theme = "molokai";
        editor = {
          true-color = true;
          statusline = {
            center = [ "file-type" "file-encoding" "version-control" ];
            right = [ "diagnostics" "selections" "register" "position-percentage" "position" "file-encoding" ];
          };
          cursor-shape = {
            insert = "bar";
          };
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
        };
        keys.normal = {
          C-s = ":w";
          C-p = "file_picker";
          "0" = "goto_line_start";
          "$" = "goto_line_end_newline";
          esc = [ "collapse_selection" "keep_primary_selection" ];
          space.i = ":toggle lsp.display-inlay-hints";
        };
      };
    };
  };
}
