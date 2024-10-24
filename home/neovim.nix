{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = vim-airline;
        config = ''
          set laststatus=2
          let g:airline_powerline_fonts=1
          let g:airline_detect_paste=1
          let g:airline#extensions#tabline#enabled=1
        '';
      }
      {
        plugin = vim-airline-themes;
        config = ''
          let g:airline_theme='molokai'
        '';
      }
      {
        plugin = nerdtree;
        config = ''
          nmap <silent> <leader>r :NERDTreeFind<CR>
        '';
      }
      {
        plugin = vim-nerdtree-tabs;
        config = ''
          nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
          let g:nerdtree_tabs_open_on_console_startup=1
          let g:nerdtree_tabs_smart_startup_focus=2
        '';
      }
      vim-surround
      ctrlp
      {
        plugin = molokai;
        config = ''
          set termguicolors
          set background=dark
          let g:rehash256=1
          colorscheme molokai
        '';
      }
      vim-easymotion
      {
        plugin = vim-gitgutter;
        config = ''
          let g:airline#extensions#hunks#non_zero_only=1
        '';
      }
      vim-commentary
    ];
    extraConfig = ''
      set number
      set ignorecase
      set smartcase
      set showmatch

      syntax on
      set mouse=a
      set clipboard+=unnamedplus
      hi clear SignColumn

      set tabstop=4
      set shiftwidth=4
      set expandtab
      set smartindent
      set scrolloff=3

      noremap j gj
      noremap k gk

      nnoremap <C-h> <C-w>h
      nnoremap <C-j> <C-w>j
      nnoremap <C-k> <C-w>k
      nnoremap <C-l> <C-w>l

      nmap <leader><space> :noh<CR>

      noremap <leader>q :bp<CR>
      noremap <leader>w :bn<CR>

      nmap <C-s> :w<CR>
      imap <C-s> <Esc>:ws<CR>a

      noremap <leader>a ggVG

      autocmd FileType nix setlocal tabstop=2 shiftwidth=2 expandtab
      autocmd FileType tf setlocal tabstop=2 shiftwidth=2 expandtab
      autocmd FileType proto setlocal tabstop=2 shiftwidth=2 expandtab

      autocmd FileType js setlocal tabstop=2 shiftwidth=2 expandtab
      autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
      autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 expandtab
      autocmd FileType typescriptreact setlocal tabstop=4 shiftwidth=4 expandtab
    '';
  };
}
