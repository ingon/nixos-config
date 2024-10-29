{ ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
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
      '';
    };
  };
}
