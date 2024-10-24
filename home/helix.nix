{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  programs.helix = {
    enable = true;
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
}
