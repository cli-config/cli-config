syntax on

set number

" use spaeces instead of tabs
set tabstop=2 shiftwidth=2 expandtab

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ledesmablt/vim-run'
Plugin 'dense-analysis/ale'
call vundle#end()

" fzf.vim
nnoremap <silent> <C-l> :Files <CR>
nnoremap <silent> <C-p> :GFiles <CR>

" show spaces
set listchars=trail:·,lead:·
set list

" UNUSED PLUGINS -- for now
" Plugin 'scrooloose/nerdtree'
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-e> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

