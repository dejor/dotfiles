"Buffer Navigation
nnoremap <RIGHT> :bnext<CR>
nnoremap <LEFT> :bprev<CR>

" Ecs 
inoremap jj <ESC>

" Toggle spelling check
nn <F7> :setlocal spell! spell?<CR>

" Capitalise ez
inoremap <C-u> <ESC>viwUi
nnoremap <C-u> viwU<ESC>

" Better block moving
vnoremap < <gv
vnoremap > >gv

" Paste mode
set pastetoggle=<F2>

" Keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


" Insert mode movement
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

