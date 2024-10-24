{ pkgs, ... }:
{
  programs.neovim.plugins = [{
    plugin = pkgs.vimPlugins.vim-go;
    config = ''
      let g:go_highlight_extra_types=1
      let g:go_highlight_fields=1
      let g:go_highlight_function_calls=1
      let g:go_highlight_functions=1
      let g:go_highlight_operators=1
      let g:go_highlight_types=1
      let g:go_highlight_variable_assignments = 0
      let g:go_highlight_variable_declarations = 0
      let g:go_fmt_options = {'goimports': '-local xxx'}

      nmap <silent> <leader>x :GoBuildTags ${"''"}<CR>
      nmap <silent> <leader>b :GoBuild<CR>
      nmap <silent> <leader>v :GoTest<CR>
      nmap <silent> <leader>n :cnext<CR>
      nmap <silent> <leader>m :cprevious<CR>
      nmap <silent> <leader>c :cclose<CR>
      nmap <silent> <leader>j :lnext<CR>
      nmap <silent> <leader>k :lprevious<CR>
      nmap <silent> <leader>l :lclose<CR>
    '';
  }];
}
